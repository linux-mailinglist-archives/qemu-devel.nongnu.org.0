Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C73F15C3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:07:36 +0200 (CEST)
Received: from localhost ([::1]:53646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGe1P-0000rL-6m
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzC-0005oI-Cy
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzA-00007r-MN
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:18 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 7so4887964pfl.10
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOWMh86oNcKl1xi7/Rwpyefm+loB+fvzToF4AezNhog=;
 b=jYQARrtO4UwpHCEA2v8A7IMDCK+2OJ9qsaJgFqU2iuqJjoL5ZBmRzlRDEdufzohgfk
 7QZgWetMq7wD769Vbzr9rLJiLnqOfSyGiy78XgP5hbzywTCXtCuqwb/Fy/Nk/iKFoakX
 zehQua90w20SDy5oLpkt5QD5psAU13+emB0tJPBJO5+7/nr3XNGhpJNZVLHbUmO0nnWS
 E+g9a91fUFcMrwShNNxi6XbiKeeyfq1McBVNJ3E28v5qf/SJOI9r7CFCyudecKBAZyTN
 EebXE77rdlrxINbddOqKYNgnIQason8DhRigO7SsZBGlhj5MiVCG0vOrtdp9COE5sy6P
 0rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOWMh86oNcKl1xi7/Rwpyefm+loB+fvzToF4AezNhog=;
 b=GYCu21szPP3/Ge3f9z5Lkgy9v07vdcyIMGxAs22656856OnfNfiP9Ql7vqYC8g5gkv
 W32u8vA2aXpE6C7nfy0cqRwJ7bdhuW6KNz3ud8kGS+aZPJke/eg08FKxnrHWLY33q1ZA
 cT5dtgFWhwOwsyKlK9VB276ozRsCXxbvwl2e/KcVWyaYe5PpID2XoWNt2XcSv+N1Tx0b
 GAeIxDDk0yRRSHubY0TSnPZ7Lp74M0PvE+t8IENOmJu9XdwzOOkufJhwaEGxNorv4BbX
 pixiKPuAYjujNUNa0GJiV0qyHktS6ydytY1j+WaCvoiB1lZI09V0RuhJX2LMISLR4Lbv
 31Jw==
X-Gm-Message-State: AOAM5308n4vzfgQ8sreJZMkYNwQwiMVufJLTe/ohHKaiuuSo0VYB2ApK
 vZTH6oW/IIFyyP2z0l4Zc3AAGkI71rU+Bw==
X-Google-Smtp-Source: ABdhPJyzRs/1mH+WYCi0hoa8Oi8s1s0v+TJ9t4tpNuDdvVQm9QRgy26Y5Jxz7Ho/hW3U8nCDddbdgg==
X-Received: by 2002:a65:6a54:: with SMTP id o20mr13079111pgu.31.1629363915136; 
 Thu, 19 Aug 2021 02:05:15 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/21] target/riscv: Remove gen_arith_div*
Date: Wed, 18 Aug 2021 23:04:47 -1000
Message-Id: <20210819090502.428068-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use ctx->w and the enhanced gen_arith function.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 42 -------------------------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++++-----
 2 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d862d0d0dd..bc40b9c701 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -495,48 +495,6 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
     return true;
 }
 
-static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_ext32s_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
-static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
-                            void(*func)(TCGv, TCGv, TCGv))
-{
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_ext32u_tl(source2, source2);
-
-    (*func)(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
-}
-
 static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
 {
     tcg_gen_deposit_tl(ret, arg1, arg2,
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 013b3f7009..3d93b24c25 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -99,30 +99,30 @@ static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_div);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_divu);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_w(ctx, a, &gen_rem);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith_div_uw(ctx, a, &gen_remu);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
-- 
2.25.1


