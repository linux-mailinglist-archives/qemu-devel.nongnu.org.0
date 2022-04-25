Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05E50E337
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:32:41 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizlY-0003vA-Po
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY5-0007HO-5O; Mon, 25 Apr 2022 10:18:45 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:41750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY2-0003PP-Bo; Mon, 25 Apr 2022 10:18:44 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id DDB1B11EF19;
 Mon, 25 Apr 2022 14:18:39 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 17 Mar 2022 00:47:13 -0700
Subject: [PATCH qemu 2/9] target/riscv: rvv: Add mask agnostic for vector load
 / store instructions
Message-ID: <165089631935.4839.7564289944057093570-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165089631935.4839.7564289944057093570-0@git.sr.ht>
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

From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc |  9 +++++++++
 target/riscv/vector_helper.c            | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 4610107fb4..4e141e5145 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -712,6 +712,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint=
8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -750,6 +751,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint=
8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -777,6 +779,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -795,6 +798,7 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, 0);
     data =3D FIELD_DP32(data, VDATA, NF, 1);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -867,6 +871,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -897,6 +902,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     fn =3D fns[eew];
     if (fn =3D=3D NULL) {
         return false;
@@ -998,6 +1004,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -1051,6 +1058,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
=20
@@ -1117,6 +1125,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uin=
t8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 141a06ddf0..bd84b0409c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -296,9 +296,17 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
     uint32_t esz =3D 1 << log2_esz;
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            k =3D 0;
+            while (k < nf) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i + k * max_elems,
+                    (i + k * max_elems) * esz, (i + k * max_elems + 1) * esz=
);
+                k++;
+            }
             continue;
         }
=20
@@ -479,10 +487,18 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
     uint32_t esz =3D 1 << log2_esz;
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            k =3D 0;
+            while (k < nf) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i + k * max_elems,
+                    (i + k * max_elems) * esz, (i + k * max_elems + 1) * esz=
);
+                k++;
+            }
             continue;
         }
=20
@@ -568,6 +584,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t max_elems =3D vext_max_elems(desc, log2_esz);
     uint32_t esz =3D 1 << log2_esz;
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -614,6 +631,9 @@ ProbeSuccess:
     for (i =3D env->vstart; i < env->vl; i++) {
         k =3D 0;
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i + k * max_elems,
+                (i + k * max_elems) * esz, (i + k * max_elems + 1) * esz);
             continue;
         }
         while (k < nf) {
--=20
2.34.2


