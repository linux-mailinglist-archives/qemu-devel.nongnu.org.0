Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C626528FC0A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 02:22:01 +0200 (CEST)
Received: from localhost ([::1]:36472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTDVQ-0001Py-SN
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 20:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTDRR-0005gn-82; Thu, 15 Oct 2020 20:17:53 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:30049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTDRM-0006vg-LT; Thu, 15 Oct 2020 20:17:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 741D7747621;
 Fri, 16 Oct 2020 02:17:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ED188747613; Fri, 16 Oct 2020 02:17:35 +0200 (CEST)
Message-Id: <4d58ffe7645a0c746c8fed6aa8775c0867b624e0.1602805637.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1602805637.git.balaton@eik.bme.hu>
References: <cover.1602805637.git.balaton@eik.bme.hu>
Subject: [PATCH v8 2/5] mac_newworld: Allow loading binary ROM image
Date: Fri, 16 Oct 2020 01:47:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:17:36
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fall back to load binary ROM image if loading ELF fails. This also
moves PROM_BASE and PROM_SIZE defines to board as these are matching
the ROM size and address on this board and removes the now unused
PROM_ADDR and BIOS_SIZE defines from common mac.h.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/mac.h          |  2 --
 hw/ppc/mac_newworld.c | 22 ++++++++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index f3976b9a45..22c8408078 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -39,10 +39,8 @@
 /* SMP is not enabled, for now */
 #define MAX_CPUS 1
 
-#define BIOS_SIZE        (1 * MiB)
 #define NVRAM_SIZE        0x2000
 #define PROM_FILENAME    "openbios-ppc"
-#define PROM_ADDR         0xfff00000
 
 #define KERNEL_LOAD_ADDR 0x01000000
 #define KERNEL_GAP       0x00100000
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7a8dc09c8d..f9a1cc8944 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -82,6 +82,8 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
+#define PROM_BASE 0xfff00000
+#define PROM_SIZE (1 * MiB)
 
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
@@ -100,7 +102,7 @@ static void ppc_core99_reset(void *opaque)
 
     cpu_reset(CPU(cpu));
     /* 970 CPUs want to get their initial IP as part of their boot protocol */
-    cpu->env.nip = PROM_ADDR + 0x100;
+    cpu->env.nip = PROM_BASE + 0x100;
 }
 
 /* PowerPC Mac99 hardware initialisation */
@@ -154,25 +156,29 @@ static void ppc_core99_init(MachineState *machine)
     /* allocate RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
-    /* allocate and load BIOS */
-    memory_region_init_rom(bios, NULL, "ppc_core99.bios", BIOS_SIZE,
+    /* allocate and load firmware ROM */
+    memory_region_init_rom(bios, NULL, "ppc_core99.bios", PROM_SIZE,
                            &error_fatal);
+    memory_region_add_subregion(get_system_memory(), PROM_BASE, bios);
 
-    if (bios_name == NULL)
+    if (!bios_name) {
         bios_name = PROM_FILENAME;
+    }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    memory_region_add_subregion(get_system_memory(), PROM_ADDR, bios);
-
-    /* Load OpenBIOS (ELF) */
     if (filename) {
+        /* Load OpenBIOS (ELF) */
         bios_size = load_elf(filename, NULL, NULL, NULL, NULL,
                              NULL, NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
 
+        if (bios_size <= 0) {
+            /* or load binary ROM image */
+            bios_size = load_image_targphys(filename, PROM_BASE, PROM_SIZE);
+        }
         g_free(filename);
     } else {
         bios_size = -1;
     }
-    if (bios_size < 0 || bios_size > BIOS_SIZE) {
+    if (bios_size < 0 || bios_size > PROM_SIZE) {
         error_report("could not load PowerPC bios '%s'", bios_name);
         exit(1);
     }
-- 
2.21.3


