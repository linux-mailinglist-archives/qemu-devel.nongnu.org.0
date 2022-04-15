Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A262F5027FE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:11:07 +0200 (CEST)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfIuw-00016r-Ge
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfISp-0002r1-Go
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:42:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53742 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfISd-0004a1-FK
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:42:03 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xGqPVli41gkAA--.16856S42; 
 Fri, 15 Apr 2022 17:41:37 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 40/43] hw/loongarch: Add LoongArch boot code and load elf
 function.
Date: Fri, 15 Apr 2022 17:40:55 +0800
Message-Id: <20220415094058.3584233-41-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_xGqPVli41gkAA--.16856S42
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5Gr17ZF1UJry3GF1xXwb_yoW7JF1xpF
 9xuryDWr48JFnxurn7W345urn8Aw4kG3W2gFy7AF4FkFs2gr1UZrW0g342vFyjy3yvgr90
 qryDtr4S93WUJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 hw/loongarch/loongson3.c         | 68 +++++++++++++++++++++++++++++++-
 include/hw/loongarch/loongarch.h |  8 ++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index e30fcf8104..8806a5be96 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -18,6 +18,8 @@
 #include "sysemu/rtc.h"
 #include "hw/irq.h"
 #include "net/net.h"
+#include "hw/loader.h"
+#include "elf.h"
 #include "hw/loongarch/loongarch.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
@@ -29,6 +31,49 @@
 
 #include "target/loongarch/cpu.h"
 
+static void ls3a5k_aui_boot(uint64_t start_addr)
+{
+    unsigned int ls3a5k_aui_boot_code[] = {
+        0x18000064, /* pcaddi  $r4, 0x3    */
+        0x28c00084, /* ld.d    $r4, $r4, 0 */
+        0x4c000080, /* jirl    $r0, $r4, 0 */
+        start_addr, /* elf pc address      */
+    };
+    int bios_size = sizeof(ls3a5k_aui_boot_code);
+
+    rom_add_blob_fixed("bios", ls3a5k_aui_boot_code, bios_size, LA_BIOS_BASE);
+}
+
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
@@ -207,12 +252,14 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
+    const char *kernel_filename = machine->kernel_filename;
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
+    int64_t kernel_addr = 0;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
@@ -228,22 +275,39 @@ static void loongarch_init(MachineState *machine)
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
+    }
+    /* load aui boot code */
+    if (!machine->firmware) {
+        ls3a5k_aui_boot(kernel_addr);
+    }
+    memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
+                           LA_BIOS_SIZE, &error_fatal);
+    memory_region_set_readonly(&lams->bios, true);
+    memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
+
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
 }
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index a659be2a7f..718543e62f 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -39,6 +39,10 @@
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
 
 struct LoongArchMachineState {
+#define FW_CFG_ADDR             0x1e020000
+#define LA_BIOS_BASE            0x1c000000
+#define LA_BIOS_SIZE            (4 * 1024 * 1024)
+
     /*< private >*/
     MachineState parent_obj;
 
@@ -46,6 +50,10 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    MemoryRegion bios;
+
+    /* State for other subsystems/APIs: */
+    FWCfgState  *fw_cfg;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


