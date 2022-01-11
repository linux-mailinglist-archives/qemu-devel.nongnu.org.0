Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615248A877
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:34:44 +0100 (CET)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Bg2-00061q-Ka
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:34:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1n7BHw-0005yU-DS
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:09:48 -0500
Received: from pv50p00im-zteg10011501.me.com ([17.58.6.42]:38326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1n7BHu-0007gs-6N
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1641884983; bh=jCNPR1l/MxanGFO2QG4QNXrUMQj5CqYskbP58O65gss=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=rLVmek/iwKRnyp14qbI9MBn0fcKYxinNiABAMKVnkJi21a61074oNRPv9Uf+ceJ/R
 hDVHnQy0FvYbGtUYvj93ZNVlhHHPA4W/unUuFXJKWVPx1ZkexXdhQs38OtkPYd4R7t
 vsA+xrlndkBOl2/XMrSmNxazwkj2fymsgGbHxBtfGdVYZSFodI0Vz9psaCLEAXBxSw
 0ItZ74O8qeTssy3yYa3KeLWxdGfxqWl2uSPCZfzPkrv/4Q5OSJVznCOrUvMQFsfHbC
 h0CxInRDwin7Fo8Mt2GlUuxyozuy3o+m8eX0fpn7uPqGjnRK2Poye4dnc7MksllAHW
 S15Eg4WWbUhtA==
Received: from localhost.localdomain (unknown [111.163.122.181])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 259402E0601;
 Tue, 11 Jan 2022 07:09:39 +0000 (UTC)
From: Zhang Chen <tgfbeta@me.com>
To: tgfbeta@me.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] ui/cocoa: capture screencast with AVAssetWriter
Date: Tue, 11 Jan 2022 15:02:59 +0800
Message-Id: <20220111070258.2983-1-tgfbeta@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2022-01-11_02:2022-01-10,
 2022-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=323 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2201110038
Received-SPF: pass client-ip=17.58.6.42; envelope-from=tgfbeta@me.com;
 helo=pv50p00im-zteg10011501.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To record screencast, AVAssetWriter APIs were called for each
cocoa_update call.

Commands for start/stop recording were added to View menu.

AVFoundation, CoreMedia and CoreVideo were added as linking
dependencies.

Signed-off-by: Zhang Chen <tgfbeta@me.com>
---
 meson.build    |   6 +++
 ui/cocoa.m     | 132 +++++++++++++++++++++++++++++++++++++++++++++++--
 ui/meson.build |   1 +
 3 files changed, 136 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 886f0a9343..70c38c4135 100644
--- a/meson.build
+++ b/meson.build
@@ -281,6 +281,9 @@ emulator_link_args = []
 nvmm =not_found
 hvf = not_found
 host_dsosuf = '.so'
+avfoundation = []
+coremedia = []
+corevideo = []
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
@@ -292,6 +295,9 @@ if targetos == 'windows'
   host_dsosuf = '.dll'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
+  avfoundation = dependency('appleframeworks', modules: 'AVFoundation')
+  coremedia = dependency('appleframeworks', modules: 'CoreMedia')
+  corevideo = dependency('appleframeworks', modules: 'CoreVideo')
   iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
   host_dsosuf = '.dylib'
 elif targetos == 'sunos'
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 69745c483b..6a0fc24414 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 
 #import <Cocoa/Cocoa.h>
+#import <AVFoundation/AVFoundation.h>
 #include <crt_externs.h>
 
 #include "qemu-common.h"
@@ -309,6 +310,12 @@ static void handleAnyDeviceErrors(Error * err)
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
+    AVAssetWriter *capture;
+    AVAssetWriterInput *captureInput;
+    AVAssetWriterInputPixelBufferAdaptor *captureInputAdaptor;
+    BOOL isCapturing;
+    NSDate *captureStart;
+    CVPixelBufferRef captureBuffer;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
@@ -332,6 +339,9 @@ static void handleAnyDeviceErrors(Error * err)
 - (float) cdy;
 - (QEMUScreen) gscreen;
 - (void) raiseAllKeys;
+- (void) startCapture;
+- (void) stopCapture;
+- (BOOL) isCapturing;
 @end
 
 QemuCocoaView *cocoaView;
@@ -364,6 +374,10 @@ QemuCocoaView *cocoaView;
     [super dealloc];
 }
 
+- (BOOL) isCapturing {
+    return isCapturing;
+}
+
 - (BOOL) isOpaque
 {
     return YES;
@@ -425,6 +439,81 @@ QemuCocoaView *cocoaView;
     [NSCursor unhide];
 }
 
+- (IBAction) startCapture
+{
+    NSError *err;
+    
+    NSString *outputPath = [NSString stringWithFormat:@"/tmp/capture_%.1f.mp4", [[NSDate now] timeIntervalSinceReferenceDate]];
+    NSURL *fileURL = [NSURL fileURLWithPath:outputPath];
+    capture = [[AVAssetWriter alloc] initWithURL:fileURL fileType:AVFileTypeMPEG4 error:&err];
+    
+    captureInput = [[AVAssetWriterInput alloc] initWithMediaType:AVMediaTypeVideo
+                                                   outputSettings:@{
+        AVVideoCodecKey: AVVideoCodecTypeH264,
+        AVVideoWidthKey: [NSNumber numberWithInt:screen.width],
+        AVVideoHeightKey: [NSNumber numberWithInt:screen.height],
+    }];
+    NSParameterAssert([capture canAddInput:captureInput]);
+    [capture addInput:captureInput];
+    captureInputAdaptor = [[AVAssetWriterInputPixelBufferAdaptor alloc] initWithAssetWriterInput:captureInput sourcePixelBufferAttributes:nil];
+    
+    OSStatus bufferStatus = CVPixelBufferCreateWithBytes(NULL,
+                                                         screen.width,
+                                                         screen.height,
+                                                         kCVPixelFormatType_32BGRA,
+                                                         pixman_image_get_data(pixman_image),
+                                                         pixman_image_get_stride(pixman_image),
+                                                         NULL,
+                                                         NULL,
+                                                         NULL,
+                                                         &captureBuffer);
+    if (bufferStatus != kCVReturnSuccess) {
+        NSLog(@"err creating pixel buf: %d", bufferStatus);
+        return;
+    }
+    captureStart = [NSDate new];
+    [capture startWriting];
+    [capture startSessionAtSourceTime:kCMTimeZero];
+    isCapturing = TRUE;
+    [self captureFrame];
+}
+
+- (void) stopCapture
+{
+    if (isCapturing) {
+        isCapturing = FALSE;
+        NSDate *now = [NSDate now];
+        NSTimeInterval interval = [now timeIntervalSinceDate:captureStart];
+        CMTime ts = CMTimeMakeWithSeconds(interval, 1000000);
+        [captureInput markAsFinished];
+        [capture endSessionAtSourceTime:ts];
+        pixman_image_ref(pixman_image);
+        [capture finishWritingWithCompletionHandler:^() {
+            NSLog(@"finishWriting");
+            [captureInputAdaptor release];
+            [captureInput release];
+            CFRelease(captureBuffer);
+            pixman_image_unref(pixman_image);
+        }];
+        [captureStart release];
+    }
+}
+
+- (void) captureFrame
+{
+    if (isCapturing && captureBuffer && [captureInput isReadyForMoreMediaData]) {
+        NSDate *now = [NSDate now];
+        NSTimeInterval interval = [now timeIntervalSinceDate:captureStart];
+        CMTime ts = CMTimeMakeWithSeconds(interval, 1000000);
+        CFRetain(captureBuffer);
+        pixman_image_ref(pixman_image);
+        [captureInputAdaptor appendPixelBuffer:captureBuffer
+                           withPresentationTime:ts];
+        CFRelease(captureBuffer);
+        pixman_image_unref(pixman_image);
+    }
+}
+
 - (void) drawRect:(NSRect) rect
 {
     COCOA_DEBUG("QemuCocoaView: drawRect\n");
@@ -573,6 +662,7 @@ QemuCocoaView *cocoaView;
     bool isResize = (w != screen.width || h != screen.height || cdx == 0.0);
 
     int oldh = screen.height;
+    BOOL needsRestartCapture = isResize && isCapturing;
     if (isResize) {
         // Resize before we trigger the redraw, or we'll redraw at the wrong size
         COCOA_DEBUG("switchSurface: new size %d x %d\n", w, h);
@@ -580,6 +670,7 @@ QemuCocoaView *cocoaView;
         screen.height = h;
         [self setContentDimensions];
         [self setFrame:NSMakeRect(cx, cy, cw, ch)];
+        [self stopCapture];
     }
 
     // update screenBuffer
@@ -588,7 +679,9 @@ QemuCocoaView *cocoaView;
     }
 
     pixman_image = image;
-
+    if (needsRestartCapture) {
+        [self startCapture];
+    }
     // update windows
     if (isFullscreen) {
         [[fullScreenWindow contentView] setFrame:[[NSScreen mainScreen] frame]];
@@ -1117,6 +1210,8 @@ QemuCocoaView *cocoaView;
 - (IBAction) do_about_menu_item: (id) sender;
 - (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
+- (IBAction) startCapture:(id)sender;
+- (IBAction) stopCapture:(id)sender;
 @end
 
 @implementation QemuCocoaAppController
@@ -1175,8 +1270,10 @@ QemuCocoaView *cocoaView;
 {
     COCOA_DEBUG("QemuCocoaAppController: dealloc\n");
 
-    if (cocoaView)
+    if (cocoaView) {
+        [cocoaView stopCapture];
         [cocoaView release];
+    }
     [super dealloc];
 }
 
@@ -1569,6 +1666,23 @@ QemuCocoaView *cocoaView;
     COCOA_DEBUG("cpu throttling at %d%c\n", cpu_throttle_get_percentage(), '%');
 }
 
+- (IBAction) startCapture:(id)sender
+{
+    [sender setEnabled:NO];
+    [cocoaView startCapture];
+    if ([cocoaView isCapturing]) {
+        [[[sender menu] itemWithTitle:@"Stop Capture"] setEnabled: YES];
+    }
+}
+
+- (IBAction) stopCapture:(id)sender
+{
+    [sender setEnabled: NO];
+    [cocoaView stopCapture];
+    if (![cocoaView isCapturing]) {
+        [[[sender menu] itemWithTitle:@"Capture"] setEnabled: YES];
+    }
+}
 @end
 
 @interface QemuApplication : NSApplication
@@ -1623,8 +1737,18 @@ static void create_initial_menus(void)
 
     // View menu
     menu = [[NSMenu alloc] initWithTitle:@"View"];
+    [menu setAutoenablesItems: NO];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Enter Fullscreen" action:@selector(doToggleFullScreen:) keyEquivalent:@"f"] autorelease]]; // Fullscreen
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Zoom To Fit" action:@selector(zoomToFit:) keyEquivalent:@""] autorelease]];
+    [menu addItem:[NSMenuItem separatorItem]];
+    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Capture" action:@selector(startCapture:) keyEquivalent:@""] autorelease];
+    [menu addItem: menuItem];
+    [menuItem setTag:1200];
+    [menuItem setEnabled: YES];
+    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Stop Capture" action:@selector(stopCapture:) keyEquivalent:@""] autorelease];
+    [menu addItem: menuItem];
+    [menuItem setTag:1201];
+    [menuItem setEnabled: NO];
     menuItem = [[[NSMenuItem alloc] initWithTitle:@"View" action:nil keyEquivalent:@""] autorelease];
     [menuItem setSubmenu:menu];
     [[NSApp mainMenu] addItem:menuItem];
@@ -1962,7 +2086,9 @@ static void cocoa_update(DisplayChangeListener *dcl,
     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
 
     COCOA_DEBUG("qemu_cocoa: cocoa_update\n");
-
+    if ([cocoaView isCapturing]) {
+        [cocoaView captureFrame];
+    }
     dispatch_async(dispatch_get_main_queue(), ^{
         NSRect rect;
         if ([cocoaView cdx] == 1.0) {
diff --git a/ui/meson.build b/ui/meson.build
index 64286ba150..cef7e90319 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -25,6 +25,7 @@ softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files(
   'udmabuf.c',
 ))
 softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
+softmmu_ss.add(when: avfoundation, if_true: [avfoundation, coremedia, corevideo])
 
 vnc_ss = ss.source_set()
 vnc_ss.add(files(
-- 
2.30.2


