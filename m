Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7B38962C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:07:37 +0200 (CEST)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRXc-0002Y2-4R
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1h-0002o2-7x
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:37 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:46811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1e-0007Od-VV
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:36 -0400
Received: by mail-oi1-x235.google.com with SMTP id x15so13967791oic.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klTWXaUSPDXpDuYjtqmoOjms0PHU2tWWOTJOUfsWPG4=;
 b=g6tMDS5KMFejpwHK5Q5lFtH2qaJ8iBDdCKwRP0hoQ6hs4cUOGgHu2M9qGuN/0DF0xE
 lwg7z8jqQix7omXfaQr3OGfbIXlyRhqJEoiTBWyPHFDqC1T3uhCTXtwRoY2ZePJ7dH+t
 2BeMZ+1wfUJznLWzS5VCyb8kwNLEeingjN+lPoAiMSXlIJ635nLG2xDiQPIRdRPXTB8o
 kLTeEIKueUm9X0hEIOSzzwD5J5LLFBOtaJ/BhTFJir6a2y7k+602Nj+gI8GRZ8oRlB8h
 SHfwUDbQAZxl+24G74hmJFvtFETD/4rvfqKk7sHn/byLbV1CnZELZfof6JmWzHnoQuSf
 2v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klTWXaUSPDXpDuYjtqmoOjms0PHU2tWWOTJOUfsWPG4=;
 b=DzRlYQueJ22s3F1y+vYMaR/KcQtnN/NQ00kcF5sPmxOEns44r/50oq5ok8hwOK1QaB
 zPmIvjWCpHguoLcfDJpOdy2X5cSFlUsSRPz3Vmdn2hpBJkLNIuAxjghYtgeH7S5qW3qL
 bOJkmHvyXmFg5aQMOXSY8xQNEoyEk8NpT84q3pr9lmDo18Ajp38YJUC4ttcs6+L9h6jI
 /w3ZQ28pM1AIxr3Fr/XRcZqCqgG8/fM4lT9+QdLF3vnk+I1szNRcqsVjeC/slP8JIip6
 ny0gvHPKRcLebHQgUvDO5CqFTuo5uBSPbLINsM4l8H3sC5d69ELfOahwvWnHT1yNurKQ
 TCrA==
X-Gm-Message-State: AOAM532YiU8XR4pSzXb9M6zO9P2ZjgiN6If7USevkbLEGWM0lfM/NtZL
 YOkJtbapfE344owoed+XycjfiLAylLP9Fh8c
X-Google-Smtp-Source: ABdhPJybfPRFCXeawAQf6vkvjlzMsy7xNeO3z7DCgtRqG4tOe98Sy/xWgz5+f57+v4JkW1mCLEjxQg==
X-Received: by 2002:aca:5c04:: with SMTP id q4mr394929oib.11.1621449273688;
 Wed, 19 May 2021 11:34:33 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/50] target/i386: Move invlpg, hlt, monitor, mwait to sysemu
Date: Wed, 19 May 2021 13:30:41 -0500
Message-Id: <20210519183050.875453-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These instructions are all privileged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-42-richard.henderson@linaro.org>
---
 target/i386/helper.h                 |  8 ++--
 target/i386/tcg/helper-tcg.h         |  1 +
 target/i386/tcg/misc_helper.c        | 55 +---------------------------
 target/i386/tcg/sysemu/misc_helper.c | 53 +++++++++++++++++++++++++++
 target/i386/tcg/translate.c          |  4 ++
 5 files changed, 63 insertions(+), 58 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ebfaca66dd..ab72eba52a 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -51,7 +51,6 @@ DEF_HELPER_FLAGS_3(set_dr, TCG_CALL_NO_WG, void, env, int, tl)
 #endif /* !CONFIG_USER_ONLY */
 
 DEF_HELPER_FLAGS_2(get_dr, TCG_CALL_NO_WG, tl, env, int)
-DEF_HELPER_2(invlpg, void, env, tl)
 
 DEF_HELPER_1(sysenter, void, env)
 DEF_HELPER_2(sysexit, void, env, int)
@@ -59,9 +58,6 @@ DEF_HELPER_2(sysexit, void, env, int)
 DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 #endif
-DEF_HELPER_FLAGS_2(hlt, TCG_CALL_NO_WG, noreturn, env, int)
-DEF_HELPER_FLAGS_2(monitor, TCG_CALL_NO_WG, void, env, tl)
-DEF_HELPER_FLAGS_2(mwait, TCG_CALL_NO_WG, noreturn, env, int)
 DEF_HELPER_FLAGS_2(pause, TCG_CALL_NO_WG, noreturn, env, int)
 DEF_HELPER_FLAGS_1(debug, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(reset_rf, void, env)
@@ -115,6 +111,10 @@ DEF_HELPER_2(vmsave, void, env, int)
 DEF_HELPER_1(stgi, void, env)
 DEF_HELPER_1(clgi, void, env)
 DEF_HELPER_2(invlpga, void, env, int)
+DEF_HELPER_2(invlpg, void, env, tl)
+DEF_HELPER_FLAGS_2(hlt, TCG_CALL_NO_WG, noreturn, env, int)
+DEF_HELPER_FLAGS_2(monitor, TCG_CALL_NO_WG, void, env, tl)
+DEF_HELPER_FLAGS_2(mwait, TCG_CALL_NO_WG, noreturn, env, int)
 #endif /* !CONFIG_USER_ONLY */
 
 /* x86 FPU */
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 85a8b0ebd6..2510cc244e 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -76,6 +76,7 @@ extern const uint8_t parity_table[256];
 
 /* misc_helper.c */
 void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
+void do_pause(CPUX86State *env) QEMU_NORETURN;
 
 /* sysemu/svm_helper.c */
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 23287b330e..baffa5d7ba 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -60,14 +60,6 @@ void helper_cpuid(CPUX86State *env)
     env->regs[R_EDX] = edx;
 }
 
-void helper_invlpg(CPUX86State *env, target_ulong addr)
-{
-    X86CPU *cpu = env_archcpu(env);
-
-    cpu_svm_check_intercept_param(env, SVM_EXIT_INVLPG, 0, GETPC());
-    tlb_flush_page(CPU(cpu), addr);
-}
-
 void helper_rdtsc(CPUX86State *env)
 {
     uint64_t val;
@@ -101,7 +93,7 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-static void QEMU_NORETURN do_pause(CPUX86State *env)
+void QEMU_NORETURN do_pause(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
 
@@ -110,51 +102,6 @@ static void QEMU_NORETURN do_pause(CPUX86State *env)
     cpu_loop_exit(cs);
 }
 
-static void QEMU_NORETURN do_hlt(CPUX86State *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    env->hflags &= ~HF_INHIBIT_IRQ_MASK; /* needed if sti is just before */
-    cs->halted = 1;
-    cs->exception_index = EXCP_HLT;
-    cpu_loop_exit(cs);
-}
-
-void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
-{
-    cpu_svm_check_intercept_param(env, SVM_EXIT_HLT, 0, GETPC());
-    env->eip += next_eip_addend;
-
-    do_hlt(env);
-}
-
-void helper_monitor(CPUX86State *env, target_ulong ptr)
-{
-    if ((uint32_t)env->regs[R_ECX] != 0) {
-        raise_exception_ra(env, EXCP0D_GPF, GETPC());
-    }
-    /* XXX: store address? */
-    cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0, GETPC());
-}
-
-void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
-{
-    CPUState *cs = env_cpu(env);
-
-    if ((uint32_t)env->regs[R_ECX] != 0) {
-        raise_exception_ra(env, EXCP0D_GPF, GETPC());
-    }
-    cpu_svm_check_intercept_param(env, SVM_EXIT_MWAIT, 0, GETPC());
-    env->eip += next_eip_addend;
-
-    /* XXX: not complete but not completely erroneous */
-    if (cs->cpu_index != 0 || CPU_NEXT(cs) != NULL) {
-        do_pause(env);
-    } else {
-        do_hlt(env);
-    }
-}
-
 void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_PAUSE, 0, GETPC());
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index c7381ef7e8..803c39e2fb 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -438,3 +438,56 @@ void helper_rdmsr(CPUX86State *env)
     env->regs[R_EAX] = (uint32_t)(val);
     env->regs[R_EDX] = (uint32_t)(val >> 32);
 }
+
+void helper_invlpg(CPUX86State *env, target_ulong addr)
+{
+    X86CPU *cpu = env_archcpu(env);
+
+    cpu_svm_check_intercept_param(env, SVM_EXIT_INVLPG, 0, GETPC());
+    tlb_flush_page(CPU(cpu), addr);
+}
+
+static void QEMU_NORETURN do_hlt(CPUX86State *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    env->hflags &= ~HF_INHIBIT_IRQ_MASK; /* needed if sti is just before */
+    cs->halted = 1;
+    cs->exception_index = EXCP_HLT;
+    cpu_loop_exit(cs);
+}
+
+void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
+{
+    cpu_svm_check_intercept_param(env, SVM_EXIT_HLT, 0, GETPC());
+    env->eip += next_eip_addend;
+
+    do_hlt(env);
+}
+
+void helper_monitor(CPUX86State *env, target_ulong ptr)
+{
+    if ((uint32_t)env->regs[R_ECX] != 0) {
+        raise_exception_ra(env, EXCP0D_GPF, GETPC());
+    }
+    /* XXX: store address? */
+    cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0, GETPC());
+}
+
+void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
+{
+    CPUState *cs = env_cpu(env);
+
+    if ((uint32_t)env->regs[R_ECX] != 0) {
+        raise_exception_ra(env, EXCP0D_GPF, GETPC());
+    }
+    cpu_svm_check_intercept_param(env, SVM_EXIT_MWAIT, 0, GETPC());
+    env->eip += next_eip_addend;
+
+    /* XXX: not complete but not completely erroneous */
+    if (cs->cpu_index != 0 || CPU_NEXT(cs) != NULL) {
+        do_pause(env);
+    } else {
+        do_hlt(env);
+    }
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 14a44a00ca..39af147a87 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -194,7 +194,11 @@ typedef struct DisasContext {
 
 #ifdef CONFIG_USER_ONLY
 STUB_HELPER(clgi, TCGv_env env)
+STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
 STUB_HELPER(invlpga, TCGv_env env, TCGv_i32 aflag)
+STUB_HELPER(invlpg, TCGv_env env, TCGv addr)
+STUB_HELPER(monitor, TCGv_env env, TCGv addr)
+STUB_HELPER(mwait, TCGv_env env, TCGv_i32 pc_ofs)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
 STUB_HELPER(stgi, TCGv_env env)
 STUB_HELPER(svm_check_intercept, TCGv_env env, TCGv_i32 type)
-- 
2.25.1


