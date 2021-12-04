Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214094684C6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:24:22 +0100 (CET)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtU5V-0006Ej-4q
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:24:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpe-0007fs-KG
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:58 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58422 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpb-0003JM-Pf
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:58 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S23; 
 Sat, 04 Dec 2021 20:07:40 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 21/27] hw/loongarch: Add irq hierarchy for the system
Date: Sat,  4 Dec 2021 20:07:19 +0800
Message-Id: <1638619645-11283-22-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S23
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUGr4rCFyDJw18Aw1fWFg_yoWrKr43pF
 y5Cas5Gr48XF4xG393K3WxWrn5JFs3CF129FWS9rWSkr4DJryUZw1vywsrtFyUJFWkXw4Y
 qr95ua1Iga1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add the irq hierarchy for the virt board.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongson3.c   | 84 ++++++++++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h | 13 ++++++
 2 files changed, 97 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 28b623e927..c42f830208 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -15,6 +15,10 @@
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
 #include "hw/loongarch/loongarch.h"
+#include "hw/intc/loongarch_ipi.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
 
 
@@ -70,6 +74,83 @@ static const MemoryRegionOps loongarch_qemu_ops = {
     },
 };
 
+static void sysbus_mmio_map_loongarch(SysBusDevice *dev, int n,
+                                      hwaddr addr, MemoryRegion *iocsr)
+{
+    assert(n >= 0 && n < dev->num_mmio);
+
+    if (dev->mmio[n].addr == addr) {
+        /* ??? region already mapped here. */
+        return;
+    }
+    if (dev->mmio[n].addr != (hwaddr)-1) {
+        /* Unregister previous mapping. */
+        memory_region_del_subregion(iocsr, dev->mmio[n].memory);
+    }
+    dev->mmio[n].addr = addr;
+    memory_region_add_subregion(iocsr, addr, dev->mmio[n].memory);
+}
+
+static void loongson3_irq_init(MachineState *machine)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    DeviceState *ipi, *extioi, *pch_pic, *pch_msi, *cpudev;
+    SysBusDevice *d;
+    int cpu, pin, i;
+    unsigned long ipi_addr;
+
+    ipi = qdev_new(TYPE_LOONGARCH_IPI);
+    d = SYS_BUS_DEVICE(ipi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    for (cpu = 0; cpu < machine->smp.cpus; cpu++) {
+        cpudev = DEVICE(qemu_get_cpu(cpu));
+        ipi_addr = SMP_IPI_MAILBOX + cpu * 0x100;
+        sysbus_mmio_map_loongarch(d, cpu, ipi_addr, &lams->system_iocsr);
+        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
+    }
+
+    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
+    d = SYS_BUS_DEVICE(extioi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map_loongarch(d, 0, APIC_BASE, &lams->system_iocsr);
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
+    }
+
+    /*
+     * connect ext irq to the cpu irq
+     * cpu_pin[9:2] <= intc_pin[7:0]
+     */
+    for (cpu = 0; cpu < machine->smp.cpus; cpu++) {
+        cpudev = DEVICE(qemu_get_cpu(cpu));
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
+                                  qdev_get_gpio_in(cpudev, pin + 2));
+        }
+    }
+
+    pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
+    d = SYS_BUS_DEVICE(pch_pic);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, LS7A_IOAPIC_REG_BASE);
+
+    /* Connect 64 pch_pic irqs to extioi */
+    for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
+        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
+    }
+
+    pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
+    d = SYS_BUS_DEVICE(pch_msi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
+    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
+        /* Connect 192 pch_msi irqs to extioi */
+        sysbus_connect_irq(d, i,
+                           qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
+    }
+}
+
 static void loongson3_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -126,6 +207,9 @@ static void loongson3_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
     offset += highram_size;
 
+    /* Initialize the IO interrupt subsystem */
+    loongson3_irq_init(machine);
+
     LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
     LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
     LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 32d6f045dc..ac938d6d5f 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -24,6 +24,19 @@
 #define LS7A_PCI_IO_BASE         0x18000000UL
 #define LS7A_PCI_IO_SIZE         0x00010000
 
+#define LS7A_PCH_REG_BASE       0x10000000UL
+#define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
+#define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
+
+/*
+ * According to the kernel pch irq start from 64 offset
+ * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
+ * used for pci device.
+ */
+#define PCH_PIC_IRQ_OFFSET      64
+#define LS7A_DEVICE_IRQS        16
+#define LS7A_PCI_IRQS           48
+
 struct LS7APCIState {
     /*< private >*/
     PCIDevice parent_obj;
-- 
2.27.0


