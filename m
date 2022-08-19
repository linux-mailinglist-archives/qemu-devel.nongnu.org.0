Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7427B599374
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:33:09 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsku-00048T-BD
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseP-0001X0-4l
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:25 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseN-0002jU-Ac
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:24 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c24so2753705pgg.11
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2RHGm7LozmE44p/cezu4EoeuBcKQ/o8z7dbp9Itr8eo=;
 b=obw0taht7rQIILQ6eiZdR0FJa2kP3ahnUodJW1Q4cqKV1tlEjT+eFHixOBRaC77eyf
 6wkS1+lhND21YSWSF1viBbW7KvLvEXJPPBNysekqfOYf0JfP9lrpuRXtaIzfAhpzuM1c
 oN+6V3uH3EMcS7Jp/0VVBdYukI/mLhef1cQ1QbxaJNaDZh7LE0WEXIUyyfBJ6GbhjAJC
 nJIuvDcITv8wyrYpM4oNFFgnMdTl6cZqjQJ1FaxL0f4mZtJdx1st1fv9oh0s/IzE2p+d
 JjvdQon2435mc55bWe3nE3Kbev2q/Kj8t4TByAqa9SIIO+olgzz2iRo9U86sWCOY4CRt
 Mvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2RHGm7LozmE44p/cezu4EoeuBcKQ/o8z7dbp9Itr8eo=;
 b=rfpPNvJZDnZu+KuXI0e8T+aTTEskq2xyoKbIpyI2UBvgVcoegmuZf/0jg/GH9aXZxH
 vQRimTuXLmmMdZglntWfUC6904ytz12t1uNJkoRcb6+mTetOxbkLMrj2q3ALMBWYIRjo
 aXlXhPl3IGRHafJtPBGr4z/viSwAASrKE/Wbhj2vXv/EQOoQK26pidlAmSPM8FPzCw2K
 wTruONvlZT8WRMsMKmovHNpynAbPvjJgDiyrCjK4ZdIvY7suCwry/N9Qm73Aj1eI+NlK
 Qsjga7wG8ei7/rcpdh2rZYNlswKR0v92k/W7WBQ4Z2/koZa1W3GWBEfQr1HYXpJOaaoS
 8txw==
X-Gm-Message-State: ACgBeo0Z0g8Xs3XPxuP7IEpLip5hR1vLq0yDAGMHCmP9OF9ekZuAButW
 8oa6PmVFxGqnP/GGcEV8lt/op/Srs3qT2g==
X-Google-Smtp-Source: AA6agR4UstW4zlrdIpEvteVKqBwWlKJAIR6kFhfoaqzdWBU0xG4lcg6YzqdA6fo5Fyf6Rb8+mm5QUg==
X-Received: by 2002:a62:6347:0:b0:531:c5a7:b209 with SMTP id
 x68-20020a626347000000b00531c5a7b209mr5870535pfb.60.1660879581461; 
 Thu, 18 Aug 2022 20:26:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 04/21] linux-user: Honor PT_GNU_STACK
Date: Thu, 18 Aug 2022 20:25:58 -0700
Message-Id: <20220819032615.884847-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Map the stack executable if required by default or on demand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h        |  1 +
 linux-user/qemu.h    |  1 +
 linux-user/elfload.c | 19 ++++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/elf.h b/include/elf.h
index 3a4bcb646a..3d6b9062c0 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -31,6 +31,7 @@ typedef int64_t  Elf64_Sxword;
 #define PT_LOPROC  0x70000000
 #define PT_HIPROC  0x7fffffff
 
+#define PT_GNU_STACK      (PT_LOOS + 0x474e551)
 #define PT_GNU_PROPERTY   (PT_LOOS + 0x474e553)
 
 #define PT_MIPS_REGINFO   0x70000000
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 7d90de1b15..e2e93fbd1d 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -48,6 +48,7 @@ struct image_info {
         uint32_t        elf_flags;
         int             personality;
         abi_ulong       alignment;
+        bool            exec_stack;
 
         /* Generic semihosting knows about these pointers. */
         abi_ulong       arg_strings;   /* strings for argv */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b20d513929..90375c6b74 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -232,6 +232,7 @@ static bool init_guest_commpage(void)
 #define ELF_ARCH        EM_386
 
 #define ELF_PLATFORM get_elf_platform()
+#define EXSTACK_DEFAULT true
 
 static const char *get_elf_platform(void)
 {
@@ -308,6 +309,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 
 #define ELF_ARCH        EM_ARM
 #define ELF_CLASS       ELFCLASS32
+#define EXSTACK_DEFAULT true
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -776,6 +778,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #else
 
 #define ELF_CLASS       ELFCLASS32
+#define EXSTACK_DEFAULT true
 
 #endif
 
@@ -973,6 +976,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 
 #define ELF_CLASS   ELFCLASS64
 #define ELF_ARCH    EM_LOONGARCH
+#define EXSTACK_DEFAULT true
 
 #define elf_check_arch(x) ((x) == EM_LOONGARCH)
 
@@ -1068,6 +1072,7 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_CLASS   ELFCLASS32
 #endif
 #define ELF_ARCH    EM_MIPS
+#define EXSTACK_DEFAULT true
 
 #ifdef TARGET_ABI_MIPSN32
 #define elf_check_abi(x) ((x) & EF_MIPS_ABI2)
@@ -1806,6 +1811,10 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define bswaptls(ptr) bswap32s(ptr)
 #endif
 
+#ifndef EXSTACK_DEFAULT
+#define EXSTACK_DEFAULT false
+#endif
+
 #include "elf.h"
 
 /* We must delay the following stanzas until after "elf.h". */
@@ -2081,6 +2090,7 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
                                  struct image_info *info)
 {
     abi_ulong size, error, guard;
+    int prot;
 
     size = guest_stack_size;
     if (size < STACK_LOWER_LIMIT) {
@@ -2091,7 +2101,11 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
         guard = qemu_real_host_page_size();
     }
 
-    error = target_mmap(0, size + guard, PROT_READ | PROT_WRITE,
+    prot = PROT_READ | PROT_WRITE;
+    if (info->exec_stack) {
+        prot |= PROT_EXEC;
+    }
+    error = target_mmap(0, size + guard, prot,
                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
     if (error == -1) {
         perror("mmap stack");
@@ -2921,6 +2935,7 @@ static void load_elf_image(const char *image_name, int image_fd,
      */
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
+    info->exec_stack = EXSTACK_DEFAULT;
     for (i = 0; i < ehdr->e_phnum; ++i) {
         struct elf_phdr *eppnt = phdr + i;
         if (eppnt->p_type == PT_LOAD) {
@@ -2963,6 +2978,8 @@ static void load_elf_image(const char *image_name, int image_fd,
             if (!parse_elf_properties(image_fd, info, eppnt, bprm_buf, &err)) {
                 goto exit_errmsg;
             }
+        } else if (eppnt->p_type == PT_GNU_STACK) {
+            info->exec_stack = eppnt->p_flags & PF_X;
         }
     }
 
-- 
2.34.1


