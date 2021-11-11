Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8144CF6D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:01:57 +0100 (CET)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzPY-0008JJ-Pq
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:01:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0v-0006c4-Sl
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54320 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0t-0001sS-UH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:29 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S28; 
 Thu, 11 Nov 2021 09:36:14 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 26/30] hw/loongarch: Add -kernel and -initrd options
 support
Date: Thu, 11 Nov 2021 09:35:24 +0800
Message-Id: <1636594528-8175-27-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S28
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUCr1fWr17ZryUKF1Utrb_yoWrCFW8pr
 ZxZF1qgr4rAFWfAw12qFyrury5Aw4DG3Wag3Zxur1FqanFgr1UZw18Wr12vFWDGan5WF90
 qrn0krW29a4DJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/ls3a5000_virt.c     | 81 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  5 ++
 2 files changed, 86 insertions(+)

diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 85c8466d75..902a0c7630 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -29,8 +29,78 @@
 
 #define LOONGSON3_BIOSNAME "loongarch_bios.bin"
 
+static struct _loaderparams {
+    unsigned long ram_size;
+    const char *kernel_filename;
+    const char *kernel_cmdline;
+    const char *initrd_filename;
+} loaderparams;
+
 CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];
 
+static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
+{
+    return addr & 0x1fffffffll;
+}
+
+static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
+{
+    int64_t kernel_entry, kernel_low, kernel_high, initrd_size = 0;
+    long kernel_size;
+    ram_addr_t initrd_offset = 0;
+    void *cmdline_buf;
+    int ret = 0;
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
+
+    fw_cfg_add_i64(fw_cfg, FW_CFG_KERNEL_ENTRY, kernel_entry);
+
+    if (loaderparams.initrd_filename) {
+        initrd_size = get_image_size(loaderparams.initrd_filename);
+
+        if (initrd_size > 0) {
+            initrd_offset = MAX(INITRD_BASE,
+                                ROUND_UP(kernel_high, INITRD_PAGE_SIZE));
+            if (initrd_offset + initrd_size > 0x10000000) {
+                error_report("ramdisk '%s' is too big",
+                             loaderparams.initrd_filename);
+                exit(1);
+            }
+            initrd_size = load_image_targphys(loaderparams.initrd_filename,
+                                              initrd_offset,
+                                              loaderparams.ram_size - initrd_offset);
+        }
+        if (initrd_size == (target_ulong) -1) {
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
+            exit(1);
+        }
+    }
+
+    cmdline_buf = g_malloc0(COMMAND_LINE_SIZE);
+    if (initrd_size > 0)
+        ret = (1 + snprintf(cmdline_buf, COMMAND_LINE_SIZE,
+                "initrd=0x%lx,%li %s", initrd_offset,
+                initrd_size, loaderparams.kernel_cmdline));
+    else
+        ret = (1 + snprintf(cmdline_buf, COMMAND_LINE_SIZE, "%s",
+                loaderparams.kernel_cmdline));
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, ret);
+    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, (const char *)cmdline_buf);
+}
+
 static void main_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -198,6 +268,9 @@ static void network_init(PCIBus *pci_bus)
 static void ls3a5000_virt_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
+    const char *kernel_filename = machine->kernel_filename;
+    const char *kernel_cmdline = machine->kernel_cmdline;
+    const char *initrd_filename = machine->initrd_filename;
     LoongArchCPU *cpu;
     CPULoongArchState *env;
     uint64_t highram_size = 0;
@@ -291,6 +364,14 @@ static void ls3a5000_virt_init(MachineState *machine)
         exit(1);
     }
 
+    if (kernel_filename) {
+        loaderparams.ram_size = ram_size;
+        loaderparams.kernel_filename = kernel_filename;
+        loaderparams.kernel_cmdline = kernel_cmdline;
+        loaderparams.initrd_filename = initrd_filename;
+        fw_cfg_add_kernel_info(lams->fw_cfg);
+    }
+
     memory_region_init_ram(bios, NULL, "loongarch.bios",
                            LA_BIOS_SIZE, &error_fatal);
     memory_region_set_readonly(bios, true);
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 2eb43e1263..dc7617ab64 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -37,6 +37,11 @@
 #define LA_BIOS_BASE            0x1c000000
 #define LA_BIOS_SIZE            (4 * 1024 * 1024)
 
+/* Kernels can be configured with 64KB pages */
+#define INITRD_PAGE_SIZE        (64 * KiB)
+#define INITRD_BASE             0x04000000
+#define COMMAND_LINE_SIZE       4096
+
 typedef struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
-- 
2.27.0


