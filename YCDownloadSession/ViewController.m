//
//  ViewController.m
//  YCDownloadSession
//
//  Created by wangzhen on 17/3/14.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import "ViewController.h"
#import "YCDownloadSession.h"

@interface ViewController ()<YCDownloadSessionDelegate>

@property (nonatomic, strong) YCDownloadSession *session;
@property (nonatomic, copy) NSString *downloadURL;
@property (nonatomic, weak) UILabel *progressLbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 36)];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *resumeBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 100, 36)];
    [resumeBtn setTitle:@"resume" forState:UIControlStateNormal];
    [resumeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resumeBtn addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resumeBtn];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 36)];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    UIButton *pauseBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 36)];
    [pauseBtn setTitle:@"pause" forState:UIControlStateNormal];
    [pauseBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pauseBtn addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseBtn];
    
    self.session = [YCDownloadSession downloadSession];
    [YCDownloadSession downloadSession].saveFileDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    [YCDownloadSession downloadSession].delegate = self;
    //http://down.xt70.com/soft/170220/23874.exe
    self.downloadURL = @"http://vod.lexue.com/video/c3067fc7160916.mp4";
    
    
    UILabel *lbl = [[UILabel alloc] init];
    lbl.text = @"0%";
    lbl.frame = CGRectMake(100, 300, 100, 30);
    lbl.textAlignment = NSTextAlignmentCenter;
    self.progressLbl = lbl;
    [self.view addSubview:lbl];
    
}

- (void)request:(YCDownloadSession *)request totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    self.progressLbl.text = [NSString stringWithFormat:@"%f",(float)totalBytesWritten / totalBytesExpectedToWrite * 100];
}

- (void)start {
      [self.session startDownloadWithUrl:self.downloadURL];
}
- (void)resume {
    [self.session resumeDownloadWithUrl:self.downloadURL];
}

- (void)pause {
    [self.session pauseDownloadWithUrl:self.downloadURL];
}

- (void)stop {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end