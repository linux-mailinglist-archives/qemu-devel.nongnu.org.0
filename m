Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C64DE80D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 14:05:14 +0100 (CET)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVYlc-0003jr-Kb
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 09:05:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nVYXm-0004q0-QL; Sat, 19 Mar 2022 08:50:56 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:36002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nVYXe-0003Yg-Kj; Sat, 19 Mar 2022 08:50:50 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E655211EF8D;
 Sat, 19 Mar 2022 12:50:41 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 02:05:42 -0800
Subject: [PATCH qemu 10/13] target/riscv: rvv: Add tail agnostic for vector
 floating-point instructions
Message-ID: <164769423983.18409.14760549429989700286-10@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164769423983.18409.14760549429989700286-0@git.sr.ht>
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, eop Chen <eop.chen@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: eopXD <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  11 +
 target/riscv/vector_helper.c            | 450 +++++++++++++-----------
 2 files changed, 265 insertions(+), 196 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index dec5d638c8..d6b17e2712 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2319,6 +2319,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2401,6 +2402,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
           \
         gen_set_rm(s, RISCV_FRM_DYN);                             \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);              \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
                            fns[s->sew - 1], s);                   \
     }                                                             \
@@ -2439,6 +2441,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
                                                                  \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
@@ -2478,6 +2481,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2514,6 +2518,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2553,6 +2558,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         gen_set_rm(s, RISCV_FRM_DYN);                            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2636,6 +2642,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
=20
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->cfg_ptr->vlen / 8,
@@ -2840,6 +2847,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -2891,6 +2899,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -2958,6 +2967,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3011,6 +3021,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a025e4b640..63746f3321 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2944,13 +2944,17 @@ static void do_##NAME(void *vd, void *vs1, void *vs2,=
 int i,   \
     *((TD *)vd + HD(i)) =3D OP(s2, s1, &env->fp_status);         \
 }
=20
-#define GEN_VEXT_VV_ENV(NAME)                             \
+#define GEN_VEXT_VV_ENV(NAME, ETYPE)                      \
 void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t esz =3D sizeof(ETYPE);                         \
+    uint32_t vlmax =3D                                      \
+        vext_get_vlmax(env_archcpu(env), env->vtype);     \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
@@ -2960,14 +2964,18 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,     =
     \
         do_##NAME(vd, vs1, vs2, i, env);                  \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl,         \
+                                     vl * esz,            \
+                                     vlmax * esz);        \
 }
=20
 RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
 RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
 RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
-GEN_VEXT_VV_ENV(vfadd_vv_h)
-GEN_VEXT_VV_ENV(vfadd_vv_w)
-GEN_VEXT_VV_ENV(vfadd_vv_d)
+GEN_VEXT_VV_ENV(vfadd_vv_h, float16)
+GEN_VEXT_VV_ENV(vfadd_vv_w, float32)
+GEN_VEXT_VV_ENV(vfadd_vv_d, float64)
=20
 #define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
@@ -2977,13 +2985,17 @@ static void do_##NAME(void *vd, uint64_t s1, void *vs=
2, int i, \
     *((TD *)vd + HD(i)) =3D OP(s2, (TX1)(T1)s1, &env->fp_status);\
 }
=20
-#define GEN_VEXT_VF(NAME)                                 \
+#define GEN_VEXT_VF(NAME, ETYPE)                          \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t esz =3D sizeof(ETYPE);                         \
+    uint32_t vlmax =3D                                      \
+        vext_get_vlmax(env_archcpu(env), env->vtype);     \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
@@ -2993,27 +3005,31 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,   =
     \
         do_##NAME(vd, s1, vs2, i, env);                   \
     }                                                     \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl,         \
+                                     vl * esz,            \
+                                     vlmax * esz);        \
 }
=20
 RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
 RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
 RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
-GEN_VEXT_VF(vfadd_vf_h)
-GEN_VEXT_VF(vfadd_vf_w)
-GEN_VEXT_VF(vfadd_vf_d)
+GEN_VEXT_VF(vfadd_vf_h, float16)
+GEN_VEXT_VF(vfadd_vf_w, float32)
+GEN_VEXT_VF(vfadd_vf_d, float64)
=20
 RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
 RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
 RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
-GEN_VEXT_VV_ENV(vfsub_vv_h)
-GEN_VEXT_VV_ENV(vfsub_vv_w)
-GEN_VEXT_VV_ENV(vfsub_vv_d)
+GEN_VEXT_VV_ENV(vfsub_vv_h, float16)
+GEN_VEXT_VV_ENV(vfsub_vv_w, float32)
+GEN_VEXT_VV_ENV(vfsub_vv_d, float64)
 RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
 RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
 RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
-GEN_VEXT_VF(vfsub_vf_h)
-GEN_VEXT_VF(vfsub_vf_w)
-GEN_VEXT_VF(vfsub_vf_d)
+GEN_VEXT_VF(vfsub_vf_h, float16)
+GEN_VEXT_VF(vfsub_vf_w, float32)
+GEN_VEXT_VF(vfsub_vf_d, float64)
=20
 static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3033,9 +3049,9 @@ static uint64_t float64_rsub(uint64_t a, uint64_t b, fl=
oat_status *s)
 RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
 RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
-GEN_VEXT_VF(vfrsub_vf_h)
-GEN_VEXT_VF(vfrsub_vf_w)
-GEN_VEXT_VF(vfrsub_vf_d)
+GEN_VEXT_VF(vfrsub_vf_h, float16)
+GEN_VEXT_VF(vfrsub_vf_w, float32)
+GEN_VEXT_VF(vfrsub_vf_d, float64)
=20
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
@@ -3053,12 +3069,12 @@ static uint64_t vfwadd32(uint32_t a, uint32_t b, floa=
t_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_vv_h, WOP_UUU_H, H4, H2, H2, vfwadd16)
 RVVCALL(OPFVV2, vfwadd_vv_w, WOP_UUU_W, H8, H4, H4, vfwadd32)
-GEN_VEXT_VV_ENV(vfwadd_vv_h)
-GEN_VEXT_VV_ENV(vfwadd_vv_w)
+GEN_VEXT_VV_ENV(vfwadd_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwadd_vv_w, float64)
 RVVCALL(OPFVF2, vfwadd_vf_h, WOP_UUU_H, H4, H2, vfwadd16)
 RVVCALL(OPFVF2, vfwadd_vf_w, WOP_UUU_W, H8, H4, vfwadd32)
-GEN_VEXT_VF(vfwadd_vf_h)
-GEN_VEXT_VF(vfwadd_vf_w)
+GEN_VEXT_VF(vfwadd_vf_h, float32)
+GEN_VEXT_VF(vfwadd_vf_w, float64)
=20
 static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3075,12 +3091,12 @@ static uint64_t vfwsub32(uint32_t a, uint32_t b, floa=
t_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_vv_h, WOP_UUU_H, H4, H2, H2, vfwsub16)
 RVVCALL(OPFVV2, vfwsub_vv_w, WOP_UUU_W, H8, H4, H4, vfwsub32)
-GEN_VEXT_VV_ENV(vfwsub_vv_h)
-GEN_VEXT_VV_ENV(vfwsub_vv_w)
+GEN_VEXT_VV_ENV(vfwsub_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwsub_vv_w, float64)
 RVVCALL(OPFVF2, vfwsub_vf_h, WOP_UUU_H, H4, H2, vfwsub16)
 RVVCALL(OPFVF2, vfwsub_vf_w, WOP_UUU_W, H8, H4, vfwsub32)
-GEN_VEXT_VF(vfwsub_vf_h)
-GEN_VEXT_VF(vfwsub_vf_w)
+GEN_VEXT_VF(vfwsub_vf_h, float32)
+GEN_VEXT_VF(vfwsub_vf_w, float64)
=20
 static uint32_t vfwaddw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -3094,12 +3110,12 @@ static uint64_t vfwaddw32(uint64_t a, uint32_t b, flo=
at_status *s)
=20
 RVVCALL(OPFVV2, vfwadd_wv_h, WOP_WUUU_H, H4, H2, H2, vfwaddw16)
 RVVCALL(OPFVV2, vfwadd_wv_w, WOP_WUUU_W, H8, H4, H4, vfwaddw32)
-GEN_VEXT_VV_ENV(vfwadd_wv_h)
-GEN_VEXT_VV_ENV(vfwadd_wv_w)
+GEN_VEXT_VV_ENV(vfwadd_wv_h, float32)
+GEN_VEXT_VV_ENV(vfwadd_wv_w, float64)
 RVVCALL(OPFVF2, vfwadd_wf_h, WOP_WUUU_H, H4, H2, vfwaddw16)
 RVVCALL(OPFVF2, vfwadd_wf_w, WOP_WUUU_W, H8, H4, vfwaddw32)
-GEN_VEXT_VF(vfwadd_wf_h)
-GEN_VEXT_VF(vfwadd_wf_w)
+GEN_VEXT_VF(vfwadd_wf_h, float32)
+GEN_VEXT_VF(vfwadd_wf_w, float64)
=20
 static uint32_t vfwsubw16(uint32_t a, uint16_t b, float_status *s)
 {
@@ -3113,39 +3129,39 @@ static uint64_t vfwsubw32(uint64_t a, uint32_t b, flo=
at_status *s)
=20
 RVVCALL(OPFVV2, vfwsub_wv_h, WOP_WUUU_H, H4, H2, H2, vfwsubw16)
 RVVCALL(OPFVV2, vfwsub_wv_w, WOP_WUUU_W, H8, H4, H4, vfwsubw32)
-GEN_VEXT_VV_ENV(vfwsub_wv_h)
-GEN_VEXT_VV_ENV(vfwsub_wv_w)
+GEN_VEXT_VV_ENV(vfwsub_wv_h, float32)
+GEN_VEXT_VV_ENV(vfwsub_wv_w, float64)
 RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
 RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
-GEN_VEXT_VF(vfwsub_wf_h)
-GEN_VEXT_VF(vfwsub_wf_w)
+GEN_VEXT_VF(vfwsub_wf_h, float32)
+GEN_VEXT_VF(vfwsub_wf_w, float64)
=20
 /* Vector Single-Width Floating-Point Multiply/Divide Instructions */
 RVVCALL(OPFVV2, vfmul_vv_h, OP_UUU_H, H2, H2, H2, float16_mul)
 RVVCALL(OPFVV2, vfmul_vv_w, OP_UUU_W, H4, H4, H4, float32_mul)
 RVVCALL(OPFVV2, vfmul_vv_d, OP_UUU_D, H8, H8, H8, float64_mul)
-GEN_VEXT_VV_ENV(vfmul_vv_h)
-GEN_VEXT_VV_ENV(vfmul_vv_w)
-GEN_VEXT_VV_ENV(vfmul_vv_d)
+GEN_VEXT_VV_ENV(vfmul_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmul_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmul_vv_d, float64)
 RVVCALL(OPFVF2, vfmul_vf_h, OP_UUU_H, H2, H2, float16_mul)
 RVVCALL(OPFVF2, vfmul_vf_w, OP_UUU_W, H4, H4, float32_mul)
 RVVCALL(OPFVF2, vfmul_vf_d, OP_UUU_D, H8, H8, float64_mul)
-GEN_VEXT_VF(vfmul_vf_h)
-GEN_VEXT_VF(vfmul_vf_w)
-GEN_VEXT_VF(vfmul_vf_d)
+GEN_VEXT_VF(vfmul_vf_h, float16)
+GEN_VEXT_VF(vfmul_vf_w, float32)
+GEN_VEXT_VF(vfmul_vf_d, float64)
=20
 RVVCALL(OPFVV2, vfdiv_vv_h, OP_UUU_H, H2, H2, H2, float16_div)
 RVVCALL(OPFVV2, vfdiv_vv_w, OP_UUU_W, H4, H4, H4, float32_div)
 RVVCALL(OPFVV2, vfdiv_vv_d, OP_UUU_D, H8, H8, H8, float64_div)
-GEN_VEXT_VV_ENV(vfdiv_vv_h)
-GEN_VEXT_VV_ENV(vfdiv_vv_w)
-GEN_VEXT_VV_ENV(vfdiv_vv_d)
+GEN_VEXT_VV_ENV(vfdiv_vv_h, float16)
+GEN_VEXT_VV_ENV(vfdiv_vv_w, float32)
+GEN_VEXT_VV_ENV(vfdiv_vv_d, float64)
 RVVCALL(OPFVF2, vfdiv_vf_h, OP_UUU_H, H2, H2, float16_div)
 RVVCALL(OPFVF2, vfdiv_vf_w, OP_UUU_W, H4, H4, float32_div)
 RVVCALL(OPFVF2, vfdiv_vf_d, OP_UUU_D, H8, H8, float64_div)
-GEN_VEXT_VF(vfdiv_vf_h)
-GEN_VEXT_VF(vfdiv_vf_w)
-GEN_VEXT_VF(vfdiv_vf_d)
+GEN_VEXT_VF(vfdiv_vf_h, float16)
+GEN_VEXT_VF(vfdiv_vf_w, float32)
+GEN_VEXT_VF(vfdiv_vf_d, float64)
=20
 static uint16_t float16_rdiv(uint16_t a, uint16_t b, float_status *s)
 {
@@ -3165,9 +3181,9 @@ static uint64_t float64_rdiv(uint64_t a, uint64_t b, fl=
oat_status *s)
 RVVCALL(OPFVF2, vfrdiv_vf_h, OP_UUU_H, H2, H2, float16_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_w, OP_UUU_W, H4, H4, float32_rdiv)
 RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
-GEN_VEXT_VF(vfrdiv_vf_h)
-GEN_VEXT_VF(vfrdiv_vf_w)
-GEN_VEXT_VF(vfrdiv_vf_d)
+GEN_VEXT_VF(vfrdiv_vf_h, float16)
+GEN_VEXT_VF(vfrdiv_vf_w, float32)
+GEN_VEXT_VF(vfrdiv_vf_d, float64)
=20
 /* Vector Widening Floating-Point Multiply */
 static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
@@ -3184,12 +3200,12 @@ static uint64_t vfwmul32(uint32_t a, uint32_t b, floa=
t_status *s)
 }
 RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
 RVVCALL(OPFVV2, vfwmul_vv_w, WOP_UUU_W, H8, H4, H4, vfwmul32)
-GEN_VEXT_VV_ENV(vfwmul_vv_h)
-GEN_VEXT_VV_ENV(vfwmul_vv_w)
+GEN_VEXT_VV_ENV(vfwmul_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwmul_vv_w, float64)
 RVVCALL(OPFVF2, vfwmul_vf_h, WOP_UUU_H, H4, H2, vfwmul16)
 RVVCALL(OPFVF2, vfwmul_vf_w, WOP_UUU_W, H8, H4, vfwmul32)
-GEN_VEXT_VF(vfwmul_vf_h)
-GEN_VEXT_VF(vfwmul_vf_w)
+GEN_VEXT_VF(vfwmul_vf_h, float32)
+GEN_VEXT_VF(vfwmul_vf_w, float64)
=20
 /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
 #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
@@ -3220,9 +3236,9 @@ static uint64_t fmacc64(uint64_t a, uint64_t b, uint64_=
t d, float_status *s)
 RVVCALL(OPFVV3, vfmacc_vv_h, OP_UUU_H, H2, H2, H2, fmacc16)
 RVVCALL(OPFVV3, vfmacc_vv_w, OP_UUU_W, H4, H4, H4, fmacc32)
 RVVCALL(OPFVV3, vfmacc_vv_d, OP_UUU_D, H8, H8, H8, fmacc64)
-GEN_VEXT_VV_ENV(vfmacc_vv_h)
-GEN_VEXT_VV_ENV(vfmacc_vv_w)
-GEN_VEXT_VV_ENV(vfmacc_vv_d)
+GEN_VEXT_VV_ENV(vfmacc_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmacc_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmacc_vv_d, float64)
=20
 #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
 static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
@@ -3236,9 +3252,9 @@ static void do_##NAME(void *vd, uint64_t s1, void *vs2,=
 int i,    \
 RVVCALL(OPFVF3, vfmacc_vf_h, OP_UUU_H, H2, H2, fmacc16)
 RVVCALL(OPFVF3, vfmacc_vf_w, OP_UUU_W, H4, H4, fmacc32)
 RVVCALL(OPFVF3, vfmacc_vf_d, OP_UUU_D, H8, H8, fmacc64)
-GEN_VEXT_VF(vfmacc_vf_h)
-GEN_VEXT_VF(vfmacc_vf_w)
-GEN_VEXT_VF(vfmacc_vf_d)
+GEN_VEXT_VF(vfmacc_vf_h, float16)
+GEN_VEXT_VF(vfmacc_vf_w, float32)
+GEN_VEXT_VF(vfmacc_vf_d, float64)
=20
 static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3261,15 +3277,15 @@ static uint64_t fnmacc64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
 RVVCALL(OPFVV3, vfnmacc_vv_w, OP_UUU_W, H4, H4, H4, fnmacc32)
 RVVCALL(OPFVV3, vfnmacc_vv_d, OP_UUU_D, H8, H8, H8, fnmacc64)
-GEN_VEXT_VV_ENV(vfnmacc_vv_h)
-GEN_VEXT_VV_ENV(vfnmacc_vv_w)
-GEN_VEXT_VV_ENV(vfnmacc_vv_d)
+GEN_VEXT_VV_ENV(vfnmacc_vv_h, float16)
+GEN_VEXT_VV_ENV(vfnmacc_vv_w, float32)
+GEN_VEXT_VV_ENV(vfnmacc_vv_d, float64)
 RVVCALL(OPFVF3, vfnmacc_vf_h, OP_UUU_H, H2, H2, fnmacc16)
 RVVCALL(OPFVF3, vfnmacc_vf_w, OP_UUU_W, H4, H4, fnmacc32)
 RVVCALL(OPFVF3, vfnmacc_vf_d, OP_UUU_D, H8, H8, fnmacc64)
-GEN_VEXT_VF(vfnmacc_vf_h)
-GEN_VEXT_VF(vfnmacc_vf_w)
-GEN_VEXT_VF(vfnmacc_vf_d)
+GEN_VEXT_VF(vfnmacc_vf_h, float16)
+GEN_VEXT_VF(vfnmacc_vf_w, float32)
+GEN_VEXT_VF(vfnmacc_vf_d, float64)
=20
 static uint16_t fmsac16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3289,15 +3305,15 @@ static uint64_t fmsac64(uint64_t a, uint64_t b, uint6=
4_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsac_vv_h, OP_UUU_H, H2, H2, H2, fmsac16)
 RVVCALL(OPFVV3, vfmsac_vv_w, OP_UUU_W, H4, H4, H4, fmsac32)
 RVVCALL(OPFVV3, vfmsac_vv_d, OP_UUU_D, H8, H8, H8, fmsac64)
-GEN_VEXT_VV_ENV(vfmsac_vv_h)
-GEN_VEXT_VV_ENV(vfmsac_vv_w)
-GEN_VEXT_VV_ENV(vfmsac_vv_d)
+GEN_VEXT_VV_ENV(vfmsac_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmsac_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmsac_vv_d, float64)
 RVVCALL(OPFVF3, vfmsac_vf_h, OP_UUU_H, H2, H2, fmsac16)
 RVVCALL(OPFVF3, vfmsac_vf_w, OP_UUU_W, H4, H4, fmsac32)
 RVVCALL(OPFVF3, vfmsac_vf_d, OP_UUU_D, H8, H8, fmsac64)
-GEN_VEXT_VF(vfmsac_vf_h)
-GEN_VEXT_VF(vfmsac_vf_w)
-GEN_VEXT_VF(vfmsac_vf_d)
+GEN_VEXT_VF(vfmsac_vf_h, float16)
+GEN_VEXT_VF(vfmsac_vf_w, float32)
+GEN_VEXT_VF(vfmsac_vf_d, float64)
=20
 static uint16_t fnmsac16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3317,15 +3333,15 @@ static uint64_t fnmsac64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsac_vv_h, OP_UUU_H, H2, H2, H2, fnmsac16)
 RVVCALL(OPFVV3, vfnmsac_vv_w, OP_UUU_W, H4, H4, H4, fnmsac32)
 RVVCALL(OPFVV3, vfnmsac_vv_d, OP_UUU_D, H8, H8, H8, fnmsac64)
-GEN_VEXT_VV_ENV(vfnmsac_vv_h)
-GEN_VEXT_VV_ENV(vfnmsac_vv_w)
-GEN_VEXT_VV_ENV(vfnmsac_vv_d)
+GEN_VEXT_VV_ENV(vfnmsac_vv_h, float16)
+GEN_VEXT_VV_ENV(vfnmsac_vv_w, float32)
+GEN_VEXT_VV_ENV(vfnmsac_vv_d, float64)
 RVVCALL(OPFVF3, vfnmsac_vf_h, OP_UUU_H, H2, H2, fnmsac16)
 RVVCALL(OPFVF3, vfnmsac_vf_w, OP_UUU_W, H4, H4, fnmsac32)
 RVVCALL(OPFVF3, vfnmsac_vf_d, OP_UUU_D, H8, H8, fnmsac64)
-GEN_VEXT_VF(vfnmsac_vf_h)
-GEN_VEXT_VF(vfnmsac_vf_w)
-GEN_VEXT_VF(vfnmsac_vf_d)
+GEN_VEXT_VF(vfnmsac_vf_h, float16)
+GEN_VEXT_VF(vfnmsac_vf_w, float32)
+GEN_VEXT_VF(vfnmsac_vf_d, float64)
=20
 static uint16_t fmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3345,15 +3361,15 @@ static uint64_t fmadd64(uint64_t a, uint64_t b, uint6=
4_t d, float_status *s)
 RVVCALL(OPFVV3, vfmadd_vv_h, OP_UUU_H, H2, H2, H2, fmadd16)
 RVVCALL(OPFVV3, vfmadd_vv_w, OP_UUU_W, H4, H4, H4, fmadd32)
 RVVCALL(OPFVV3, vfmadd_vv_d, OP_UUU_D, H8, H8, H8, fmadd64)
-GEN_VEXT_VV_ENV(vfmadd_vv_h)
-GEN_VEXT_VV_ENV(vfmadd_vv_w)
-GEN_VEXT_VV_ENV(vfmadd_vv_d)
+GEN_VEXT_VV_ENV(vfmadd_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmadd_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmadd_vv_d, float64)
 RVVCALL(OPFVF3, vfmadd_vf_h, OP_UUU_H, H2, H2, fmadd16)
 RVVCALL(OPFVF3, vfmadd_vf_w, OP_UUU_W, H4, H4, fmadd32)
 RVVCALL(OPFVF3, vfmadd_vf_d, OP_UUU_D, H8, H8, fmadd64)
-GEN_VEXT_VF(vfmadd_vf_h)
-GEN_VEXT_VF(vfmadd_vf_w)
-GEN_VEXT_VF(vfmadd_vf_d)
+GEN_VEXT_VF(vfmadd_vf_h, float16)
+GEN_VEXT_VF(vfmadd_vf_w, float32)
+GEN_VEXT_VF(vfmadd_vf_d, float64)
=20
 static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3376,15 +3392,15 @@ static uint64_t fnmadd64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
 RVVCALL(OPFVV3, vfnmadd_vv_w, OP_UUU_W, H4, H4, H4, fnmadd32)
 RVVCALL(OPFVV3, vfnmadd_vv_d, OP_UUU_D, H8, H8, H8, fnmadd64)
-GEN_VEXT_VV_ENV(vfnmadd_vv_h)
-GEN_VEXT_VV_ENV(vfnmadd_vv_w)
-GEN_VEXT_VV_ENV(vfnmadd_vv_d)
+GEN_VEXT_VV_ENV(vfnmadd_vv_h, float16)
+GEN_VEXT_VV_ENV(vfnmadd_vv_w, float32)
+GEN_VEXT_VV_ENV(vfnmadd_vv_d, float64)
 RVVCALL(OPFVF3, vfnmadd_vf_h, OP_UUU_H, H2, H2, fnmadd16)
 RVVCALL(OPFVF3, vfnmadd_vf_w, OP_UUU_W, H4, H4, fnmadd32)
 RVVCALL(OPFVF3, vfnmadd_vf_d, OP_UUU_D, H8, H8, fnmadd64)
-GEN_VEXT_VF(vfnmadd_vf_h)
-GEN_VEXT_VF(vfnmadd_vf_w)
-GEN_VEXT_VF(vfnmadd_vf_d)
+GEN_VEXT_VF(vfnmadd_vf_h, float16)
+GEN_VEXT_VF(vfnmadd_vf_w, float32)
+GEN_VEXT_VF(vfnmadd_vf_d, float64)
=20
 static uint16_t fmsub16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3404,15 +3420,15 @@ static uint64_t fmsub64(uint64_t a, uint64_t b, uint6=
4_t d, float_status *s)
 RVVCALL(OPFVV3, vfmsub_vv_h, OP_UUU_H, H2, H2, H2, fmsub16)
 RVVCALL(OPFVV3, vfmsub_vv_w, OP_UUU_W, H4, H4, H4, fmsub32)
 RVVCALL(OPFVV3, vfmsub_vv_d, OP_UUU_D, H8, H8, H8, fmsub64)
-GEN_VEXT_VV_ENV(vfmsub_vv_h)
-GEN_VEXT_VV_ENV(vfmsub_vv_w)
-GEN_VEXT_VV_ENV(vfmsub_vv_d)
+GEN_VEXT_VV_ENV(vfmsub_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmsub_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmsub_vv_d, float64)
 RVVCALL(OPFVF3, vfmsub_vf_h, OP_UUU_H, H2, H2, fmsub16)
 RVVCALL(OPFVF3, vfmsub_vf_w, OP_UUU_W, H4, H4, fmsub32)
 RVVCALL(OPFVF3, vfmsub_vf_d, OP_UUU_D, H8, H8, fmsub64)
-GEN_VEXT_VF(vfmsub_vf_h)
-GEN_VEXT_VF(vfmsub_vf_w)
-GEN_VEXT_VF(vfmsub_vf_d)
+GEN_VEXT_VF(vfmsub_vf_h, float16)
+GEN_VEXT_VF(vfmsub_vf_w, float32)
+GEN_VEXT_VF(vfmsub_vf_d, float64)
=20
 static uint16_t fnmsub16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
 {
@@ -3432,15 +3448,15 @@ static uint64_t fnmsub64(uint64_t a, uint64_t b, uint=
64_t d, float_status *s)
 RVVCALL(OPFVV3, vfnmsub_vv_h, OP_UUU_H, H2, H2, H2, fnmsub16)
 RVVCALL(OPFVV3, vfnmsub_vv_w, OP_UUU_W, H4, H4, H4, fnmsub32)
 RVVCALL(OPFVV3, vfnmsub_vv_d, OP_UUU_D, H8, H8, H8, fnmsub64)
-GEN_VEXT_VV_ENV(vfnmsub_vv_h)
-GEN_VEXT_VV_ENV(vfnmsub_vv_w)
-GEN_VEXT_VV_ENV(vfnmsub_vv_d)
+GEN_VEXT_VV_ENV(vfnmsub_vv_h, float16)
+GEN_VEXT_VV_ENV(vfnmsub_vv_w, float32)
+GEN_VEXT_VV_ENV(vfnmsub_vv_d, float64)
 RVVCALL(OPFVF3, vfnmsub_vf_h, OP_UUU_H, H2, H2, fnmsub16)
 RVVCALL(OPFVF3, vfnmsub_vf_w, OP_UUU_W, H4, H4, fnmsub32)
 RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
-GEN_VEXT_VF(vfnmsub_vf_h)
-GEN_VEXT_VF(vfnmsub_vf_w)
-GEN_VEXT_VF(vfnmsub_vf_d)
+GEN_VEXT_VF(vfnmsub_vf_h, float16)
+GEN_VEXT_VF(vfnmsub_vf_w, float32)
+GEN_VEXT_VF(vfnmsub_vf_d, float64)
=20
 /* Vector Widening Floating-Point Fused Multiply-Add Instructions */
 static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
@@ -3457,12 +3473,12 @@ static uint64_t fwmacc32(uint32_t a, uint32_t b, uint=
64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
 RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
-GEN_VEXT_VV_ENV(vfwmacc_vv_h)
-GEN_VEXT_VV_ENV(vfwmacc_vv_w)
+GEN_VEXT_VV_ENV(vfwmacc_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwmacc_vv_w, float64)
 RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
 RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
-GEN_VEXT_VF(vfwmacc_vf_h)
-GEN_VEXT_VF(vfwmacc_vf_w)
+GEN_VEXT_VF(vfwmacc_vf_h, float32)
+GEN_VEXT_VF(vfwmacc_vf_w, float64)
=20
 static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *=
s)
 {
@@ -3480,12 +3496,12 @@ static uint64_t fwnmacc32(uint32_t a, uint32_t b, uin=
t64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
 RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_h)
-GEN_VEXT_VV_ENV(vfwnmacc_vv_w)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwnmacc_vv_w, float64)
 RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
 RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
-GEN_VEXT_VF(vfwnmacc_vf_h)
-GEN_VEXT_VF(vfwnmacc_vf_w)
+GEN_VEXT_VF(vfwnmacc_vf_h, float32)
+GEN_VEXT_VF(vfwnmacc_vf_w, float64)
=20
 static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
 {
@@ -3503,12 +3519,12 @@ static uint64_t fwmsac32(uint32_t a, uint32_t b, uint=
64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
 RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
-GEN_VEXT_VV_ENV(vfwmsac_vv_h)
-GEN_VEXT_VV_ENV(vfwmsac_vv_w)
+GEN_VEXT_VV_ENV(vfwmsac_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwmsac_vv_w, float64)
 RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
 RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
-GEN_VEXT_VF(vfwmsac_vf_h)
-GEN_VEXT_VF(vfwmsac_vf_w)
+GEN_VEXT_VF(vfwmsac_vf_h, float32)
+GEN_VEXT_VF(vfwmsac_vf_w, float64)
=20
 static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *=
s)
 {
@@ -3526,12 +3542,12 @@ static uint64_t fwnmsac32(uint32_t a, uint32_t b, uin=
t64_t d, float_status *s)
=20
 RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
 RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_h)
-GEN_VEXT_VV_ENV(vfwnmsac_vv_w)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_h, float32)
+GEN_VEXT_VV_ENV(vfwnmsac_vv_w, float64)
 RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
 RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
-GEN_VEXT_VF(vfwnmsac_vf_h)
-GEN_VEXT_VF(vfwnmsac_vf_w)
+GEN_VEXT_VF(vfwnmsac_vf_h, float32)
+GEN_VEXT_VF(vfwnmsac_vf_w, float64)
=20
 /* Vector Floating-Point Square-Root Instruction */
 /* (TD, T2, TX2) */
@@ -3547,12 +3563,16 @@ static void do_##NAME(void *vd, void *vs2, int i,    =
  \
     *((TD *)vd + HD(i)) =3D OP(s2, &env->fp_status);     \
 }
=20
-#define GEN_VEXT_V_ENV(NAME)                           \
+#define GEN_VEXT_V_ENV(NAME, ETYPE)                    \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
         CPURISCVState *env, uint32_t desc)             \
 {                                                      \
     uint32_t vm =3D vext_vm(desc);                       \
     uint32_t vl =3D env->vl;                             \
+    uint32_t esz =3D sizeof(ETYPE);                      \
+    uint32_t vlmax =3D                                   \
+        vext_get_vlmax(env_archcpu(env), env->vtype);  \
+    uint32_t vta =3D vext_vta(desc);                     \
     uint32_t i;                                        \
                                                        \
     if (vl =3D=3D 0) {                                     \
@@ -3565,14 +3585,18 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,     =
  \
         do_##NAME(vd, vs2, i, env);                    \
     }                                                  \
     env->vstart =3D 0;                                   \
+    /* set tail elements to 1s */                      \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl,      \
+                                     vl * esz,         \
+                                     vlmax * esz);     \
 }
=20
 RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_w, OP_UU_W, H4, H4, float32_sqrt)
 RVVCALL(OPFVV1, vfsqrt_v_d, OP_UU_D, H8, H8, float64_sqrt)
-GEN_VEXT_V_ENV(vfsqrt_v_h)
-GEN_VEXT_V_ENV(vfsqrt_v_w)
-GEN_VEXT_V_ENV(vfsqrt_v_d)
+GEN_VEXT_V_ENV(vfsqrt_v_h, float16)
+GEN_VEXT_V_ENV(vfsqrt_v_w, float32)
+GEN_VEXT_V_ENV(vfsqrt_v_d, float64)
=20
 /*
  * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
@@ -3752,9 +3776,9 @@ static float64 frsqrt7_d(float64 f, float_status *s)
 RVVCALL(OPFVV1, vfrsqrt7_v_h, OP_UU_H, H2, H2, frsqrt7_h)
 RVVCALL(OPFVV1, vfrsqrt7_v_w, OP_UU_W, H4, H4, frsqrt7_s)
 RVVCALL(OPFVV1, vfrsqrt7_v_d, OP_UU_D, H8, H8, frsqrt7_d)
-GEN_VEXT_V_ENV(vfrsqrt7_v_h)
-GEN_VEXT_V_ENV(vfrsqrt7_v_w)
-GEN_VEXT_V_ENV(vfrsqrt7_v_d)
+GEN_VEXT_V_ENV(vfrsqrt7_v_h, float16)
+GEN_VEXT_V_ENV(vfrsqrt7_v_w, float32)
+GEN_VEXT_V_ENV(vfrsqrt7_v_d, float64)
=20
 /*
  * Vector Floating-Point Reciprocal Estimate Instruction
@@ -3943,36 +3967,36 @@ static float64 frec7_d(float64 f, float_status *s)
 RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
 RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
 RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
-GEN_VEXT_V_ENV(vfrec7_v_h)
-GEN_VEXT_V_ENV(vfrec7_v_w)
-GEN_VEXT_V_ENV(vfrec7_v_d)
+GEN_VEXT_V_ENV(vfrec7_v_h, float16)
+GEN_VEXT_V_ENV(vfrec7_v_w, float32)
+GEN_VEXT_V_ENV(vfrec7_v_d, float64)
=20
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
 RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number)
-GEN_VEXT_VV_ENV(vfmin_vv_h)
-GEN_VEXT_VV_ENV(vfmin_vv_w)
-GEN_VEXT_VV_ENV(vfmin_vv_d)
+GEN_VEXT_VV_ENV(vfmin_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmin_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmin_vv_d, float64)
 RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
 RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
 RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
-GEN_VEXT_VF(vfmin_vf_h)
-GEN_VEXT_VF(vfmin_vf_w)
-GEN_VEXT_VF(vfmin_vf_d)
+GEN_VEXT_VF(vfmin_vf_h, float16)
+GEN_VEXT_VF(vfmin_vf_w, float32)
+GEN_VEXT_VF(vfmin_vf_d, float64)
=20
 RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number)
 RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number)
 RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number)
-GEN_VEXT_VV_ENV(vfmax_vv_h)
-GEN_VEXT_VV_ENV(vfmax_vv_w)
-GEN_VEXT_VV_ENV(vfmax_vv_d)
+GEN_VEXT_VV_ENV(vfmax_vv_h, float16)
+GEN_VEXT_VV_ENV(vfmax_vv_w, float32)
+GEN_VEXT_VV_ENV(vfmax_vv_d, float64)
 RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
 RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
 RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
-GEN_VEXT_VF(vfmax_vf_h)
-GEN_VEXT_VF(vfmax_vf_w)
-GEN_VEXT_VF(vfmax_vf_d)
+GEN_VEXT_VF(vfmax_vf_h, float16)
+GEN_VEXT_VF(vfmax_vf_w, float32)
+GEN_VEXT_VF(vfmax_vf_d, float64)
=20
 /* Vector Floating-Point Sign-Injection Instructions */
 static uint16_t fsgnj16(uint16_t a, uint16_t b, float_status *s)
@@ -3993,15 +4017,15 @@ static uint64_t fsgnj64(uint64_t a, uint64_t b, float=
_status *s)
 RVVCALL(OPFVV2, vfsgnj_vv_h, OP_UUU_H, H2, H2, H2, fsgnj16)
 RVVCALL(OPFVV2, vfsgnj_vv_w, OP_UUU_W, H4, H4, H4, fsgnj32)
 RVVCALL(OPFVV2, vfsgnj_vv_d, OP_UUU_D, H8, H8, H8, fsgnj64)
-GEN_VEXT_VV_ENV(vfsgnj_vv_h)
-GEN_VEXT_VV_ENV(vfsgnj_vv_w)
-GEN_VEXT_VV_ENV(vfsgnj_vv_d)
+GEN_VEXT_VV_ENV(vfsgnj_vv_h, float16)
+GEN_VEXT_VV_ENV(vfsgnj_vv_w, float32)
+GEN_VEXT_VV_ENV(vfsgnj_vv_d, float64)
 RVVCALL(OPFVF2, vfsgnj_vf_h, OP_UUU_H, H2, H2, fsgnj16)
 RVVCALL(OPFVF2, vfsgnj_vf_w, OP_UUU_W, H4, H4, fsgnj32)
 RVVCALL(OPFVF2, vfsgnj_vf_d, OP_UUU_D, H8, H8, fsgnj64)
-GEN_VEXT_VF(vfsgnj_vf_h)
-GEN_VEXT_VF(vfsgnj_vf_w)
-GEN_VEXT_VF(vfsgnj_vf_d)
+GEN_VEXT_VF(vfsgnj_vf_h, float16)
+GEN_VEXT_VF(vfsgnj_vf_w, float32)
+GEN_VEXT_VF(vfsgnj_vf_d, float64)
=20
 static uint16_t fsgnjn16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -4021,15 +4045,15 @@ static uint64_t fsgnjn64(uint64_t a, uint64_t b, floa=
t_status *s)
 RVVCALL(OPFVV2, vfsgnjn_vv_h, OP_UUU_H, H2, H2, H2, fsgnjn16)
 RVVCALL(OPFVV2, vfsgnjn_vv_w, OP_UUU_W, H4, H4, H4, fsgnjn32)
 RVVCALL(OPFVV2, vfsgnjn_vv_d, OP_UUU_D, H8, H8, H8, fsgnjn64)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_h)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_w)
-GEN_VEXT_VV_ENV(vfsgnjn_vv_d)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_h, float16)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_w, float32)
+GEN_VEXT_VV_ENV(vfsgnjn_vv_d, float64)
 RVVCALL(OPFVF2, vfsgnjn_vf_h, OP_UUU_H, H2, H2, fsgnjn16)
 RVVCALL(OPFVF2, vfsgnjn_vf_w, OP_UUU_W, H4, H4, fsgnjn32)
 RVVCALL(OPFVF2, vfsgnjn_vf_d, OP_UUU_D, H8, H8, fsgnjn64)
-GEN_VEXT_VF(vfsgnjn_vf_h)
-GEN_VEXT_VF(vfsgnjn_vf_w)
-GEN_VEXT_VF(vfsgnjn_vf_d)
+GEN_VEXT_VF(vfsgnjn_vf_h, float16)
+GEN_VEXT_VF(vfsgnjn_vf_w, float32)
+GEN_VEXT_VF(vfsgnjn_vf_d, float64)
=20
 static uint16_t fsgnjx16(uint16_t a, uint16_t b, float_status *s)
 {
@@ -4049,15 +4073,15 @@ static uint64_t fsgnjx64(uint64_t a, uint64_t b, floa=
t_status *s)
 RVVCALL(OPFVV2, vfsgnjx_vv_h, OP_UUU_H, H2, H2, H2, fsgnjx16)
 RVVCALL(OPFVV2, vfsgnjx_vv_w, OP_UUU_W, H4, H4, H4, fsgnjx32)
 RVVCALL(OPFVV2, vfsgnjx_vv_d, OP_UUU_D, H8, H8, H8, fsgnjx64)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_h)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_w)
-GEN_VEXT_VV_ENV(vfsgnjx_vv_d)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_h, float16)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_w, float32)
+GEN_VEXT_VV_ENV(vfsgnjx_vv_d, float64)
 RVVCALL(OPFVF2, vfsgnjx_vf_h, OP_UUU_H, H2, H2, fsgnjx16)
 RVVCALL(OPFVF2, vfsgnjx_vf_w, OP_UUU_W, H4, H4, fsgnjx32)
 RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
-GEN_VEXT_VF(vfsgnjx_vf_h)
-GEN_VEXT_VF(vfsgnjx_vf_w)
-GEN_VEXT_VF(vfsgnjx_vf_d)
+GEN_VEXT_VF(vfsgnjx_vf_h, float16)
+GEN_VEXT_VF(vfsgnjx_vf_w, float32)
+GEN_VEXT_VF(vfsgnjx_vf_d, float64)
=20
 /* Vector Floating-Point Compare Instructions */
 #define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
@@ -4066,6 +4090,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t vlmax =3D                                          \
+        vext_get_vlmax(env_archcpu(env), env->vtype);         \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -4078,6 +4105,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* clear tail element */                                  \
+    if (vta) {                                                \
+        for (; i < vlmax; i++) {                              \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -4090,6 +4123,9 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void=
 *vs2,       \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
+    uint32_t vlmax =3D                                                \
+        vext_get_vlmax(env_archcpu(env), env->vtype);               \
+    uint32_t vta =3D vext_vta(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
@@ -4101,6 +4137,12 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, voi=
d *vs2,       \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
     env->vstart =3D 0;                                                \
+    /* clear tail element */                                        \
+    if (vta) {                                                      \
+        for (; i < vlmax; i++) {                                    \
+            vext_set_elem_mask(vd, i, 1);                           \
+        }                                                           \
+    }                                                               \
 }
=20
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
@@ -4201,12 +4243,16 @@ static void do_##NAME(void *vd, void *vs2, int i)    =
  \
     *((TD *)vd + HD(i)) =3D OP(s2);                      \
 }
=20
-#define GEN_VEXT_V(NAME)                               \
+#define GEN_VEXT_V(NAME, ETYPE)                        \
 void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
                   CPURISCVState *env, uint32_t desc)   \
 {                                                      \
     uint32_t vm =3D vext_vm(desc);                       \
     uint32_t vl =3D env->vl;                             \
+    uint32_t esz =3D sizeof(ETYPE);                      \
+    uint32_t vlmax =3D                                   \
+        vext_get_vlmax(env_archcpu(env), env->vtype);  \
+    uint32_t vta =3D vext_vta(desc);                     \
     uint32_t i;                                        \
                                                        \
     for (i =3D env->vstart; i < vl; i++) {               \
@@ -4216,6 +4262,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,      =
 \
         do_##NAME(vd, vs2, i);                         \
     }                                                  \
     env->vstart =3D 0;                                   \
+    /* set tail elements to 1s */                      \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl,      \
+                                     vl * esz,         \
+                                     vlmax * esz);     \
 }
=20
 target_ulong fclass_h(uint64_t frs1)
@@ -4278,17 +4328,22 @@ target_ulong fclass_d(uint64_t frs1)
 RVVCALL(OPIVV1, vfclass_v_h, OP_UU_H, H2, H2, fclass_h)
 RVVCALL(OPIVV1, vfclass_v_w, OP_UU_W, H4, H4, fclass_s)
 RVVCALL(OPIVV1, vfclass_v_d, OP_UU_D, H8, H8, fclass_d)
-GEN_VEXT_V(vfclass_v_h)
-GEN_VEXT_V(vfclass_v_w)
-GEN_VEXT_V(vfclass_v_d)
+GEN_VEXT_V(vfclass_v_h, float16)
+GEN_VEXT_V(vfclass_v_w, float32)
+GEN_VEXT_V(vfclass_v_d, float64)
=20
 /* Vector Floating-Point Merge Instruction */
+
 #define GEN_VFMERGE_VF(NAME, ETYPE, H)                        \
 void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
                   CPURISCVState *env, uint32_t desc)          \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t vlmax =3D                                          \
+        vext_get_vlmax(env_archcpu(env), env->vtype);         \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -4297,6 +4352,9 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void=
 *vs2, \
           =3D (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,   \
+                                     vlmax * esz);            \
 }
=20
 GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2)
@@ -4308,33 +4366,33 @@ GEN_VFMERGE_VF(vfmerge_vfm_d, int64_t, H8)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32)
 RVVCALL(OPFVV1, vfcvt_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_h)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_w)
-GEN_VEXT_V_ENV(vfcvt_xu_f_v_d)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_h, float16)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_w, float32)
+GEN_VEXT_V_ENV(vfcvt_xu_f_v_d, float64)
=20
 /* vfcvt.x.f.v vd, vs2, vm # Convert float to signed integer. */
 RVVCALL(OPFVV1, vfcvt_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16)
 RVVCALL(OPFVV1, vfcvt_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32)
 RVVCALL(OPFVV1, vfcvt_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_h)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_w)
-GEN_VEXT_V_ENV(vfcvt_x_f_v_d)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_h, float16)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_w, float32)
+GEN_VEXT_V_ENV(vfcvt_x_f_v_d, float64)
=20
 /* vfcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_xu_v_h, OP_UU_H, H2, H2, uint16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_w, OP_UU_W, H4, H4, uint32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_xu_v_d, OP_UU_D, H8, H8, uint64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_h)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_w)
-GEN_VEXT_V_ENV(vfcvt_f_xu_v_d)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_h, float16)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_w, float32)
+GEN_VEXT_V_ENV(vfcvt_f_xu_v_d, float64)
=20
 /* vfcvt.f.x.v vd, vs2, vm # Convert integer to float. */
 RVVCALL(OPFVV1, vfcvt_f_x_v_h, OP_UU_H, H2, H2, int16_to_float16)
 RVVCALL(OPFVV1, vfcvt_f_x_v_w, OP_UU_W, H4, H4, int32_to_float32)
 RVVCALL(OPFVV1, vfcvt_f_x_v_d, OP_UU_D, H8, H8, int64_to_float64)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_h)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_w)
-GEN_VEXT_V_ENV(vfcvt_f_x_v_d)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_h, float16)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_w, float32)
+GEN_VEXT_V_ENV(vfcvt_f_x_v_d, float64)
=20
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4344,30 +4402,30 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d)
 /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned intege=
r.*/
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32)
 RVVCALL(OPFVV1, vfwcvt_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h)
-GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, float32)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w, float64)
=20
 /* vfwcvt.x.f.v vd, vs2, vm # Convert float to double-width signed integer. =
*/
 RVVCALL(OPFVV1, vfwcvt_x_f_v_h, WOP_UU_H, H4, H2, float16_to_int32)
 RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_h)
-GEN_VEXT_V_ENV(vfwcvt_x_f_v_w)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, float32)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, float64)
=20
 /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width floa=
t */
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h)
-GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b, float16)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, float32)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, float64)
=20
 /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
 RVVCALL(OPFVV1, vfwcvt_f_x_v_b, WOP_UU_B, H2, H1, int8_to_float16)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
 RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_b)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_h)
-GEN_VEXT_V_ENV(vfwcvt_f_x_v_w)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_b, float16)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, float32)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, float64)
=20
 /*
  * vfwcvt.f.f.v vd, vs2, vm
@@ -4380,8 +4438,8 @@ static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
=20
 RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
 RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_h)
-GEN_VEXT_V_ENV(vfwcvt_f_f_v_w)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, float32)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, float64)
=20
 /* Narrowing Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
@@ -4392,29 +4450,29 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16)
 RVVCALL(OPFVV1, vfncvt_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_b)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_h)
-GEN_VEXT_V_ENV(vfncvt_xu_f_w_w)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_b, uint8_t)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_h, uint16_t)
+GEN_VEXT_V_ENV(vfncvt_xu_f_w_w, uint32_t)
=20
 /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integer. =
*/
 RVVCALL(OPFVV1, vfncvt_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8)
 RVVCALL(OPFVV1, vfncvt_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16)
 RVVCALL(OPFVV1, vfncvt_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_b)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_h)
-GEN_VEXT_V_ENV(vfncvt_x_f_w_w)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_b, int8_t)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_h, int16_t)
+GEN_VEXT_V_ENV(vfncvt_x_f_w_w, int32_t)
=20
 /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to floa=
t */
 RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_xu_w_h)
-GEN_VEXT_V_ENV(vfncvt_f_xu_w_w)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, float16)
+GEN_VEXT_V_ENV(vfncvt_f_xu_w_w, float32)
=20
 /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
 RVVCALL(OPFVV1, vfncvt_f_x_w_h, NOP_UU_H, H2, H4, int32_to_float16)
 RVVCALL(OPFVV1, vfncvt_f_x_w_w, NOP_UU_W, H4, H8, int64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_x_w_h)
-GEN_VEXT_V_ENV(vfncvt_f_x_w_w)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_h, float16)
+GEN_VEXT_V_ENV(vfncvt_f_x_w_w, float32)
=20
 /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float. */
 static uint16_t vfncvtffv16(uint32_t a, float_status *s)
@@ -4424,8 +4482,8 @@ static uint16_t vfncvtffv16(uint32_t a, float_status *s)
=20
 RVVCALL(OPFVV1, vfncvt_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16)
 RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
-GEN_VEXT_V_ENV(vfncvt_f_f_w_h)
-GEN_VEXT_V_ENV(vfncvt_f_f_w_w)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_h, float16)
+GEN_VEXT_V_ENV(vfncvt_f_f_w_w, float32)
=20
 /*
  *** Vector Reduction Operations
--=20
2.34.1


