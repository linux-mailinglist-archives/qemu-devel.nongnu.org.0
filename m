Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC949F24D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:16:19 +0100 (CET)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIgM-0001VN-JB
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBu-00089P-D0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40562 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBr-0002MO-9z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:49 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S21; 
 Fri, 28 Jan 2022 11:44:35 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 19/30] hw/intc: Add LoongArch ls7a msi interrupt
 controller support(PCH-MSI)
Date: Thu, 27 Jan 2022 22:44:01 -0500
Message-Id: <20220128034412.1262452-20-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S21
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr47CryrKw43AFWfZrWkZwb_yoW7tr45pr
 sxu343Kr4ktw47WrZ3J348AF95JFs7ury2vF4a9ryxCr4DAas5XF1ktry7WFyUK3ykGryq
 va95Ca12qa1UGaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch realize PCH-MSI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                     |  5 ++
 hw/intc/loongarch_pch_msi.c         | 75 +++++++++++++++++++++++++++++
 hw/intc/meson.build                 |  1 +
 hw/intc/trace-events                |  3 ++
 hw/loongarch/Kconfig                |  1 +
 include/hw/intc/loongarch_pch_msi.h | 21 ++++++++
 6 files changed, 106 insertions(+)
 create mode 100644 hw/intc/loongarch_pch_msi.c
 create mode 100644 include/hw/intc/loongarch_pch_msi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 928db92bb4..727a3bb3e6 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -85,3 +85,8 @@ config LOONGARCH_IPI
 config LOONGARCH_PCH_PIC
     bool
     select UNIMP
+
+config LOONGARCH_PCH_MSI
+    select MSI_NONBROKEN
+    bool
+    select UNIMP
diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
new file mode 100644
index 0000000000..57a894f3e5
--- /dev/null
+++ b/hw/intc/loongarch_pch_msi.c
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU Loongson 7A1000 msi interrupt controller.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/intc/loongarch_pch_msi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/pci/msi.h"
+#include "hw/misc/unimp.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
+                                    uint64_t val, unsigned size)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
+    int irq_num = val & 0xff;
+
+    trace_loongarch_msi_set_irq(irq_num);
+    qemu_set_irq(s->pch_msi_irq[irq_num - PCH_PIC_IRQ_NUM], 1);
+}
+
+static const MemoryRegionOps loongarch_pch_msi_ops = {
+    .read  = loongarch_msi_mem_read,
+    .write = loongarch_msi_mem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void pch_msi_irq_handler(void *opaque, int irq, int level)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
+
+    qemu_set_irq(s->pch_msi_irq[irq], level);
+}
+
+static void loongarch_pch_msi_init(Object *obj)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
+
+    memory_region_init_io(&s->msi_mmio, obj, &loongarch_pch_msi_ops,
+                          s, TYPE_LOONGARCH_PCH_MSI, 0x8);
+    sysbus_init_mmio(sbd, &s->msi_mmio);
+    msi_nonbroken = true;
+
+    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
+        sysbus_init_irq(sbd, &s->pch_msi_irq[i]);
+    }
+    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
+}
+
+static const TypeInfo loongarch_pch_msi_info = {
+    .name          = TYPE_LOONGARCH_PCH_MSI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LoongArchPCHMSI),
+    .instance_init = loongarch_pch_msi_init,
+};
+
+static void loongarch_pch_msi_register_types(void)
+{
+    type_register_static(&loongarch_pch_msi_info);
+}
+
+type_init(loongarch_pch_msi_register_types)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index cf08816547..c679223420 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -62,3 +62,4 @@ specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index e6095c3abb..46a0bf20dd 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -259,3 +259,6 @@ loongarch_pch_pic_high_readw(unsigned size, uint32_t addr, unsigned long val) "s
 loongarch_pch_pic_high_writew(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
 loongarch_pch_pic_readb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
 loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+
+# loongarch_pch_msi.c
+loongarch_msi_set_irq(int irq_num) "set msi irq %d"
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index c2b8046b94..cd38d03a19 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -3,3 +3,4 @@ config LOONGSON3_LS7A
     select PCI_EXPRESS_7A
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
+    select LOONGARCH_PCH_MSI
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
new file mode 100644
index 0000000000..68009d4b4a
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
+DECLARE_INSTANCE_CHECKER(struct LoongArchPCHMSI, LOONGARCH_PCH_MSI,
+                         TYPE_LOONGARCH_PCH_MSI)
+
+/* Msi irq start start from 64 to 255 */
+#define PCH_MSI_IRQ_START   64
+#define PCH_MSI_IRQ_END     255
+#define PCH_MSI_IRQ_NUM     192
+
+typedef struct LoongArchPCHMSI {
+    SysBusDevice parent_obj;
+    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
+    MemoryRegion msi_mmio;
+} LoongArchPCHMSI;
-- 
2.27.0


