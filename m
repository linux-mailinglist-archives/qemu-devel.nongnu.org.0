Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119126B2E5F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:16:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa1-0003Q4-0U; Thu, 09 Mar 2023 15:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZw-0003Dv-L1
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:32 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZu-0001UX-5I
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:32 -0500
Received: by mail-pl1-x629.google.com with SMTP id i5so3234501pla.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmYtNEOQ8sB74QpilprPqga1omIIlxb74s+3Tcbk60I=;
 b=LWWEUYyLcvv2wOMa8broFLmEF/qa5f6KyCUGksjBHpsXAAJs/UrEffsJJv9FwWCFwu
 bmwsyLocTWpZXHQU6jUJ3ECww4AtyxnBZSJI9iZhqnsVI5WEfzgPY+1iuL9ieCTtogRS
 4TV2qE7OP3qk+EkYnvj2Es/xnFxSLrKZmefcEECqtr6qgI9/KNYBcnueheB0YcHvZBty
 ghmdLtcj9v3XKLxyGbvx9FA7pFBLhtc/TyF6mUPfUgFSQcN6sae8qcBgIA29Dq1KzKVk
 VGTwairk3jaHsS/Y4hnL++U1TNwVeP6liSgDt13peWCLPvOlSwnwpudNpA8l1L8S/rKC
 5RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NmYtNEOQ8sB74QpilprPqga1omIIlxb74s+3Tcbk60I=;
 b=b7rPw+1Ns0KyrzkN9wHfrxdjxBnhHv8JfOz41ulV/Cf3FzhK4wVq3RamNySv6iSc8p
 8N26bMbSC4q0ujUzkHRep/0w5JPKIoDZBtAF271XGsJrA8S4Fwq6NaJQxYfNkQLGVjpP
 c4+G5u7x8ocntJQKVeaxqr3bDJnh5M3K+WS1QAinngh/ivYcmTKrAedE7v4iN+Rk+bQe
 kOkShRdJvzPxHI1sbGasLabW6cUa2HIGT9Ce7RFR0jX8Egriz0isClg4nSE0w9QMztqm
 Ic+As2yJlDwVlPGThFrVpvqAYIdGU6OZchQSZne9QA6Sw/dkyRSDa++PCJEey7EflmTc
 y/Xw==
X-Gm-Message-State: AO0yUKVUMTbhFeAF5I7qwduLw5hZZ+XGW7Fc/NtXHdmnOsVRk2hfR5Ku
 gWx8Np5elRwy07zM5Fv1y/zX0dmdvZEm0QvKZTk=
X-Google-Smtp-Source: AK7set8nTW74TYzVd1z55MdFcB+2EMJq53VVPTPFK6ps3MzVgnPIT5vlyKAok3gEEFH0Vuq2KI2M3A==
X-Received: by 2002:a17:903:1c9:b0:19e:6fd5:f4fa with SMTP id
 e9-20020a17090301c900b0019e6fd5f4famr23993564plh.69.1678392568697; 
 Thu, 09 Mar 2023 12:09:28 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 41/91] target/cris: Avoid use of tcg_const_i32 throughout
Date: Thu,  9 Mar 2023 12:05:00 -0800
Message-Id: <20230309200550.3878088-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 46 +++++++++++++++------------------
 target/cris/translate_v10.c.inc | 26 +++++++++----------
 2 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 5172c9b9b2..b2beb9964d 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -175,10 +175,7 @@ static const int preg_sizes[] = {
 #define t_gen_mov_env_TN(member, tn) \
     tcg_gen_st_tl(tn, cpu_env, offsetof(CPUCRISState, member))
 #define t_gen_movi_env_TN(member, c) \
-    do { \
-        TCGv tc = tcg_const_tl(c); \
-        t_gen_mov_env_TN(member, tc); \
-    } while (0)
+    t_gen_mov_env_TN(member, tcg_constant_tl(c))
 
 static inline void t_gen_mov_TN_preg(TCGv tn, int r)
 {
@@ -268,8 +265,7 @@ static void cris_lock_irq(DisasContext *dc)
 
 static inline void t_gen_raise_exception(uint32_t index)
 {
-        TCGv_i32 tmp = tcg_const_i32(index);
-        gen_helper_raise_exception(cpu_env, tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
 }
 
 static void t_gen_lsl(TCGv d, TCGv a, TCGv b)
@@ -277,7 +273,7 @@ static void t_gen_lsl(TCGv d, TCGv a, TCGv b)
     TCGv t0, t_31;
 
     t0 = tcg_temp_new();
-    t_31 = tcg_const_tl(31);
+    t_31 = tcg_constant_tl(31);
     tcg_gen_shl_tl(d, a, b);
 
     tcg_gen_sub_tl(t0, t_31, b);
@@ -1250,7 +1246,7 @@ static int dec_addq(CPUCRISState *env, DisasContext *dc)
 
     cris_cc_mask(dc, CC_MASK_NZVC);
 
-    c = tcg_const_tl(dc->op1);
+    c = tcg_constant_tl(dc->op1);
     cris_alu(dc, CC_OP_ADD,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
     return 2;
@@ -1274,7 +1270,7 @@ static int dec_subq(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("subq %u, $r%u\n", dc->op1, dc->op2);
 
     cris_cc_mask(dc, CC_MASK_NZVC);
-    c = tcg_const_tl(dc->op1);
+    c = tcg_constant_tl(dc->op1);
     cris_alu(dc, CC_OP_SUB,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
     return 2;
@@ -1289,7 +1285,7 @@ static int dec_cmpq(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("cmpq %d, $r%d\n", imm, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZVC);
 
-    c = tcg_const_tl(imm);
+    c = tcg_constant_tl(imm);
     cris_alu(dc, CC_OP_CMP,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
     return 2;
@@ -1304,7 +1300,7 @@ static int dec_andq(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("andq %d, $r%d\n", imm, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
 
-    c = tcg_const_tl(imm);
+    c = tcg_constant_tl(imm);
     cris_alu(dc, CC_OP_AND,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
     return 2;
@@ -1318,7 +1314,7 @@ static int dec_orq(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("orq %d, $r%d\n", imm, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
 
-    c = tcg_const_tl(imm);
+    c = tcg_constant_tl(imm);
     cris_alu(dc, CC_OP_OR,
             cpu_R[dc->op2], cpu_R[dc->op2], c, 4);
     return 2;
@@ -1330,7 +1326,7 @@ static int dec_btstq(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("btstq %u, $r%d\n", dc->op1, dc->op2);
 
     cris_cc_mask(dc, CC_MASK_NZ);
-    c = tcg_const_tl(dc->op1);
+    c = tcg_constant_tl(dc->op1);
     cris_evaluate_flags(dc);
     gen_helper_btst(cpu_PR[PR_CCS], cpu_env, cpu_R[dc->op2],
             c, cpu_PR[PR_CCS]);
@@ -1945,8 +1941,8 @@ static int dec_move_rs(CPUCRISState *env, DisasContext *dc)
 {
     TCGv c2, c1;
     LOG_DIS("move $r%u, $s%u\n", dc->op1, dc->op2);
-    c1 = tcg_const_tl(dc->op1);
-    c2 = tcg_const_tl(dc->op2);
+    c1 = tcg_constant_tl(dc->op1);
+    c2 = tcg_constant_tl(dc->op2);
     cris_cc_mask(dc, 0);
     gen_helper_movl_sreg_reg(cpu_env, c2, c1);
     return 2;
@@ -1955,8 +1951,8 @@ static int dec_move_sr(CPUCRISState *env, DisasContext *dc)
 {
     TCGv c2, c1;
     LOG_DIS("move $s%u, $r%u\n", dc->op2, dc->op1);
-    c1 = tcg_const_tl(dc->op1);
-    c2 = tcg_const_tl(dc->op2);
+    c1 = tcg_constant_tl(dc->op1);
+    c2 = tcg_constant_tl(dc->op2);
     cris_cc_mask(dc, 0);
     gen_helper_movl_reg_sreg(cpu_env, c1, c2);
     return 2;
@@ -2237,7 +2233,7 @@ static int dec_test_m(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, CC_MASK_NZ);
     tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);
 
-    c = tcg_const_tl(0);
+    c = tcg_constant_tl(0);
     cris_alu(dc, CC_OP_CMP,
          cpu_R[dc->op2], t[1], c, memsize_zz(dc));
     do_postinc(dc, memsize);
@@ -2582,7 +2578,7 @@ static int dec_jas_r(CPUCRISState *env, DisasContext *dc)
     if (dc->op2 > 15) {
         abort();
     }
-    c = tcg_const_tl(dc->pc + 4);
+    c = tcg_constant_tl(dc->pc + 4);
     t_gen_mov_preg_TN(dc, dc->op2, c);
 
     cris_prepare_jmp(dc, JMP_INDIRECT);
@@ -2598,7 +2594,7 @@ static int dec_jas_im(CPUCRISState *env, DisasContext *dc)
 
     LOG_DIS("jas 0x%x\n", imm);
     cris_cc_mask(dc, 0);
-    c = tcg_const_tl(dc->pc + 8);
+    c = tcg_constant_tl(dc->pc + 8);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
 
@@ -2616,7 +2612,7 @@ static int dec_jasc_im(CPUCRISState *env, DisasContext *dc)
 
     LOG_DIS("jasc 0x%x\n", imm);
     cris_cc_mask(dc, 0);
-    c = tcg_const_tl(dc->pc + 8 + 4);
+    c = tcg_constant_tl(dc->pc + 8 + 4);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
 
@@ -2632,7 +2628,7 @@ static int dec_jasc_r(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, 0);
     /* Store the return address in Pd.  */
     tcg_gen_mov_tl(env_btarget, cpu_R[dc->op1]);
-    c = tcg_const_tl(dc->pc + 4 + 4);
+    c = tcg_constant_tl(dc->pc + 4 + 4);
     t_gen_mov_preg_TN(dc, dc->op2, c);
     cris_prepare_jmp(dc, JMP_INDIRECT);
     return 2;
@@ -2664,7 +2660,7 @@ static int dec_bas_im(CPUCRISState *env, DisasContext *dc)
 
     LOG_DIS("bas 0x%x, $p%u\n", dc->pc + simm, dc->op2);
     cris_cc_mask(dc, 0);
-    c = tcg_const_tl(dc->pc + 8);
+    c = tcg_constant_tl(dc->pc + 8);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
 
@@ -2681,7 +2677,7 @@ static int dec_basc_im(CPUCRISState *env, DisasContext *dc)
 
     LOG_DIS("basc 0x%x, $p%u\n", dc->pc + simm, dc->op2);
     cris_cc_mask(dc, 0);
-    c = tcg_const_tl(dc->pc + 12);
+    c = tcg_constant_tl(dc->pc + 12);
     /* Store the return address in Pd.  */
     t_gen_mov_preg_TN(dc, dc->op2, c);
 
@@ -2695,7 +2691,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
     cris_cc_mask(dc, 0);
 
     if (dc->op2 == 15) {
-        tcg_gen_st_i32(tcg_const_i32(1), cpu_env,
+        tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
                        -offsetof(CRISCPU, env) + offsetof(CPUState, halted));
         tcg_gen_movi_tl(env_pc, dc->pc + 2);
         t_gen_raise_exception(EXCP_HLT);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index b03b2ef746..32338bb69b 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -251,7 +251,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             LOG_DIS("moveq %d, $r%d\n", simm, dc->dst);
 
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(simm);
+            c = tcg_constant_tl(simm);
             cris_alu(dc, CC_OP_MOVE, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -259,7 +259,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             LOG_DIS("cmpq %d, $r%d\n", simm, dc->dst);
 
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(simm);
+            c = tcg_constant_tl(simm);
             cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -267,7 +267,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             LOG_DIS("addq %d, $r%d\n", imm, dc->dst);
 
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(imm);
+            c = tcg_constant_tl(imm);
             cris_alu(dc, CC_OP_ADD, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -275,7 +275,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
 
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(simm);
+            c = tcg_constant_tl(simm);
             cris_alu(dc, CC_OP_AND, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -285,7 +285,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             cris_cc_mask(dc, CC_MASK_NZVC);
             op = imm & (1 << 5);
             imm &= 0x1f;
-            c = tcg_const_tl(imm);
+            c = tcg_constant_tl(imm);
             if (op) {
                 cris_alu(dc, CC_OP_ASR, cpu_R[dc->dst],
                           cpu_R[dc->dst], c, 4);
@@ -305,7 +305,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             }
             imm &= 0x1f;
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(imm);
+            c = tcg_constant_tl(imm);
             cris_alu(dc, op, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -313,7 +313,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             LOG_DIS("subq %d, $r%d\n", imm, dc->dst);
 
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(imm);
+            c = tcg_constant_tl(imm);
             cris_alu(dc, CC_OP_SUB, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -321,7 +321,7 @@ static unsigned int dec10_quick_imm(DisasContext *dc)
             LOG_DIS("andq %d, $r%d\n", simm, dc->dst);
 
             cris_cc_mask(dc, CC_MASK_NZVC);
-            c = tcg_const_tl(simm);
+            c = tcg_constant_tl(simm);
             cris_alu(dc, CC_OP_OR, cpu_R[dc->dst],
                      cpu_R[dc->dst], c, 4);
             break;
@@ -1014,7 +1014,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 cris_alu_m_alloc_temps(t);
                 insn_len += dec10_prep_move_m(env, dc, 0, size, t[0]);
                 tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~3);
-                c = tcg_const_tl(0);
+                c = tcg_constant_tl(0);
                 cris_alu(dc, CC_OP_CMP, cpu_R[dc->dst],
                          t[0], c, size);
                 break;
@@ -1111,7 +1111,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 if (dc->mode == CRISV10_MODE_AUTOINC)
                     insn_len += size;
 
-                c = tcg_const_tl(dc->pc + insn_len);
+                c = tcg_constant_tl(dc->pc + insn_len);
                 t_gen_mov_preg_TN(dc, dc->dst, c);
                 dc->jmp_pc = imm;
                 cris_prepare_jmp(dc, JMP_DIRECT);
@@ -1121,7 +1121,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                     LOG_DIS("break %d\n", dc->src);
                     cris_evaluate_flags(dc);
                     tcg_gen_movi_tl(env_pc, dc->pc + 2);
-                    c = tcg_const_tl(dc->src + 2);
+                    c = tcg_constant_tl(dc->src + 2);
                     t_gen_mov_env_TN(trap_vector, c);
                     t_gen_raise_exception(EXCP_BREAK);
                     dc->base.is_jmp = DISAS_NORETURN;
@@ -1130,7 +1130,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
                 LOG_DIS("%d: jump.%d %d r%d r%d\n", __LINE__, size,
                          dc->opcode, dc->src, dc->dst);
                 t[0] = tcg_temp_new();
-                c = tcg_const_tl(dc->pc + insn_len);
+                c = tcg_constant_tl(dc->pc + insn_len);
                 t_gen_mov_preg_TN(dc, dc->dst, c);
                 crisv10_prepare_memaddr(dc, t[0], size);
                 gen_load(dc, env_btarget, t[0], 4, 0);
@@ -1153,7 +1153,7 @@ static unsigned int dec10_ind(CPUCRISState *env, DisasContext *dc)
             LOG_DIS("jmp pc=%x opcode=%d r%d r%d\n",
                         dc->pc, dc->opcode, dc->dst, dc->src);
             tcg_gen_mov_tl(env_btarget, cpu_R[dc->src]);
-            c = tcg_const_tl(dc->pc + insn_len);
+            c = tcg_constant_tl(dc->pc + insn_len);
             t_gen_mov_preg_TN(dc, dc->dst, c);
             cris_prepare_jmp(dc, JMP_INDIRECT);
             dc->delayed_branch--; /* v10 has no dslot here.  */
-- 
2.34.1


