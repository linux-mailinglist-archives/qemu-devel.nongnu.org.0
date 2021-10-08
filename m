Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C995426A2E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:54:05 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoRw-0008NX-26
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJc-0006GD-85
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:29 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:55705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJW-0006vT-E1
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:25 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MV5rK-1mA5dW2WnO-00SB52; Fri, 08
 Oct 2021 13:45:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] macfb: update macfb.c to use the Error API best practices
Date: Fri,  8 Oct 2021 13:45:07 +0200
Message-Id: <20211008114518.757615-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1GT30kE0iunnH0/coSR3T5rY2VuRR8bjAiXqHi5G/E/lzhRGZ+e
 nwJD2vcDa8mTHPOye5q1lmhvo7C6W+3izNmDiwC+cPVu0PxAzZvVVWmDYRDn3VvKF/ogXIJ
 +PEVfNF/rsWte3P09lFG67i/Qaddg4wsdEK+gOJx1wHYkeCcRhyukbkQHjrDVfcOzmuQrBd
 sGukoCdtCKn4ErRP36nFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hiA/1KaLx34=:vwIpio/B+8OzxejmNWQWbA
 UBJuRszeTqybQCE7X2+NqiXeBun11RJAIc+6AAE28UT6bdrkrErjmBLW/+00b2bHIjBRiDm5d
 XfQZRwsVaKKd8X/XLCM5ICFxxfUsdPd+u1+cwHKd/kMUvu+AB81hhDVXuWgnXCaNwm3PQ1Q48
 Zv4dXKAn1pArdOHO6LoHEvna/HCWEDGbpOxVFfPNKyp0TB9Ml1ltafOd+gLR+ey3GpORo4Lwi
 sUmDPyuTFyLxZ/+obQFzW82dkvWMLJyd4+kG3rpPXml8rWXaYM83DcHaePPlMKQwc/vUMeSwJ
 Oiyyq3aiB6GKRops7bNB/kIbCXijP5OuB89W8/vaRLx4DISVYj+IJHQh+/Xazs/v+einAepui
 HKk1bV3PbEbTfHVMe0LUtDoP58TZ8qDYXwoX0MFTwcalxVPJvsHLg/8BVXxQNxg4vKqYfFniY
 uFtaKv69Aj/Xey2SUNM2bPfH7sDYpt2/dWcQE2WMBUYrtjB29K+qHk/3HOHiVzzFR7v/asEdd
 0mYuQCJJqHamfpx5ZsKmpkwxmjLyAXnwmfvJ5lKYPMFoOLabyiZgU9vYM2XD3tiX57/cAlxRe
 xiNiINXP5UPF0pPt6Zav073Ob6XkIt4grMOBkKIbp50qfMNLKVVShW9EuCxXrT0P2v7pF8+OC
 1Bm3cSfo0Fb9WWPaubyo9jsN+tBO2Hz5YEOb6mkTDrdttHPwsK6d9cBNK3Sgv0Nte/DGEMeOr
 iuADvWAsw6Y69bX6vMwkjNmvL3mCgsmDwCIlNw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

As per the current Error API best practices, change macfb_commom_realize() to return
a boolean indicating success to reduce errp boiler-plate handling code. Note that
memory_region_init_ram_nomigrate() is also updated to use &error_abort to indicate
a non-recoverable error, matching the behaviour recommended after similar
discussions on memory API failures for the recent nubus changes.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 2b747a8de8a1..2ec25c5d6f7a 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -343,14 +343,14 @@ static const GraphicHwOps macfb_ops = {
     .gfx_update = macfb_update_display,
 };
 
-static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
+static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
 {
     DisplaySurface *surface;
 
     if (s->depth != 1 && s->depth != 2 && s->depth != 4 && s->depth != 8 &&
         s->depth != 16 && s->depth != 24) {
         error_setg(errp, "unknown guest depth %d", s->depth);
-        return;
+        return false;
     }
 
     s->con = graphic_console_init(dev, 0, &macfb_ops, s);
@@ -359,18 +359,20 @@ static void macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
     if (surface_bits_per_pixel(surface) != 32) {
         error_setg(errp, "unknown host depth %d",
                    surface_bits_per_pixel(surface));
-        return;
+        return false;
     }
 
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
                           "macfb-ctrl", 0x1000);
 
     memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram",
-                                     MACFB_VRAM_SIZE, errp);
+                                     MACFB_VRAM_SIZE, &error_abort);
     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
     vmstate_register_ram(&s->mem_vram, dev);
     memory_region_set_coalescing(&s->mem_vram);
+
+    return true;
 }
 
 static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
@@ -378,8 +380,7 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
     MacfbSysBusState *s = MACFB(dev);
     MacfbState *ms = &s->macfb;
 
-    macfb_common_realize(dev, ms, errp);
-    if (*errp) {
+    if (!macfb_common_realize(dev, ms, errp)) {
         return;
     }
 
@@ -399,8 +400,7 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    macfb_common_realize(dev, ms, errp);
-    if (*errp) {
+    if (!macfb_common_realize(dev, ms, errp)) {
         return;
     }
 
-- 
2.31.1


