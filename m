Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A74E4B57
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 04:15:56 +0100 (CET)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWrTX-0003wd-PH
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 23:15:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nWrMp-0002cg-HG; Tue, 22 Mar 2022 23:08:59 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nWrMn-00039H-QX; Tue, 22 Mar 2022 23:08:59 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8D64011F0F0;
 Wed, 23 Mar 2022 03:08:52 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 01:53:23 -0800
Subject: [PATCH qemu v2 08/13] target/riscv: rvv: Add tail agnostic for vector
 integer merge and move instructions
Message-ID: <164800493107.31817.14053311036718644936-8@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164800493107.31817.14053311036718644936-0@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc |  4 ++++
 target/riscv/vector_helper.c            | 28 +++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index e014bdac95..88912d9864 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2082,6 +2082,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v =
*a)
                              MAXSZ(s), MAXSZ(s));
         } else {
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_gvec_2_ptr * const fns[4] =3D {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
@@ -2124,6 +2125,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x =
*a)
             TCGv_i64 s1_i64 =3D tcg_temp_new_i64();
             TCGv_ptr dest =3D tcg_temp_new_ptr();
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2162,6 +2164,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i =
*a)
             TCGv_i64 s1;
             TCGv_ptr dest;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[4] =3D {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -2745,6 +2748,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             TCGv_ptr dest;
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e3393f7d99..77a5629b73 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1961,6 +1961,10 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *=
env,           \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env),           \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -1968,6 +1972,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *e=
nv,           \
         *((ETYPE *)vd + H(i)) =3D s1;                                  \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     vlmax * esz);                   \
 }
=20
 GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
@@ -1980,12 +1987,19 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVStat=
e *env,         \
                   uint32_t desc)                                     \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env),           \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
         *((ETYPE *)vd + H(i)) =3D (ETYPE)s1;                           \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     vlmax * esz);                   \
 }
=20
 GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
@@ -1998,6 +2012,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,          \
                   CPURISCVState *env, uint32_t desc)                 \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env),           \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2005,6 +2023,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,          \
         *((ETYPE *)vd + H(i)) =3D *(vt + H(i));                        \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     vlmax * esz);                   \
 }
=20
 GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
@@ -2017,6 +2038,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
               \
                   void *vs2, CPURISCVState *env, uint32_t desc)      \
 {                                                                    \
     uint32_t vl =3D env->vl;                                           \
+    uint32_t esz =3D sizeof(ETYPE);                                    \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env),           \
+                                         env->vtype);                \
+    uint32_t vta =3D vext_vta(desc);                                   \
     uint32_t i;                                                      \
                                                                      \
     for (i =3D env->vstart; i < vl; i++) {                             \
@@ -2026,6 +2051,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
              \
         *((ETYPE *)vd + H(i)) =3D d;                                   \
     }                                                                \
     env->vstart =3D 0;                                                 \
+    /* set tail elements to 1s */                                    \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,          \
+                                     vlmax * esz);                   \
 }
=20
 GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
--=20
2.34.1


