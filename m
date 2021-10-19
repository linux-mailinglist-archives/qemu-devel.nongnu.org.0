Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CE43301A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:52:24 +0200 (CEST)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjv5-0003uh-JG
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfF-0001sV-Sm
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35074 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjfA-0004Zy-NV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:00 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S18; 
 Tue, 19 Oct 2021 15:35:40 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/31] hw/loongarch: Add loongarch ipi interrupt support(IPI)
Date: Tue, 19 Oct 2021 15:35:02 +0800
Message-Id: <1634628917-10031-17-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S18
X-Coremail-Antispam: 1UD129KBjvJXoW3XF1rAr1xZry8JF1fJry7ZFb_yoW3WrW3pF
 9ruFWkKr48Wrs7Wrs7Jas8XFn3Jwn7GF17ZFWS9a4FkF47tw1Yvw1vyrZFvFyUJ3y0qFyY
 9F95Ww12qF4UZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

This patch realize the IPI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/ipi.c               | 145 +++++++++++++++++++++++++++++++
 hw/loongarch/ls3a5000_virt.c     |   2 +
 hw/loongarch/meson.build         |   2 +-
 include/hw/loongarch/gipi.h      |  38 ++++++++
 include/hw/loongarch/loongarch.h |   3 +
 target/loongarch/cpu.h           |   1 +
 6 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 hw/loongarch/ipi.c
 create mode 100644 include/hw/loongarch/gipi.h

diff --git a/hw/loongarch/ipi.c b/hw/loongarch/ipi.c
new file mode 100644
index 0000000000..a5c82b2143
--- /dev/null
+++ b/hw/loongarch/ipi.c
@@ -0,0 +1,145 @@
+/*
+ * Loongarch ipi interrupt support
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "exec/address-spaces.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/cpus.h"
+#include "cpu.h"
+#include "qemu/log.h"
+#include "hw/loongarch/loongarch.h"
+#include "migration/vmstate.h"
+
+static const VMStateDescription vmstate_gipi_core = {
+    .name = "gipi-single",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(status, gipi_core),
+        VMSTATE_UINT32(en, gipi_core),
+        VMSTATE_UINT32(set, gipi_core),
+        VMSTATE_UINT32(clear, gipi_core),
+        VMSTATE_UINT64_ARRAY(buf, gipi_core, MAX_GIPI_MBX_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_gipi = {
+    .name = "gipi",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(core, gipiState, MAX_GIPI_CORE_NUM, 0,
+                             vmstate_gipi_core, gipi_core),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void gipi_writel(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    gipi_core *s = opaque;
+    void *pbuf;
+
+    if (size != 4) {
+        hw_error("size not 4");
+    }
+    addr &= 0xff;
+    switch (addr) {
+    case CORE_STATUS_OFF:
+        hw_error("CORE_SET_OFF Can't be write\n");
+        break;
+    case CORE_EN_OFF:
+        s->en = val;
+        break;
+    case CORE_SET_OFF:
+        s->status |= val;
+        if (s->status != 0) {
+            qemu_irq_raise(s->irq);
+        }
+        break;
+    case CORE_CLEAR_OFF:
+        s->status ^= val;
+        if (s->status == 0) {
+            qemu_irq_lower(s->irq);
+        }
+        break;
+    case CORE_BUF_20 ... CORE_BUF_38:
+        pbuf =  (void *)s->buf + (addr - 0x20);
+        *(unsigned int *)pbuf = val;
+        break;
+    default:
+        break;
+    }
+}
+
+static uint64_t gipi_readl(void *opaque, hwaddr addr, unsigned size)
+{
+    gipi_core *s = opaque;
+    uint64_t ret = 0;
+    void *pbuf;
+
+    addr &= 0xff;
+    if (size != 4) {
+        hw_error("size not 4 %d\n", size);
+    }
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
+    case CORE_BUF_20 ... CORE_BUF_38:
+        pbuf =  (void *)s->buf + (addr - 0x20);
+        ret = *(unsigned int *)pbuf;
+        break;
+    default:
+        break;
+    }
+
+    return ret;
+}
+
+static const MemoryRegionOps gipi_ops = {
+    .read = gipi_readl,
+    .write = gipi_writel,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+int cpu_init_ipi(LoongarchMachineState *lsms, qemu_irq parent, int cpu)
+{
+    int core_num = cpu % 4;
+    hwaddr addr;
+    MemoryRegion *region;
+    char str[32];
+
+    if (lsms->gipi == NULL) {
+        lsms->gipi = g_malloc0(sizeof(gipiState));
+        vmstate_register(NULL, 0, &vmstate_gipi, lsms->gipi);
+    }
+
+    lsms->gipi->core[cpu].irq = parent;
+
+    addr = SMP_GIPI_MAILBOX + core_num * 0x100;
+    region = g_new(MemoryRegion, 1);
+    sprintf(str, "gipi%d", cpu);
+    memory_region_init_io(region, NULL, &gipi_ops,
+                          &lsms->gipi->core[cpu], str, 0x100);
+    memory_region_add_subregion(get_system_memory(), addr, region);
+    return 0;
+}
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 222c76bc0d..115954033e 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -113,6 +113,7 @@ static void ls3a5000_virt_init(MachineState *machine)
     char *ramName = NULL;
     ram_addr_t ram_size = machine->ram_size;
     MemoryRegion *address_space_mem = get_system_memory();
+    LoongarchMachineState *lsms = LOONGARCH_MACHINE(machine);
     int i;
     MemoryRegion *iomem = NULL;
 
@@ -148,6 +149,7 @@ static void ls3a5000_virt_init(MachineState *machine)
         /* Init CPU internal devices */
         cpu_loongarch_init_irq(cpu);
         cpu_loongarch_clock_init(cpu);
+        cpu_init_ipi(lsms, env->irq[IRQ_IPI], i);
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index a972210680..1bd209c9eb 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,5 +1,5 @@
 loongarch_ss = ss.source_set()
 loongarch_ss.add(files('loongarch_int.c'))
-loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c'))
+loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c', 'ipi.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/loongarch/gipi.h b/include/hw/loongarch/gipi.h
new file mode 100644
index 0000000000..9844b6992f
--- /dev/null
+++ b/include/hw/loongarch/gipi.h
@@ -0,0 +1,38 @@
+/*
+ * Loongarch ipi interrupt header files
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef HW_LOONGARCH_GIPI_H
+#define HW_LOONGARCH_GIPI_H
+
+#define SMP_GIPI_MAILBOX                0x1fe01000ULL
+#define CORE_STATUS_OFF       0x000
+#define CORE_EN_OFF           0x004
+#define CORE_SET_OFF          0x008
+#define CORE_CLEAR_OFF        0x00c
+#define CORE_BUF_20           0x020
+#define CORE_BUF_28           0x028
+#define CORE_BUF_30           0x030
+#define CORE_BUF_38           0x038
+
+#define MAX_GIPI_CORE_NUM      4
+#define MAX_GIPI_MBX_NUM       4
+
+typedef struct gipi_core {
+    uint32_t status;
+    uint32_t en;
+    uint32_t set;
+    uint32_t clear;
+    uint64_t buf[MAX_GIPI_MBX_NUM];
+    qemu_irq irq;
+} gipi_core;
+
+typedef struct gipiState {
+    gipi_core core[MAX_GIPI_CORE_NUM];
+} gipiState;
+
+#endif
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 0edc313546..8e98430747 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -13,6 +13,7 @@
 #include "qemu-common.h"
 #include "hw/boards.h"
 #include "qemu/queue.h"
+#include "hw/loongarch/gipi.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 #define PM_MMIO_ADDR            0x10080000UL
@@ -39,6 +40,7 @@ typedef struct LoongarchMachineState {
     /*< private >*/
     MachineState parent_obj;
 
+    gipiState   *gipi;
 } LoongarchMachineState;
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
@@ -46,4 +48,5 @@ DECLARE_INSTANCE_CHECKER(LoongarchMachineState, LOONGARCH_MACHINE,
                          TYPE_LOONGARCH_MACHINE)
 
 void cpu_loongarch_init_irq(LoongArchCPU *cpu);
+int cpu_init_ipi(LoongarchMachineState *ms, qemu_irq parent, int cpu);
 #endif
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index cfdcf1d4a0..4acbc08179 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -50,6 +50,7 @@ extern const char * const fregnames[];
 
 #define N_IRQS      14
 #define IRQ_TIMER   11
+#define IRQ_IPI     12
 
 #define LOONGARCH_HFLAG_KU     0x00003 /* kernel/user mode mask   */
 #define LOONGARCH_HFLAG_UM     0x00003 /* user mode flag                     */
-- 
2.27.0


