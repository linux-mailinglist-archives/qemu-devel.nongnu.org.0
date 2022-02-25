Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456F4C4136
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:22:26 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWnx-0004l8-Cy
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:22:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nNVhg-0003u8-9D
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:11:52 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44660 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nNVha-0004gi-V1
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:11:51 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMg8jRhiw9UGAA--.8228S27; 
 Fri, 25 Feb 2022 16:03:23 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 25/29] hw/loongarch: Add -kernel and -initrd options
 support
Date: Fri, 25 Feb 2022 03:03:04 -0500
Message-Id: <20220225080308.1405-26-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
References: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxqMg8jRhiw9UGAA--.8228S27
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8Cw47GF13uFyUZF4xWFg_yoWrCF1xpr
 Zxur1DGr4rAF93Aw12vas5uryrAw4DGF1agasxZr4FkFsFgr1UZw18Wr12vFWDKa95WF90
 qrs8GrW29a4DJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongson3.c         | 81 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  5 ++
 2 files changed, 86 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 2795fcc895..9533057110 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -89,6 +89,76 @@ static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
+static struct _loaderparams {
+    unsigned long ram_size;
+    const char *kernel_filename;
+    const char *kernel_cmdline;
+    const char *initrd_filename;
+} loaderparams;
+
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
+                                    initrd_offset,
+                                    loaderparams.ram_size - initrd_offset);
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
 static void loongarch_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -325,6 +395,9 @@ static void loongarch_irq_init(LoongArchMachineState *lams,
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
+    const char *kernel_filename = machine->kernel_filename;
+    const char *kernel_cmdline = machine->kernel_cmdline;
+    const char *initrd_filename = machine->initrd_filename;
     LoongArchCPU *la_cpu;
     ipi = create_ipi();
     extioi = create_extioi();
@@ -391,6 +464,14 @@ static void loongarch_init(MachineState *machine)
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
     memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
                            LA_BIOS_SIZE, &error_fatal);
     memory_region_set_readonly(&lams->bios, true);
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 44afb06b37..adb1ecd042 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -41,6 +41,11 @@
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


