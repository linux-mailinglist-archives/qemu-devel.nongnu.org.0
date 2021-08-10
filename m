Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383783E5603
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:53:38 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNVx-0005kM-AB
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cuser@bogon.localdomain>)
 id 1mDNR0-0003RV-9u
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:48:30 -0400
Received: from [125.38.22.94] (port=52035 helo=bogon.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cuser@bogon.localdomain>) id 1mDNQw-0000z2-DQ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:48:30 -0400
Received: by bogon.localdomain (Postfix, from userid 501)
 id 3991619ED166; Tue, 10 Aug 2021 16:37:33 +0800 (CST)
To: qemu-devel@nongnu.org
Cc: Zhang Chen <tgfbeta@me.com>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ui/cocoa: Implement dcl operators for guest cursor
Date: Tue, 10 Aug 2021 16:37:05 +0800
Message-Id: <20210810083706.64777-1-tgfbeta@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.38.22.94 (failed)
Received-SPF: none client-ip=125.38.22.94;
 envelope-from=cuser@bogon.localdomain; helo=bogon.localdomain
X-Spam_score_int: 35
X-Spam_score: 3.5
X-Spam_bar: +++
X-Spam_report: (3.5 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 NO_DNS_FOR_FROM=0.001, RCVD_IN_PBL=3.335, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, SPOOFED_FREEMAIL=0.726,
 SPOOFED_FREEMAIL_NO_RDNS=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to:  Zhang Chen <tgfbeta@me.com>
From:  Zhang Chen via <qemu-devel@nongnu.org>

In this patch, two dcl operators were implemented for Cocoa
display, to prepare, update and draw guest cursor on screen canvas.

After this implementation, Cocoa display could support virtio-vga
device, which is better supported in guest side, especially for Linux.

In contrast to the default vga device, virtio-vga with dcl operators
for cursors showed less flicker in cursor drawing.

Two fields were added in the struct QemuScreen to pass dimensions to
dcl operators.
---
 ui/cocoa.m | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 68a6302184..9d3a8eac28 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -73,6 +73,8 @@
 typedef struct {
     int width;
     int height;
+    int bitsPerComponent;
+    int bitsPerPixel;
 } QEMUScreen;
 
 static void cocoa_update(DisplayChangeListener *dcl,
@@ -83,12 +85,19 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
+static void cocoa_mouse_set(DisplayChangeListener *dcl,
+                            int x, int y, int visible);
+
+static void cocoa_cursor_define(DisplayChangeListener *dcl, QEMUCursor *c);
+
 static NSWindow *normalWindow, *about_window;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
     .dpy_gfx_switch = cocoa_switch,
     .dpy_refresh = cocoa_refresh,
+    .dpy_mouse_set = cocoa_mouse_set,
+    .dpy_cursor_define = cocoa_cursor_define,
 };
 static DisplayChangeListener dcl = {
     .ops = &dcl_ops,
@@ -309,6 +318,9 @@ static void handleAnyDeviceErrors(Error * err)
     BOOL isMouseGrabbed;
     BOOL isFullscreen;
     BOOL isAbsoluteEnabled;
+    CGRect cursorRect;
+    CGImageRef cursorImage;
+    BOOL cursorVisible;
 }
 - (void) switchSurface:(pixman_image_t *)image;
 - (void) grabMouse;
@@ -344,6 +356,8 @@ QemuCocoaView *cocoaView;
     self = [super initWithFrame:frameRect];
     if (self) {
 
+        screen.bitsPerComponent = 8;
+        screen.bitsPerPixel = 32;
         screen.width = frameRect.size.width;
         screen.height = frameRect.size.height;
         kbd = qkbd_state_init(dcl.con);
@@ -484,6 +498,12 @@ QemuCocoaView *cocoaView;
                                                         );
             CGContextDrawImage (viewContextRef, cgrect(rectList[i]), clipImageRef);
             CGImageRelease (clipImageRef);
+
+        }
+        CGRect cursorDrawRect = stretch_video ?
+                                    [self convertRectFromQemuScreen:cursorRect] : cursorRect;
+        if (cursorVisible && cursorImage && NSIntersectsRect(rect, cursorDrawRect)) {
+            CGContextDrawImage (viewContextRef, cursorDrawRect, cursorImage);
         }
         CGImageRelease (imageRef);
         CGDataProviderRelease(dataProviderRef);
@@ -1075,6 +1095,28 @@ QemuCocoaView *cocoaView;
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
 
+- (CGRect) cursorRect {return cursorRect;}
+- (void) setCursorRect:(CGRect)rect {cursorRect = rect;}
+- (CGImageRef) cursorImage {return cursorImage;}
+- (void) setCursorImage:(CGImageRef)image
+{
+    if (cursorImage && cursorImage != image) {
+        CGImageRelease(cursorImage);
+    }
+    cursorImage = image;
+}
+- (BOOL) isCursorVisible {return cursorVisible;}
+- (void) setCursorVisible:(BOOL)visible {cursorVisible = visible;}
+
+- (CGRect) convertRectFromQemuScreen:(CGRect)rect
+{
+    CGRect viewRect = rect;
+    viewRect.origin.x *= cdx;
+    viewRect.origin.y *= cdy;
+    viewRect.size.width *= cdx;
+    viewRect.size.height *= cdy;
+    return viewRect;
+}
 /*
  * Makes the target think all down keys are being released.
  * This prevents a stuck key problem, since we will not see
@@ -2022,6 +2064,63 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
     [pool release];
 }
 
+static void cocoa_cursor_define(DisplayChangeListener *dcl, QEMUCursor *c)
+{
+    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
+    int bitsPerComponent = [cocoaView gscreen].bitsPerComponent;
+    int bitsPerPixel = [cocoaView gscreen].bitsPerPixel;
+    int stride = c->width * bitsPerComponent / 2;
+    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, c->data, c->width * 4 * c->height, NULL);
+
+    CGImageRef img = CGImageCreate(
+        c->width,
+        c->height,
+        bitsPerComponent,
+        bitsPerPixel,
+        stride,
+        CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace
+        kCGBitmapByteOrder32Little | kCGImageAlphaFirst,
+        provider,
+        NULL,
+        0,
+        kCGRenderingIntentDefault
+    );
+
+    CGDataProviderRelease(provider);
+    CGFloat width = c->width;
+    CGFloat height = c->height;
+    dispatch_async(dispatch_get_main_queue(), ^{
+        [cocoaView setCursorImage:img];
+        CGRect rect = [cocoaView cursorRect];
+        rect.size = CGSizeMake(width, height);
+        [cocoaView setCursorRect:rect];
+    });
+    [pool release];
+}
+
+static void cocoa_mouse_set(DisplayChangeListener *dcl,
+                            int x, int y, int visible)
+{
+    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
+    dispatch_async(dispatch_get_main_queue(), ^{
+        QEMUScreen screen = [cocoaView gscreen];
+        // Mark old cursor rect as dirty
+        CGRect rect = [cocoaView cursorRect];
+        CGRect dirtyRect = stretch_video ?
+                        [cocoaView convertRectFromQemuScreen:rect] : rect;
+        [cocoaView setNeedsDisplayInRect:dirtyRect];
+        // Update rect for cursor sprite
+        rect.origin = CGPointMake(x, screen.height - (y + rect.size.height));
+        [cocoaView setCursorRect:rect];
+        [cocoaView setCursorVisible:visible ? YES : NO];
+        // Mark new cursor rect as dirty
+        dirtyRect = stretch_video ?
+                        [cocoaView convertRectFromQemuScreen:rect] : rect;
+        [cocoaView setNeedsDisplayInRect:dirtyRect];
+    });
+    [pool release];
+}
+
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
-- 
2.30.2


