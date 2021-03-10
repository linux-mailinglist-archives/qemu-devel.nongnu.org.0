Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820C333448
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:16:59 +0100 (CET)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqHK-0004Fo-4c
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAl-0003Tk-Dw; Tue, 09 Mar 2021 23:10:13 -0500
Received: from ozlabs.org ([203.11.71.1]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAi-000477-Ua; Tue, 09 Mar 2021 23:10:11 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd21NDz9sWL; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=FoD6B3IN6nlky86cPe2d7zQCD4SjMyjVayDMdmmA0pE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i0EiVE0POq0EYq/V5+a7FUd4LQ7rwkNvS39pVuz6qCOEJUAvyKHipT+36GU8Nz9nn
 AbFHxb8da/9dIh6+WPJa4sfY4HEjajybLETi7Zx2xOUZkzUVztTPnaEO1HZcHB5Ywq
 v7qLKyTrnX09MmvMdYcA2KLfp+mYPDeGbP1UxfhI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/20] hw/display/sm501: Expand out macros in template header
Date: Wed, 10 Mar 2021 15:09:44 +1100
Message-Id: <20210310041002.333813-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Now that we only include sm501_template.h for the DEPTH==32 case, we
can expand out the uses of the BPP, PIXEL_TYPE and PIXEL_NAME macros
in that header.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210212180653.27588-3-peter.maydell@linaro.org>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/display/sm501_template.h | 60 +++++++++++--------------------------
 1 file changed, 17 insertions(+), 43 deletions(-)

diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index a60abad019..28537a05d9 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -22,28 +22,8 @@
  * THE SOFTWARE.
  */
 
-#if DEPTH == 8
-#define BPP 1
-#define PIXEL_TYPE uint8_t
-#elif DEPTH == 15 || DEPTH == 16
-#define BPP 2
-#define PIXEL_TYPE uint16_t
-#elif DEPTH == 32
-#define BPP 4
-#define PIXEL_TYPE uint32_t
-#else
-#error unsupport depth
-#endif
-
-#ifdef BGR_FORMAT
-#define PIXEL_NAME glue(DEPTH, bgr)
-#else
-#define PIXEL_NAME DEPTH
-#endif /* BGR_FORMAT */
-
-
-static void glue(draw_line8_, PIXEL_NAME)(
-                 uint8_t *d, const uint8_t *s, int width, const uint32_t *pal)
+static void draw_line8_32(uint8_t *d, const uint8_t *s, int width,
+                          const uint32_t *pal)
 {
     uint8_t v, r, g, b;
     do {
@@ -51,14 +31,14 @@ static void glue(draw_line8_, PIXEL_NAME)(
         r = (pal[v] >> 16) & 0xff;
         g = (pal[v] >>  8) & 0xff;
         b = (pal[v] >>  0) & 0xff;
-        *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         s++;
-        d += BPP;
+        d += 4;
     } while (--width != 0);
 }
 
-static void glue(draw_line16_, PIXEL_NAME)(
-                 uint8_t *d, const uint8_t *s, int width, const uint32_t *pal)
+static void draw_line16_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
 {
     uint16_t rgb565;
     uint8_t r, g, b;
@@ -68,14 +48,14 @@ static void glue(draw_line16_, PIXEL_NAME)(
         r = (rgb565 >> 8) & 0xf8;
         g = (rgb565 >> 3) & 0xfc;
         b = (rgb565 << 3) & 0xf8;
-        *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         s += 2;
-        d += BPP;
+        d += 4;
     } while (--width != 0);
 }
 
-static void glue(draw_line32_, PIXEL_NAME)(
-                 uint8_t *d, const uint8_t *s, int width, const uint32_t *pal)
+static void draw_line32_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
 {
     uint8_t r, g, b;
 
@@ -83,17 +63,17 @@ static void glue(draw_line32_, PIXEL_NAME)(
         r = s[2];
         g = s[1];
         b = s[0];
-        *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         s += 4;
-        d += BPP;
+        d += 4;
     } while (--width != 0);
 }
 
 /**
  * Draw hardware cursor image on the given line.
  */
-static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
-                 int width, const uint8_t *palette, int c_x, int c_y)
+static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
+                             const uint8_t *palette, int c_x, int c_y)
 {
     int i;
     uint8_t r, g, b, v, bitset = 0;
@@ -101,7 +81,7 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
     /* get cursor position */
     assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
     s += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
-    d += c_x * BPP;
+    d += c_x * 4;
 
     for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
         /* get pixel value */
@@ -118,14 +98,8 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
             r = palette[v * 3 + 0];
             g = palette[v * 3 + 1];
             b = palette[v * 3 + 2];
-            *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
+            *(uint32_t *)d = rgb_to_pixel32(r, g, b);
         }
-        d += BPP;
+        d += 4;
     }
 }
-
-#undef DEPTH
-#undef BPP
-#undef PIXEL_TYPE
-#undef PIXEL_NAME
-#undef BGR_FORMAT
-- 
2.29.2


