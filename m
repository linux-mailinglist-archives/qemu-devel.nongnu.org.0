Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973E253E4A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:11:10 +0200 (CEST)
Received: from localhost ([::1]:44630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyCVh-0004RI-OI
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nyC5x-0000Af-Ao
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40364 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nyC5u-0004Uj-Sl
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+Z29p1ishIXAA--.3714S41; 
 Mon, 06 Jun 2022 20:44:15 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, maobibo@loongson.cn
Subject: [PATCH v7 39/43] hw/loongarch: Add LoongArch load elf function.
Date: Mon,  6 Jun 2022 20:43:29 +0800
Message-Id: <20220606124333.2060567-40-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
References: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+Z29p1ishIXAA--.3714S41
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUJw1rJFW8WFyDGw4kZwb_yoWrAr4rpF
 9xuryYgrW8JFnxAwn7W345urn8Aw48u3W3WFy7CrZYkrsrWryUZw18X347WFyj9aykWr1Y
 grZ8Xr4Yg3WUJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/loongson3.c | 61 ++++++++++++++++++++++++++++++++++++++--
 target/loongarch/cpu.h   |  2 ++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 95984c9086..3c8fcb828c 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -19,6 +19,8 @@
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
 #include "net/net.h"
+#include "hw/loader.h"
+#include "elf.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
 #include "hw/intc/loongarch_pch_pic.h"
@@ -29,6 +31,36 @@
 
 #include "target/loongarch/cpu.h"
 
+static struct _loaderparams {
+    uint64_t ram_size;
+    const char *kernel_filename;
+} loaderparams;
+
+static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
+{
+    return addr & 0x1fffffffll;
+}
+
+static int64_t load_kernel_info(void)
+{
+    uint64_t kernel_entry, kernel_low, kernel_high;
+    ssize_t kernel_size;
+
+    kernel_size = load_elf(loaderparams.kernel_filename, NULL,
+                           cpu_loongarch_virt_to_phys, NULL,
+                           &kernel_entry, &kernel_low,
+                           &kernel_high, NULL, 0,
+                           EM_LOONGARCH, 1, 0);
+
+    if (kernel_size < 0) {
+        error_report("could not load kernel '%s': %s",
+                     loaderparams.kernel_filename,
+                     load_elf_strerror(kernel_size));
+        exit(1);
+    }
+    return kernel_entry;
+}
+
 static void loongarch_devices_init(DeviceState *pch_pic)
 {
     DeviceState *gpex_dev;
@@ -200,15 +232,29 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     loongarch_devices_init(pch_pic);
 }
 
+static void reset_load_elf(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
+
+    cpu_reset(CPU(cpu));
+    if (env->load_elf) {
+        cpu_set_pc(CPU(cpu), env->elf_address);
+    }
+}
+
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
+    const char *kernel_filename = machine->kernel_filename;
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    LoongArchCPU *lacpu;
     int i;
+    int64_t kernel_addr = 0;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
@@ -234,17 +280,28 @@ static void loongarch_init(MachineState *machine)
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
     offset += 256 * MiB;
-
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
-
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    if (kernel_filename) {
+        loaderparams.ram_size = ram_size;
+        loaderparams.kernel_filename = kernel_filename;
+        kernel_addr = load_kernel_info();
+        if (!machine->firmware) {
+            for (i = 0; i < machine->smp.cpus; i++) {
+                lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
+                lacpu->env.load_elf = true;
+                lacpu->env.elf_address = kernel_addr;
+                qemu_register_reset(reset_load_elf, lacpu);
+            }
+        }
+    }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
 }
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 03cc96ee9b..71a5036c3c 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -308,6 +308,8 @@ typedef struct CPUArchState {
     AddressSpace address_space_iocsr;
     MemoryRegion system_iocsr;
     MemoryRegion iocsr_mem;
+    bool load_elf;
+    uint64_t elf_address;
 } CPULoongArchState;
 
 /**
-- 
2.31.1


