Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA8B4D469C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:16:23 +0100 (CET)
Received: from localhost ([::1]:49124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHiQ-00024l-7L
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxg-0006BY-Ty
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:04 -0500
Received: from [2607:f8b0:4864:20::529] (port=35714
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxe-00080w-T8
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:04 -0500
Received: by mail-pg1-x529.google.com with SMTP id e6so4501193pgn.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PvVjJW4JNMk/C3CxxpvaZU1mv/KFzjzrkRcyiH8whDc=;
 b=tjkEhfJxD4TAgJh8t7FY6PDRv9n2hM0/UjnEDfWrUaX9HktSyYl07qdFmIr1JW1jPi
 mQNZpIcRlppC4vDQ7jr8i8gW2/LBo2cOsgqZ5lwZ3whiyFwoe1OL9jTgKyLctraTb+BR
 zhzG40TGgsWOuhBkq9dPiKzibehI4vmUf2Rld+aHg9d8GoP/sIEhCDVIsSrwpbfZnuuU
 MX898mTztam9Oz49zJyaQTaibz2+I9y6eUwfZIbthidYJvKEEpBnfMXsSINm+oi3j4pT
 vNJKXEwUmKZNxLBuNskTJh8wXgnNPeQ3AepRosR7ulfUQ2YXT0pK2PdRMUHCopuzo/lI
 RqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PvVjJW4JNMk/C3CxxpvaZU1mv/KFzjzrkRcyiH8whDc=;
 b=qXkY3sEC3VKwBVVbmwwvDFHHzS3FK/GBSLCWQM8JhglgO4cf0ubTXtL75Lij0kYTy9
 xD4wWHpFBdv7GjrI6Pbm7vYS2ClxIXpcb8wEwsYLllIei4l2k7OtdIH7Kh2yvRK5g8Gv
 1gOFjODiqj56RciDr470P+c2T9buim00nt/vyj+TbQEGxRycHiEXdGmSIVkamYIAspql
 x7oWBcZDl+foP+8udk5uJS3rOPgEBH9W87+VkTqCeRdbkrdrQDgNzfQxru9BY9l3JCzn
 y3NYLbxucDu283NoP9WMOxqHU7kA+90cIROXrmFfPXboojZQX6ap+zkK10NmVePrMiZm
 AaQA==
X-Gm-Message-State: AOAM533mse0IVHHAM/WeIgGarMQfjKMfUxHB1TKxeXdrbCck4CM3BjoX
 P//aQ3uZ0KaCOkF4CwuXvfAC4pciVjSMEQ==
X-Google-Smtp-Source: ABdhPJwFcFH3OOE9eB6fzax9PAD211erhXXRYVWe12jT5g+NVRBlwqv95umYSw3z6FRdVA1adxQIew==
X-Received: by 2002:a63:1321:0:b0:376:333b:3ed with SMTP id
 i33-20020a631321000000b00376333b03edmr3577341pgl.283.1646911681397; 
 Thu, 10 Mar 2022 03:28:01 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/48] target/nios2: Support division error exception
Date: Thu, 10 Mar 2022 03:27:07 -0800
Message-Id: <20220310112725.570053-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Division may (optionally) raise a division exception.
Since the linux kernel has been prepared for this for
some time, enable it by default.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 161f8efe82..95079c186c 100644
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
index fa234cb2af..ea364b7d1f 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -39,6 +39,10 @@ void cpu_loop(CPUNios2State *env)
             /* just indicate that signals should be handled asap */
             break;
 
+        case EXCP_DIV:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 745a583f9d..b8410d8447 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -262,6 +262,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 }
 
 static Property nios2_properties[] = {
+    DEFINE_PROP_BOOL("diverr_present", Nios2CPU, diverr_present, true),
     DEFINE_PROP_BOOL("mmu_present", Nios2CPU, mmu_present, true),
     /* ALTR,pid-num-bits */
     DEFINE_PROP_UINT32("mmu_pid_num_bits", Nios2CPU, pid_num_bits, 8),
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 8b69918ba3..460032adc0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -139,6 +139,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_UNALIGND:
             name = "Misaligned (destination)";
             break;
+        case EXCP_DIV:
+            name = "DIV error";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -210,6 +213,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     case EXCP_SUPERI:
     case EXCP_ILLEGAL:
+    case EXCP_DIV:
     case EXCP_TRAP:
         do_exception(cpu, cpu->exception_addr, 0, false);
         break;
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index c56fc15283..c93b66c9aa 100644
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
index 21dc6947cf..c8fb05a9cb 100644
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
2.25.1


