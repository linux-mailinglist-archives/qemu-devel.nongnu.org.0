Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F05106BD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:22:35 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPpa-0007pq-OX
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njPfS-0003iD-CS; Tue, 26 Apr 2022 14:12:06 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:42018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njPfQ-0003Kt-6a; Tue, 26 Apr 2022 14:12:05 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id EEE0211EFFB;
 Tue, 26 Apr 2022 18:11:59 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Sun, 06 Mar 2022 23:10:25 -0800
Subject: [PATCH qemu v8 05/14] target/riscv: rvv: Add tail agnostic for vector
 load / store instructions
Message-ID: <165099671854.27992.10018115463292837504-5@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165099671854.27992.10018115463292837504-0@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc |  9 ++++++++
 target/riscv/vector_helper.c            | 28 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index cc80bf00ff..66cfc8c603 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint=
8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint=
8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -774,6 +776,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, =
uint8_t eew)
     /* EMUL =3D 1, NFIELDS =3D 1 */
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -791,6 +794,7 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, =
uint8_t eew)
     /* EMUL =3D 1, NFIELDS =3D 1 */
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -862,6 +866,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -891,6 +896,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     fn =3D fns[eew];
     if (fn =3D=3D NULL) {
         return false;
@@ -991,6 +997,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, ui=
nt8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -1043,6 +1050,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
=20
@@ -1108,6 +1116,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uin=
t8_t eew)
     data =3D FIELD_DP32(data, VDATA, VM, a->vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
+    data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ea1c409e16..a72b59554e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -289,6 +289,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
@@ -303,6 +305,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * max_elems,
+                                        env->vl * esz, max_elems * esz);
+    }
 }
=20
 #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
@@ -348,6 +355,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *=
env, uint32_t desc,
     uint32_t i, k;
     uint32_t nf =3D vext_nf(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < evl; i++, env->vstart++) {
@@ -359,6 +368,11 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState =
*env, uint32_t desc,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * max_elems,
+                                        env->vl * esz, max_elems * esz);
+    }
 }
=20
 /*
@@ -458,6 +472,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
@@ -473,6 +489,11 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * max_elems,
+                                        env->vl * esz, max_elems * esz);
+    }
 }
=20
 #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
@@ -540,6 +561,8 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t nf =3D vext_nf(desc);
     uint32_t vm =3D vext_vm(desc);
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
+    uint32_t esz =3D 1 << log2_esz;
+    uint32_t vta =3D vext_vta(desc);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -595,6 +618,11 @@ ProbeSuccess:
         }
     }
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    for (k =3D 0; k < nf; ++k) {
+        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * max_elems,
+                                        env->vl * esz, max_elems * esz);
+    }
 }
=20
 #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
--=20
2.34.2


