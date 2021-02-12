Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D67E319828
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 03:02:03 +0100 (CET)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lANmU-0007RH-Jg
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 21:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALyr-00071L-GG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:06:41 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALyo-00019F-Rn
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:06:40 -0500
Received: by mail-pl1-x629.google.com with SMTP id s15so4215402plr.9
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=POk5/XTODc7hhSKGDbipV/Yf8MOsDh/5eNRyR2yC72o=;
 b=QgLFZwSufOnAmbvloWIDKGTrq0t6zQ5QGK/3HUFOzJEe5TRj2zJcdks2c7SKODLvy6
 FWrX6EJcguQjjHNK5QzYycy+1F3orF/6wIuWoz5M0tqTaVNj+F/gR8pCRDxvgTPSnPFB
 AHatV3nL6VGsyx7E5VewKNSjJA9fZQQVBr1RmM7WPaRMhlqLxfHPsyCQq89eK5yXHvd4
 H40QCxe69lLTz/3K0Cim5+eUXxtV7jS6zYoEYnn85xoBB/hljXDtTTVwbZVkv2++XRiS
 ajnMMGJ1ZAlDy7lb+5oa4+l2/AgBWWyz73zSJUFxtDctqEDBhp5F6WLwZOFEjHG+vZU0
 xSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=POk5/XTODc7hhSKGDbipV/Yf8MOsDh/5eNRyR2yC72o=;
 b=HpEg5KsGX/GiPcSBlJRKFHXvSWXC9JUMpFedQvQZ5hId2Fw9vtCJXLhoRixeCc4RFb
 y+4k2+hgVJY9aK8OuBNJXdkujpKx7X7sx/a/r5gnAoUqYQHRhPaZ3np0K+VCilSVy6oS
 LqKRkN1Rd7YviyOW/VQyv7NM//NKDrljjLGQzeP2w91Jfn36NckCxz7tPyl9hu143C6v
 f/bstJ8WlhgB8Ab+qErgEX+VyjjhxWdhUiAddQwg9q2AOVT7BiqBXtmaVf+gdVXNsnQd
 mZYZw7uYKAlkCDNX7mBssVdNcO6xy5H1Qi329E9ySSuD9sYfsjFbWEFvpgmMac/uFRjf
 rVew==
X-Gm-Message-State: AOAM533iK8zi6gOmVsSoOQEKcp7Hi8krF5ptAF+e1I63V77EO1NjDycW
 xwkw48zZIpJUdMrr+pJ0ZbA=
X-Google-Smtp-Source: ABdhPJwCjoyJGHuk9xyOU26cqFe1alZIuStCWttUf2iZAEtvo3SNV31zdzRU8xACBxEugqn78U2zTQ==
X-Received: by 2002:a17:902:694c:b029:e2:daa3:ca4a with SMTP id
 k12-20020a170902694cb02900e2daa3ca4amr351835plt.80.1613088397420; 
 Thu, 11 Feb 2021 16:06:37 -0800 (PST)
Received: from localhost.localdomain ([210.227.19.68])
 by smtp.gmail.com with ESMTPSA id p9sm5926224pja.51.2021.02.11.16.06.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:06:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Do not copy members of pixman image
Date: Fri, 12 Feb 2021 09:06:29 +0900
Message-Id: <20210212000629.28551-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Feb 2021 20:57:23 -0500
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old CocoaView had an idea of synchronizing the host window
configuration and the guest screen configuration. Here, the guest screen
actually means pixman image given ui/cocoa display implementation.

However, [CocoaView -drawRect:] directly interacts with the pixman
image buffer in reality. There is no such distinction of "host" and
"guest." This change removes the "host" configuration and let drawRect
consistently have the direct reference to pixman image. It allows to
get rid of the error-prone "sync" and reduce code size a bit.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..8eff3a99e93 100644
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
@@ -284,7 +282,6 @@ @interface QemuCocoaView : NSView
     QEMUScreen screen;
     NSWindow *fullScreenWindow;
     float cx,cy,cw,ch,cdx,cdy;
-    CGDataProviderRef dataProviderRef;
     pixman_image_t *pixman_image;
     BOOL modifiers_state[256];
     BOOL isMouseGrabbed;
@@ -331,8 +328,6 @@ - (id)initWithFrame:(NSRect)frameRect
     self = [super initWithFrame:frameRect];
     if (self) {
 
-        screen.bitsPerComponent = 8;
-        screen.bitsPerPixel = 32;
         screen.width = frameRect.size.width;
         screen.height = frameRect.size.height;
 
@@ -344,8 +339,7 @@ - (void) dealloc
 {
     COCOA_DEBUG("QemuCocoaView: dealloc\n");
 
-    if (dataProviderRef) {
-        CGDataProviderRelease(dataProviderRef);
+    if (pixman_image) {
         pixman_image_unref(pixman_image);
     }
 
@@ -424,18 +418,28 @@ - (void) drawRect:(NSRect) rect
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
@@ -458,7 +462,7 @@ - (void) drawRect:(NSRect) rect
         [self getRectsBeingDrawn:&rectList count:&rectCount];
         for (i = 0; i < rectCount; i++) {
             clipRect.origin.x = rectList[i].origin.x / cdx;
-            clipRect.origin.y = (float)screen.height - (rectList[i].origin.y + rectList[i].size.height) / cdy;
+            clipRect.origin.y = (float)h - (rectList[i].origin.y + rectList[i].size.height) / cdy;
             clipRect.size.width = rectList[i].size.width / cdx;
             clipRect.size.height = rectList[i].size.height / cdy;
             clipImageRef = CGImageCreateWithImageInRect(
@@ -469,6 +473,7 @@ - (void) drawRect:(NSRect) rect
             CGImageRelease (clipImageRef);
         }
         CGImageRelease (imageRef);
+        CGDataProviderRelease(dataProviderRef);
     }
 }
 
@@ -511,7 +516,6 @@ - (void) switchSurface:(pixman_image_t *)image
 
     int w = pixman_image_get_width(image);
     int h = pixman_image_get_height(image);
-    pixman_format_code_t image_format = pixman_image_get_format(image);
     /* cdx == 0 means this is our very first surface, in which case we need
      * to recalculate the content dimensions even if it happens to be the size
      * of the initial empty window.
@@ -529,17 +533,11 @@ - (void) switchSurface:(pixman_image_t *)image
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
2.24.3 (Apple Git-128)


