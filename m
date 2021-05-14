Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A05380DA9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:56:18 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaAj-0006US-4D
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ7-0003O7-VN
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:25 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:47018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ5-0000Cv-TE
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:25 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 76so29001463qkn.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrtXxo1loGpNU4VwRmuk9G04e0Yggh7IkYSYIgLWGDg=;
 b=PLWwuC4iOjbEZuixCD4vXn02X+5jpVevgZys62j47XLFtrTxaIqqfPTvzHidLmWuE+
 Ef3lErlXjzfZsGvhvTIWSjRkASesl5Xw8dV7DFkjTYljD2hs8Z/g4lbmOAAMQN8xVgAE
 S7i8Nf6mTzIYU77fdvb63gY2mr/ROXAl79esqzOwQRCCz+YEd8DRE0F0HxYd3cWp9uRp
 A+TyXmaRpXVRmc2OHwLTLdpwgqJiM7SaZVeLxOC6nxLhMlSYd0f7gau+qgcJVAX/WI6o
 5qLf7zT5yTpOrKcXrDz814XknIMGKo5S/BQMaXhpFIweePoZZyrZqgHtD35F+zr1sbsD
 7EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrtXxo1loGpNU4VwRmuk9G04e0Yggh7IkYSYIgLWGDg=;
 b=sN20sJp0ecxWGJOGgnNFn/jqtj6HgSHBb/cEkaSEufgAinOgQN0+6NRG9/y0i1C/Wo
 DYQWJT9vT1qVL9mi8hIq0KOCunGc+8wDya2RMAms/o+LgZf9y3IMqebMoHZ9yMa0eVgW
 ZcZolMym4agKrznlhRY9m5ejNfi0cqqmO3okW1JPrKa80xtNtCrfudmcTJ/QCNmYJng6
 kcMHXD/2qKhco28Fhhtzu1hTttD8HNV2JCuMFZ64wbKnwRn/tB39GptbWpo5OCKLJbzG
 9f9rZ7cd5Zpg2uTqT1tsZyFxMeIxL05WqzvB2Evfl6o/yk02HGzDYk2kpJZOx29kHc6R
 ARSA==
X-Gm-Message-State: AOAM532DdwZ2r4RIbSsC90vbrYiUdIr7Ti1jJ8XrFAI13xNTldzsg++c
 O+EByHfT0ieI6AyusPelMChX0AmCco2aTuaJqBw=
X-Google-Smtp-Source: ABdhPJzcI9Mg61YKGoYBeC5FWyE2RsekNovP/HoNKmV20xV2AkbmlKG5mZSUl5aAsVmwJ4bWoPiPcg==
X-Received: by 2002:a37:93c2:: with SMTP id
 v185mr44436056qkd.179.1621005442806; 
 Fri, 14 May 2021 08:17:22 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/50] target/i386: Move invlpg, hlt, monitor,
 mwait to sysemu
Date: Fri, 14 May 2021 10:13:33 -0500
Message-Id: <20210514151342.384376-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These instructions are all privileged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 6804835712..76a6503f3d 100644
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


