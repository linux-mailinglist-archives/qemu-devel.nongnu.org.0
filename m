Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D46E3F5195
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:57:26 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIG4T-0000du-02
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2i-0005hi-IC
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2f-000319-Hj
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:36 -0400
Received: by mail-pf1-x429.google.com with SMTP id w68so16294168pfd.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YPXGjkn0mYe80l5rl/+SCjeogJVWh1RK+Rt+eBlCPmY=;
 b=PxjlshDvARBdmVwrYY5N6IvW33ImS7TiGp+zHZjMwIPKPlOtjRAfz8JKmvyzXCybd4
 X+S14fhMafpCJw7M88Lhrvkc2RDkU+GWJF1Fgkg+xYEtf/n3fnomD+iVGk8b0e3fjIte
 5cOYFx47dmMXf+rm9MdimT9LGHKnyHTf/VWM7zCU/pYpkX5/e51pcDxnKj6c/LcokKIU
 CYmkIyZD/SGcyB6A8jRQsa0mZf/rIdet8f+VXILtNcwASM4TVF9ssElsLCqRtaQ+iq4u
 CXWlhB/7Ss70JkjKiKg+VCbxmmafFE0iTq+7XZXeSxM7qbUxzCaKMuZrVr0NAh9R5dd1
 c6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YPXGjkn0mYe80l5rl/+SCjeogJVWh1RK+Rt+eBlCPmY=;
 b=exIs1mLI+8ItP/ecUEsUnZX89vk1XbEeIyc6t90TROWRt4UYVOEXSR47NMQEGfO68+
 y5s72L2jdYS/B3iltoHlEo31DRiUs1vH+stoqSkUDpKDOn9bJQuJXPRmdrXoCQgM1x35
 Ig/1GdGbCm3kVln/bDkYasWLTyFYgrWF8B+UyLBccD1ZOvzfZHrIjxLBG1QIblGlEU9n
 xcvuAUVctFfAMsMG/VS4eMmlTJB55jF/wjHe7M4fShvGnTMMs6nLs699/FO+u7Mf5aHJ
 +rcNjmGXIwwEDMyzygP9dheoEc2MWWWxpb7e3WBPVzm6/fmGClM6F1UVI5BFw4iglmzs
 NDbg==
X-Gm-Message-State: AOAM533YUCm1HEaYDHM+H3eFG/wl+jBXyr4H/kJATkJvKkn6XggSRtlU
 KkK9p3cD33Lbzbo12LrplgWIjiCVblsAeA==
X-Google-Smtp-Source: ABdhPJxKNpmw6f0nqbNjLy5pArmkgZ7G8g/RsH9leyfvbtGV91rvSszlq8nB3Cvxy9dcQ6gqdW8Qgg==
X-Received: by 2002:a05:6a00:15c4:b0:3eb:2447:97bd with SMTP id
 o4-20020a056a0015c400b003eb244797bdmr8730098pfu.4.1629748532111; 
 Mon, 23 Aug 2021 12:55:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/24] target/riscv: Use tcg_constant_*
Date: Mon, 23 Aug 2021 12:55:06 -0700
Message-Id: <20210823195529.560295-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* with the allocate and free close together.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


