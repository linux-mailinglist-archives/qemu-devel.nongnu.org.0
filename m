Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A43C53E4CA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:37:43 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyCvN-00033V-Vn
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nyC5w-00008F-Cd
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40304 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nyC5s-0004UB-SP
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:32 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+Z29p1ishIXAA--.3714S36; 
 Mon, 06 Jun 2022 20:44:13 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, maobibo@loongson.cn
Subject: [PATCH v7 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Date: Mon,  6 Jun 2022 20:43:24 +0800
Message-Id: <20220606124333.2060567-35-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
References: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+Z29p1ishIXAA--.3714S36
X-Coremail-Antispam: 1UD129KBjvAXoWfGr1xAFy3Kw4kGF4fGw13CFg_yoW8Gw1xGo
 W5tFW5W3y8Jr4xCrZYy39FgF1UWr4v9rW5Ja4xZay3uF43tFn8Ga9xK34YyryfWF4kKF15
 X39xuF97Aay7t3Wkn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch realize the EIOINTC interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                    |   3 +
 hw/intc/loongarch_extioi.c         | 312 +++++++++++++++++++++++++++++
 hw/intc/meson.build                |   1 +
 hw/intc/trace-events               |   6 +
 hw/loongarch/Kconfig               |   1 +
 include/hw/intc/loongarch_extioi.h |  62 ++++++
 6 files changed, 385 insertions(+)
 create mode 100644 hw/intc/loongarch_extioi.c
 create mode 100644 include/hw/intc/loongarch_extioi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 58f550b865..ecd2883ceb 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -99,3 +99,6 @@ config LOONGARCH_PCH_MSI
     select MSI_NONBROKEN
     bool
     select UNIMP
+
+config LOONGARCH_EXTIOI
+    bool
diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
new file mode 100644
index 0000000000..22803969bc
--- /dev/null
+++ b/hw/intc/loongarch_extioi.c
@@ -0,0 +1,312 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Loongson 3A5000 ext interrupt controller emulation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/loongarch/virt.h"
+#include "hw/qdev-properties.h"
+#include "exec/address-spaces.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+
+static void extioi_update_irq(LoongArchExtIOI *s, int irq, int level)
+{
+    int ipnum, cpu, found, irq_index, irq_mask;
+
+    ipnum = s->sw_ipmap[irq / 32];
+    cpu = s->sw_coremap[irq];
+    irq_index = irq / 32;
+    irq_mask = 1 << (irq & 0x1f);
+
+    if (level) {
+        /* if not enable return false */
+        if (((s->enable[irq_index]) & irq_mask) == 0) {
+            return;
+        }
+        s->coreisr[cpu][irq_index] |= irq_mask;
+        found = find_first_bit(s->sw_isr[cpu][ipnum], EXTIOI_IRQS);
+        set_bit(irq, s->sw_isr[cpu][ipnum]);
+        if (found < EXTIOI_IRQS) {
+            /* other irq is handling, need not update parent irq level */
+            return;
+        }
+    } else {
+        s->coreisr[cpu][irq_index] &= ~irq_mask;
+        clear_bit(irq, s->sw_isr[cpu][ipnum]);
+        found = find_first_bit(s->sw_isr[cpu][ipnum], EXTIOI_IRQS);
+        if (found < EXTIOI_IRQS) {
+            /* other irq is handling, need not update parent irq level */
+            return;
+        }
+    }
+    qemu_set_irq(s->parent_irq[cpu][ipnum], level);
+}
+
+static void extioi_setirq(void *opaque, int irq, int level)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    trace_loongarch_extioi_setirq(irq, level);
+    if (level) {
+        /*
+         * s->isr should be used in vmstate structure,
+         * but it not support 'unsigned long',
+         * so we have to switch it.
+         */
+        set_bit(irq, (unsigned long *)s->isr);
+    } else {
+        clear_bit(irq, (unsigned long *)s->isr);
+    }
+    extioi_update_irq(s, irq, level);
+}
+
+static uint64_t extioi_readw(void *opaque, hwaddr addr, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset = addr & 0xffff;
+    uint32_t index, cpu, ret = 0;
+
+    switch (offset) {
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        index = (offset - EXTIOI_NODETYPE_START) >> 2;
+        ret = s->nodetype[index];
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        index = (offset - EXTIOI_IPMAP_START) >> 2;
+        ret = s->ipmap[index];
+        break;
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        index = (offset - EXTIOI_ENABLE_START) >> 2;
+        ret = s->enable[index];
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        index = (offset - EXTIOI_BOUNCE_START) >> 2;
+        ret = s->bounce[index];
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = s->coreisr[cpu][index];
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        index = (offset - EXTIOI_COREMAP_START) >> 2;
+        ret = s->coremap[index];
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_extioi_readw(addr, ret);
+    return ret;
+}
+
+static inline void extioi_enable_irq(LoongArchExtIOI *s, int index,\
+                                     uint32_t mask, int level)
+{
+    uint32_t val;
+    int irq;
+
+    val = mask & s->isr[index];
+    irq = ctz32(val);
+    while (irq != 32) {
+        /*
+         * enable bit change from 0 to 1,
+         * need to update irq by pending bits
+         */
+        extioi_update_irq(s, irq + index * 32, level);
+        val &= ~(1 << irq);
+        irq = ctz32(val);
+    }
+}
+
+static void extioi_writew(void *opaque, hwaddr addr,
+                          uint64_t val, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    int i, cpu, index, old_data, irq;
+    uint32_t offset;
+
+    trace_loongarch_extioi_writew(addr, val);
+    offset = addr & 0xffff;
+
+    switch (offset) {
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        index = (offset - EXTIOI_NODETYPE_START) >> 2;
+        s->nodetype[index] = val;
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        /*
+         * ipmap cannot be set at runtime, can be set only at the beginning
+         * of intr driver, need not update upper irq level
+         */
+        index = (offset - EXTIOI_IPMAP_START) >> 2;
+        s->ipmap[index] = val;
+        /*
+         * loongarch only support little endian,
+         * so we paresd the value with little endian.
+         */
+        val = cpu_to_le64(val);
+        for (i = 0; i < 4; i++) {
+            uint8_t ipnum;
+            ipnum = val & 0xff;
+            ipnum = ctz32(ipnum);
+            ipnum = (ipnum >= 4) ? 0 : ipnum;
+            s->sw_ipmap[index * 4 + i] = ipnum;
+            val = val >> 8;
+        }
+
+        break;
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        index = (offset - EXTIOI_ENABLE_START) >> 2;
+        old_data = s->enable[index];
+        s->enable[index] = val;
+
+        /* unmask irq */
+        val = s->enable[index] & ~old_data;
+        extioi_enable_irq(s, index, val, 1);
+
+        /* mask irq */
+        val = ~s->enable[index] & old_data;
+        extioi_enable_irq(s, index, val, 0);
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        /* do not emulate hw bounced irq routing */
+        index = (offset - EXTIOI_BOUNCE_START) >> 2;
+        s->bounce[index] = val;
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        old_data = s->coreisr[cpu][index];
+        s->coreisr[cpu][index] = old_data & ~val;
+        /* write 1 to clear interrrupt */
+        old_data &= val;
+        irq = ctz32(old_data);
+        while (irq != 32) {
+            extioi_update_irq(s, irq + index * 32, 0);
+            old_data &= ~(1 << irq);
+            irq = ctz32(old_data);
+        }
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        irq = offset - EXTIOI_COREMAP_START;
+        index = irq / 4;
+        s->coremap[index] = val;
+        /*
+         * loongarch only support little endian,
+         * so we paresd the value with little endian.
+         */
+        val = cpu_to_le64(val);
+
+        for (i = 0; i < 4; i++) {
+            cpu = val & 0xff;
+            cpu = ctz32(cpu);
+            cpu = (cpu >= 4) ? 0 : cpu;
+            val = val >> 8;
+
+            if (s->sw_coremap[irq + i] == cpu) {
+                continue;
+            }
+
+            if (test_bit(irq, (unsigned long *)s->isr)) {
+                /*
+                 * lower irq at old cpu and raise irq at new cpu
+                 */
+                extioi_update_irq(s, irq + i, 0);
+                s->sw_coremap[irq + i] = cpu;
+                extioi_update_irq(s, irq + i, 1);
+            } else {
+                s->sw_coremap[irq + i] = cpu;
+            }
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps extioi_ops = {
+    .read = extioi_readw,
+    .write = extioi_writew,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_loongarch_extioi = {
+    .name = TYPE_LOONGARCH_EXTIOI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(bounce, LoongArchExtIOI, EXTIOI_IRQS_GROUP_COUNT),
+        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, LOONGARCH_MAX_VCPUS,
+                               EXTIOI_IRQS_GROUP_COUNT),
+        VMSTATE_UINT32_ARRAY(nodetype, LoongArchExtIOI,
+                             EXTIOI_IRQS_NODETYPE_COUNT / 2),
+        VMSTATE_UINT32_ARRAY(enable, LoongArchExtIOI, EXTIOI_IRQS / 32),
+        VMSTATE_UINT32_ARRAY(isr, LoongArchExtIOI, EXTIOI_IRQS / 32),
+        VMSTATE_UINT32_ARRAY(ipmap, LoongArchExtIOI, EXTIOI_IRQS_IPMAP_SIZE / 4),
+        VMSTATE_UINT32_ARRAY(coremap, LoongArchExtIOI, EXTIOI_IRQS / 4),
+        VMSTATE_UINT8_ARRAY(sw_ipmap, LoongArchExtIOI, EXTIOI_IRQS_IPMAP_SIZE),
+        VMSTATE_UINT8_ARRAY(sw_coremap, LoongArchExtIOI, EXTIOI_IRQS),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void loongarch_extioi_instance_init(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(obj);
+    int i, cpu, pin;
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
+    }
+
+    qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
+
+    for (cpu = 0; cpu < LOONGARCH_MAX_VCPUS; cpu++) {
+        memory_region_init_io(&s->extioi_iocsr_mem[cpu], OBJECT(s), &extioi_ops,
+                              s, "extioi_iocsr", 0x900);
+        sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_iocsr_mem[cpu]);
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
+        }
+    }
+    memory_region_init_io(&s->extioi_system_mem, OBJECT(s), &extioi_ops,
+                          s, "extioi_system_mem", 0x900);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->extioi_system_mem);
+}
+
+static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_loongarch_extioi;
+}
+
+static const TypeInfo loongarch_extioi_info = {
+    .name          = TYPE_LOONGARCH_EXTIOI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = loongarch_extioi_instance_init,
+    .instance_size = sizeof(struct LoongArchExtIOI),
+    .class_init    = loongarch_extioi_class_init,
+};
+
+static void loongarch_extioi_register_types(void)
+{
+    type_register_static(&loongarch_extioi_info);
+}
+
+type_init(loongarch_extioi_register_types)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 1d407c046d..bcbf22ff51 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -66,3 +66,4 @@ specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 63c9851923..0a90c1cdec 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -303,3 +303,9 @@ loongarch_pch_pic_writeb(unsigned size, uint64_t addr, uint64_t val) "size: %u a
 
 # loongarch_pch_msi.c
 loongarch_msi_set_irq(int irq_num) "set msi irq %d"
+
+# loongarch_extioi.c
+loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
+loongarch_extioi_readw(uint64_t addr, uint32_t val) "addr: 0x%"PRIx64 "val: 0x%x"
+loongarch_extioi_writew(uint64_t addr, uint64_t val) "addr: 0x%"PRIx64 "val: 0x%" PRIx64
+
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index d814fc6103..f779087416 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -5,3 +5,4 @@ config LOONGARCH_VIRT
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
+    select LOONGARCH_EXTIOI
diff --git a/include/hw/intc/loongarch_extioi.h b/include/hw/intc/loongarch_extioi.h
new file mode 100644
index 0000000000..15b8c999f6
--- /dev/null
+++ b/include/hw/intc/loongarch_extioi.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 3A5000 ext interrupt controller definitions
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "hw/sysbus.h"
+#include "hw/loongarch/virt.h"
+
+#ifndef LOONGARCH_EXTIOI_H
+#define LOONGARCH_EXTIOI_H
+
+#define LS3A_INTC_IP               8
+#define EXTIOI_IRQS                (256)
+#define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
+/* map to ipnum per 32 irqs */
+#define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
+#define EXTIOI_IRQS_COREMAP_SIZE   256
+#define EXTIOI_IRQS_NODETYPE_COUNT  16
+#define EXTIOI_IRQS_GROUP_COUNT    8
+
+#define APIC_OFFSET                  0x400
+#define APIC_BASE                    (0x1000ULL + APIC_OFFSET)
+
+#define EXTIOI_NODETYPE_START        (0x4a0 - APIC_OFFSET)
+#define EXTIOI_NODETYPE_END          (0x4c0 - APIC_OFFSET)
+#define EXTIOI_IPMAP_START           (0x4c0 - APIC_OFFSET)
+#define EXTIOI_IPMAP_END             (0x4c8 - APIC_OFFSET)
+#define EXTIOI_ENABLE_START          (0x600 - APIC_OFFSET)
+#define EXTIOI_ENABLE_END            (0x620 - APIC_OFFSET)
+#define EXTIOI_BOUNCE_START          (0x680 - APIC_OFFSET)
+#define EXTIOI_BOUNCE_END            (0x6a0 - APIC_OFFSET)
+#define EXTIOI_ISR_START             (0x700 - APIC_OFFSET)
+#define EXTIOI_ISR_END               (0x720 - APIC_OFFSET)
+#define EXTIOI_COREISR_START         (0x800 - APIC_OFFSET)
+#define EXTIOI_COREISR_END           (0xB20 - APIC_OFFSET)
+#define EXTIOI_COREMAP_START         (0xC00 - APIC_OFFSET)
+#define EXTIOI_COREMAP_END           (0xD00 - APIC_OFFSET)
+
+#define TYPE_LOONGARCH_EXTIOI "loongarch.extioi"
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchExtIOI, LOONGARCH_EXTIOI)
+struct LoongArchExtIOI {
+    SysBusDevice parent_obj;
+    /* hardware state */
+    uint32_t nodetype[EXTIOI_IRQS_NODETYPE_COUNT / 2];
+    uint32_t bounce[EXTIOI_IRQS_GROUP_COUNT];
+    uint32_t isr[EXTIOI_IRQS / 32];
+    uint32_t coreisr[LOONGARCH_MAX_VCPUS][EXTIOI_IRQS_GROUP_COUNT];
+    uint32_t enable[EXTIOI_IRQS / 32];
+    uint32_t ipmap[EXTIOI_IRQS_IPMAP_SIZE / 4];
+    uint32_t coremap[EXTIOI_IRQS / 4];
+    uint32_t sw_pending[EXTIOI_IRQS / 32];
+    DECLARE_BITMAP(sw_isr[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP], EXTIOI_IRQS);
+    uint8_t  sw_ipmap[EXTIOI_IRQS_IPMAP_SIZE];
+    uint8_t  sw_coremap[EXTIOI_IRQS];
+    qemu_irq parent_irq[LOONGARCH_MAX_VCPUS][LS3A_INTC_IP];
+    qemu_irq irq[EXTIOI_IRQS];
+    MemoryRegion extioi_iocsr_mem[LOONGARCH_MAX_VCPUS];
+    MemoryRegion extioi_system_mem;
+};
+#endif /* LOONGARCH_EXTIOI_H */
-- 
2.31.1


