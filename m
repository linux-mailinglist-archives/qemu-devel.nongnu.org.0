Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B570441962
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:04:49 +0100 (CET)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUBM-0005t5-Dj
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzl-0005uW-Jr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50842 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTzh-0008Dk-05
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:49 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S22; 
 Mon, 01 Nov 2021 17:52:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 20/29] linux-user: Add LoongArch elf support
Date: Mon,  1 Nov 2021 17:51:42 +0800
Message-Id: <1635760311-20015-21-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S22
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUGr1xKr47uF15Kr45Jrb_yoW5CrWxpF
 WUCay5Gr4rtFZxKw1fta4UWF15Zw18ur17C34xWFWrAwsxJ348Wr1kKrWqyFy3Za9Ygayj
 vF90yw4jkr47XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 include/elf.h                       |  2 ++
 linux-user/elfload.c                | 58 +++++++++++++++++++++++++++++++++++++
 linux-user/loongarch64/target_elf.h | 14 +++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 linux-user/loongarch64/target_elf.h

diff --git a/include/elf.h b/include/elf.h
index 811bf4a..3a4bcb6 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -182,6 +182,8 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
 
+#define EM_LOONGARCH    258     /* LoongArch */
+
 /*
  * This is an interim value that we will use until the committee comes
  * up with a final number.
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f9b8261..b703300 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -914,6 +914,64 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 
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
+    regs->csr_crmd = 2 << 3;
+    regs->csr_era = infop->entry;
+    regs->regs[3] = infop->start_stack;
+}
+
+/* See linux kernel: arch/loongarch/include/asm/elf.h.  */
+#define ELF_NREG 45
+typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
+
+/* See linux kernel: arch/loongarch/include/asm/reg.h.  */
+enum {
+    TARGET_EF_R0 = 0,
+    TARGET_EF_CSR_ERA = TARGET_EF_R0 + 32,
+    TARGET_EF_CSR_BADVADDR = TARGET_EF_R0 + 33,
+};
+
+/* See linux kernel: arch/loongarch/kernel/process.c:loongarch_dump_regs64. */
+static void elf_core_copy_regs(target_elf_gregset_t *regs,
+                               const CPULoongArchState *env)
+{
+    int i;
+
+    for (i = 0; i < TARGET_EF_R0; i++) {
+        (*regs)[i] = 0;
+    }
+    (*regs)[TARGET_EF_R0] = 0;
+
+    for (i = 1; i < ARRAY_SIZE(env->gpr); i++) {
+        (*regs)[TARGET_EF_R0 + i] = tswapreg(env->gpr[i]);
+    }
+
+    (*regs)[TARGET_EF_CSR_ERA] = tswapreg(env->pc);
+    (*regs)[TARGET_EF_CSR_BADVADDR] = tswapreg(env->badaddr);
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
index 0000000..7c88394
--- /dev/null
+++ b/linux-user/loongarch64/target_elf.h
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+
+#ifndef LOONGARCH_TARGET_ELF_H
+#define LOONGARCH_TARGET_ELF_H
+static inline const char *cpu_get_model(uint32_t eflags)
+{
+    return "Loongson-3A5000";
+}
+#endif
-- 
1.8.3.1


