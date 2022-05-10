Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D585F5221F4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 19:08:16 +0200 (CEST)
Received: from localhost ([::1]:54790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noTLM-0005A9-0E
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 13:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noT3s-0008AD-16; Tue, 10 May 2022 12:50:12 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:44958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noT3o-0005K6-BZ; Tue, 10 May 2022 12:50:11 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 7C9B611F104;
 Tue, 10 May 2022 16:49:40 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 07:59:26 -0800
Subject: [PATCH qemu v15 14/15] target/riscv: rvv: Add tail agnostic for
 vector permutation instructions
Message-ID: <165220137795.17881.11560413809338015947-14@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165220137795.17881.11560413809338015947-0@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc | 23 ++++++++++++++
 target/riscv/vector_helper.c            | 40 +++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 0303459a20..27744060dc 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3751,6 +3751,16 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmr=
r *a)
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /*
+             * tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D s->cfg_ptr->vlen >> -scale;
         TCGv_i64 dest =3D tcg_temp_new_i64();
@@ -3783,6 +3793,16 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmr=
r *a)
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /*
+             * tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         int scale =3D s->lmul - (s->sew + 3);
         int vlmax =3D s->cfg_ptr->vlen >> -scale;
         if (a->rs1 >=3D vlmax) {
@@ -3834,6 +3854,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *=
a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -3934,6 +3955,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uin=
t8_t seq)
     }
=20
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
+    data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
=20
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index dc3d8c832d..28d62565d1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4933,6 +4933,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong offset =3D s1, i_min, i;                                   \
                                                                           \
     i_min =3D MAX(env->vstart, offset);                                     \
@@ -4942,6 +4945,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D *((ETYPE *)vs2 + H(i - offset));          \
     }                                                                     \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] =3D vs2[i] */
@@ -4957,6 +4962,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     target_ulong i_max, i;                                                \
                                                                           \
     i_max =3D MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
@@ -4973,6 +4981,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     }                                                                     \
                                                                           \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vslidedown.vx vd, vs2, rs1, vm # vd[i] =3D vs2[i+rs1] */
@@ -4988,6 +4998,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       \
     uint32_t vm =3D vext_vm(desc);                                          =
  \
     uint32_t vl =3D env->vl;                                                =
  \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
  \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          =
  \
+    uint32_t vta =3D vext_vta(desc);                                        =
  \
     uint32_t i;                                                             \
                                                                             \
     for (i =3D env->vstart; i < vl; i++) {                                  =
  \
@@ -5001,6 +5014,8 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, ta=
rget_ulong s1,       \
         }                                                                   \
     }                                                                       \
     env->vstart =3D 0;                                                      =
  \
+    /* set tail elements to 1s */                                           \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);                \
 }
=20
 GEN_VEXT_VSLIE1UP(8,  H1)
@@ -5028,6 +5043,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
     typedef uint##BITWIDTH##_t ETYPE;                                       =
  \
     uint32_t vm =3D vext_vm(desc);                                          =
    \
     uint32_t vl =3D env->vl;                                                =
    \
+    uint32_t esz =3D sizeof(ETYPE);                                         =
    \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          =
    \
+    uint32_t vta =3D vext_vta(desc);                                        =
    \
     uint32_t i;                                                             =
  \
                                                                             =
  \
     for (i =3D env->vstart; i < vl; i++) {                                  =
    \
@@ -5041,6 +5059,8 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, =
target_ulong s1,       \
         }                                                                   =
  \
     }                                                                       =
  \
     env->vstart =3D 0;                                                      =
    \
+    /* set tail elements to 1s */                                           =
  \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);                =
  \
 }
=20
 GEN_VEXT_VSLIDE1DOWN(8,  H1)
@@ -5094,6 +5114,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(TS2)));             \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS2);                                           \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
@@ -5109,6 +5132,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vd[i] =3D (vs1[i] >=3D VLMAX) ? 0 : vs2[vs1[i]]; */
@@ -5129,6 +5154,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
     uint32_t vlmax =3D vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint64_t index =3D s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
@@ -5143,6 +5171,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,         \
         }                                                                 \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs2[rs1] */
@@ -5157,6 +5187,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(ETYPE);                                         \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t num =3D 0, i;                                                  \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -5167,6 +5200,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,               \
         num++;                                                            \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 /* Compress into vd elements of vs2 where vs1 is enabled */
@@ -5198,6 +5233,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       =
          \
 {                                                                \
     uint32_t vl =3D env->vl;                                       \
     uint32_t vm =3D vext_vm(desc);                                 \
+    uint32_t esz =3D sizeof(ETYPE);                                \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz); \
+    uint32_t vta =3D vext_vta(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i =3D env->vstart; i < vl; i++) {                         \
@@ -5207,6 +5245,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       =
          \
         *((ETYPE *)vd + HD(i)) =3D *((DTYPE *)vs2 + HS1(i));       \
     }                                                            \
     env->vstart =3D 0;                                             \
+    /* set tail elements to 1s */                                \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);     \
 }
=20
 GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
--=20
2.34.2


