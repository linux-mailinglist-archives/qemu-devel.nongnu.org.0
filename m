Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8F610760
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 03:42:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooEMA-000293-3t; Thu, 27 Oct 2022 21:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ooEM7-00028i-DB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:40:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ooEM4-0007sC-WB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 21:40:19 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxbbf4MltjDf4CAA--.6488S3;
 Fri, 28 Oct 2022 09:40:08 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxXuD4MltjbxcGAA--.21470S3; 
 Fri, 28 Oct 2022 09:40:08 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 philmd@linaro.org
Subject: [PATCH v2 1/3] hw/loongarch: Load FDT table into dram memory space
Date: Fri, 28 Oct 2022 09:40:05 +0800
Message-Id: <20221028014007.2718352-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
References: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXuD4MltjbxcGAA--.21470S3
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJw47Kw4DJw1UJF4kZFWrZrb_yoW5Xr4kpF
 y3uFn3Wr40qrs3Wrn7GF98uF1DArn7Ca42gFW7Cr4FkF9rWr10qrW8A3yqvFy8A395XF4Y
 vFyvqrWxX3W8J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x
 0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
 7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Load FDT table into dram memory space, and the addr is 2 MiB.
Since lowmem region starts from 0, FDT base address is located
at 2 MiB to avoid NULL pointer access.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/virt.c         | 18 +++++++++++-------
 include/hw/loongarch/virt.h |  3 ---
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 29df99727d..fe33e7e3e4 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -159,7 +159,6 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
                                  1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
                                  2, base_mmio, 2, size_mmio);
     g_free(nodename);
-    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
 }
 
 static void fdt_add_irqchip_node(LoongArchMachineState *lams)
@@ -689,6 +688,7 @@ static void loongarch_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
+    hwaddr fdt_base;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
@@ -793,12 +793,16 @@ static void loongarch_init(MachineState *machine)
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
     fdt_add_pcie_node(lams);
-
-    /* load fdt */
-    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
-    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, &error_fatal);
-    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, fdt_rom);
-    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, VIRT_FDT_BASE);
+    /*
+     * Since lowmem region starts from 0, FDT base address is located
+     * at 2 MiB to avoid NULL pointer access.
+     *
+     * Put the FDT into the memory map as a ROM image: this will ensure
+     * the FDT is copied again upon reset, even if addr points into RAM.
+     */
+    fdt_base = 2 * MiB;
+    qemu_fdt_dumpdtb(machine->fdt, lams->fdt_size);
+    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, fdt_base);
 }
 
 bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 09f1c88ee5..45c383f5a7 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -28,9 +28,6 @@
 #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
 #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
 
-#define VIRT_FDT_BASE           0x1c400000
-#define VIRT_FDT_SIZE           0x100000
-
 struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
-- 
2.31.1


