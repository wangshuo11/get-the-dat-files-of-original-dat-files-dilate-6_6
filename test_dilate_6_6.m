close all;
clear all;
clc;
for i=0:4380
    inputpath='G:\\anal\\anal_';
    str_i=int2str(i);
    inputpath=strcat(inputpath,str_i);
    inputpath=strcat(inputpath,'.dat');
   
    outputpath='F:\\anal_0_4380_dilate6_6\\';
    outputpath=strcat(outputpath,str_i);
    outputpath=strcat(outputpath,'.dat');
    
   
    fid=fopen(inputpath,'rb');
    I0=fread(fid,7808,'float32');
    fclose(fid);
    I1=reshape(I0,128,61);
    A=strel('disk',6,6);
    I2=imdilate(I1,A);
%     subplot(5,6,i);
%     imshow(I2');
   
    fid2=fopen(outputpath,'wb');
    I3=reshape(I2,7808,1);
    fwrite(fid2,I3,'float32');
    fclose(fid2);
end
% figure(2);
% for j=1:30
%     str_i=int2str(j);
%     outputpath='F:\\anal_0_4380_dilate6_6\\';
%     outputpath=strcat(outputpath,str_i);
%     outputpath=strcat(outputpath,'.dat');
%     fid3=fopen(outputpath,'rb');
%     I4=fread(fid3,7808,'float32');
%     I5=reshape(I4,128,61);
%     subplot(5,6,j);
%     imshow(I5');
%     fclose(fid3);
% end
