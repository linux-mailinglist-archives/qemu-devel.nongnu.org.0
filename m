Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01734C4170
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:29:58 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWvG-0002Kw-2o
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nNVhg-0003uy-SF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:11:54 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44674 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nNVhb-0004go-45
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:11:52 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMg8jRhiw9UGAA--.8228S22; 
 Fri, 25 Feb 2022 16:03:22 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 20/29] hw/loongarch: Add irq hierarchy for the system
Date: Fri, 25 Feb 2022 03:02:59 -0500
Message-Id: <20220225080308.1405-21-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
References: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxqMg8jRhiw9UGAA--.8228S22
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw18GF1kGFyxWFWrWryfWFg_yoWxJFy3pF
 yfCF95Cr48XF4xJ393KF1fWrn8Aan5CFy7uFWS9rySkr4UAryqv3yvk3yDtFyUG3ykXrWY
 qFy5AFy2ga1DA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add the irq hierarchy for the virt board.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS                |  1 +
 hw/loongarch/loongson3.c   | 99 ++++++++++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h | 30 ++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 include/hw/pci-host/ls7a.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 21e35bc312..306a0fc8f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1129,6 +1129,7 @@ F: hw/loongarch/
 F: include/hw/loongarch/loongarch.h
 F: include/hw/intc/loongarch_*.h
 F: hw/intc/loongarch_*.c
+F: include/hw/pci-host/ls7a.h
 
 M68K Machines
 -------------
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 7b4e77a6a6..17fdcc42ca 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -16,6 +16,11 @@
 #include "sysemu/reset.h"
 #include "sysemu/rtc.h"
 #include "hw/loongarch/loongarch.h"
+#include "hw/intc/loongarch_ipi.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/intc/loongarch_pch_msi.h"
+#include "hw/pci-host/ls7a.h"
 
 #include "target/loongarch/cpu.h"
 
@@ -87,8 +92,11 @@ static const MemoryRegionOps loongarch_qemu_ops = {
     },
 };
 
+static struct DeviceState *ipi, *extioi;
+
 static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
 {
+    unsigned long ipi_addr;
     CPULoongArchState *env;
     env = &la_cpu->env;
 
@@ -107,12 +115,101 @@ static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
                           NULL, "iocsr_misc", IOCSR_MEM_SIZE);
 
     memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
+    /* ipi memory region */
+    ipi_addr = SMP_IPI_MAILBOX + cpu_num * 0x100;
+    memory_region_add_subregion(&env->system_iocsr, ipi_addr,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
+                                cpu_num));
+    /* extioi memory region */
+    memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
+                                cpu_num));
+}
+
+static DeviceState *create_ipi(void)
+{
+    DeviceState *ipi;
+
+    ipi = qdev_new(TYPE_LOONGARCH_IPI);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
+    return ipi;
+}
+
+static DeviceState *create_extioi(void)
+{
+    DeviceState *extioi;
+
+    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(extioi), &error_fatal);
+    return extioi;
+}
+
+static void loongarch_irq_init(LoongArchMachineState *lams,
+                               DeviceState *ipi, DeviceState *extioi)
+{
+    MachineState *ms = MACHINE(lams);
+    DeviceState *pch_pic, *pch_msi, *cpudev;
+
+    SysBusDevice *d;
+    int cpu, pin, i;
+
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        cpudev = DEVICE(qemu_get_cpu(cpu));
+        /* connect ipi irq to cpu irq */
+        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
+    }
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(extioi),
+                           i, qdev_get_gpio_in(extioi, i));
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
 }
 
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
     LoongArchCPU *la_cpu;
+    ipi = create_ipi();
+    extioi = create_extioi();
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
@@ -152,6 +249,8 @@ static void loongarch_init(MachineState *machine)
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* Initialize the IO interrupt subsystem */
+    loongarch_irq_init(lams, ipi, extioi);
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
new file mode 100644
index 0000000000..bf80e99ce1
--- /dev/null
+++ b/include/hw/pci-host/ls7a.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LS7A_H
+#define HW_LS7A_H
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/pci-host/pam.h"
+#include "qemu/units.h"
+#include "qemu/range.h"
+#include "qom/object.h"
+
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
+#endif
-- 
2.27.0


