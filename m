Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336E120C994
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 20:29:10 +0200 (CEST)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpc3B-0005sa-7S
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 14:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jpbua-0002MM-DG; Sun, 28 Jun 2020 14:20:16 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:38396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jpbuY-0005OP-BL; Sun, 28 Jun 2020 14:20:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4FF50748DCF;
 Sun, 28 Jun 2020 20:20:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2D50A746331; Sun, 28 Jun 2020 20:20:12 +0200 (CEST)
Message-Id: <3f45213b3ef8435340e0f4c34922be6706129d18.1593367416.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1593367416.git.balaton@eik.bme.hu>
References: <cover.1593367416.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 11/11] mac_oldworld: Add SPD data to cover RAM
Date: Sun, 28 Jun 2020 20:03:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenBIOS gets RAM size via fw_cfg but rhe original board firmware
detects RAM using SPD data so generate and add SDP eeproms to cover as
much RAM as possible to describe with SPD (this may be less than the
actual ram_size due to SDRAM size constraints).

This patch is more complex as it should be which I intend to fix once
agreement can be made on how to get back the necessary functionality
removed by previous patches. See in this thread:
https://lists.nongnu.org/archive/html/qemu-devel/2020-06/msg08710.html

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_oldworld.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 8fbddba4eb..5ad54370d0 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -34,6 +34,7 @@
 #include "hw/input/adb.h"
 #include "sysemu/sysemu.h"
 #include "net/net.h"
+#include "hw/i2c/smbus_eeprom.h"
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
@@ -133,6 +134,8 @@ static void ppc_heathrow_init(MachineState *machine)
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     uint64_t tbfreq;
+    uint8_t *spd_data[3] = {};
+    I2CBus *i2c_bus;
 
     /* init CPUs */
     for (i = 0; i < smp_cpus; i++) {
@@ -150,8 +153,16 @@ static void ppc_heathrow_init(MachineState *machine)
                      "maximum 2047 MB", ram_size / MiB);
         exit(1);
     }
-
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
+    for (i = 0; i < 3; i++) {
+        int size_left = ram_size - i * 512 * MiB;
+        if (size_left > 0) {
+            uint32_t s = size_left / MiB;
+            s = (s > 512 ? 512 : s);
+            s = 1U << (31 - clz32(s));
+            spd_data[i] = spd_data_generate(SDR, s * MiB);
+        }
+    }
 
     /* allocate and load firmware ROM */
     memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", PROM_SIZE,
@@ -337,6 +348,12 @@ static void ppc_heathrow_init(MachineState *machine)
     macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
 
     dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
+    i2c_bus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
+    for (i = 0; i < 3; i++) {
+        if (spd_data[i]) {
+            smbus_eeprom_init_one(i2c_bus, 0x50 + i, spd_data[i]);
+        }
+    }
     adb_bus = qdev_get_child_bus(dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
     qdev_realize_and_unref(dev, adb_bus, &error_fatal);
-- 
2.21.3


