Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF444CF6C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:01:29 +0100 (CET)
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzP6-0007Us-Df
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:01:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0m-0006WS-NJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54256 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0k-0001qa-Ff
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:20 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S25; 
 Thu, 11 Nov 2021 09:36:05 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 23/30] hw/loongarch: Add some devices support for
 3A5000.
Date: Thu, 11 Nov 2021 09:35:21 +0800
Message-Id: <1636594528-8175-24-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S25
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr43Wr47Ar4rKr17CrykKrg_yoWxKw4UpF
 s8CFs8tF48KrsruFZ3J347ZF15Xan7G343Zr4xC348KFWqyryqyr1kt3y2yFyUJFZ8XF1Y
 9Fyvk3WIga1UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1.Add uart,virtio-net,vga and usb for 3A5000.
2.Add irq set and map for the pci host. Non pci device
use irq 0-16, pci device use 16-31.
3.Add some unimplented device to emulate guest unused
memory space.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig         |  8 ++++++
 hw/loongarch/ls3a5000_virt.c | 49 ++++++++++++++++++++++++++++++++++++
 hw/pci-host/ls7a.c           | 38 ++++++++++++++++++++++++++--
 include/hw/pci-host/ls7a.h   |  4 +++
 softmmu/qdev-monitor.c       |  3 ++-
 5 files changed, 99 insertions(+), 3 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 9212127701..e5f85d9c7f 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -1,5 +1,13 @@
 config LOONGSON_3A5000
     bool
+    imply VGA_PCI
+    imply VIRTIO_VGA
+    imply PARALLEL
+    imply PCI_DEVICES
+    select ISA_BUS
+    select SERIAL
+    select SERIAL_ISA
+    select VIRTIO_PCI
     select PCI_EXPRESS_7A
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 59a79807e0..f780cca608 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -10,8 +10,11 @@
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/char/serial.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
+#include "hw/irq.h"
+#include "net/net.h"
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
 #include "hw/loongarch/loongarch.h"
@@ -19,6 +22,7 @@
 #include "hw/intc/loongarch_pch_pic.h"
 #include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
+#include "hw/misc/unimp.h"
 
 CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
 
@@ -150,6 +154,10 @@ static void ls3a5000_irq_init(MachineState *machine, CPULoongArchState *env[])
     sysbus_realize_and_unref(d, &error_fatal);
     sysbus_mmio_map(d, 0, LS7A_IOAPIC_REG_BASE);
 
+    serial_mm_init(get_system_memory(), LS7A_UART_BASE, 0,
+                   qdev_get_gpio_in(pch_pic, LS7A_UART_IRQ - 64),
+                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+
     for (int i = 0; i < 32; i++) {
         sysbus_connect_irq(d, i, lams->pch_irq[i]);
     }
@@ -163,6 +171,22 @@ static void ls3a5000_irq_init(MachineState *machine, CPULoongArchState *env[])
     }
 }
 
+/* Network support */
+static void network_init(PCIBus *pci_bus)
+{
+    int i;
+
+    for (i = 0; i < nb_nics; i++) {
+        NICInfo *nd = &nd_table[i];
+
+        if (!nd->model) {
+            nd->model = g_strdup("virtio");
+        }
+
+        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
+    }
+}
+
 static void ls3a5000_virt_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -176,6 +200,7 @@ static void ls3a5000_virt_init(MachineState *machine)
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
     MemoryRegion *iomem = NULL;
+    PCIBus *pci_bus = NULL;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -240,9 +265,33 @@ static void ls3a5000_virt_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem,
                                 PM_MMIO_ADDR, iomem);
 
+    /*
+     * There are some invalid guest memory access.
+     * Create some unimplemented devices to emulate this.
+     */
+    create_unimplemented_device("ls7a-lpc", 0x10002000, 0x14);
+    create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
+    create_unimplemented_device("node-bridge", 0xEFDFB000274, 0x4);
+    create_unimplemented_device("ls7a-lionlpc", 0x1fe01400, 0x38);
+    create_unimplemented_device("ls7a-node0", 0x0EFDFB000274, 0x4);
+    create_unimplemented_device("ls7a-node1", 0x1EFDFB000274, 0x4);
+    create_unimplemented_device("ls7a-node2", 0x2EFDFB000274, 0x4);
+    create_unimplemented_device("ls7a-node3", 0x3EFDFB000274, 0x4);
+
     /* Initialize the IO interrupt subsystem */
     ls3a5000_irq_init(machine, cpu_states);
 
+    /* Init the north bridge */
+    pci_bus = ls7a_init(machine, lams->pch_irq);
+
+    /* Network card */
+    network_init(pci_bus);
+
+    /* VGA setup. Don't bother loading the bios. */
+    pci_vga_init(pci_bus);
+
+    pci_create_simple(pci_bus, -1, "pci-ohci");
+
     LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
     LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
     LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
diff --git a/hw/pci-host/ls7a.c b/hw/pci-host/ls7a.c
index 90b9fe4830..294715801f 100644
--- a/hw/pci-host/ls7a.c
+++ b/hw/pci-host/ls7a.c
@@ -27,6 +27,38 @@ static const VMStateDescription vmstate_ls7a_pcie = {
     }
 };
 
+static PCIINTxRoute ls7a_route_intx_pin_to_irq(void *opaque, int pin)
+{
+    PCIINTxRoute route;
+
+    route.irq = pin;
+    route.mode = PCI_INTX_ENABLED;
+    return route;
+}
+
+static int pci_ls7a_map_irq(PCIDevice *d, int irq_num)
+{
+    PCIBus *bus;
+    int irq;
+
+    bus = pci_get_bus(d);
+    if (bus->parent_dev) {
+        irq = pci_swizzle_map_irq_fn(d, irq_num);
+        return irq;
+     }
+
+     irq = 64 + 16 + ((PCI_SLOT(d->devfn) * 4 + irq_num) & 0xf);
+
+    return irq;
+}
+
+static void pci_ls7a_set_irq(void *opaque, int irq_num, int level)
+{
+    LS7APCIEHost *pciehost = opaque;
+
+    qemu_set_irq(pciehost->pic[irq_num - 64], level);
+}
+
 static void pci_ls7a_config_write(void *opaque, hwaddr addr,
                                   uint64_t val, unsigned size)
 {
@@ -63,11 +95,13 @@ static void ls7a_pciehost_realize(DeviceState *dev, Error **errp)
     PCIExpressHost *e = PCIE_HOST_BRIDGE(dev);
     PCIHostState *phb = PCI_HOST_BRIDGE(e);
 
-    phb->bus = pci_register_root_bus(dev, "pcie.0", NULL,
-                                     NULL, pciehost,
+    phb->bus = pci_register_root_bus(dev, "pcie.0", pci_ls7a_set_irq,
+                                     pci_ls7a_map_irq, pciehost,
                                      get_system_memory(), get_system_io(),
                                      PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);
 
+    pci_bus_set_route_irq_fn(phb->bus, ls7a_route_intx_pin_to_irq);
+
     memory_region_init_io(&pciehost->pci_conf, OBJECT(dev),
                           &pci_ls7a_config_ops, phb->bus,
                           "ls7a_pci_conf", HT1LO_PCICFG_SIZE);
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index b57277f206..96c9d22f33 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -27,6 +27,10 @@
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
 #define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
 
+#define LOONGARCH_PCH_IRQ_BASE  64
+#define LS7A_UART_IRQ           (LOONGARCH_PCH_IRQ_BASE + 2)
+#define LS7A_UART_BASE          0x1fe001e0
+
 typedef struct LS7APCIState LS7APCIState;
 typedef struct LS7APCIEHost {
     PCIExpressHost parent_obj;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index f8b3a4cd82..e2402d1b81 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,7 +60,8 @@ typedef struct QDevAlias
                               QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
                               QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
                               QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
-                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA | \
+                              QEMU_ARCH_LOONGARCH)
 #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
 #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
 
-- 
2.27.0


