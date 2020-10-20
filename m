Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EE2912C2
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 17:52:37 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kToVX-0003ep-C4
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kToUk-0002ws-Rg; Sat, 17 Oct 2020 11:51:46 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kToUh-00079s-I9; Sat, 17 Oct 2020 11:51:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7A9F9746333;
 Sat, 17 Oct 2020 17:51:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A36A746331; Sat, 17 Oct 2020 17:51:39 +0200 (CEST)
Subject: [PATCH v9] mac_oldworld: Allow loading binary ROM image
Date: Sat, 17 Oct 2020 17:47:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Message-Id: <20201017155139.5A36A746331@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

The beige G3 Power Macintosh has a 4MB firmware ROM. Fix the size of
the rom region and fall back to loading a binary image with -bios if
loading ELF image failed. This allows testing emulation with a ROM
image from real hardware as well as using an ELF OpenBIOS image.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
v9: Revert change from v8, back to the same as v7 rebased on latest

 hw/ppc/mac_oldworld.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 05e46ee6fe..0117ae17f5 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -59,6 +59,8 @@
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
 #define GRACKLE_BASE 0xfec00000
+#define PROM_BASE 0xffc00000
+#define PROM_SIZE (4 * MiB)
 
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
@@ -100,6 +102,7 @@ static void ppc_heathrow_init(MachineState *machine)
     SysBusDevice *s;
     DeviceState *dev, *pic_dev;
     BusState *adb_bus;
+    uint64_t bios_addr;
     int bios_size;
     unsigned int smp_cpus = machine->smp.cpus;
     uint16_t ppc_boot_device;
@@ -128,24 +131,32 @@ static void ppc_heathrow_init(MachineState *machine)
 
     memory_region_add_subregion(sysmem, 0, machine->ram);
 
-    /* allocate and load BIOS */
-    memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
+    /* allocate and load firmware ROM */
+    memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", PROM_SIZE,
                            &error_fatal);
+    memory_region_add_subregion(sysmem, PROM_BASE, bios);
 
-    if (bios_name == NULL)
+    if (!bios_name) {
         bios_name = PROM_FILENAME;
+    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    memory_region_add_subregion(sysmem, PROM_ADDR, bios);
-
-    /* Load OpenBIOS (ELF) */
     if (filename) {
-        bios_size = load_elf(filename, NULL, 0, NULL, NULL, NULL, NULL, NULL,
-                             1, PPC_ELF_MACHINE, 0, 0);
+        /* Load OpenBIOS (ELF) */
+        bios_size = load_elf(filename, NULL, NULL, NULL, NULL, &bios_addr,
+                             NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
+        /* Unfortunately, load_elf sign-extends reading elf32 */
+        bios_addr = (uint32_t)bios_addr;
+
+        if (bios_size <= 0) {
+            /* or load binary ROM image */
+            bios_size = load_image_targphys(filename, PROM_BASE, PROM_SIZE);
+            bios_addr = PROM_BASE;
+        }
         g_free(filename);
     } else {
         bios_size = -1;
     }
-    if (bios_size < 0 || bios_size > BIOS_SIZE) {
+    if (bios_size < 0 || bios_addr - PROM_BASE + bios_size > PROM_SIZE) {
         error_report("could not load PowerPC bios '%s'", bios_name);
         exit(1);
     }
-- 
2.21.3


