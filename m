Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF3421935
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:24:37 +0200 (CEST)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVRs-0008QU-CH
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXVN9-0001CN-EW
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:19:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35830
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXVN7-0001u9-Tu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:19:43 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXVMt-0008kv-9b; Mon, 04 Oct 2021 22:19:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon,  4 Oct 2021 22:19:17 +0100
Message-Id: <20211004211928.15803-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 01/12] macfb: handle errors that occur during realize
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Make sure any errors that occur within the macfb realize chain are detected
and handled correctly to prevent crashes and to ensure that error messages are
reported back to the user.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 76808b69cc..2ec25c5d6f 100644
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
@@ -378,7 +380,10 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
     MacfbSysBusState *s = MACFB(dev);
     MacfbState *ms = &s->macfb;
 
-    macfb_common_realize(dev, ms, errp);
+    if (!macfb_common_realize(dev, ms, errp)) {
+        return;
+    }
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_ctrl);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
 }
@@ -391,8 +396,14 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
     MacfbState *ms = &s->macfb;
 
     ndc->parent_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    if (!macfb_common_realize(dev, ms, errp)) {
+        return;
+    }
 
-    macfb_common_realize(dev, ms, errp);
     memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
     memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
 }
-- 
2.20.1


