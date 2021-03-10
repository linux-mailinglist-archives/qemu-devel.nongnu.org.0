Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AB33344A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:17:14 +0100 (CET)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqHZ-0004vv-1U
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAn-0003UC-E9; Tue, 09 Mar 2021 23:10:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53019 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAk-000479-Bb; Tue, 09 Mar 2021 23:10:12 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd2bB8z9sWR; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=HP6BC7ZgaqPiHS+GRbApM2a5OYHOkhJ4BhBo3OvB/GQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ViKCR+QB8jJwL648gkhqmescYVZKdsUVfqZddXvvocBWnFQoku8fTJI7dvd2T2hb4
 lDWbj0dDfVGGbEjtUZx5+0vZKUs7i+indkrrVxPDq8byaJpI6eP82Rza1S1EaZKxOw
 rWTW99QCxK3QUjE/G8V5kroprGJTgAD/+7jYzJkY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/20] hw/display/sm501: Inline template header into C file
Date: Wed, 10 Mar 2021 15:09:45 +1100
Message-Id: <20210310041002.333813-4-david@gibson.dropbear.id.au>
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

We no longer need to include sm501_template.h multiple times, so
we can simply inline its contents into sm501.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210212180653.27588-4-peter.maydell@linaro.org>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/display/sm501.c          |  83 +++++++++++++++++++++++++++-
 hw/display/sm501_template.h | 105 ------------------------------------
 2 files changed, 81 insertions(+), 107 deletions(-)
 delete mode 100644 hw/display/sm501_template.h

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index aba447c18b..8789722ef2 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1558,8 +1558,87 @@ typedef void draw_hwc_line_func(uint8_t *d, const uint8_t *s,
                                 int width, const uint8_t *palette,
                                 int c_x, int c_y);
 
-#define DEPTH 32
-#include "sm501_template.h"
+static void draw_line8_32(uint8_t *d, const uint8_t *s, int width,
+                          const uint32_t *pal)
+{
+    uint8_t v, r, g, b;
+    do {
+        v = ldub_p(s);
+        r = (pal[v] >> 16) & 0xff;
+        g = (pal[v] >>  8) & 0xff;
+        b = (pal[v] >>  0) & 0xff;
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        s++;
+        d += 4;
+    } while (--width != 0);
+}
+
+static void draw_line16_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
+{
+    uint16_t rgb565;
+    uint8_t r, g, b;
+
+    do {
+        rgb565 = lduw_le_p(s);
+        r = (rgb565 >> 8) & 0xf8;
+        g = (rgb565 >> 3) & 0xfc;
+        b = (rgb565 << 3) & 0xf8;
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        s += 2;
+        d += 4;
+    } while (--width != 0);
+}
+
+static void draw_line32_32(uint8_t *d, const uint8_t *s, int width,
+                           const uint32_t *pal)
+{
+    uint8_t r, g, b;
+
+    do {
+        r = s[2];
+        g = s[1];
+        b = s[0];
+        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        s += 4;
+        d += 4;
+    } while (--width != 0);
+}
+
+/**
+ * Draw hardware cursor image on the given line.
+ */
+static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
+                             const uint8_t *palette, int c_x, int c_y)
+{
+    int i;
+    uint8_t r, g, b, v, bitset = 0;
+
+    /* get cursor position */
+    assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
+    s += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
+    d += c_x * 4;
+
+    for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
+        /* get pixel value */
+        if (i % 4 == 0) {
+            bitset = ldub_p(s);
+            s++;
+        }
+        v = bitset & 3;
+        bitset >>= 2;
+
+        /* write pixel */
+        if (v) {
+            v--;
+            r = palette[v * 3 + 0];
+            g = palette[v * 3 + 1];
+            b = palette[v * 3 + 2];
+            *(uint32_t *)d = rgb_to_pixel32(r, g, b);
+        }
+        d += 4;
+    }
+}
 
 static void sm501_update_display(void *opaque)
 {
diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
deleted file mode 100644
index 28537a05d9..0000000000
--- a/hw/display/sm501_template.h
+++ /dev/null
@@ -1,105 +0,0 @@
-/*
- * Pixel drawing function templates for QEMU SM501 Device
- *
- * Copyright (c) 2008 Shin-ichiro KAWASAKI
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-static void draw_line8_32(uint8_t *d, const uint8_t *s, int width,
-                          const uint32_t *pal)
-{
-    uint8_t v, r, g, b;
-    do {
-        v = ldub_p(s);
-        r = (pal[v] >> 16) & 0xff;
-        g = (pal[v] >>  8) & 0xff;
-        b = (pal[v] >>  0) & 0xff;
-        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        s++;
-        d += 4;
-    } while (--width != 0);
-}
-
-static void draw_line16_32(uint8_t *d, const uint8_t *s, int width,
-                           const uint32_t *pal)
-{
-    uint16_t rgb565;
-    uint8_t r, g, b;
-
-    do {
-        rgb565 = lduw_le_p(s);
-        r = (rgb565 >> 8) & 0xf8;
-        g = (rgb565 >> 3) & 0xfc;
-        b = (rgb565 << 3) & 0xf8;
-        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        s += 2;
-        d += 4;
-    } while (--width != 0);
-}
-
-static void draw_line32_32(uint8_t *d, const uint8_t *s, int width,
-                           const uint32_t *pal)
-{
-    uint8_t r, g, b;
-
-    do {
-        r = s[2];
-        g = s[1];
-        b = s[0];
-        *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        s += 4;
-        d += 4;
-    } while (--width != 0);
-}
-
-/**
- * Draw hardware cursor image on the given line.
- */
-static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
-                             const uint8_t *palette, int c_x, int c_y)
-{
-    int i;
-    uint8_t r, g, b, v, bitset = 0;
-
-    /* get cursor position */
-    assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
-    s += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
-    d += c_x * 4;
-
-    for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
-        /* get pixel value */
-        if (i % 4 == 0) {
-            bitset = ldub_p(s);
-            s++;
-        }
-        v = bitset & 3;
-        bitset >>= 2;
-
-        /* write pixel */
-        if (v) {
-            v--;
-            r = palette[v * 3 + 0];
-            g = palette[v * 3 + 1];
-            b = palette[v * 3 + 2];
-            *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-        }
-        d += 4;
-    }
-}
-- 
2.29.2


