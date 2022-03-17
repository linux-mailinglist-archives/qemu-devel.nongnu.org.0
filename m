Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4914DBECB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:54:51 +0100 (CET)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUj62-0001Jh-BP
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:54:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO3-0005hf-VW
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:23 -0400
Received: from [2607:f8b0:4864:20::62b] (port=42670
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO2-0002e8-49
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id p17so3550089plo.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zL4ULUAZFLG4NiZ2Xxof4c8+aeBvBkKbH83Le8PjFIE=;
 b=c1+htk0YsKxHZrSHxZGbDGX9oChbe7ZonN2vxxSxb1CabRnAzmo8voK7XKBzhJDUnh
 Zq7xn3fvdWnkCFCXg2LFaiAC6y1ew6OTJvQflZGif4TjKUi7o6ky+Bfei46JJMMYEH50
 lQWqIj1DL6wIOCeqRGY/FvmeRAQTmQURbuRgsf3yAe7N76XNc0nZaE74V76QOmPMGsP2
 zK0z/lqMUV3P7nuplWP5rrmpPj/0SkIXDV6BXWY9jXaduHc5a6s0HXQZ37m5AIND10oa
 Os8ogzJ8+Fk2yu7wCTh0/MkgygSEAeOkvBmkd7mzLxrImKKX9IjXyI/b6F6yakUewYIw
 V4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zL4ULUAZFLG4NiZ2Xxof4c8+aeBvBkKbH83Le8PjFIE=;
 b=IMsF9R4gkOqK4w+ZmNswBqQ+Y6wDedBVCZJw9bodY9A8qrYHaqHWd8YOB3ZVwtHpVK
 pJF5vceIUigDuiJ7JPbv1PUyZuwJZjtZEwMPTTYJAmFxaPPptzf+imMzbCPhC/Hp3F3K
 EsrK1L9rLZi4nhyVUv0QTmMqbyv05KV5EFqRbgaYNDGEHPf4Jawghly9VOlrAnAK5md+
 VLxsDPXvQBzzx1l0nTSCRNbAqZPrJIGw0lx+Lr3FUQDn488YNxvqp/mlTHEoPvWfihfL
 yILUKhe6ZIO9qSTH/t5gadoS89zUidjNMicaeTc1bsWcAKauOFefP9BZF5byKg1F45HD
 826g==
X-Gm-Message-State: AOAM530/wjsMOsdGcJyLtGoUG4LGNuF09HWHieYIjvyjC3EnHQdBQ2pY
 MsWG7AmrBANqqX+uOKHuHOAwJXgYyiKA9g==
X-Google-Smtp-Source: ABdhPJwjn1970aOtEXAiJOXi7eh61K2/VHCUnukAd1WlYuC85GtoM2O0zT7SQebeRbJZAhMJaAk7NA==
X-Received: by 2002:a17:90b:3ece:b0:1bf:841e:930b with SMTP id
 rm14-20020a17090b3ece00b001bf841e930bmr13647337pjb.212.1647493760871; 
 Wed, 16 Mar 2022 22:09:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 42/51] target/nios2: Implement rdprs, wrprs
Date: Wed, 16 Mar 2022 22:05:29 -0700
Message-Id: <20220317050538.924111-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Implement these out of line, so that tcg global temps
(aka the architectural registers) are synced back to
tcg storage as required.  This makes sure that we get
the proper results when status.PRS == status.CRS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/helper.h    |  2 ++
 target/nios2/op_helper.c | 12 ++++++++++
 target/nios2/translate.c | 47 ++++++++++++++++++++++++++++++++++++++--
 4 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index e32bebe9b7..26d4dcfe12 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -220,6 +220,7 @@ struct ArchCPU {
 
     bool diverr_present;
     bool mmu_present;
+    bool eic_present;
 
     uint32_t pid_num_bits;
     uint32_t tlb_num_ways;
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 6f5ec60b0d..1648d76ade 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -24,6 +24,8 @@ DEF_HELPER_FLAGS_3(divu, TCG_CALL_NO_WG, i32, env, i32, i32)
 
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_3(eret, noreturn, env, i32, i32)
+DEF_HELPER_FLAGS_2(rdprs, TCG_CALL_NO_WG, i32, env, i32)
+DEF_HELPER_3(wrprs, void, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 849867becd..e5e70268da 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -83,4 +83,16 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     env->pc = new_pc;
     cpu_loop_exit(cs);
 }
+
+uint32_t helper_rdprs(CPUNios2State *env, uint32_t regno)
+{
+    unsigned prs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, PRS);
+    return env->shadow_regs[prs][regno];
+}
+
+void helper_wrprs(CPUNios2State *env, uint32_t regno, uint32_t val)
+{
+    unsigned prs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, PRS);
+    env->shadow_regs[prs][regno] = val;
+}
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 525df7b023..2b2f528e00 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -103,6 +103,7 @@ typedef struct DisasContext {
     bool              crs0;
     TCGv              sink;
     const ControlRegState *cr_state;
+    bool              eic_present;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
@@ -326,6 +327,27 @@ gen_i_math_logic(andhi, andi, 0, instr.imm16.u << 16)
 gen_i_math_logic(orhi , ori,  1, instr.imm16.u << 16)
 gen_i_math_logic(xorhi, xori, 1, instr.imm16.u << 16)
 
+/* rB <- prs.rA + sigma(IMM16) */
+static void rdprs(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+    if (!dc->eic_present) {
+        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
+        return;
+    }
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
+
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    I_TYPE(instr, code);
+    TCGv dest = dest_gpr(dc, instr.b);
+    gen_helper_rdprs(dest, cpu_env, tcg_constant_i32(instr.a));
+    tcg_gen_addi_tl(dest, dest, instr.imm16.s);
+#endif
+}
+
 /* Prototype only, defined below */
 static void handle_r_type_instr(DisasContext *dc, uint32_t code,
                                 uint32_t flags);
@@ -387,7 +409,7 @@ static const Nios2Instruction i_type_instructions[] = {
     INSTRUCTION_FLG(gen_stx, MO_SL),                  /* stwio */
     INSTRUCTION_FLG(gen_bxx, TCG_COND_LTU),           /* bltu */
     INSTRUCTION_FLG(gen_ldx, MO_UL),                  /* ldwio */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* rdprs */
+    INSTRUCTION(rdprs),                               /* rdprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(handle_r_type_instr, 0),          /* R-Type */
     INSTRUCTION_NOP(),                                /* flushd */
@@ -587,6 +609,26 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 #endif
 }
 
+/* prs.rC <- rA */
+static void wrprs(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+    if (!dc->eic_present) {
+        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
+        return;
+    }
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
+
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    R_TYPE(instr, code);
+    gen_helper_wrprs(cpu_env, tcg_constant_i32(instr.c),
+                     load_gpr(dc, instr.a));
+#endif
+}
+
 /* Comparison instructions */
 static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
@@ -711,7 +753,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(slli),                                /* slli */
     INSTRUCTION(sll),                                 /* sll */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* wrprs */
+    INSTRUCTION(wrprs),                               /* wrprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(or),                                  /* or */
     INSTRUCTION(mulxsu),                              /* mulxsu */
@@ -812,6 +854,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
+    dc->eic_present = cpu->eic_present;
     dc->crs0 = FIELD_EX32(dc->base.tb->flags, TBFLAGS, CRS0);
 
     /* Bound the number of insns to execute to those left on the page.  */
-- 
2.25.1


