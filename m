Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F253F326B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:46:29 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH8b6-0008MS-1I
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y1-0005Nz-Vj
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:18 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xx-0003rb-1J
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id oa17so7827757pjb.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymoLaQVUJ4+H0kpvM0V3L7QpE2pGjqm3ILhppnEW08o=;
 b=LygyuMCdnUTfv283EofZaByre+U2Suj3yvX9VGRkH/B8asgoTv+AsolvCksnjv8961
 PchhjSjGID3mkFPj9wdmJVDycZkBlIXg3jCqCi4CF7zmpiEMph223q/pvNs1dz06sJ3X
 LDB6K8TqoPcQhepaTWTSeFGni9EY3CNa4EiFoYlIbgtKTK/6c+7/Psxy+FvogZhV5ZJG
 xWdl9Ofst3Ly4tFr+mopbqWPhdltdtoZzJTJJyA6y6drcMqtghjcNnrEEiWyiMhavNaC
 lH8j9Jc7xwTeWwD6gOM87sr0+Vkc23oALBSbkE9AhA6puCoSPdjZJA33dIKNsW2Iy16q
 eSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymoLaQVUJ4+H0kpvM0V3L7QpE2pGjqm3ILhppnEW08o=;
 b=CDbIoSujsn+/HJuDqQ5C4W+7zuv+Y6lKobAT0DzL2e2mt5NHzLQTvhKdOeDiHgW6P7
 2E30TLcAkTebcVG39M6k2yqZF7/ZVk17DOaCxwK8sOlzR5rFV8CWxFDJRxjsnvDZ105k
 XSAMGdHLn3aGx4koaQHVWQlDBhGzbqmaO5NEgOb/3LzTbMPlHHUx691o7gTYz6ltQtq5
 ZEWMcDbDcB5rySsu8pxkdq1PbI9rGicGe9O5hYDt6gIECQMWw33wt6KFY+83gsl4KsfH
 6YmRr4kVxn72Wg4CqsYXXe0xyc44XOwuMMi9oKmW6dMY7s4KJDeJiejLtlrMZfnxxEE9
 zL+A==
X-Gm-Message-State: AOAM530lsYaHEk6xxeqN3wrqmoGY5JjEKFOPdkFk2O0gLZ69XNwZ/mPc
 DxKBokbx+mXjkZyTS18Ysr0DY+NV2JbOkQ==
X-Google-Smtp-Source: ABdhPJzlxoCljLGziCxNIjHzC8/9eHo8Obaz5kCSyiE+v/ev07D/VVCVD0+iIV8ShZ99WgTp6HsKpA==
X-Received: by 2002:a17:902:d4c5:b0:12d:8317:e4b9 with SMTP id
 o5-20020a170902d4c500b0012d8317e4b9mr17259364plg.6.1629481390601; 
 Fri, 20 Aug 2021 10:43:10 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/21] target/riscv: Add DisasExtend to gen_arith*
Date: Fri, 20 Aug 2021 07:42:42 -1000
Message-Id: <20210820174257.548286-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Most arithmetic does not require extending the inputs.
Exceptions include division, comparison and minmax.

Begin using ctx->w, which allows elimination of gen_addw,
gen_subw, gen_mulw.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 69 +++++++------------------
 target/riscv/insn_trans/trans_rvb.c.inc | 30 +++++------
 target/riscv/insn_trans/trans_rvi.c.inc | 39 ++++++++------
 target/riscv/insn_trans/trans_rvm.c.inc | 16 +++---
 4 files changed, 64 insertions(+), 90 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d7552dc377..7dd2839288 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -230,7 +230,7 @@ static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
     tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
 }
 
-static TCGv __attribute__((unused)) dest_gpr(DisasContext *ctx, int reg_num)
+static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || ctx->w) {
         return temp_new(ctx);
@@ -482,57 +482,31 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 /* Include the auto-generated decoder for 32 bit insn */
 #include "decode-insn32.c.inc"
 
-static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
+static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, target_long))
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
 
-    gen_get_gpr(ctx, source1, a->rs1);
+    func(dest, src1, a->imm);
 
-    (*func)(source1, source1, a->imm);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
-static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
+static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a, DisasExtend ext,
                              void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = tcg_constant_tl(a->imm);
 
-    gen_get_gpr(ctx, source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->imm);
+    func(dest, src1, src2);
 
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
-static void gen_addw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_add_tl(ret, arg1, arg2);
-    tcg_gen_ext32s_tl(ret, ret);
-}
-
-static void gen_subw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_sub_tl(ret, arg1, arg2);
-    tcg_gen_ext32s_tl(ret, ret);
-}
-
-static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_mul_tl(ret, arg1, arg2);
-    tcg_gen_ext32s_tl(ret, ret);
-}
-
 static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
                             void(*func)(TCGv, TCGv, TCGv))
 {
@@ -798,21 +772,16 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_add_tl(ret, arg1, arg2);
 }
 
-static bool gen_arith(DisasContext *ctx, arg_r *a,
-                      void(*func)(TCGv, TCGv, TCGv))
+static bool gen_arith(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                      void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, ext);
 
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
+    func(dest, src1, src2);
 
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 260e15b47d..217a7d1f26 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -38,61 +38,61 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_andc_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_orc_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
 
 static bool trans_pack(DisasContext *ctx, arg_pack *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_pack);
+    return gen_arith(ctx, a, EXT_NONE, gen_pack);
 }
 
 static bool trans_packu(DisasContext *ctx, arg_packu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packu);
+    return gen_arith(ctx, a, EXT_NONE, gen_packu);
 }
 
 static bool trans_packh(DisasContext *ctx, arg_packh *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packh);
+    return gen_arith(ctx, a, EXT_NONE, gen_packh);
 }
 
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_smin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
 }
 
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_smax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
 }
 
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_umin_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
 }
 
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, tcg_gen_umax_tl);
+    return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
 }
 
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
@@ -230,7 +230,7 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
     REQUIRE_EXT(ctx, RVB);                                                 \
-    return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);                \
 }
 
 GEN_TRANS_SHADD(1)
@@ -262,14 +262,14 @@ static bool trans_packw(DisasContext *ctx, arg_packw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packw);
+    return gen_arith(ctx, a, EXT_NONE, gen_packw);
 }
 
 static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_packuw);
+    return gen_arith(ctx, a, EXT_NONE, gen_packuw);
 }
 
 static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
@@ -404,7 +404,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
     REQUIRE_EXT(ctx, RVB);                                    \
-    return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
+    return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
 }
 
 GEN_TRANS_SHADD_UW(1)
@@ -415,7 +415,7 @@ static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_arith(ctx, a, gen_add_uw);
+    return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
 
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f1a5d8de56..bd80476852 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -230,7 +230,7 @@ static bool trans_sd(DisasContext *ctx, arg_sd *a)
 
 static bool trans_addi(DisasContext *ctx, arg_addi *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_addi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
 }
 
 static void gen_slt(TCGv ret, TCGv s1, TCGv s2)
@@ -243,29 +243,31 @@ static void gen_sltu(TCGv ret, TCGv s1, TCGv s2)
     tcg_gen_setcond_tl(TCG_COND_LTU, ret, s1, s2);
 }
 
-
 static bool trans_slti(DisasContext *ctx, arg_slti *a)
 {
-    return gen_arith_imm_tl(ctx, a, &gen_slt);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_slt);
 }
 
 static bool trans_sltiu(DisasContext *ctx, arg_sltiu *a)
 {
-    return gen_arith_imm_tl(ctx, a, &gen_sltu);
+    return gen_arith_imm_tl(ctx, a, EXT_SIGN, gen_sltu);
 }
 
 static bool trans_xori(DisasContext *ctx, arg_xori *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_xori_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
 }
+
 static bool trans_ori(DisasContext *ctx, arg_ori *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_ori_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
 }
+
 static bool trans_andi(DisasContext *ctx, arg_andi *a)
 {
-    return gen_arith_imm_fn(ctx, a, &tcg_gen_andi_tl);
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
 }
+
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
     return gen_shifti(ctx, a, tcg_gen_shl_tl);
@@ -283,12 +285,12 @@ static bool trans_srai(DisasContext *ctx, arg_srai *a)
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_add_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
 }
 
 static bool trans_sub(DisasContext *ctx, arg_sub *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_sub_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
 
 static bool trans_sll(DisasContext *ctx, arg_sll *a)
@@ -298,17 +300,17 @@ static bool trans_sll(DisasContext *ctx, arg_sll *a)
 
 static bool trans_slt(DisasContext *ctx, arg_slt *a)
 {
-    return gen_arith(ctx, a, &gen_slt);
+    return gen_arith(ctx, a, EXT_SIGN, gen_slt);
 }
 
 static bool trans_sltu(DisasContext *ctx, arg_sltu *a)
 {
-    return gen_arith(ctx, a, &gen_sltu);
+    return gen_arith(ctx, a, EXT_SIGN, gen_sltu);
 }
 
 static bool trans_xor(DisasContext *ctx, arg_xor *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_xor_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_xor_tl);
 }
 
 static bool trans_srl(DisasContext *ctx, arg_srl *a)
@@ -323,18 +325,19 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a)
 
 static bool trans_or(DisasContext *ctx, arg_or *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_or_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_or_tl);
 }
 
 static bool trans_and(DisasContext *ctx, arg_and *a)
 {
-    return gen_arith(ctx, a, &tcg_gen_and_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_and_tl);
 }
 
 static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_arith_imm_tl(ctx, a, &gen_addw);
+    ctx->w = true;
+    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_addi_tl);
 }
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
@@ -370,13 +373,15 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_arith(ctx, a, &gen_addw);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_add_tl);
 }
 
 static bool trans_subw(DisasContext *ctx, arg_subw *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_arith(ctx, a, &gen_subw);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
 }
 
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 0a4318f18e..013b3f7009 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -22,7 +22,7 @@
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &tcg_gen_mul_tl);
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
@@ -44,7 +44,7 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_mulhsu);
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
@@ -66,33 +66,33 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_div);
+    return gen_arith(ctx, a, EXT_SIGN, gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_divu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_rem);
+    return gen_arith(ctx, a, EXT_SIGN, gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    return gen_arith(ctx, a, &gen_remu);
+    return gen_arith(ctx, a, EXT_ZERO, gen_remu);
 }
 
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVM);
-
-    return gen_arith(ctx, a, &gen_mulw);
+    ctx->w = true;
+    return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
-- 
2.25.1


