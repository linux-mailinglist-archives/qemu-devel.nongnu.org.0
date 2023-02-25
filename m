Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CE6A2844
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqjc-0007Uf-6S; Sat, 25 Feb 2023 04:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqil-0005VH-N4
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:59 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqid-000325-9A
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:19:58 -0500
Received: by mail-pf1-x443.google.com with SMTP id n2so823510pfo.12
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzvuLiPTulpqjef9AIz3eAiRvCMSXM7BLBi2lfSXMN0=;
 b=rE7bLZgKrwe86b3F86Xv9nV9cPYkF9Erccq0iZhlFTglPDT4LHa0Lzs4wFD0+nrkSv
 gBpNQGEe0dxyN24RD+NoRu/enTlYwOctS/zSZdpJGMG1g8VbT4K3t0xK10NHZZ3nj4YO
 yO6AJvA7e9t9M/FUsi3aeq4MlFU7PQ3yWc6uzpohd1K1wsTS0PZarvKmWj8LQajw9Pq5
 no3i5k5nHi4HBekgRB83mjrg5y2Uij9p2MyYapr0JuzzVZlPkGmuAcLHz3rcVsnxlvGa
 NaKK6WMTd123HQb2D1bBKUlo40Moe5ZYCVsoIpfhIAzmeZyhg6j+Ragc10shuftQsgGE
 YJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzvuLiPTulpqjef9AIz3eAiRvCMSXM7BLBi2lfSXMN0=;
 b=TMJ70CytzhpIg5IxLgWJ1uL2XJPc3XoeLGppczPmGviuWAxLEHAjKHIQkEcUTeOfD2
 M3F+e2h+UyEqvfsz02dTZAvF6vXgblpJYZF7IsxUG6HN0Sko4iiiFMoEwaGlBMOhsoKa
 AQZ8VTpUQYS4ExKpDpqsUr6eSUH7QNPlFGy5wAgsfJZmmPswtNyjSLPLPqWa9jfquGsu
 3yWB+D15bpPc9cPt6cFODJqu8zddaIRoCyJwYJoRgJapzp6KR7/lqioFFFQg0y/qt6He
 FeI0CEmWLz7cq92zGaV2TxXh+rY1tOw28bAYJ5xzN34lm0yEVAoa4+eIf+GXKlkCxo0s
 IjIg==
X-Gm-Message-State: AO0yUKXOpVrdYS41PjXkrqAvdtdSSXcAleBxak1GGLvNmWT9Ts9ZYd1D
 1hMcSZO1P9SzAffiF3VNfeGZ80dnHuvvWkEt7yaB7A==
X-Google-Smtp-Source: AK7set+w9Ei8bUiBqE0JRvz3wI8dK0q5UeJ1qaiI2PbnxkymUE9+hXhPCiQez9JsF9I1jWMivGc4Tg==
X-Received: by 2002:aa7:8bcf:0:b0:5db:4373:c3c0 with SMTP id
 s15-20020aa78bcf000000b005db4373c3c0mr8333704pfd.26.1677316788297; 
 Sat, 25 Feb 2023 01:19:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 52/76] target/riscv: Drop temp_new
Date: Fri, 24 Feb 2023 23:14:03 -1000
Message-Id: <20230225091427.1817156-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                  | 30 +++++------------------
 target/riscv/insn_trans/trans_rvzfh.c.inc |  2 +-
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 273e566d66..b5d8080a6f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -101,11 +101,8 @@ typedef struct DisasContext {
     bool cfg_vta_all_1s;
     target_ulong vstart;
     bool vl_eq_vlmax;
-    uint8_t ntemp;
     CPUState *cs;
     TCGv zero;
-    /* Space for 3 operands plus 1 extra for address computation. */
-    TCGv temp[4];
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
@@ -312,12 +309,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
  *
  * Further, we may provide an extension for word operations.
  */
-static TCGv temp_new(DisasContext *ctx)
-{
-    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
-    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
-}
-
 static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
     TCGv t;
@@ -332,11 +323,11 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
         case EXT_NONE:
             break;
         case EXT_SIGN:
-            t = temp_new(ctx);
+            t = tcg_temp_new();
             tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
             return t;
         case EXT_ZERO:
-            t = temp_new(ctx);
+            t = tcg_temp_new();
             tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
             return t;
         default:
@@ -364,7 +355,7 @@ static TCGv get_gprh(DisasContext *ctx, int reg_num)
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
-        return temp_new(ctx);
+        return tcg_temp_new();
     }
     return cpu_gpr[reg_num];
 }
@@ -372,7 +363,7 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 static TCGv dest_gprh(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0) {
-        return temp_new(ctx);
+        return tcg_temp_new();
     }
     return cpu_gprh[reg_num];
 }
@@ -575,7 +566,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 /* Compute a canonical address from a register plus offset. */
 static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 {
-    TCGv addr = temp_new(ctx);
+    TCGv addr = tcg_temp_new();
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
@@ -593,7 +584,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 /* Compute a canonical address from a register plus reg offset. */
 static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 {
-    TCGv addr = temp_new(ctx);
+    TCGv addr = tcg_temp_new();
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_add_tl(addr, src1, offs);
@@ -1196,8 +1187,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
-    ctx->ntemp = 0;
-    memset(ctx->temp, 0, sizeof(ctx->temp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1222,18 +1211,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
     uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
-    int i;
 
     ctx->ol = ctx->xl;
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-    for (i = ctx->ntemp - 1; i >= 0; --i) {
-        tcg_temp_free(ctx->temp[i]);
-        ctx->temp[i] = NULL;
-    }
-    ctx->ntemp = 0;
-
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
         if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 2ad5716312..5024e6ecab 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -52,7 +52,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
-        TCGv temp = temp_new(ctx);
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, t0, a->imm);
         t0 = temp;
     }
-- 
2.34.1


