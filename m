Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6B523B3C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:14:11 +0200 (CEST)
Received: from localhost ([::1]:42882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nopuc-0008Hf-AK
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nopkT-0008Fz-8k; Wed, 11 May 2022 13:03:41 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nopkR-0005ei-GA; Wed, 11 May 2022 13:03:41 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 557F111F109;
 Wed, 11 May 2022 17:03:15 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 01:53:23 -0800
Subject: [PATCH qemu v16 09/15] target/riscv: rvv: Add tail agnostic for
 vector integer merge and move instructions
Message-ID: <165228859378.22204.7336259119424019499-9@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165228859378.22204.7336259119424019499-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
 target/riscv/vector_helper.c            | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 347f7faf28..50f3731bbf 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2087,12 +2087,13 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_=
v *a)
         vext_check_isa_ill(s) &&
         /* vmv.v.v has rs2 =3D 0 and vm =3D 1 */
         vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
                              MAXSZ(s), MAXSZ(s));
         } else {
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_gvec_2_ptr * const fns[4] =3D {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
@@ -2127,7 +2128,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
=20
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
                                 MAXSZ(s), MAXSZ(s), s1);
         } else {
@@ -2135,6 +2136,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
             TCGv_ptr dest =3D tcg_temp_new_ptr();
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2164,7 +2166,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
         /* vmv.v.i has rs2 =3D 0 and vm =3D 1 */
         vext_check_ss(s, a->rd, 0, 1)) {
         int64_t simm =3D sextract64(a->rs1, 0, 5);
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
             mark_vs_dirty(s);
@@ -2173,6 +2175,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
             TCGv_i64 s1;
             TCGv_ptr dest;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2744,7 +2747,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
=20
         TCGv_i64 t1;
=20
-        if (s->vl_eq_vlmax) {
+        if (s->vl_eq_vlmax && !(s->vta && s->lmul < 0)) {
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
@@ -2756,6 +2759,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             TCGv_ptr dest;
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2ac0f99fcc..b77d1d13ea 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1971,6 +1971,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *e=
nv,           \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -1978,6 +1981,8 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *e=
nv,           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1990,12 +1995,17 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVStat=
e *env,         \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -2008,6 +2018,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2015,6 +2028,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,          \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -2027,6 +2042,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
              \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);     \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2036,6 +2054,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
              \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
 }
=20
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
--=20
2.34.2


