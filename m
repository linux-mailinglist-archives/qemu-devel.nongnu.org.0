Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A64882D3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:29:55 +0100 (CET)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n682s-0000tH-Au
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 04:29:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n67oS-0004BB-VI
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:15:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39178 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n67oQ-0000s3-MN
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:15:00 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMrrVdlhvLMAAA--.1341S25; 
 Sat, 08 Jan 2022 17:14:45 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 23/30] hw/loongarch: Add some devices support for
 3A5000.
Date: Sat,  8 Jan 2022 04:14:12 -0500
Message-Id: <20220108091419.2027710-24-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxKMrrVdlhvLMAAA--.1341S25
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4fGF1UKF15tr4rKw1UGFg_yoWxKFy7pF
 y5uas3Kr48tFsrXrZ3twnxurn8JFnakry7uaySy3s2kF4xtryqvr1kJa98tFWUAaykXF1Y
 gF95Gw1Sga1UAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1.Add uart,virtio-net,vga and usb for 3A5000.
2.Add irq set and map for the pci host. Non pci device
use irq 0-16, pci device use 16-64.
3.Add some unimplented device to emulate guest unused
memory space.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig       |  7 ++++
 hw/loongarch/loongson3.c   | 70 ++++++++++++++++++++++++++++++++++++++
 hw/pci-host/ls7a.c         | 42 ++++++++++++++++++++++-
 include/hw/pci-host/ls7a.h |  5 +++
 4 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 468e3acc74..e607c84d21 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -1,5 +1,12 @@
 config LOONGSON3_LS7A
     bool
+    imply VGA_PCI
+    imply VIRTIO_VGA
+    imply PCI_DEVICES
+    select ISA_BUS
+    select SERIAL
+    select SERIAL_ISA
+    select VIRTIO_PCI
     select PCI_EXPRESS_7A
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index cc7ee02003..85a4be0c7b 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -10,16 +10,20 @@
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/char/serial.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
+#include "hw/irq.h"
+#include "net/net.h"
 #include "hw/loongarch/loongarch.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
 #include "hw/intc/loongarch_pch_pic.h"
 #include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
+#include "hw/misc/unimp.h"
 
 static void loongarch_cpu_reset(void *opaque)
 {
@@ -97,6 +101,70 @@ static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
+static void loongarch_devices_init(DeviceState *pch_pic)
+{
+    DeviceState *pciehost;
+    SysBusDevice *d;
+    PCIBus *pci_bus;
+    MemoryRegion *pio_alias;
+    int i;
+
+    pciehost = qdev_new(TYPE_LS7A_HOST_DEVICE);
+    d = SYS_BUS_DEVICE(pciehost);
+    sysbus_realize_and_unref(d, &error_fatal);
+    pci_bus = PCI_HOST_BRIDGE(pciehost)->bus;
+
+    /* Map pcie ecam space */
+    memory_region_add_subregion(get_system_memory(), LS_PCIECFG_BASE,
+                                sysbus_mmio_get_region(d, 0));
+
+    /* Map PCI IO port space. */
+    pio_alias = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(pio_alias, OBJECT(pciehost), "ls7a-pci-io",
+                             sysbus_mmio_get_region(d, 1),
+                             LS7A_PCI_IO_OFFSET, LS7A_PCI_IO_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_IO_BASE,
+                                pio_alias);
+
+    /* Map PCI mem space */
+    memory_region_add_subregion(get_system_memory(), 0,
+                                sysbus_mmio_get_region(d, 2));
+
+    /* Map PCI conf space */
+    memory_region_add_subregion(get_system_memory(), HT1LO_PCICFG_BASE,
+                                sysbus_mmio_get_region(d, 3));
+
+    /* Connect 48 pci irqs to pch_pic */
+    for (i = 0; i < LS7A_PCI_IRQS; i++) {
+        qdev_connect_gpio_out(pciehost, i,
+                              qdev_get_gpio_in(pch_pic, i + LS7A_DEVICE_IRQS));
+    }
+
+    serial_mm_init(get_system_memory(), LS7A_UART_BASE, 0,
+                   qdev_get_gpio_in(pch_pic, LS7A_UART_IRQ - PCH_PIC_IRQ_OFFSET),
+                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+
+    /* Network init */
+    for (i = 0; i < nb_nics; i++) {
+        NICInfo *nd = &nd_table[i];
+
+        if (!nd->model) {
+            nd->model = g_strdup("virtio");
+        }
+
+        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
+    }
+
+    /* VGA setup */
+    pci_vga_init(pci_bus);
+
+    /*
+     * There are some invalid guest memory access.
+     * Create some unimplemented devices to emulate this.
+     */
+    create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
+}
+
 static void loongarch_irq_init(LoongArchMachineState *lams)
 {
     MachineState *ms = MACHINE(lams);
@@ -173,6 +241,8 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
         sysbus_connect_irq(d, i,
                            qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
     }
+
+    loongarch_devices_init(pch_pic);
 }
 
 static void loongarch_init(MachineState *machine)
diff --git a/hw/pci-host/ls7a.c b/hw/pci-host/ls7a.c
index eb16b669bb..c1e08e2356 100644
--- a/hw/pci-host/ls7a.c
+++ b/hw/pci-host/ls7a.c
@@ -28,6 +28,41 @@ static const VMStateDescription vmstate_ls7a_pcie = {
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
+    int offset, irq;
+
+    bus = pci_get_bus(d);
+    if (bus->parent_dev) {
+        irq = pci_swizzle_map_irq_fn(d, irq_num);
+        return irq;
+    }
+
+    /* pci device start from irq 80 */
+    offset = PCH_PIC_IRQ_OFFSET + LS7A_DEVICE_IRQS;
+    irq = offset + ((PCI_SLOT(d->devfn) * 4 + irq_num)) % LS7A_PCI_IRQS;
+
+    return irq;
+}
+
+static void pci_ls7a_set_irq(void *opaque, int irq_num, int level)
+{
+    LS7APCIEHost *pciehost = opaque;
+    int offset = PCH_PIC_IRQ_OFFSET + LS7A_DEVICE_IRQS;
+
+    qemu_set_irq(pciehost->irqs[irq_num - offset], level);
+}
+
 static void pci_ls7a_config_write(void *opaque, hwaddr addr,
                                   uint64_t val, unsigned size)
 {
@@ -74,10 +109,13 @@ static void ls7a_pciehost_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->pci_io);
     sysbus_init_mmio(sbd, &s->pci_mmio);
 
-    pci->bus = pci_register_root_bus(dev, "pcie.0", NULL, NULL, s,
+    pci->bus = pci_register_root_bus(dev, "pcie.0", pci_ls7a_set_irq,
+                                     pci_ls7a_map_irq, s,
                                      &s->pci_mmio, &s->pci_io,
                                      PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);
 
+    pci_bus_set_route_irq_fn(pci->bus, ls7a_route_intx_pin_to_irq);
+
     memory_region_init_io(&s->pci_conf, OBJECT(dev),
                           &pci_ls7a_config_ops, pci->bus,
                           "ls7a_pci_conf", HT1LO_PCICFG_SIZE);
@@ -141,6 +179,8 @@ static void ls7a_pciehost_initfn(Object *obj)
     object_initialize_child(obj, "ls7a_pci", ls7a_pci, TYPE_LS7A_PCI_DEVICE);
     qdev_prop_set_int32(DEVICE(ls7a_pci), "addr", PCI_DEVFN(0, 0));
     qdev_prop_set_bit(DEVICE(ls7a_pci), "multifunction", false);
+
+    qdev_init_gpio_out(DEVICE(obj), s->irqs, LS7A_PCI_IRQS);
 }
 
 static const char *ls7a_pciehost_root_bus_path(PCIHostState *host_bridge,
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 447450828e..cfa990ff8a 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -23,6 +23,7 @@
 
 #define LS7A_PCI_IO_BASE         0x18004000UL
 #define LS7A_PCI_IO_SIZE         0xC000
+#define LS7A_PCI_IO_OFFSET       0x4000
 
 #define LS7A_PCH_REG_BASE       0x10000000UL
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
@@ -37,6 +38,9 @@
 #define LS7A_DEVICE_IRQS        16
 #define LS7A_PCI_IRQS           48
 
+#define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
+#define LS7A_UART_BASE          0x1fe001e0
+
 struct LS7APCIState {
     /*< private >*/
     PCIDevice parent_obj;
@@ -51,6 +55,7 @@ typedef struct LS7APCIEHost {
 
     LS7APCIState pci_dev;
 
+    qemu_irq irqs[LS7A_PCI_IRQS];
     MemoryRegion pci_conf;
     MemoryRegion pci_mmio;
     MemoryRegion pci_io;
-- 
2.27.0


