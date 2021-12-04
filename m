Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051414684CA
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:28:09 +0100 (CET)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtU9A-0002ug-17
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpd-0007eV-Dy
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58326 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpa-0003IJ-Gt
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:57 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S20; 
 Sat, 04 Dec 2021 20:07:39 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 18/27] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
Date: Sat,  4 Dec 2021 20:07:16 +0800
Message-Id: <1638619645-11283-19-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S20
X-Coremail-Antispam: 1UD129KBjvAXoWfGw45trWkXr45GF4Dtr4fXwb_yoW8XFykGo
 WYqFn0va40kr1rCrW0kFn0gF1jkw12kFW5Aa92va9xAF4fZr15Gryak3s0yr43Jw4ktr15
 X34Fgr4fAa9rAr17n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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

This patch realize the PCH-PIC interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                     |   4 +
 hw/intc/loongarch_pch_pic.c         | 357 ++++++++++++++++++++++++++++
 hw/intc/meson.build                 |   1 +
 hw/intc/trace-events                |   5 +
 hw/loongarch/Kconfig                |   1 +
 include/hw/intc/loongarch_pch_pic.h |  61 +++++
 6 files changed, 429 insertions(+)
 create mode 100644 hw/intc/loongarch_pch_pic.c
 create mode 100644 include/hw/intc/loongarch_pch_pic.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 511dcac537..96da13ad1d 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -76,3 +76,7 @@ config M68K_IRQC
 
 config LOONGARCH_IPI
     bool
+
+config LOONGARCH_PCH_PIC
+    bool
+    select UNIMP
diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
new file mode 100644
index 0000000000..2ede29ceb0
--- /dev/null
+++ b/hw/intc/loongarch_pch_pic.c
@@ -0,0 +1,357 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU Loongson 7A1000 I/O interrupt controller.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/loongarch/loongarch.h"
+#include "hw/irq.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+#define for_each_set_bit(bit, addr, size) \
+         for ((bit) = find_first_bit((addr), (size));            \
+              (bit) < (size);                                    \
+              (bit) = find_next_bit((addr), (size), (bit) + 1))
+
+static void pch_pic_update_irq(loongarch_pch_pic *s, uint64_t mask, int level)
+{
+    int i;
+    uint64_t val;
+    val = mask & s->intirr & (~s->int_mask);
+
+    for_each_set_bit(i, &val, 64) {
+        if (level == 1) {
+            if ((s->intisr & (0x1ULL << i)) == 0) {
+                s->intisr |= 1ULL << i;
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[i]], 1);
+            }
+        } else if (level == 0) {
+            if (s->intisr & (0x1ULL << i)) {
+                s->intisr &= ~(0x1ULL << i);
+                qemu_set_irq(s->parent_irq[s->htmsi_vector[i]], 0);
+            }
+        }
+    }
+}
+
+static void pch_pic_irq_handler(void *opaque, int irq, int level)
+{
+    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(opaque);
+
+    assert(irq < PCH_PIC_IRQ_NUM);
+    uint64_t mask = 1ULL << irq;
+
+    trace_pch_pic_irq_handler(s->intedge, irq, level);
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
+
+    }
+    pch_pic_update_irq(s, mask, level);
+}
+
+static uint64_t loongarch_pch_pic_reg_read(void *opaque, hwaddr addr,
+                                           unsigned size)
+{
+    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(opaque);
+    uint64_t val = 0;
+    uint32_t offset = addr & 0xfff;
+    int64_t offset_tmp;
+
+    if (size == 8) {
+        switch (offset) {
+        case PCH_PIC_INT_ID_OFFSET:
+            val = (PCH_PIC_INT_ID_NUM << 32) | PCH_PIC_INT_ID_VAL;
+            break;
+        case PCH_PIC_INT_MASK_OFFSET:
+            val =  s->int_mask;
+            break;
+        case PCH_PIC_INT_STATUS_OFFSET:
+            val = s->intisr & (~s->int_mask);
+            break;
+        case PCH_PIC_INT_EDGE_OFFSET:
+            val = s->intedge;
+            break;
+        case PCH_PIC_INT_POL_OFFSET:
+            val = s->int_polarity;
+            break;
+        case PCH_PIC_HTMSI_EN_OFFSET...PCH_PIC_HTMSI_EN_END:
+            val = s->htmsi_en;
+            break;
+        case PCH_PIC_AUTO_CTRL0_OFFSET...PCH_PIC_AUTO_CTRL0_END:
+        case PCH_PIC_AUTO_CTRL1_OFFSET...PCH_PIC_AUTO_CTRL1_END:
+            break;
+        default:
+            break;
+        }
+    } else if (size == 4) {
+        switch (offset) {
+        case PCH_PIC_INT_ID_OFFSET:
+            val = PCH_PIC_INT_ID_VAL;
+            break;
+        case PCH_PIC_INT_ID_OFFSET + 4:
+            val = PCH_PIC_INT_ID_NUM;
+            break;
+        case PCH_PIC_INT_MASK_OFFSET...PCH_PIC_INT_MASK_END:
+            val = ldl_p((void *)&s->int_mask +
+                        (offset - PCH_PIC_INT_MASK_OFFSET));
+            break;
+        case PCH_PIC_INT_STATUS_OFFSET...PCH_PIC_INT_STATUS_END:
+            val = ldl_p((void *)&s->intisr +
+                        (offset - PCH_PIC_INT_STATUS_OFFSET)) & (~s->int_mask);
+            break;
+        case PCH_PIC_INT_EDGE_OFFSET...PCH_PIC_INT_EDGE_END:
+            val = ldl_p((void *)&s->intedge +
+                        (offset - PCH_PIC_INT_EDGE_OFFSET));
+            break;
+        case PCH_PIC_INT_POL_OFFSET...PCH_PIC_INT_POL_END:
+            val = ldl_p((void *)&s->int_polarity +
+                        (offset - PCH_PIC_INT_POL_OFFSET));
+            break;
+        case PCH_PIC_HTMSI_EN_OFFSET...PCH_PIC_HTMSI_EN_END:
+            val = ldl_p((void *)&s->htmsi_en +
+                        (offset - PCH_PIC_HTMSI_EN_OFFSET));
+            break;
+        case PCH_PIC_AUTO_CTRL0_OFFSET...PCH_PIC_AUTO_CTRL0_END:
+        case PCH_PIC_AUTO_CTRL1_OFFSET...PCH_PIC_AUTO_CTRL1_END:
+            break;
+        default:
+            break;
+        }
+    } else if (size == 1) {
+        if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
+            offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 64) {
+                val = s->htmsi_vector[offset_tmp];
+            }
+        } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
+            offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 64) {
+                val = s->route_entry[offset_tmp];
+            }
+        }
+    }
+
+    trace_loongarch_pch_pic_read(size, (uint32_t)addr, val);
+    return val;
+}
+
+static void loongarch_pch_pic_reg_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(opaque);
+    int32_t offset_tmp;
+    uint32_t offset, old;
+    offset = addr & 0xfff;
+
+    trace_loongarch_pch_pic_write(size, (uint32_t)addr, data);
+
+    if (size == 8) {
+        switch (offset) {
+        case PCH_PIC_INT_MASK_OFFSET:
+            old = s->int_mask;
+            s->int_mask = data;
+            if (old & ~data) {
+                pch_pic_update_irq(s, (old & ~data), 1);
+            } else if (~old & data) {
+                pch_pic_update_irq(s, (~old & data), 0);
+            }
+            break;
+        case PCH_PIC_INT_STATUS_OFFSET:
+            s->intisr = data;
+            break;
+        case PCH_PIC_INT_EDGE_OFFSET:
+            s->intedge = data;
+            break;
+        case PCH_PIC_INT_CLEAR_OFFSET:
+            s->intirr &= (~(data & s->intedge));
+            pch_pic_update_irq(s, data, 0);
+            s->intisr &= (~data);
+            break;
+        case PCH_PIC_INT_POL_OFFSET:
+            s->int_polarity = data;
+            break;
+        case PCH_PIC_HTMSI_EN_OFFSET:
+            s->htmsi_en = data;
+            break;
+        case PCH_PIC_AUTO_CTRL0_OFFSET:
+        case PCH_PIC_AUTO_CTRL1_OFFSET:
+            break;
+        default:
+            break;
+        }
+    } else if (size == 4) {
+        switch (offset) {
+        case PCH_PIC_INT_MASK_OFFSET...PCH_PIC_INT_MASK_END:
+            offset -= PCH_PIC_INT_MASK_OFFSET;
+            old = ldl_p((void *)&s->int_mask + offset);
+            stl_p((void *)&s->int_mask + offset, data);
+
+            if (old & ~data) {
+                pch_pic_update_irq(s, (old & ~data), 1);
+            } else if (~old & data) {
+                pch_pic_update_irq(s, (~old & data), 0);
+            }
+            break;
+        case PCH_PIC_INT_STATUS_OFFSET...PCH_PIC_INT_STATUS_END:
+            stl_p((void *)&s->intisr + (offset - PCH_PIC_INT_STATUS_OFFSET),
+                  data);
+            break;
+        case PCH_PIC_INT_EDGE_OFFSET...PCH_PIC_INT_EDGE_END:
+            stl_p((void *)&s->intedge + (offset - PCH_PIC_INT_EDGE_OFFSET),
+                  data);
+            break;
+        case PCH_PIC_INT_CLEAR_OFFSET...PCH_PIC_INT_CLEAR_END:
+            old = s->intirr & (~(data & s->intedge));
+            stl_p((void *)&s->intirr + (offset - PCH_PIC_INT_CLEAR_OFFSET),
+                  old);
+            pch_pic_update_irq(s, data, 0);
+            old = s->intisr & (~data);
+            stl_p((void *)&s->intisr + (offset - PCH_PIC_INT_CLEAR_OFFSET),
+                  old);
+            break;
+        case PCH_PIC_INT_POL_OFFSET...PCH_PIC_INT_POL_END:
+            stl_p((void *)&s->int_polarity + (offset - PCH_PIC_INT_POL_OFFSET),
+                  data);
+            break;
+        case PCH_PIC_HTMSI_EN_OFFSET...PCH_PIC_HTMSI_EN_END:
+            stl_p((void *)&s->htmsi_en + (offset - PCH_PIC_HTMSI_EN_OFFSET),
+                  data);
+            break;
+        case PCH_PIC_AUTO_CTRL0_OFFSET...PCH_PIC_AUTO_CTRL0_END:
+        case PCH_PIC_AUTO_CTRL1_OFFSET...PCH_PIC_AUTO_CTRL1_END:
+            break;
+        default:
+            break;
+        }
+    } else if (size == 1) {
+        if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
+            offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 64) {
+                s->htmsi_vector[offset_tmp] = (uint8_t)(data & 0xff);
+            }
+        } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
+            offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 64) {
+                s->route_entry[offset_tmp] = (uint8_t)(data & 0xff);
+            }
+        }
+    }
+}
+
+static const MemoryRegionOps loongarch_pch_pic_ops = {
+    .read = loongarch_pch_pic_reg_read,
+    .write = loongarch_pch_pic_reg_write,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void loongarch_pch_pic_reset(DeviceState *d)
+{
+    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(d);
+    int i;
+
+    s->int_mask = -1ULL;
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
+    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    memory_region_init_io(&s->iomem, obj, &loongarch_pch_pic_ops,
+                          s, TYPE_LOONGARCH_PCH_PIC, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
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
+        VMSTATE_UINT64(int_mask, loongarch_pch_pic),
+        VMSTATE_UINT64(htmsi_en, loongarch_pch_pic),
+        VMSTATE_UINT64(intedge, loongarch_pch_pic),
+        VMSTATE_UINT64(intclr, loongarch_pch_pic),
+        VMSTATE_UINT64(auto_crtl0, loongarch_pch_pic),
+        VMSTATE_UINT64(auto_crtl1, loongarch_pch_pic),
+        VMSTATE_UINT8_ARRAY(route_entry, loongarch_pch_pic, 64),
+        VMSTATE_UINT8_ARRAY(htmsi_vector, loongarch_pch_pic, 64),
+        VMSTATE_UINT64(last_intirr, loongarch_pch_pic),
+        VMSTATE_UINT64(intirr, loongarch_pch_pic),
+        VMSTATE_UINT64(intisr, loongarch_pch_pic),
+        VMSTATE_UINT64(int_polarity, loongarch_pch_pic),
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
+    .instance_size = sizeof(loongarch_pch_pic),
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
index 51f0c3988a..33ba63266e 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -58,3 +58,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 124608e51f..52fedf82be 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -250,3 +250,8 @@ sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
 # loongarch_ipi.c
 loongarch_ipi_read(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%"PRIx64
 loongarch_ipi_write(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%"PRIx64
+
+# loongarch_pch_pic.c
+pch_pic_irq_handler(uint32_t edge, int irq, int level) "edge 0x%02x irq %d level %d"
+loongarch_pch_pic_read(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_pch_pic_write(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 1591574397..c2b8046b94 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,3 +2,4 @@ config LOONGSON3_LS7A
     bool
     select PCI_EXPRESS_7A
     select LOONGARCH_IPI
+    select LOONGARCH_PCH_PIC
diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
new file mode 100644
index 0000000000..bc04ed28ef
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_pic.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
+DECLARE_INSTANCE_CHECKER(struct loongarch_pch_pic, LOONGARCH_PCH_PIC,
+                         TYPE_LOONGARCH_PCH_PIC)
+
+#define PCH_PIC_IRQ_START               0
+#define PCH_PIC_IRQ_END                 63
+#define PCH_PIC_IRQ_NUM                 64
+#define PCH_PIC_INT_ID_VAL              0x7000000UL
+#define PCH_PIC_INT_ID_NUM              0x3f0001UL
+
+#define PCH_PIC_INT_ID_OFFSET           0x00
+#define PCH_PIC_INT_ID_END              0x07
+#define PCH_PIC_INT_MASK_OFFSET         0x20
+#define PCH_PIC_INT_MASK_END            0x27
+#define PCH_PIC_HTMSI_EN_OFFSET         0x40
+#define PCH_PIC_HTMSI_EN_END            0x47
+#define PCH_PIC_INT_EDGE_OFFSET         0x60
+#define PCH_PIC_INT_EDGE_END            0x67
+#define PCH_PIC_INT_CLEAR_OFFSET        0x80
+#define PCH_PIC_INT_CLEAR_END           0x87
+#define PCH_PIC_AUTO_CTRL0_OFFSET       0xc0
+#define PCH_PIC_AUTO_CTRL0_END          0xc7
+#define PCH_PIC_AUTO_CTRL1_OFFSET       0xe0
+#define PCH_PIC_AUTO_CTRL1_END          0xe8
+#define PCH_PIC_ROUTE_ENTRY_OFFSET      0x100
+#define PCH_PIC_ROUTE_ENTRY_END         0x13f
+#define PCH_PIC_HTMSI_VEC_OFFSET        0x200
+#define PCH_PIC_HTMSI_VEC_END           0x23f
+#define PCH_PIC_INT_STATUS_OFFSET       0x3a0
+#define PCH_PIC_INT_STATUS_END          0x3a7
+#define PCH_PIC_INT_POL_OFFSET          0x3e0
+#define PCH_PIC_INT_POL_END             0x3e7
+
+typedef struct loongarch_pch_pic {
+    SysBusDevice parent_obj;
+    qemu_irq parent_irq[64];
+    uint64_t int_mask; /*0x020 interrupt mask register*/
+    uint64_t htmsi_en;/*0x040 1=msi*/
+    uint64_t intedge; /*0x060 edge=1 level  =0*/
+    uint64_t intclr; /*0x080 for clean edge int,set 1 clean,set 0 is noused*/
+    uint64_t auto_crtl0; /*0x0c0*/
+    uint64_t auto_crtl1; /*0x0e0*/
+    uint8_t route_entry[64]; /*0x100 - 0x138*/
+    uint8_t htmsi_vector[64]; /*0x200 - 0x238*/
+    uint64_t last_intirr;    /* edge detection */
+    uint64_t intirr; /* 0x380 interrupt request register */
+    uint64_t intisr; /* 0x3a0 interrupt service register */
+    /*
+     * 0x3e0 interrupt level polarity selection
+     * register 0 for high level trigger
+     */
+    uint64_t int_polarity;
+    MemoryRegion iomem;
+} loongarch_pch_pic;
-- 
2.27.0


