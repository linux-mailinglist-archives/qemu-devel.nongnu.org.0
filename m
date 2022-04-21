Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28850A4B1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:51:32 +0200 (CEST)
Received: from localhost ([::1]:51398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ5f-0007Kx-4Q
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcu-0005GS-7N
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:48 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYcq-00074v-KK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:47 -0400
Received: by mail-io1-xd30.google.com with SMTP id 125so5620590iov.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ta5mfA/TjGo/90uCFwSolM5LXBOeyq3GapdsZNXkkd8=;
 b=ZiT9XIj3ABtAbyeTdgtXK5q94kxQ4WXcG5WWAzrHVShq3l9JvZVQWfJjHHFf28mTO2
 dBcCKvu/iORnc71b1KpXaFKz5BCpQRjpclXpcJzhNBkvLpyvHsaihyi2OI1fDoinUUKe
 7hdtU26ZYewU4KTyiSn4/6BKd4SXbklWgkQlR0Tyg6MT6wvDzDeASifL6aNvpD1YsbfP
 A+mN4wx+hAuRzAsguNMyP+K5hTXeCqiyyRFY2ekk7hbWw0UWj/pGRYiq2229aQTYfNg6
 lIby39Eo0t9Wva061dKdYFweczNpKoK+vt8Cahr9fQlLZI9o+kxL5mrfbadJcCDOAV+E
 9ccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta5mfA/TjGo/90uCFwSolM5LXBOeyq3GapdsZNXkkd8=;
 b=MkiTZf7wxZLKkcRo5F1xb2nu1LuZfYh99NFuhYN0IgxDHZRFxVmIaCPcTnRhZ0E29w
 JoOkiuUu8HjS6bhhS1JXU1YzGN8STBGKUBelFtc6c7oqNBe0Nv5KwYYOEMOzgCwR7ZWG
 ng1j+sOsrBfKBdCnI4W2drWDhU0ewK1sXODUso+UtdcqFuU2DeuhoY6S70q71R0QdWhN
 ls9TjTerRqn8xyyLNhw2OnHvaWYjENdAvSAA0RhVlA7NT7yzyyTttjc1ifJHwMuKseoX
 xm3t8BF+vzMp3xbNz4KUyORYhJBDUakNyoDgoREfcs25AFnrJxWj4rsT3KmNcUj7k43s
 b9wQ==
X-Gm-Message-State: AOAM531vucxmX7IUbi99EX1ew0rEoJHa9ZQL2MGiIYt8aDt3H3OC2hKg
 yfYNxWJh+McFiUo5oVTIeM0oeA3y4exbOw==
X-Google-Smtp-Source: ABdhPJwDIp4xRPVa36LqZTHgSUXHT9zqsr6jgoixxWDdwukxunfQFzWD55T4D7PBU/Gy5JVN0afh7Q==
X-Received: by 2002:a05:6638:4128:b0:323:62b4:30c3 with SMTP id
 ay40-20020a056638412800b0032362b430c3mr55525jab.318.1650554502855; 
 Thu, 21 Apr 2022 08:21:42 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 41/64] target/nios2: Support division error exception
Date: Thu, 21 Apr 2022 08:17:12 -0700
Message-Id: <20220421151735.31996-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
index 5403eeae54..2ce76af457 100644
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


