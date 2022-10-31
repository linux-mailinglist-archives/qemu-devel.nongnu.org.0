Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C0613ED7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbBw-0007e9-R8; Mon, 31 Oct 2022 16:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBu-0007dE-Kf; Mon, 31 Oct 2022 16:15:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBs-0000jW-Ve; Mon, 31 Oct 2022 16:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UHqiYzuk1mAmwGDYyXBPOqWTR/rY54X3mLbfuba1quE=; b=a/IFh3pfoGk76kbDl2w5ZOmLxf
 xJh4SxhQN7eK5FdNMHD0W0aTL85gUFYqsxB6hYS+MbitbFQTaAf3lWb6pN6w0auKdc3cyjiN9h4Bg
 eP7k/lx9LyZQuxT5oPIHBxAx3yilfjp41M9fhzgoond193qRGeVyM773CZTiaQCzmsZ19foNavJaR
 df07sCUD1fAp17O3b1yn9dBT4Wvg2V0ODzkvKITKrPMTPdegdGgi5xh0s49EU3qmY/d4+FE0hjRTu
 ICDqBkIvowNgSFA4s/RtoRaMemr8zcBubqhgwb5e0vLhmS4n7tDa1JLtykxQaXOyCYZd8w/4NZsFo
 j9tJojg7wZ9q8QQKeY+ewJ1qMrcmIGY/f68wceHRD8yNg8HX0FoodPts9ovD83BjtthRZCLDf93Vl
 6HMTzqS6IZDrUF6qT02QU/vyqeeSIEbMGX/Q/daiDte3iyXD7ABd19zYV4k1RZbUwLhWe4nG7IiRF
 Dh1aD7bbGbdBmcI9Oj6jmJ3+CShkapBs7QSCncjCzzPe7IaGfRXH+U+E1DAUDPGKFruSbHzUxdFZ3
 PJ6gV/k4lru1DEGxZBiAUNqye6dJl9IjeKoUwNeGSgOwwm2Xv9S/7/yjbxQ0qn5Q+gxmJaFOSF4DX
 J25wu68dnmp8nH9w7uWn7Y6O4kQL/O6D7nnrkfa9Q=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBn-0003Dd-Do; Mon, 31 Oct 2022 20:15:19 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:25 +0000
Message-Id: <20221031201435.677168-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 04/14] mac_{old|new}world: Avoid else branch by setting default
 value
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Several variables are set in if-else branches where the else branch
can be removed by setting a default value at the variable declaration
which leads to simlpler code that is easier to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <8dac3515b29976a61dacda07752175d7531dca3c.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
2.30.2


