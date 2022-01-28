Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94849F258
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:19:13 +0100 (CET)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIjA-00058v-ON
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIIc-0007XW-Ki
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:51:46 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42630 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIIa-0003R2-9c
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:51:46 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S23; 
 Fri, 28 Jan 2022 11:44:36 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 21/30] hw/loongarch: Add irq hierarchy for the system
Date: Thu, 27 Jan 2022 22:44:03 -0500
Message-Id: <20220128034412.1262452-22-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S23
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr1DWw45uF1kWF4kJF1xGrg_yoW7Xry3pF
 y3C3s5Kr48XFsrX393K3WfWwn8AanakF1I9ayS9ryfCr4UJryUZ3ykAw4DtFyUJaykXr4Y
 vFy5uayIga1DA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add the irq hierarchy for the virt board.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongson3.c   | 88 ++++++++++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h | 13 ++++++
 2 files changed, 101 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index e79d86928d..e0909d4c82 100644
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
 
 #include "target/loongarch/cpu.h"
@@ -87,6 +91,87 @@ static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
+static void loongarch_irq_init(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    DeviceState *ipi, *extioi, *pch_pic, *pch_msi, *cpudev;
+    SysBusDevice *d;
+    int cpu, pin, i;
+    unsigned long ipi_addr;
+    CPULoongArchState *env;
+
+    ipi = qdev_new(TYPE_LOONGARCH_IPI);
+    d = SYS_BUS_DEVICE(ipi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        cpudev = DEVICE(qemu_get_cpu(cpu));
+        env = (qemu_get_cpu(cpu))->env_ptr;
+        ipi_addr = SMP_IPI_MAILBOX + cpu * 0x100;
+        memory_region_add_subregion(env->system_iocsr, ipi_addr,
+                                    sysbus_mmio_get_region(d, cpu));
+        /* connect ipi irq to cpu irq */
+        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
+    }
+
+    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
+    d = SYS_BUS_DEVICE(extioi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        env = (qemu_get_cpu(cpu))->env_ptr;
+        memory_region_add_subregion(env->system_iocsr, APIC_BASE,
+                                    sysbus_mmio_get_region(d, cpu * 4));
+        memory_region_add_subregion(env->system_iocsr, IPMAP_OFFSET,
+                                    sysbus_mmio_get_region(d, cpu * 4 + 1));
+        memory_region_add_subregion(env->system_iocsr, BOUNCE_OFFSET,
+                                    sysbus_mmio_get_region(d, cpu * 4 + 2));
+        memory_region_add_subregion(env->system_iocsr, COREMAP_OFFSET,
+                                    sysbus_mmio_get_region(d, cpu * 4 + 3));
+    }
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
+    }
+
+    /*
+     * connect ext irq to the cpu irq
+     * cpu_pin[9:2] <= intc_pin[7:0]
+     */
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
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
+    memory_region_add_subregion(get_system_memory(), LS7A_IOAPIC_REG_BASE,
+                            sysbus_mmio_get_region(d, 0));
+    memory_region_add_subregion(get_system_memory(),
+                            LS7A_IOAPIC_REG_BASE + PCH_PIC_ROUTE_ENTRY_OFFSET,
+                            sysbus_mmio_get_region(d, 1));
+    memory_region_add_subregion(get_system_memory(),
+                            LS7A_IOAPIC_REG_BASE + PCH_PIC_INT_STATUS_LO,
+                            sysbus_mmio_get_region(d, 2));
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
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -146,6 +231,9 @@ static void loongarch_init(MachineState *machine)
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+
+    /* Initialize the IO interrupt subsystem */
+    loongarch_irq_init(lams);
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 6adbfbe443..447450828e 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -24,6 +24,19 @@
 #define LS7A_PCI_IO_BASE         0x18004000UL
 #define LS7A_PCI_IO_SIZE         0xC000
 
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


