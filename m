Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31963516EC0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 13:18:35 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlU4X-0006xe-Ee
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 07:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nlTyW-0006Lr-4H; Mon, 02 May 2022 07:12:21 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:43520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nlTyO-0004PJ-Fz; Mon, 02 May 2022 07:12:18 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 31FEA11EFEF;
 Mon,  2 May 2022 11:12:10 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Fri, 11 Mar 2022 22:28:22 -0800
Subject: [PATCH qemu v13 03/15] target/riscv: rvv: Early exit when vstart >= vl
MIME-Version: 1.0
Message-ID: <165148992946.19543.7306630137674612238-3@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165148992946.19543.7306630137674612238-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: ~eopxd <yueh.ting.chen@gmail.com>
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: eopXD <eop.chen@sifive.com>

According to v-spec (section 5.4):
When vstart =E2=89=A5 vl, there are no body elements, and no elements are
updated in any destination vector register group, including that
no tail elements are updated with agnostic values.

vmsbf.m, vmsif.m, vmsof.m, viota.m, vcompress instructions themselves
require vstart to be zero. So they don't need the early exit.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 275fded6e4..57953923d5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -652,6 +652,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint=
32_t data,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -818,6 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, =
uint32_t rs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -925,6 +927,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, u=
int32_t vs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1067,6 +1070,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint3=
2_t data,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1216,6 +1220,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn =
*gvec_fn,
     }
=20
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     if (a->vm && s->vl_eq_vlmax) {
         gvec_fn(s->sew, vreg_ofs(s, a->rd),
@@ -1263,6 +1268,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2, uint32_t vm,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1427,6 +1433,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint=
32_t vs2, uint32_t vm,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -1513,6 +1520,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -1593,6 +1601,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -1670,6 +1679,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -1851,6 +1861,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         };                                                         \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2061,6 +2072,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v =
*a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
                                cpu_env, s->cfg_ptr->vlen / 8,
@@ -2084,6 +2096,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
         TCGv s1;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
@@ -2139,6 +2152,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             s1 =3D tcg_constant_i64(simm);
             dest =3D tcg_temp_new_ptr();
@@ -2291,6 +2305,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2321,6 +2336,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2,
=20
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
@@ -2409,6 +2425,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         TCGLabel *over =3D gen_new_label();                        \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
                                                                  \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
@@ -2483,6 +2500,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2604,6 +2622,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         TCGLabel *over =3D gen_new_label();
         gen_set_rm(s, rm);
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -2717,6 +2736,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             };
             TCGLabel *over =3D gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
@@ -2805,6 +2825,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2856,6 +2877,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -2921,6 +2943,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
@@ -2974,6 +2997,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         TCGLabel *over =3D gen_new_label();                          \
         gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -3061,6 +3085,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)    =
            \
         gen_helper_gvec_4_ptr *fn =3D gen_helper_##NAME;             \
         TCGLabel *over =3D gen_new_label();                          \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
@@ -3229,6 +3254,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
@@ -3746,6 +3772,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
     gen_helper_gvec_3_ptr *fn;
     TCGLabel *over =3D gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
     static gen_helper_gvec_3_ptr * const fns[6][4] =3D {
         {
--=20
2.34.2


