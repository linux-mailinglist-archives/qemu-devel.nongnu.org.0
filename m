Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03508502872
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:46:28 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJT9-0001Q9-2t
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfIXt-0000GV-W7
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:47:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55736 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfIXo-0005Oj-4e
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:47:17 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xGqPVli41gkAA--.16856S34; 
 Fri, 15 Apr 2022 17:41:33 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 32/43] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
Date: Fri, 15 Apr 2022 17:40:47 +0800
Message-Id: <20220415094058.3584233-33-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_xGqPVli41gkAA--.16856S34
X-Coremail-Antispam: 1UD129KBjvJXoW3GF1fXw17WryDtFyUZryrWFg_yoWfGw1UpF
 9ruF1Fgr48JFsrGr93ta45XFn8G3Z7uFy2vF4a9a40kr47Xr10va4kKrZrZFyUA3yDJryF
 vas3W3WjqF1UXw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch realize the IPI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS                      |   2 +
 hw/intc/Kconfig                  |   3 +
 hw/intc/loongarch_ipi.c          | 145 +++++++++++++++++++++++++++++++
 hw/intc/meson.build              |   1 +
 hw/intc/trace-events             |   4 +
 hw/loongarch/Kconfig             |   1 +
 include/hw/intc/loongarch_ipi.h  |  46 ++++++++++
 include/hw/loongarch/loongarch.h |   2 +
 8 files changed, 204 insertions(+)
 create mode 100644 hw/intc/loongarch_ipi.c
 create mode 100644 include/hw/intc/loongarch_ipi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cbba09d0f4..3f5aaeeeba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1134,6 +1134,8 @@ F: configs/devices/loongarch64-softmmu/default.mak
 F: gdb-xml/loongarch*.xml
 F: hw/loongarch/
 F: include/hw/loongarch/loongarch.h
+F: include/hw/intc/loongarch_*.h
+F: hw/intc/loongarch_*.c
 
 M68K Machines
 -------------
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index a7cf301eab..6c7e82da64 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -84,3 +84,6 @@ config GOLDFISH_PIC
 
 config M68K_IRQC
     bool
+
+config LOONGARCH_IPI
+    bool
diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
new file mode 100644
index 0000000000..82070f8d14
--- /dev/null
+++ b/hw/intc/loongarch_ipi.c
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch ipi interrupt support
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/intc/loongarch_ipi.h"
+#include "hw/irq.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "exec/address-spaces.h"
+#include "hw/loongarch/loongarch.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
+    IPICore *s = lams->ipi_core;
+    uint64_t ret = 0;
+    int index = 0;
+
+    addr &= 0xff;
+    switch (addr) {
+    case CORE_STATUS_OFF:
+        ret = s->status;
+        break;
+    case CORE_EN_OFF:
+        ret = s->en;
+        break;
+    case CORE_SET_OFF:
+        ret = 0;
+        break;
+    case CORE_CLEAR_OFF:
+        ret = 0;
+        break;
+    case CORE_BUF_20 ... CORE_BUF_38 + 4:
+        index = (addr - CORE_BUF_20) >> 2;
+        ret = s->buf[index];
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "invalid read: %x", (uint32_t)addr);
+        break;
+    }
+
+    trace_loongarch_ipi_read(size, (uint64_t)addr, ret);
+    return ret;
+}
+
+static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
+                                 unsigned size)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
+    IPICore *s = lams->ipi_core;
+    int index = 0;
+
+    addr &= 0xff;
+    trace_loongarch_ipi_write(size, (uint64_t)addr, val);
+    switch (addr) {
+    case CORE_STATUS_OFF:
+        qemu_log_mask(LOG_GUEST_ERROR, "can not be written");
+        break;
+    case CORE_EN_OFF:
+        s->en = val;
+        break;
+    case CORE_SET_OFF:
+        s->status |= val;
+        if (s->status != 0 && (s->status & s->en) != 0) {
+            qemu_irq_raise(s->irq);
+        }
+        break;
+    case CORE_CLEAR_OFF:
+        s->status &= ~val;
+        if (s->status == 0 && s->en != 0) {
+            qemu_irq_lower(s->irq);
+        }
+        break;
+    case CORE_BUF_20 ... CORE_BUF_38 + 4:
+        index = (addr - CORE_BUF_20) >> 2;
+        s->buf[index] = val;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "invalid write: %x", (uint32_t)addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps loongarch_ipi_ops = {
+    .read = loongarch_ipi_readl,
+    .write = loongarch_ipi_writel,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void loongarch_ipi_init(Object *obj)
+{
+    LoongArchIPI *s = LOONGARCH_IPI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int cpu;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
+
+    for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
+        memory_region_init_io(&s->ipi_mmio[cpu], obj, &loongarch_ipi_ops,
+                              &lams->ipi_core[cpu], "loongarch_ipi", 0x100);
+        sysbus_init_mmio(sbd, &s->ipi_mmio[cpu]);
+        qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
+    }
+}
+
+static const VMStateDescription vmstate_loongarch_ipi = {
+    .name = TYPE_LOONGARCH_IPI,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void loongarch_ipi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_loongarch_ipi;
+}
+
+static const TypeInfo loongarch_ipi_info = {
+    .name          = TYPE_LOONGARCH_IPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LoongArchIPI),
+    .instance_init = loongarch_ipi_init,
+    .class_init    = loongarch_ipi_class_init,
+};
+
+static void loongarch_ipi_register_types(void)
+{
+    type_register_static(&loongarch_ipi_info);
+}
+
+type_init(loongarch_ipi_register_types)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index d6d012fb26..bf5ab44a78 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -62,3 +62,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 53414aa197..6ae8917d99 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -275,3 +275,7 @@ sh_intc_register(const char *s, int id, unsigned short v, int c, int m) "%s %u -
 sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " -> 0x%lx"
 sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " <- 0x%lx"
 sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
+
+# loongarch_ipi.c
+loongarch_ipi_read(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
+loongarch_ipi_write(unsigned size, uint64_t addr, unsigned long val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 13e8501897..f0dad3329a 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,3 +2,4 @@ config LOONGARCH_VIRT
     bool
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
+    select LOONGARCH_IPI
diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
new file mode 100644
index 0000000000..d57b0c6192
--- /dev/null
+++ b/include/hw/intc/loongarch_ipi.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch ipi interrupt header files
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LOONGARCH_IPI_H
+#define HW_LOONGARCH_IPI_H
+
+#include "hw/sysbus.h"
+
+/* Mainy used by iocsr read and write */
+#define SMP_IPI_MAILBOX      0x1000ULL
+#define CORE_STATUS_OFF       0x0
+#define CORE_EN_OFF           0x4
+#define CORE_SET_OFF          0x8
+#define CORE_CLEAR_OFF        0xc
+#define CORE_BUF_20           0x20
+#define CORE_BUF_28           0x28
+#define CORE_BUF_30           0x30
+#define CORE_BUF_38           0x38
+#define IOCSR_IPI_SEND        0x40
+
+#define MAX_IPI_CORE_NUM      16
+#define MAX_IPI_MBX_NUM       4
+
+#define TYPE_LOONGARCH_IPI "loongarch_ipi"
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
+
+typedef struct IPICore {
+    uint32_t status;
+    uint32_t en;
+    uint32_t set;
+    uint32_t clear;
+    /* 64bit buf divide into 2 32bit buf */
+    uint32_t buf[MAX_IPI_MBX_NUM * 2];
+    qemu_irq irq;
+} IPICore;
+
+struct LoongArchIPI {
+    SysBusDevice parent_obj;
+    MemoryRegion ipi_mmio[MAX_IPI_CORE_NUM];
+};
+
+#endif
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index ffe10edc65..a659be2a7f 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -12,6 +12,7 @@
 #include "qemu-common.h"
 #include "hw/boards.h"
 #include "qemu/queue.h"
+#include "hw/intc/loongarch_ipi.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -41,6 +42,7 @@ struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
 
+    IPICore ipi_core[MAX_IPI_CORE_NUM];
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
-- 
2.31.1


