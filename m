Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6850283C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:23:16 +0200 (CEST)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJ6h-0004rM-Gv
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfIXt-0000Di-2B
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:47:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55722 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfIXo-0005Oc-4e
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:47:16 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xGqPVli41gkAA--.16856S37; 
 Fri, 15 Apr 2022 17:41:35 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 35/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Date: Fri, 15 Apr 2022 17:40:50 +0800
Message-Id: <20220415094058.3584233-36-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_xGqPVli41gkAA--.16856S37
X-Coremail-Antispam: 1UD129KBjvAXoW3tw4xAw1xZFyxGr4DGw1fCrg_yoW8Ww4xXo
 W5JFZ8Z3y8Gr4xArZ5twsFqFy3Kr4v9rW5Aa4xZay3uan2yF45Ga9xK34YyFyfWFs5Kr15
 X3sa9FyDJ3y7tw1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch realize the EIOINTC interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                    |   3 +
 hw/intc/loongarch_extioi.c         | 373 +++++++++++++++++++++++++++++
 hw/intc/meson.build                |   1 +
 hw/intc/trace-events               |  11 +
 hw/loongarch/Kconfig               |   1 +
 include/hw/intc/loongarch_extioi.h |  68 ++++++
 6 files changed, 457 insertions(+)
 create mode 100644 hw/intc/loongarch_extioi.c
 create mode 100644 include/hw/intc/loongarch_extioi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 71c04c328e..28bd1f185d 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -96,3 +96,6 @@ config LOONGARCH_PCH_MSI
     select MSI_NONBROKEN
     bool
     select UNIMP
+
+config LOONGARCH_EXTIOI
+    bool
diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
new file mode 100644
index 0000000000..67be990672
--- /dev/null
+++ b/hw/intc/loongarch_extioi.c
@@ -0,0 +1,373 @@
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
+#include "hw/loongarch/loongarch.h"
+#include "hw/qdev-properties.h"
+#include "exec/address-spaces.h"
+#include "hw/intc/loongarch_extioi.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static void extioi_update_irq(LoongArchExtIOI *s, int irq_num, int level)
+{
+    uint8_t ipnum, cpu;
+
+    /*
+     * Routing in group of 32 interrupts.
+     * The default value of csr[0x420][49]
+     * is 0 and nobody will change it,
+     * so 'ipmap' use bitmap function.
+     */
+    ipnum = s->ipmap[irq_num / 32] & 0xf;
+    ipnum = find_first_bit((unsigned long *)&ipnum, 4);
+    ipnum = (ipnum == 4) ? 0 : ipnum;
+
+    cpu = s->coremap[irq_num] & 0xf;
+    cpu = find_first_bit((unsigned long *)&cpu, 4);
+    cpu = (cpu == 4) ? 0 : cpu;
+
+    /* qemu_set_irq needs integer variable, so level is 'int' */
+    if (level) {
+        if (test_bit(irq_num, (unsigned long *)s->enable) == false) {
+            return;
+        }
+        bitmap_set((unsigned long *)s->coreisr[cpu], irq_num, 1);
+        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
+    } else {
+        bitmap_clear((unsigned long *)s->coreisr[cpu], irq_num, 1);
+        qemu_set_irq(s->parent_irq[cpu][ipnum], level);
+    }
+}
+
+static void extioi_setirq(void *opaque, int irq, int level)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    trace_loongarch_extioi_setirq(irq, level);
+    extioi_update_irq(s, irq, level);
+}
+
+static uint64_t extioi_nodetype_readw(void *opaque, hwaddr addr, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset = addr & 0xffff;
+    uint32_t index, ret = 0;
+
+    switch (offset) {
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        index = (offset - EXTIOI_NODETYPE_START) >> 2;
+        ret = s->nodetype[index];
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_extioi_nodetype_readw((uint32_t)addr, ret);
+    return ret;
+}
+
+static void extioi_nodetype_writew(void *opaque, hwaddr addr,
+                                   uint64_t val, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    int index;
+    uint32_t offset;
+    trace_loongarch_extioi_nodetype_writew(size, (uint32_t)addr, val);
+
+    offset = addr & 0xffff;
+
+    switch (offset) {
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        index = (offset - EXTIOI_NODETYPE_START) >> 2;
+        s->nodetype[index] = val;
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t extioi_ipmap_enable_read(void *opaque, hwaddr addr,
+                                         unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    uint8_t ret = 0;
+
+    switch (addr) {
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        ret = s->ipmap[addr];
+        break;
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        addr -= EXTIOI_ENABLE_START;
+        ret = s->enable[addr];
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_extioi_ipmap_enable_read((uint8_t)addr, ret);
+    return ret;
+}
+
+static void extioi_ipmap_enable_write(void *opaque, hwaddr addr,
+                                      uint64_t value, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    uint8_t old_data, val = value & 0xff;
+    int i, level;
+    trace_loongarch_extioi_ipmap_enable_write(size, (uint8_t)addr, val);
+
+    switch (addr) {
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        s->ipmap[addr] = val;
+        break;
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        addr -= EXTIOI_ENABLE_START;
+        old_data = s->enable[addr];
+        if (old_data != val) {
+            s->enable[addr] = val;
+            old_data = old_data ^ val;
+
+            while ((i = find_first_bit((unsigned long *)&old_data, 8)) != 8) {
+                level = test_bit(i, (unsigned long *)&val);
+                if (!level) {
+                    extioi_update_irq(s, i + addr * 8, level);
+                }
+                clear_bit(i, (unsigned long *)&old_data);
+            }
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t extioi_bounce_coreisr_readw(void *opaque, hwaddr addr,
+                                            unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset = addr & 0xffff;
+    uint32_t index, ret = 0;
+    int cpu;
+
+    switch (offset) {
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        index = (offset - EXTIOI_BOUNCE_START) >> 2;
+        ret = s->bounce[index];
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = s->coreisr[cpu][index];
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_extioi_bounce_coreisr_readw((uint32_t)addr, ret);
+    return ret;
+}
+
+static void extioi_bounce_coreisr_writew(void *opaque, hwaddr addr,
+                                         uint64_t val, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    int cpu, index;
+    uint32_t offset, old_data, i, j, bits;
+
+    offset = addr & 0xffff;
+    trace_loongarch_extioi_bounce_coreisr_writew(size, (uint32_t)addr, val);
+    switch (offset) {
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        index = (offset - EXTIOI_BOUNCE_START) >> 2;
+        s->bounce[index] = val;
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        old_data = s->coreisr[cpu][index];
+        s->coreisr[cpu][index] = old_data & ~val;
+        if (old_data != s->coreisr[cpu][index]) {
+            bits = size * 8;
+            while ((i = find_first_bit((unsigned long *)&val, bits)) != bits) {
+                j = test_bit(i, (unsigned long *)&old_data);
+                if (j) {
+                    extioi_update_irq(s, i + index * 32, 0);
+                }
+                clear_bit(i, (unsigned long *)&val);
+            }
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t extioi_coremap_read(void *opaque, hwaddr addr, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    uint8_t ret = 0;
+
+    switch (addr) {
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        ret = s->coremap[addr];
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_extioi_coremap_read((uint8_t)addr, ret);
+    return ret;
+}
+
+static void extioi_coremap_write(void *opaque, hwaddr addr,
+                                 uint64_t value, unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    uint8_t val = value & 0xff;
+
+    trace_loongarch_extioi_coremap_write(size, (uint8_t)addr, val);
+    switch (addr) {
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        s->coremap[addr] = val;
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps extioi_nodetype_ops = {
+    .read = extioi_nodetype_readw,
+    .write = extioi_nodetype_writew,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static const MemoryRegionOps extioi_ipmap_enable_ops = {
+    .read = extioi_ipmap_enable_read,
+    .write = extioi_ipmap_enable_write,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 1,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static const MemoryRegionOps extioi_bounce_coreisr_ops = {
+    .read = extioi_bounce_coreisr_readw,
+    .write = extioi_bounce_coreisr_writew,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static const MemoryRegionOps extioi_coremap_ops = {
+    .read = extioi_coremap_read,
+    .write = extioi_coremap_write,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 1,
+    .valid.min_access_size = 1,
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
+        VMSTATE_UINT32_2DARRAY(coreisr, LoongArchExtIOI, MAX_CORES,
+                               EXTIOI_IRQS_GROUP_COUNT),
+        VMSTATE_UINT32_ARRAY(nodetype, LoongArchExtIOI,
+                             EXTIOI_IRQS_NODETYPE_COUNT / 2),
+        VMSTATE_UINT8_ARRAY(enable, LoongArchExtIOI, EXTIOI_IRQS / 8),
+        VMSTATE_UINT8_ARRAY(ipmap, LoongArchExtIOI, 8),
+        VMSTATE_UINT8_ARRAY(coremap, LoongArchExtIOI, EXTIOI_IRQS),
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
+    for (cpu = 0; cpu < MAX_CORES; cpu++) {
+        sysbus_init_mmio(dev, &s->mmio[cpu]);
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_init_gpio_out(DEVICE(obj), &s->parent_irq[cpu][pin], 1);
+        }
+
+        memory_region_init(&s->mmio[cpu], OBJECT(s),
+                           "loongarch_extioi", EXTIOI_SIZE);
+
+        memory_region_init_io(&s->mmio_nodetype[cpu], OBJECT(s),
+                              &extioi_nodetype_ops, s,
+                              EXTIOI_LINKNAME(.nodetype),
+                              IPMAP_OFFSET - APIC_BASE);
+        memory_region_add_subregion(&s->mmio[cpu], 0, &s->mmio_nodetype[cpu]);
+
+        memory_region_init_io(&s->mmio_ipmap_enable[cpu], OBJECT(s),
+                              &extioi_ipmap_enable_ops, s,
+                              EXTIOI_LINKNAME(.ipmap_enable),
+                              BOUNCE_OFFSET - IPMAP_OFFSET);
+        memory_region_add_subregion(&s->mmio[cpu], IPMAP_OFFSET - APIC_BASE,
+                                    &s->mmio_ipmap_enable[cpu]);
+
+        memory_region_init_io(&s->mmio_bounce_coreisr[cpu], OBJECT(s),
+                              &extioi_bounce_coreisr_ops, s,
+                              EXTIOI_LINKNAME(.bounce_coreisr),
+                              COREMAP_OFFSET - BOUNCE_OFFSET);
+        memory_region_add_subregion(&s->mmio[cpu], BOUNCE_OFFSET - APIC_BASE,
+                                    &s->mmio_bounce_coreisr[cpu]);
+
+        memory_region_init_io(&s->mmio_coremap[cpu], OBJECT(s),
+                              &extioi_coremap_ops, s,
+                              EXTIOI_LINKNAME(.coremap),
+                              EXTIOI_COREMAP_END);
+        memory_region_add_subregion(&s->mmio[cpu], COREMAP_OFFSET - APIC_BASE,
+                                    &s->mmio_coremap[cpu]);
+    }
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
index 77a30cec33..405e18f4bb 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -65,3 +65,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index aeee1e03de..69dfdf8eca 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -291,3 +291,14 @@ loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size:
 
 # loongarch_pch_msi.c
 loongarch_msi_set_irq(int irq_num) "set msi irq %d"
+
+# loongarch_extioi.c
+loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
+loongarch_extioi_nodetype_readw(uint32_t addr, uint32_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_nodetype_writew(unsigned size, uint32_t addr, uint32_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_ipmap_enable_read(uint8_t addr, uint8_t val) "addr: 0x%"PRIu8 "val: 0x%" PRIu8
+loongarch_extioi_ipmap_enable_write(unsigned size, uint8_t addr, uint8_t val) "size: %u addr: 0x%"PRIu8 "val: 0x%" PRIu8
+loongarch_extioi_bounce_coreisr_readw(uint32_t addr, uint32_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_bounce_coreisr_writew(unsigned size, uint32_t addr, uint32_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_coremap_read(uint8_t addr, uint8_t val) "addr: 0x%"PRIu8 "val: 0x%" PRIu8
+loongarch_extioi_coremap_write(unsigned size, uint8_t addr, uint8_t val) "size: %u addr: 0x%"PRIu8 "val: 0x%" PRIu8
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
index 0000000000..46c5116bf5
--- /dev/null
+++ b/include/hw/intc/loongarch_extioi.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 3A5000 ext interrupt controller definitions
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "hw/sysbus.h"
+#include "hw/loongarch/loongarch.h"
+
+#ifndef LOONGARCH_EXTIOI_H
+#define LOONGARCH_EXTIOI_H
+
+#define LS3A_INTC_IP                 8
+#define MAX_CORES                    LOONGARCH_MAX_VCPUS
+#define EXTIOI_IRQS                  (256)
+/* 32 irqs belong to a group */
+#define EXTIOI_IRQS_GROUP_COUNT      (256 / 32)
+/* map to ipnum per 32 irqs */
+#define EXTIOI_IRQS_NODETYPE_COUNT   16
+
+#define APIC_BASE                    0x1400
+#define ENABLE_OFFSET                0x1600
+#define IPMAP_OFFSET                 0x14c0
+#define COREMAP_OFFSET               0x1c00
+#define NODETYPE_OFFSET              0x14a0
+#define BOUNCE_OFFSET                0x1680
+#define COREISR_OFFSET               0x1800
+
+#define EXTIOI_NODETYPE_START        (0x14a0 - APIC_BASE)
+#define EXTIOI_NODETYPE_END          (0x14c0 - APIC_BASE)
+#define EXTIOI_BOUNCE_START          0
+#define EXTIOI_BOUNCE_END            (0x16a0 - BOUNCE_OFFSET)
+#define EXTIOI_COREISR_START         (0x1800 - BOUNCE_OFFSET)
+#define EXTIOI_COREISR_END           (0x1B20 - BOUNCE_OFFSET)
+
+#define EXTIOI_IPMAP_START           0
+#define EXTIOI_IPMAP_END             (0x14c8 - IPMAP_OFFSET)
+#define EXTIOI_ENABLE_START          (0x1600 - IPMAP_OFFSET)
+#define EXTIOI_ENABLE_END            (0x1618 - IPMAP_OFFSET)
+
+#define EXTIOI_COREMAP_START         0
+#define EXTIOI_COREMAP_END           (0x1d00 - COREMAP_OFFSET)
+#define EXTIOI_SIZE                  0x900
+
+#define TYPE_LOONGARCH_EXTIOI "loongarch_extioi"
+#define EXTIOI_LINKNAME(name) TYPE_LOONGARCH_EXTIOI#name
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchExtIOI, LOONGARCH_EXTIOI)
+struct LoongArchExtIOI {
+    SysBusDevice parent_obj;
+    /* hardware state */
+    uint32_t nodetype[EXTIOI_IRQS_NODETYPE_COUNT / 2];
+    uint32_t bounce[EXTIOI_IRQS_GROUP_COUNT];
+    uint32_t coreisr[MAX_CORES][EXTIOI_IRQS_GROUP_COUNT];
+
+    uint8_t enable[EXTIOI_IRQS / 8];
+    uint8_t ipmap[8];
+    uint8_t coremap[EXTIOI_IRQS];
+    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
+    qemu_irq irq[EXTIOI_IRQS];
+    MemoryRegion mmio[MAX_CORES];
+    MemoryRegion mmio_nodetype[MAX_CORES];
+    MemoryRegion mmio_ipmap_enable[MAX_CORES];
+    MemoryRegion mmio_bounce_coreisr[MAX_CORES];
+    MemoryRegion mmio_coremap[MAX_CORES];
+};
+
+#endif /* LOONGARCH_EXTIOI_H */
-- 
2.31.1


