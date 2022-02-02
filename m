Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FF54A69A4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:33:08 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4W4-0000ZM-Dh
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tO-0000ep-EA
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:02 -0500
Received: from [2a00:1450:4864:20::133] (port=46070
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tJ-0003Dc-SM
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:01 -0500
Received: by mail-lf1-x133.google.com with SMTP id o12so37297511lfg.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yd5x2/lyYZKw27nUcxr0JVJypS8w+Y/WuQxul3gKuxQ=;
 b=KfuC/5BP8IUyGawWk6KZlHO/u969L7hrfkjNJxL2xCDgUP8+0PMKL8RcBx5WO4jNZk
 d6RH/53dDVJrJ7Jd0wYJFoqGTv+MvdDw8Ke/pumTafeOLLvSTJlFcBRdxzoqSox2OzVa
 yhLZSXjvhK1rDt6mt6Tx3yVA3q761V0I5DcM4jxL3EGafObFL7yqS+Avi0jzEY5AQhPa
 vKnXJ9WAaibWQPdQZSK4IkRCjyHM26Zh1553OwrR31fMKIjxg0ip17+bl+VhSosSKUd5
 UaHMCQvBc/zEWstJfjMDEX/Q3UNF1Es0jVrytiueMWPXHzvDtMbBOkjXo1clC7jIdRLp
 9qLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yd5x2/lyYZKw27nUcxr0JVJypS8w+Y/WuQxul3gKuxQ=;
 b=XMgqX6MD/efW3XuUQCIGK4/XFahZTKQX69WZRv18OsodoX6zU16LCXU/Vrie+YK9Bw
 sQ0+HiBtgYMZkpRFEI8L8bIt8dZHigs63r5Tii1HMIe09V5f2uRElCt1aeDhAKd/w6AR
 4kMqGbYS2ywgiByx3sXLDKQTk06sNk2uOB/F/w89pEYaWNkN+rSXFPijmnZjxmDCTN85
 yoYmuQs0ivx8sLTNMD6Y21zVNrZF0mFtdVsyg4kYgvVSXDNPzLTNQhTr3Hr9M7q5/L6V
 ExwTkJs7rNNzYx+7uC201CCJ/t1ayx84HB9gA4G+SejNrhks+etvCsLLBLOgq2xs25DG
 sIlw==
X-Gm-Message-State: AOAM533xTsrd8UOiJGeZNmc6TKVXiCYvvnGl2y6+H/jqcatwXy0Wbe1D
 ywxaPbJWAiAWAsqCu1aAsfD6A7BjzgZNqBmO
X-Google-Smtp-Source: ABdhPJyszZdIzaeDGNCO+2Q6wJEACetycrjFv9/cm1SuUafdq8RLQRANqdGSjonHWj4H+p5IMzMb3Q==
X-Received: by 2002:a05:6512:3e9:: with SMTP id
 n9mr21092723lfq.452.1643763175936; 
 Tue, 01 Feb 2022 16:52:55 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:55 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/7] target/riscv: access configuration through cfg_ptr in
 DisasContext
Date: Wed,  2 Feb 2022 01:52:45 +0100
Message-Id: <20220202005249.3566542-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x133.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The implementation in trans_{rvi,rvv,rvzfh}.c.inc accesses the shallow
copies (in DisasContext) of some of the elements available in the
RISCVCPUConfig structure.  This commit redirects accesses to use the
cfg_ptr copied into DisasContext and removes the shallow copies.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v3)

Changes in v3:
- (new patch) test extension-availability through cfg_ptr in
  DisasContext, removing the fields that have been copied into
  DisasContext directly

 target/riscv/insn_trans/trans_rvi.c.inc   |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc   | 104 +++++++++++-----------
 target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +-
 target/riscv/translate.c                  |  14 ---
 4 files changed, 55 insertions(+), 69 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 3cd1b3f877..f1342f30f8 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -806,7 +806,7 @@ static bool trans_fence(DisasContext *ctx, arg_fence *a)
 
 static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 {
-    if (!ctx->ext_ifencei) {
+    if (!ctx->cfg_ptr->ext_ifencei) {
         return false;
     }
 
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f85a9e83b4..ff09e345ad 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -74,7 +74,7 @@ static bool require_zve32f(DisasContext *s)
     }
 
     /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve32f ? s->sew <= MO_32 : true;
+    return s->cfg_ptr->ext_zve32f ? s->sew <= MO_32 : true;
 }
 
 static bool require_scale_zve32f(DisasContext *s)
@@ -85,7 +85,7 @@ static bool require_scale_zve32f(DisasContext *s)
     }
 
     /* Zve32f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve64f ? s->sew <= MO_16 : true;
+    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
 }
 
 static bool require_zve64f(DisasContext *s)
@@ -96,7 +96,7 @@ static bool require_zve64f(DisasContext *s)
     }
 
     /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve64f ? s->sew <= MO_32 : true;
+    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_32 : true;
 }
 
 static bool require_scale_zve64f(DisasContext *s)
@@ -107,7 +107,7 @@ static bool require_scale_zve64f(DisasContext *s)
     }
 
     /* Zve64f doesn't support FP64. (Section 18.2) */
-    return s->ext_zve64f ? s->sew <= MO_16 : true;
+    return s->cfg_ptr->ext_zve64f ? s->sew <= MO_16 : true;
 }
 
 /* Destination vector register group cannot overlap source mask register. */
@@ -174,7 +174,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     TCGv s1, dst;
 
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f || s->cfg_ptr->ext_zve64f)) {
         return false;
     }
 
@@ -210,7 +210,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
     TCGv dst;
 
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f || s->cfg_ptr->ext_zve64f)) {
         return false;
     }
 
@@ -248,7 +248,7 @@ static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-    return offsetof(CPURISCVState, vreg) + reg * s->vlen / 8;
+    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlen / 8;
 }
 
 /* check functions */
@@ -318,7 +318,7 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
      * when XLEN=32. (Section 18.2)
      */
     if (get_xl(s) == MXL_RV32) {
-        ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
+        ret &= (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? eew != MO_64 : true);
     }
 
     return ret;
@@ -454,7 +454,7 @@ static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
 {
     return (s->lmul <= 2) &&
            (s->sew < MO_64) &&
-           ((s->sew + 1) <= (s->elen >> 4)) &&
+           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4)) &&
            require_align(vd, s->lmul + 1) &&
            require_vm(vm, vd);
 }
@@ -482,7 +482,7 @@ static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
 {
     return (s->lmul <= 2) &&
            (s->sew < MO_64) &&
-           ((s->sew + 1) <= (s->elen >> 4)) &&
+           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4)) &&
            require_align(vs2, s->lmul + 1) &&
            require_align(vd, s->lmul) &&
            require_vm(vm, vd);
@@ -661,7 +661,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      * The first part is vlen in bytes, encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -819,7 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     mask = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
     stride = get_gpr(s, rs2, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -925,7 +925,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
@@ -1065,7 +1065,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -1120,7 +1120,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
 
     uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
     dest = tcg_temp_new_ptr();
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     base = get_gpr(s, rs1, EXT_NONE);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
@@ -1185,7 +1185,7 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
 static inline uint32_t MAXSZ(DisasContext *s)
 {
     int scale = s->lmul - 3;
-    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+    return scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
 }
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
@@ -1220,7 +1220,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
+                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
     }
     mark_vs_dirty(s);
     gen_set_label(over);
@@ -1262,7 +1262,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
 
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1425,7 +1425,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
 
     data = FIELD_DP32(data, VDATA, VM, vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -1508,7 +1508,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8,
+                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,
                            data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -1587,7 +1587,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8, data, fn);
+                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -1663,7 +1663,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -1843,7 +1843,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -1963,7 +1963,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
 }
 
 static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
@@ -1976,7 +1976,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
@@ -2046,7 +2046,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               cpu_env, s->vlen / 8, s->vlen / 8, data,
+                               cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,
                                fns[s->sew]);
             gen_set_label(over);
         }
@@ -2083,7 +2083,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             };
 
             tcg_gen_ext_tl_i64(s1_i64, s1);
-            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1_i64, cpu_env, desc);
 
@@ -2123,7 +2123,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 
             s1 = tcg_constant_i64(simm);
             dest = tcg_temp_new_ptr();
-            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
             fns[s->sew](dest, s1, cpu_env, desc);
 
@@ -2176,7 +2176,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
 }
 
 static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2187,7 +2187,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) && s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
@@ -2275,7 +2275,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2302,7 +2302,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+    desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
@@ -2391,7 +2391,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
-                           s->vlen / 8, s->vlen / 8, data,       \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,       \
                            fns[s->sew - 1]);                     \
         mark_vs_dirty(s);                                        \
         gen_set_label(over);                                     \
@@ -2464,7 +2464,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2583,7 +2583,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
-                           s->vlen / 8, s->vlen / 8, data, fn);
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -2696,7 +2696,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
 
             dest = tcg_temp_new_ptr();
-            desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+            desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
 
             fns[s->sew - 1](dest, t1, cpu_env, desc);
@@ -2782,7 +2782,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2831,7 +2831,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2896,7 +2896,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew - 1]);                       \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2947,7 +2947,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data,         \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,         \
                            fns[s->sew]);                           \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -2986,7 +2986,7 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_check(s, a) && (s->sew < MO_64) &&
-           ((s->sew + 1) <= (s->elen >> 4));
+           ((s->sew + 1) <= (s->cfg_ptr->elen >> 4));
 }
 
 GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
@@ -3034,7 +3034,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-                           s->vlen / 8, s->vlen / 8, data, fn);    \
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);    \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
         return true;                                               \
@@ -3067,7 +3067,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = dest_gpr(s, a->rd);
-        desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -3099,7 +3099,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
         mask = tcg_temp_new_ptr();
         src2 = tcg_temp_new_ptr();
         dst = dest_gpr(s, a->rd);
-        desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
+        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data));
 
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -3134,7 +3134,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
-                           cpu_env, s->vlen / 8, s->vlen / 8,      \
+                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,      \
                            data, fn);                              \
         mark_vs_dirty(s);                                          \
         gen_set_label(over);                                       \
@@ -3174,7 +3174,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
         };
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
-                           s->vlen / 8, s->vlen / 8, data, fns[s->sew]);
+                           s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
         return true;
@@ -3200,7 +3200,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
             gen_helper_vid_v_w, gen_helper_vid_v_d,
         };
         tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
-                           cpu_env, s->vlen / 8, s->vlen / 8,
+                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8,
                            data, fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -3554,7 +3554,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
 
     if (a->vm && s->vl_eq_vlmax) {
         int scale = s->lmul - (s->sew + 3);
-        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+        int vlmax = scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
@@ -3586,7 +3586,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
 
     if (a->vm && s->vl_eq_vlmax) {
         int scale = s->lmul - (s->sew + 3);
-        int vlmax = scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+        int vlmax = scale < 0 ? s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
         if (a->rs1 >= vlmax) {
             tcg_gen_gvec_dup_imm(MO_64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
@@ -3638,7 +3638,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
-                           cpu_env, s->vlen / 8, s->vlen / 8, data,
+                           cpu_env, s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data,
                            fns[s->sew]);
         mark_vs_dirty(s);
         gen_set_label(over);
@@ -3657,7 +3657,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
     if (require_rvv(s) &&                                               \
         QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
         QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
-        uint32_t maxsz = (s->vlen >> 3) * LEN;                          \
+        uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                          \
         if (s->vstart == 0) {                                           \
             /* EEW = 8 */                                               \
             tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
@@ -3742,7 +3742,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
 
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
-                       s->vlen / 8, s->vlen / 8, data, fn);
+                       s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data, fn);
 
     mark_vs_dirty(s);
     gen_set_label(over);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 5a7cac8958..608c51da2c 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -17,13 +17,13 @@
  */
 
 #define REQUIRE_ZFH(ctx) do { \
-    if (!ctx->ext_zfh) {      \
+    if (!ctx->cfg_ptr->ext_zfh) {      \
         return false;         \
     }                         \
 } while (0)
 
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
-    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
+    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
 } while (0)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 49e40735ce..f19d5cd0c0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -77,11 +77,6 @@ typedef struct DisasContext {
     RISCVMXL ol;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
-    bool ext_ifencei;
-    bool ext_zfh;
-    bool ext_zfhmin;
-    bool ext_zve32f;
-    bool ext_zve64f;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -99,8 +94,6 @@ typedef struct DisasContext {
      */
     int8_t lmul;
     uint8_t sew;
-    uint16_t vlen;
-    uint16_t elen;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -910,13 +903,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->cfg_ptr = &(cpu->cfg);
-    ctx->ext_ifencei = cpu->cfg.ext_ifencei;
-    ctx->ext_zfh = cpu->cfg.ext_zfh;
-    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
-    ctx->ext_zve32f = cpu->cfg.ext_zve32f;
-    ctx->ext_zve64f = cpu->cfg.ext_zve64f;
-    ctx->vlen = cpu->cfg.vlen;
-    ctx->elen = cpu->cfg.elen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.33.1


