Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D13E5697
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 11:18:23 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNtt-0000ig-PW
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 05:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1mDNt8-0008Tb-Og
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:17:34 -0400
Received: from pv50p00im-ztbu10011701.me.com ([17.58.6.53]:47677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgfbeta@me.com>) id 1mDNt6-0005Th-Vy
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 05:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1628587049; bh=Bi9rOH9P8chejeLCuLEZyIzFFbF7kQJlghGm8+mr+uY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=A1k9oKaBHLPVtZ2efYDCdNsXRHqehY3OoGQDAdFHkNrEWIom828uK9ypU+7J6PhNC
 27DtZsilpFa13O96ARWJM0rbFJXRy4upyqRVidxSO83iRldI0gWJZHw48ObMw6dbtK
 SL0oWFuEA8aKnAlVT2mKd2s7EFM2cjUx76MXuGiaG9kL+uQObWbKnkm8buqPDOdg+u
 56uTygIwTl6RrSI8AMdgeHs8xobaipix8ssESIRzTFCauFOSpegESFiiaJgrfFkVc2
 qO19inJ+iVYlQkgIl3ZGqz6ztxD+DVs/4ZjKiTFekgw1ZAH0h6CJiHjsuGoUDaCbAr
 ba6P4hkl8jJIg==
Received: from localhost.localdomain (unknown [125.38.22.94])
 by pv50p00im-ztbu10011701.me.com (Postfix) with ESMTPSA id 0CB6D8A012C;
 Tue, 10 Aug 2021 09:17:26 +0000 (UTC)
From: Zhang Chen <tgfbeta@me.com>
To: qemu-devel@nongnu.org
Cc: Zhang Chen <tgfbeta@me.com>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ui/cocoa: Implement dcl operators for guest cursor
Date: Tue, 10 Aug 2021 17:17:06 +0800
Message-Id: <20210810091706.65576-1-tgfbeta@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_03:2021-08-06,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=760 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2108100058
Received-SPF: pass client-ip=17.58.6.53; envelope-from=tgfbeta@me.com;
 helo=pv50p00im-ztbu10011701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In this patch, two dcl operators were implemented for Cocoa
 display, to prepare, update and draw guest cursor on screen canvas.

After this implementation, Cocoa display could support virtio-vga
device, which is better supported in guest side, especially for Linux.

In contrast to the default vga device, virtio-vga with dcl operators
for cursors showed less flicker in cursor drawing.

Two fields were added in the struct QemuScreen to pass dimensions to
dcl operators.

Signed-off-by: Zhang Chen <tgfbeta@me.com>
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


