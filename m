Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9E31B6FF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:23:16 +0100 (CET)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBb2B-000193-Dj
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBb0u-0000KB-GS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:21:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBb0s-000584-KS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:21:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id b3so8211599wrj.5
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5uIbLODWrb8uar/SHYKO6Y7P6tdIIeYNn3w8JjOO24=;
 b=CBtl6CaXvwGPFQbicTrPKrUmFgJceOCY2eiiY62ifpbAVCbNuwAq14av3EmD/txjQx
 cxCYcyl+EC4ekoAuq0tEpbZGKIi26hLOk36poMt7FKoH1fWz5tb/Yqb3m302YfTVpQ7O
 68SBB3mEQwZlKpFu2m8tomTsJbtYZgCE5MZ8nF3Nx7KmcsPVyS8T56PuTU4hdWiLlwTm
 UJH5YzhuXNFyb+J5ZKEu7KGi9cHBCvi1fdqbUdQ19FUG3BOJQaPhxBI/0fE/fgDhvYTt
 FCu/uEkK0peQeOe0lMStJgBZCNzlnw6GQuIe0Vg837DJj1Ghexxlqx0EMF4J7K/+hMsK
 tX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5uIbLODWrb8uar/SHYKO6Y7P6tdIIeYNn3w8JjOO24=;
 b=C9FkBfdIPd2Ww3Pc4TfTf5sOGFT1CoF+dScXfdeOvX7Wz1idD7tpdrvI66FeI+qCnR
 TWCWImzXq7HT12kNOSpHcvWcENV+zT9mSdD+OBX9SrSf6QQuhk7VRni55VSR4CBenlGV
 OY5ELiD/BmyrsNK9R1RA3FFcHJu0ayyNpd68f0o+QtUoYTpbE/C2e4bINgwkvmDpApSJ
 I+Av0r1hglUoy/Jfg1i8EEuH+oz4alO5DPazmXL9B58QaW3VJgEXxYiMYqEjSnM2YMxb
 wkilqSOJoOj0t6F/dbi6HH4y2QDmGOz2J6puZGN2P1X4TJEyFkHpWzI5Mhmud86YU1oG
 QK+Q==
X-Gm-Message-State: AOAM530rxxiaTY5etanvNIdmm+AbhHRje+hFFtGbs7O1YOv99f49AUoR
 0vGQjU5YLYFf/GOdMwA1Ua2DiCINKjYdZg==
X-Google-Smtp-Source: ABdhPJx+oHzfkP2RQVSN0RUV7oWmtzT0Ri8FDmBK1mfiWX0AyZ814iCcG4sB+VDqvOELyg/u0fpADA==
X-Received: by 2002:adf:ce04:: with SMTP id p4mr17991283wrn.101.1613384512949; 
 Mon, 15 Feb 2021 02:21:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v11sm23582456wrr.3.2021.02.15.02.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:21:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/tcx: Drop unnecessary code for handling BGR format
 outputs
Date: Mon, 15 Feb 2021 10:21:49 +0000
Message-Id: <20210215102149.20513-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
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
---
Tested by booting Linux on an SS-5.
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


