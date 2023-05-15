Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F639702B4A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:19:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWEj-0002Gb-57; Mon, 15 May 2023 07:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pyWEf-0002DC-OA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:19:25 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pyWEc-0001Vl-E9
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:19:25 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxZ+kwFWJkzssIAA--.14875S3;
 Mon, 15 May 2023 19:19:12 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx8a8tFWJkkOZfAA--.35452S5; 
 Mon, 15 May 2023 19:19:12 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 3/5] hw/loongarch/virt: Modify ipi as percpu device
Date: Mon, 15 May 2023 19:19:06 +0800
Message-Id: <20230515111908.2606580-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230515111908.2606580-1-gaosong@loongson.cn>
References: <20230515111908.2606580-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx8a8tFWJkkOZfAA--.35452S5
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3XryDXFW3Ww4UWFy3Kw1rZwb_yoWxXFW5pr
 y7uF93WrW8Wrs7Xwn7GasxWr1DG3WxCF129a1akFWSkF42qrWjvryIyr1qqa4UA348XFyY
 vryru342q3WDZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ipi is used to communicate between cpus, this patch modified
loongarch ipi device as percpu device, so that there are
2 MemoryRegions with ipi device, rather than 2*cpus
MemoryRegions, which may be large than QDEV_MAX_MMIO if
more cpus are added on loongarch virt machine.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230512100421.1867848-2-gaosong@loongson.cn>
---
 hw/intc/loongarch_ipi.c         | 44 ++++++++++++---------------------
 hw/loongarch/virt.c             | 12 ++++-----
 include/hw/intc/loongarch_ipi.h | 10 +++-----
 include/hw/loongarch/virt.h     |  1 -
 4 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index 9de7c01e11..054e143842 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -201,55 +201,43 @@ static const MemoryRegionOps loongarch_ipi64_ops = {
 
 static void loongarch_ipi_init(Object *obj)
 {
-    int cpu;
-    LoongArchMachineState *lams;
     LoongArchIPI *s = LOONGARCH_IPI(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    Object *machine = qdev_get_machine();
-    ObjectClass *mc = object_get_class(machine);
-    /* 'lams' should be initialized */
-    if (!strcmp(MACHINE_CLASS(mc)->name, "none")) {
-        return;
-    }
-    lams = LOONGARCH_MACHINE(machine);
-    for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
-        memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
-                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x48);
 
-        /* loongarch_ipi_iocsr performs re-entrant IO through ipi_send */
-        s->ipi_iocsr_mem[cpu].disable_reentrancy_guard = true;
+    memory_region_init_io(&s->ipi_iocsr_mem, obj, &loongarch_ipi_ops,
+                          &s->ipi_core, "loongarch_ipi_iocsr", 0x48);
 
-        sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
+    /* loongarch_ipi_iocsr performs re-entrant IO through ipi_send */
+    s->ipi_iocsr_mem.disable_reentrancy_guard = true;
 
-        memory_region_init_io(&s->ipi64_iocsr_mem[cpu], obj, &loongarch_ipi64_ops,
-                              &lams->ipi_core[cpu], "loongarch_ipi64_iocsr", 0x118);
-        sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem[cpu]);
-        qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
-    }
+    sysbus_init_mmio(sbd, &s->ipi_iocsr_mem);
+
+    memory_region_init_io(&s->ipi64_iocsr_mem, obj, &loongarch_ipi64_ops,
+                          &s->ipi_core, "loongarch_ipi64_iocsr", 0x118);
+    sysbus_init_mmio(sbd, &s->ipi64_iocsr_mem);
+    qdev_init_gpio_out(DEVICE(obj), &s->ipi_core.irq, 1);
 }
 
 static const VMStateDescription vmstate_ipi_core = {
     .name = "ipi-single",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(status, IPICore),
         VMSTATE_UINT32(en, IPICore),
         VMSTATE_UINT32(set, IPICore),
         VMSTATE_UINT32(clear, IPICore),
-        VMSTATE_UINT32_ARRAY(buf, IPICore, MAX_IPI_MBX_NUM * 2),
+        VMSTATE_UINT32_ARRAY(buf, IPICore, 2),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static const VMStateDescription vmstate_loongarch_ipi = {
     .name = TYPE_LOONGARCH_IPI,
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_STRUCT_ARRAY(ipi_core, LoongArchMachineState,
-                             MAX_IPI_CORE_NUM, 0,
-                             vmstate_ipi_core, IPICore),
+        VMSTATE_STRUCT(ipi_core, LoongArchIPI, 0, vmstate_ipi_core, IPICore),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index f4bf14c1c8..c8a01b1fb6 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -565,9 +565,6 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     CPUState *cpu_state;
     int cpu, pin, i, start, num;
 
-    ipi = qdev_new(TYPE_LOONGARCH_IPI);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
-
     extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(extioi), &error_fatal);
 
@@ -598,15 +595,18 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
         lacpu = LOONGARCH_CPU(cpu_state);
         env = &(lacpu->env);
 
+        ipi = qdev_new(TYPE_LOONGARCH_IPI);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(ipi), &error_fatal);
+
         /* connect ipi irq to cpu irq */
-        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
+        qdev_connect_gpio_out(ipi, 0, qdev_get_gpio_in(cpudev, IRQ_IPI));
         /* IPI iocsr memory region */
         memory_region_add_subregion(&env->system_iocsr, SMP_IPI_MAILBOX,
                                     sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
-                                    cpu * 2));
+                                    0));
         memory_region_add_subregion(&env->system_iocsr, MAIL_SEND_ADDR,
                                     sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
-                                    cpu * 2 + 1));
+                                    1));
         /* extioi iocsr memory region */
         memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
index 0ee48fca55..664e050b92 100644
--- a/include/hw/intc/loongarch_ipi.h
+++ b/include/hw/intc/loongarch_ipi.h
@@ -28,9 +28,6 @@
 #define MAIL_SEND_OFFSET      0
 #define ANY_SEND_OFFSET       (IOCSR_ANY_SEND - IOCSR_MAIL_SEND)
 
-#define MAX_IPI_CORE_NUM      4
-#define MAX_IPI_MBX_NUM       4
-
 #define TYPE_LOONGARCH_IPI "loongarch_ipi"
 OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
 
@@ -40,14 +37,15 @@ typedef struct IPICore {
     uint32_t set;
     uint32_t clear;
     /* 64bit buf divide into 2 32bit buf */
-    uint32_t buf[MAX_IPI_MBX_NUM * 2];
+    uint32_t buf[2];
     qemu_irq irq;
 } IPICore;
 
 struct LoongArchIPI {
     SysBusDevice parent_obj;
-    MemoryRegion ipi_iocsr_mem[MAX_IPI_CORE_NUM];
-    MemoryRegion ipi64_iocsr_mem[MAX_IPI_CORE_NUM];
+    MemoryRegion ipi_iocsr_mem;
+    MemoryRegion ipi64_iocsr_mem;
+    IPICore ipi_core;
 };
 
 #endif
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 7ae8a91229..54a9f595bb 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -36,7 +36,6 @@ struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
 
-    IPICore ipi_core[MAX_IPI_CORE_NUM];
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
-- 
2.39.1


