Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D30206721
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 00:21:22 +0200 (CEST)
Received: from localhost ([::1]:51046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnrI9-0001np-Bn
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 18:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrH0-0000xy-5z; Tue, 23 Jun 2020 18:20:10 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrGv-0008M4-PJ; Tue, 23 Jun 2020 18:20:09 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.493133-0.00158504-0.505282;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrRLLUu_1592950798; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrRLLUu_1592950798)
 by smtp.aliyun-inc.com(10.147.41.178);
 Wed, 24 Jun 2020 06:19:58 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 10/61] target/riscv: vector single-width integer add and
 subtract
Date: Wed, 24 Jun 2020 05:58:29 +0800
Message-Id: <20200623215920.2594-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
References: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 17:32:41
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  25 ++
 target/riscv/insn32.decode              |  10 +
 target/riscv/insn_trans/trans_rvv.inc.c | 291 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 183 +++++++++++++++
 4 files changed, 509 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c5f43b5b64..7660bec01f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -275,3 +275,28 @@ DEF_HELPER_6(vamominw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamomaxw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamominuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vamomaxuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsub_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadd_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vadd_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vadd_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vadd_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrsub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrsub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrsub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_FLAGS_4(vec_rsubs8, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vec_rsubs16, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vec_rsubs32, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
+DEF_HELPER_FLAGS_4(vec_rsubs64, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 625914c85f..bb1e47a2be 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -44,6 +44,7 @@
 &u    imm rd
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
+&rmrr      vm rd rs1 rs2
 &rwdvm     vm wd rd rs1 rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
@@ -68,6 +69,7 @@
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r_nfvm  ... ... vm:1 ..... ..... ... ..... ....... &rnfvm %nf %rs2 %rs1 %rd
+@r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
 @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
 
@@ -277,5 +279,13 @@ vamominuw_v     11000 . . ..... ..... 110 ..... 0101111 @r_wdvm
 vamomaxuw_v     11100 . . ..... ..... 110 ..... 0101111 @r_wdvm
 
 # *** new major opcode OP-V ***
+vadd_vv         000000 . ..... ..... 000 ..... 1010111 @r_vm
+vadd_vx         000000 . ..... ..... 100 ..... 1010111 @r_vm
+vadd_vi         000000 . ..... ..... 011 ..... 1010111 @r_vm
+vsub_vv         000010 . ..... ..... 000 ..... 1010111 @r_vm
+vsub_vx         000010 . ..... ..... 100 ..... 1010111 @r_vm
+vrsub_vx        000011 . ..... ..... 100 ..... 1010111 @r_vm
+vrsub_vi        000011 . ..... ..... 011 ..... 1010111 @r_vm
+
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 768e95c8c4..c2b276809a 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -772,3 +772,294 @@ GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check)
 GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check)
 #endif
+
+/*
+ *** Vector Integer Arithmetic Instructions
+ */
+#define MAXSZ(s) (s->vlen >> (3 - s->lmul))
+
+static bool opivv_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false));
+}
+
+typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
+                        uint32_t, uint32_t, uint32_t);
+
+static inline bool
+do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
+              gen_helper_gvec_4_ptr *fn)
+{
+    TCGLabel *over = gen_new_label();
+    if (!opivv_check(s, a)) {
+        return false;
+    }
+
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    if (a->vm && s->vl_eq_vlmax) {
+        gvec_fn(s->sew, vreg_ofs(s, a->rd),
+                vreg_ofs(s, a->rs2), vreg_ofs(s, a->rs1),
+                MAXSZ(s), MAXSZ(s));
+    } else {
+        uint32_t data = 0;
+
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                           vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
+                           cpu_env, 0, s->vlen / 8, data, fn);
+    }
+    gen_set_label(over);
+    return true;
+}
+
+/* OPIVV with GVEC IR */
+#define GEN_OPIVV_GVEC_TRANS(NAME, SUF) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    static gen_helper_gvec_4_ptr * const fns[4] = {                \
+        gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
+        gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
+    };                                                             \
+    return do_opivv_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);   \
+}
+
+GEN_OPIVV_GVEC_TRANS(vadd_vv, add)
+GEN_OPIVV_GVEC_TRANS(vsub_vv, sub)
+
+typedef void gen_helper_opivx(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
+                              TCGv_env, TCGv_i32);
+
+static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
+                        gen_helper_opivx *fn, DisasContext *s)
+{
+    TCGv_ptr dest, src2, mask;
+    TCGv src1;
+    TCGv_i32 desc;
+    uint32_t data = 0;
+
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    dest = tcg_temp_new_ptr();
+    mask = tcg_temp_new_ptr();
+    src2 = tcg_temp_new_ptr();
+    src1 = tcg_temp_new();
+    gen_get_gpr(src1, rs1);
+
+    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+    data = FIELD_DP32(data, VDATA, VM, vm);
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+    tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
+    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+
+    fn(dest, mask, src1, src2, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(src2);
+    tcg_temp_free(src1);
+    tcg_temp_free_i32(desc);
+    gen_set_label(over);
+    return true;
+}
+
+static bool opivx_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false));
+}
+
+typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t, TCGv_i64,
+                         uint32_t, uint32_t);
+
+static inline bool
+do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
+              gen_helper_opivx *fn)
+{
+    if (!opivx_check(s, a)) {
+        return false;
+    }
+
+    if (a->vm && s->vl_eq_vlmax) {
+        TCGv_i64 src1 = tcg_temp_new_i64();
+        TCGv tmp = tcg_temp_new();
+
+        gen_get_gpr(tmp, a->rs1);
+        tcg_gen_ext_tl_i64(src1, tmp);
+        gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
+                src1, MAXSZ(s), MAXSZ(s));
+
+        tcg_temp_free_i64(src1);
+        tcg_temp_free(tmp);
+        return true;
+    }
+    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+}
+
+/* OPIVX with GVEC IR */
+#define GEN_OPIVX_GVEC_TRANS(NAME, SUF) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    static gen_helper_opivx * const fns[4] = {                     \
+        gen_helper_##NAME##_b, gen_helper_##NAME##_h,              \
+        gen_helper_##NAME##_w, gen_helper_##NAME##_d,              \
+    };                                                             \
+    return do_opivx_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);   \
+}
+
+GEN_OPIVX_GVEC_TRANS(vadd_vx, adds)
+GEN_OPIVX_GVEC_TRANS(vsub_vx, subs)
+
+static void gen_vec_rsub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_vec_sub8_i64(d, b, a);
+}
+
+static void gen_vec_rsub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_vec_sub8_i64(d, b, a);
+}
+
+static void gen_rsub_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
+{
+    tcg_gen_sub_i32(ret, arg2, arg1);
+}
+
+static void gen_rsub_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
+{
+    tcg_gen_sub_i64(ret, arg2, arg1);
+}
+
+static void gen_rsub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_sub_vec(vece, r, b, a);
+}
+
+static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                               TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen2s rsub_op[4] = {
+        { .fni8 = gen_vec_rsub8_i64,
+          .fniv = gen_rsub_vec,
+          .fno = gen_helper_vec_rsubs8,
+          .vece = MO_8 },
+        { .fni8 = gen_vec_rsub16_i64,
+          .fniv = gen_rsub_vec,
+          .fno = gen_helper_vec_rsubs16,
+          .vece = MO_16 },
+        { .fni4 = gen_rsub_i32,
+          .fniv = gen_rsub_vec,
+          .fno = gen_helper_vec_rsubs32,
+          .vece = MO_32 },
+        { .fni8 = gen_rsub_i64,
+          .fniv = gen_rsub_vec,
+          .fno = gen_helper_vec_rsubs64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .vece = MO_64 },
+    };
+
+    tcg_debug_assert(vece <= MO_64);
+    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &rsub_op[vece]);
+}
+
+GEN_OPIVX_GVEC_TRANS(vrsub_vx, rsubs)
+
+static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
+                        gen_helper_opivx *fn, DisasContext *s, int zx)
+{
+    TCGv_ptr dest, src2, mask;
+    TCGv src1;
+    TCGv_i32 desc;
+    uint32_t data = 0;
+
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    dest = tcg_temp_new_ptr();
+    mask = tcg_temp_new_ptr();
+    src2 = tcg_temp_new_ptr();
+    if (zx) {
+        src1 = tcg_const_tl(imm);
+    } else {
+        src1 = tcg_const_tl(sextract64(imm, 0, 5));
+    }
+    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+    data = FIELD_DP32(data, VDATA, VM, vm);
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+    tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
+    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+
+    fn(dest, mask, src1, src2, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(src2);
+    tcg_temp_free(src1);
+    tcg_temp_free_i32(desc);
+    gen_set_label(over);
+    return true;
+}
+
+typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t, int64_t,
+                         uint32_t, uint32_t);
+
+static inline bool
+do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
+              gen_helper_opivx *fn, int zx)
+{
+    if (!opivx_check(s, a)) {
+        return false;
+    }
+
+    if (a->vm && s->vl_eq_vlmax) {
+        if (zx) {
+            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
+                    extract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
+        } else {
+            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
+                    sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
+        }
+    } else {
+        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
+    }
+    return true;
+}
+
+/* OPIVI with GVEC IR */
+#define GEN_OPIVI_GVEC_TRANS(NAME, ZX, OPIVX, SUF) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    static gen_helper_opivx * const fns[4] = {                     \
+        gen_helper_##OPIVX##_b, gen_helper_##OPIVX##_h,            \
+        gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,            \
+    };                                                             \
+    return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                 \
+                         fns[s->sew], ZX);                         \
+}
+
+GEN_OPIVI_GVEC_TRANS(vadd_vi, 0, vadd_vx, addi)
+
+static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t aofs,
+                               int64_t c, uint32_t oprsz, uint32_t maxsz)
+{
+    TCGv_i64 tmp = tcg_const_i64(c);
+    tcg_gen_gvec_rsubs(vece, dofs, aofs, tmp, oprsz, maxsz);
+    tcg_temp_free_i64(tmp);
+}
+
+GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b37f1f917d..df7c592526 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -834,3 +834,186 @@ GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w, clearl)
 GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w, clearl)
 GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w, clearl)
 GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
+
+/*
+ *** Vector Integer Arithmetic Instructions
+ */
+
+/* expand macro args before macro */
+#define RVVCALL(macro, ...)  macro(__VA_ARGS__)
+
+/* (TD, T1, T2, TX1, TX2) */
+#define OP_SSS_B int8_t, int8_t, int8_t, int8_t, int8_t
+#define OP_SSS_H int16_t, int16_t, int16_t, int16_t, int16_t
+#define OP_SSS_W int32_t, int32_t, int32_t, int32_t, int32_t
+#define OP_SSS_D int64_t, int64_t, int64_t, int64_t, int64_t
+
+/* operation of two vector elements */
+typedef void opivv2_fn(void *vd, void *vs1, void *vs2, int i);
+
+#define OPIVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)    \
+static void do_##NAME(void *vd, void *vs1, void *vs2, int i)    \
+{                                                               \
+    TX1 s1 = *((T1 *)vs1 + HS1(i));                             \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                             \
+    *((TD *)vd + HD(i)) = OP(s2, s1);                           \
+}
+#define DO_SUB(N, M) (N - M)
+#define DO_RSUB(N, M) (M - N)
+
+RVVCALL(OPIVV2, vadd_vv_b, OP_SSS_B, H1, H1, H1, DO_ADD)
+RVVCALL(OPIVV2, vadd_vv_h, OP_SSS_H, H2, H2, H2, DO_ADD)
+RVVCALL(OPIVV2, vadd_vv_w, OP_SSS_W, H4, H4, H4, DO_ADD)
+RVVCALL(OPIVV2, vadd_vv_d, OP_SSS_D, H8, H8, H8, DO_ADD)
+RVVCALL(OPIVV2, vsub_vv_b, OP_SSS_B, H1, H1, H1, DO_SUB)
+RVVCALL(OPIVV2, vsub_vv_h, OP_SSS_H, H2, H2, H2, DO_SUB)
+RVVCALL(OPIVV2, vsub_vv_w, OP_SSS_W, H4, H4, H4, DO_SUB)
+RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)
+
+static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
+                       CPURISCVState *env, uint32_t desc,
+                       uint32_t esz, uint32_t dsz,
+                       opivv2_fn *fn, clear_fn *clearfn)
+{
+    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+    uint32_t i;
+
+    for (i = 0; i < vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        fn(vd, vs1, vs2, i);
+    }
+    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
+}
+
+/* generate the helpers for OPIVV */
+#define GEN_VEXT_VV(NAME, ESZ, DSZ, CLEAR_FN)             \
+void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    do_vext_vv(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,     \
+               do_##NAME, CLEAR_FN);                      \
+}
+
+GEN_VEXT_VV(vadd_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vadd_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vadd_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vadd_vv_d, 8, 8, clearq)
+GEN_VEXT_VV(vsub_vv_b, 1, 1, clearb)
+GEN_VEXT_VV(vsub_vv_h, 2, 2, clearh)
+GEN_VEXT_VV(vsub_vv_w, 4, 4, clearl)
+GEN_VEXT_VV(vsub_vv_d, 8, 8, clearq)
+
+typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
+
+/*
+ * (T1)s1 gives the real operator type.
+ * (TX1)(T1)s1 expands the operator type of widen or narrow operations.
+ */
+#define OPIVX2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
+static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
+{                                                                   \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
+    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1);                      \
+}
+
+RVVCALL(OPIVX2, vadd_vx_b, OP_SSS_B, H1, H1, DO_ADD)
+RVVCALL(OPIVX2, vadd_vx_h, OP_SSS_H, H2, H2, DO_ADD)
+RVVCALL(OPIVX2, vadd_vx_w, OP_SSS_W, H4, H4, DO_ADD)
+RVVCALL(OPIVX2, vadd_vx_d, OP_SSS_D, H8, H8, DO_ADD)
+RVVCALL(OPIVX2, vsub_vx_b, OP_SSS_B, H1, H1, DO_SUB)
+RVVCALL(OPIVX2, vsub_vx_h, OP_SSS_H, H2, H2, DO_SUB)
+RVVCALL(OPIVX2, vsub_vx_w, OP_SSS_W, H4, H4, DO_SUB)
+RVVCALL(OPIVX2, vsub_vx_d, OP_SSS_D, H8, H8, DO_SUB)
+RVVCALL(OPIVX2, vrsub_vx_b, OP_SSS_B, H1, H1, DO_RSUB)
+RVVCALL(OPIVX2, vrsub_vx_h, OP_SSS_H, H2, H2, DO_RSUB)
+RVVCALL(OPIVX2, vrsub_vx_w, OP_SSS_W, H4, H4, DO_RSUB)
+RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
+
+static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
+                       CPURISCVState *env, uint32_t desc,
+                       uint32_t esz, uint32_t dsz,
+                       opivx2_fn fn, clear_fn *clearfn)
+{
+    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+    uint32_t i;
+
+    for (i = 0; i < vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        fn(vd, s1, vs2, i);
+    }
+    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
+}
+
+/* generate the helpers for OPIVX */
+#define GEN_VEXT_VX(NAME, ESZ, DSZ, CLEAR_FN)             \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    do_vext_vx(vd, v0, s1, vs2, env, desc, ESZ, DSZ,      \
+               do_##NAME, CLEAR_FN);                      \
+}
+
+GEN_VEXT_VX(vadd_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vadd_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vadd_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vadd_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vsub_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vsub_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vsub_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vsub_vx_d, 8, 8, clearq)
+GEN_VEXT_VX(vrsub_vx_b, 1, 1, clearb)
+GEN_VEXT_VX(vrsub_vx_h, 2, 2, clearh)
+GEN_VEXT_VX(vrsub_vx_w, 4, 4, clearl)
+GEN_VEXT_VX(vrsub_vx_d, 8, 8, clearq)
+
+void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint8_t)) {
+        *(uint8_t *)(d + i) = (uint8_t)b - *(uint8_t *)(a + i);
+    }
+}
+
+void HELPER(vec_rsubs16)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint16_t)) {
+        *(uint16_t *)(d + i) = (uint16_t)b - *(uint16_t *)(a + i);
+    }
+}
+
+void HELPER(vec_rsubs32)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
+        *(uint32_t *)(d + i) = (uint32_t)b - *(uint32_t *)(a + i);
+    }
+}
+
+void HELPER(vec_rsubs64)(void *d, void *a, uint64_t b, uint32_t desc)
+{
+    intptr_t oprsz = simd_oprsz(desc);
+    intptr_t i;
+
+    for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
+        *(uint64_t *)(d + i) = b - *(uint64_t *)(a + i);
+    }
+}
-- 
2.23.0


