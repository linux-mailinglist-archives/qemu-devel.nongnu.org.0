Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6152A2F7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:14:26 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqx1t-00045B-LA
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nqvXR-0001Sj-U9
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54350 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nqvXP-00032M-5A
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:53 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxcNpPh4Ni4sEZAA--.25635S35; 
 Tue, 17 May 2022 19:31:03 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca
Subject: [PATCH v4 33/43] hw/intc: Add LoongArch ls7a msi interrupt controller
 support(PCH-MSI)
Date: Tue, 17 May 2022 19:30:13 +0800
Message-Id: <20220517113023.3051143-34-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxcNpPh4Ni4sEZAA--.25635S35
X-Coremail-Antispam: 1UD129KBjvJXoW3GrW8Cr18JrWDZr4kJr1UWrg_yoW7try3pr
 sru34agr4kta17WFZ3J34rAF95JFs7ury2vF4a9ryxCr4DAas5XF1ktry7WFyUK3ykGryj
 va95Ca12qa1UGaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch realize PCH-MSI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/Kconfig                     |  5 ++
 hw/intc/loongarch_pch_msi.c         | 73 +++++++++++++++++++++++++++++
 hw/intc/meson.build                 |  1 +
 hw/intc/trace-events                |  3 ++
 hw/loongarch/Kconfig                |  1 +
 include/hw/intc/loongarch_pch_msi.h | 20 ++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 hw/intc/loongarch_pch_msi.c
 create mode 100644 include/hw/intc/loongarch_pch_msi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 362980ca8c..58f550b865 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -94,3 +94,8 @@ config LOONGARCH_IPI
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
index 0000000000..74bcdbdb48
--- /dev/null
+++ b/hw/intc/loongarch_pch_msi.c
@@ -0,0 +1,73 @@
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
+    assert(irq_num < PCH_MSI_IRQ_NUM);
+    qemu_set_irq(s->pch_msi_irq[irq_num], 1);
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
+
+    memory_region_init_io(&s->msi_mmio, obj, &loongarch_pch_msi_ops,
+                          s, TYPE_LOONGARCH_PCH_MSI, 0x8);
+    sysbus_init_mmio(sbd, &s->msi_mmio);
+    msi_nonbroken = true;
+
+    qdev_init_gpio_out(DEVICE(obj), s->pch_msi_irq, PCH_MSI_IRQ_NUM);
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
index 03f13f1c49..1d407c046d 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -65,3 +65,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 1f343676ee..8bcc1b6992 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -300,3 +300,6 @@ loongarch_pch_pic_high_readw(unsigned size, uint32_t addr, unsigned long val) "s
 loongarch_pch_pic_high_writew(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
 loongarch_pch_pic_readb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
 loongarch_pch_pic_writeb(unsigned size, uint32_t addr, unsigned long val) "size: %u addr: 0x%"PRIx32 "val: 0x%" PRIx64
+
+# loongarch_pch_msi.c
+loongarch_msi_set_irq(int irq_num) "set msi irq %d"
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 2df45f7e8f..d814fc6103 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -4,3 +4,4 @@ config LOONGARCH_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
+    select LOONGARCH_PCH_MSI
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
new file mode 100644
index 0000000000..f668bfca7a
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
+
+/* Msi irq start start from 64 to 255 */
+#define PCH_MSI_IRQ_START   64
+#define PCH_MSI_IRQ_END     255
+#define PCH_MSI_IRQ_NUM     192
+
+struct LoongArchPCHMSI {
+    SysBusDevice parent_obj;
+    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
+    MemoryRegion msi_mmio;
+};
-- 
2.31.1


