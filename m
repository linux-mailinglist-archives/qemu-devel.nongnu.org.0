Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5142B32F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:11:40 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUg8-0003nR-00
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI5-000526-Td
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:50 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI4-0005E5-2i
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:49 -0400
Received: by mail-pf1-x435.google.com with SMTP id o133so1148151pfg.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LZhYgL8dMORR9XrCtBiZKLLwKJx6Df6PYPQ06N0xS2k=;
 b=q9ZGXrOxdxcXJJRixktzA2UIoPUK1bQ6+D4NdYiHlELlHiGUzoL358i5HfGD4KWrhG
 zthyLlrMsRvm0kavODDuM/t5+iPHMEZaLLEfrPFnGjN69iMMey1ID5minTkeVbhtisdp
 F0bkIWJXux6mEO2+pFyiY/Wcj/pA5JQKatzGFdJsRTe0VGHq7wxkVzlW+/Qz6TJxjev/
 ylQN0/M2lacG96qr/PfiyVGLOsXiVZv0Bv0p2x4XkrTUMa4/+d+FrMoYhfLz4t7H2eNF
 0ExCGMh/wB8bR596aTGaDsoY5gq//OoXPrsBi+3kZ16RJkZtgcqhOpyPyraA4vghRr13
 H0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZhYgL8dMORR9XrCtBiZKLLwKJx6Df6PYPQ06N0xS2k=;
 b=iPJ9tL04GryL1UAS+WSnX8z1FMpFV+81/RxvINtPE6otBBb3/49YKdxY+4nfUdaOf3
 0qhSmQG5YqquU2yMEuMJh6LDsbp4U+9zcas3XG/mak3K7y7dom6EvXXv0ZzHC4y2qDpI
 jxgtv8UFojUVZ+CJGR6ySxjyPovkYXx4PiB72Hx9ex8dvzI51rMjGoGYLBKScdt+1w63
 ljma3PMbC2hR8ApDHP/QMzDY9FF75tVwVfhJUvFQku+4eLm9iar7RfCO1DuwVOSJAfi4
 ArmRYlFpCSME3nG3nLV3MceSzfXxvzUOjgIHePrU59qtctYVguf+jZjoSU4FkreolA/a
 eJrg==
X-Gm-Message-State: AOAM533YOVAWYGBlhrQ65KZwa0FkKykfiA3yfjs/Rzo2akuYAaiDIA0y
 /BBUJckrapQF6i/6mB4+wG3qfRyyolQwfg==
X-Google-Smtp-Source: ABdhPJzW+wsfyhNH7oM5tTMvzSz1tdq9cXjQxgWtUZRM+2TzjI+UN3vlObeeGWczrmR59/OV2hzyRw==
X-Received: by 2002:a63:7d42:: with SMTP id m2mr25765641pgn.349.1634093206405; 
 Tue, 12 Oct 2021 19:46:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 37/48] target/alpha: Implement prctl_unalign_sigbus
Date: Tue, 12 Oct 2021 19:45:56 -0700
Message-Id: <20211013024607.731881-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
flag to set MO_UNALN for the instructions that the kernel
handles in the unaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_prctl.h |  2 +-
 target/alpha/cpu.h              |  5 +++++
 target/alpha/translate.c        | 31 ++++++++++++++++++++++---------
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/linux-user/alpha/target_prctl.h b/linux-user/alpha/target_prctl.h
index eb53b31ad5..5629ddbf39 100644
--- a/linux-user/alpha/target_prctl.h
+++ b/linux-user/alpha/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d49cc36d07..da5ccf7b63 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -386,6 +386,8 @@ enum {
 #define ENV_FLAG_TB_MASK \
     (ENV_FLAG_PAL_MODE | ENV_FLAG_PS_USER | ENV_FLAG_FEN)
 
+#define TB_FLAG_UNALIGN       (1u << 1)
+
 static inline int cpu_mmu_index(CPUAlphaState *env, bool ifetch)
 {
     int ret = env->flags & ENV_FLAG_PS_USER ? MMU_USER_IDX : MMU_KERNEL_IDX;
@@ -468,6 +470,9 @@ static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
     *pflags = env->flags & ENV_FLAG_TB_MASK;
+#ifdef CONFIG_USER_ONLY
+    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
 }
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 0eee3a1bcc..2656037b8b 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -45,7 +45,9 @@ typedef struct DisasContext DisasContext;
 struct DisasContext {
     DisasContextBase base;
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    MemOp unalign;
+#else
     uint64_t palbr;
 #endif
     uint32_t tbflags;
@@ -68,6 +70,12 @@ struct DisasContext {
     TCGv sink;
 };
 
+#ifdef CONFIG_USER_ONLY
+#define UNALIGN(C)  (C)->unalign
+#else
+#define UNALIGN(C)  0
+#endif
+
 /* Target-specific return values from translate_one, indicating the
    state of the TB.  Note that DISAS_NEXT indicates that we are not
    exiting the TB.  */
@@ -270,7 +278,7 @@ static inline DisasJumpType gen_invalid(DisasContext *ctx)
 static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     gen_helper_memory_to_f(dest, tmp32);
     tcg_temp_free_i32(tmp32);
 }
@@ -278,7 +286,7 @@ static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
 static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv tmp = tcg_temp_new();
-    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
     gen_helper_memory_to_g(dest, tmp);
     tcg_temp_free(tmp);
 }
@@ -286,14 +294,14 @@ static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
 static void gen_lds(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     gen_helper_memory_to_s(dest, tmp32);
     tcg_temp_free_i32(tmp32);
 }
 
 static void gen_ldt(DisasContext *ctx, TCGv dest, TCGv addr)
 {
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
 }
 
 static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
@@ -324,6 +332,8 @@ static void gen_load_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
     tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     if (clear) {
         tcg_gen_andi_i64(addr, addr, ~0x7);
+    } else if (!locked) {
+        op |= UNALIGN(ctx);
     }
 
     dest = ctx->ir[ra];
@@ -340,7 +350,7 @@ static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     gen_helper_f_to_memory(tmp32, addr);
-    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     tcg_temp_free_i32(tmp32);
 }
 
@@ -348,7 +358,7 @@ static void gen_stg(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv tmp = tcg_temp_new();
     gen_helper_g_to_memory(tmp, src);
-    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
     tcg_temp_free(tmp);
 }
 
@@ -356,13 +366,13 @@ static void gen_sts(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
     gen_helper_s_to_memory(tmp32, src);
-    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
     tcg_temp_free_i32(tmp32);
 }
 
 static void gen_stt(DisasContext *ctx, TCGv src, TCGv addr)
 {
-    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
 }
 
 static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
@@ -383,6 +393,8 @@ static void gen_store_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
     tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
     if (clear) {
         tcg_gen_andi_i64(addr, addr, ~0x7);
+    } else {
+        op |= UNALIGN(ctx);
     }
 
     src = load_gpr(ctx, ra);
@@ -2942,6 +2954,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
 #ifdef CONFIG_USER_ONLY
     ctx->ir = cpu_std_ir;
+    ctx->unalign = (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->palbr = env->palbr;
     ctx->ir = (ctx->tbflags & ENV_FLAG_PAL_MODE ? cpu_pal_ir : cpu_std_ir);
-- 
2.25.1


