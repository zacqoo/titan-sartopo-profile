% This script is to load Cassini SARTopo datasets, process elevation data
% and plot the elevation profile
% Made by Zac Yung-Chun Liu; zacycliu@asu.edu; last modified: June 2015
%--------------------------------------------------------------------------
%                           Load Data Sets
%--------------------------------------------------------------------------
clear;
%Display a dialogue box with which the user may select which file to import
% and then import the data; SARTopo datasets need to be processed before
% importing here. Input format: column 1: X, column: Y
[sFileName,sPathName,~] = uigetfile('*.txt');
sFullPath=fullfile(sPathName,sFileName);

%Load the data set
mData=load(sFullPath);

vSize = size(mData);
mNewData=[];

mNewData = [mData(1,1) mData(1,2)];
%--------------------------------------------------------------------------
%                           Separate Data
%--------------------------------------------------------------------------
%For loop
for i=2:vSize(1)
    if mData(i,1) > mData(1,1) & mData(i,1) > mNewData(end,1)
        mNewData = [mNewData;mData(i,1),mData(i,2)];
    else
        mNewData = mNewData;        
    end
end
%--------------------------------------------------------------------------
%                                PLOT
%--------------------------------------------------------------------------
plot(mNewData(:,1),mNewData(:,2),'k.')
grid on
%xlabel('Longitude(degree)','FontSize',26)
xlabel('Longitude(degree)','FontSize',20)
ylabel('Elevation(m)','FontSize',20)
%title('Temperature Trend Since 1970','FontSize',18,'FontWeight','bold')
%set(gca,'XDir','reverse')
axis([-100 330 -700 -300])
