Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC616338F80
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:10:22 +0100 (CET)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiUf-0000va-VG
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDK-00037q-Ak
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD2-00025m-DK
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso15841340wme.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PM3SuydHyOzy5Uwo3OyW3MqBl0OlcBLDtlirowbRdI0=;
 b=BJXjG4Vi+zIkZ2WLKWcZ818VJ4hkg/SgdX4BO3Q8Un0cCSPJkUcjRtBKpc/tkWNh+Y
 N7PmxSR0g0oScMlyGKFxV7Qc+m53DdfG1/LU6EOpBEwUEddjzfu+NLLEsGDL8fCFaJdQ
 S9NszBfvEmVavl6AR6NLgV9HZReDNnESmEVVI5Y/08+1InP50fpCn+GHMYWR+VN30i0E
 M0oRZYU5NG2mV4OIoqFRLg9VZ9db7kehZi1Lsc6fOb9duXORMIKQGhru3jaL8U6995By
 4Hgwgd3N8sKgRyhC0lxTdZ7iadYcOrDMJB4oTSyJriRM5qeAFzRVklcv3fv9toBf+1z3
 qrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PM3SuydHyOzy5Uwo3OyW3MqBl0OlcBLDtlirowbRdI0=;
 b=RPp6eiU9lUwFWsVSQgI83P9V2LYeq/Iw7t7v2OkUENhv7JR9FRh7YyYmSmC800Rh33
 trAernlrK5DKV6SVDLZa0WafEHKAOZZHmYIbrrlcBNFUgXvfVd5DmvffYIE8QFjsSnec
 fXWdSEEYlmBt4FO0TEydMyoJ1Gn8pbAt41tXsqrgAhdMGHZB4r4oX0TKGqJFNUMK9K68
 FWuI0sdtq5bG9t3eSENITYarFelCjnX0RwdKLPPc8R/r7JmaU4YddVjIFJvYoPv2O10g
 sx9joHsaxmDHAKup3833lsNMuBduyLfZkAnewcWKNJ2h0pMG2t6g3qcjaf4tvKsNxPdk
 kxcQ==
X-Gm-Message-State: AOAM530XyBfQ3/qLQA5/kI40eV94TWRAUHt03x7XCAzmHLaUU++OsfbB
 W2eptFtNFJN7C8FgcmjAZATzd5oban1TUtGm
X-Google-Smtp-Source: ABdhPJz9AyB4YnXezPhtisZyDMl7vEsDHhTKE5L9/iE2xJp4R4I5AkndhHHMNxviTAeh25G3QRlVSQ==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr13182959wmc.126.1615557127062; 
 Fri, 12 Mar 2021 05:52:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/39] hw/display/pxa2xx_lcd: Remove dest_width state field
Date: Fri, 12 Mar 2021 13:51:36 +0000
Message-Id: <20210312135140.1099-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Since the dest_width is now always 4 because the output surface is
32bpp, we can replace the dest_width state field with a constant.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-6-peter.maydell@linaro.org
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


