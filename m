Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9810540C36A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:13:31 +0200 (CEST)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQRv0-0005FZ-LI
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsG-0002Uf-V0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:10:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39004
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsF-0002Vf-7p
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:10:40 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRs6-00059W-Jd; Wed, 15 Sep 2021 11:10:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:07 +0100
Message-Id: <20210915101026.25174-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 01/20] nubus-device: rename slot_nb variable to slot
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

This is in preparation for creating a qdev property of the same name.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nubus/nubus-device.c  | 14 +++++++-------
 include/hw/nubus/nubus.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index ffe78a8823..be01269563 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -87,7 +87,7 @@ static void nubus_register_format_block(NubusDevice *dev)
     char *fblock_name;
 
     fblock_name = g_strdup_printf("nubus-slot-%d-format-block",
-                                  dev->slot_nb);
+                                  dev->slot);
 
     hwaddr fblock_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE;
     memory_region_init_io(&dev->fblock_io, NULL, &nubus_format_block_ops,
@@ -142,7 +142,7 @@ void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
     /* ROM */
 
     dev->rom = rom;
-    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot_nb);
+    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot);
     memory_region_init_io(&dev->rom_io, NULL, &mac_nubus_rom_ops,
                           dev, rom_name, size);
     memory_region_set_readonly(&dev->rom_io, true);
@@ -167,12 +167,12 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    nd->slot_nb = nubus->current_slot++;
-    name = g_strdup_printf("nubus-slot-%d", nd->slot_nb);
+    nd->slot = nubus->current_slot++;
+    name = g_strdup_printf("nubus-slot-%d", nd->slot);
 
-    if (nd->slot_nb < NUBUS_FIRST_SLOT) {
+    if (nd->slot < NUBUS_FIRST_SLOT) {
         /* Super */
-        slot_offset = (nd->slot_nb - 6) * NUBUS_SUPER_SLOT_SIZE;
+        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
 
         memory_region_init(&nd->slot_mem, OBJECT(dev), name,
                            NUBUS_SUPER_SLOT_SIZE);
@@ -180,7 +180,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
                                     &nd->slot_mem);
     } else {
         /* Normal */
-        slot_offset = nd->slot_nb * NUBUS_SLOT_SIZE;
+        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
 
         memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
         memory_region_add_subregion(&nubus->slot_io, slot_offset,
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index e2b5cf260b..424309dd73 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -42,7 +42,7 @@ struct NubusBus {
 struct NubusDevice {
     DeviceState qdev;
 
-    int slot_nb;
+    int slot;
     MemoryRegion slot_mem;
 
     /* Format Block */
-- 
2.20.1


