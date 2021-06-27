Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00683B546A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 18:43:20 +0200 (CEST)
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxXsN-00017Q-M6
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 12:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoa-0002Km-4Y; Sun, 27 Jun 2021 12:39:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoM-0007mv-Jt; Sun, 27 Jun 2021 12:39:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BECEB746344;
 Sun, 27 Jun 2021 18:39:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 494097457F0; Sun, 27 Jun 2021 18:39:07 +0200 (CEST)
Message-Id: <7f6d5fbf4f70c64dba001483174a2921dd616ecd.1624811233.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1624811233.git.balaton@eik.bme.hu>
References: <cover.1624811233.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/4] ppc/pegasos2: Introduce Pegasos2MachineState structure
Date: Sun, 27 Jun 2021 18:27:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add own machine state structure which will be used to store state
needed for firmware emulation.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/pegasos2.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 0bfd0928aa..07971175c9 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
  *
- * Copyright (c) 2018-2020 BALATON Zoltan
+ * Copyright (c) 2018-2021 BALATON Zoltan
  *
  * This work is licensed under the GNU GPL license version 2 or later.
  *
@@ -41,6 +41,15 @@
 
 #define BUS_FREQ_HZ 133333333
 
+#define TYPE_PEGASOS2_MACHINE  MACHINE_TYPE_NAME("pegasos2")
+OBJECT_DECLARE_TYPE(Pegasos2MachineState, MachineClass, PEGASOS2_MACHINE)
+
+struct Pegasos2MachineState {
+    MachineState parent_obj;
+    PowerPCCPU *cpu;
+    DeviceState *mv;
+};
+
 static void pegasos2_cpu_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
@@ -51,9 +60,9 @@ static void pegasos2_cpu_reset(void *opaque)
 
 static void pegasos2_init(MachineState *machine)
 {
-    PowerPCCPU *cpu = NULL;
+    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
+    CPUPPCState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
-    DeviceState *mv;
     PCIBus *pci_bus;
     PCIDevice *dev;
     I2CBus *i2c_bus;
@@ -63,15 +72,16 @@ static void pegasos2_init(MachineState *machine)
     uint8_t *spd_data;
 
     /* init CPU */
-    cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
-    if (PPC_INPUT(&cpu->env) != PPC_FLAGS_INPUT_6xx) {
+    pm->cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
+    env = &pm->cpu->env;
+    if (PPC_INPUT(env) != PPC_FLAGS_INPUT_6xx) {
         error_report("Incompatible CPU, only 6xx bus supported");
         exit(1);
     }
 
     /* Set time-base frequency */
-    cpu_ppc_tb_init(&cpu->env, BUS_FREQ_HZ / 4);
-    qemu_register_reset(pegasos2_cpu_reset, cpu);
+    cpu_ppc_tb_init(env, BUS_FREQ_HZ / 4);
+    qemu_register_reset(pegasos2_cpu_reset, pm->cpu);
 
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
@@ -96,16 +106,16 @@ static void pegasos2_init(MachineState *machine)
     g_free(filename);
 
     /* Marvell Discovery II system controller */
-    mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
-                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INPUT_INT]));
-    pci_bus = mv64361_get_pci_bus(mv, 1);
+    pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
+                             ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]));
+    pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     /* VT8231 function 0: PCI-to-ISA Bridge */
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
     qdev_connect_gpio_out(DEVICE(dev), 0,
-                          qdev_get_gpio_in_named(mv, "gpp", 31));
+                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
     /* VT8231 function 1: IDE Controller */
     dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
@@ -129,8 +139,10 @@ static void pegasos2_init(MachineState *machine)
     pci_vga_init(pci_bus);
 }
 
-static void pegasos2_machine(MachineClass *mc)
+static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Genesi/bPlan Pegasos II";
     mc->init = pegasos2_init;
     mc->block_default_type = IF_IDE;
@@ -141,4 +153,16 @@ static void pegasos2_machine(MachineClass *mc)
     mc->default_ram_size = 512 * MiB;
 }
 
-DEFINE_MACHINE("pegasos2", pegasos2_machine)
+static const TypeInfo pegasos2_machine_info = {
+    .name          = TYPE_PEGASOS2_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .class_init    = pegasos2_machine_class_init,
+    .instance_size = sizeof(Pegasos2MachineState),
+};
+
+static void pegasos2_machine_register_types(void)
+{
+    type_register_static(&pegasos2_machine_info);
+}
+
+type_init(pegasos2_machine_register_types)
-- 
2.21.4


