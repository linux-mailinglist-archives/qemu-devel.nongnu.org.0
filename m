Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157805A9042
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:27:26 +0200 (CEST)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTebk-0004je-R2
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe47-0005v2-8Z
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe45-0003G2-IF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w5so4831549wrn.12
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rGKQMWIS6WhWNLXWFYWI0ihkVZKbHQO46kskGqp/pqA=;
 b=Ibe6ZANuzxo8Jk7qHu7vHX1KnS82e4XnpZoCNcmk1t+0AkDmLcBhNgkra8NVfx7Nfy
 /2OxVyshCbxuZHe1qtTpjzK8z8SpvsuSSpU/shaR9VIr6qaJxqjTGl/aVc8E+bE6XSzO
 TLNjf+bfRr9yo7H9ZLR+JvT7eVLYtlEP2K3mZjiLuLK7g29jft1d6disECY26yhciQTg
 BQefxM0tHPAYZ3P9uau1oFawwWwuipdN57KJC+a9YHTVLTvg8k7ioujPsqkCHT5buXut
 1rxm0IRCDFfHp50K0o5yQI2mp9ZOJ9Yd2JLZqNGq12w7vhgPjSSl3FV02ka9yMzJbhVx
 4/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rGKQMWIS6WhWNLXWFYWI0ihkVZKbHQO46kskGqp/pqA=;
 b=ex9oGaXWWYPEE6C0fBeIgXHRhBdyLpe9R+UfAKp+ZP6l/htfhVkgeLvrF1VLefhgKh
 tqE62agEaX4QQr1au+Byi2ohn+ho5IviUyrvU2p6rY9eBApI1nWeTdVRR3YYH0gbkdV6
 PsBVt3xcO29sb9G+iyRAOPVGode7kLQy7REwphF1Yqof91/LhEcChtdqJ6ESCQrRrmYY
 EzDfWHcvvFoZSdTj3VTKKwtZjmkO78JP8JWhl/C17E6NEIyUpz9Z6Wd4ju1//K5tuqRK
 sY5iWhCu+InDPn2vvgKYJzYpDzsZleQZBHaS0JRF7d6c/8l0tQAe0239KrSGbkoLxEsQ
 pdjA==
X-Gm-Message-State: ACgBeo1K8G2qFa6U5WsFJa/wHptFdJ1np4UjxwSpPXTXBiW1t5JfQZGp
 LFL5r2UKhUlWpxcMiyPC7GBuScTrpaP/Rfpr
X-Google-Smtp-Source: AA6agR5ojxA9I7xXLO2Z9FwkIt+oNCPM79MFq45uCS8e6zNrTwZPVowb+l1s1OU2+qO3fqqfORQjaQ==
X-Received: by 2002:a5d:69c4:0:b0:226:dde6:a1d7 with SMTP id
 s4-20020a5d69c4000000b00226dde6a1d7mr9231177wrw.618.1662015156810; 
 Wed, 31 Aug 2022 23:52:36 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 04/20] linux-user: Honor PT_GNU_STACK
Date: Thu,  1 Sep 2022 07:51:53 +0100
Message-Id: <20220901065210.117081-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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


