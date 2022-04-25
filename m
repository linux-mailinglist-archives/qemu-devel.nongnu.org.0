Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C768650DD7B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:02:14 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivXp-0002Ej-Tq
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukV-0008JZ-47
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39556 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukP-0001K0-Mv
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:12 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S34; 
 Mon, 25 Apr 2022 17:10:57 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
Date: Mon, 25 Apr 2022 17:10:16 +0800
Message-Id: <20220425091027.2877892-33-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S34
X-Coremail-Antispam: 1UD129KBjvAXoWfGw48tF1rAr1xArykGFyDZFb_yoW8CF47uo
 WSvF13Z3W0kr1fArW8KFn8XF12kr12kFZ8Aa92vay5AF4SkFn8Kry3K34Yyr43Jws5tr15
 XasaqrZava9rJr97n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This patch realize the PCH-PIC interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS                         |   1 +
 hw/intc/Kconfig                     |   4 +
 hw/intc/loongarch_pch_pic.c         | 434 ++++++++++++++++++++++++++++
 hw/intc/meson.build                 |   1 +
 hw/intc/trace-events                |   9 +
 hw/loongarch/Kconfig                |   1 +
 include/hw/intc/loongarch_pch_pic.h |  69 +++++
 include/hw/pci-host/ls7a.h          |  30 ++
 8 files changed, 549 insertions(+)
 create mode 100644 hw/intc/loongarch_pch_pic.c
 create mode 100644 include/hw/intc/loongarch_pch_pic.h
 create mode 100644 include/hw/pci-host/ls7a.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c9ba2cc858..1b724a7d35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1136,6 +1136,7 @@ F: hw/loongarch/
 F: include/hw/loongarch/virt.h
 F: include/hw/intc/loongarch_*.h
 F: hw/intc/loongarch_*.c
+F: include/hw/pci-host/ls7a.h
 
 M68K Machines
 -------------
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 6c7e82da64..1fbba2e728 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -87,3 +87,7 @@ config M68K_IRQC
 
 config LOONGARCH_IPI
     bool
+
+config LOONGARCH_PCH_PIC
+    bool
+    select UNIMP
diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
new file mode 100644
index 0000000000..6f8ce55bea
--- /dev/null
+++ b/hw/intc/loongarch_pch_pic.c
@@ -0,0 +1,434 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU Loongson 7A1000 I/O interrupt controller.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/loongarch/virt.h"
+#include "hw/irq.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static void pch_pic_update_irq(LoongArchPCHPIC *s, uint64_t mask, int level)
+{
+    uint64_t val;
+    int irq;
+
+    if (level) {
+        val = mask & s->intirr & ~s->int_mask;
+        if (val) {
+            irq = find_first_bit(&val, 64);
+            s->intisr |= 0x1ULL << irq;
+            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 1);
+        }
+    } else {
+        val = mask & s->intisr;
+        if (val) {
+            irq = find_first_bit(&val, 64);
+            s->intisr &= ~(0x1ULL << irq);
+            qemu_set_irq(s->parent_irq[s->htmsi_vector[irq]], 0);
+        }
+    }
+}
+
+static void pch_pic_irq_handler(void *opaque, int irq, int level)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    uint64_t mask = 1ULL << irq;
+
+    assert(irq < PCH_PIC_IRQ_NUM);
+    trace_loongarch_pch_pic_irq_handler(irq, level);
+
+    if (s->intedge & mask) {
+        /* Edge triggered */
+        if (level) {
+            if ((s->last_intirr & mask) == 0) {
+                s->intirr |= mask;
+            }
+            s->last_intirr |= mask;
+        } else {
+            s->last_intirr &= ~mask;
+        }
+    } else {
+        /* Level triggered */
+        if (level) {
+            s->intirr |= mask;
+            s->last_intirr |= mask;
+        } else {
+            s->intirr &= ~mask;
+            s->last_intirr &= ~mask;
+        }
+    }
+    pch_pic_update_irq(s, mask, level);
+}
+
+static uint64_t loongarch_pch_pic_low_readw(void *opaque, hwaddr addr,
+                                            unsigned size)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    uint64_t val = 0;
+    uint32_t offset = addr & 0xfff;
+
+    switch (offset) {
+    case PCH_PIC_INT_ID_LO:
+        val = PCH_PIC_INT_ID_VAL;
+        break;
+    case PCH_PIC_INT_ID_HI:
+        val = PCH_PIC_INT_ID_NUM;
+        break;
+    case PCH_PIC_INT_MASK_LO:
+        val = (uint32_t)s->int_mask;
+        break;
+    case PCH_PIC_INT_MASK_HI:
+        val = s->int_mask >> 32;
+        break;
+    case PCH_PIC_INT_EDGE_LO:
+        val = (uint32_t)s->intedge;
+        break;
+    case PCH_PIC_INT_EDGE_HI:
+        val = s->intedge >> 32;
+        break;
+    case PCH_PIC_HTMSI_EN_LO:
+        val = (uint32_t)s->htmsi_en;
+        break;
+    case PCH_PIC_HTMSI_EN_HI:
+        val = s->htmsi_en >> 32;
+        break;
+    case PCH_PIC_AUTO_CTRL0_LO:
+    case PCH_PIC_AUTO_CTRL0_HI:
+    case PCH_PIC_AUTO_CTRL1_LO:
+    case PCH_PIC_AUTO_CTRL1_HI:
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_pch_pic_low_readw(size, (uint32_t)addr, val);
+    return val;
+}
+
+static uint64_t get_writew_val(uint64_t value, uint32_t target, bool hi)
+{
+    uint64_t mask = 0xffffffff00000000;
+    uint64_t data = target;
+
+    return hi ? (value & ~mask) | (data << 32) : (value & mask) | data;
+}
+
+static void loongarch_pch_pic_low_writew(void *opaque, hwaddr addr,
+                                         uint64_t value, unsigned size)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    uint32_t offset, old_valid, data = (uint32_t)value;
+    uint64_t old, int_mask;
+    offset = addr & 0xfff;
+
+    trace_loongarch_pch_pic_low_writew(size, (uint32_t)addr, data);
+
+    switch (offset) {
+    case PCH_PIC_INT_MASK_LO:
+        old = s->int_mask;
+        s->int_mask = get_writew_val(old, data, 0);
+        old_valid = (uint32_t)old;
+        if (old_valid & ~data) {
+            pch_pic_update_irq(s, (old_valid & ~data), 1);
+        }
+        if (~old_valid & data) {
+            pch_pic_update_irq(s, (~old_valid & data), 0);
+        }
+        break;
+    case PCH_PIC_INT_MASK_HI:
+        old = s->int_mask;
+        s->int_mask = get_writew_val(old, data, 1);
+        old_valid = (uint32_t)(old >> 32);
+        int_mask = old_valid & ~data;
+        if (int_mask) {
+            pch_pic_update_irq(s, int_mask << 32, 1);
+        }
+        int_mask = ~old_valid & data;
+        if (int_mask) {
+            pch_pic_update_irq(s, int_mask << 32, 0);
+        }
+        break;
+    case PCH_PIC_INT_EDGE_LO:
+        s->intedge = get_writew_val(s->intedge, data, 0);
+        break;
+    case PCH_PIC_INT_EDGE_HI:
+        s->intedge = get_writew_val(s->intedge, data, 1);
+        break;
+    case PCH_PIC_INT_CLEAR_LO:
+        if (s->intedge & data) {
+            s->intirr &= (~data);
+            pch_pic_update_irq(s, data, 0);
+            s->intisr &= (~data);
+        }
+        break;
+    case PCH_PIC_INT_CLEAR_HI:
+        value <<= 32;
+        if (s->intedge & value) {
+            s->intirr &= (~value);
+            pch_pic_update_irq(s, value, 0);
+            s->intisr &= (~value);
+        }
+        break;
+    case PCH_PIC_HTMSI_EN_LO:
+        s->htmsi_en = get_writew_val(s->htmsi_en, data, 0);
+        break;
+    case PCH_PIC_HTMSI_EN_HI:
+        s->htmsi_en = get_writew_val(s->htmsi_en, data, 1);
+        break;
+    case PCH_PIC_AUTO_CTRL0_LO:
+    case PCH_PIC_AUTO_CTRL0_HI:
+    case PCH_PIC_AUTO_CTRL1_LO:
+    case PCH_PIC_AUTO_CTRL1_HI:
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t loongarch_pch_pic_high_readw(void *opaque, hwaddr addr,
+                                        unsigned size)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    uint64_t val = 0;
+    uint32_t offset = addr & 0xfff;
+
+    switch (offset) {
+    case STATUS_LO_START:
+        val = (uint32_t)(s->intisr & (~s->int_mask));
+        break;
+    case STATUS_HI_START:
+        val = (s->intisr & (~s->int_mask)) >> 32;
+        break;
+    case POL_LO_START:
+        val = (uint32_t)s->int_polarity;
+        break;
+    case POL_HI_START:
+        val = s->int_polarity >> 32;
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_pch_pic_high_readw(size, (uint32_t)addr, val);
+    return val;
+}
+
+static void loongarch_pch_pic_high_writew(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    uint32_t offset, data = (uint32_t)value;
+    offset = addr & 0xfff;
+
+    trace_loongarch_pch_pic_high_writew(size, (uint32_t)addr, data);
+
+    switch (offset) {
+    case STATUS_LO_START:
+        s->intisr = get_writew_val(s->intisr, data, 0);
+        break;
+    case STATUS_HI_START:
+        s->intisr = get_writew_val(s->intisr, data, 1);
+        break;
+    case POL_LO_START:
+        s->int_polarity = get_writew_val(s->int_polarity, data, 0);
+        break;
+    case POL_HI_START:
+        s->int_polarity = get_writew_val(s->int_polarity, data, 1);
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t loongarch_pch_pic_readb(void *opaque, hwaddr addr,
+                                        unsigned size)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    uint64_t val = 0;
+    uint32_t offset = (addr & 0xfff) + PCH_PIC_ROUTE_ENTRY_OFFSET;
+    int64_t offset_tmp;
+
+    switch (offset) {
+    case PCH_PIC_HTMSI_VEC_OFFSET ... PCH_PIC_HTMSI_VEC_END:
+        offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
+        if (offset_tmp >= 0 && offset_tmp < 64) {
+            val = s->htmsi_vector[offset_tmp];
+        }
+        break;
+    case PCH_PIC_ROUTE_ENTRY_OFFSET ... PCH_PIC_ROUTE_ENTRY_END:
+        offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
+        if (offset_tmp >= 0 && offset_tmp < 64) {
+            val = s->route_entry[offset_tmp];
+        }
+        break;
+    default:
+        break;
+    }
+
+    trace_loongarch_pch_pic_readb(size, (uint32_t)addr, val);
+    return val;
+}
+
+static void loongarch_pch_pic_writeb(void *opaque, hwaddr addr,
+                                     uint64_t data, unsigned size)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(opaque);
+    int32_t offset_tmp;
+    uint32_t offset = (addr & 0xfff) + PCH_PIC_ROUTE_ENTRY_OFFSET;
+
+    trace_loongarch_pch_pic_writeb(size, (uint32_t)addr, data);
+
+    switch (offset) {
+    case PCH_PIC_HTMSI_VEC_OFFSET ... PCH_PIC_HTMSI_VEC_END:
+        offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
+        if (offset_tmp >= 0 && offset_tmp < 64) {
+            s->htmsi_vector[offset_tmp] = (uint8_t)(data & 0xff);
+        }
+        break;
+    case PCH_PIC_ROUTE_ENTRY_OFFSET ... PCH_PIC_ROUTE_ENTRY_END:
+        offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
+        if (offset_tmp >= 0 && offset_tmp < 64) {
+            s->route_entry[offset_tmp] = (uint8_t)(data & 0xff);
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps loongarch_pch_pic_reg32_low_ops = {
+    .read = loongarch_pch_pic_low_readw,
+    .write = loongarch_pch_pic_low_writew,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static const MemoryRegionOps loongarch_pch_pic_reg32_high_ops = {
+    .read = loongarch_pch_pic_high_readw,
+    .write = loongarch_pch_pic_high_writew,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static const MemoryRegionOps loongarch_pch_pic_reg8_ops = {
+    .read = loongarch_pch_pic_readb,
+    .write = loongarch_pch_pic_writeb,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void loongarch_pch_pic_reset(DeviceState *d)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(d);
+    int i;
+
+    s->int_mask = -1;
+    s->htmsi_en = 0x0;
+    s->intedge  = 0x0;
+    s->intclr   = 0x0;
+    s->auto_crtl0 = 0x0;
+    s->auto_crtl1 = 0x0;
+    for (i = 0; i < 64; i++) {
+        s->route_entry[i] = 0x1;
+        s->htmsi_vector[i] = 0x0;
+    }
+    s->intirr = 0x0;
+    s->intisr = 0x0;
+    s->last_intirr = 0x0;
+    s->int_polarity = 0x0;
+}
+
+static void loongarch_pch_pic_init(Object *obj)
+{
+    LoongArchPCHPIC *s = LOONGARCH_PCH_PIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    memory_region_init_io(&s->iomem32_low, obj,
+                          &loongarch_pch_pic_reg32_low_ops,
+                          s, PCH_PIC_NAME(.reg32_part1), 0x100);
+    memory_region_init_io(&s->iomem8, obj, &loongarch_pch_pic_reg8_ops,
+                          s, PCH_PIC_NAME(.reg8), 0x2a0);
+    memory_region_init_io(&s->iomem32_high, obj,
+                          &loongarch_pch_pic_reg32_high_ops,
+                          s, PCH_PIC_NAME(.reg32_part2), 0xc60);
+    sysbus_init_mmio(sbd, &s->iomem32_low);
+    sysbus_init_mmio(sbd, &s->iomem8);
+    sysbus_init_mmio(sbd, &s->iomem32_high);
+
+    for (i = 0; i < PCH_PIC_IRQ_NUM; i++) {
+        sysbus_init_irq(sbd, &s->parent_irq[i]);
+    }
+    qdev_init_gpio_in(DEVICE(obj), pch_pic_irq_handler, PCH_PIC_IRQ_NUM);
+}
+
+static const VMStateDescription vmstate_loongarch_pch_pic = {
+    .name = TYPE_LOONGARCH_PCH_PIC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(int_mask, LoongArchPCHPIC),
+        VMSTATE_UINT64(htmsi_en, LoongArchPCHPIC),
+        VMSTATE_UINT64(intedge, LoongArchPCHPIC),
+        VMSTATE_UINT64(intclr, LoongArchPCHPIC),
+        VMSTATE_UINT64(auto_crtl0, LoongArchPCHPIC),
+        VMSTATE_UINT64(auto_crtl1, LoongArchPCHPIC),
+        VMSTATE_UINT8_ARRAY(route_entry, LoongArchPCHPIC, 64),
+        VMSTATE_UINT8_ARRAY(htmsi_vector, LoongArchPCHPIC, 64),
+        VMSTATE_UINT64(last_intirr, LoongArchPCHPIC),
+        VMSTATE_UINT64(intirr, LoongArchPCHPIC),
+        VMSTATE_UINT64(intisr, LoongArchPCHPIC),
+        VMSTATE_UINT64(int_polarity, LoongArchPCHPIC),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void loongarch_pch_pic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = loongarch_pch_pic_reset;
+    dc->vmsd = &vmstate_loongarch_pch_pic;
+}
+
+static const TypeInfo loongarch_pch_pic_info = {
+    .name          = TYPE_LOONGARCH_PCH_PIC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LoongArchPCHPIC),
+    .instance_init = loongarch_pch_pic_init,
+    .class_init    = loongarch_pch_pic_class_init,
+};
+
+static void loongarch_pch_pic_register_types(void)
+{
+    type_register_static(&loongarch_pch_pic_info);
+}
+
+type_init(loongarch_pch_pic_register_types)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index bf5ab44a78..960ce81a92 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -63,3 +63,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index be8d5b167e..1f343676ee 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -291,3 +291,12 @@ sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
 # loongarch_ipi.c
 loongarch_ipi_read(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
 loongarch_ipi_write(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
+
+# loongarch_pch_pic.c
+loongarch_pch_pic_irq_handler(int irq, int level) "irq %d level %d"
+loongarch_pch_pic_low_readw(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_pch_pic_low_writew(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_pch_pic_high_readw(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_pch_pic_high_writew(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_pch_pic_readb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index f0dad3329a..2df45f7e8f 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -3,3 +3,4 @@ config LOONGARCH_VIRT
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
     select LOONGARCH_IPI
+    select LOONGARCH_PCH_PIC
diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
new file mode 100644
index 0000000000..2d4aa9ed6f
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_pic.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
+#define PCH_PIC_NAME(name) TYPE_LOONGARCH_PCH_PIC#name
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHPIC, LOONGARCH_PCH_PIC)
+
+#define PCH_PIC_IRQ_START               0
+#define PCH_PIC_IRQ_END                 63
+#define PCH_PIC_IRQ_NUM                 64
+#define PCH_PIC_INT_ID_VAL              0x7000000UL
+#define PCH_PIC_INT_ID_NUM              0x3f0001UL
+
+#define PCH_PIC_INT_ID_LO               0x00
+#define PCH_PIC_INT_ID_HI               0x04
+#define PCH_PIC_INT_MASK_LO             0x20
+#define PCH_PIC_INT_MASK_HI             0x24
+#define PCH_PIC_HTMSI_EN_LO             0x40
+#define PCH_PIC_HTMSI_EN_HI             0x44
+#define PCH_PIC_INT_EDGE_LO             0x60
+#define PCH_PIC_INT_EDGE_HI             0x64
+#define PCH_PIC_INT_CLEAR_LO            0x80
+#define PCH_PIC_INT_CLEAR_HI            0x84
+#define PCH_PIC_AUTO_CTRL0_LO           0xc0
+#define PCH_PIC_AUTO_CTRL0_HI           0xc4
+#define PCH_PIC_AUTO_CTRL1_LO           0xe0
+#define PCH_PIC_AUTO_CTRL1_HI           0xe4
+#define PCH_PIC_ROUTE_ENTRY_OFFSET      0x100
+#define PCH_PIC_ROUTE_ENTRY_END         0x13f
+#define PCH_PIC_HTMSI_VEC_OFFSET        0x200
+#define PCH_PIC_HTMSI_VEC_END           0x23f
+#define PCH_PIC_INT_STATUS_LO           0x3a0
+#define PCH_PIC_INT_STATUS_HI           0x3a4
+#define PCH_PIC_INT_POL_LO              0x3e0
+#define PCH_PIC_INT_POL_HI              0x3e4
+
+#define STATUS_LO_START                 0
+#define STATUS_HI_START                 0x4
+#define POL_LO_START                    0x40
+#define POL_HI_START                    0x44
+struct LoongArchPCHPIC {
+    SysBusDevice parent_obj;
+    qemu_irq parent_irq[64];
+    uint64_t int_mask; /*0x020 interrupt mask register*/
+    uint64_t htmsi_en; /*0x040 1=msi*/
+    uint64_t intedge; /*0x060 edge=1 level  =0*/
+    uint64_t intclr; /*0x080 for clean edge int,set 1 clean,set 0 is noused*/
+    uint64_t auto_crtl0; /*0x0c0*/
+    uint64_t auto_crtl1; /*0x0e0*/
+    uint64_t last_intirr;    /* edge detection */
+    uint64_t intirr; /* 0x380 interrupt request register */
+    uint64_t intisr; /* 0x3a0 interrupt service register */
+    /*
+     * 0x3e0 interrupt level polarity selection
+     * register 0 for high level trigger
+     */
+    uint64_t int_polarity;
+
+    uint8_t route_entry[64]; /*0x100 - 0x138*/
+    uint8_t htmsi_vector[64]; /*0x200 - 0x238*/
+
+    MemoryRegion iomem32_low;
+    MemoryRegion iomem32_high;
+    MemoryRegion iomem8;
+};
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
2.31.1


