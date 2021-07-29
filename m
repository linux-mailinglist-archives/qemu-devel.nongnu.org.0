Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128293D9A9D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:54:28 +0200 (CEST)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uJf-0004Ua-0k
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCS-0003y4-9G
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCQ-0002Q3-Hv
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:00 -0400
Received: by mail-pl1-x629.google.com with SMTP id f13so4893018plj.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SVn6feIQx+0Ew2ry6c3LKcwRGxaKfiCe+3GLQs/DO0=;
 b=tcCKdAi25mDJZANb8iM5EMuZfgC63vc65PWVHy6dDhCdUcaW5V5Xp1gNCREejml6NN
 /Hkmf3gDdgID6WOL8afhaXSfzS0P1drmf2Lh/1Laf+lra+SjaWbQdXnEU9G0prA6J/1v
 JuMMy8NdVrf6EFVPbqC/aM9tHnXwprn0GFTR1f9LIjdcMsiUrQPh8gz7uvFLSQY34YCT
 PdFxxMBLxCXKLPEw+iCRjJNZhuKlqPmiqDxbijojXUc/M64yP91BLLCv/bqPXBK/wEN6
 6/42419qYdaQh3Pdd8MDVV9E3GY5jY83+dzvWKlnPLLzd1XVGZNKHmg2yAs9wDQeW6Js
 24WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SVn6feIQx+0Ew2ry6c3LKcwRGxaKfiCe+3GLQs/DO0=;
 b=lRYWb7qvLt+HwW0C9It/jnNiSxXD54KQrkQe+5cWOaiCdZ0eaqEUHuoHvsrF3xoY1G
 b4Zw+LihdfDU0PXEP7CyObBAOQ/Oiu2l3erR7sTG8oeuP+24YuxB53OAencyt2qO2ein
 M4028reyGfi0qlnAal2cWm2Mc2dap/VKqmy2bitout4pQeGtTIbH2cej3rgaZDRwLH5y
 3rpJ0f0v2FWqqwNbhn/erGGg8cLnSXx6T0Ewevv7zXhHsaxZNC9iW/OcV2Xhinx6RzZA
 Qtbc6387xYqOi+7qQjLN5NeQGfZYKAqI4+NCDdy+82fTwdvHjTJaB3C3QIKs9+jYeFmc
 krWg==
X-Gm-Message-State: AOAM533P1lv9SybCpjn6F9jPhFHQl30zSx20MRYjlVEX6lqSSVcpmVKV
 ChEuYvUdjeFy+W5DF8etbBLFhupRQuohlA==
X-Google-Smtp-Source: ABdhPJwayyak/CB1xZlaFPtO0Y8fSzLNr4ILL9LNvMuwik9TnxBZYfotsXC5090+yimQM9KleCx+CQ==
X-Received: by 2002:a63:1e59:: with SMTP id p25mr1468393pgm.110.1627519617374; 
 Wed, 28 Jul 2021 17:46:57 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/43] target/mips: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:10 -1000
Message-Id: <20210729004647.282017-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/cpu_loop.c        | 20 ++++++++++++++++----
 target/mips/cpu.c                 |  2 +-
 target/mips/tcg/op_helper.c       |  3 +--
 target/mips/tcg/user/tlb_helper.c | 23 +++++++++++------------
 4 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e..51f4eb65a6 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -158,12 +158,24 @@ done_syscall:
             break;
         case EXCP_TLBL:
         case EXCP_TLBS:
-        case EXCP_AdEL:
-        case EXCP_AdES:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
+            info.si_code = (env->error_code & EXCP_TLB_NOMATCH
+                            ? TARGET_SEGV_MAPERR : TARGET_SEGV_ACCERR);
+            info._sifields._sigfault._addr = env->CP0_BadVAddr;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
+        case EXCP_AdEL:
+        case EXCP_AdES:
+            /*
+             * Note that on real hw AdE is also raised for access to a
+             * kernel address from user mode instead of a TLB error.
+             * For simplicity, we do not distinguish this in the user
+             * version of mips_cpu_tlb_fill so only unaligned comes here.
+             */
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
             info._sifields._sigfault._addr = env->CP0_BadVAddr;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d426918291..a1658af910 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -541,11 +541,11 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .tlb_fill = mips_cpu_tlb_fill,
+    .do_unaligned_access = mips_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
-    .do_unaligned_access = mips_cpu_do_unaligned_access,
     .io_recompile_replay_branch = mips_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index fafbf1faca..0b874823e4 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -375,8 +375,6 @@ void helper_pmon(CPUMIPSState *env, int function)
     }
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                   MMUAccessType access_type,
                                   int mmu_idx, uintptr_t retaddr)
@@ -402,6 +400,7 @@ void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     do_raise_exception_err(env, excp, error_code, retaddr);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
                                     MMUAccessType access_type,
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index b835144b82..61a99356e9 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -26,24 +26,23 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
                                 MMUAccessType access_type)
 {
     CPUState *cs = env_cpu(env);
+    int error_code = 0;
+    int flags;
 
-    env->error_code = 0;
     if (access_type == MMU_INST_FETCH) {
-        env->error_code |= EXCP_INST_NOTAVAIL;
+        error_code |= EXCP_INST_NOTAVAIL;
     }
 
-    /* Reference to kernel address from user mode or supervisor mode */
-    /* Reference to supervisor address from user mode */
-    if (access_type == MMU_DATA_STORE) {
-        cs->exception_index = EXCP_AdES;
-    } else {
-        cs->exception_index = EXCP_AdEL;
+    flags = page_get_flags(address);
+    if (!(flags & PAGE_VALID)) {
+        error_code |= EXCP_TLB_NOMATCH;
     }
 
-    /* Raise exception */
-    if (!(env->hflags & MIPS_HFLAG_DM)) {
-        env->CP0_BadVAddr = address;
-    }
+    cs->exception_index = (access_type == MMU_DATA_STORE
+                           ? EXCP_TLBS : EXCP_TLBL);
+
+    env->error_code = error_code;
+    env->CP0_BadVAddr = address;
 }
 
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.25.1


