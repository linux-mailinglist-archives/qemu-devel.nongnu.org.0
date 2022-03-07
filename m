Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D75106BC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:22:35 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPpa-0007oI-5L
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njPfn-0004gy-NM; Tue, 26 Apr 2022 14:12:27 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:42032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njPfm-0003MB-4u; Tue, 26 Apr 2022 14:12:27 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 1C45B11F087;
 Tue, 26 Apr 2022 18:12:01 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 04:21:37 -0800
Subject: [PATCH qemu v8 12/14] target/riscv: rvv: Add tail agnostic for vector
 reduction instructions
Message-ID: <165099671854.27992.10018115463292837504-12@git.sr.ht>
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
 target/riscv/vector_helper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a85a0c667e..7884314779 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4533,6 +4533,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
 {                                                         \
     uint32_t vm =3D vext_vm(desc);                          \
     uint32_t vl =3D env->vl;                                \
+    uint32_t esz =3D sizeof(TD);                            \
+    uint32_t vlenb =3D simd_maxsz(desc);                    \
+    uint32_t vta =3D vext_vta(desc);                        \
     uint32_t i;                                           \
     TD s1 =3D  *((TD *)vs1 + HD(0));                        \
                                                           \
@@ -4545,6 +4548,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, 1, esz,     \
+                                     vlenb);              \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
@@ -4614,6 +4620,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
    \
 {                                                          \
     uint32_t vm =3D vext_vm(desc);                           \
     uint32_t vl =3D env->vl;                                 \
+    uint32_t esz =3D sizeof(TD);                             \
+    uint32_t vlenb =3D simd_maxsz(desc);                     \
+    uint32_t vta =3D vext_vta(desc);                         \
     uint32_t i;                                            \
     TD s1 =3D  *((TD *)vs1 + HD(0));                         \
                                                            \
@@ -4626,6 +4635,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
    \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
     env->vstart =3D 0;                                       \
+    /* set tail elements to 1s */                          \
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, 1, esz,      \
+                                     vlenb);               \
 }
=20
 /* Unordered sum */
@@ -4650,6 +4662,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
s1,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t esz =3D sizeof(uint32_t);
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
     uint32_t s1 =3D  *((uint32_t *)vs1 + H4(0));
=20
@@ -4663,6 +4678,8 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
s1,
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, 1, esz, vlenb);
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4670,6 +4687,9 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
s1,
 {
     uint32_t vm =3D vext_vm(desc);
     uint32_t vl =3D env->vl;
+    uint32_t esz =3D sizeof(uint64_t);
+    uint32_t vlenb =3D simd_maxsz(desc);
+    uint32_t vta =3D vext_vta(desc);
     uint32_t i;
     uint64_t s1 =3D  *((uint64_t *)vs1);
=20
@@ -4683,6 +4703,8 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
s1,
     }
     *((uint64_t *)vd) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, 1, esz, vlenb);
 }
=20
 /*
--=20
2.34.2


