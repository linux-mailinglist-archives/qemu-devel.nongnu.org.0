Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A823442C90
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:30:37 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrzw-0003LA-Ge
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0003pA-HS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:11 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0000v2-IL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: by mail-qt1-x836.google.com with SMTP id h4so17862384qth.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AEaCX227BZE+QCVidN+9WkHpAoM/8sOPsRQn51mlr6o=;
 b=WvXhDJWnJVF4K6aZgPWES/CZO3QZ8CXgtc/S+xSycLa3aoVvwXlrDtqdXXeARFVe9A
 9vklVeOPmC/SxEQGP69NladvRtlsEI93fxWFhmWNdh276NCqJriDHlYf4OrjV8XeSVjy
 tDNsHU65Dfjn3EkUKhclg8vF+Kgx84l1oqRPL4fIOUq4P86JnrBJ3FTgyYgMiZnKUYxd
 Dy+BmdAmJ7b+QtWw+/ynvhXcn3wXG93p+TztJGVXdeW98Vau1lP5fZgDydY5Jpnp7otf
 YiIvY2WICop7wSH/q2RAKxAuqZ5sGzvUzFEdofgzHzEQTzkSE/rVMhBa+kSqEsjMKnVw
 pSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AEaCX227BZE+QCVidN+9WkHpAoM/8sOPsRQn51mlr6o=;
 b=c7aHHLNYLifJM+wD+QMzGOet1ZU/eGGeCmM/fc4Kpk+HUuK4TAsOvYhkKapPFp01oi
 5nd3XUsCP4eNriK6dJW7HnM7dxF2+LqOjd8BP8MukQyCPGwkkINyYkJhagjfOOHTJqb5
 JQrVCe4uPkp15mNb3LavCKMUaIZOnNYBar1o6tVc0UlXjjPnC6bauI90YQzCscZzNnfl
 oGpYAKwaCUrWSWEQB1mNXZDKdE3ts2ZMtawafH1h+e0Lt4NQDmdoPW5SDwPvXJmHua+g
 MiWyqHB2JL/FGmnGV19XrYraeMJHUGp3ZT4r1K7xzuylE0pfSmNnoCYnzcz5CfxMaRfU
 huCQ==
X-Gm-Message-State: AOAM532JImxXN7cuFKHCH7uYjJu0J68+fWcff3VYNrdN7+gnyp5wl3Uf
 ACjO5XBK4xZRnfbKwkf/KSWtKJwsNfYnVQ==
X-Google-Smtp-Source: ABdhPJyJzxP8+Q34RDcENnAabP1X5R4JPlHWqimw6u5fnL0GzF/z18acaSdziClDEtAX4iL4Rv1XUw==
X-Received: by 2002:a05:622a:1904:: with SMTP id
 w4mr18073532qtc.257.1635851273874; 
 Tue, 02 Nov 2021 04:07:53 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/60] target/alpha: Implement alpha_cpu_record_sigsegv
Date: Tue,  2 Nov 2021 07:07:01 -0400
Message-Id: <20211102110740.215699-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record trap_arg{0,1,2} for the linux-user signal frame.

Fill in the stores to trap_arg{1,2} that were missing
from the previous user-only alpha_cpu_tlb_fill function.
Use maperr to simplify computation of trap_arg1.

Remove the code for EXCP_MMFAULT from cpu_loop, as
that part is now handled by cpu_loop_exit_sigsegv.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h          | 13 +++++++++----
 linux-user/alpha/cpu_loop.c |  8 --------
 target/alpha/cpu.c          |  6 ++++--
 target/alpha/helper.c       | 39 ++++++++++++++++++++++++++++++++-----
 4 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 772828cc26..d49cc36d07 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -439,9 +439,6 @@ void alpha_translate_init(void);
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(void);
-bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr);
 void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
 void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
 
@@ -449,7 +446,15 @@ uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);
 void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);
 uint64_t cpu_alpha_load_gr(CPUAlphaState *env, unsigned reg);
 void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val);
-#ifndef CONFIG_USER_ONLY
+
+#ifdef CONFIG_USER_ONLY
+void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr);
+#else
+bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr);
 void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 1b00a81385..4cc8e0a55c 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -54,14 +54,6 @@ void cpu_loop(CPUAlphaState *env)
             fprintf(stderr, "External interrupt. Exit\n");
             exit(EXIT_FAILURE);
             break;
-        case EXCP_MMFAULT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = (page_get_flags(env->trap_arg0) & PAGE_VALID
-                            ? TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR);
-            info._sifields._sigfault._addr = env->trap_arg0;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_UNALIGN:
             info.si_signo = TARGET_SIGBUS;
             info.si_errno = 0;
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb..69f32c3078 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,9 +218,11 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .tlb_fill = alpha_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = alpha_cpu_record_sigsegv,
+#else
+    .tlb_fill = alpha_cpu_tlb_fill,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 81550d9e2f..b7e7f73b15 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -120,15 +120,44 @@ void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val)
 }
 
 #if defined(CONFIG_USER_ONLY)
-bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
+void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
+    target_ulong mmcsr, cause;
 
-    cs->exception_index = EXCP_MMFAULT;
+    /* Assuming !maperr, infer the missing protection. */
+    switch (access_type) {
+    case MMU_DATA_LOAD:
+        mmcsr = MM_K_FOR;
+        cause = 0;
+        break;
+    case MMU_DATA_STORE:
+        mmcsr = MM_K_FOW;
+        cause = 1;
+        break;
+    case MMU_INST_FETCH:
+        mmcsr = MM_K_FOE;
+        cause = -1;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (maperr) {
+        if (address < BIT_ULL(TARGET_VIRT_ADDR_SPACE_BITS - 1)) {
+            /* Userspace address, therefore page not mapped. */
+            mmcsr = MM_K_TNV;
+        } else {
+            /* Kernel or invalid address. */
+            mmcsr = MM_K_ACV;
+        }
+    }
+
+    /* Record the arguments that PALcode would give to the kernel. */
     cpu->env.trap_arg0 = address;
-    cpu_loop_exit_restore(cs, retaddr);
+    cpu->env.trap_arg1 = mmcsr;
+    cpu->env.trap_arg2 = cause;
 }
 #else
 /* Returns the OSF/1 entMM failure indication, or -1 on success.  */
-- 
2.25.1


