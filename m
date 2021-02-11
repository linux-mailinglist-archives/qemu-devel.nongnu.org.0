Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40671318D4B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:25:59 +0100 (CET)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACus-0002a4-Av
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl4-0006Ze-BT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:52 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkf-000766-CH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:50 -0500
Received: by mail-wm1-x334.google.com with SMTP id o15so3915198wmq.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zv2u6w5q5esrZorBsQrCABmG0xarOvGvSZxOFdFbVVI=;
 b=fv742X9Nt8cveRnXPyo09PvWLstprnTaR/YEPp/wPBtMKGRishaVE//PM1xEPjFe5Q
 jf4kerKGv2lLYAiyNJVuwb3KTbc4LPuNw5+ySOBHzcpIYvF9xw3hNctd5K+Ka+xd73fI
 VOl7IhQaPvDqhcWYyANW6PHui3VC0awdEcgdCrgKCG4wq7i+RAQcK2VbtiszRDxkEVN0
 IgODshJ0AAAU7CKLe71HwNFxlitrM48m3Z03zLYXKZ6qbRMh04+gHchUsYqsPIMakr6v
 6q7rhL39PozC0QAwjlwHNQhFWkvlCS871OeqX36lkq/5sJfN6CbL+nmI5bVbwPeUXubw
 2RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zv2u6w5q5esrZorBsQrCABmG0xarOvGvSZxOFdFbVVI=;
 b=qeGi0FU0RhV5frEN7lp2sDl+9L/+ziEk0nrRuEU5QN1+RJQWl4fNT2Mjqc2dlfW5bb
 beiMj8Z/jJoZldI8FdKVZh0Kl+9NqQ+fd2Sh01Ex7ti9UIcJ3Mv782NkkMaikFZFK5So
 5kS33q0CgrxBpjSes5O2AVC0/oOPPbbqEZuJfEe78g/6dRCw7AdYDb3TA2kpARvQV5a5
 bHl2+hjNVLFb+heXnLeqMFPd6kmBeX1B3/E6uJ3V2x3EcJhDa5ULD/J4wKHo0UIFcW8B
 NPGx48A4huSldZnC4iLdiku+S82Ah0WyzYBlRQrH7/3xycdyobSGrrGFVqJKGP2Ywqh3
 re7A==
X-Gm-Message-State: AOAM531pCBMGhaJsVSScf+cC3wfMY1TsGyLiQcrvStAVaxjWFatQEmqb
 ynSqzizIYvGw1C51qE/cnyUoyg==
X-Google-Smtp-Source: ABdhPJwh2fYNi8XU3zVbh4tWAZGAXRSW5fxwxyEWfVMJu/QhXuGfQHcCv5FyhQkHTC9OST/NjsbmBw==
X-Received: by 2002:a05:600c:28d3:: with SMTP id
 h19mr5358567wmd.147.1613052922726; 
 Thu, 11 Feb 2021 06:15:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/display/pxa2xx: Remove use of BITS in pxa2xx_template.h
Date: Thu, 11 Feb 2021 14:15:12 +0000
Message-Id: <20210211141515.8755-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that BITS is always 32, expand out all its uses in the template
header, including removing now-useless uses of the glue() macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pxa2xx_template.h | 110 ++++++++++++++---------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/hw/display/pxa2xx_template.h b/hw/display/pxa2xx_template.h
index c64eebc4b68..711fd9994e2 100644
--- a/hw/display/pxa2xx_template.h
+++ b/hw/display/pxa2xx_template.h
@@ -10,30 +10,11 @@
  */
 
 # define SKIP_PIXEL(to)		to += deststep
-#if BITS == 8
-# define COPY_PIXEL(to, from)  do { *to = from; SKIP_PIXEL(to); } while (0)
-#elif BITS == 15 || BITS == 16
-# define COPY_PIXEL(to, from)    \
-    do {                         \
-        *(uint16_t *) to = from; \
-        SKIP_PIXEL(to);          \
-    } while (0)
-#elif BITS == 24
-# define COPY_PIXEL(to, from)     \
-    do {                          \
-        *(uint16_t *) to = from;  \
-        *(to + 2) = (from) >> 16; \
-        SKIP_PIXEL(to);           \
-    } while (0)
-#elif BITS == 32
 # define COPY_PIXEL(to, from)    \
     do {                         \
         *(uint32_t *) to = from; \
         SKIP_PIXEL(to);          \
     } while (0)
-#else
-# error unknown bit depth
-#endif
 
 #ifdef HOST_WORDS_BIGENDIAN
 # define SWAP_WORDS	1
@@ -42,7 +23,7 @@
 #define FN_2(x)		FN(x + 1) FN(x)
 #define FN_4(x)		FN_2(x + 2) FN_2(x)
 
-static void glue(pxa2xx_draw_line2_, BITS)(void *opaque,
+static void pxa2xx_draw_line2(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t *palette = opaque;
@@ -67,7 +48,7 @@ static void glue(pxa2xx_draw_line2_, BITS)(void *opaque,
     }
 }
 
-static void glue(pxa2xx_draw_line4_, BITS)(void *opaque,
+static void pxa2xx_draw_line4(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t *palette = opaque;
@@ -92,7 +73,7 @@ static void glue(pxa2xx_draw_line4_, BITS)(void *opaque,
     }
 }
 
-static void glue(pxa2xx_draw_line8_, BITS)(void *opaque,
+static void pxa2xx_draw_line8(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t *palette = opaque;
@@ -117,7 +98,7 @@ static void glue(pxa2xx_draw_line8_, BITS)(void *opaque,
     }
 }
 
-static void glue(pxa2xx_draw_line16_, BITS)(void *opaque,
+static void pxa2xx_draw_line16(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -133,19 +114,19 @@ static void glue(pxa2xx_draw_line16_, BITS)(void *opaque,
         data >>= 6;
         r = (data & 0x1f) << 3;
         data >>= 5;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data & 0x1f) << 3;
         data >>= 5;
         g = (data & 0x3f) << 2;
         data >>= 6;
         r = (data & 0x1f) << 3;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 2;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line16t_, BITS)(void *opaque,
+static void pxa2xx_draw_line16t(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -164,7 +145,7 @@ static void glue(pxa2xx_draw_line16t_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data >>= 1;
         b = (data & 0x1f) << 3;
         data >>= 5;
@@ -175,13 +156,13 @@ static void glue(pxa2xx_draw_line16t_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 2;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line18_, BITS)(void *opaque,
+static void pxa2xx_draw_line18(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -196,14 +177,14 @@ static void glue(pxa2xx_draw_line18_, BITS)(void *opaque,
         g = (data & 0x3f) << 2;
         data >>= 6;
         r = (data & 0x3f) << 2;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
 /* The wicked packed format */
-static void glue(pxa2xx_draw_line18p_, BITS)(void *opaque,
+static void pxa2xx_draw_line18p(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data[3];
@@ -226,32 +207,32 @@ static void glue(pxa2xx_draw_line18p_, BITS)(void *opaque,
         data[0] >>= 6;
         r = (data[0] & 0x3f) << 2;
         data[0] >>= 12;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data[0] & 0x3f) << 2;
         data[0] >>= 6;
         g = ((data[1] & 0xf) << 4) | (data[0] << 2);
         data[1] >>= 4;
         r = (data[1] & 0x3f) << 2;
         data[1] >>= 12;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
         g = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
         r = ((data[2] & 0x3) << 6) | (data[1] << 2);
         data[2] >>= 8;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         b = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
         g = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
         r = data[2] << 2;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 4;
     }
 }
 
-static void glue(pxa2xx_draw_line19_, BITS)(void *opaque,
+static void pxa2xx_draw_line19(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -270,14 +251,14 @@ static void glue(pxa2xx_draw_line19_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
 /* The wicked packed format */
-static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
+static void pxa2xx_draw_line19p(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data[3];
@@ -303,7 +284,7 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[0] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data[0] >>= 6;
         b = (data[0] & 0x3f) << 2;
         data[0] >>= 6;
@@ -314,7 +295,7 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[1] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data[1] >>= 6;
         b = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
@@ -325,7 +306,7 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[2] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         data[2] >>= 6;
         b = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
@@ -336,12 +317,12 @@ static void glue(pxa2xx_draw_line19p_, BITS)(void *opaque,
         if (data[2] & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 4;
     }
 }
 
-static void glue(pxa2xx_draw_line24_, BITS)(void *opaque,
+static void pxa2xx_draw_line24(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -356,13 +337,13 @@ static void glue(pxa2xx_draw_line24_, BITS)(void *opaque,
         g = data & 0xff;
         data >>= 8;
         r = data & 0xff;
-        COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+        COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line24t_, BITS)(void *opaque,
+static void pxa2xx_draw_line24t(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -381,13 +362,13 @@ static void glue(pxa2xx_draw_line24t_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
-static void glue(pxa2xx_draw_line25_, BITS)(void *opaque,
+static void pxa2xx_draw_line25(void *opaque,
                 uint8_t *dest, const uint8_t *src, int width, int deststep)
 {
     uint32_t data;
@@ -406,39 +387,38 @@ static void glue(pxa2xx_draw_line25_, BITS)(void *opaque,
         if (data & 1)
             SKIP_PIXEL(dest);
         else
-            COPY_PIXEL(dest, glue(rgb_to_pixel, BITS)(r, g, b));
+            COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
         width -= 1;
         src += 4;
     }
 }
 
 /* Overlay planes disabled, no transparency */
-static drawfn glue(pxa2xx_draw_fn_, BITS)[16] =
+static drawfn pxa2xx_draw_fn_32[16] =
 {
     [0 ... 0xf]       = NULL,
-    [pxa_lcdc_2bpp]   = glue(pxa2xx_draw_line2_, BITS),
-    [pxa_lcdc_4bpp]   = glue(pxa2xx_draw_line4_, BITS),
-    [pxa_lcdc_8bpp]   = glue(pxa2xx_draw_line8_, BITS),
-    [pxa_lcdc_16bpp]  = glue(pxa2xx_draw_line16_, BITS),
-    [pxa_lcdc_18bpp]  = glue(pxa2xx_draw_line18_, BITS),
-    [pxa_lcdc_18pbpp] = glue(pxa2xx_draw_line18p_, BITS),
-    [pxa_lcdc_24bpp]  = glue(pxa2xx_draw_line24_, BITS),
+    [pxa_lcdc_2bpp]   = pxa2xx_draw_line2,
+    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
+    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
+    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16,
+    [pxa_lcdc_18bpp]  = pxa2xx_draw_line18,
+    [pxa_lcdc_18pbpp] = pxa2xx_draw_line18p,
+    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24,
 };
 
 /* Overlay planes enabled, transparency used */
-static drawfn glue(glue(pxa2xx_draw_fn_, BITS), t)[16] =
+static drawfn pxa2xx_draw_fn_32t[16] =
 {
     [0 ... 0xf]       = NULL,
-    [pxa_lcdc_4bpp]   = glue(pxa2xx_draw_line4_, BITS),
-    [pxa_lcdc_8bpp]   = glue(pxa2xx_draw_line8_, BITS),
-    [pxa_lcdc_16bpp]  = glue(pxa2xx_draw_line16t_, BITS),
-    [pxa_lcdc_19bpp]  = glue(pxa2xx_draw_line19_, BITS),
-    [pxa_lcdc_19pbpp] = glue(pxa2xx_draw_line19p_, BITS),
-    [pxa_lcdc_24bpp]  = glue(pxa2xx_draw_line24t_, BITS),
-    [pxa_lcdc_25bpp]  = glue(pxa2xx_draw_line25_, BITS),
+    [pxa_lcdc_4bpp]   = pxa2xx_draw_line4,
+    [pxa_lcdc_8bpp]   = pxa2xx_draw_line8,
+    [pxa_lcdc_16bpp]  = pxa2xx_draw_line16t,
+    [pxa_lcdc_19bpp]  = pxa2xx_draw_line19,
+    [pxa_lcdc_19pbpp] = pxa2xx_draw_line19p,
+    [pxa_lcdc_24bpp]  = pxa2xx_draw_line24t,
+    [pxa_lcdc_25bpp]  = pxa2xx_draw_line25,
 };
 
-#undef BITS
 #undef COPY_PIXEL
 #undef SKIP_PIXEL
 
-- 
2.20.1


