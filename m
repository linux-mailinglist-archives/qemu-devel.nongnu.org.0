Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C55F37A3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:24:45 +0200 (CEST)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSvc-0002Az-5N
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoh-00055a-1O; Mon, 03 Oct 2022 16:13:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoa-0000yB-NA; Mon, 03 Oct 2022 16:13:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3F2F275A154;
 Mon,  3 Oct 2022 22:13:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 18944746324; Mon,  3 Oct 2022 22:13:18 +0200 (CEST)
Message-Id: <96555558e7189f26fd530e7ff3f406806a258884.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 04/13] mac_{old|new}world: Avoid else branch by setting
 default value
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:18 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Several variables are set in if-else branches where the else branch
can be removed by setting a default value at the variable declaration
which leads to simlpler code that is easier to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 19 ++++---------------
 hw/ppc/mac_oldworld.c | 18 ++++--------------
 2 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 6327694f85..6bc3bd19be 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -111,11 +111,11 @@ static void ppc_core99_init(MachineState *machine)
     CPUPPCState *env = NULL;
     char *filename;
     IrqLines *openpic_irqs;
-    int i, j, k, ppc_boot_device, machine_arch, bios_size;
+    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
     const char *bios_name = machine->firmware ?: PROM_FILENAME;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
-    hwaddr kernel_base, initrd_base, cmdline_base = 0;
-    long kernel_size, initrd_size;
+    hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
+    long kernel_size = 0, initrd_size = 0;
     UNINHostState *uninorth_pci;
     PCIBus *pci_bus;
     PCIDevice *macio;
@@ -165,8 +165,6 @@ static void ppc_core99_init(MachineState *machine)
             bios_size = load_image_targphys(filename, PROM_BASE, PROM_SIZE);
         }
         g_free(filename);
-    } else {
-        bios_size = -1;
     }
     if (bios_size < 0 || bios_size > PROM_SIZE) {
         error_report("could not load PowerPC bios '%s'", bios_name);
@@ -174,15 +172,12 @@ static void ppc_core99_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        int bswap_needed;
+        int bswap_needed = 0;
 
 #ifdef BSWAP_NEEDED
         bswap_needed = 1;
-#else
-        bswap_needed = 0;
 #endif
         kernel_base = KERNEL_LOAD_ADDR;
-
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
@@ -212,16 +207,10 @@ static void ppc_core99_init(MachineState *machine)
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
         } else {
-            initrd_base = 0;
-            initrd_size = 0;
             cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
-        kernel_base = 0;
-        kernel_size = 0;
-        initrd_base = 0;
-        initrd_size = 0;
         ppc_boot_device = '\0';
         /* We consider that NewWorld PowerMac never have any floppy drive
          * For now, OHW cannot boot from the network.
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 5cabc410e7..cb67e44081 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -84,11 +84,11 @@ static void ppc_heathrow_init(MachineState *machine)
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
-    int i, bios_size;
+    int i, bios_size = -1;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     uint64_t bios_addr;
-    uint32_t kernel_base, initrd_base, cmdline_base = 0;
-    int32_t kernel_size, initrd_size;
+    uint32_t kernel_base = 0, initrd_base = 0, cmdline_base = 0;
+    int32_t kernel_size = 0, initrd_size = 0;
     PCIBus *pci_bus;
     PCIDevice *macio;
     MACIOIDEState *macio_ide;
@@ -139,8 +139,6 @@ static void ppc_heathrow_init(MachineState *machine)
             bios_addr = PROM_BASE;
         }
         g_free(filename);
-    } else {
-        bios_size = -1;
     }
     if (bios_size < 0 || bios_addr - PROM_BASE + bios_size > PROM_SIZE) {
         error_report("could not load PowerPC bios '%s'", bios_name);
@@ -148,12 +146,10 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     if (machine->kernel_filename) {
-        int bswap_needed;
+        int bswap_needed = 0;
 
 #ifdef BSWAP_NEEDED
         bswap_needed = 1;
-#else
-        bswap_needed = 0;
 #endif
         kernel_base = KERNEL_LOAD_ADDR;
         kernel_size = load_elf(machine->kernel_filename, NULL,
@@ -186,16 +182,10 @@ static void ppc_heathrow_init(MachineState *machine)
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
         } else {
-            initrd_base = 0;
-            initrd_size = 0;
             cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
-        kernel_base = 0;
-        kernel_size = 0;
-        initrd_base = 0;
-        initrd_size = 0;
         ppc_boot_device = '\0';
         for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
             /*
-- 
2.30.4


