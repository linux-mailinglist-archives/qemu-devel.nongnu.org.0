Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4040318D33
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:21:46 +0100 (CET)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACqn-0004ut-Tu
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl2-0006Z7-F5
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:50 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkf-00075X-9n
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n10so4028301wmq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9AAYXTgEn51qVy6T0eITT5uVdwHQA2+VsimtxQtp+8=;
 b=G4eZzsObjctnirgcirU6ej9sEy0Kmk3gtjwGH7oGlFyYt+fXl9Z6JH1VeTeQQH0XOU
 9aPdcVDxBgp2Ctg/uIf2Cj5KlBJ1896Bib8pf+Ykz61ASS+gImzDzaKtDiuebFcUzmsN
 8DbqEPpzq2CpJF/dFSj6IYLa7nJDYQL8uCipWyNEjd5NyUEhsWGgJRvl+EV/bbWE/cJ4
 okpEaMupO3JcuDNMvb8/EZWhfxDLNL969nylBqb31em1sXbKAuDNk9pBmCMxL8UtgzAW
 sD0xo5CJeO411JkwmtslmJ+Fc+kG1I1RnxHHph6iyB3d4MPzPNaXS7Sie9585Km6DDii
 rxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9AAYXTgEn51qVy6T0eITT5uVdwHQA2+VsimtxQtp+8=;
 b=q5OU30xetbaG4leqto1sjycVxu7N2ejACqygLT47LbEy0GFATwoym9/zk+a2N/9NCR
 BBNpDFGk0yIbeTP7esgznwGlROcERuE8sp3hE2GA2EnMBWgRVTXigBmWh2dRqW3O7Z6C
 X+XolupO/lo1cPPJFf47i13IcB0+1O5UOKcMeAxGe/4uzpHSk81pPlC1CCceSdajaopU
 5LqWEVDjbcAooUrxU506rAdLPvtyunJOr0jJ9ZAeeHBxDEdd84q53ofonRvthCCY6hZN
 UeyTUT/R6rxMyQbrnmWGQJByybl4AUNnMr17KxCrfhAyInU/dMfyoMJkQ0oezVO4sEi4
 kLNQ==
X-Gm-Message-State: AOAM531RDBBg4rcS/1sR1SpjnRNMoyQY7vURlJoEqVFEmrA3l/wANy04
 WGTIpcFJeW1EQdXd9fB3bgwdbg==
X-Google-Smtp-Source: ABdhPJzzskzXVFwx1gZZmteL0A7USZeqI6SXPQs/1oN6p0PidtbULUlZiwu0PlHWYiVUueXz5Px6fw==
X-Received: by 2002:a1c:f001:: with SMTP id a1mr5373426wmb.21.1613052921882;
 Thu, 11 Feb 2021 06:15:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/9] hw/display/pxa2xx_lcd: Remove dest_width state field
Date: Thu, 11 Feb 2021 14:15:11 +0000
Message-Id: <20210211141515.8755-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the dest_width is now always 4 because the output surface is
32bpp, we can replace the dest_width state field with a constant.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/pxa2xx_lcd.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 786a777629f..33343832bbc 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -187,6 +187,9 @@ typedef struct QEMU_PACKED {
 #define LDCMD_SOFINT	(1 << 22)
 #define LDCMD_PAL	(1 << 26)
 
+/* Size of a pixel in the QEMU UI output surface, in bytes */
+#define DEST_PIXEL_WIDTH 4
+
 #define BITS 32
 #include "pxa2xx_template.h"
 
@@ -702,14 +705,14 @@ static void pxa2xx_lcdc_dma0_redraw_rot0(PXA2xxLCDState *s,
     else if (s->bpp > pxa_lcdc_8bpp)
         src_width *= 2;
 
-    dest_width = s->xres * s->dest_width;
+    dest_width = s->xres * DEST_PIXEL_WIDTH;
     *miny = 0;
     if (s->invalidated) {
         framebuffer_update_memory_section(&s->fbsection, s->sysmem,
                                           addr, s->yres, src_width);
     }
     framebuffer_update_display(surface, &s->fbsection, s->xres, s->yres,
-                               src_width, dest_width, s->dest_width,
+                               src_width, dest_width, DEST_PIXEL_WIDTH,
                                s->invalidated,
                                fn, s->dma_ch[0].palette, miny, maxy);
 }
@@ -731,14 +734,14 @@ static void pxa2xx_lcdc_dma0_redraw_rot90(PXA2xxLCDState *s,
     else if (s->bpp > pxa_lcdc_8bpp)
         src_width *= 2;
 
-    dest_width = s->yres * s->dest_width;
+    dest_width = s->yres * DEST_PIXEL_WIDTH;
     *miny = 0;
     if (s->invalidated) {
         framebuffer_update_memory_section(&s->fbsection, s->sysmem,
                                           addr, s->yres, src_width);
     }
     framebuffer_update_display(surface, &s->fbsection, s->xres, s->yres,
-                               src_width, s->dest_width, -dest_width,
+                               src_width, DEST_PIXEL_WIDTH, -dest_width,
                                s->invalidated,
                                fn, s->dma_ch[0].palette,
                                miny, maxy);
@@ -763,14 +766,14 @@ static void pxa2xx_lcdc_dma0_redraw_rot180(PXA2xxLCDState *s,
         src_width *= 2;
     }
 
-    dest_width = s->xres * s->dest_width;
+    dest_width = s->xres * DEST_PIXEL_WIDTH;
     *miny = 0;
     if (s->invalidated) {
         framebuffer_update_memory_section(&s->fbsection, s->sysmem,
                                           addr, s->yres, src_width);
     }
     framebuffer_update_display(surface, &s->fbsection, s->xres, s->yres,
-                               src_width, -dest_width, -s->dest_width,
+                               src_width, -dest_width, -DEST_PIXEL_WIDTH,
                                s->invalidated,
                                fn, s->dma_ch[0].palette, miny, maxy);
 }
@@ -794,14 +797,14 @@ static void pxa2xx_lcdc_dma0_redraw_rot270(PXA2xxLCDState *s,
         src_width *= 2;
     }
 
-    dest_width = s->yres * s->dest_width;
+    dest_width = s->yres * DEST_PIXEL_WIDTH;
     *miny = 0;
     if (s->invalidated) {
         framebuffer_update_memory_section(&s->fbsection, s->sysmem,
                                           addr, s->yres, src_width);
     }
     framebuffer_update_display(surface, &s->fbsection, s->xres, s->yres,
-                               src_width, -s->dest_width, dest_width,
+                               src_width, -DEST_PIXEL_WIDTH, dest_width,
                                s->invalidated,
                                fn, s->dma_ch[0].palette,
                                miny, maxy);
@@ -1013,7 +1016,6 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     s->con = graphic_console_init(NULL, 0, &pxa2xx_ops, s);
-    s->dest_width = 4;
 
     vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
 
-- 
2.20.1


