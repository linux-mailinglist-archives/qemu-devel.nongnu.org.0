Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE084E4BC2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 05:06:09 +0100 (CET)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWsG8-0005Un-Rj
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 00:06:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nWs8S-0004vv-6e; Tue, 22 Mar 2022 23:58:13 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nWs8N-0005xU-4B; Tue, 22 Mar 2022 23:58:11 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 18A0D11F033;
 Wed, 23 Mar 2022 03:58:04 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Sun, 06 Mar 2022 23:32:57 -0800
Subject: [PATCH qemu v3 06/14] target/riscv: rvv: Add tail agnostic for vx,
 vvm, vxm instructions
Message-ID: <164800788276.12449.15168787569124374586-6@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc |   5 +
 target/riscv/vector_helper.c            | 311 +++++++++++++-----------
 2 files changed, 178 insertions(+), 138 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index e503c31111..4e885da187 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1287,6 +1287,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint=
32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
=20
@@ -1452,6 +1453,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint=
32_t vs2, uint32_t vm,
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
=20
@@ -1534,6 +1536,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1615,6 +1618,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1693,6 +1697,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 082b12ad1d..df1c79d8d3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -861,10 +861,12 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
=20
 static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
                        CPURISCVState *env, uint32_t desc,
-                       opivx2_fn fn)
+                       opivx2_fn fn, uint32_t esz)
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t vlmax =3D vext_get_total_elem(env_archcpu(env), env->vtype);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
=20
     for (i =3D env->vstart; i < vl; i++) {
@@ -874,30 +876,32 @@ static void do_vext_vx(void *vd, void *v0, target_long =
s1, void *vs2,
         fn(vd, s1, vs2, i);
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz);
 }
=20
 /* generate the helpers for OPIVX */
-#define GEN_VEXT_VX(NAME)                                 \
+#define GEN_VEXT_VX(NAME, ESZ)                            \
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     do_vext_vx(vd, v0, s1, vs2, env, desc,                \
-               do_##NAME);                                \
-}
-
-GEN_VEXT_VX(vadd_vx_b)
-GEN_VEXT_VX(vadd_vx_h)
-GEN_VEXT_VX(vadd_vx_w)
-GEN_VEXT_VX(vadd_vx_d)
-GEN_VEXT_VX(vsub_vx_b)
-GEN_VEXT_VX(vsub_vx_h)
-GEN_VEXT_VX(vsub_vx_w)
-GEN_VEXT_VX(vsub_vx_d)
-GEN_VEXT_VX(vrsub_vx_b)
-GEN_VEXT_VX(vrsub_vx_h)
-GEN_VEXT_VX(vrsub_vx_w)
-GEN_VEXT_VX(vrsub_vx_d)
+               do_##NAME, ESZ);                           \
+}
+
+GEN_VEXT_VX(vadd_vx_b, 1)
+GEN_VEXT_VX(vadd_vx_h, 2)
+GEN_VEXT_VX(vadd_vx_w, 4)
+GEN_VEXT_VX(vadd_vx_d, 8)
+GEN_VEXT_VX(vsub_vx_b, 1)
+GEN_VEXT_VX(vsub_vx_h, 2)
+GEN_VEXT_VX(vsub_vx_w, 4)
+GEN_VEXT_VX(vsub_vx_d, 8)
+GEN_VEXT_VX(vrsub_vx_b, 1)
+GEN_VEXT_VX(vrsub_vx_h, 2)
+GEN_VEXT_VX(vrsub_vx_w, 4)
+GEN_VEXT_VX(vrsub_vx_d, 8)
=20
 void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
 {
@@ -1025,30 +1029,30 @@ RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, DO_AD=
D)
 RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
 RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
-GEN_VEXT_VX(vwaddu_vx_b)
-GEN_VEXT_VX(vwaddu_vx_h)
-GEN_VEXT_VX(vwaddu_vx_w)
-GEN_VEXT_VX(vwsubu_vx_b)
-GEN_VEXT_VX(vwsubu_vx_h)
-GEN_VEXT_VX(vwsubu_vx_w)
-GEN_VEXT_VX(vwadd_vx_b)
-GEN_VEXT_VX(vwadd_vx_h)
-GEN_VEXT_VX(vwadd_vx_w)
-GEN_VEXT_VX(vwsub_vx_b)
-GEN_VEXT_VX(vwsub_vx_h)
-GEN_VEXT_VX(vwsub_vx_w)
-GEN_VEXT_VX(vwaddu_wx_b)
-GEN_VEXT_VX(vwaddu_wx_h)
-GEN_VEXT_VX(vwaddu_wx_w)
-GEN_VEXT_VX(vwsubu_wx_b)
-GEN_VEXT_VX(vwsubu_wx_h)
-GEN_VEXT_VX(vwsubu_wx_w)
-GEN_VEXT_VX(vwadd_wx_b)
-GEN_VEXT_VX(vwadd_wx_h)
-GEN_VEXT_VX(vwadd_wx_w)
-GEN_VEXT_VX(vwsub_wx_b)
-GEN_VEXT_VX(vwsub_wx_h)
-GEN_VEXT_VX(vwsub_wx_w)
+GEN_VEXT_VX(vwaddu_vx_b, 2)
+GEN_VEXT_VX(vwaddu_vx_h, 4)
+GEN_VEXT_VX(vwaddu_vx_w, 8)
+GEN_VEXT_VX(vwsubu_vx_b, 2)
+GEN_VEXT_VX(vwsubu_vx_h, 4)
+GEN_VEXT_VX(vwsubu_vx_w, 8)
+GEN_VEXT_VX(vwadd_vx_b, 2)
+GEN_VEXT_VX(vwadd_vx_h, 4)
+GEN_VEXT_VX(vwadd_vx_w, 8)
+GEN_VEXT_VX(vwsub_vx_b, 2)
+GEN_VEXT_VX(vwsub_vx_h, 4)
+GEN_VEXT_VX(vwsub_vx_w, 8)
+GEN_VEXT_VX(vwaddu_wx_b, 2)
+GEN_VEXT_VX(vwaddu_wx_h, 4)
+GEN_VEXT_VX(vwaddu_wx_w, 8)
+GEN_VEXT_VX(vwsubu_wx_b, 2)
+GEN_VEXT_VX(vwsubu_wx_h, 4)
+GEN_VEXT_VX(vwsubu_wx_w, 8)
+GEN_VEXT_VX(vwadd_wx_b, 2)
+GEN_VEXT_VX(vwadd_wx_h, 4)
+GEN_VEXT_VX(vwadd_wx_w, 8)
+GEN_VEXT_VX(vwsub_wx_b, 2)
+GEN_VEXT_VX(vwsub_wx_h, 4)
+GEN_VEXT_VX(vwsub_wx_w, 8)
=20
 /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
 #define DO_VADC(N, M, C) (N + M + C)
@@ -1059,6 +1063,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t vlmax =3D                                          \
+        vext_get_total_elem(env_archcpu(env), env->vtype);    \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1069,6 +1077,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,   \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, s1, carry);         \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,   \
+                                     vlmax * esz);            \
 }
=20
 GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
@@ -1086,6 +1097,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
 void *vs2,        \
                   CPURISCVState *env, uint32_t desc)                     \
 {                                                                        \
     uint32_t vl =3D env->vl;                                               \
+    uint32_t esz =3D sizeof(ETYPE);                                        \
+    uint32_t vlmax =3D                                                     \
+        vext_get_total_elem(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                       \
     uint32_t i;                                                          \
                                                                          \
     for (i =3D env->vstart; i < vl; i++) {                                 \
@@ -1095,6 +1110,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,        \
         *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carry);\
     }                                                                    \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                                        \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz);\
 }
=20
 GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
@@ -1117,6 +1134,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,   \
 {                                                             \
     uint32_t vl =3D env->vl;                                    \
     uint32_t vm =3D vext_vm(desc);                              \
+    uint32_t vlmax =3D                                          \
+        vext_get_total_elem(env_archcpu(env), env->vtype);    \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1126,6 +1146,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    if (vta) {                                                \
+        for (; i < vlmax; i++) {                              \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
@@ -1144,6 +1170,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
         \
 {                                                               \
     uint32_t vl =3D env->vl;                                      \
     uint32_t vm =3D vext_vm(desc);                                \
+    uint32_t vlmax =3D                                            \
+        vext_get_total_elem(env_archcpu(env), env->vtype);      \
+    uint32_t vta =3D vext_vta(desc);                              \
     uint32_t i;                                                 \
                                                                 \
     for (i =3D env->vstart; i < vl; i++) {                        \
@@ -1153,6 +1182,12 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
          \
                 DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
     }                                                           \
     env->vstart =3D 0;                                            \
+    /* set tail elements to 1s */                               \
+    if (vta) {                                                  \
+        for (; i < vlmax; i++) {                                \
+            vext_set_elem_mask(vd, i, 1);                       \
+        }                                                       \
+    }                                                           \
 }
=20
 GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
@@ -1203,18 +1238,18 @@ RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
 RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
-GEN_VEXT_VX(vand_vx_b)
-GEN_VEXT_VX(vand_vx_h)
-GEN_VEXT_VX(vand_vx_w)
-GEN_VEXT_VX(vand_vx_d)
-GEN_VEXT_VX(vor_vx_b)
-GEN_VEXT_VX(vor_vx_h)
-GEN_VEXT_VX(vor_vx_w)
-GEN_VEXT_VX(vor_vx_d)
-GEN_VEXT_VX(vxor_vx_b)
-GEN_VEXT_VX(vxor_vx_h)
-GEN_VEXT_VX(vxor_vx_w)
-GEN_VEXT_VX(vxor_vx_d)
+GEN_VEXT_VX(vand_vx_b, 1)
+GEN_VEXT_VX(vand_vx_h, 2)
+GEN_VEXT_VX(vand_vx_w, 4)
+GEN_VEXT_VX(vand_vx_d, 8)
+GEN_VEXT_VX(vor_vx_b, 1)
+GEN_VEXT_VX(vor_vx_h, 2)
+GEN_VEXT_VX(vor_vx_w, 4)
+GEN_VEXT_VX(vor_vx_d, 8)
+GEN_VEXT_VX(vxor_vx_b, 1)
+GEN_VEXT_VX(vxor_vx_h, 2)
+GEN_VEXT_VX(vxor_vx_w, 4)
+GEN_VEXT_VX(vxor_vx_d, 8)
=20
 /* Vector Single-Width Bit Shift Instructions */
 #define DO_SLL(N, M)  (N << (M))
@@ -1468,22 +1503,22 @@ RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
 RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
-GEN_VEXT_VX(vminu_vx_b)
-GEN_VEXT_VX(vminu_vx_h)
-GEN_VEXT_VX(vminu_vx_w)
-GEN_VEXT_VX(vminu_vx_d)
-GEN_VEXT_VX(vmin_vx_b)
-GEN_VEXT_VX(vmin_vx_h)
-GEN_VEXT_VX(vmin_vx_w)
-GEN_VEXT_VX(vmin_vx_d)
-GEN_VEXT_VX(vmaxu_vx_b)
-GEN_VEXT_VX(vmaxu_vx_h)
-GEN_VEXT_VX(vmaxu_vx_w)
-GEN_VEXT_VX(vmaxu_vx_d)
-GEN_VEXT_VX(vmax_vx_b)
-GEN_VEXT_VX(vmax_vx_h)
-GEN_VEXT_VX(vmax_vx_w)
-GEN_VEXT_VX(vmax_vx_d)
+GEN_VEXT_VX(vminu_vx_b, 1)
+GEN_VEXT_VX(vminu_vx_h, 2)
+GEN_VEXT_VX(vminu_vx_w, 4)
+GEN_VEXT_VX(vminu_vx_d, 8)
+GEN_VEXT_VX(vmin_vx_b, 1)
+GEN_VEXT_VX(vmin_vx_h, 2)
+GEN_VEXT_VX(vmin_vx_w, 4)
+GEN_VEXT_VX(vmin_vx_d, 8)
+GEN_VEXT_VX(vmaxu_vx_b, 1)
+GEN_VEXT_VX(vmaxu_vx_h, 2)
+GEN_VEXT_VX(vmaxu_vx_w, 4)
+GEN_VEXT_VX(vmaxu_vx_d, 8)
+GEN_VEXT_VX(vmax_vx_b, 1)
+GEN_VEXT_VX(vmax_vx_h, 2)
+GEN_VEXT_VX(vmax_vx_w, 4)
+GEN_VEXT_VX(vmax_vx_d, 8)
=20
 /* Vector Single-Width Integer Multiply Instructions */
 #define DO_MUL(N, M) (N * M)
@@ -1627,22 +1662,22 @@ RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, do_mu=
lhsu_b)
 RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
 RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
 RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
-GEN_VEXT_VX(vmul_vx_b)
-GEN_VEXT_VX(vmul_vx_h)
-GEN_VEXT_VX(vmul_vx_w)
-GEN_VEXT_VX(vmul_vx_d)
-GEN_VEXT_VX(vmulh_vx_b)
-GEN_VEXT_VX(vmulh_vx_h)
-GEN_VEXT_VX(vmulh_vx_w)
-GEN_VEXT_VX(vmulh_vx_d)
-GEN_VEXT_VX(vmulhu_vx_b)
-GEN_VEXT_VX(vmulhu_vx_h)
-GEN_VEXT_VX(vmulhu_vx_w)
-GEN_VEXT_VX(vmulhu_vx_d)
-GEN_VEXT_VX(vmulhsu_vx_b)
-GEN_VEXT_VX(vmulhsu_vx_h)
-GEN_VEXT_VX(vmulhsu_vx_w)
-GEN_VEXT_VX(vmulhsu_vx_d)
+GEN_VEXT_VX(vmul_vx_b, 1)
+GEN_VEXT_VX(vmul_vx_h, 2)
+GEN_VEXT_VX(vmul_vx_w, 4)
+GEN_VEXT_VX(vmul_vx_d, 8)
+GEN_VEXT_VX(vmulh_vx_b, 1)
+GEN_VEXT_VX(vmulh_vx_h, 2)
+GEN_VEXT_VX(vmulh_vx_w, 4)
+GEN_VEXT_VX(vmulh_vx_d, 8)
+GEN_VEXT_VX(vmulhu_vx_b, 1)
+GEN_VEXT_VX(vmulhu_vx_h, 2)
+GEN_VEXT_VX(vmulhu_vx_w, 4)
+GEN_VEXT_VX(vmulhu_vx_d, 8)
+GEN_VEXT_VX(vmulhsu_vx_b, 1)
+GEN_VEXT_VX(vmulhsu_vx_h, 2)
+GEN_VEXT_VX(vmulhsu_vx_w, 4)
+GEN_VEXT_VX(vmulhsu_vx_d, 8)
=20
 /* Vector Integer Divide Instructions */
 #define DO_DIVU(N, M) (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : N / M)
@@ -1701,22 +1736,22 @@ RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
 RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
-GEN_VEXT_VX(vdivu_vx_b)
-GEN_VEXT_VX(vdivu_vx_h)
-GEN_VEXT_VX(vdivu_vx_w)
-GEN_VEXT_VX(vdivu_vx_d)
-GEN_VEXT_VX(vdiv_vx_b)
-GEN_VEXT_VX(vdiv_vx_h)
-GEN_VEXT_VX(vdiv_vx_w)
-GEN_VEXT_VX(vdiv_vx_d)
-GEN_VEXT_VX(vremu_vx_b)
-GEN_VEXT_VX(vremu_vx_h)
-GEN_VEXT_VX(vremu_vx_w)
-GEN_VEXT_VX(vremu_vx_d)
-GEN_VEXT_VX(vrem_vx_b)
-GEN_VEXT_VX(vrem_vx_h)
-GEN_VEXT_VX(vrem_vx_w)
-GEN_VEXT_VX(vrem_vx_d)
+GEN_VEXT_VX(vdivu_vx_b, 1)
+GEN_VEXT_VX(vdivu_vx_h, 2)
+GEN_VEXT_VX(vdivu_vx_w, 4)
+GEN_VEXT_VX(vdivu_vx_d, 8)
+GEN_VEXT_VX(vdiv_vx_b, 1)
+GEN_VEXT_VX(vdiv_vx_h, 2)
+GEN_VEXT_VX(vdiv_vx_w, 4)
+GEN_VEXT_VX(vdiv_vx_d, 8)
+GEN_VEXT_VX(vremu_vx_b, 1)
+GEN_VEXT_VX(vremu_vx_h, 2)
+GEN_VEXT_VX(vremu_vx_w, 4)
+GEN_VEXT_VX(vremu_vx_d, 8)
+GEN_VEXT_VX(vrem_vx_b, 1)
+GEN_VEXT_VX(vrem_vx_h, 2)
+GEN_VEXT_VX(vrem_vx_w, 4)
+GEN_VEXT_VX(vrem_vx_d, 8)
=20
 /* Vector Widening Integer Multiply Instructions */
 RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
@@ -1747,15 +1782,15 @@ RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, DO_MU=
L)
 RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
 RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
-GEN_VEXT_VX(vwmul_vx_b)
-GEN_VEXT_VX(vwmul_vx_h)
-GEN_VEXT_VX(vwmul_vx_w)
-GEN_VEXT_VX(vwmulu_vx_b)
-GEN_VEXT_VX(vwmulu_vx_h)
-GEN_VEXT_VX(vwmulu_vx_w)
-GEN_VEXT_VX(vwmulsu_vx_b)
-GEN_VEXT_VX(vwmulsu_vx_h)
-GEN_VEXT_VX(vwmulsu_vx_w)
+GEN_VEXT_VX(vwmul_vx_b, 2)
+GEN_VEXT_VX(vwmul_vx_h, 4)
+GEN_VEXT_VX(vwmul_vx_w, 8)
+GEN_VEXT_VX(vwmulu_vx_b, 2)
+GEN_VEXT_VX(vwmulu_vx_h, 4)
+GEN_VEXT_VX(vwmulu_vx_w, 8)
+GEN_VEXT_VX(vwmulsu_vx_b, 2)
+GEN_VEXT_VX(vwmulsu_vx_h, 4)
+GEN_VEXT_VX(vwmulsu_vx_w, 8)
=20
 /* Vector Single-Width Integer Multiply-Add Instructions */
 #define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
@@ -1828,22 +1863,22 @@ RVVCALL(OPIVX3, vnmsub_vx_b, OP_SSS_B, H1, H1, DO_NMS=
UB)
 RVVCALL(OPIVX3, vnmsub_vx_h, OP_SSS_H, H2, H2, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_w, OP_SSS_W, H4, H4, DO_NMSUB)
 RVVCALL(OPIVX3, vnmsub_vx_d, OP_SSS_D, H8, H8, DO_NMSUB)
-GEN_VEXT_VX(vmacc_vx_b)
-GEN_VEXT_VX(vmacc_vx_h)
-GEN_VEXT_VX(vmacc_vx_w)
-GEN_VEXT_VX(vmacc_vx_d)
-GEN_VEXT_VX(vnmsac_vx_b)
-GEN_VEXT_VX(vnmsac_vx_h)
-GEN_VEXT_VX(vnmsac_vx_w)
-GEN_VEXT_VX(vnmsac_vx_d)
-GEN_VEXT_VX(vmadd_vx_b)
-GEN_VEXT_VX(vmadd_vx_h)
-GEN_VEXT_VX(vmadd_vx_w)
-GEN_VEXT_VX(vmadd_vx_d)
-GEN_VEXT_VX(vnmsub_vx_b)
-GEN_VEXT_VX(vnmsub_vx_h)
-GEN_VEXT_VX(vnmsub_vx_w)
-GEN_VEXT_VX(vnmsub_vx_d)
+GEN_VEXT_VX(vmacc_vx_b, 1)
+GEN_VEXT_VX(vmacc_vx_h, 2)
+GEN_VEXT_VX(vmacc_vx_w, 4)
+GEN_VEXT_VX(vmacc_vx_d, 8)
+GEN_VEXT_VX(vnmsac_vx_b, 1)
+GEN_VEXT_VX(vnmsac_vx_h, 2)
+GEN_VEXT_VX(vnmsac_vx_w, 4)
+GEN_VEXT_VX(vnmsac_vx_d, 8)
+GEN_VEXT_VX(vmadd_vx_b, 1)
+GEN_VEXT_VX(vmadd_vx_h, 2)
+GEN_VEXT_VX(vmadd_vx_w, 4)
+GEN_VEXT_VX(vmadd_vx_d, 8)
+GEN_VEXT_VX(vnmsub_vx_b, 1)
+GEN_VEXT_VX(vnmsub_vx_h, 2)
+GEN_VEXT_VX(vnmsub_vx_w, 4)
+GEN_VEXT_VX(vnmsub_vx_d, 8)
=20
 /* Vector Widening Integer Multiply-Add Instructions */
 RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
@@ -1877,18 +1912,18 @@ RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4, DO_=
MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
 RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
-GEN_VEXT_VX(vwmaccu_vx_b)
-GEN_VEXT_VX(vwmaccu_vx_h)
-GEN_VEXT_VX(vwmaccu_vx_w)
-GEN_VEXT_VX(vwmacc_vx_b)
-GEN_VEXT_VX(vwmacc_vx_h)
-GEN_VEXT_VX(vwmacc_vx_w)
-GEN_VEXT_VX(vwmaccsu_vx_b)
-GEN_VEXT_VX(vwmaccsu_vx_h)
-GEN_VEXT_VX(vwmaccsu_vx_w)
-GEN_VEXT_VX(vwmaccus_vx_b)
-GEN_VEXT_VX(vwmaccus_vx_h)
-GEN_VEXT_VX(vwmaccus_vx_w)
+GEN_VEXT_VX(vwmaccu_vx_b, 2)
+GEN_VEXT_VX(vwmaccu_vx_h, 4)
+GEN_VEXT_VX(vwmaccu_vx_w, 8)
+GEN_VEXT_VX(vwmacc_vx_b, 2)
+GEN_VEXT_VX(vwmacc_vx_h, 4)
+GEN_VEXT_VX(vwmacc_vx_w, 8)
+GEN_VEXT_VX(vwmaccsu_vx_b, 2)
+GEN_VEXT_VX(vwmaccsu_vx_h, 4)
+GEN_VEXT_VX(vwmaccsu_vx_w, 8)
+GEN_VEXT_VX(vwmaccus_vx_b, 2)
+GEN_VEXT_VX(vwmaccus_vx_h, 4)
+GEN_VEXT_VX(vwmaccus_vx_w, 8)
=20
 /* Vector Integer Merge and Move Instructions */
 #define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
--=20
2.34.1


