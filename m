Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0105F3787
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:14:14 +0200 (CEST)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSlR-0007zX-F1
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoh-00055f-Am; Mon, 03 Oct 2022 16:13:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoa-0000xs-Mb; Mon, 03 Oct 2022 16:13:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 393B7746335;
 Mon,  3 Oct 2022 22:13:15 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EB568746324; Mon,  3 Oct 2022 22:13:14 +0200 (CEST)
Message-Id: <d86b51ad0582205d3b2e9e30f15a1490343aad0f.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 01/13] mac_newworld: Drop some variables
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:14 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Values not used frequently enough may not worth putting in a local
variable, especially with names almost as long as the original value
because that does not improve readability, to the contrary it makes it
harder to see what value is used. Drop a few such variables. This is
the same clean up that was done for mac_oldworld in commit b8df32555ce5.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 65 +++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index cf7eb72391..27e4e8d136 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -106,18 +106,13 @@ static void ppc_core99_reset(void *opaque)
 /* PowerPC Mac99 hardware initialisation */
 static void ppc_core99_init(MachineState *machine)
 {
-    ram_addr_t ram_size = machine->ram_size;
-    const char *bios_name = machine->firmware ?: PROM_FILENAME;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
-    const char *boot_device = machine->boot_config.order;
     Core99MachineState *core99_machine = CORE99_MACHINE(machine);
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
     IrqLines *openpic_irqs;
-    int linux_boot, i, j, k;
+    int i, j, k, ppc_boot_device, machine_arch, bios_size;
+    const char *bios_name = machine->firmware ?: PROM_FILENAME;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     hwaddr kernel_base, initrd_base, cmdline_base = 0;
     long kernel_size, initrd_size;
@@ -129,22 +124,16 @@ static void ppc_core99_init(MachineState *machine)
     MACIOIDEState *macio_ide;
     BusState *adb_bus;
     MacIONVRAMState *nvr;
-    int bios_size;
-    int ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
-    int machine_arch;
     SysBusDevice *s;
     DeviceState *dev, *pic_dev;
     DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
     hwaddr nvram_addr = 0xFFF04000;
     uint64_t tbfreq;
-    unsigned int smp_cpus = machine->smp.cpus;
-
-    linux_boot = (kernel_filename != NULL);
 
     /* init CPUs */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
@@ -184,7 +173,7 @@ static void ppc_core99_init(MachineState *machine)
         exit(1);
     }
 
-    if (linux_boot) {
+    if (machine->kernel_filename) {
         int bswap_needed;
 
 #ifdef BSWAP_NEEDED
@@ -194,29 +183,31 @@ static void ppc_core99_init(MachineState *machine)
 #endif
         kernel_base = KERNEL_LOAD_ADDR;
 
-        kernel_size = load_elf(kernel_filename, NULL,
+        kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
         if (kernel_size < 0)
-            kernel_size = load_aout(kernel_filename, kernel_base,
-                                    ram_size - kernel_base, bswap_needed,
-                                    TARGET_PAGE_SIZE);
+            kernel_size = load_aout(machine->kernel_filename, kernel_base,
+                                    machine->ram_size - kernel_base,
+                                    bswap_needed, TARGET_PAGE_SIZE);
         if (kernel_size < 0)
-            kernel_size = load_image_targphys(kernel_filename,
+            kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
-                                              ram_size - kernel_base);
+                                              machine->ram_size - kernel_base);
         if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
+            error_report("could not load kernel '%s'",
+                         machine->kernel_filename);
             exit(1);
         }
         /* load initrd */
-        if (initrd_filename) {
+        if (machine->initrd_filename) {
             initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
-            initrd_size = load_image_targphys(initrd_filename, initrd_base,
-                                              ram_size - initrd_base);
+            initrd_size = load_image_targphys(machine->initrd_filename,
+                                              initrd_base,
+                                              machine->ram_size - initrd_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
+                             machine->initrd_filename);
                 exit(1);
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
@@ -235,9 +226,10 @@ static void ppc_core99_init(MachineState *machine)
         /* We consider that NewWorld PowerMac never have any floppy drive
          * For now, OHW cannot boot from the network.
          */
-        for (i = 0; boot_device[i] != '\0'; i++) {
-            if (boot_device[i] >= 'c' && boot_device[i] <= 'f') {
-                ppc_boot_device = boot_device[i];
+        for (i = 0; machine->boot_config.order[i] != '\0'; i++) {
+            if (machine->boot_config.order[i] >= 'c' &&
+                machine->boot_config.order[i] <= 'f') {
+                ppc_boot_device = machine->boot_config.order[i];
                 break;
             }
         }
@@ -254,8 +246,8 @@ static void ppc_core99_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), 0xf8000000,
                                 sysbus_mmio_get_region(s, 0));
 
-    openpic_irqs = g_new0(IrqLines, smp_cpus);
-    for (i = 0; i < smp_cpus; i++) {
+    openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
+    for (i = 0; i < machine->smp.cpus; i++) {
         /* Mac99 IRQ connection between OpenPIC outputs pins
          * and PowerPC input pins
          */
@@ -398,7 +390,7 @@ static void ppc_core99_init(MachineState *machine)
     /* OpenPIC */
     s = SYS_BUS_DEVICE(pic_dev);
     k = 0;
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < machine->smp.cpus; i++) {
         for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
             sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
         }
@@ -480,15 +472,16 @@ static void ppc_core99_init(MachineState *machine)
     sysbus_mmio_map(s, 0, CFG_ADDR);
     sysbus_mmio_map(s, 1, CFG_ADDR + 2);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, machine_arch);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    if (kernel_cmdline) {
+    if (machine->kernel_cmdline) {
         fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_CMDLINE, cmdline_base);
-        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE, kernel_cmdline);
+        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE,
+                         machine->kernel_cmdline);
     } else {
         fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_CMDLINE, 0);
     }
-- 
2.30.4


