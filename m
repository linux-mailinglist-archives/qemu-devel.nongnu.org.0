Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711165108C7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:15:55 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQfC-0001gy-AW
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpq-0001ns-JX
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpo-0005LT-CJ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso2876923pjb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QGUpYO4ZAdRmNsQF40A07J1Y/QTqFdfV+kNvg7ol84=;
 b=KJM5JZJrQGZPyfA9LRZasdwu+QSeMQSTdeV53zeawwl084SlZNcFnXkqDN2XRQHH4O
 AuZpzYNGTaBbb9yZHk/nnJRe+ng0OcWu9LTZyPEI/oZEDYheE2ZfSgl9c5dDzpDRU9yM
 3cOJUr200uFKDmm7uXstwUQDXcnL3DEfD7YFrp/C7G201aQY3H+l3RZTniJdZ7BwFHQT
 g0z2s26HA3TX+GMS54r+a6zPBZ6JZu73QEjAWWu0QKUp9FpEMsvc8ilQZozWWLhCi9Fy
 tFNl8l+CJBo/qfC6/ipt9GX8v55lWq1k6h6Qn4nCJwyO4M1Wpdi0ZLLPG2qVKUPm07L7
 lyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QGUpYO4ZAdRmNsQF40A07J1Y/QTqFdfV+kNvg7ol84=;
 b=uZNINvbdG6TUAhOS3NZenfc+G6+ZAjwtpnJlV4Jqn+LI7CJ3HIHaPDaTSmv0r2UjXK
 L3tgFmzH39eotj+lE+DpdfJXyOrbgEeiDkU/RNXD+aqcrThY0BgmdLTfy9QcrCj/wT4b
 bQabz1vyZAYGA1gz0OPT3+HImSaUgI0ii/qd7ICwyZQOdoiGoe578nzNPtk+svhYKFe7
 cHtWc9Wf0jbImnCiCid9BsyuJHJBwomLmUEeYO8Zl7YGEtZs+P76GpOmdis+CbkaFpB2
 YT00V+xZt7Fk42Ri2IZ4ZVTTmqflxg9pxoT8kI7HnxWfYq+5UkiUbtCQejhQIfoFb6xP
 asdg==
X-Gm-Message-State: AOAM531+O93jf4Ar1u9Hpn8UnjY0WueSB+S3JF7oAdKuu9h0jVbH/ci1
 WxtXwASq3boE8soKlri6IbUNELgdtXWEIw==
X-Google-Smtp-Source: ABdhPJzI5yMrToMG/QjnSZ8PW2eIDnJ2+Mil9df0zwRUTP1CgKuFhLqq/W2S0yB6q/DBnNQGucATrQ==
X-Received: by 2002:a17:902:a583:b0:15d:197b:9259 with SMTP id
 az3-20020a170902a58300b0015d197b9259mr10919111plb.51.1650997366923; 
 Tue, 26 Apr 2022 11:22:46 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/68] target/nios2: Support division error exception
Date: Tue, 26 Apr 2022 11:18:40 -0700
Message-Id: <20220426181907.103691-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Division may (optionally) raise a division exception.
Since the linux kernel has been prepared for this for
some time, enable it by default.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-42-richard.henderson@linaro.org>
---
 target/nios2/cpu.h          |  2 ++
 target/nios2/helper.h       |  2 ++
 linux-user/nios2/cpu_loop.c |  4 +++
 target/nios2/cpu.c          |  1 +
 target/nios2/helper.c       |  4 +++
 target/nios2/op_helper.c    | 29 ++++++++++++++++++
 target/nios2/translate.c    | 60 +++++++++++++------------------------
 7 files changed, 62 insertions(+), 40 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 08284d7927..4d63006ffe 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -207,7 +207,9 @@ struct ArchCPU {
     CPUNegativeOffsetState neg;
     CPUNios2State env;
 
+    bool diverr_present;
     bool mmu_present;
+
     uint32_t pid_num_bits;
     uint32_t tlb_num_ways;
     uint32_t tlb_num_entries;
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 525b6b685b..6f5ec60b0d 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -19,6 +19,8 @@
  */
 
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
+DEF_HELPER_FLAGS_3(divs, TCG_CALL_NO_WG, s32, env, s32, s32)
+DEF_HELPER_FLAGS_3(divu, TCG_CALL_NO_WG, i32, env, i32, i32)
 
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_3(eret, noreturn, env, i32, i32)
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index c5e68ac048..11ecb71843 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -38,6 +38,10 @@ void cpu_loop(CPUNios2State *env)
             /* just indicate that signals should be handled asap */
             break;
 
+        case EXCP_DIV:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            break;
+
         case EXCP_TRAP:
             /*
              * TODO: This advance should be done in the translator, as
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 58e6ad0462..54e7071907 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -263,6 +263,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 static Property nios2_properties[] = {
+    DEFINE_PROP_BOOL("diverr_present", Nios2CPU, diverr_present, true),
     DEFINE_PROP_BOOL("mmu_present", Nios2CPU, mmu_present, true),
     /* ALTR,pid-num-bits */
     DEFINE_PROP_UINT32("mmu_pid_num_bits", Nios2CPU, pid_num_bits, 8),
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 4d9085f22f..c5a2dd65b1 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -119,6 +119,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_UNALIGND:
             name = "Misaligned (destination)";
             break;
+        case EXCP_DIV:
+            name = "DIV error";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -187,6 +190,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     case EXCP_SUPERI:
     case EXCP_ILLEGAL:
+    case EXCP_DIV:
     case EXCP_TRAP:
         do_exception(cpu, cpu->exception_addr, 0, false);
         break;
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 49fccf2c2c..a19b504b0e 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -31,6 +31,35 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cpu_loop_exit(cs);
 }
 
+static void maybe_raise_div(CPUNios2State *env, uintptr_t ra)
+{
+    Nios2CPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    if (cpu->diverr_present) {
+        cs->exception_index = EXCP_DIV;
+        cpu_loop_exit_restore(cs, ra);
+    }
+}
+
+int32_t helper_divs(CPUNios2State *env, int32_t num, int32_t den)
+{
+    if (unlikely(den == 0) || unlikely(den == -1 && num == INT32_MIN)) {
+        maybe_raise_div(env, GETPC());
+        return num; /* undefined */
+    }
+    return num / den;
+}
+
+uint32_t helper_divu(CPUNios2State *env, uint32_t num, uint32_t den)
+{
+    if (unlikely(den == 0)) {
+        maybe_raise_div(env, GETPC());
+        return num; /* undefined */
+    }
+    return num / den;
+}
+
 #ifndef CONFIG_USER_ONLY
 void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 {
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index b8d75207a4..b27269bf08 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -654,59 +654,39 @@ gen_r_shift_s(ror, rotr_tl)
 static void divs(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, (code));
+    TCGv dest;
 
-    /* Stores into R_ZERO are ignored */
-    if (unlikely(instr.c == R_ZERO)) {
-        return;
+    if (instr.c == R_ZERO) {
+        dest = tcg_temp_new();
+    } else {
+        dest = cpu_R[instr.c];
     }
 
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_temp_new();
-    TCGv t3 = tcg_temp_new();
+    gen_helper_divs(dest, cpu_env,
+                    load_gpr(dc, instr.a), load_gpr(dc, instr.b));
 
-    tcg_gen_ext32s_tl(t0, load_gpr(dc, instr.a));
-    tcg_gen_ext32s_tl(t1, load_gpr(dc, instr.b));
-    tcg_gen_setcondi_tl(TCG_COND_EQ, t2, t0, INT_MIN);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, -1);
-    tcg_gen_and_tl(t2, t2, t3);
-    tcg_gen_setcondi_tl(TCG_COND_EQ, t3, t1, 0);
-    tcg_gen_or_tl(t2, t2, t3);
-    tcg_gen_movi_tl(t3, 0);
-    tcg_gen_movcond_tl(TCG_COND_NE, t1, t2, t3, t2, t1);
-    tcg_gen_div_tl(cpu_R[instr.c], t0, t1);
-    tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
-
-    tcg_temp_free(t3);
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
+    if (instr.c == R_ZERO) {
+        tcg_temp_free(dest);
+    }
 }
 
 static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, (code));
+    TCGv dest;
 
-    /* Stores into R_ZERO are ignored */
-    if (unlikely(instr.c == R_ZERO)) {
-        return;
+    if (instr.c == R_ZERO) {
+        dest = tcg_temp_new();
+    } else {
+        dest = cpu_R[instr.c];
     }
 
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv t2 = tcg_const_tl(0);
-    TCGv t3 = tcg_const_tl(1);
+    gen_helper_divu(dest, cpu_env,
+                    load_gpr(dc, instr.a), load_gpr(dc, instr.b));
 
-    tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
-    tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
-    tcg_gen_movcond_tl(TCG_COND_EQ, t1, t1, t2, t3, t1);
-    tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
-    tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
-
-    tcg_temp_free(t3);
-    tcg_temp_free(t2);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
+    if (instr.c == R_ZERO) {
+        tcg_temp_free(dest);
+    }
 }
 
 static void trap(DisasContext *dc, uint32_t code, uint32_t flags)
-- 
2.34.1


