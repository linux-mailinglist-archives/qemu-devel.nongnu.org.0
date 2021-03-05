Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D058E32F202
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:58:47 +0100 (CET)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEis-0000UU-Re
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3U-0007Aj-Bm
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3B-0007bt-JC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j2so2882107wrx.9
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oe9MhiVYZ6H7wXjDt7yf+5qualM/DZ5tP/aZAie3vSo=;
 b=iSssnzGSRjF8L5rj18+Clp5i5dgp1YS3/4vMSzxYYYbSJYM4tWO2HdC/gSlv2jcNHz
 rGbLwXU9/YL1/qgfgGCLurgYj/O7uqOevr/C2gAdJZSYD14vKC4Aw9v2ssWLwCokvoIi
 38rjeezOsgo7pW93I2mD2Tl8zAIZ0GTP4/l805/C3wMaMJ7gXmWoskdBv/c+rys1GFVF
 zVVzUTV6skn6a6PZbE8LvoxOFVh95E+9N9KrfRKZmrIkTwZCrjQoKrSsU3BJtr8hinAp
 HMaYAZwNvrywrW8dzbtuswRz3JpkRLMJXpVKrHULdlH1wH9FjbejuFHyISm7ZsYSX3uE
 trrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oe9MhiVYZ6H7wXjDt7yf+5qualM/DZ5tP/aZAie3vSo=;
 b=QMarH8a3Y9SFfVOFLcBb5sbCwPokLxHgfaKFKf2knSJqIuGedLPSa2k1zE5iLSUrmF
 bUzoqcBOoxXiMm3RNzXNsW1XyuhC6HXJSjPIUbiBd+N96f0x8prZC7Zs0+DPsiVB4mtJ
 TPiexM5VKSvvajkLy2XIc0QTz7fRgtPvDwkL7B+RXsPKR3vqKxFV3wi2okqFLd9fIwsE
 lC9iWlTBFMpzEKJXMoGL4b0sxsJ6lJ19Iv7FggDkaq62nCVFcJkol+Px2nsTC5jMOcbG
 ElWFPnoGlPen4aVUw3qo5FSl+LUaNDoBuB3cVtv2GDC8xA91KrziB/D+HnSXKK1HMN+Q
 yNYQ==
X-Gm-Message-State: AOAM530zoKTYoFarAIlcSFCs65JzS8AtzwiRty+MXW5qKMMW5vYet2Fa
 UMg3SUXuTd2YHAAvu3Te9C15D1/pxsXQxg==
X-Google-Smtp-Source: ABdhPJxw/j+1yaKD/13OzK48oXUSIY3exJqEogweLH3qT0VmmunEMX4al4szqyiHgV0VuZO1VHUJow==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr10846322wrq.162.1614964535250; 
 Fri, 05 Mar 2021 09:15:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/49] hw/display/tcx: Drop unnecessary code for handling BGR
 format outputs
Date: Fri,  5 Mar 2021 17:14:51 +0000
Message-Id: <20210305171515.1038-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

For a long time now the UI layer has guaranteed that the console
surface is always 32 bits per pixel, RGB. The TCX code already
assumes 32bpp, but it still has some checks of is_surface_bgr()
in an attempt to support 32bpp BGR. is_surface_bgr() will always
return false for the qemu_console_surface(), unless the display
device itself has deliberately created an alternate-format
surface via a function like qemu_create_displaysurface_from().

Drop the never-used BGR-handling code, and assert that we have
a 32-bit surface rather than just doing nothing if it isn't.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215102149.20513-1-peter.maydell@linaro.org
---
 hw/display/tcx.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 965f92ff6b7..d3db3046572 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -128,15 +128,10 @@ static int tcx_check_dirty(TCXState *s, DirtyBitmapSnapshot *snap,
 
 static void update_palette_entries(TCXState *s, int start, int end)
 {
-    DisplaySurface *surface = qemu_console_surface(s->con);
     int i;
 
     for (i = start; i < end; i++) {
-        if (is_surface_bgr(surface)) {
-            s->palette[i] = rgb_to_pixel32bgr(s->r[i], s->g[i], s->b[i]);
-        } else {
-            s->palette[i] = rgb_to_pixel32(s->r[i], s->g[i], s->b[i]);
-        }
+        s->palette[i] = rgb_to_pixel32(s->r[i], s->g[i], s->b[i]);
     }
     tcx_set_dirty(s, 0, memory_region_size(&s->vram_mem));
 }
@@ -181,21 +176,18 @@ static void tcx_draw_cursor32(TCXState *s1, uint8_t *d,
 }
 
 /*
-  XXX Could be much more optimal:
-  * detect if line/page/whole screen is in 24 bit mode
-  * if destination is also BGR, use memcpy
-  */
+ * XXX Could be much more optimal:
+ * detect if line/page/whole screen is in 24 bit mode
+ */
 static inline void tcx24_draw_line32(TCXState *s1, uint8_t *d,
                                      const uint8_t *s, int width,
                                      const uint32_t *cplane,
                                      const uint32_t *s24)
 {
-    DisplaySurface *surface = qemu_console_surface(s1->con);
-    int x, bgr, r, g, b;
+    int x, r, g, b;
     uint8_t val, *p8;
     uint32_t *p = (uint32_t *)d;
     uint32_t dval;
-    bgr = is_surface_bgr(surface);
     for(x = 0; x < width; x++, s++, s24++) {
         if (be32_to_cpu(*cplane) & 0x03000000) {
             /* 24-bit direct, BGR order */
@@ -204,10 +196,7 @@ static inline void tcx24_draw_line32(TCXState *s1, uint8_t *d,
             b = *p8++;
             g = *p8++;
             r = *p8;
-            if (bgr)
-                dval = rgb_to_pixel32bgr(r, g, b);
-            else
-                dval = rgb_to_pixel32(r, g, b);
+            dval = rgb_to_pixel32(r, g, b);
         } else {
             /* 8-bit pseudocolor */
             val = *s;
@@ -230,9 +219,7 @@ static void tcx_update_display(void *opaque)
     int y, y_start, dd, ds;
     uint8_t *d, *s;
 
-    if (surface_bits_per_pixel(surface) != 32) {
-        return;
-    }
+    assert(surface_bits_per_pixel(surface) == 32);
 
     page = 0;
     y_start = -1;
@@ -283,9 +270,7 @@ static void tcx24_update_display(void *opaque)
     uint8_t *d, *s;
     uint32_t *cptr, *s24;
 
-    if (surface_bits_per_pixel(surface) != 32) {
-            return;
-    }
+    assert(surface_bits_per_pixel(surface) == 32);
 
     page = 0;
     y_start = -1;
-- 
2.20.1


