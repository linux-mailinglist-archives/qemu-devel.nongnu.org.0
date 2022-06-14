Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6ED54AD1F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:20:30 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12ir-0006bP-Et
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o12Uq-0005vW-5T
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:06:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57928 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o12Un-0002qp-Dl
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:05:59 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_09gT6hixdVAAA--.2805S5;
 Tue, 14 Jun 2022 17:05:54 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v16 3/9] linux-user: Add LoongArch elf support
Date: Tue, 14 Jun 2022 17:05:30 +0800
Message-Id: <20220614090536.1103616-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220614090536.1103616-1-gaosong@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_09gT6hixdVAAA--.2805S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUGr45JryDCF1fGrWrAFb_yoW5GF4rpF
 45Cay5Gr4rtFZxKwn3Ka4UCF15XF48ZF17C34xWFWrC39xJ348WF1kKrWqyFy5Za4kKFWj
 9F90yw1jkr43XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c                | 54 +++++++++++++++++++++++++++++
 linux-user/loongarch64/target_elf.h | 12 +++++++
 2 files changed, 66 insertions(+)
 create mode 100644 linux-user/loongarch64/target_elf.h

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f7eae357f4..01692110c4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -918,6 +918,60 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 
 #endif
 
+#ifdef TARGET_LOONGARCH64
+
+#define ELF_START_MMAP 0x80000000
+
+#define ELF_CLASS   ELFCLASS64
+#define ELF_ARCH    EM_LOONGARCH
+
+#define elf_check_arch(x) ((x) == EM_LOONGARCH)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
+{
+    /*Set crmd PG,DA = 1,0 */
+    regs->csr.crmd = 2 << 3;
+    regs->csr.era = infop->entry;
+    regs->regs[3] = infop->start_stack;
+}
+
+/* See linux kernel: arch/loongarch/include/asm/elf.h.  */
+#define ELF_NREG 45
+typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
+
+enum {
+    TARGET_EF_R0 = 0,
+    TARGET_EF_CSR_ERA = TARGET_EF_R0 + 33,
+    TARGET_EF_CSR_BADV = TARGET_EF_R0 + 34,
+};
+
+static void elf_core_copy_regs(target_elf_gregset_t *regs,
+                               const CPULoongArchState *env)
+{
+    int i;
+
+    (*regs)[TARGET_EF_R0] = 0;
+
+    for (i = 1; i < ARRAY_SIZE(env->gpr); i++) {
+        (*regs)[TARGET_EF_R0 + i] = tswapreg(env->gpr[i]);
+    }
+
+    (*regs)[TARGET_EF_CSR_ERA] = tswapreg(env->pc);
+    (*regs)[TARGET_EF_CSR_BADV] = tswapreg(env->badaddr);
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE        4096
+
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+    return 0;
+}
+
+#endif /* TARGET_LOONGARCH64 */
+
 #ifdef TARGET_MIPS
 
 #define ELF_START_MMAP 0x80000000
diff --git a/linux-user/loongarch64/target_elf.h b/linux-user/loongarch64/target_elf.h
new file mode 100644
index 0000000000..95c3f05a46
--- /dev/null
+++ b/linux-user/loongarch64/target_elf.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_ELF_H
+#define LOONGARCH_TARGET_ELF_H
+static inline const char *cpu_get_model(uint32_t eflags)
+{
+    return "la464";
+}
+#endif
-- 
2.31.1


