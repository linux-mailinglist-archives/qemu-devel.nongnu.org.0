Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DF50DCE9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:39:30 +0200 (CEST)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivBp-0006oQ-T0
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukV-0008Jc-6M
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39596 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukR-0001KO-6e
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:14 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S36; 
 Mon, 25 Apr 2022 17:10:58 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Date: Mon, 25 Apr 2022 17:10:18 +0800
Message-Id: <20220425091027.2877892-35-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S36
X-Coremail-Antispam: 1UD129KBjvAXoWfCw45AFy8tw1kuF48Cw15urg_yoW8Zw45Zo
 W5JFW5X34rGr4xCrWkJwsrKFy7WFnFv3yUJa47Z39I9anxAFn8Wa9xKw1YkF1fXFs5KF15
 A393uFykAay7t3W8n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
 hw/intc/loongarch_extioi.c         | 483 +++++++++++++++++++++++++++++
 hw/intc/meson.build                |   1 +
 hw/intc/trace-events               |   9 +
 hw/loongarch/Kconfig               |   1 +
 include/hw/intc/loongarch_extioi.h |  60 ++++
 6 files changed, 557 insertions(+)
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
index 0000000000..1d9317c5bd
--- /dev/null
+++ b/hw/intc/loongarch_extioi.c
@@ -0,0 +1,483 @@
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
+static void extioi_update_irq(LoongArchExtIOI *s, int irq_num, int level)
+{
+    uint64_t ipnum, cpu;
+
+    /*
+     * Routing in group of 32 interrupts.
+     * The default value of csr[0x420][49]
+     * is 0 and nobody will change it,
+     * so 'ipmap' use bitmap function.
+     */
+    ipnum = ldub_p((void *)&s->ipmap + (irq_num / 32)) & 0xf;
+    ipnum = find_first_bit(&ipnum, 4);
+    ipnum = (ipnum == 4) ? 0 : ipnum;
+
+    cpu = ldub_p((void *)s->coremap + irq_num) & 0xf;
+    cpu = find_first_bit(&cpu, 4);
+    cpu = (cpu == 4) ? 0 : cpu;
+
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
+static uint32_t extioi_readb(void *opaque, hwaddr addr)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint8_t ret = 0;
+    int cpu;
+
+    offset = addr & 0xffff;
+    switch (offset) {
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        ret = ldub_p((void *)s->enable + (offset - EXTIOI_ENABLE_START));
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        ret = ldub_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START));
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = ldub_p((void *)s->coreisr[cpu] + reg_count);
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        ret = ldub_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        ret = ldub_p((void *)s->coremap + (offset - EXTIOI_COREMAP_START));
+        break;
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        ret = ldub_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START));
+        break;
+    default:
+        break;
+    }
+    trace_loongarch_extioi_readb((uint32_t)addr, ret);
+    return ret;
+}
+
+static uint32_t extioi_readw(void *opaque, hwaddr addr)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint32_t ret = 0;
+    int cpu;
+
+    offset = addr & 0xffff;
+    switch (offset) {
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        ret = ldl_p((void *)s->enable + (offset - EXTIOI_ENABLE_START));
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        ret = ldl_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START));
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = ldl_p((void *)s->coreisr[cpu] + reg_count);
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        ret = ldl_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        ret = ldl_p((void *)s->coremap + (offset - EXTIOI_COREMAP_START));
+        break;
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        ret = ldl_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START));
+        break;
+    default:
+        break;
+    }
+    trace_loongarch_extioi_readw((uint32_t)addr, ret);
+    return ret;
+}
+
+static uint64_t extioi_readl(void *opaque, hwaddr addr)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint64_t ret = 0;
+    int cpu;
+
+    offset = addr & 0xffff;
+
+    switch (offset) {
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        ret = ldq_p((void *)s->enable + (offset - EXTIOI_ENABLE_START));
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        ret = ldq_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START));
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = ldq_p((void *)s->coreisr[cpu] + reg_count);
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        ret = ldq_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        ret = ldq_p((void *)s->coremap + (offset - EXTIOI_COREMAP_START));
+        break;
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        ret = ldq_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START));
+        break;
+    default:
+        break;
+    }
+    trace_loongarch_extioi_readl((uint32_t)addr, ret);
+    return ret;
+}
+
+static void extioi_writeb(void *opaque, hwaddr addr, uint32_t value,
+                          unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    int cpu, i, j, level, bits;
+    uint64_t old_data, val = value & 0xff;
+
+    offset = addr & 0xffff;
+
+    trace_loongarch_extioi_writeb(size, (uint32_t)addr, (uint8_t)val);
+    switch (offset) {
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        reg_count = (offset - EXTIOI_ENABLE_START);
+        old_data = ldub_p((void *)s->enable + reg_count);
+        if (old_data != val) {
+            stb_p((void *)s->enable + reg_count, (uint8_t)val);
+            old_data = old_data ^ val;
+            bits = size * 8;
+            while ((i = find_first_bit(&old_data, bits)) != bits) {
+                level = test_bit(i, &val);
+                extioi_update_irq(s, i + reg_count * 8, level);
+                clear_bit(i, &old_data);
+            }
+        }
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        stb_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), (uint8_t)val);
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+
+        old_data = ldub_p((void *)s->coreisr[cpu] + reg_count);
+        stb_p((void *)s->coreisr[cpu] + reg_count, (uint8_t)(old_data & ~val));
+
+        if (old_data != (old_data & ~val)) {
+            bits = size * 8;
+
+            while ((i = find_first_bit(&val, bits)) != bits) {
+                j = test_bit(i, &old_data);
+                if (j) {
+                    extioi_update_irq(s, i + reg_count * 8, 0);
+                }
+                clear_bit(i, &val);
+            }
+        }
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        /* Drop arch.core_ip_mask use s->ipmap */
+        reg_count = (offset - EXTIOI_IPMAP_START);
+        stb_p((void *)&s->ipmap + reg_count, (uint8_t)val);
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        reg_count = (offset - EXTIOI_COREMAP_START);
+
+        /* Only map the core */
+        while (val) {
+            stb_p((void *)s->coremap + reg_count, (uint8_t)val);
+            val = val >> 8;
+        }
+        break;
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        stb_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START),
+                                     (uint8_t)val);
+        break;
+    default:
+        break;
+    }
+}
+
+static void extioi_writew(void *opaque, hwaddr addr, uint32_t val,
+                          unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    int cpu, level;
+    uint32_t offset, reg_count, i, j, bits;
+    uint64_t old_data, value = val;
+    offset = addr & 0xffff;
+    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
+
+    switch (offset) {
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        reg_count = (offset - EXTIOI_ENABLE_START);
+        old_data = ldl_p((void *)s->enable + reg_count);
+        if (old_data != val) {
+            stl_p((void *)s->enable + reg_count, val);
+            old_data = old_data ^ val;
+
+            bits = size * 8;
+            while ((i = find_first_bit(&old_data, bits)) != bits) {
+                level = test_bit(i, &value);
+                extioi_update_irq(s, i + reg_count * 8, level);
+                clear_bit(i, &old_data);
+            }
+        }
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        stl_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        /* Ext_core_ioisr */
+        old_data = ldl_p((void *)s->coreisr[cpu] + reg_count);
+        stl_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
+
+        if (old_data != (old_data & ~val)) {
+            bits = size * 8;
+            while ((i = find_first_bit(&value, bits)) != bits) {
+                j = test_bit(i, &old_data);
+                if (j) {
+                    extioi_update_irq(s, i + reg_count * 8, 0);
+                }
+                clear_bit(i, &value);
+            }
+        }
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        /* Drop arch.core_ip_mask use s->ipmap */
+        reg_count = (offset - EXTIOI_IPMAP_START);
+        stl_p((void *)&s->ipmap + reg_count, val);
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        reg_count = (offset - EXTIOI_COREMAP_START);
+        /* Only map the core */
+        while (val) {
+            stl_p((void *)s->coremap + reg_count, val);
+            val = val >> 8;
+        }
+        break;
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        stl_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START), val);
+        break;
+    default:
+        break;
+    }
+}
+
+static void extioi_writel(void *opaque, hwaddr addr, uint64_t val,
+                          unsigned size)
+{
+    LoongArchExtIOI *s = LOONGARCH_EXTIOI(opaque);
+    int cpu, level, i, j, bits;
+    uint64_t offset, old_data, reg_count;
+
+    offset = addr & 0xffff;
+    trace_loongarch_extioi_writel(size, (uint32_t)addr, val);
+    switch (offset) {
+    case EXTIOI_ENABLE_START ... EXTIOI_ENABLE_END - 1:
+        reg_count = (offset - EXTIOI_ENABLE_START);
+        old_data = s->enable[reg_count];
+        if (old_data != val) {
+            s->enable[reg_count] = val;
+            old_data = old_data ^ val;
+
+            bits = size * 8;
+            while ((i = find_first_bit(&old_data, bits)) != bits) {
+                level = test_bit(i, &val);
+                extioi_update_irq(s, i + reg_count * 8, level);
+                clear_bit(i, &old_data);
+            }
+        }
+        break;
+    case EXTIOI_BOUNCE_START ... EXTIOI_BOUNCE_END - 1:
+        stq_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
+        break;
+    case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+
+        /* core_ext_ioisr */
+        old_data = ldq_p((void *)s->coreisr[cpu] + reg_count);
+        stq_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
+
+        if (old_data != (old_data & ~val)) {
+            bits = size * 8;
+            while ((i = find_first_bit(&val, bits)) != bits) {
+                j = test_bit(i, &old_data);
+                if (j) {
+                    extioi_update_irq(s, i + reg_count * 8, 0);
+                }
+                clear_bit(i, &val);
+            }
+        }
+        break;
+    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
+        /* Drop arch.core_ip_mask use s->ipmap */
+        reg_count = (offset - EXTIOI_IPMAP_START);
+        stq_p((void *)&s->ipmap + reg_count, val);
+        break;
+    case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
+        reg_count = (offset - EXTIOI_COREMAP_START);
+        /* Only map the core */
+        while (val) {
+            stq_p((void *)s->coremap + reg_count, val);
+            val = val >> 8;
+        }
+        break;
+    case EXTIOI_NODETYPE_START ... EXTIOI_NODETYPE_END - 1:
+        stq_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START), val);
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t extioi_readfn(void *opaque, hwaddr addr, unsigned size)
+{
+    switch (size) {
+    case 1:
+        return extioi_readb(opaque, addr);
+    case 4:
+        return extioi_readw(opaque, addr);
+    case 8:
+        return extioi_readl(opaque, addr);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void extioi_writefn(void *opaque, hwaddr addr,
+                           uint64_t value, unsigned size)
+{
+    switch (size) {
+    case 1:
+        extioi_writeb(opaque, addr, value, size);
+        break;
+    case 4:
+        extioi_writew(opaque, addr, value, size);
+        break;
+    case 8:
+        extioi_writel(opaque, addr, value, size);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static const MemoryRegionOps extioi_ops = {
+    .read = extioi_readfn,
+    .write = extioi_writefn,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 8,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void loongarch_extioi_realize(DeviceState *dev, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
+    MachineState *ms = MACHINE(lams);
+    LoongArchExtIOI *p = LOONGARCH_EXTIOI(dev);
+    int i, cpu, pin;
+
+    qdev_init_gpio_in(dev, extioi_setirq, EXTIOI_IRQS);
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &p->irq[i]);
+    }
+    /* two ways to access extioi: iocsr memory and system memory */
+    memory_region_init_io(&p->extioi_iocsr_mem, OBJECT(p), &extioi_ops, p,
+                          "loongarch_extioi_iocsr", 0x900);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->extioi_iocsr_mem);
+
+    memory_region_init_io(&p->extioi_system_mem, OBJECT(p), &extioi_ops, p,
+                          "loongarch_extioi", 0x900);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->extioi_system_mem);
+
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_init_gpio_out(dev, &p->parent_irq[cpu][pin], 1);
+        }
+    }
+}
+
+static const VMStateDescription vmstate_loongarch_extioi = {
+    .name = TYPE_LOONGARCH_EXTIOI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(enable, LoongArchExtIOI,
+                             EXTIOI_IRQS_BITMAP_SIZE / 8),
+        VMSTATE_UINT64_ARRAY(bounce, LoongArchExtIOI,
+                             EXTIOI_IRQS_BITMAP_SIZE / 8),
+        VMSTATE_UINT64_2DARRAY(coreisr, LoongArchExtIOI,
+                               MAX_CORES, EXTIOI_IRQS_BITMAP_SIZE / 8),
+        VMSTATE_UINT64(ipmap, LoongArchExtIOI),
+        VMSTATE_UINT64_ARRAY(coremap, LoongArchExtIOI,
+                             EXTIOI_IRQS_COREMAP_SIZE / 8),
+        VMSTATE_UINT64_ARRAY(nodetype, LoongArchExtIOI,
+                             EXTIOI_IRQS_NODETYPE_SIZE / 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void loongarch_extioi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_loongarch_extioi;
+    dc->realize = loongarch_extioi_realize;
+}
+
+static const TypeInfo loongarch_extioi_info = {
+    .name          = TYPE_LOONGARCH_EXTIOI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
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
index 8bcc1b6992..285d64ab83 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -303,3 +303,12 @@ loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size:
 
 # loongarch_pch_msi.c
 loongarch_msi_set_irq(int irq_num) "set msi irq %d"
+
+# loongarch_extioi.c
+loongarch_extioi_setirq(int irq, int level) "set extirq irq %d level %d"
+loongarch_extioi_readb(uint32_t addr, uint8_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIu8
+loongarch_extioi_readw(uint32_t addr, uint32_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_readl(uint32_t addr, uint64_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_extioi_writeb(unsigned size, uint32_t addr, uint8_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIu8
+loongarch_extioi_writew(unsigned size, uint32_t addr, uint32_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_writel(unsigned size, uint32_t addr, uint64_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
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
index 0000000000..5482483a5f
--- /dev/null
+++ b/include/hw/intc/loongarch_extioi.h
@@ -0,0 +1,60 @@
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
+#define MAX_CORES                  LOONGARCH_MAX_VCPUS
+#define EXTIOI_IRQS                (256)
+#define EXTIOI_IRQS_BITMAP_SIZE    (256 / 8)
+/* map to ipnum per 32 irqs */
+#define EXTIOI_IRQS_IPMAP_SIZE     (256 / 32)
+#define EXTIOI_IRQS_COREMAP_SIZE   256
+#define EXTIOI_IRQS_NODETYPE_SIZE  16
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
+#define EXTIOI_SYSTEM_MEM            0x1fe01400
+#define TYPE_LOONGARCH_EXTIOI "loongarch.extioi"
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchExtIOI, LOONGARCH_EXTIOI)
+struct LoongArchExtIOI {
+    SysBusDevice parent_obj;
+    /* hardware state */
+    uint64_t enable[EXTIOI_IRQS_BITMAP_SIZE / 8];
+    uint64_t bounce[EXTIOI_IRQS_BITMAP_SIZE / 8];
+    uint64_t coreisr[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE / 8];
+    uint64_t ipmap;
+    uint64_t coremap[EXTIOI_IRQS_COREMAP_SIZE / 8];
+    uint64_t nodetype[EXTIOI_IRQS_NODETYPE_SIZE / 4];
+
+    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
+    qemu_irq irq[EXTIOI_IRQS];
+    MemoryRegion extioi_iocsr_mem;
+    MemoryRegion extioi_system_mem;
+};
+
+#endif /* LOONGARCH_EXTIOI_H */
-- 
2.31.1


