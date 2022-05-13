Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470C5261B2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:19:33 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUGa-0001gq-7A
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1npTw1-0000MY-1D; Fri, 13 May 2022 07:58:19 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:45442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1npTvx-00028r-6Y; Fri, 13 May 2022 07:58:15 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9058E11F12B;
 Fri, 13 May 2022 11:58:10 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 17 Mar 2022 02:14:47 -0700
Subject: [PATCH qemu v4 08/10] target/riscv: rvv: Add mask agnostic for vector
 mask instructions
Message-ID: <165244308918.21805.1094821418229175817-8@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165244308918.21805.1094821418229175817-0@git.sr.ht>
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  3 +++
 target/riscv/vector_helper.c            | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index f37040f278..333c6f5ef5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3263,6 +3263,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  =
            \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
                            vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
                            cpu_env, s->cfg_ptr->vlen / 8,          \
@@ -3301,6 +3302,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m =
*a)
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         static gen_helper_gvec_3_ptr * const fns[4] =3D {
             gen_helper_viota_m_b, gen_helper_viota_m_h,
             gen_helper_viota_m_w, gen_helper_viota_m_d,
@@ -3331,6 +3333,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
         static gen_helper_gvec_2_ptr * const fns[4] =3D {
             gen_helper_vid_v_b, gen_helper_vid_v_h,
             gen_helper_vid_v_w, gen_helper_vid_v_d,
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index bcac0a9f1b..e4c6530dfa 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4878,11 +4878,16 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPU=
RISCVState *env,
     uint32_t vl =3D env->vl;
     uint32_t total_elems =3D env_archcpu(env)->cfg.vlen;
     uint32_t vta_all_1s =3D vext_vta_all_1s(desc);
+    uint32_t vma =3D vext_vma(desc);
     int i;
     bool first_mask_bit =3D false;
=20
     for (i =3D env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            if (vma) {
+                vext_set_elem_mask(vd, i, 1);
+            }
             continue;
         }
         /* write a zero to all following active elements */
@@ -4943,11 +4948,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPUR=
ISCVState *env,      \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     uint32_t sum =3D 0;                                                     \
     int i;                                                                \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D sum;                                      \
@@ -4974,10 +4982,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *=
env, uint32_t desc)  \
     uint32_t esz =3D sizeof(ETYPE);                                         \
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     int i;                                                                \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) =3D i;                                        \
--=20
2.34.2


