class HabitsController < ApplicationController
  before_action :set_habit, only: [:plus, :minus]

  def show
    @habit = params[:id] ? Habit.find_by(id: params[:id]) : Habit.first
  end

  def plus
    @habit.update(count: @habit.count.to_i + 1)
    redirect_to @habit
  end

  def minus
    @habit.update(count: [@habit.count.to_i - 1, 0].max)
    redirect_to @habit
  end

  private
    def set_habit
      @habit = Habit.find_by(id: params[:id])
    end
end