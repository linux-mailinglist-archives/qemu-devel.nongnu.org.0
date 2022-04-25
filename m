Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8AF50DD73
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:01:11 +0200 (CEST)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivWo-0001eS-6T
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukg-0008PQ-9P
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39800 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukc-0001NO-O0
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:26 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S39; 
 Mon, 25 Apr 2022 17:10:59 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/43] hw/loongarch: Add some devices support for 3A5000.
Date: Mon, 25 Apr 2022 17:10:21 +0800
Message-Id: <20220425091027.2877892-38-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S39
X-Coremail-Antispam: 1UD129KBjvJXoW3JFWrAw43ur17CFW7uFW3Wrg_yoW7Ww13pF
 15Ca95CrW8tFsrXr93tr1fWF15Xan7Ga47uaySva4vkr1xCr1DZw4kKayDtFWUJFWkXryY
 gFykGwnag3WUZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
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
 hw/loongarch/loongson3.c   | 77 ++++++++++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h |  8 ++++
 3 files changed, 92 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index f779087416..8552ff4bee 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,6 +2,13 @@ config LOONGARCH_VIRT
     bool
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
+    imply VGA_PCI
+    imply VIRTIO_VGA
+    imply PCI_DEVICES
+    select ISA_BUS
+    select SERIAL
+    select SERIAL_ISA
+    select VIRTIO_PCI
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 4906f9926b..92c353263e 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -9,6 +9,7 @@
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/char/serial.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
@@ -16,14 +17,88 @@
 #include "sysemu/rtc.h"
 #include "hw/loongarch/virt.h"
 #include "exec/address-spaces.h"
+#include "hw/irq.h"
+#include "net/net.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
 #include "hw/intc/loongarch_pch_pic.h"
 #include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/misc/unimp.h"
 
 #include "target/loongarch/cpu.h"
 
+static void loongarch_devices_init(DeviceState *pch_pic)
+{
+    DeviceState *gpex_dev;
+    SysBusDevice *d;
+    PCIBus *pci_bus;
+    MemoryRegion *ecam_alias, *ecam_reg, *pio_alias, *pio_reg;
+    MemoryRegion *mmio_alias, *mmio_reg;
+    int i;
+
+    gpex_dev = qdev_new(TYPE_GPEX_HOST);
+    d = SYS_BUS_DEVICE(gpex_dev);
+    sysbus_realize_and_unref(d, &error_fatal);
+    pci_bus = PCI_HOST_BRIDGE(gpex_dev)->bus;
+
+    /* Map only part size_ecam bytes of ECAM space */
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(d, 0);
+    memory_region_init_alias(ecam_alias, OBJECT(gpex_dev), "pcie-ecam",
+                             ecam_reg, 0, LS_PCIECFG_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS_PCIECFG_BASE,
+                                ecam_alias);
+
+    /* Map PCI mem space */
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(d, 1);
+    memory_region_init_alias(mmio_alias, OBJECT(gpex_dev), "pcie-mmio",
+                             mmio_reg, LS7A_PCI_MEM_BASE, LS7A_PCI_MEM_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_MEM_BASE,
+                                mmio_alias);
+
+    /* Map PCI IO port space. */
+    pio_alias = g_new0(MemoryRegion, 1);
+    pio_reg = sysbus_mmio_get_region(d, 2);
+    memory_region_init_alias(pio_alias, OBJECT(gpex_dev), "pcie-io", pio_reg,
+                             LS7A_PCI_IO_OFFSET, LS7A_PCI_IO_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_IO_BASE,
+                                pio_alias);
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        sysbus_connect_irq(d, i,
+                           qdev_get_gpio_in(pch_pic, 16 + i));
+        gpex_set_irq_num(GPEX_HOST(gpex_dev), i, 16 + i);
+    }
+
+    serial_mm_init(get_system_memory(), LS7A_UART_BASE, 0,
+                   qdev_get_gpio_in(pch_pic,
+                                    LS7A_UART_IRQ - PCH_PIC_IRQ_OFFSET),
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
@@ -130,6 +205,8 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
         sysbus_connect_irq(d, i,
                            qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
     }
+
+    loongarch_devices_init(pch_pic);
 }
 
 static void loongarch_init(MachineState *machine)
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index bf80e99ce1..f57417b096 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -15,6 +15,12 @@
 #include "qemu/range.h"
 #include "qom/object.h"
 
+#define LS7A_PCI_IO_OFFSET      0x4000
+#define LS_PCIECFG_BASE         0x20000000
+#define LS_PCIECFG_SIZE         0x08000000
+#define LS7A_PCI_IO_BASE        0x18004000UL
+#define LS7A_PCI_IO_SIZE        0xC000
+
 #define LS7A_PCH_REG_BASE       0x10000000UL
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
 #define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
@@ -27,4 +33,6 @@
 #define PCH_PIC_IRQ_OFFSET      64
 #define LS7A_DEVICE_IRQS        16
 #define LS7A_PCI_IRQS           48
+#define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
+#define LS7A_UART_BASE          0x1fe001e0
 #endif
-- 
2.31.1


