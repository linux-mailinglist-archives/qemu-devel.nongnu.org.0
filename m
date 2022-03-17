Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D441950E303
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:25:44 +0200 (CEST)
Received: from localhost ([::1]:54776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizep-0000lt-W9
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY3-0007HJ-M7; Mon, 25 Apr 2022 10:18:45 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nizY1-0003PS-Ri; Mon, 25 Apr 2022 10:18:43 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2EC0211EF53;
 Mon, 25 Apr 2022 14:18:40 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Thu, 17 Mar 2022 01:43:10 -0700
Subject: [PATCH qemu 4/9] target/riscv: rvv: Add mask agnostic for vector
 integer shift instructions
Message-ID: <165089631935.4839.7564289944057093570-4@git.sr.ht>
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
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 target/riscv/vector_helper.c            | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index e2bdfc0fae..a085ef2c29 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1935,6 +1935,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 658ea0244d..269e40c251 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1291,10 +1291,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,     =
                     \
     uint32_t esz =3D sizeof(TS1);                                           \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz);               \
     uint32_t vta =3D vext_vta(desc);                                        \
+    uint32_t vma =3D vext_vma(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i, i * esz,         \
+                                             (i + 1) * esz);              \
             continue;                                                     \
         }                                                                 \
         TS1 s1 =3D *((TS1 *)vs1 + HS1(i));                                  \
@@ -1332,10 +1336,15 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
,      \
     uint32_t esz =3D sizeof(TD);                              \
     uint32_t total_elems =3D vext_get_total_elems(desc, esz); \
     uint32_t vta =3D vext_vta(desc);                          \
+    uint32_t vma =3D vext_vma(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i =3D env->vstart; i < vl; i++) {                    \
         if (!vm && !vext_elem_mask(v0, i)) {                \
+            /* set masked-off elements to 1s */             \
+            vext_set_elems_1s_fns[ctzl(esz)](vd, vma, i,    \
+                                             i * esz,       \
+                                             (i + 1) * esz);\
             continue;                                       \
         }                                                   \
         TS2 s2 =3D *((TS2 *)vs2 + HS2(i));                    \
--=20
2.34.2


