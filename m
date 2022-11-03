Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B0617CD2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZVL-0002Ne-Rj; Thu, 03 Nov 2022 08:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oqZV8-0002KK-Ei
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:20 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oqZV2-0000ZE-SQ
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:39:17 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxLdlotmNjQzsEAA--.14603S3;
 Thu, 03 Nov 2022 20:39:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxJldltmNjofgLAA--.16257S5; 
 Thu, 03 Nov 2022 20:39:04 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 3/7] hw/loongarch: Load FDT table into dram memory space
Date: Thu,  3 Nov 2022 20:38:57 +0800
Message-Id: <20221103123901.2811990-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221103123901.2811990-1-gaosong@loongson.cn>
References: <20221103123901.2811990-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldltmNjofgLAA--.16257S5
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGry8Gw4UXr1Uur4kJrW5Wrg_yoW5Ar1rpF
 y3uFn3Wr40qrsrWrn2gFyUuF1UArn7Ca42gFW29r4FkFyDWr109rW8A3yqyFy8A34rXFWY
 vFyvqrWfW3W8J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 b0AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
 xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Load FDT table into dram memory space, and the addr is 2 MiB.
Since lowmem region starts from 0, FDT base address is located
at 2 MiB to avoid NULL pointer access.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20221028014007.2718352-2-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/virt.c         | 18 +++++++++++-------
 include/hw/loongarch/virt.h |  3 ---
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 4b595a9ea4..50e9829a94 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -159,7 +159,6 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
                                  1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
                                  2, base_mmio, 2, size_mmio);
     g_free(nodename);
-    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
 }
 
 static void fdt_add_irqchip_node(LoongArchMachineState *lams)
@@ -656,6 +655,7 @@ static void loongarch_init(MachineState *machine)
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
+    hwaddr fdt_base;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
@@ -760,12 +760,16 @@ static void loongarch_init(MachineState *machine)
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


