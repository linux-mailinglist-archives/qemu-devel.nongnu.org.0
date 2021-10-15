Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38AA42E7DF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:28:27 +0200 (CEST)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEpW-0001lS-Vp
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYu-0007GO-WD
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYs-0000Jd-Rb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id k26so7298806pfi.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0FpA57qaJCc2VnO4R+7jKC7WxQwlNYWwLwncqceS+8=;
 b=MJNpwSV+rzbgBC2STQO6Glp4RW0EK4sXF1uS1Bfrnn3wCJqHDiQCV04MTtIYhc4rum
 ZbFXpwotAFVWnCXyZjZBTDZE1c+oxKLckfKHjWpN1GA1/tQr/C3gCJDferz4fUKJFMI0
 KMwoYQU4H54JRIvBBz4Rem+FT9BlB4p+MDFPunhzt4SnriMTjUq5hT8PnDoH1a8QZ3Hi
 cCCBdlB7Fbj24gBD6FR9giPjO9S/a3MUMm3SdSRbpQa+iSQAwA/RF+oQT16Kexx6x3Ap
 lJ0x7CCYUBfDoLOQUbFhohn7d4GDsM1+NOx8amPwQrubsm9fSdL8xSRtRckEkMkOXcRI
 +zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0FpA57qaJCc2VnO4R+7jKC7WxQwlNYWwLwncqceS+8=;
 b=6NX3P1OQS5VmWn2XmNa6Q+S7vXVlF6+MtfyFSXAydVnkoZ61Ivp3tUb9dc+K9Rxjmw
 F1YrK/7fYJ7b+Cog6KHSJajvhpkvH6Za9aTs6DkWD76HExdejzlGm5zJ43Cwba/kcoes
 Et0bL3JqOFLW2eSU27RL2H4Zoj6EiaWiX0pCdNdRralGxaC5YBAPb0IDSK945uPlXr8P
 bdPzKArprfjWdAYH7MTVuesfHtWFNOwo5D7/vdRyezZDsX17doQaFNrSHcr7Rt3T2ZGb
 4q6kPtE9wow6sMg1NcnF/1LgYhZFSUZ+KF6yD3KrM1ILTHi1uKLGMUWiuM4VjinMkuj+
 UnPg==
X-Gm-Message-State: AOAM531cCQSVbjVDjeCWoQ1o5DfzNRyYTtNIXzTOtRsBRf8L7wncbSdV
 zWPK91Ax3PxYF7WI9pOBo/8gPf24GIgfRw==
X-Google-Smtp-Source: ABdhPJyENV9gkgEB1Zlyh4hvXuUoKMynD59xG8x1GvgXgSpRKpHFrR7mDNzCvx46kad1iyDvaEu3FQ==
X-Received: by 2002:a63:454e:: with SMTP id u14mr7311465pgk.314.1634271072929; 
 Thu, 14 Oct 2021 21:11:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/67] target/alpha: Implement alpha_cpu_record_sigsegv
Date: Thu, 14 Oct 2021 21:10:07 -0700
Message-Id: <20211015041053.2769193-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record trap_arg{0,1,2} for the linux-user signal frame.

Fill in the stores to trap_arg{1,2} that were missing
from the previous user-only alpha_cpu_tlb_fill function.
Use maperr to simplify computation of trap_arg1.

Remove the code for EXCP_MMFAULT from cpu_loop, as
that part is now handled by cpu_loop_exit_sigsegv.

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


