Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2873EF4CC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 23:20:37 +0200 (CEST)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG6Vg-0003on-NN
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 17:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TO-0000rw-0W
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:14 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TK-00010I-Ly
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso7507726pjb.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 14:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uukEubl2xRKNnsVlW+HjZeTtWpOdD5YvdcsWHJI3gKw=;
 b=f0xcZzyJPO/niWwqQBGQst8K9DSTqT8PJgxCCrnQnN78T88mCeFWbE+w1esTlWe8fp
 gbKCHVvGv225IyCVdOnyvQ3corI0E9fmMMonbcgiJ22DLpw43a0qjhDXGfaSd4VUv8T7
 dLDrN3lJLyYK1UPgeaqTTl6nNQTUyHrhoP4bbmNt8sosZeudarDwK4ou68A4YCzDvnQI
 jSTZfoKAYd+/KDoT1FglmfatOkAR87wK69BXSP5sUeCKqC0pYKO4OO3d7NWDEFsKj3Ru
 jPOjiQtWlAh9IepXdzFNL5dTrfjOkoa1ojZOEsvxFlqyWZxcAo8Nyb2pBY61niierrL3
 BtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uukEubl2xRKNnsVlW+HjZeTtWpOdD5YvdcsWHJI3gKw=;
 b=XUeUFSQsvJyvN5udYn/sMaOrThbyrLWJK8SvBme6TtfA85haFa9qcSCvibG+0RWa2a
 w+z8KFXKsDNKf0aWeFcOwP2Ll/VUcEXXmaVMwOGt+60aH8SXtNR1H10xOusgRsMNIc2N
 vGMpoPcQlkwr6qm9NKRCuz2nZJSaqnbHHF5U8YH3PSCl2lDER8Eg4kUVYSYTTBA+Nu53
 6MbXx6p8mEYfQREI4LQg8zZTHu6sbGQvdB/mfOVOnFziEto2ko0K+CPLF/EsAbD1nHGN
 i64jT7om8v5/5me4/16ieFf91GW3fI7ve2wFQrRCXsZLpX7gb+c9bQ9/rVKL4wBCfwlv
 mMTg==
X-Gm-Message-State: AOAM5320+sX5j6VCZG7X6cWtptm4jTVALfBFbfXeC3OOBgxDEJ4Qprt2
 2fU0AjIqn0rwgTUz3flc+er1HgJauDrLlw==
X-Google-Smtp-Source: ABdhPJy+0WTJPnXr3bNu9GU84X6FnIkj0Tx8htm0YC7R2XZ6rogVA2jq3kpWkafIwjC6xa2Bm9+Sag==
X-Received: by 2002:a17:90a:d791:: with SMTP id
 z17mr5432363pju.203.1629235089067; 
 Tue, 17 Aug 2021 14:18:09 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/21] target/riscv: Use tcg_constant_*
Date: Tue, 17 Aug 2021 11:17:43 -1000
Message-Id: <20210817211803.283639-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* with the allocate and free close together.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 36 ++++----------
 target/riscv/insn_trans/trans_rvf.c.inc |  3 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 65 +++++++++----------------
 3 files changed, 34 insertions(+), 70 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6983be5723..20a55c92fb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -104,20 +104,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
  */
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
-    TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
-    TCGv_i64 t_nan = tcg_const_i64(0xffffffff7fc00000ull);
+    TCGv_i64 t_max = tcg_constant_i64(0xffffffff00000000ull);
+    TCGv_i64 t_nan = tcg_constant_i64(0xffffffff7fc00000ull);
 
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
-    tcg_temp_free_i64(t_max);
-    tcg_temp_free_i64(t_nan);
 }
 
 static void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    TCGv_i32 helper_tmp = tcg_const_i32(excp);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -125,17 +121,13 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
-    TCGv_i32 helper_tmp = tcg_const_i32(excp);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_debug(void)
 {
-    TCGv_i32 helper_tmp = tcg_const_i32(EXCP_DEBUG);
-    gen_helper_raise_exception(cpu_env, helper_tmp);
-    tcg_temp_free_i32(helper_tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
 }
 
 /* Wrapper around tcg_gen_exit_tb that handles single stepping */
@@ -229,7 +221,7 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
      */
     cond1 = tcg_temp_new();
     cond2 = tcg_temp_new();
-    zeroreg = tcg_const_tl(0);
+    zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
 
     tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
@@ -250,7 +242,6 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
 
     tcg_temp_free(cond1);
     tcg_temp_free(cond2);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
 
@@ -259,7 +250,7 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
     TCGv cond1, zeroreg, resultopt1;
     cond1 = tcg_temp_new();
 
-    zeroreg = tcg_const_tl(0);
+    zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
 
     tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
@@ -272,7 +263,6 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
     tcg_gen_divu_tl(ret, source1, source2);
 
     tcg_temp_free(cond1);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
 
@@ -282,7 +272,7 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 
     cond1 = tcg_temp_new();
     cond2 = tcg_temp_new();
-    zeroreg = tcg_const_tl(0);
+    zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
 
     tcg_gen_movi_tl(resultopt1, 1L);
@@ -302,7 +292,6 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
 
     tcg_temp_free(cond1);
     tcg_temp_free(cond2);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
 
@@ -310,7 +299,7 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
 {
     TCGv cond1, zeroreg, resultopt1;
     cond1 = tcg_temp_new();
-    zeroreg = tcg_const_tl(0);
+    zeroreg = tcg_constant_tl(0);
     resultopt1 = tcg_temp_new();
 
     tcg_gen_movi_tl(resultopt1, (target_ulong)1);
@@ -323,7 +312,6 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
             source1);
 
     tcg_temp_free(cond1);
-    tcg_temp_free(zeroreg);
     tcg_temp_free(resultopt1);
 }
 
@@ -384,15 +372,11 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
 
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
-    TCGv_i32 t0;
-
     if (ctx->frm == rm) {
         return;
     }
     ctx->frm = rm;
-    t0 = tcg_const_i32(rm);
-    gen_helper_set_rounding_mode(cpu_env, t0);
-    tcg_temp_free_i32(t0);
+    gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
 static int ex_plus_1(DisasContext *ctx, int nf)
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index db1c0c9974..89f78701e7 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -200,12 +200,11 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
          * Replace bit 31 in rs1 with inverse in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        mask = tcg_const_i64(~MAKE_64BIT_MASK(31, 1));
+        mask = tcg_constant_i64(~MAKE_64BIT_MASK(31, 1));
         tcg_gen_nor_i64(rs2, rs2, mask);
         tcg_gen_and_i64(rs1, mask, rs1);
         tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
 
-        tcg_temp_free_i64(mask);
         tcg_temp_free_i64(rs2);
     }
     tcg_temp_free_i64(rs1);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 83d9a285ba..a8e7272487 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -33,7 +33,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
     if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_const_tl(RV_VLEN_MAX);
+        s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
         s1 = tcg_temp_new();
         gen_get_gpr(s1, a->rs1);
@@ -59,13 +59,13 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
         return false;
     }
 
-    s2 = tcg_const_tl(a->zimm);
+    s2 = tcg_constant_tl(a->zimm);
     dst = tcg_temp_new();
 
     /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
     if (a->rs1 == 0) {
         /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
-        s1 = tcg_const_tl(RV_VLEN_MAX);
+        s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
         s1 = tcg_temp_new();
         gen_get_gpr(s1, a->rs1);
@@ -76,7 +76,6 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
     ctx->base.is_jmp = DISAS_NORETURN;
 
     tcg_temp_free(s1);
-    tcg_temp_free(s2);
     tcg_temp_free(dst);
     return true;
 }
@@ -183,7 +182,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -194,7 +193,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -334,7 +332,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     mask = tcg_temp_new_ptr();
     base = tcg_temp_new();
     stride = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     gen_get_gpr(stride, rs2);
@@ -347,7 +345,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     tcg_temp_free_ptr(mask);
     tcg_temp_free(base);
     tcg_temp_free(stride);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -462,7 +459,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -475,7 +472,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -594,7 +590,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -605,7 +601,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -671,7 +666,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = tcg_temp_new();
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     gen_get_gpr(base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -684,7 +679,6 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(index);
     tcg_temp_free(base);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -874,7 +868,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -886,7 +880,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
     tcg_temp_free(src1);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -1014,14 +1007,14 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
     if (zx) {
-        src1 = tcg_const_tl(imm);
+        src1 = tcg_constant_tl(imm);
     } else {
-        src1 = tcg_const_tl(sextract64(imm, 0, 5));
+        src1 = tcg_constant_tl(sextract64(imm, 0, 5));
     }
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1032,8 +1025,6 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
-    tcg_temp_free(src1);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -1080,9 +1071,8 @@ GEN_OPIVI_GVEC_TRANS(vadd_vi, 0, vadd_vx, addi)
 static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t aofs,
                                int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(c);
+    TCGv_i64 tmp = tcg_constant_i64(c);
     tcg_gen_gvec_rsubs(vece, dofs, aofs, tmp, oprsz, maxsz);
-    tcg_temp_free_i64(tmp);
 }
 
 GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
@@ -1682,7 +1672,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
                                 MAXSZ(s), MAXSZ(s), s1);
         } else {
-            TCGv_i32 desc ;
+            TCGv_i32 desc;
             TCGv_i64 s1_i64 = tcg_temp_new_i64();
             TCGv_ptr dest = tcg_temp_new_ptr();
             uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
@@ -1692,12 +1682,11 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             };
 
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
             tcg_temp_free_i64(s1_i64);
         }
 
@@ -1729,15 +1718,13 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
-            s1 = tcg_const_i64(simm);
+            s1 = tcg_constant_i64(simm);
             dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
-            tcg_temp_free_i64(s1);
             gen_set_label(over);
         }
         return true;
@@ -1866,7 +1853,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1877,7 +1864,6 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
-    tcg_temp_free_i32(desc);
     gen_set_label(over);
     return true;
 }
@@ -2231,12 +2217,11 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
             dest = tcg_temp_new_ptr();
-            desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
-            tcg_temp_free_i32(desc);
             gen_set_label(over);
         }
         return true;
@@ -2428,7 +2413,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+        desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2439,7 +2424,6 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
-        tcg_temp_free_i32(desc);
         return true;
     }
     return false;
@@ -2460,7 +2444,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = tcg_temp_new();
-        desc = tcg_const_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+        desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -2471,7 +2455,6 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
-        tcg_temp_free_i32(desc);
         return true;
     }
     return false;
@@ -2636,15 +2619,13 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
     tcg_temp_free_i32(ofs);
 
     /* Flush out-of-range indexing to zero.  */
-    t_vlmax = tcg_const_i64(vlmax);
-    t_zero = tcg_const_i64(0);
+    t_vlmax = tcg_constant_i64(vlmax);
+    t_zero = tcg_constant_i64(0);
     tcg_gen_extu_tl_i64(t_idx, idx);
 
     tcg_gen_movcond_i64(TCG_COND_LTU, dest, t_idx,
                         t_vlmax, dest, t_zero);
 
-    tcg_temp_free_i64(t_vlmax);
-    tcg_temp_free_i64(t_zero);
     tcg_temp_free_i64(t_idx);
 }
 
-- 
2.25.1


