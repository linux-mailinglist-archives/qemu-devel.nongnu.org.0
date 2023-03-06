Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811E6AB416
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyxZ-0001kS-Hj; Sun, 05 Mar 2023 19:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx6-0000qA-Pq
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:48 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx4-0007GE-FG
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:44 -0500
Received: by mail-pl1-x641.google.com with SMTP id i10so8490755plr.9
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxkHNs+KwR1FaU1wmBHYWb6ewzVGA3yyopjwfcfw5p4=;
 b=GSqiUlmxFscs1jIRrQGGB5rh2mOC478n3Rsw48ocZbXDlfpQHKG3GNiUrcloor6ftG
 Y8aKsBta66OBJ7ffQ2nz08fU39+qH5PwvrhjUFhMJG2rtDIqtcB5zcexWrxv6IS3G4LX
 KKkF6sWT8FAH21FpEP2YrjnUGr39N2keDKOJauDNJuA1scIxr1hIq0tzACIZta2NYsU4
 dMPUVAsV8UzzcGIDwY823AymC3hKA5hLmjfzIhYEFyxjZtG3BRTenwZV+cokby2fRbwd
 trn0XdHeVAHbvvzcLMz+QKJdeWFvrIIO7H7fHR6yZrdAQNtChnhG9CJPFU4RNXHpvQGS
 3UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxkHNs+KwR1FaU1wmBHYWb6ewzVGA3yyopjwfcfw5p4=;
 b=7xMt8MZiFJINvSOfrHj4pnwL8IXe6r7fGOj9qLbTvSBH989xv3H5ydK0VvTPCd11kZ
 siwvQJyced8zVlrDuwf8V92Sd6+bCULaDZBawgCN/0DBrs9H3HaAJxoqlJHacFy2mTJo
 jad3LA8F4YmDG0wS9YF7oIGPFmlFHFF6y4uKbJ2n/m/k3AzFp7YiS7IBAuWYIeBvgtJD
 Ik970RxNnwm2PAX8lOUi9JCk1IiOrAwViaAwjJuKbTO5QSQSCTjFbqP4GThKHrr9iXCk
 7C3DXKMo7xLtBFG2tP6p4qi9mh2uENpxT5Is1pfgf+lJFww6iEdRvZVoeEcP6W4FBTkx
 cOIw==
X-Gm-Message-State: AO0yUKV1nMCgGkQg0ARzmLg7xOiLjxUEWS/aeLiN67ZiNdu5HJP6Gb3A
 6OcIbfBJn2GmK/ThJB1NeG1dCl1y4j0Jci0WDF1qDRji
X-Google-Smtp-Source: AK7set8HbkGZ0NgI3V4wLvIa1BAVO8P9125IESfM47upRsw/CpskP8BRQFdIFcLz5Qa9KOsH67ILeA==
X-Received: by 2002:a05:6a20:9149:b0:cb:c256:4b4c with SMTP id
 x9-20020a056a20914900b000cbc2564b4cmr9894319pzc.37.1678063421176; 
 Sun, 05 Mar 2023 16:43:41 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 50/84] target/riscv: Drop ftemp_new
Date: Sun,  5 Mar 2023 16:39:20 -0800
Message-Id: <20230306003954.1866998-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
Replace the few uses with tcg_temp_new_i64.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a8d516ca3e..7ed625a36f 100644
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
@@ -1208,8 +1199,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
-    ctx->nftemp = 0;
-    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1245,11 +1234,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
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


