Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639834DBE5D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:27:46 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUifp-0002OO-Gr
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:27:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKy-0001PA-Pg
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:13 -0400
Received: from [2607:f8b0:4864:20::42b] (port=46840
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKw-0002IB-KP
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:12 -0400
Received: by mail-pf1-x42b.google.com with SMTP id s11so5848365pfu.13
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wzVt0A8IleUfz6PFweqvWR5Y/gzEkWSlkCYt5DnHYks=;
 b=f+LHTyyADPVbozrc3hmUM6XGKu2saupoVxCpDE0QJQIz6erIyfPIwWZviR8r3eH35j
 OLeQLH2izuefKXQSR8Omm+xSBOXpV/d2weZraePtR45CHmk+X1Fr5EFxv/AhjZBdbDCM
 saHIf/DdgVq7wsCSLJecWgC69gG1hikLbmWzNMqWauRXCDHQJyKSnaPu9ibwyqraqYi2
 u5Eg46VIq6kb/gAD2vHC/0RGWgLIG5yQk5/fPEGs/PSiLruwSRgFILBJlHtgYwlFyzHi
 ZCBZZGHI4Z1vrrGjsqjmXPCHuAXroLLD91cw8/6KUw0jiRekwkKpnzpMjoIovWI0UNvF
 qE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wzVt0A8IleUfz6PFweqvWR5Y/gzEkWSlkCYt5DnHYks=;
 b=WUDshvYa9ugPZUectEtn65JznZNBUtYfNaloN2yYYkeBFmrIxtcWExGmGmQfjPhPvL
 j8StWBnzCDf9/BUvy2m7BcJkxNXznGC5tFsF12no0SEJer7NA4oIAT4aj835WJy3auIL
 QcCVr4UpMG10Y5N/szrvFqAWrdeEN4PCI3d10lyQW1WPm6eil+HClJj2w7m2vI5oSvyz
 7ObBjggouxHn3AwGtdHsADyGR/dWiepyIVg3StuNFog9E0oJYYRb/Yz/NqvYmL4dj248
 Y73hthHFNuynTPz06u4lL1slHo512Qxv8Wpv/pzF9gddKUGVffBEXSvI+qs1J22FgWW8
 rhZA==
X-Gm-Message-State: AOAM532MdpjuHQELYgY1UkoIKahrOWgBcFvfV0R4+2tI54324d69wzlG
 wib6gW/o084+8CskveUNeiHurIyzSETrcg==
X-Google-Smtp-Source: ABdhPJxuM3y0r0bH6P0MRSCEpQSBMWQXNPhm5Bfus6+yE1slsJUINLsw2YHZjgExqAAssvx4LP5Liw==
X-Received: by 2002:a63:af02:0:b0:375:57f0:8af1 with SMTP id
 w2-20020a63af02000000b0037557f08af1mr2334722pge.188.1647493569434; 
 Wed, 16 Mar 2022 22:06:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 30/51] target/nios2: Support division error
 exception
Date: Wed, 16 Mar 2022 22:05:17 -0700
Message-Id: <20220317050538.924111-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
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
index e041aa41d0..07306efc35 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -268,6 +268,7 @@ static int nios2_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
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


