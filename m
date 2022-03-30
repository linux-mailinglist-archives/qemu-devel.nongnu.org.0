Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106ED4EBCBA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:28:31 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZTgr-0002qe-L0
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:28:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nZTLA-0007KW-I7; Wed, 30 Mar 2022 04:06:06 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nZTL5-0004xe-Le; Wed, 30 Mar 2022 04:06:04 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 416B011F090;
 Wed, 30 Mar 2022 08:05:51 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 01:53:23 -0800
Subject: [PATCH qemu v6 09/14] target/riscv: rvv: Add tail agnostic for vector
 integer merge and move instructions
Message-ID: <164862754978.10786.12800046835408243037-9@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164862754978.10786.12800046835408243037-0@git.sr.ht>
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
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
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 44 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 24 ++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index fabb2a78ae..54c08991f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2117,11 +2117,22 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_=
v *a)
         /* vmv.v.v has rs2 =3D 0 and vm =3D 1 */
         vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /*
+                 * tail elements may pass vlmax when lmul < 0
+                 * set tail elements to 1s
+                 */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                 vreg_ofs(s, a->rd), -1,
+                                 vlenb, vlenb);
+            }
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
                              MAXSZ(s), MAXSZ(s));
         } else {
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_gvec_2_ptr * const fns[4] =3D {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
@@ -2157,6 +2168,16 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x=
 *a)
         s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
=20
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /*
+                 * tail elements may pass vlmax when lmul < 0
+                 * set tail elements to 1s
+                 */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                 vreg_ofs(s, a->rd), -1,
+                                 vlenb, vlenb);
+            }
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
                                 MAXSZ(s), MAXSZ(s), s1);
         } else {
@@ -2164,6 +2185,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
             TCGv_ptr dest =3D tcg_temp_new_ptr();
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2194,6 +2216,16 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i=
 *a)
         vext_check_ss(s, a->rd, 0, 1)) {
         int64_t simm =3D sextract64(a->rs1, 0, 5);
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /*
+                 * tail elements may pass vlmax when lmul < 0
+                 * set tail elements to 1s
+                 */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                 vreg_ofs(s, a->rd), -1,
+                                 vlenb, vlenb);
+            }
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), simm);
             mark_vs_dirty(s);
@@ -2202,6 +2234,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
             TCGv_i64 s1;
             TCGv_ptr dest;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2774,6 +2807,16 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v=
_f *a)
         TCGv_i64 t1;
=20
         if (s->vl_eq_vlmax) {
+            if (s->vta && s->lmul < 0) {
+                /*
+                 * tail elements may pass vlmax when lmul < 0
+                 * set tail elements to 1s
+                 */
+                uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                                 vreg_ofs(s, a->rd), -1,
+                                 vlenb, vlenb);
+            }
             t1 =3D tcg_temp_new_i64();
             /* NaN-box f[rs1] */
             do_nanbox(s, t1, cpu_fpr[a->rs1]);
@@ -2785,6 +2828,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             TCGv_ptr dest;
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0a18ecfa43..c1854fe066 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1960,6 +1960,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *e=
nv,           \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -1967,6 +1970,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *e=
nv,           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1979,12 +1985,18 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVStat=
e *env,         \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -1997,6 +2009,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2004,6 +2019,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,          \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -2016,6 +2034,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
              \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2025,6 +2046,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
              \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     total_elems * esz);             \
 }
=20
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
--=20
2.34.1


