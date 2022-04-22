Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8BE50BEBD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:32:28 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx8u-0002NX-2r
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaY-0007zm-Gp
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:56:58 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:45609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaW-0007y0-KS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:56:58 -0400
Received: by mail-il1-x136.google.com with SMTP id t4so5408711ilo.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QGUpYO4ZAdRmNsQF40A07J1Y/QTqFdfV+kNvg7ol84=;
 b=gQPHBAwBrjhNQgKbZPZIv/mVBEB2SINg+w3lonptCaBVDcO4w9hMqZ2uFRZNop7Q/B
 CR1Pmq/Pe4FuvOg/xK+2WQfGOyCXuOLlMgZAD4Q+IuAP7JOX3lGguO5Xzo3XXSrzaEhC
 DOJg8MciQUL9ewypdIrfkoMYc27e1Dk9eySCzVpRtH6SU8kduOYq952nKZowfIhgsSz0
 7cgfogRPc1CbP86fQIO34YhZyv/aliMJGymvQs92LBWBf8BLx1GzW/Lnyj8asf5iMA0Y
 Sy3Nzc5Pdf5EIh4SzYkvfusmjnKDGf4oMcq1yZpFvkcaF+CI4M0K4iEwBDQewSAc9Nbw
 ixYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QGUpYO4ZAdRmNsQF40A07J1Y/QTqFdfV+kNvg7ol84=;
 b=dk9JgKpnvWICQGOc9kZqzVxchzqgA6nlnHmfpkStlSOUyLaduGSptgyTOeAjq7fLFC
 F9Jl/j5C72lVuNWJpO8qcwhJs+ar1k3v2MXnuG4Cm86f9KuzGQMF5S2dU2huXKZbDRW9
 mQf3JoOQEYvtx0hbyeavYIZE3YSMzj0Y1zhyh2MxQR2CeF5vO7srxKrbl0WeDcI6HETX
 CY/VuRbgKbH8Ysbwld/nLZ/eFzGgQifewv2TDldgvW4CzqwsUWGfhzkwZ/LaUiBhiQxR
 nrC4h/kIy/0Bshg/OmRmTkMeShHykLf2TIjeUhvh34Cdk9ZwEpvO9eoUdSgME0p9JZSh
 bB6Q==
X-Gm-Message-State: AOAM532MS0FrsQFrVelfA92M/clxkbnXgXv889DoaYNqGFWVK0I3GUAU
 UQ+THVnC95VMTGz4kBb7YKAseK07hdhxrTnt
X-Google-Smtp-Source: ABdhPJxkmN7jxSfy9hjee5y6AhC0HtjuyJITmU7IKrLR/fDm3ANDA0uoz6y+mfanKWa3/9YhjLxUeg==
X-Received: by 2002:a05:6e02:160f:b0:2cd:5c76:817e with SMTP id
 t15-20020a056e02160f00b002cd5c76817emr2521131ilu.133.1650646615336; 
 Fri, 22 Apr 2022 09:56:55 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:56:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 41/68] target/nios2: Support division error exception
Date: Fri, 22 Apr 2022 09:52:11 -0700
Message-Id: <20220422165238.1971496-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
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


