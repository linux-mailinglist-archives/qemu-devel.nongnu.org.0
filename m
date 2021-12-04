Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BA4684CD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:33:01 +0100 (CET)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUDs-0005tc-20
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpf-0007hK-7P
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:59 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58410 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpb-0003J8-PF
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:59 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S22; 
 Sat, 04 Dec 2021 20:07:40 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 20/27] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Date: Sat,  4 Dec 2021 20:07:18 +0800
Message-Id: <1638619645-11283-21-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S22
X-Coremail-Antispam: 1UD129KBjvAXoWfWw48uFWxurykuryUWr47twb_yoW8tFW8uo
 WYyFW5X3y8Aw4xur4fJrsrKFyUWrn2vrWUAa47X3sI9anxAF15Wa9xKw1akF4xXFs8K3WU
 Z39xuF9rAay5t3Wrn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

This patch realize the EIOINTC interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                    |   3 +
 hw/intc/loongarch_extioi.c         | 499 +++++++++++++++++++++++++++++
 hw/intc/meson.build                |   1 +
 hw/intc/trace-events               |   9 +
 hw/loongarch/Kconfig               |   1 +
 include/hw/intc/loongarch_extioi.h |  69 ++++
 6 files changed, 582 insertions(+)
 create mode 100644 hw/intc/loongarch_extioi.c
 create mode 100644 include/hw/intc/loongarch_extioi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index dc5f41f5f5..2868b25005 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -85,3 +85,6 @@ config LOONGARCH_PCH_MSI
     select MSI_NONBROKEN
     bool
     select UNIMP
+
+config LOONGARCH_EXTIOI
+    bool
diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
new file mode 100644
index 0000000000..9838f05806
--- /dev/null
+++ b/hw/intc/loongarch_extioi.c
@@ -0,0 +1,499 @@
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
+static void extioi_update_irq(void *opaque, int irq_num, int level)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    uint8_t  ipnum, cpu;
+    unsigned long found1, found2;
+
+    ipnum = s->sw_ipmap[irq_num];
+    cpu   = s->sw_coremap[irq_num];
+    if (level == 1) {
+        if (test_bit(irq_num, (void *)s->enable) == false) {
+            return;
+        }
+        bitmap_set((void *)s->coreisr[cpu], irq_num, 1);
+        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
+                               EXTIOI_IRQS, 0);
+        bitmap_set((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
+
+        if (found1 >= EXTIOI_IRQS) {
+            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
+        }
+    } else {
+        bitmap_clear((void *)s->coreisr[cpu], irq_num, 1);
+        found1 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
+                               EXTIOI_IRQS, 0);
+        bitmap_clear((void *)&(s->sw_ipisr[cpu][ipnum]), irq_num, 1);
+        found2 = find_next_bit((void *)&(s->sw_ipisr[cpu][ipnum]),
+                               EXTIOI_IRQS, 0);
+
+        if ((found1 < EXTIOI_IRQS) && (found2 >= EXTIOI_IRQS)) {
+            qemu_set_irq(s->parent_irq[cpu][ipnum], level);
+        }
+    }
+}
+
+static void extioi_setirq(void *opaque, int irq, int level)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    trace_extioi_setirq(irq, level);
+    extioi_update_irq(s, irq, level);
+}
+
+static uint32_t extioi_readb(void *opaque, hwaddr addr)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint8_t ret;
+    int cpu;
+
+    offset = addr & 0xffff;
+
+    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
+        ret = ldub_p((void *)s->enable + (offset - EXTIOI_ENABLE_START));
+    } else if ((offset >= EXTIOI_BOUNCE_START) && (offset < EXTIOI_BOUNCE_END)) {
+        ret = ldub_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START));
+    } else if ((offset >= EXTIOI_COREISR_START) && (offset < EXTIOI_COREISR_END)) {
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = ldub_p((void *)s->coreisr[cpu] + reg_count);
+    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
+        ret = ldub_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
+    } else if ((offset >= EXTIOI_COREMAP_START) && (offset < EXTIOI_COREMAP_END)) {
+        ret = ldub_p((void *)s->coremap + (offset - EXTIOI_COREMAP_START));
+    } else if ((offset >= EXTIOI_NODETYPE_START) && (offset < EXTIOI_NODETYPE_END)) {
+        ret = ldub_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START));
+    }
+
+    trace_loongarch_extioi_readb((uint32_t)addr, ret);
+    return ret;
+}
+
+static uint32_t extioi_readw(void *opaque, hwaddr addr)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint32_t ret;
+    int cpu;
+
+    offset = addr & 0xffff;
+
+    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
+        ret = ldl_p((void *)s->enable + (offset - EXTIOI_ENABLE_START));
+    } else if ((offset >= EXTIOI_BOUNCE_START) && (offset < EXTIOI_BOUNCE_END)) {
+        ret = ldl_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START));
+    } else if ((offset >= EXTIOI_COREISR_START) && (offset < EXTIOI_COREISR_END)) {
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = ldl_p((void *)s->coreisr[cpu] + reg_count);
+    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
+        ret = ldl_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
+    } else if ((offset >= EXTIOI_COREMAP_START) && (offset < EXTIOI_COREMAP_END)) {
+        ret = ldl_p((void *)s->coremap + (offset - EXTIOI_COREMAP_START));
+    } else if ((offset >= EXTIOI_NODETYPE_START) && (offset < EXTIOI_NODETYPE_END)) {
+        ret = ldl_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START));
+    }
+
+    trace_loongarch_extioi_readw((uint32_t)addr, ret);
+    return ret;
+}
+
+static uint64_t extioi_readl(void *opaque, hwaddr addr)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint64_t ret;
+    int cpu;
+
+    offset = addr & 0xffff;
+
+    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
+        ret = ldq_p((void *)s->enable + (offset - EXTIOI_ENABLE_START));
+    } else if ((offset >= EXTIOI_BOUNCE_START) && (offset < EXTIOI_BOUNCE_END)) {
+        ret = ldq_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START));
+    } else if ((offset >= EXTIOI_COREISR_START) && (offset < EXTIOI_COREISR_END)) {
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+        ret = ldq_p((void *)s->coreisr[cpu] + reg_count);
+    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
+        ret = ldq_p((void *)&s->ipmap + (offset - EXTIOI_IPMAP_START));
+    } else if ((offset >= EXTIOI_COREMAP_START) && (offset < EXTIOI_COREMAP_END)) {
+        ret = ldq_p((void *)s->coremap + (offset - EXTIOI_COREMAP_START));
+    } else if ((offset >= EXTIOI_NODETYPE_START) && (offset < EXTIOI_NODETYPE_END)) {
+        ret = ldq_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START));
+    }
+
+    trace_loongarch_extioi_readl((uint32_t)addr, ret);
+    return ret;
+}
+
+static void extioi_writeb(void *opaque, hwaddr addr, uint32_t val,
+                          unsigned size)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    unsigned long offset, reg_count;
+    uint8_t old_data;
+    int cpu, i, j, ipnum, level, irqnum, bits;
+
+    offset = addr & 0xffff;
+    val = val & 0xffUL;
+
+    trace_loongarch_extioi_writeb(size, (uint32_t)addr, val);
+    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
+        reg_count = (offset - EXTIOI_ENABLE_START);
+        old_data = ldub_p((void *)s->enable + reg_count);
+        if (old_data != val) {
+            stb_p((void *)s->enable + reg_count, val);
+            old_data = old_data ^ val;
+            bits = size * 8;
+            while ((i = find_first_bit((void *)&old_data, bits)) != bits) {
+                level = test_bit(i, (unsigned long *)&val);
+                extioi_update_irq(s, i + reg_count * 8, level);
+                clear_bit(i, (void *)&old_data);
+            }
+        }
+    } else if ((offset >= EXTIOI_BOUNCE_START) && (offset < EXTIOI_BOUNCE_END)) {
+        stb_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
+    } else if ((offset >= EXTIOI_COREISR_START) && (offset < EXTIOI_COREISR_END)) {
+        reg_count = (offset - EXTIOI_COREISR_START) & 0x1f;
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+
+        old_data = ldub_p((void *)s->coreisr[cpu] + reg_count);
+        stb_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
+
+        if (old_data != (old_data & ~val)) {
+            bits = size * 8;
+
+            while ((i = find_first_bit((void *)&val, bits)) != bits) {
+                j = test_bit(i, (unsigned long *)&old_data);
+                if (j) {
+                    extioi_update_irq(s, i + reg_count * 8, 0);
+                }
+                clear_bit(i, (void *)&val);
+            }
+        }
+    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
+        /* Drop arch.core_ip_mask use s->ipmap */
+        reg_count = (offset - EXTIOI_IPMAP_START);
+        stb_p((void *)&s->ipmap + reg_count, val);
+
+        /* Routing in groups of 32 interrupt */
+        while (val) {
+            ipnum = find_first_bit((void *)&val, 4);
+            for (i = 0; i < 32; i++) {
+                irqnum = reg_count * 32 + i;
+                if (ipnum != 4) {
+                    s->sw_ipmap[irqnum] = ipnum;
+                } else {
+                    s->sw_ipmap[irqnum] = 0;
+                }
+            }
+            val = val >> 8;
+            reg_count += 1;
+        }
+    } else if ((offset >= EXTIOI_COREMAP_START) && (offset < EXTIOI_COREMAP_END)) {
+        reg_count = (offset - EXTIOI_COREMAP_START);
+
+        /* Only map the core */
+        while (val) {
+            stb_p((void *)s->coremap + reg_count, val);
+            s->sw_coremap[reg_count] = val & 0xf;
+            val = val >> 8;
+        }
+    } else if ((offset >= EXTIOI_NODETYPE_START) && (offset < EXTIOI_NODETYPE_END)) {
+        stb_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START), val);
+    }
+}
+
+static void extioi_writew(void *opaque, hwaddr addr, uint32_t val,
+                          unsigned size)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    int cpu, level, irqnum, ipnum;
+    uint32_t offset, old_data, reg_count, i, j, bits;
+
+    offset = addr & 0xffff;
+    trace_loongarch_extioi_writew(size, (uint32_t)addr, val);
+
+    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
+        reg_count = (offset - EXTIOI_ENABLE_START);
+        old_data = ldl_p((void *)s->enable + reg_count);
+        if (old_data != val) {
+            stl_p((void *)s->enable + reg_count, val);
+            old_data = old_data ^ val;
+
+            bits = size * 8;
+            while ((i = find_first_bit((void *)&old_data, bits)) != bits) {
+                level = test_bit(i, (unsigned long *)&val);
+                extioi_update_irq(s, i + reg_count * 8, level);
+                clear_bit(i, (void *)&old_data);
+            }
+        }
+    } else if ((offset >= EXTIOI_BOUNCE_START) && (offset < EXTIOI_BOUNCE_END)) {
+        stl_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
+    } else if ((offset >= EXTIOI_COREISR_START) && (offset < EXTIOI_COREISR_END)) {
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+
+        /* Ext_core_ioisr */
+        old_data = ldl_p((void *)s->coreisr[cpu] + reg_count);
+        stl_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
+
+        if (old_data != (old_data & ~val)) {
+            bits = size * 8;
+            while ((i = find_first_bit((void *)&val, bits)) != bits) {
+                j = test_bit(i, (unsigned long *)&old_data);
+                if (j) {
+                    extioi_update_irq(s, i + reg_count * 8, 0);
+                }
+                clear_bit(i, (void *)&val);
+            }
+        }
+    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
+        /* Drop arch.core_ip_mask use s->ipmap */
+        reg_count = (offset - EXTIOI_IPMAP_START);
+        stl_p((void *)&s->ipmap + reg_count, val);
+
+        /* Routing in groups of 32 interrupt */
+        while (val) {
+            ipnum = find_first_bit((void *)&val, 4);
+            for (i = 0; i < 32; i++) {
+                irqnum = reg_count * 32 + i;
+                if (ipnum != 4) {
+                    s->sw_ipmap[irqnum] = ipnum;
+                } else {
+                    s->sw_ipmap[irqnum] = 0;
+                }
+            }
+            val = val >> 8;
+            reg_count += 1;
+        }
+    } else if ((offset >= EXTIOI_COREMAP_START) && (offset < EXTIOI_COREMAP_END)) {
+        reg_count = (offset - EXTIOI_COREMAP_START);
+        /* Only map the core */
+        while (val) {
+            stl_p((void *)s->coremap + reg_count, val);
+            s->sw_coremap[reg_count] = val & 0xf;
+            val = val >> 8;
+        }
+    } else if ((offset >= EXTIOI_NODETYPE_START) && (offset < EXTIOI_NODETYPE_END)) {
+        stl_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START), val);
+    }
+}
+
+static void extioi_writel(void *opaque, hwaddr addr, uint64_t val,
+                          unsigned size)
+{
+    loongarch_extioi *s = LOONGARCH_EXTIOI(opaque);
+    int cpu, level, i, j, bits, ipnum, irqnum;
+    uint64_t offset, old_data, reg_count;
+
+    offset = addr & 0xffff;
+    trace_loongarch_extioi_writel(size, (uint32_t)addr, val);
+
+    if ((offset >= EXTIOI_ENABLE_START) && (offset < EXTIOI_ENABLE_END)) {
+        reg_count = (offset - EXTIOI_ENABLE_START);
+        old_data = s->enable[reg_count];
+        if (old_data != val) {
+            s->enable[reg_count] = val;
+            old_data = old_data ^ val;
+
+            bits = size * 8;
+            while ((i = find_first_bit((void *)&old_data, bits)) != bits) {
+                level = test_bit(i, (unsigned long *)&val);
+                extioi_update_irq(s, i + reg_count * 8, level);
+                clear_bit(i, (void *)&old_data);
+            }
+        }
+    } else if ((offset >= EXTIOI_BOUNCE_START) && (offset < EXTIOI_BOUNCE_END)) {
+        stq_p((void *)s->bounce + (offset - EXTIOI_BOUNCE_START), val);
+    } else if ((offset >= EXTIOI_COREISR_START) && (offset < EXTIOI_COREISR_END)) {
+        reg_count = ((offset - EXTIOI_COREISR_START) & 0x1f);
+        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
+
+        /* core_ext_ioisr */
+        old_data = ldq_p((void *)s->coreisr[cpu] + reg_count);
+        stq_p((void *)s->coreisr[cpu] + reg_count, (old_data & ~val));
+
+        if (old_data != (old_data & ~val)) {
+            bits = size * 8;
+            while ((i = find_first_bit((void *)&val, bits)) != bits) {
+                j = test_bit(i, (unsigned long *)&old_data);
+                if (j) {
+                    extioi_update_irq(s, i + reg_count * 8, 0);
+                }
+                clear_bit(i, (void *)&val);
+            }
+        }
+    } else if ((offset >= EXTIOI_IPMAP_START) && (offset < EXTIOI_IPMAP_END)) {
+        /* Drop arch.core_ip_mask use s->ipmap */
+        reg_count = (offset - EXTIOI_IPMAP_START);
+        stq_p((void *)&s->ipmap + reg_count, val);
+
+        /* Routing in groups of 32 interrupt */
+        while (val) {
+            ipnum = find_first_bit((void *)&val, 4);
+            for (i = 0; i < 32; i++) {
+                irqnum = reg_count * 32 + i;
+                if (ipnum != 4) {
+                    s->sw_ipmap[irqnum] = ipnum;
+                } else {
+                    s->sw_ipmap[irqnum] = 0;
+                }
+            }
+            val = val >> 8;
+            reg_count += 1;
+        }
+    } else if ((offset >= EXTIOI_COREMAP_START) && (offset < EXTIOI_COREMAP_END)) {
+        reg_count = (offset - EXTIOI_COREMAP_START);
+        /* Only map the core */
+        while (val) {
+            stq_p((void *)s->coremap + reg_count, val);
+            s->sw_coremap[reg_count] = val & 0xf;
+            val = val >> 8;
+        }
+    } else if ((offset >= EXTIOI_NODETYPE_START) && (offset < EXTIOI_NODETYPE_END)) {
+        stq_p((void *)s->nodetype + (offset - EXTIOI_NODETYPE_START), val);
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
+    loongarch_extioi *p = LOONGARCH_EXTIOI(dev);
+    int i, cpu, pin;
+
+    qdev_init_gpio_in(dev, extioi_setirq, EXTIOI_IRQS);
+
+    for (i = 0; i < EXTIOI_IRQS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &p->irq[i]);
+    }
+
+    memory_region_init_io(&p->mmio, OBJECT(p), &extioi_ops, p,
+                          TYPE_LOONGARCH_EXTIOI, 0x900);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &p->mmio);
+
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
+            qdev_init_gpio_out(dev, &p->parent_irq[cpu][pin], 1);
+        }
+    }
+}
+
+static const VMStateDescription vmstate_ext_sw_ipisr = {
+    .name = "ext_sw_ipisr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(irq, ext_sw_ipisr, EXTIOI_IRQS_BITMAP_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_loongarch_extioi = {
+    .name = TYPE_LOONGARCH_EXTIOI,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(enable, loongarch_extioi,
+                             EXTIOI_IRQS_BITMAP_SIZE / 8),
+        VMSTATE_UINT64_ARRAY(bounce, loongarch_extioi,
+                             EXTIOI_IRQS_BITMAP_SIZE / 8),
+        VMSTATE_UINT64_2DARRAY(coreisr, loongarch_extioi,
+                               MAX_CORES, EXTIOI_IRQS_BITMAP_SIZE / 8),
+        VMSTATE_UINT64(ipmap, loongarch_extioi),
+        VMSTATE_UINT64_ARRAY(coremap, loongarch_extioi,
+                             EXTIOI_IRQS_COREMAP_SIZE / 8),
+        VMSTATE_UINT64_ARRAY(nodetype, loongarch_extioi,
+                             EXTIOI_IRQS_NODETYPE_SIZE / 4),
+        VMSTATE_UINT8_ARRAY(sw_ipmap, loongarch_extioi, EXTIOI_IRQS),
+        VMSTATE_UINT8_ARRAY(sw_coremap, loongarch_extioi, EXTIOI_IRQS),
+        VMSTATE_STRUCT_2DARRAY(sw_ipisr, loongarch_extioi, MAX_CORES,
+                               LS3A_INTC_IP, 1, vmstate_ext_sw_ipisr,
+                               ext_sw_ipisr),
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
+    .instance_size = sizeof(struct loongarch_extioi),
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
index acefe0c5aa..cee88a0d73 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -60,3 +60,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 20da343cfe..3f85126cf0 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -258,3 +258,12 @@ loongarch_pch_pic_write(unsigned size, uint32_t addr, unsigned long val) "size:
 
 # loongarch_pch_msi.c
 loongarch_msi_set_irq(int irq_num) "set msi irq %d"
+
+# loongarch_extioi.c
+extioi_setirq(int irq, int level) "set extirq irq %d level %d"
+loongarch_extioi_readb(uint32_t addr, uint8_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIu8
+loongarch_extioi_readw(uint32_t addr, uint32_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_readl(uint32_t addr, uint64_t val) "addr: 0x%"PRIx32 "val: 0x%" PRIx64
+loongarch_extioi_writeb(unsigned size, uint32_t addr, uint8_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIu8
+loongarch_extioi_writew(unsigned size, uint32_t addr, uint32_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx32
+loongarch_extioi_writel(unsigned size, uint32_t addr, uint64_t val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index cd38d03a19..468e3acc74 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -4,3 +4,4 @@ config LOONGSON3_LS7A
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
+    select LOONGARCH_EXTIOI
diff --git a/include/hw/intc/loongarch_extioi.h b/include/hw/intc/loongarch_extioi.h
new file mode 100644
index 0000000000..4e6a20dced
--- /dev/null
+++ b/include/hw/intc/loongarch_extioi.h
@@ -0,0 +1,69 @@
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
+#define TYPE_LOONGARCH_EXTIOI "loongarch.extioi"
+DECLARE_INSTANCE_CHECKER(struct loongarch_extioi, LOONGARCH_EXTIOI,
+                         TYPE_LOONGARCH_EXTIOI)
+
+typedef struct ext_sw_ipisr {
+    uint8_t irq[EXTIOI_IRQS_BITMAP_SIZE];
+} ext_sw_ipisr;
+
+typedef struct loongarch_extioi {
+    SysBusDevice parent_obj;
+    /* hardware state */
+    uint64_t enable[EXTIOI_IRQS_BITMAP_SIZE / 8];
+    uint64_t bounce[EXTIOI_IRQS_BITMAP_SIZE / 8];
+    uint64_t coreisr[MAX_CORES][EXTIOI_IRQS_BITMAP_SIZE / 8];
+    uint64_t ipmap;
+    uint64_t coremap[EXTIOI_IRQS_COREMAP_SIZE / 8];
+    uint64_t nodetype[EXTIOI_IRQS_NODETYPE_SIZE / 4];
+
+    /*software state */
+    uint8_t sw_ipmap[EXTIOI_IRQS];
+    uint8_t sw_coremap[EXTIOI_IRQS];
+    ext_sw_ipisr sw_ipisr[MAX_CORES][LS3A_INTC_IP];
+
+    qemu_irq parent_irq[MAX_CORES][LS3A_INTC_IP];
+    qemu_irq irq[EXTIOI_IRQS];
+    MemoryRegion mmio;
+} loongarch_extioi;
+
+#endif /* LOONGARCH_EXTIOI_H */
-- 
2.27.0


