Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF2338F94
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:14:03 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiYE-00078G-B7
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDL-0003Bq-Lq
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:27 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD1-00025b-M4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:27 -0500
Received: by mail-wm1-x32d.google.com with SMTP id g8so3857476wmd.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k0SWrAJAZAKXRQ0ecRR0l1wfURa/qUlSBt2FMITfjbg=;
 b=d8DjMX3vrIHs13GyfzxUKYNtecBuV8JIymXw6dApm+fbm1eTtQQWDy5rALKpxmibVi
 EMCgcEuH791JS8zyFxPwnW4078qpYscV3/U7Fts9EUIE7Orod049hM644NXXLAx8Gitz
 +k7cR9NAgj9UxXGlGjmQnCjBMDttTjIxFApRcuKGmsRbIpSg37xg5yDTicZvHj11k4EE
 wO1sbdRVMSWlishajdnUijZcAZ1x78GqWMhYrNuywi6cniiQ9qw69JIqEj6qFGfNfbZU
 Vnb8GJUcZB1H+D3Xe3MqcIobsBWWkQG/5E8BEOM5I+JiAsazPZbmi90GGIOGt01+ZtQv
 kRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0SWrAJAZAKXRQ0ecRR0l1wfURa/qUlSBt2FMITfjbg=;
 b=Dh0tQklRPvaTZ1zHbkE0EMewLnL5/1P2dt9SJ6n8fXfx96qqgxO9l+JRE8mmf5Vza/
 soOrcuPWbey04ZOOyk9JxWLcZBlTgIIcdC5nyIcY9/3G9ZXsBbZsTMO9riWCPi+kNml/
 Vu+asA97oer1wGh8Hf4lZ+7OflzN/QkIPO2a6eS/BZ4uy7bTEH18a+6IFKd49qYmUdPn
 dVWIly5Y6blc201YMugZJEm1Ypo0jkM72WLzBqhHmW9O8yxwM0lBmEVaaWgHx8rTyDxK
 9tY4gz0Y110GmWfIThHpVn7u/teYZ2cRaVahNXFo+3yuUUwRis9uOQWoxbANl+ztxU4F
 o7HA==
X-Gm-Message-State: AOAM533NLTpGYU+kAAaXUqhsNEzKhzWIrsc47NS42ndGBNNsUAuagShE
 Q61urgPgYYO5asIAns8D+OFPYiqIdl9H5pUl
X-Google-Smtp-Source: ABdhPJyhOsp7ralYEKXfeoLeUA0SA4GmxM560s3iBUeqtjAOrcEDGo+ZLtVS6nQokFwmCEPhvgYciA==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr12902648wmc.35.1615557126397; 
 Fri, 12 Mar 2021 05:52:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/39] hw/display/pxa2xx_lcd: Remove dead code for non-32-bpp
 surfaces
Date: Fri, 12 Mar 2021 13:51:35 +0000
Message-Id: <20210312135140.1099-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
surface is always 32 bits per pixel.  Remove the legacy dead code
from the pxa2xx_lcd display device which was handling the possibility
that the console surface was some other format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-5-peter.maydell@linaro.org
---
 hw/display/pxa2xx_lcd.c | 79 +++++++++--------------------------------
 1 file changed, 17 insertions(+), 62 deletions(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index dfff9949627..786a777629f 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -45,7 +45,6 @@ struct PXA2xxLCDState {
 
     int invalidated;
     QemuConsole *con;
-    drawfn *line_fn[2];
     int dest_width;
     int xres, yres;
     int pal_for;
@@ -188,6 +187,9 @@ typedef struct QEMU_PACKED {
 #define LDCMD_SOFINT	(1 << 22)
 #define LDCMD_PAL	(1 << 26)
 
+#define BITS 32
+#include "pxa2xx_template.h"
+
 /* Route internal interrupt lines to the global IC */
 static void pxa2xx_lcdc_int_update(PXA2xxLCDState *s)
 {
@@ -674,14 +676,21 @@ static void pxa2xx_palette_parse(PXA2xxLCDState *s, int ch, int bpp)
     }
 }
 
+static inline drawfn pxa2xx_drawfn(PXA2xxLCDState *s)
+{
+    if (s->transp) {
+        return pxa2xx_draw_fn_32t[s->bpp];
+    } else {
+        return pxa2xx_draw_fn_32[s->bpp];
+    }
+}
+
 static void pxa2xx_lcdc_dma0_redraw_rot0(PXA2xxLCDState *s,
                 hwaddr addr, int *miny, int *maxy)
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width)
-        fn = s->line_fn[s->transp][s->bpp];
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn)
         return;
 
@@ -710,9 +719,7 @@ static void pxa2xx_lcdc_dma0_redraw_rot90(PXA2xxLCDState *s,
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width)
-        fn = s->line_fn[s->transp][s->bpp];
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn)
         return;
 
@@ -742,10 +749,7 @@ static void pxa2xx_lcdc_dma0_redraw_rot180(PXA2xxLCDState *s,
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width) {
-        fn = s->line_fn[s->transp][s->bpp];
-    }
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn) {
         return;
     }
@@ -776,10 +780,7 @@ static void pxa2xx_lcdc_dma0_redraw_rot270(PXA2xxLCDState *s,
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int src_width, dest_width;
-    drawfn fn = NULL;
-    if (s->dest_width) {
-        fn = s->line_fn[s->transp][s->bpp];
-    }
+    drawfn fn = pxa2xx_drawfn(s);
     if (!fn) {
         return;
     }
@@ -990,17 +991,6 @@ static const VMStateDescription vmstate_pxa2xx_lcdc = {
     }
 };
 
-#define BITS 8
-#include "pxa2xx_template.h"
-#define BITS 15
-#include "pxa2xx_template.h"
-#define BITS 16
-#include "pxa2xx_template.h"
-#define BITS 24
-#include "pxa2xx_template.h"
-#define BITS 32
-#include "pxa2xx_template.h"
-
 static const GraphicHwOps pxa2xx_ops = {
     .invalidate  = pxa2xx_invalidate_display,
     .gfx_update  = pxa2xx_update_display,
@@ -1010,7 +1000,6 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
                                  hwaddr base, qemu_irq irq)
 {
     PXA2xxLCDState *s;
-    DisplaySurface *surface;
 
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
@@ -1024,41 +1013,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     s->con = graphic_console_init(NULL, 0, &pxa2xx_ops, s);
-    surface = qemu_console_surface(s->con);
-
-    switch (surface_bits_per_pixel(surface)) {
-    case 0:
-        s->dest_width = 0;
-        break;
-    case 8:
-        s->line_fn[0] = pxa2xx_draw_fn_8;
-        s->line_fn[1] = pxa2xx_draw_fn_8t;
-        s->dest_width = 1;
-        break;
-    case 15:
-        s->line_fn[0] = pxa2xx_draw_fn_15;
-        s->line_fn[1] = pxa2xx_draw_fn_15t;
-        s->dest_width = 2;
-        break;
-    case 16:
-        s->line_fn[0] = pxa2xx_draw_fn_16;
-        s->line_fn[1] = pxa2xx_draw_fn_16t;
-        s->dest_width = 2;
-        break;
-    case 24:
-        s->line_fn[0] = pxa2xx_draw_fn_24;
-        s->line_fn[1] = pxa2xx_draw_fn_24t;
-        s->dest_width = 3;
-        break;
-    case 32:
-        s->line_fn[0] = pxa2xx_draw_fn_32;
-        s->line_fn[1] = pxa2xx_draw_fn_32t;
-        s->dest_width = 4;
-        break;
-    default:
-        fprintf(stderr, "%s: Bad color depth\n", __func__);
-        exit(1);
-    }
+    s->dest_width = 4;
 
     vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
 
-- 
2.20.1


