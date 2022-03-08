Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6A4D1150
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:52:49 +0100 (CET)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUeG-0003sB-6V
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9N-0005Kk-PD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:53 -0500
Received: from [2607:f8b0:4864:20::62e] (port=38656
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9K-0006Tv-ML
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:53 -0500
Received: by mail-pl1-x62e.google.com with SMTP id t19so12715892plr.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdR/1qr7iMJaAgIBHcAAReYqxBpkpXyTqeWj+X7iF1U=;
 b=Ll/TIwAZRt/mD4ziscINKMCXcu7wupqCELJd7j7LVAaS0csXCRcCTRdho6mKjFDY/U
 JzGAJ/sbdIdyWnIq9RkpJNH1P27Hf4gGUrv+znavqsN0ZhejVBCYZTvF43BrhoHqW5ER
 D3ugyan5fnGCjA7Bjv2dpHl29N4BU5ReXjexuaGtsPbruuaHjPBniWqkmu585i0/ZMCb
 yo6Ndrr5KPJ4gWoAmuhu9zrghNafXmn3o0soZy9GpHNyx3pkCRr6rKabp1xwIfBi8Ul4
 vuSvwGowSN+ff/FL7lfbEFkzelbqvP+mRl0nptlmmN+/D8rxl6tcNYS7v3PzOvR2AmHX
 fiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdR/1qr7iMJaAgIBHcAAReYqxBpkpXyTqeWj+X7iF1U=;
 b=tr0aPIdSUT9uJ0BANkUloIKHgaDB7sQTJolVnWHipdxyypLddRSH7NSDpnR9Mp/3vs
 7tBnQvXvb0Rjsjz9VeRV/xyf7OBlNob2dBv6f2XmTgwP+OARgwxhdZl3TS5T9bTu4N6u
 hH+qelDmh/jYqg+sM/F5wvbOiO/fJwqcoBg4okqNQgscGEdCAamo+vLybL+Ky27YNOoX
 Mxri6Gc7N/3gRK+dFfRQIzj/Y57mnrYc8CwBUlECxmImAJEbvG7kMzpRfFg3Z2IgqkWO
 AdFu1k+/y4oG0WPfJyyQFln53SH40ir00rjvabB19usIV/yinuaiYeDddmnPBfrarOxJ
 yD1w==
X-Gm-Message-State: AOAM5329bToKl2oxxCRlcPKYDNdg1d5Ak4IzpT71b3Ib1IpBCsjYUW+w
 GQwrCBc1OFvO0w5mwOvs5WuJnoln12p/1g==
X-Google-Smtp-Source: ABdhPJwbK7Qh9/AU4PWIK7YEHcE9F973QhiwxRQorwQQwb7aY/SxihIlG+XLsrF7YT/JSBErBMpQ7A==
X-Received: by 2002:a17:902:9682:b0:14e:fe33:64af with SMTP id
 n2-20020a170902968200b0014efe3364afmr15978069plp.160.1646724049214; 
 Mon, 07 Mar 2022 23:20:49 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/33] target/nios2: Implement rdprs, wrprs
Date: Mon,  7 Mar 2022 21:19:57 -1000
Message-Id: <20220308072005.307955-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
storage as required.  This makes sure that we get the
proper results when status.PRS == status.CRS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  2 ++
 target/nios2/helper.h    |  2 ++
 target/nios2/op_helper.c | 12 ++++++++++
 target/nios2/translate.c | 47 ++++++++++++++++++++++++++++++++++++++--
 4 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f05536e04d..efaac274aa 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -237,6 +237,8 @@ struct Nios2CPU {
     CPUNios2State env;
 
     bool mmu_present;
+    bool eic_present;
+
     uint32_t pid_num_bits;
     uint32_t tlb_num_ways;
     uint32_t tlb_num_entries;
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 02797c384d..a8edca5194 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -22,6 +22,8 @@ DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(eret, noreturn, env, i32)
+DEF_HELPER_FLAGS_2(rdprs, TCG_CALL_NO_WG, i32, env, i32)
+DEF_HELPER_3(wrprs, void, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a1554ce349..e656986e3c 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -38,4 +38,16 @@ void helper_eret(CPUNios2State *env, uint32_t new_pc)
     env->pc = new_pc;
     cpu_loop_exit(env_cpu(env));
 }
+
+uint32_t helper_rdprs(CPUNios2State *env, uint32_t regno)
+{
+    unsigned prs = FIELD_EX32(env->status, CR_STATUS, PRS);
+    return env->shadow_regs[prs][regno];
+}
+
+void helper_wrprs(CPUNios2State *env, uint32_t regno, uint32_t val)
+{
+    unsigned prs = FIELD_EX32(env->status, CR_STATUS, PRS);
+    env->shadow_regs[prs][regno] = val;
+}
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 57913da3c9..7730735639 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -103,6 +103,7 @@ typedef struct DisasContext {
     bool              crs0;
     TCGv              sink;
     const ControlRegState *cr_state;
+    bool              eic_present;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
@@ -305,6 +306,27 @@ gen_i_math_logic(andhi, andi, 0, instr.imm16.u << 16)
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
@@ -366,7 +388,7 @@ static const Nios2Instruction i_type_instructions[] = {
     INSTRUCTION_FLG(gen_stx, MO_SL),                  /* stwio */
     INSTRUCTION_FLG(gen_bxx, TCG_COND_LTU),           /* bltu */
     INSTRUCTION_FLG(gen_ldx, MO_UL),                  /* ldwio */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* rdprs */
+    INSTRUCTION(rdprs),                               /* rdprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(handle_r_type_instr, 0),          /* R-Type */
     INSTRUCTION_NOP(),                                /* flushd */
@@ -552,6 +574,26 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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
@@ -690,7 +732,7 @@ static const Nios2Instruction r_type_instructions[] = {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(slli),                                /* slli */
     INSTRUCTION(sll),                                 /* sll */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* wrprs */
+    INSTRUCTION(wrprs),                               /* wrprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(or),                                  /* or */
     INSTRUCTION(mulxsu),                              /* mulxsu */
@@ -791,6 +833,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
+    dc->eic_present = cpu->eic_present;
     dc->crs0 = FIELD_EX32(dc->base.tb->flags, TBFLAGS, CRS0);
 
     /* Bound the number of insns to execute to those left on the page.  */
-- 
2.25.1


