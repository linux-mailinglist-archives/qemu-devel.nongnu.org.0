Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E24684D2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:35:41 +0100 (CET)
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUGS-0001F1-56
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:35:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTw5-00005s-KJ
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:37 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59558 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTw3-00007I-63
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:37 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S27; 
 Sat, 04 Dec 2021 20:07:43 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 25/27] hw/loongarch: Add -kernel and -initrd options
 support
Date: Sat,  4 Dec 2021 20:07:23 +0800
Message-Id: <1638619645-11283-26-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S27
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8CFWrtrWUtw4ktw1rCrg_yoWrAF45pF
 Zxur1DGr4rAryfAw1IvF95uryrAw4DGF1aga43Zr4Fva9Fgr1UZw18WF12vFWDKan5WF90
 qrs8CrW29a4DJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/loongson3.c         | 79 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  5 ++
 2 files changed, 84 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index bc3c1920ef..677d61c262 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -30,6 +30,75 @@
 
 #define LOONGSON3_BIOSNAME "loongarch_bios.bin"
 
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
 
 static void loongarch_cpu_reset(void *opaque)
 {
@@ -200,6 +269,9 @@ static void network_init(PCIBus *pci_bus)
 static void loongson3_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
+    const char *kernel_filename = machine->kernel_filename;
+    const char *kernel_cmdline = machine->kernel_cmdline;
+    const char *initrd_filename = machine->initrd_filename;
     LoongArchCPU *cpu;
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
@@ -278,6 +350,13 @@ static void loongson3_init(MachineState *machine)
         exit(1);
     }
 
+    if (kernel_filename) {
+        loaderparams.ram_size = ram_size;
+        loaderparams.kernel_filename = kernel_filename;
+        loaderparams.kernel_cmdline = kernel_cmdline;
+        loaderparams.initrd_filename = initrd_filename;
+        fw_cfg_add_kernel_info(lams->fw_cfg);
+    }
 
     memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
                            LA_BIOS_SIZE, &error_fatal);
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index aab8097f7d..fd09d987b2 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -36,6 +36,11 @@
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


