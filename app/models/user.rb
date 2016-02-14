class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	belongs_to :role
  belongs_to :route_halt
  belongs_to :vehicle

	before_create :set_default_role

  private

  def set_default_role
    self.role ||= Role.find_by_name('traveller')
  end
end