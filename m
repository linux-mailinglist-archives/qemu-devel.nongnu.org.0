Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324865630C0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:54:25 +0200 (CEST)
Received: from localhost ([::1]:58120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DLz-0008FH-EO
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D8Z-00009a-Ci
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41866 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D8V-0002rM-RT
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:31 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S12; 
 Fri, 01 Jul 2022 17:34:10 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 10/11] hw/intc/loongarch_ipi: Fix ipi device access of 64bits
Date: Fri,  1 Jul 2022 17:34:06 +0800
Message-Id: <20220701093407.2150607-11-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S12
X-Coremail-Antispam: 1UD129KBjvJXoWxAw47GFy8tF1Utw4fJw15twb_yoWrWFWDpr
 y7uFyYgr48AFnrXF93KasrXFn8Gwn7GFy29anIkay09F47XryjvF1SyryDXFyUA3sxJF1Y
 qrykWFW2g3WUXwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

In general loongarch ipi device, 32bit registers is emulated, however for
anysend/mailsend device only 64bit register access is supported. So separate
the ipi memory region into two regions, including 32 bits and 64 bits.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_ipi.c         | 38 +++++++++++++++++++++++++++------
 hw/loongarch/loongson3.c        |  5 ++++-
 include/hw/intc/loongarch_ipi.h |  7 +++---
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 66bee93675..553e88703d 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -150,12 +150,6 @@ static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
     case IOCSR_IPI_SEND:
         ipi_send(val);
         break;
-    case IOCSR_MAIL_SEND:
-        mail_send(val);
-        break;
-    case IOCSR_ANY_SEND:
-        any_send(val);
-        break;
     default:
         qemu_log_mask(LOG_UNIMP, "invalid write: %x", (uint32_t)addr);
         break;
@@ -172,6 +166,32 @@ static const MemoryRegionOps loongarch_ipi_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+/* mail send and any send only support writeq */
+static void loongarch_ipi_writeq(void *opaque, hwaddr addr, uint64_t val,
+                                 unsigned size)
+{
+    addr &= 0xfff;
+    switch (addr) {
+    case MAIL_SEND_OFFSET:
+        mail_send(val);
+        break;
+    case ANY_SEND_OFFSET:
+        any_send(val);
+        break;
+    default:
+       break;
+    }
+}
+
+static const MemoryRegionOps loongarch_ipi64_ops = {
+    .write = loongarch_ipi_writeq,
+    .impl.min_access_size = 8,
+    .impl.max_access_size = 8,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
 static void loongarch_ipi_init(Object *obj)
 {
     int cpu;
@@ -187,8 +207,12 @@ static void loongarch_ipi_init(Object *obj)
     lams = LOONGARCH_MACHINE(machine);
     for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
         memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
-                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x100);
+                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x48);
         sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
+
+        memory_region_init_io(&s->ipi64_iocsr_mem[cpu], obj, &loongarch_ipi64_ops,
+                              &lams->ipi_core[cpu], "loongarch_ipi64_iocsr", 0x118);
+        sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem[cpu]);
         qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
     }
 }
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index bd20ebbb78..0cc023bd3c 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -230,7 +230,10 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
         /* IPI iocsr memory region */
         memory_region_add_subregion(&env->system_iocsr, SMP_IPI_MAILBOX,
                                     sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
-                                    cpu));
+                                    cpu * 2));
+        memory_region_add_subregion(&env->system_iocsr, MAIL_SEND_ADDR,
+                                    sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
+                                    cpu * 2 + 1));
         /* extioi iocsr memory region */
         memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
index 996ed7ea93..0ee48fca55 100644
--- a/include/hw/intc/loongarch_ipi.h
+++ b/include/hw/intc/loongarch_ipi.h
@@ -24,8 +24,9 @@
 #define IOCSR_MAIL_SEND       0x48
 #define IOCSR_ANY_SEND        0x158
 
-/* IPI system memory address */
-#define IPI_SYSTEM_MEM        0x1fe01000
+#define MAIL_SEND_ADDR        (SMP_IPI_MAILBOX + IOCSR_MAIL_SEND)
+#define MAIL_SEND_OFFSET      0
+#define ANY_SEND_OFFSET       (IOCSR_ANY_SEND - IOCSR_MAIL_SEND)
 
 #define MAX_IPI_CORE_NUM      4
 #define MAX_IPI_MBX_NUM       4
@@ -46,7 +47,7 @@ typedef struct IPICore {
 struct LoongArchIPI {
     SysBusDevice parent_obj;
     MemoryRegion ipi_iocsr_mem[MAX_IPI_CORE_NUM];
-    MemoryRegion ipi_system_mem[MAX_IPI_CORE_NUM];
+    MemoryRegion ipi64_iocsr_mem[MAX_IPI_CORE_NUM];
 };
 
 #endif
-- 
2.31.1


