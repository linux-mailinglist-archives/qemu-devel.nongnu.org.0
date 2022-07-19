Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65A57A67D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:28:01 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrwu-0000VP-OV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXG-0007nd-2A
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:30 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:36711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXE-0006IE-9b
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:29 -0400
Received: by mail-oi1-x22b.google.com with SMTP id u76so7654651oie.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CZtJq2cOHsEhwE1myZsQ1EykEr8ENQn5x2LnILPdsmQ=;
 b=TgxillV0s7QskDTd++oBwv88y7pLmiwyKGrAPGMy7UIHdwNnH4saHUqc1bTnqLnJSB
 6qrw7YtFNC1IvPg1cOoxLs5XLHP8RRleVNooXmeHjqjHCPST6ENd5l8NgbUwNszngF9Y
 YY+HvkJIChRmWYp0vVn+GHC+Rz+BHHFwzqc0Eeh89Rvky0AS82YKnrSbjQQD+oRKnNr6
 i06/Jd2zxl+3sN9yVSiJ9Y+QgXFe6MYNE6V8ClT1NXugxvNAqpFQ1AVmSrCmDi2Xn+Kp
 K9b/W/4OUX0I0bcNFmuWCPRNCyrNTXY34ltx7Z7OYqsJg1l7TnmbZm3fG5JfJkvYMnVl
 Eewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CZtJq2cOHsEhwE1myZsQ1EykEr8ENQn5x2LnILPdsmQ=;
 b=EMV4Nj4mrADYY39shUjvNEOAs//hkF5YONpX3JBz77lgnLqo/YrH/95DXzsOhFPT5z
 082Sn2iAT7sLFSxNS6ShhQQKgA3mDZYu8aMVS3j425sj7Ixj7vmy7+ynf6YllWPZpIPH
 TV57BBHidu8NtpQfYXIj+yAjAINXT4qtfn2j9rM6hELo3VgF+no1ED13LGEBJiE5bHdZ
 AAWU69shrOJwvM4hnzZ5zotfxWn0GfTYzVcPSp4wvXoCleu/KF9Z7Tkta9gknt/NFDai
 NCEdvV3UuRf4/awXMjzbnqZghTUwfiIsdC5pgzVQMYB1aEJZwyBXW4CeYRkax9Ialp2C
 6IyA==
X-Gm-Message-State: AJIora87iEMIrFMOp/WQfEBR5lTrZrJuonYle3/fMthEJgvzEEsEAXEY
 pQSkYlg/a0RuAnOHx3UGVy7f1G9M3/eB+I/w
X-Google-Smtp-Source: AGRyM1t+nKi8FF9Xy6CZnIKoGXf4zzaZw7Ea5Kdu3pEcqNLz2YQNyn1B1BdIhPZ+ZK1oaKcw68VslA==
X-Received: by 2002:a05:6808:1709:b0:335:19b5:dfda with SMTP id
 bc9-20020a056808170900b0033519b5dfdamr316044oib.59.1658253686996; 
 Tue, 19 Jul 2022 11:01:26 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 18/21] hw/loongarch: Add linux kernel booting support
Date: Tue, 19 Jul 2022 23:29:57 +0530
Message-Id: <20220719180000.378186-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

There are two situations to start system by kernel file. If exists bios
option, system will boot from loaded bios file, else system will boot
from hardcoded auxcode, and jump to kernel elf entry.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220712083206.4187715-4-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/loongson3.c | 114 +++++++++++++++++++++++++++++++++------
 1 file changed, 99 insertions(+), 15 deletions(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 3f1849b8b0..88e38ce17e 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -103,6 +103,8 @@ static const MemoryRegionOps loongarch_virt_pm_ops = {
 static struct _loaderparams {
     uint64_t ram_size;
     const char *kernel_filename;
+    const char *kernel_cmdline;
+    const char *initrd_filename;
 } loaderparams;
 
 static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
@@ -352,18 +354,97 @@ static void reset_load_elf(void *opaque)
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
+        }
+    }
+}
+
 static void loongarch_init(MachineState *machine)
 {
+    LoongArchCPU *lacpu;
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
@@ -412,20 +493,23 @@ static void loongarch_init(MachineState *machine)
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
+    /* register reset function */
+    for (i = 0; i < machine->smp.cpus; i++) {
+        lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
+        qemu_register_reset(reset_load_elf, lacpu);
+    }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
 }
-- 
2.34.1


