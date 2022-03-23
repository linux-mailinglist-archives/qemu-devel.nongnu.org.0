Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE04E4BCA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 05:11:06 +0100 (CET)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWsKv-00067s-2h
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 00:11:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nWs8o-0005WH-M6; Tue, 22 Mar 2022 23:58:35 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nWs8m-0005yh-52; Tue, 22 Mar 2022 23:58:34 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 508B011F10B;
 Wed, 23 Mar 2022 03:58:05 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 07:59:26 -0800
Subject: [PATCH qemu v3 14/14] target/riscv: rvv: Add tail agnostic for vector
 permutation instructions
Message-ID: <164800788276.12449.15168787569124374586-14@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164800788276.12449.15168787569124374586-0@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc |  2 +
 target/riscv/vector_helper.c            | 54 ++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index cce811f67f..92ee0641ba 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3739,6 +3739,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *=
a)
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
=20
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -3844,6 +3845,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
     }
=20
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8ebd26be93..595cfa3e0e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4932,6 +4932,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong offset =3D s1, i_min, i;                                   \
                                                                           \
     i_min =3D MAX(env->vstart, offset);                                     \
@@ -4941,6 +4944,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));          \
     }                                                                     \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz); \
 }
=20
 /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] =3D vs2[i] */
@@ -4953,12 +4958,15 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
+    uint32_t max_elem =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));        \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong i_max, i;                                                \
                                                                           \
-    i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
+    i_max =3D MAX(MIN(s1 < max_elem ? max_elem - s1 : 0, vl), env->vstart); \
     for (i =3D env->vstart; i < i_max; ++i) {                               \
         if (vm || vext_elem_mask(v0, i)) {                                \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i + s1));          \
@@ -4972,6 +4980,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     }                                                                     \
                                                                           \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz); \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
@@ -4987,6 +4997,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
     uint32_t vm =3D vext_vm(desc);                                          =
  \
     uint32_t vl =3D env->vl;                                                =
  \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
  \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   =
  \
+    uint32_t vta =3D vext_vta(desc);                                        =
  \
     uint32_t i;                                                             \
                                                                             \
     for (i =3D env->vstart; i < vl; i++) {                                  =
  \
@@ -5000,6 +5013,8 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
         }                                                                   \
     }                                                                       \
     env->vstart =3D 0;                                                      =
  \
+    /* set tail elements to 1s */                                           \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz);   \
 }
=20
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -5027,6 +5042,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                          =
    \
     uint32_t vl =3D env->vl;                                                =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
    \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   =
    \
+    uint32_t vta =3D vext_vta(desc);                                        =
    \
     uint32_t i;                                                             =
  \
                                                                             =
  \
     for (i =3D env->vstart; i < vl; i++) {                                  =
    \
@@ -5040,6 +5058,8 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
         }                                                                   =
  \
     }                                                                       =
  \
     env->vstart =3D 0;                                                      =
    \
+    /* set tail elements to 1s */                                           =
  \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz);   =
  \
 }
=20
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -5090,9 +5110,12 @@ GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS2)));             \
+    uint32_t max_elem =3D vext_max_elems(desc, ctzl(sizeof(TS2)));          \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS2);                                           \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
@@ -5101,13 +5124,15 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,               \
             continue;                                                     \
         }                                                                 \
         index =3D *((TS1 *)vs1 + HS1(i));                                   \
-        if (index >=3D vlmax) {                                             \
+        if (index >=3D max_elem) {                                          \
             *((TS2 *)vd + HS2(i)) =3D 0;                                    \
         } else {                                                          \
             *((TS2 *)vd + HS2(i)) =3D *((TS2 *)vs2 + HS2(index));           \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz); \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -5125,9 +5150,12 @@ GEN_VEXT_VRGATHER_VV(vrgatherei16_vv_d, uint16_t, uint=
64_t, H2, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
+    uint32_t max_elem =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));        \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index =3D s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
@@ -5135,13 +5163,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
, void *vs2,         \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
             continue;                                                     \
         }                                                                 \
-        if (index >=3D vlmax) {                                             \
+        if (index >=3D max_elem) {                                          \
             *((ETYPE *)vd + H(i)) =3D 0;                                    \
         } else {                                                          \
             *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(index));           \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz); \
 }
=20
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
@@ -5156,6 +5186,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);   \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t num =3D 0, i;                                                  \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -5166,6 +5199,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
         num++;                                                            \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz); \
 }
=20
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -5202,6 +5237,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,      =
           \
 {                                                                \
     uint32_t vl =3D env->vl;                                       \
     uint32_t vm =3D vext_vm(desc);                                 \
+    uint32_t esz =3D sizeof(ETYPE);                                \
+    uint32_t vlmax =3D                                             \
+        vext_get_total_elem(env_archcpu(env), env->vtype);       \
+    uint32_t vta =3D vext_vta(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i =3D env->vstart; i < vl; i++) {                         \
@@ -5211,6 +5250,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       =
          \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
     env->vstart =3D 0;                                             \
+    /* set tail elements to 1s */                                \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,      \
+                                     vlmax * esz);               \
 }
=20
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
--=20
2.34.1

