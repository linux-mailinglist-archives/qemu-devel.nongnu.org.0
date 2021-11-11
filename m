Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779644CF65
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:57:22 +0100 (CET)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzL6-00085t-UL
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0l-0006VN-Rr
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54246 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0j-0001qH-Me
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:19 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S24; 
 Thu, 11 Nov 2021 09:36:00 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 22/30] hw/loongarch: Add irq hierarchy for the system
Date: Thu, 11 Nov 2021 09:35:20 +0800
Message-Id: <1636594528-8175-23-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S24
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8JF1DKrWUtF1rGr1ftFb_yoWrXrW8pF
 98Ca95Kr48Xa1xG39aq3WxWrs5Jan7G3429FWS9r4SkF4UJryUZ34vywsrtFW5JaykXrs0
 qF9Yka1Iva1DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

This patch add the irq hierarchy for the virt board.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/ls3a5000_virt.c | 64 ++++++++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h   |  4 +++
 2 files changed, 68 insertions(+)

diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index bd79df96df..59a79807e0 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -15,6 +15,9 @@
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
 #include "hw/loongarch/loongarch.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
 
 CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
@@ -102,6 +105,64 @@ static const MemoryRegionOps loongarch_qemu_ops = {
     },
 };
 
+static void sysbus_mmio_map_loongarch(SysBusDevice *dev, int n, hwaddr addr, MemoryRegion *iocsr)
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
+static void ls3a5000_irq_init(MachineState *machine, CPULoongArchState *env[])
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    DeviceState *extioi, *pch_pic, *pch_msi;
+    SysBusDevice *d;
+    int cpu, pin, i;
+
+    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
+    d = SYS_BUS_DEVICE(extioi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map_loongarch(d, 0, APIC_BASE, lams->system_iocsr);
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
+    }
+
+    for (cpu = 0; cpu < machine->smp.cpus; cpu++) {
+        /* cpu_pin[9:2] <= intc_pin[7:0] */
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            sysbus_connect_irq(d, (EXTIOI_IRQS + cpu * 8 + pin),
+                               env[cpu]->irq[pin + 2]);
+        }
+    }
+
+    pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
+    d = SYS_BUS_DEVICE(pch_pic);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, LS7A_IOAPIC_REG_BASE);
+
+    for (int i = 0; i < 32; i++) {
+        sysbus_connect_irq(d, i, lams->pch_irq[i]);
+    }
+
+    pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
+    d = SYS_BUS_DEVICE(pch_msi);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
+    for (i = 0; i < 224; i++) {
+        sysbus_connect_irq(d, i, lams->pch_irq[i + 32]);
+    }
+}
+
 static void ls3a5000_virt_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
@@ -179,6 +240,9 @@ static void ls3a5000_virt_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem,
                                 PM_MMIO_ADDR, iomem);
 
+    /* Initialize the IO interrupt subsystem */
+    ls3a5000_irq_init(machine, cpu_states);
+
     LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
     LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
     LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 6b5ba3b442..b57277f206 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -23,6 +23,10 @@
 
 #define LS7A_PCI_IO_BASE        0x18000000UL
 #define LS7A_PCI_IO_SIZE        0x00010000
+#define LS7A_PCH_REG_BASE       0x10000000UL
+#define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
+#define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
+
 typedef struct LS7APCIState LS7APCIState;
 typedef struct LS7APCIEHost {
     PCIExpressHost parent_obj;
-- 
2.27.0


