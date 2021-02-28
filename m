Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214AF32754B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:41:48 +0100 (CET)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVh5-0008Eo-1p
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQL-0006ZP-QP
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:29 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQJ-000828-QW
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:29 -0500
Received: by mail-pf1-x432.google.com with SMTP id w18so10270730pfu.9
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XJp8k1XTBOYLX1l8DeT+YJ6pyxD0dHmmzjN3iDefNwc=;
 b=GBJfhVs2RpsHv+clSODeCgtTE/KC89v3tbW/kDsYHR4rEUUxX32ya5MAvwI2tuiF/K
 NQFnpkoToimHKkG8/pNQ6K5x6NCjCdofmiZ+3GVGXrU2jIj0PKTFzEC32xB2MCgBEcXQ
 k38Xxv/fkXZAGJwmH5SmB37n/NhOUOpiw4G81TWHlZdrlJW8ZA6ZazXr1cjaaRwynN2J
 a5k3MinCKxEh5Qi0bsxSlY5nrWG2KxP3fbGY9XN/DiwFqwt3ky9L4KwMW4nyQjpWKKEI
 e8rKU9WEAdxTkMAHUIwVBFfvj7D777myrc5Ne1TqJqF8SPKgwxyjwB8TecXwm7Ov2c1b
 NPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJp8k1XTBOYLX1l8DeT+YJ6pyxD0dHmmzjN3iDefNwc=;
 b=FXviwg20V5Ox/K7pcioaSN7TJ4dj/Cb1t5VulZlX5o/hWLxg6D/Q9mTwESmDNOBOWy
 sjKnR30qjlaXz0NOGt0g98VdHqUVswODiDR0JsHmEyLpQaYf9XgRZj6YZ+/Q9/QrvrLr
 nHbsXGjDupRk5yhpyi/DMP1MQe2vuG2nDNr8djnR//YapSr6ZR+XOORPGT/kxz8dwPea
 RgkCwNnXs1KUXnHxQA7Nds+gS6o9NNMg5d93qua6eKN8NH0NiK48ogO3fp6C+j5XciGE
 cjFRNFiwoSzGbI760btaHY3r+9rsNqG2BWfwzqWgMyxV/yit6maon7WlZK2luKrFyztY
 u5wg==
X-Gm-Message-State: AOAM5311bEBP8b2LMtsq97jfigjJc82nDYQ73iiLofcWXu8nJWkVlIRn
 TzpKZwuoSo0UDBsX25mlf01T+pW3dohdvg==
X-Google-Smtp-Source: ABdhPJzzLYE4u11FuvAcLdfb87RZ4kv3iqPHXxulU6DGYSu+BfZieF8eDhP9pBSdeZd8diKRigOgPA==
X-Received: by 2002:a62:7f94:0:b029:1ee:186e:afa7 with SMTP id
 a142-20020a627f940000b02901ee186eafa7mr12325958pfd.33.1614554666493; 
 Sun, 28 Feb 2021 15:24:26 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/50] target/i386: Move invlpg, hlt, monitor, mwait to sysemu
Date: Sun, 28 Feb 2021 15:23:12 -0800
Message-Id: <20210228232321.322053-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: cfontana@suse.de
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
index e848c3b4b9..cce350aa0b 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -80,6 +80,7 @@ extern const uint8_t parity_table[256];
 
 /* misc_helper.c */
 void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
+void do_pause(CPUX86State *env) QEMU_NORETURN;
 
 /* sysemu/svm_helper.c */
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 20bf4771e7..180bed9021 100644
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
@@ -100,7 +92,7 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-static void QEMU_NORETURN do_pause(CPUX86State *env)
+void QEMU_NORETURN do_pause(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
 
@@ -109,51 +101,6 @@ static void QEMU_NORETURN do_pause(CPUX86State *env)
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
index ebf15e3dde..1d8b651212 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -434,3 +434,56 @@ void helper_rdmsr(CPUX86State *env)
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
index 708059ac15..aa6a8c4813 100644
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


