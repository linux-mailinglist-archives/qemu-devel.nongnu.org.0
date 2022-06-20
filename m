Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A87551248
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:15:00 +0200 (CEST)
Received: from localhost ([::1]:42218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CYk-0006no-TH
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3CPU-0006f5-0y
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47786 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3CPI-0007Jt-VS
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:17 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+YjKrBilqVOAA--.20331S8; 
 Mon, 20 Jun 2022 16:04:54 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 6/8] hw/loongarch: Fix loongarch ipi device
Date: Mon, 20 Jun 2022 16:04:49 +0800
Message-Id: <20220620080451.3711049-7-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+YjKrBilqVOAA--.20331S8
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1DWFyfZF1DXr4xKryrXrb_yoWxXry7pr
 9rurWa9r48tFZrXa4DJasrXF1DJ3Z7Wa429a9Ikay09F4kXry29asYy34qqFyqy3s5JF1Y
 vr1kCr42qa1UX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/intc/loongarch_ipi.c         | 85 ++++++++++++++++++++++-----------
 hw/loongarch/loongson3.c        |  5 +-
 include/hw/intc/loongarch_ipi.h |  8 ++--
 3 files changed, 65 insertions(+), 33 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 66bee93675..57d7965289 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -50,35 +50,40 @@ static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
     return ret;
 }
 
-static int get_ipi_data(target_ulong val)
+static void send_ipi_data(CPULoongArchState *env, target_ulong val, target_ulong addr)
 {
     int i, mask, data;
 
-    data = val >> 32;
-    mask = (val >> 27) & 0xf;
-
+    data = address_space_ldl(&env->address_space_iocsr, addr,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+    mask  = 0;
     for (i = 0; i < 4; i++) {
-        if ((mask >> i) & 1) {
-            data &= ~(0xff << (i * 8));
+        /* bit 27 - 30 is mask for byte write */
+        if (val & (0x1UL << (27 + i))) {
+            mask |= 0xff << (i * 8);
         }
     }
-    return data;
+
+    data &= mask;
+    data |= (val >> 32) & ~mask;
+    address_space_stl(&env->address_space_iocsr, addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
 static void ipi_send(uint64_t val)
 {
     int cpuid, data;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     /* IPI status vector */
     data = 1 << (val & 0x1f);
-    qemu_mutex_lock_iothread();
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
     loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
-    qemu_mutex_unlock_iothread();
     address_space_stl(&env->address_space_iocsr, 0x1008,
                       data, MEMTXATTRS_UNSPECIFIED, NULL);
 
@@ -86,23 +91,23 @@ static void ipi_send(uint64_t val)
 
 static void mail_send(uint64_t val)
 {
-    int cpuid, data;
+    int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
+    CPUState *cs;
+    LoongArchCPU *cpu;
 
     cpuid = (val >> 16) & 0x3ff;
     addr = 0x1020 + (val & 0x1c);
-    CPUState *cs = qemu_get_cpu(cpuid);
-    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    cs = qemu_get_cpu(cpuid);
+    cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    data = get_ipi_data(val);
-    address_space_stl(&env->address_space_iocsr, addr,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+    send_ipi_data(env, val, addr);
 }
 
 static void any_send(uint64_t val)
 {
-    int cpuid, data;
+    int cpuid;
     hwaddr addr;
     CPULoongArchState *env;
 
@@ -111,9 +116,7 @@ static void any_send(uint64_t val)
     CPUState *cs = qemu_get_cpu(cpuid);
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     env = &cpu->env;
-    data = get_ipi_data(val);
-    address_space_stl(&env->address_space_iocsr, addr,
-                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+    send_ipi_data(env, val, addr);
 }
 
 static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
@@ -150,12 +153,6 @@ static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
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
@@ -172,6 +169,32 @@ static const MemoryRegionOps loongarch_ipi_ops = {
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
@@ -185,10 +208,16 @@ static void loongarch_ipi_init(Object *obj)
         return;
     }
     lams = LOONGARCH_MACHINE(machine);
+
     for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
         memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
-                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x100);
+                              &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x48);
         sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
+
+        memory_region_init_io(&s->ipi64_iocsr_mem[cpu], obj, &loongarch_ipi64_ops,
+                              &lams->ipi_core[cpu], "loongarch_ipi64_iocsr", 0x118);
+        sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem[cpu]);
+
         qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
     }
 }
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 146f582dbe..c8bbe384d4 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -455,7 +455,10 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
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
index 996ed7ea93..a98c3dd4a3 100644
--- a/include/hw/intc/loongarch_ipi.h
+++ b/include/hw/intc/loongarch_ipi.h
@@ -23,9 +23,9 @@
 #define IOCSR_IPI_SEND        0x40
 #define IOCSR_MAIL_SEND       0x48
 #define IOCSR_ANY_SEND        0x158
-
-/* IPI system memory address */
-#define IPI_SYSTEM_MEM        0x1fe01000
+#define MAIL_SEND_ADDR        (SMP_IPI_MAILBOX + IOCSR_MAIL_SEND)
+#define MAIL_SEND_OFFSET      0
+#define ANY_SEND_OFFSET       (IOCSR_ANY_SEND - IOCSR_MAIL_SEND)
 
 #define MAX_IPI_CORE_NUM      4
 #define MAX_IPI_MBX_NUM       4
@@ -46,7 +46,7 @@ typedef struct IPICore {
 struct LoongArchIPI {
     SysBusDevice parent_obj;
     MemoryRegion ipi_iocsr_mem[MAX_IPI_CORE_NUM];
-    MemoryRegion ipi_system_mem[MAX_IPI_CORE_NUM];
+    MemoryRegion ipi64_iocsr_mem[MAX_IPI_CORE_NUM];
 };
 
 #endif
-- 
2.31.1


