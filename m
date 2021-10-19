Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61003433009
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:47:09 +0200 (CEST)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjq0-0004X8-Ai
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfH-0001tR-N2
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35122 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjfB-0004bI-SV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:03 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S20; 
 Tue, 19 Oct 2021 15:35:42 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/31] hw/intc: Add loongarch ls7a msi interrupt controller
 support(PCH-MSI)
Date: Tue, 19 Oct 2021 15:35:04 +0800
Message-Id: <1634628917-10031-19-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S20
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5JF1kCryDAr15tF48tFb_yoWrtr43pr
 sxuw15Kr4kJw47WFZ3J34fAFWrJFs7Wry2vF4a9ryIkr47AFyrZ3Wktry7WFyUK3y8Gryj
 vFZ5C3W7Xa1UGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

This patch realize PCH-MSI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/intc/Kconfig                     |  5 ++
 hw/intc/loongarch_pch_msi.c         | 74 +++++++++++++++++++++++++++++
 hw/intc/meson.build                 |  1 +
 hw/loongarch/Kconfig                |  1 +
 include/hw/intc/loongarch_pch_msi.h | 17 +++++++
 5 files changed, 98 insertions(+)
 create mode 100644 hw/intc/loongarch_pch_msi.c
 create mode 100644 include/hw/intc/loongarch_pch_msi.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 3b7eca7b03..c0dc12dfa0 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -77,3 +77,8 @@ config M68K_IRQC
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
index 0000000000..78ccabd468
--- /dev/null
+++ b/hw/intc/loongarch_pch_msi.c
@@ -0,0 +1,74 @@
+/*
+ * QEMU Loongson 7A1000 msi interrupt controller.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/intc/loongarch_pch_msi.h"
+#include "hw/pci/msi.h"
+#include "hw/misc/unimp.h"
+#include "migration/vmstate.h"
+
+#define DEBUG_LOONGARCH_PCH_MSI 0
+
+#define DPRINTF(fmt, ...) \
+do { \
+    if (DEBUG_LOONGARCH_PCH_MSI) { \
+        fprintf(stderr, "LOONGARCH_PCH_MSI: " fmt , ## __VA_ARGS__); \
+    } \
+} while (0)
+
+static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
+                                    uint64_t val, unsigned size)
+{
+    loongarch_pch_msi *s = opaque;
+    int irq_num = val & 0xff;
+
+    qemu_set_irq(s->pch_msi_irq[irq_num - 32], 1);
+}
+
+static const MemoryRegionOps loongarch_pch_msi_ops = {
+    .read  = loongarch_msi_mem_read,
+    .write = loongarch_msi_mem_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void loongarch_pch_msi_init(Object *obj)
+{
+    loongarch_pch_msi *s = LOONGARCH_PCH_MSI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int tmp;
+
+    memory_region_init_io(&s->msi_mmio, obj, &loongarch_pch_msi_ops,
+                          s, TYPE_LOONGARCH_PCH_MSI, 0x8);
+    sysbus_init_mmio(sbd, &s->msi_mmio);
+    msi_nonbroken = true;
+
+    for (tmp = 0; tmp < 224; tmp++) {
+        sysbus_init_irq(sbd, &s->pch_msi_irq[tmp]);
+    }
+}
+
+static const TypeInfo loongarch_pch_msi_info = {
+    .name          = TYPE_LOONGARCH_PCH_MSI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(loongarch_pch_msi),
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
index c61f171d5c..749c27e072 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -59,3 +59,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index c6d7ebcd5b..4500fd3a57 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,3 +2,4 @@ config LOONGSON_3A5000
     bool
     select PCI_EXPRESS_7A
     select LOONGARCH_PCH_PIC
+    select LOONGARCH_PCH_MSI
diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
new file mode 100644
index 0000000000..e069663dc8
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -0,0 +1,17 @@
+/*
+ * Loongarch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
+DECLARE_INSTANCE_CHECKER(struct loongarch_pch_msi, LOONGARCH_PCH_MSI,
+                         TYPE_LOONGARCH_PCH_MSI)
+
+typedef struct loongarch_pch_msi {
+    SysBusDevice parent_obj;
+    qemu_irq pch_msi_irq[224];
+    MemoryRegion msi_mmio;
+} loongarch_pch_msi;
-- 
2.27.0


