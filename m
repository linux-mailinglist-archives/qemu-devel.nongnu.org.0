Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260B3DE4FB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:18:25 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlsm-0002oG-8J
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpR-0002cd-1x
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:57 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpP-00023m-D2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:56 -0400
Received: by mail-pl1-x631.google.com with SMTP id z3so20825180plg.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SVn6feIQx+0Ew2ry6c3LKcwRGxaKfiCe+3GLQs/DO0=;
 b=MoQ5As+5V9JG1RGwSoXHFprc0PcnLgo38bogMi+y4DWvh3W0Ma1hEXtNL7tjHvAImw
 JmYjenY33OPWkCfs+DH3KQarGlz6BRahIMa38X6NvUf8OnbFRM0ttX/Ep1f9PATMR5xc
 WQ442BDqxdL0ytrEHcht9Poag8uKkNv+EcCNtvaQzNNusUxfD9rPu5BcO+8MlQ9t+QaC
 Orl3FJiyNhvOOI9yA11A9CzmTJaXDbpn+7j60dnmX/hKBhNaXmHmNlGbkIFRArUTWw/3
 6q3PyNDw/Wleei+O62a7mJ+esnMeb7qB7VbELmq0TlLA0XM329lxWSuUpH5xnDaxjvRH
 J8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SVn6feIQx+0Ew2ry6c3LKcwRGxaKfiCe+3GLQs/DO0=;
 b=CE4SCl/jjc7gPTgZcXptOGYi1X8XW6myL5kIB90Yo5WWbk1VPaZ/Ema5Hi0mBh4gSM
 bc8D1RtD2AJY6KZrGEjr3eYjSK3immPZRWklRGjcEYOdzdcHNWXYsmwDEZkw+DzUgTnX
 LSsVm1UwhGRpPqoIXL9P0aNROi0yWwOtQ9jbbuDVKJmtZVRvqRvgTVu2sSA8hNZuTaVY
 SpV5apbiOjDVXI60eOy/zP7rHqV+Y7KNy3fTqt+SKpIk3bm87oyOsaZsk9ejpj/DnGF6
 JfdBLu7dHMWvKTEtiGIwBzQNCOpMCzexyJ1HKY2zEZVoGgYtXSvW7eZ7OoSFUDGcud5t
 zbew==
X-Gm-Message-State: AOAM531Jpqk5VJ6BjiHNu/9rXS17/aaPfM8CZczUA9KowRLuVXqxk2dY
 NK3SRR4k3wbqyLlaw0SJ45FSc2EBqE0eow==
X-Google-Smtp-Source: ABdhPJwReAlyRNWzna0ka77SWQLqn626+pgwsJoLTOgI1TnqVV5IQ2VwSa8TnTT4pp5rhZBvHAc5JA==
X-Received: by 2002:a17:90a:1d44:: with SMTP id
 u4mr2331438pju.119.1627964094170; 
 Mon, 02 Aug 2021 21:14:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/55] target/mips: Implement do_unaligned_access for
 user-only
Date: Mon,  2 Aug 2021 18:13:55 -1000
Message-Id: <20210803041443.55452-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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


