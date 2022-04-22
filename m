Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9F50BF49
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:02:25 +0200 (CEST)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxbs-0006Xa-4k
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb3-0000TM-C4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:29 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwb1-00083N-13
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:28 -0400
Received: by mail-il1-x12a.google.com with SMTP id b5so5441460ile.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKJfP1L1JthCk9j8S3dyGmOEwjYZHFg6bDruhwKHIGY=;
 b=r4qh/tR1jpoQiyZxgAf0nt1VDppg+GSRUzs7eTe0jp96njFpKQa/WYegAwi3iadzsA
 XGJnqTJsTUxK1N0rvv6J5+IZx6SKYCh6obVye+Z65VtkeYAcMPk8tAVHkUBvlRqCHQeP
 uMbnoYdhPrMT4KLqgwUwj9OxqlJkFGNQosMg/3EP5CW8/jtWnXvfEnr0Fi64WVQaioy9
 y0ixrQ5ligJ90rMSWGRNxH4R6z2ChuCiD3kP6eHfsvjM/xMDlcRtwXkXX5MusDaNzXbe
 rsM5RHksBxpwwpWH7gTpWFeJzEJR3V0wEqE10fEMzWHVom5IptD6BRnEviYjquEeVCyv
 uKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKJfP1L1JthCk9j8S3dyGmOEwjYZHFg6bDruhwKHIGY=;
 b=pRaHQHF2qTB7urwNtWfLMDg9B7LydhpHhEpMGKAXvd60SCg16d63Li/YmCjmVepGOQ
 yjEimSRkPBx03hGV1FCnBvYeNAUYYOf1JOu650AdGVsaVhAmjHH0q1n5/HYNYm+XgM+t
 IoE8okKDTG/6kN4LDoySTVL7LoC8Gt5/Ec/SdXS0gnUBPPgUBUZ5sCy5e8/tqbj9vezN
 PC5LDRL7pWb5MchnK5Viwpe3PTgYctbXEx9a6CZCjr2PKB322fRMoBYLXEUbjA1ITlok
 ZqGzdGXLKU9p4qo+TjFh0Mo/3Ru7ZgnaiflocmLtaesN00rg9K4p5VS2jwlkBIkbRmc4
 oe1Q==
X-Gm-Message-State: AOAM5308z3adRc+KjEBvQBicwrvK7uSO5nHv8iGzbSjiJdCPiztJpyRM
 fk1LKFNKw80Or7HZCpVqtPZpIWWhuBxH0eXb
X-Google-Smtp-Source: ABdhPJwSJiJXHoe0enH7brLt+w9PPiKQU82rMXTmAoUrKy672L1NO3hO+8GZyF1P85zuwkDP4TY1xw==
X-Received: by 2002:a05:6e02:1587:b0:2c2:5c48:a695 with SMTP id
 m7-20020a056e02158700b002c25c48a695mr2345492ilu.169.1650646645866; 
 Fri, 22 Apr 2022 09:57:25 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 58/68] target/nios2: Implement rdprs, wrprs
Date: Fri, 22 Apr 2022 09:52:28 -0700
Message-Id: <20220422165238.1971496-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12a.google.com
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

Implement these out of line, so that tcg global temps
(aka the architectural registers) are synced back to
tcg storage as required.  This makes sure that we get
the proper results when status.PRS == status.CRS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-55-richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/helper.h    |  2 ++
 target/nios2/op_helper.c | 16 +++++++++++
 target/nios2/translate.c | 57 ++++++++++++++++++++++++++++++++++++++--
 4 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f6efaa79b3..cca821cf80 100644
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
index 38a71a1f2d..a3164f5356 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -83,4 +83,20 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     env->pc = new_pc;
     cpu_loop_exit(cs);
 }
+
+/*
+ * RDPRS and WRPRS are implemented out of line so that if PRS == CRS,
+ * all of the tcg global temporaries are synced back to ENV.
+ */
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
index 363f2ea3ca..e566175db5 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -130,6 +130,7 @@ typedef struct DisasContext {
     uint32_t          tb_flags;
     TCGv              sink;
     const ControlRegState *cr_state;
+    bool              eic_present;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
@@ -387,6 +388,27 @@ gen_i_math_logic(andhi, andi, 0, imm_shifted)
 gen_i_math_logic(orhi , ori,  1, imm_shifted)
 gen_i_math_logic(xorhi, xori, 1, imm_shifted)
 
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
@@ -448,7 +470,7 @@ static const Nios2Instruction i_type_instructions[] = {
     INSTRUCTION_FLG(gen_stx, MO_SL),                  /* stwio */
     INSTRUCTION_FLG(gen_bxx, TCG_COND_LTU),           /* bltu */
     INSTRUCTION_FLG(gen_ldx, MO_UL),                  /* ldwio */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* rdprs */
+    INSTRUCTION(rdprs),                               /* rdprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(handle_r_type_instr, 0),          /* R-Type */
     INSTRUCTION_NOP(),                                /* flushd */
@@ -648,6 +670,36 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
+    /*
+     * The expected write to PRS[r0] is 0, from CRS[r0].
+     * If not, and CRS == PRS (which we cannot tell from here),
+     * we may now have a non-zero value in our current r0.
+     * By ending the TB, we re-evaluate tb_flags and find out.
+     */
+    if (instr.c == 0
+        && (instr.a != 0 || !FIELD_EX32(dc->tb_flags, TBFLAGS, R0_0))) {
+        dc->base.is_jmp = DISAS_UPDATE;
+    }
+#endif
+}
+
 /* Comparison instructions */
 static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
@@ -793,7 +845,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(slli),                                /* slli */
     INSTRUCTION(sll),                                 /* sll */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* wrprs */
+    INSTRUCTION(wrprs),                               /* wrprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(or),                                  /* or */
     INSTRUCTION(mulxsu),                              /* mulxsu */
@@ -895,6 +947,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
     dc->tb_flags = dc->base.tb->flags;
+    dc->eic_present = cpu->eic_present;
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
-- 
2.34.1


