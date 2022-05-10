Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4BE5223F2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 20:28:01 +0200 (CEST)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noUaW-0004jA-9a
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 14:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noUYq-0001ne-2H; Tue, 10 May 2022 14:26:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noUYm-0003SR-Ui; Tue, 10 May 2022 14:26:15 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 15DAB11F0D9;
 Tue, 10 May 2022 18:26:09 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 17 Mar 2022 02:08:01 -0700
Subject: [PATCH qemu v2 07/10] target/riscv: rvv: Add mask agnostic for vector
 floating-point instructions
Message-ID: <165220716770.22380.2493420346587893209-7@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165220716770.22380.2493420346587893209-0@git.sr.ht>
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

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++++
 target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 5cbf323c18..8fb8045957 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2428,6 +2428,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         data =3D                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2513,6 +2514,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);              \
         data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S,                \
                           s->cfg_vta_all_1s);                     \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);              \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
                            fns[s->sew - 1], s);                   \
     }                                                             \
@@ -2552,6 +2554,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
@@ -2592,6 +2595,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2629,6 +2633,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2669,6 +2674,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
          \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2753,6 +2759,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->cfg_ptr->vlen / 8,
@@ -2867,6 +2874,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_=
f *a)
             TCGv_i32 desc;
             uint32_t data =3D FIELD_DP32(0, VDATA, LMUL, s->lmul);
             data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+            data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
             static gen_helper_vmv_vx * const fns[3] =3D {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
@@ -2968,6 +2976,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3021,6 +3030,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3089,6 +3099,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3144,6 +3155,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4e48c92617..5b9d766e0e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3053,10 +3053,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,     =
     \
     uint32_t total_elems =3D                                \
         vext_get_total_elems(env, desc, ESZ);             \
     uint32_t vta =3D vext_vta(desc);                        \
+    uint32_t vma =3D vext_vma(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
+            /* set masked-off elements to 1s */           \
+            vext_set_elems_1s(vd, vma, i * ESZ,           \
+                              (i + 1) * ESZ);             \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
@@ -3092,10 +3096,14 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,   =
     \
     uint32_t total_elems =3D                                \
         vext_get_total_elems(env, desc, ESZ);              \
     uint32_t vta =3D vext_vta(desc);                        \
+    uint32_t vma =3D vext_vma(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i =3D env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
+            /* set masked-off elements to 1s */           \
+            vext_set_elems_1s(vd, vma, i * ESZ,           \
+                              (i + 1) * ESZ);             \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
@@ -3667,6 +3675,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     uint32_t total_elems =3D                             \
         vext_get_total_elems(env, desc, ESZ);          \
     uint32_t vta =3D vext_vta(desc);                     \
+    uint32_t vma =3D vext_vma(desc);                     \
     uint32_t i;                                        \
                                                        \
     if (vl =3D=3D 0) {                                     \
@@ -3674,6 +3683,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     }                                                  \
     for (i =3D env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
@@ -4184,12 +4196,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,   \
     uint32_t vl =3D env->vl;                                    \
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;        \
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
+    uint32_t vma =3D vext_vma(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
         ETYPE s1 =3D *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
+            /* set masked-off elements to 1s */               \
+            if (vma) {                                        \
+                vext_set_elem_mask(vd, i, 1);                 \
+            }                                                 \
             continue;                                         \
         }                                                     \
         vext_set_elem_mask(vd, i,                             \
@@ -4217,11 +4234,16 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, vo=
id *vs2,       \
     uint32_t vl =3D env->vl;                                          \
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;              \
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
+    uint32_t vma =3D vext_vma(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
         ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
+            /* set masked-off elements to 1s */                     \
+            if (vma) {                                              \
+                vext_set_elem_mask(vd, i, 1);                       \
+            }                                                       \
             continue;                                               \
         }                                                           \
         vext_set_elem_mask(vd, i,                                   \
@@ -4344,10 +4366,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,     =
  \
     uint32_t total_elems =3D                             \
         vext_get_total_elems(env, desc, ESZ);          \
     uint32_t vta =3D vext_vta(desc);                     \
+    uint32_t vma =3D vext_vma(desc);                     \
     uint32_t i;                                        \
                                                        \
     for (i =3D env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
--=20
2.34.2


