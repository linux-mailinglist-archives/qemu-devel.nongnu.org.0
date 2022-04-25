Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D950DD1A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:48:43 +0200 (CEST)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivKk-00019N-Sn
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukW-0008L5-GS
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39676 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukT-0001L0-74
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:16 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S41; 
 Mon, 25 Apr 2022 17:11:00 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/43] hw/loongarch: Add LoongArch load elf function.
Date: Mon, 25 Apr 2022 17:10:23 +0800
Message-Id: <20220425091027.2877892-40-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S41
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4kWryDCrW5Xw48WrWDXFb_yoW7CFW7pF
 9xury5Kr48JFZxAwn7X345Wrn8Zw4kC3WagFW7CrWFkFsFgryUZ3y8J39ruFWjyaykWryY
 gr95Jr4Yv3W5J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongson3.c    | 54 +++++++++++++++++++++++++++++++++++--
 include/hw/loongarch/virt.h |  9 +++++++
 target/loongarch/cpu.c      |  4 +++
 target/loongarch/cpu.h      |  2 ++
 4 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 2b87b193c7..67c130de63 100644
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
+    unsigned long ram_size;
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
+    int64_t kernel_entry, kernel_low, kernel_high;
+    long kernel_size;
+
+    kernel_size = load_elf(loaderparams.kernel_filename, NULL,
+                           cpu_loongarch_virt_to_phys, NULL,
+                           (uint64_t *)&kernel_entry, (uint64_t *)&kernel_low,
+                           (uint64_t *)&kernel_high, NULL, 0,
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
@@ -216,12 +248,15 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
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
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -237,22 +272,37 @@ static void loongarch_init(MachineState *machine)
         cpu_create(machine->cpu_type);
     }
 
+    if (ram_size < 1 * GiB) {
+        error_report("ram_size must be greater than 1G.");
+        exit(1);
+    }
+
     /* Add memory region */
     memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
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
+            }
+        }
+    }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
 }
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09a816191c..35e6bc5055 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -12,12 +12,17 @@
 #include "hw/boards.h"
 #include "qemu/queue.h"
 #include "hw/intc/loongarch_ipi.h"
+#include "qemu/units.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
 
+#define FW_CFG_ADDR             0x1e020000
+#define LA_BIOS_BASE            0x1c000000
+#define LA_BIOS_SIZE            (4 * MiB)
+
 struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
@@ -26,6 +31,10 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    MemoryRegion bios;
+
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d3e964a4ca..4937c1ba85 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -525,8 +525,12 @@ static const MemoryRegionOps loongarch_qemu_ops = {
 static void do_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
 
     cpu_reset(CPU(cpu));
+    if (env->load_elf) {
+        cpu_set_pc(CPU(cpu), env->elf_address);
+    }
 }
 
 static void loongarch_cpu_init(Object *obj)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 734f90168e..dfd9e31ec9 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -309,6 +309,8 @@ typedef struct CPUArchState {
     AddressSpace address_space_iocsr;
     MemoryRegion system_iocsr;
     MemoryRegion iocsr_mem;
+    bool load_elf;
+    uint64_t elf_address;
 } CPULoongArchState;
 
 /**
-- 
2.31.1


