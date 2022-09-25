Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF95E9339
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:54:54 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocR9p-0002qN-E1
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQtk-00066x-1v; Sun, 25 Sep 2022 08:38:16 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocQth-0007IJ-PB; Sun, 25 Sep 2022 08:38:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 343AF75A166;
 Sun, 25 Sep 2022 14:38:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0AFD275A165; Sun, 25 Sep 2022 14:38:09 +0200 (CEST)
Message-Id: <ca9501991f48cd74de706d6fe0d56693a237cba0.1664108862.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664108862.git.balaton@eik.bme.hu>
References: <cover.1664108862.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 02/13] mac_oldworld: Drop some more variables
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sun, 25 Sep 2022 14:38:09 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Drop some more local variables additionally to commit b8df32555ce5 to
match clean ups done to mac_newwold in previous patch.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_oldworld.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 03732ca7ed..86512d31ad 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -80,14 +80,13 @@ static void ppc_heathrow_reset(void *opaque)
 
 static void ppc_heathrow_init(MachineState *machine)
 {
-    ram_addr_t ram_size = machine->ram_size;
     const char *bios_name = machine->firmware ?: PROM_FILENAME;
-    const char *boot_device = machine->boot_config.order;
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
-    int i;
+    int i, bios_size;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
+    uint64_t bios_addr;
     uint32_t kernel_base, initrd_base, cmdline_base = 0;
     int32_t kernel_size, initrd_size;
     PCIBus *pci_bus;
@@ -97,16 +96,13 @@ static void ppc_heathrow_init(MachineState *machine)
     SysBusDevice *s;
     DeviceState *dev, *pic_dev, *grackle_dev;
     BusState *adb_bus;
-    uint64_t bios_addr;
-    int bios_size;
-    unsigned int smp_cpus = machine->smp.cpus;
     uint16_t ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     uint64_t tbfreq;
 
     /* init CPUs */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
@@ -116,9 +112,9 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     /* allocate RAM */
-    if (ram_size > 2047 * MiB) {
+    if (machine->ram_size > 2047 * MiB) {
         error_report("Too much memory for this machine: %" PRId64 " MB, "
-                     "maximum 2047 MB", ram_size / MiB);
+                     "maximum 2047 MB", machine->ram_size / MiB);
         exit(1);
     }
 
@@ -165,12 +161,12 @@ static void ppc_heathrow_init(MachineState *machine)
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
         if (kernel_size < 0)
             kernel_size = load_aout(machine->kernel_filename, kernel_base,
-                                    ram_size - kernel_base, bswap_needed,
-                                    TARGET_PAGE_SIZE);
+                                    machine->ram_size - kernel_base,
+                                    bswap_needed, TARGET_PAGE_SIZE);
         if (kernel_size < 0)
             kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
-                                              ram_size - kernel_base);
+                                              machine->ram_size - kernel_base);
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
@@ -182,7 +178,7 @@ static void ppc_heathrow_init(MachineState *machine)
                                             KERNEL_GAP);
             initrd_size = load_image_targphys(machine->initrd_filename,
                                               initrd_base,
-                                              ram_size - initrd_base);
+                                              machine->ram_size - initrd_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
                              machine->initrd_filename);
@@ -201,19 +197,22 @@ static void ppc_heathrow_init(MachineState *machine)
         initrd_base = 0;
         initrd_size = 0;
         ppc_boot_device = '\0';
-        for (i = 0; boot_device[i] != '\0'; i++) {
-            /* TOFIX: for now, the second IDE channel is not properly
+        for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
+            /*
+             * TOFIX: for now, the second IDE channel is not properly
              *        used by OHW. The Mac floppy disk are not emulated.
              *        For now, OHW cannot boot from the network.
              */
 #if 0
-            if (boot_device[i] >= 'a' && boot_device[i] <= 'f') {
-                ppc_boot_device = boot_device[i];
+            if (machine->boot_config.order[i] >= 'a' &&
+                machine->boot_config.order[i] <= 'f') {
+                ppc_boot_device = machine->boot_config.order[i];
                 break;
             }
 #else
-            if (boot_device[i] >= 'c' && boot_device[i] <= 'd') {
-                ppc_boot_device = boot_device[i];
+            if (machine->boot_config.order[i] >= 'c' &&
+                machine->boot_config.order[i] <= 'd') {
+                ppc_boot_device = machine->boot_config.order[i];
                 break;
             }
 #endif
@@ -266,7 +265,7 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     /* Connect the heathrow PIC outputs to the 6xx bus */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
             /* XXX: we register only 1 output pin for heathrow PIC */
@@ -323,9 +322,9 @@ static void ppc_heathrow_init(MachineState *machine)
     sysbus_mmio_map(s, 0, CFG_ADDR);
     sysbus_mmio_map(s, 1, CFG_ADDR + 2);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_HEATHROW);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-- 
2.30.4


