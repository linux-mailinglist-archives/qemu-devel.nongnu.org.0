Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90636575271
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:07:08 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1Mp-0003PD-EH
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC121-0005Mm-2Y; Thu, 14 Jul 2022 11:45:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11y-0000bx-0g; Thu, 14 Jul 2022 11:45:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjM1H9gz4yTJ;
 Fri, 15 Jul 2022 01:45:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjK320wz4xdJ;
 Fri, 15 Jul 2022 01:45:25 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PULL 10/19] aspeed: fby35: Add a bootrom for the BMC
Date: Thu, 14 Jul 2022 17:44:47 +0200
Message-Id: <20220714154456.2565189-11-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The BMC boots from the first flash device by fetching instructions
from the flash contents. Add an alias region on 0x0 for this
purpose. There are currently performance issues with this method (TBs
being flushed too often), so as a faster alternative, install the
flash contents as a ROM in the BMC memory space.

See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
property to boot directly from CE0")

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
[ clg: blk_pread() fixes ]
Message-Id: <20220705191400.41632-8-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 5c5224d37471..e7405f6570b3 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -9,6 +9,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 #include "hw/boards.h"
 #include "hw/arm/aspeed_soc.h"
 
@@ -23,12 +24,49 @@ struct Fby35State {
     MemoryRegion bmc_boot_rom;
 
     AspeedSoCState bmc;
+
+    bool mmio_exec;
 };
 
 #define FBY35_BMC_RAM_SIZE (2 * GiB)
+#define FBY35_BMC_FIRMWARE_ADDR 0x0
+
+static void fby35_bmc_write_boot_rom(DriveInfo *dinfo, MemoryRegion *mr,
+                                     hwaddr offset, size_t rom_size,
+                                     Error **errp)
+{
+    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+    g_autofree void *storage = NULL;
+    int64_t size;
+
+    /*
+     * The block backend size should have already been 'validated' by
+     * the creation of the m25p80 object.
+     */
+    size = blk_getlength(blk);
+    if (size <= 0) {
+        error_setg(errp, "failed to get flash size");
+        return;
+    }
+
+    if (rom_size > size) {
+        rom_size = size;
+    }
+
+    storage = g_malloc0(rom_size);
+    if (blk_pread(blk, 0, rom_size, storage, 0) < 0) {
+        error_setg(errp, "failed to read the initial flash content");
+        return;
+    }
+
+    /* TODO: find a better way to install the ROM */
+    memcpy(memory_region_get_ram_ptr(mr) + offset, storage, rom_size);
+}
 
 static void fby35_bmc_init(Fby35State *s)
 {
+    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
+
     memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
     memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
@@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
     qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
+
+    /* Install first FMC flash content as a boot rom. */
+    if (drive0) {
+        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
+        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+        uint64_t size = memory_region_size(&fl->mmio);
+
+        if (s->mmio_exec) {
+            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
+                                     &fl->mmio, 0, size);
+            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
+                                        boot_rom);
+        } else {
+
+            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
+                                   size, &error_abort);
+            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
+                                        boot_rom);
+            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
+                                     size, &error_abort);
+        }
+    }
 }
 
 static void fby35_init(MachineState *machine)
@@ -57,6 +117,22 @@ static void fby35_init(MachineState *machine)
     fby35_bmc_init(s);
 }
 
+
+static bool fby35_get_mmio_exec(Object *obj, Error **errp)
+{
+    return FBY35(obj)->mmio_exec;
+}
+
+static void fby35_set_mmio_exec(Object *obj, bool value, Error **errp)
+{
+    FBY35(obj)->mmio_exec = value;
+}
+
+static void fby35_instance_init(Object *obj)
+{
+    FBY35(obj)->mmio_exec = false;
+}
+
 static void fby35_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -66,6 +142,12 @@ static void fby35_class_init(ObjectClass *oc, void *data)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
+
+    object_class_property_add_bool(oc, "execute-in-place",
+                                   fby35_get_mmio_exec,
+                                   fby35_set_mmio_exec);
+    object_class_property_set_description(oc, "execute-in-place",
+                           "boot directly from CE0 flash device");
 }
 
 static const TypeInfo fby35_types[] = {
@@ -74,6 +156,7 @@ static const TypeInfo fby35_types[] = {
         .parent = TYPE_MACHINE,
         .class_init = fby35_class_init,
         .instance_size = sizeof(Fby35State),
+        .instance_init = fby35_instance_init,
     },
 };
 
-- 
2.35.3


