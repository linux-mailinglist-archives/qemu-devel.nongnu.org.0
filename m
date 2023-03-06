Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394276AB417
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyy5-0003I6-9N; Sun, 05 Mar 2023 19:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx8-0000qh-Eo
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:48 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx5-0007GQ-Ut
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:46 -0500
Received: by mail-pl1-x644.google.com with SMTP id y11so8544419plg.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdPPRbaCNNHWIsXkOQaWdidB/DH3UtAU4KFq4pgTImI=;
 b=fG6Zi5MQJAhHDRF4M5Se1Fte/syqElWEJk7jN2w8GsHlFl0Vcwo4CzVBGMYnsNOyNm
 2w+UjgLtdRoen+MJoTtTrZnTsBx4BOOD6vewiXa7c41t1HC17Y9q1CdA7sQWCIuNrq6D
 tOiVuIGACgeowbfbfdjLb5CV8cdiVlxUILHuwaZnJWry+/hD+45R1K2pPPH+KtsrmGBf
 0gEfgZQbpNrG6zZ/DCiuohYvY3K+4lKkVygPwq02GfoN3ROhBNhlj174suXKSyk325gt
 IomGg/epKNDCSPUqVyt8j8RJGhI/vlirUhHTFOLFk16xB881NVzJjfSn+PcogCRuX7X0
 dEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdPPRbaCNNHWIsXkOQaWdidB/DH3UtAU4KFq4pgTImI=;
 b=OPd1hurErnBvmhZFs1PL2mEqLvp9VFT0YnU0SEpa8rfYZVI5WEpmvLcjZtTeQReDZE
 poRAlfBVioeLMP/DdJ33r04YPudtzXveNPEfqBGGjZ+jGR5zHNDi1JSWinXlwu6mNHw4
 wB9F+DBXN3HfXmPtyFOHmJq6ObDBnB7XHj1+xIfcWIpU/v+fxSt+DgDMu9O3JUCXGhTO
 mePJHetAicvji8DsSXvOxb6g7+dByBoc30umZCFfTL7wUSkaCrR5ISfEiDC8i5Llxf35
 KUU6mVCD7Im4+H4COR4zraIsrU9fP++Cybb6SAU8V0raS31ON++D9UJSrY3x/W220JgK
 Ha9A==
X-Gm-Message-State: AO0yUKXGLYpyWFCAqChc6d92atzrAIM+v6gnv1z0iTFN2CljYJlfwHxY
 RJjQw+QAFMbiLkwjcHJPnMREKiIzxlllhNkJdWRrLvmy
X-Google-Smtp-Source: AK7set//clL7lSAxiT3C3xtqau+L1PPX/CbhnBGuL9DWQeaJvboh647k0fW8G0/4zS3sHbXoNbdqjg==
X-Received: by 2002:a05:6a20:158c:b0:cc:cb28:382f with SMTP id
 h12-20020a056a20158c00b000cccb28382fmr11121230pzj.26.1678063421944; 
 Sun, 05 Mar 2023 16:43:41 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 51/84] target/riscv: Drop temp_new
Date: Sun,  5 Mar 2023 16:39:21 -0800
Message-Id: <20230306003954.1866998-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                  | 30 +++++------------------
 target/riscv/insn_trans/trans_rvzfh.c.inc |  2 +-
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7ed625a36f..747989ecad 100644
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
@@ -1197,8 +1188,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
-    ctx->ntemp = 0;
-    memset(ctx->temp, 0, sizeof(ctx->temp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1223,18 +1212,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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
index 85fc1aa822..f0d4df05f0 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -51,7 +51,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
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


