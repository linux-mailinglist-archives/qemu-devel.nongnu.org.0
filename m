Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50523432FF6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:44:05 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjn2-00077r-Bu
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfG-0001sl-15
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35114 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjfB-0004aw-Hy
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:01 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S19; 
 Tue, 19 Oct 2021 15:35:41 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/31] hw/intc: Add loongarch ls7a interrupt controller
 support(PCH-PIC)
Date: Tue, 19 Oct 2021 15:35:03 +0800
Message-Id: <1634628917-10031-18-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S19
X-Coremail-Antispam: 1UD129KBjvJXoWfGw4rXF4ktF1xur18uw1DGFg_yoWkJF18pF
 ZrCas0vrs7Jr47WrZ7Ja4rJrn3GFn7u3429anIkFyxCrs3Jry8XFn2yr9rWFyUK3yDJrya
 qFZ5Gay293WUGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Mailman-Version: 2.1.23
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
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch realize the PCH-PIC interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                     |   4 +
 hw/intc/loongarch_pch_pic.c         | 284 ++++++++++++++++++++++++++++
 hw/intc/meson.build                 |   1 +
 hw/loongarch/Kconfig                |   1 +
 include/hw/intc/loongarch_pch_pic.h |  50 +++++
 5 files changed, 340 insertions(+)
 create mode 100644 hw/intc/loongarch_pch_pic.c
 create mode 100644 include/hw/intc/loongarch_pch_pic.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 78aed93c45..3b7eca7b03 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -73,3 +73,7 @@ config GOLDFISH_PIC
 
 config M68K_IRQC
     bool
+
+config LOONGARCH_PCH_PIC
+    bool
+    select UNIMP
diff --git a/hw/intc/loongarch_pch_pic.c b/hw/intc/loongarch_pch_pic.c
new file mode 100644
index 0000000000..9d0673b98a
--- /dev/null
+++ b/hw/intc/loongarch_pch_pic.c
@@ -0,0 +1,284 @@
+/*
+ * QEMU Loongson 7A1000 I/O interrupt controller.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "migration/vmstate.h"
+
+#define DEBUG_LOONGARCH_PCH_PIC 0
+
+#define DPRINTF(fmt, ...) \
+do { \
+    if (DEBUG_LOONGARCH_PCH_PIC) { \
+        fprintf(stderr, "LOONGARCH_PCH_PIC: " fmt , ## __VA_ARGS__); \
+    } \
+} while (0)
+
+ #define for_each_set_bit(bit, addr, size) \
+         for ((bit) = find_first_bit((addr), (size));            \
+              (bit) < (size);                                    \
+              (bit) = find_next_bit((addr), (size), (bit) + 1))
+
+static void update_irq(loongarch_pch_pic *s, int mask, int level)
+{
+    int i;
+    uint64_t val;
+    val = mask & s->intirr & (~s->int_mask);
+
+    for_each_set_bit(i, &val, 32) {
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
+static void irq_handler(void *opaque, int irq, int level)
+{
+    loongarch_pch_pic *s = opaque;
+
+    assert(irq < 32);
+    uint32_t mask = 1ULL << irq;
+    DPRINTF("------ %s irq %d %d\n", __func__, irq, level);
+
+    if (s->intedge & mask) {
+        /* edge triggered */
+        if (level) {
+            if ((s->last_intirr & mask) == 0) {
+                s->intirr |= mask;
+            }
+            s->last_intirr |= mask;
+        } else {
+            s->last_intirr &= ~mask;
+        }
+    } else {
+        /* level triggered */
+        if (level) {
+            s->intirr |= mask;
+            s->last_intirr |= mask;
+        } else {
+            s->intirr &= ~mask;
+            s->last_intirr &= ~mask;
+        }
+
+    }
+    update_irq(s, mask, level);
+}
+
+static uint64_t loongarch_pch_pic_reg_read(void *opaque, hwaddr addr,
+                                           unsigned size)
+{
+    loongarch_pch_pic *s = opaque;
+    uint32_t val = 0;
+    uint32_t offset;
+    int32_t offset_tmp;
+    offset = addr & 0xfff;
+    if (4 == size) {
+        switch (offset) {
+        case PCH_PIC_INT_ID_OFFSET:
+            val = PCH_PIC_INT_ID_VAL;
+            break;
+        case PCH_PIC_INT_MASK_OFFSET:
+            val = s->int_mask;
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
+        case PCH_PIC_HTMSI_EN_OFFSET:
+            val = s->htmsi_en;
+            break;
+        case PCH_PIC_AUTO_CTRL0_OFFSET:
+        case PCH_PIC_AUTO_CTRL1_OFFSET:
+            break;
+        default:
+            break;
+        }
+    } else if (1 == size) {
+        if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
+            offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 32) {
+                val = s->htmsi_vector[offset_tmp];
+            }
+        } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
+            offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 32) {
+                val = s->route_entry[offset_tmp];
+            }
+        }
+    }
+
+    return val;
+}
+
+static void loongarch_pch_pic_reg_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    loongarch_pch_pic *s = opaque;
+    int32_t offset_tmp;
+    uint32_t offset, old;
+    offset = addr & 0xfff;
+
+    if (4 == size) {
+        switch (offset) {
+        case PCH_PIC_INT_MASK_OFFSET:
+            old = s->int_mask;
+            s->int_mask = data;
+            if (old & ~data) {
+                update_irq(s, (old & ~data), 1);
+            } else if (~old & data) {
+                update_irq(s, (~old & data), 0);
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
+            update_irq(s, data, 0);
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
+    } else if (1 == size) {
+        if (offset >= PCH_PIC_HTMSI_VEC_OFFSET) {
+            offset_tmp = offset - PCH_PIC_HTMSI_VEC_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 32) {
+                s->htmsi_vector[offset_tmp] = (uint8_t)(data & 0xff);
+            }
+        } else if (offset >=  PCH_PIC_ROUTE_ENTRY_OFFSET) {
+            offset_tmp = offset - PCH_PIC_ROUTE_ENTRY_OFFSET;
+            if (offset_tmp >= 0 && offset_tmp < 32) {
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
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void loongarch_pch_pic_reset(DeviceState *d)
+{
+    loongarch_pch_pic *s = LOONGARCH_PCH_PIC(d);
+    int i;
+
+    s->int_id   = 0x0;
+    s->int_mask = 0xffffffff;
+    s->htmsi_en = 0x0;
+    s->intedge  = 0x0;
+    s->intclr   = 0x0;
+    s->auto_crtl0 = 0x0;
+    s->auto_crtl1 = 0x0;
+    for (i = 0; i < 32; i++) {
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
+    int tmp;
+
+    memory_region_init_io(&s->iomem, obj, &loongarch_pch_pic_ops,
+                          s, TYPE_LOONGARCH_PCH_PIC, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    for (tmp = 0; tmp < 32; tmp++) {
+        sysbus_init_irq(sbd, &s->parent_irq[tmp]);
+    }
+    qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
+}
+
+static const VMStateDescription vmstate_loongarch_pch_pic = {
+    .name = TYPE_LOONGARCH_PCH_PIC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(int_mask, loongarch_pch_pic),
+        VMSTATE_UINT32(htmsi_en, loongarch_pch_pic),
+        VMSTATE_UINT32(intedge, loongarch_pch_pic),
+        VMSTATE_UINT32(intclr, loongarch_pch_pic),
+        VMSTATE_UINT32(auto_crtl0, loongarch_pch_pic),
+        VMSTATE_UINT32(auto_crtl1, loongarch_pch_pic),
+        VMSTATE_UINT8_ARRAY(route_entry, loongarch_pch_pic, 32),
+        VMSTATE_UINT8_ARRAY(htmsi_vector, loongarch_pch_pic, 32),
+        VMSTATE_UINT32(last_intirr, loongarch_pch_pic),
+        VMSTATE_UINT32(intirr, loongarch_pch_pic),
+        VMSTATE_UINT32(intisr, loongarch_pch_pic),
+        VMSTATE_UINT32(int_polarity, loongarch_pch_pic),
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
index a1d00aa48d..c61f171d5c 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -58,3 +58,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 720822f32c..c6d7ebcd5b 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -1,3 +1,4 @@
 config LOONGSON_3A5000
     bool
     select PCI_EXPRESS_7A
+    select LOONGARCH_PCH_PIC
diff --git a/include/hw/intc/loongarch_pch_pic.h b/include/hw/intc/loongarch_pch_pic.h
new file mode 100644
index 0000000000..f85606de78
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_pic.h
@@ -0,0 +1,50 @@
+/*
+ * Loongarch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#define TYPE_LOONGARCH_PCH_PIC "loongarch_pch_pic"
+DECLARE_INSTANCE_CHECKER(struct loongarch_pch_pic, LOONGARCH_PCH_PIC,
+                         TYPE_LOONGARCH_PCH_PIC)
+
+#define PCH_PIC_ROUTE_ENTRY_OFFSET      0x100
+#define PCH_PIC_INT_ID_OFFSET           0x00
+#define PCH_PIC_INT_ID_VAL              0x7000000UL
+#define PCH_PIC_INT_ID_VER              0x1f0001UL
+#define PCH_PIC_INT_MASK_OFFSET         0x20
+#define PCH_PIC_INT_EDGE_OFFSET         0x60
+#define PCH_PIC_INT_CLEAR_OFFSET        0x80
+#define PCH_PIC_INT_STATUS_OFFSET       0x3a0
+#define PCH_PIC_INT_POL_OFFSET          0x3e0
+#define PCH_PIC_HTMSI_EN_OFFSET         0x40
+#define PCH_PIC_HTMSI_VEC_OFFSET        0x200
+#define PCH_PIC_AUTO_CTRL0_OFFSET       0xc0
+#define PCH_PIC_AUTO_CTRL1_OFFSET       0xe0
+
+typedef struct loongarch_pch_pic {
+    SysBusDevice parent_obj;
+    qemu_irq parent_irq[32];
+    uint32_t int_id;
+    uint32_t int_mask; /*0x020 interrupt mask register*/
+    uint32_t htmsi_en;/*0x040 1=msi*/
+    uint32_t intedge; /*0x060 edge=1 level  =0*/
+    uint32_t intclr; /*0x080 for clean edge int,set 1 clean,set 0 is noused*/
+    uint32_t auto_crtl0; /*0x0c0*/
+    uint32_t auto_crtl1; /*0x0e0*/
+    uint8_t route_entry[32]; /*0x100 - 0x120*/
+    uint8_t htmsi_vector[32]; /*0x200 - 0x220*/
+    uint32_t last_intirr;    /* edge detection */
+    uint32_t intirr; /* 0x380 interrupt request register */
+    uint32_t intisr; /* 0x3a0 interrupt service register */
+    /*
+     * 0x3e0 interrupt level polarity selection
+     * register 0 for high level trigger
+     */
+    uint32_t int_polarity;
+    MemoryRegion iomem;
+} loongarch_pch_pic;
+
+
-- 
2.27.0


