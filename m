Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7560D4D4707
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:32:09 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHxg-0007OP-FS
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0o-0002Wl-I1
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:21 -0500
Received: from [2607:f8b0:4864:20::632] (port=41562
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0m-0008T3-OI
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:18 -0500
Received: by mail-pl1-x632.google.com with SMTP id z3so4599401plg.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zL4ULUAZFLG4NiZ2Xxof4c8+aeBvBkKbH83Le8PjFIE=;
 b=NQbcez9BQoOX6fuFu7cB1PvBsES3In949mJVL6L4weQ7seculiM5aQH1YKxx5dBSKf
 pn6v8hJPRcb0NTeddGJLtf6Ik098cHS9QLinWBcnTCC8i5iv8rQ2ulK8janGVDXjUrHZ
 +L+RX/p72nfZpgo/i9d5D3M9dpKrJFPnjKoSJ8uT2PxqyM1J/59vFuKmygBq33rCGr2l
 4a25RORcANPrFF20XzqMNMgk4p8YdZQALnVB2SNBsKCTonDxG68r37Yz/7RScWkjcR/4
 h6GmU46qkNUXt52z9TENl3xPXNAuMmvppOLqusLwQHWgaXn6Qp6XVzhDqKqmLnm9uV4E
 RRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zL4ULUAZFLG4NiZ2Xxof4c8+aeBvBkKbH83Le8PjFIE=;
 b=ZYjofjYfOe1eEyzcZJkWQbvgpgzxIMFtKdKyZCXhLGnB7OHi84OqX7OOIjPn8mdIq0
 cSGHaJcVv6poycsCTHPw+sS9+KDmV7brutqrMLhzy+/eYog233xR9wnC7eZfnon95eR4
 k1TUKyAh+aY8FF8QC+kYzFOv2bAak38ywBKG+iQ5q7/45GtBAySXCNddPjuf9Hd4DSnh
 afkOGwFvgsUO+OmwvvvPcyr3ae0ZP2fHr4IzJTEc7R6TbfBlEVI6ffrWrQOdN5izELAW
 Sv3BaEccn1CSktUZdaslmUaeEynl4uKYRqReTWOJm+AFBz80xI/qhCR2PAhcoGhHOXp0
 gJdA==
X-Gm-Message-State: AOAM532S8Wj6bn/YZB2gZrR2UoC3LvcXFgpvVkZuTT4gA3YW+tbcg+2K
 8WUWccLR00fYy4t4kifmAm+rCd5cilew+w==
X-Google-Smtp-Source: ABdhPJwZb1swk6q8oQnO7XB6ws9TncgprLDJGrq9bxbyG7l/JowMsYIctlruQgWBnveIq+khAayj5A==
X-Received: by 2002:a17:90b:4c87:b0:1bf:7ff7:4f39 with SMTP id
 my7-20020a17090b4c8700b001bf7ff74f39mr15460413pjb.163.1646911875374; 
 Thu, 10 Mar 2022 03:31:15 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 42/48] target/nios2: Implement rdprs, wrprs
Date: Thu, 10 Mar 2022 03:27:19 -0800
Message-Id: <20220310112725.570053-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


