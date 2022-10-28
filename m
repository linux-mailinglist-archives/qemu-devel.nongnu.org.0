Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6B611029
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:57:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNyw-0001wy-9q; Fri, 28 Oct 2022 07:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNya-0001jF-1F; Fri, 28 Oct 2022 07:56:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNyK-0006LK-SF; Fri, 28 Oct 2022 07:56:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8A88175A162;
 Fri, 28 Oct 2022 13:56:22 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5680E75A156; Fri, 28 Oct 2022 13:56:22 +0200 (CEST)
Message-Id: <f701e5ae03c806969561a7fd7523ef407db6dc89.1666957578.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666957578.git.balaton@eik.bme.hu>
References: <cover.1666957578.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 06/19] mac_{old|new}world: Reduce number of QOM casts
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri, 28 Oct 2022 13:56:22 +0200 (CEST)
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

By storing the device pointers in a variable with the right type the
number of QOM casts can be reduced which also makes the code more
readable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 61 ++++++++++++++++++++-----------------------
 hw/ppc/mac_oldworld.c | 26 ++++++++----------
 2 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e2f456b547..4bfffa586b 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -116,18 +116,16 @@ static void ppc_core99_init(MachineState *machine)
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
     long kernel_size = 0, initrd_size = 0;
-    UNINHostState *uninorth_pci;
     PCIBus *pci_bus;
-    PCIDevice *macio;
-    ESCCState *escc;
     bool has_pmu, has_adb;
+    Object *macio;
     MACIOIDEState *macio_ide;
     BusState *adb_bus;
     MacIONVRAMState *nvr;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     SysBusDevice *s;
-    DeviceState *dev, *pic_dev;
+    DeviceState *dev, *pic_dev, *uninorth_pci_dev;
     DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
     hwaddr nvram_addr = 0xFFF04000;
     uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
@@ -229,6 +227,7 @@ static void ppc_core99_init(MachineState *machine)
     }
 
     openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
+    dev = DEVICE(cpu);
     for (i = 0; i < machine->smp.cpus; i++) {
         /* Mac99 IRQ connection between OpenPIC outputs pins
          * and PowerPC input pins
@@ -236,30 +235,30 @@ static void ppc_core99_init(MachineState *machine)
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
             openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
+                qdev_get_gpio_in(dev, PPC6xx_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
-                 qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
+                 qdev_get_gpio_in(dev, PPC6xx_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_MCP);
+                qdev_get_gpio_in(dev, PPC6xx_INPUT_MCP);
             /* Not connected ? */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
             /* Check this */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
+                qdev_get_gpio_in(dev, PPC6xx_INPUT_HRESET);
             break;
 #if defined(TARGET_PPC64)
         case PPC_FLAGS_INPUT_970:
             openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
+                qdev_get_gpio_in(dev, PPC970_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
+                qdev_get_gpio_in(dev, PPC970_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_MCP);
+                qdev_get_gpio_in(dev, PPC970_INPUT_MCP);
             /* Not connected ? */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
             /* Check this */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
-                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_HRESET);
+                qdev_get_gpio_in(dev, PPC970_INPUT_HRESET);
             break;
 #endif /* defined(TARGET_PPC64) */
         default:
@@ -278,9 +277,8 @@ static void ppc_core99_init(MachineState *machine)
         machine_arch = ARCH_MAC99_U3;
         /* 970 gets a U3 bus */
         /* Uninorth AGP bus */
-        dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
-        uninorth_pci = U3_AGP_HOST_BRIDGE(dev);
-        s = SYS_BUS_DEVICE(dev);
+        uninorth_pci_dev = qdev_new(TYPE_U3_AGP_HOST_BRIDGE);
+        s = SYS_BUS_DEVICE(uninorth_pci_dev);
         sysbus_realize_and_unref(s, &error_fatal);
         sysbus_mmio_map(s, 0, 0xf0800000);
         sysbus_mmio_map(s, 1, 0xf0c00000);
@@ -309,10 +307,9 @@ static void ppc_core99_init(MachineState *machine)
         sysbus_mmio_map(s, 1, 0xf4c00000);
 
         /* Uninorth main bus - this must be last to make it the default */
-        dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
-        qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
-        uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
-        s = SYS_BUS_DEVICE(dev);
+        uninorth_pci_dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
+        qdev_prop_set_uint32(uninorth_pci_dev, "ofw-addr", 0xf2000000);
+        s = SYS_BUS_DEVICE(uninorth_pci_dev);
         sysbus_realize_and_unref(s, &error_fatal);
         sysbus_mmio_map(s, 0, 0xf2800000);
         sysbus_mmio_map(s, 1, 0xf2c00000);
@@ -330,24 +327,24 @@ static void ppc_core99_init(MachineState *machine)
                core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB);
 
     /* init basic PC hardware */
-    pci_bus = PCI_HOST_BRIDGE(uninorth_pci)->bus;
+    pci_bus = PCI_HOST_BRIDGE(uninorth_pci_dev)->bus;
 
     /* MacIO */
-    macio = pci_new(-1, TYPE_NEWWORLD_MACIO);
+    macio = OBJECT(pci_new(-1, TYPE_NEWWORLD_MACIO));
     dev = DEVICE(macio);
     qdev_prop_set_uint64(dev, "frequency", tbfreq);
     qdev_prop_set_bit(dev, "has-pmu", has_pmu);
     qdev_prop_set_bit(dev, "has-adb", has_adb);
 
-    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
-    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
-    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
+    dev = DEVICE(object_resolve_path_component(macio, "escc"));
+    qdev_prop_set_chr(dev, "chrA", serial_hd(0));
+    qdev_prop_set_chr(dev, "chrB", serial_hd(1));
 
-    pci_realize_and_unref(macio, pci_bus, &error_fatal);
+    pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
 
-    pic_dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pic"));
+    pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
     for (i = 0; i < 4; i++) {
-        qdev_connect_gpio_out(DEVICE(uninorth_pci), i,
+        qdev_connect_gpio_out(uninorth_pci_dev, i,
                               qdev_get_gpio_in(pic_dev, 0x1b + i));
     }
 
@@ -379,19 +376,17 @@ static void ppc_core99_init(MachineState *machine)
     /* We only emulate 2 out of 3 IDE controllers for now */
     ide_drive_get(hd, ARRAY_SIZE(hd));
 
-    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
-                                                        "ide[0]"));
+    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[0]"));
     macio_ide_init_drives(macio_ide, hd);
 
-    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
-                                                        "ide[1]"));
+    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[1]"));
     macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
 
     if (has_adb) {
         if (has_pmu) {
-            dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pmu"));
+            dev = DEVICE(object_resolve_path_component(macio, "pmu"));
         } else {
-            dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
+            dev = DEVICE(object_resolve_path_component(macio, "cuda"));
         }
 
         adb_bus = qdev_get_child_bus(dev, "adb.0");
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index cb67e44081..a497507f1d 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -90,9 +90,8 @@ static void ppc_heathrow_init(MachineState *machine)
     uint32_t kernel_base = 0, initrd_base = 0, cmdline_base = 0;
     int32_t kernel_size = 0, initrd_size = 0;
     PCIBus *pci_bus;
-    PCIDevice *macio;
+    Object *macio;
     MACIOIDEState *macio_ide;
-    ESCCState *escc;
     SysBusDevice *s;
     DeviceState *dev, *pic_dev, *grackle_dev;
     BusState *adb_bus;
@@ -231,17 +230,16 @@ static void ppc_heathrow_init(MachineState *machine)
     pci_bus = PCI_HOST_BRIDGE(grackle_dev)->bus;
 
     /* MacIO */
-    macio = pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO);
-    dev = DEVICE(macio);
-    qdev_prop_set_uint64(dev, "frequency", tbfreq);
+    macio = OBJECT(pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO));
+    qdev_prop_set_uint64(DEVICE(macio), "frequency", tbfreq);
 
-    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
-    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
-    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
+    dev = DEVICE(object_resolve_path_component(macio, "escc"));
+    qdev_prop_set_chr(dev, "chrA", serial_hd(0));
+    qdev_prop_set_chr(dev, "chrB", serial_hd(1));
 
-    pci_realize_and_unref(macio, pci_bus, &error_fatal);
+    pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
 
-    pic_dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pic"));
+    pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
     for (i = 0; i < 4; i++) {
         qdev_connect_gpio_out(grackle_dev, i,
                               qdev_get_gpio_in(pic_dev, 0x15 + i));
@@ -269,16 +267,14 @@ static void ppc_heathrow_init(MachineState *machine)
 
     /* MacIO IDE */
     ide_drive_get(hd, ARRAY_SIZE(hd));
-    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
-                                                        "ide[0]"));
+    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[0]"));
     macio_ide_init_drives(macio_ide, hd);
 
-    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
-                                                        "ide[1]"));
+    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[1]"));
     macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
 
     /* MacIO CUDA/ADB */
-    dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
+    dev = DEVICE(object_resolve_path_component(macio, "cuda"));
     adb_bus = qdev_get_child_bus(dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
     qdev_realize_and_unref(dev, adb_bus, &error_fatal);
-- 
2.30.6


