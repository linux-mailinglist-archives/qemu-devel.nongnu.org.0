Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D54E3B3CE7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 08:58:45 +0200 (CEST)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwfnY-0004qJ-9G
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 02:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjM-0005ov-LT
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58712
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjG-0001r2-Uj
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:24 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfj1-0006FO-KD; Fri, 25 Jun 2021 07:54:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com, fthain@telegraphics.com.au, laurent@vivier.eu
Date: Fri, 25 Jun 2021 07:53:55 +0100
Message-Id: <20210625065401.30170-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 04/10] hw/m68k/q800: move PROM and checksum calculation
 from dp8393x device to board
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

This is in preparation for each board to have its own separate bit storage
format and checksum for storing the MAC address.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 11376daa85..491f283a17 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -70,6 +70,8 @@
 #define NUBUS_SUPER_SLOT_BASE 0x60000000
 #define NUBUS_SLOT_BASE       0xf0000000
 
+#define SONIC_PROM_SIZE       0x1000
+
 /*
  * the video base, whereas it a Nubus address,
  * is needed by the kernel to have early display and
@@ -211,8 +213,10 @@ static void q800_init(MachineState *machine)
     int32_t initrd_size;
     MemoryRegion *rom;
     MemoryRegion *io;
+    MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
+    uint8_t *prom;
     const int io_slice_nb = (IO_SIZE / IO_SLICE) - 1;
-    int i;
+    int i, checksum;
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
@@ -319,9 +323,25 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 0, SONIC_BASE);
-    sysbus_mmio_map(sysbus, 1, SONIC_PROM_BASE);
     sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 2));
 
+    memory_region_init_rom(dp8393x_prom, NULL, "dp8393x-q800.prom",
+                           SONIC_PROM_SIZE, &error_fatal);
+    memory_region_add_subregion(get_system_memory(), SONIC_PROM_BASE,
+                                dp8393x_prom);
+
+    /* Add MAC address with valid checksum to PROM */
+    prom = memory_region_get_ram_ptr(dp8393x_prom);
+    checksum = 0;
+    for (i = 0; i < 6; i++) {
+        prom[i] = nd_table[0].macaddr.a[i];
+        checksum += prom[i];
+        if (checksum > 0xff) {
+            checksum = (checksum + 1) & 0xff;
+        }
+    }
+    prom[7] = 0xff - checksum;
+
     /* SCC */
 
     dev = qdev_new(TYPE_ESCC);
-- 
2.20.1


