Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFB5AE38E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:56:12 +0200 (CEST)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUNP-0003La-Ez
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6E-0002WO-W5
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6C-0005U8-7K
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id b5so14309385wrr.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yHZSJUz7LSiy8DsABftVDyRV2Yzcw9MuxBIikIfZ3SI=;
 b=niPafJe1OZQ+Pbfn1LJsWMtUbQqafVY95ERZATwVGXuyLPfeF77OvF0IMmaFsAl8xG
 AwsTtshkb70WtzYxhVcvxS4PJVsT4IAbYeoOJejOekOJGBEDLh7e600TkdnfrKCDF8oq
 pSXPUIgLLjEN28x7cqMXFq9hoEPyfA2CqKO0VfXEIKeEZbN8XrCHu49VzzwqQZYPSsix
 XcH56NnpqN1F5hCLVskfapXAURa1266ZxXiY2q6JnPFF6GVnldYNEiU4rMcqGR1BiBQU
 YIVXQy0MNTVtQASeyggKbkz2ED5u0ype31COfC/ADJolcP86fqmyjS0qG9hZdGa/aT1j
 KuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yHZSJUz7LSiy8DsABftVDyRV2Yzcw9MuxBIikIfZ3SI=;
 b=G0hxjy57G6UFSkTX6p2j7jNs3TN+Ndl9cZw4G6KKAA9G9BeZfLj3pKUa2Oi78qsAQM
 djwDg6/Ibk8xj4BytAEtgNK6F42MYSJKHktHHtu48lj4XcEEMieE8PuJ6OZuCYdqw/7R
 bjxbZp3JgLnJN9O5sAMreEsyAUA4s3jb2IWmQIZguIiI/fR4xSr/Xc0bL9gmUDm/jXdM
 1H9whFt8hUQKxvAmU0nVpdGoLhd1IR0HJTgJC3OW6/bLqeZF5AYGv5oh3HBjLN8FP2yQ
 0fjsABN7mi3z6UMgtXI3uPOU/1hVjvwJ4aHOMdCxLGaOVUjnOiWj78SwK1OQzdM5dScC
 RRDQ==
X-Gm-Message-State: ACgBeo0+oKt4yueMTXaYjpJbYG06h0FFwMgrKCjkB1+r691r0FZy7Dpn
 1aZbWyl0i7XWQZqx7iZhFlRMzosLelj9LUpE
X-Google-Smtp-Source: AA6agR5laHltbrpkmn3H952s6rJCTikx+Wfe6VZTKDt9wQwlIzz3djaXTcwmjWNI17U3MI8LWrL3/g==
X-Received: by 2002:adf:f543:0:b0:228:c692:127a with SMTP id
 j3-20020adff543000000b00228c692127amr3350438wrp.246.1662453502433; 
 Tue, 06 Sep 2022 01:38:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 04/20] linux-user: Honor PT_GNU_STACK
Date: Tue,  6 Sep 2022 09:37:59 +0100
Message-Id: <20220906083815.252478-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
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
index 82fecf9e5a..ba5c4c02e5 100644
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


