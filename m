Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF49053E10B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 08:32:24 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny6Hn-0002iw-Px
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 02:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny62A-0001aY-33; Mon, 06 Jun 2022 02:16:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:48024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1ny621-0000is-WF; Mon, 06 Jun 2022 02:16:08 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8EBC311F031;
 Mon,  6 Jun 2022 06:15:47 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 04:21:37 -0800
Subject: [PATCH qemu v19 13/16] target/riscv: rvv: Add tail agnostic for
 vector reduction instructions
Message-ID: <165449614532.19704.7000832880482980398-13@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165449614532.19704.7000832880482980398-0@git.sr.ht>
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

From: eopXD <yueh.ting.chen@gmail.com>

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8ac7fabb05..2ab4308ef0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4534,6 +4534,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
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
@@ -4546,6 +4549,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
   \
     }                                                     \
     *((TD *)vd + HD(0)) =3D s1;                             \
     env->vstart =3D 0;                                      \
+    /* set tail elements to 1s */                         \
+    vext_set_elems_1s(vd, vta, esz, vlenb);               \
 }
=20
 /* vd[0] =3D sum(vs1[0], vs2[*]) */
@@ -4615,6 +4620,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
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
@@ -4627,6 +4635,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
    \
     }                                                      \
     *((TD *)vd + HD(0)) =3D s1;                              \
     env->vstart =3D 0;                                       \
+    /* set tail elements to 1s */                          \
+    vext_set_elems_1s(vd, vta, esz, vlenb);                \
 }
=20
 /* Unordered sum */
@@ -4651,6 +4661,9 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
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
@@ -4664,6 +4677,8 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *v=
s1,
     }
     *((uint32_t *)vd + H4(0)) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
@@ -4671,6 +4686,9 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
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
@@ -4684,6 +4702,8 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *v=
s1,
     }
     *((uint64_t *)vd) =3D s1;
     env->vstart =3D 0;
+    /* set tail elements to 1s */
+    vext_set_elems_1s(vd, vta, esz, vlenb);
 }
=20
 /*
--=20
2.34.2


