Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740355455B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:47:51 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xtm-000297-51
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xpW-0007vw-Cs
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53552 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xpU-0003xy-73
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:26 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S6; 
 Wed, 22 Jun 2022 18:43:05 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 04/10] hw/loongarch: Add linux kernel booting support
Date: Wed, 22 Jun 2022 18:42:55 +0800
Message-Id: <20220622104301.804447-5-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUAF17Ar1ruF4rGryrtFb_yoWrtrWkpF
 ZxWF1Fqrs5AFn3Aw13tryUury5C34kCayag3W7Cr4SyFn8WryUuw15W34YvFyj9a95WF1Y
 qFZ0qrWag3WDJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

There are two situations to start system by kernel file. If exists bios
option, system will boot from loaded bios file, else system will boot
from hardcoded auxcode, and jump to kernel elf entry.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/loongson3.c | 109 +++++++++++++++++++++++++++++++++------
 1 file changed, 94 insertions(+), 15 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index ac4a7e4143..c381a9c016 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -109,6 +109,8 @@ static const MemoryRegionOps loongarch_virt_pm_ops = {
 static struct _loaderparams {
     uint64_t ram_size;
     const char *kernel_filename;
+    const char *kernel_cmdline;
+    const char *initrd_filename;
 } loaderparams;
 
 static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
@@ -354,18 +356,97 @@ static void reset_load_elf(void *opaque)
     }
 }
 
+/* Load an image file into an fw_cfg entry identified by key. */
+static void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
+                                 uint16_t data_key, const char *image_name,
+                                 bool try_decompress)
+{
+    size_t size = -1;
+    uint8_t *data;
+
+    if (image_name == NULL) {
+        return;
+    }
+
+    if (try_decompress) {
+        size = load_image_gzipped_buffer(image_name,
+                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
+    }
+
+    if (size == (size_t)-1) {
+        gchar *contents;
+        gsize length;
+
+        if (!g_file_get_contents(image_name, &contents, &length, NULL)) {
+            error_report("failed to load \"%s\"", image_name);
+            exit(1);
+        }
+        size = length;
+        data = (uint8_t *)contents;
+    }
+
+    fw_cfg_add_i32(fw_cfg, size_key, size);
+    fw_cfg_add_bytes(fw_cfg, data_key, data, size);
+}
+
+static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
+{
+    /*
+     * Expose the kernel, the command line, and the initrd in fw_cfg.
+     * We don't process them here at all, it's all left to the
+     * firmware.
+     */
+    load_image_to_fw_cfg(fw_cfg,
+                         FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                         loaderparams.kernel_filename,
+                         false);
+
+    if (loaderparams.initrd_filename) {
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                             loaderparams.initrd_filename, false);
+    }
+
+    if (loaderparams.kernel_cmdline) {
+        fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                       strlen(loaderparams.kernel_cmdline) + 1);
+        fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                          loaderparams.kernel_cmdline);
+    }
+}
+
+static void loongarch_firmware_boot(LoongArchMachineState *lams)
+{
+    fw_cfg_add_kernel_info(lams->fw_cfg);
+}
+
+static void loongarch_direct_kernel_boot(LoongArchMachineState *lams)
+{
+    MachineState *machine = MACHINE(lams);
+    int64_t kernel_addr = 0;
+    LoongArchCPU *lacpu;
+    int i;
+
+    kernel_addr = load_kernel_info();
+    if (!machine->firmware) {
+        for (i = 0; i < machine->smp.cpus; i++) {
+            lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
+            lacpu->env.load_elf = true;
+            lacpu->env.elf_address = kernel_addr;
+            qemu_register_reset(reset_load_elf, lacpu);
+        }
+    }
+}
+
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
-    const char *kernel_filename = machine->kernel_filename;
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
-    LoongArchCPU *lacpu;
     int i;
-    int64_t kernel_addr = 0;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
@@ -414,18 +495,16 @@ static void loongarch_init(MachineState *machine)
                         memmap_table,
                         sizeof(struct memmap_entry) * (memmap_entries));
     }
-
-    if (kernel_filename) {
-        loaderparams.ram_size = ram_size;
-        loaderparams.kernel_filename = kernel_filename;
-        kernel_addr = load_kernel_info();
-        if (!machine->firmware) {
-            for (i = 0; i < machine->smp.cpus; i++) {
-                lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
-                lacpu->env.load_elf = true;
-                lacpu->env.elf_address = kernel_addr;
-                qemu_register_reset(reset_load_elf, lacpu);
-            }
+    loaderparams.ram_size = ram_size;
+    loaderparams.kernel_filename = machine->kernel_filename;
+    loaderparams.kernel_cmdline = machine->kernel_cmdline;
+    loaderparams.initrd_filename = machine->initrd_filename;
+    /* load the kernel. */
+    if (loaderparams.kernel_filename) {
+        if (lams->bios_loaded) {
+            loongarch_firmware_boot(lams);
+        } else {
+            loongarch_direct_kernel_boot(lams);
         }
     }
     /* Initialize the IO interrupt subsystem */
-- 
2.31.1


