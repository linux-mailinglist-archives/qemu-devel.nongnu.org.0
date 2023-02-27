Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12246A3AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW6i-0007SN-JO; Mon, 27 Feb 2023 00:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5w-0003ZD-1K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:43 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5q-0000Ze-H1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:39 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so8930670pjh.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXzb0wguddcKP79wDFGGeUAakOtFrc7V197g1pVsdMU=;
 b=LR3Mov5ufwrZg1ODnQVmMK4M0FtsCmAzOG1+uiLQNlDF4J9efiw6Bi3CcRDaki5huj
 PVO32AD78ep8HoEVCBENqpEDpwKlNO3+U9e3GTR3pp8nqcWeMD7T0v7fDrC1o89b2zgz
 Zd5oou/HAfJBG/Qe1laK0Mv2RWA02WxTvAC6nPYQ+koh/fkE40gFIhwj/utfgsRVJAZz
 JMNLhqQOG9eOFlJgth5EdpxKaQLjOgnOmcKKPJx3DV+ItJsUVK5LxgItISB/n59i0f/V
 PmfQzM1yrui3XydvKN/KeK5yQTwAR8WemDHcCK3taQFO4vKa3JznZGceie9l6MigzuWu
 7E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXzb0wguddcKP79wDFGGeUAakOtFrc7V197g1pVsdMU=;
 b=V8gqxI+paMK6ISMzTmxLiGXTXMv5vwl2+hlFY22CbfXT7eXKvq/NojDojoQWw+ybfK
 Yw33tB2XbbdrSA351Pnl39uQmzHH274PhymlRWWKO7vzt3V4YRn/3ZMcK+k0WZ5tVG+z
 zEjZOOx05UOMU7io17VXzbH97eXvuXPN6kOWLg7UTaWWT6yPcDaXVVxBfbYc59HRtoA9
 CBJhFdmywD1HT98ZD2T1Gr/Vt1qxSesZYJDhyh25X6Qy87sstKkxdkSieTMH/XGILD5J
 3wylpwR5wED92AP4A6kXKp7yXFmN3LWfs7i13pAFxMVWG1h19Gps1pC9jjtse40NBVaP
 c+YQ==
X-Gm-Message-State: AO0yUKXCEI/FCC5sRhImnGWfaIbA4XGrWPNQIeWrtT+UtFg7Y0rXDKzo
 F6wp8yzd3wxQqz99iW2eWlrq8RUQs43UsBmQgGZFEQ==
X-Google-Smtp-Source: AK7set+2cybHq0gFkCel5osP8mALq0PJdKb84YjeQSa6Wwycr61rAL6sPvJbfGbb/k6rlaDJyygzHg==
X-Received: by 2002:a17:90b:350f:b0:234:86a5:f800 with SMTP id
 ls15-20020a17090b350f00b0023486a5f800mr25701915pjb.34.1677475832967; 
 Sun, 26 Feb 2023 21:30:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 51/76] target/riscv: Drop ftemp_new
Date: Sun, 26 Feb 2023 19:24:40 -1000
Message-Id: <20230227052505.352889-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
Replace the few uses with tcg_temp_new_i64.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f9d5d1097e..273e566d66 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -106,9 +106,6 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
-    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
-    TCGv_i64 ftemp[4];
-    uint8_t nftemp;
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
@@ -431,12 +428,6 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
     }
 }
 
-static TCGv_i64 ftemp_new(DisasContext *ctx)
-{
-    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
-    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
-}
-
 static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
@@ -450,7 +441,7 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
     case MXL_RV32:
 #ifdef TARGET_RISCV32
     {
-        TCGv_i64 t = ftemp_new(ctx);
+        TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
         return t;
     }
@@ -476,7 +467,7 @@ static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
     switch (get_xl(ctx)) {
     case MXL_RV32:
     {
-        TCGv_i64 t = ftemp_new(ctx);
+        TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
         return t;
     }
@@ -496,12 +487,12 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
     }
 
     if (reg_num == 0) {
-        return ftemp_new(ctx);
+        return tcg_temp_new_i64();
     }
 
     switch (get_xl(ctx)) {
     case MXL_RV32:
-        return ftemp_new(ctx);
+        return tcg_temp_new_i64();
 #ifdef TARGET_RISCV64
     case MXL_RV64:
         return cpu_gpr[reg_num];
@@ -1207,8 +1198,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
-    ctx->nftemp = 0;
-    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1244,11 +1233,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         ctx->temp[i] = NULL;
     }
     ctx->ntemp = 0;
-    for (i = ctx->nftemp - 1; i >= 0; --i) {
-        tcg_temp_free_i64(ctx->ftemp[i]);
-        ctx->ftemp[i] = NULL;
-    }
-    ctx->nftemp = 0;
 
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.34.1


