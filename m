Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC5A5223F3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 20:28:11 +0200 (CEST)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noUae-000598-N4
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 14:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noUYm-0001mJ-AX; Tue, 10 May 2022 14:26:12 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:44996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1noUYk-0003QW-EP; Tue, 10 May 2022 14:26:11 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5141F11F04D;
 Tue, 10 May 2022 18:26:08 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 17 Mar 2022 00:47:13 -0700
Subject: [PATCH qemu v2 02/10] target/riscv: rvv: Add mask agnostic for vector
 load / store instructions
Message-ID: <165220716770.22380.2493420346587893209-2@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc |  9 +++++++
 target/riscv/vector_helper.c            | 35 +++++++++++++++++--------
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index 63ddd54669..9a2d54313a 100644
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
@@ -778,6 +780,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, NF, 1);
     /* Mask destination register are always tail-agnostic */
     data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
=20
@@ -797,6 +800,7 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, NF, 1);
     /* Mask destination register are always tail-agnostic */
     data =3D FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
 }
=20
@@ -869,6 +873,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -899,6 +904,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, u=
int8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     fn =3D fns[eew];
     if (fn =3D=3D NULL) {
         return false;
@@ -1000,6 +1006,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
=20
@@ -1053,6 +1060,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, =
uint8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
 }
=20
@@ -1119,6 +1127,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uin=
t8_t eew)
     data =3D FIELD_DP32(data, VDATA, LMUL, emul);
     data =3D FIELD_DP32(data, VDATA, NF, a->nf);
     data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
+    data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
=20
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 934b283db2..89eea33eb3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -282,14 +282,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t esz =3D 1 << log2_esz;
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
=20
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-
         k =3D 0;
         while (k < nf) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s(vd, vma,(i + k * max_elems) * esz,
+                                  (i + k * max_elems + 1) * esz);
+                k++;
+                continue;
+            }
             target_ulong addr =3D base + stride * i + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
@@ -481,15 +485,19 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t esz =3D 1 << log2_esz;
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
=20
     /* load bytes from guest memory */
     for (i =3D env->vstart; i < env->vl; i++, env->vstart++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-
         k =3D 0;
         while (k < nf) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s(vd, vma,(i + k * max_elems) * esz,
+                                  (i + k * max_elems + 1) * esz);
+                k++;
+                continue;
+            }
             abi_ptr addr =3D get_index_addr(base, i, vs2) + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
@@ -578,6 +586,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t esz =3D 1 << log2_esz;
     uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
     uint32_t vta =3D vext_vta(desc);
+    uint32_t vma =3D vext_vma(desc);
     target_ulong addr, offset, remain;
=20
     /* probe every access*/
@@ -623,10 +632,14 @@ ProbeSuccess:
     }
     for (i =3D env->vstart; i < env->vl; i++) {
         k =3D 0;
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
         while (k < nf) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s(vd, vma,(i + k * max_elems) * esz,
+                                  (i + k * max_elems + 1) * esz);
+                k++;
+                continue;
+            }
             target_ulong addr =3D base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra=
);
             k++;
--=20
2.34.2


