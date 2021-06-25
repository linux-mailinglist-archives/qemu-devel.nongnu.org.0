Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA33B3CD7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 08:56:28 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwflL-0008Lp-Id
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 02:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjK-0005mW-5E
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58702
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjF-0001qQ-AY
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:21 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfj1-0006FO-2B; Fri, 25 Jun 2021 07:54:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com, fthain@telegraphics.com.au, laurent@vivier.eu
Date: Fri, 25 Jun 2021 07:53:54 +0100
Message-Id: <20210625065401.30170-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 03/10] hw/mips/jazz: move PROM and checksum calculation
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
 hw/mips/jazz.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1e1cf8154e..89ca8bb910 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -119,6 +119,8 @@ static const MemoryRegionOps dma_dummy_ops = {
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
 
+#define SONIC_PROM_SIZE 0x1000
+
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
 {
@@ -137,6 +139,7 @@ static void mips_jazz_init(MachineState *machine,
     MemoryRegion *rtc = g_new(MemoryRegion, 1);
     MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
+    MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
     NICInfo *nd;
     DeviceState *dev, *rc4030;
     SysBusDevice *sysbus;
@@ -228,6 +231,10 @@ static void mips_jazz_init(MachineState *machine,
                           NULL, "dummy_dma", 0x1000);
     memory_region_add_subregion(address_space, 0x8000d000, dma_dummy);
 
+    memory_region_init_rom(dp8393x_prom, NULL, "dp8393x-jazz.prom",
+                           SONIC_PROM_SIZE, &error_fatal);
+    memory_region_add_subregion(address_space, 0x8000b000, dp8393x_prom);
+
     /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
     memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
     memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
@@ -275,6 +282,9 @@ static void mips_jazz_init(MachineState *machine,
             nd->model = g_strdup("dp83932");
         }
         if (strcmp(nd->model, "dp83932") == 0) {
+            int checksum, i;
+            uint8_t *prom;
+
             qemu_check_nic_model(nd, "dp83932");
 
             dev = qdev_new("dp8393x");
@@ -285,8 +295,19 @@ static void mips_jazz_init(MachineState *machine,
             sysbus = SYS_BUS_DEVICE(dev);
             sysbus_realize_and_unref(sysbus, &error_fatal);
             sysbus_mmio_map(sysbus, 0, 0x80001000);
-            sysbus_mmio_map(sysbus, 1, 0x8000b000);
             sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(rc4030, 4));
+
+            /* Add MAC address with valid checksum to PROM */
+            prom = memory_region_get_ram_ptr(dp8393x_prom);
+            checksum = 0;
+            for (i = 0; i < 6; i++) {
+                prom[i] = nd->macaddr.a[i];
+                checksum += prom[i];
+                if (checksum > 0xff) {
+                    checksum = (checksum + 1) & 0xff;
+                }
+            }
+            prom[7] = 0xff - checksum;
             break;
         } else if (is_help_option(nd->model)) {
             error_report("Supported NICs: dp83932");
-- 
2.20.1


