Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E332A320121
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:03:26 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDrx-0005k2-Vv
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpR-0003Ms-5b
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpO-0005cx-K9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbBF4z1OU7/9kQcgZz3PdrDuycOQV8ktg8vHjTykT0U=;
 b=YV4oMeZzN9iuX8+fldD67e0SCbybB44a1GRnXQc4+piClP8MvIj1NpHhSGYY1ALxKgTuz0
 qfzv6AUGKH8PQxzcNLPYZmwgL7aPV7BEhO3QyvAQTlP9ahZLuwUVLxW65ff+dRW7jNIFwD
 F5KKTZwygScIoJDuNw8PVRo1kluirhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-P-Sb_RtqP7e1dwTUYMws-g-1; Fri, 19 Feb 2021 17:00:42 -0500
X-MC-Unique: P-Sb_RtqP7e1dwTUYMws-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB62C107ACE4;
 Fri, 19 Feb 2021 22:00:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2B86F989;
 Fri, 19 Feb 2021 22:00:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C8151800863; Fri, 19 Feb 2021 23:00:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] ui/cocoa: Do not copy members of pixman image
Date: Fri, 19 Feb 2021 23:00:32 +0100
Message-Id: <20210219220036.100654-5-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The old CocoaView had an idea of synchronizing the host window
configuration and the guest screen configuration. Here, the guest screen
actually means pixman image given ui/cocoa display implementation.

However, [CocoaView -drawRect:] directly interacts with the pixman
image buffer in reality. There is no such distinction of "host" and
"guest." This change removes the "host" configuration and let drawRect
consistently have the direct reference to pixman image. It allows to
get rid of the error-prone "sync" and reduce code size a bit.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210212000629.28551-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 78fcfeaf04b7..eab4bfe7c8ae 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -70,8 +70,6 @@
 typedef struct {
     int width;
     int height;
-    int bitsPerComponent;
-    int bitsPerPixel;
 } QEMUScreen;
 
 NSWindow *normalWindow, *about_window;
@@ -291,7 +289,6 @@ static void handleAnyDeviceErrors(Error * err)
     QEMUScreen screen;
     NSWindow *fullScreenWindow;
     float cx,cy,cw,ch,cdx,cdy;
-    CGDataProviderRef dataProviderRef;
     pixman_image_t *pixman_image;
     BOOL modifiers_state[256];
     BOOL isMouseGrabbed;
@@ -338,8 +335,6 @@ QemuCocoaView *cocoaView;
     self = [super initWithFrame:frameRect];
     if (self) {
 
-        screen.bitsPerComponent = 8;
-        screen.bitsPerPixel = 32;
         screen.width = frameRect.size.width;
         screen.height = frameRect.size.height;
 
@@ -351,8 +346,7 @@ QemuCocoaView *cocoaView;
 {
     COCOA_DEBUG("QemuCocoaView: dealloc\n");
 
-    if (dataProviderRef) {
-        CGDataProviderRelease(dataProviderRef);
+    if (pixman_image) {
         pixman_image_unref(pixman_image);
     }
 
@@ -431,18 +425,28 @@ QemuCocoaView *cocoaView;
     CGContextSetShouldAntialias (viewContextRef, NO);
 
     // draw screen bitmap directly to Core Graphics context
-    if (!dataProviderRef) {
+    if (!pixman_image) {
         // Draw request before any guest device has set up a framebuffer:
         // just draw an opaque black rectangle
         CGContextSetRGBFillColor(viewContextRef, 0, 0, 0, 1.0);
         CGContextFillRect(viewContextRef, NSRectToCGRect(rect));
     } else {
+        int w = pixman_image_get_width(pixman_image);
+        int h = pixman_image_get_height(pixman_image);
+        int bitsPerPixel = PIXMAN_FORMAT_BPP(pixman_image_get_format(pixman_image));
+        int bitsPerComponent = DIV_ROUND_UP(bitsPerPixel, 8) * 2;
+        CGDataProviderRef dataProviderRef = CGDataProviderCreateWithData(
+            NULL,
+            pixman_image_get_data(pixman_image),
+            w * 4 * h,
+            NULL
+        );
         CGImageRef imageRef = CGImageCreate(
-            screen.width, //width
-            screen.height, //height
-            screen.bitsPerComponent, //bitsPerComponent
-            screen.bitsPerPixel, //bitsPerPixel
-            (screen.width * (screen.bitsPerComponent/2)), //bytesPerRow
+            w, //width
+            h, //height
+            bitsPerComponent, //bitsPerComponent
+            bitsPerPixel, //bitsPerPixel
+            (w * (bitsPerComponent/2)), //bytesPerRow
 #ifdef __LITTLE_ENDIAN__
             CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB), //colorspace for OS X >= 10.4
             kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst,
@@ -465,7 +469,7 @@ QemuCocoaView *cocoaView;
         [self getRectsBeingDrawn:&rectList count:&rectCount];
         for (i = 0; i < rectCount; i++) {
             clipRect.origin.x = rectList[i].origin.x / cdx;
-            clipRect.origin.y = (float)screen.height - (rectList[i].origin.y + rectList[i].size.height) / cdy;
+            clipRect.origin.y = (float)h - (rectList[i].origin.y + rectList[i].size.height) / cdy;
             clipRect.size.width = rectList[i].size.width / cdx;
             clipRect.size.height = rectList[i].size.height / cdy;
             clipImageRef = CGImageCreateWithImageInRect(
@@ -476,6 +480,7 @@ QemuCocoaView *cocoaView;
             CGImageRelease (clipImageRef);
         }
         CGImageRelease (imageRef);
+        CGDataProviderRelease(dataProviderRef);
     }
 }
 
@@ -518,7 +523,6 @@ QemuCocoaView *cocoaView;
 
     int w = pixman_image_get_width(image);
     int h = pixman_image_get_height(image);
-    pixman_format_code_t image_format = pixman_image_get_format(image);
     /* cdx == 0 means this is our very first surface, in which case we need
      * to recalculate the content dimensions even if it happens to be the size
      * of the initial empty window.
@@ -536,17 +540,11 @@ QemuCocoaView *cocoaView;
     }
 
     // update screenBuffer
-    if (dataProviderRef) {
-        CGDataProviderRelease(dataProviderRef);
+    if (pixman_image) {
         pixman_image_unref(pixman_image);
     }
 
-    //sync host window color space with guests
-    screen.bitsPerPixel = PIXMAN_FORMAT_BPP(image_format);
-    screen.bitsPerComponent = DIV_ROUND_UP(screen.bitsPerPixel, 8) * 2;
-
     pixman_image = image;
-    dataProviderRef = CGDataProviderCreateWithData(NULL, pixman_image_get_data(image), w * 4 * h, NULL);
 
     // update windows
     if (isFullscreen) {
-- 
2.29.2


