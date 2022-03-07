Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEC05106A5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:19:55 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPn0-0001Gl-AV
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njPfT-0003jX-7e; Tue, 26 Apr 2022 14:12:07 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:42022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1njPfR-0003Lg-Ne; Tue, 26 Apr 2022 14:12:06 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6913711F013;
 Tue, 26 Apr 2022 18:12:00 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 01:43:53 -0800
Subject: [PATCH qemu v8 08/14] target/riscv: rvv: Add tail agnostic for vector
 integer comparison instructions
Message-ID: <165099671854.27992.10018115463292837504-8@git.sr.ht>
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
 target/riscv/vector_helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1462a664c6..ed72fffb71 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1358,6 +1358,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *=
vs2,   \
 {                                                             \
     uint32_t vm =3D vext_vm(desc);                              \
     uint32_t vl =3D env->vl;                                    \
+    uint32_t esz =3D sizeof(ETYPE);                             \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);   \
+    uint32_t vta =3D vext_vta(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i =3D env->vstart; i < vl; i++) {                      \
@@ -1369,6 +1372,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void =
*vs2,   \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
     env->vstart =3D 0;                                          \
+    /* set tail elements to 1s */                             \
+    if (vta) {                                                \
+        for (; i < total_elems; i++) {                        \
+            vext_set_elem_mask(vd, i, 1);                     \
+        }                                                     \
+    }                                                         \
 }
=20
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1407,6 +1416,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
void *vs2,   \
 {                                                                   \
     uint32_t vm =3D vext_vm(desc);                                    \
     uint32_t vl =3D env->vl;                                          \
+    uint32_t esz =3D sizeof(ETYPE);                                   \
+    uint32_t total_elems =3D vext_get_total_elems(desc, esz);         \
+    uint32_t vta =3D vext_vta(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i =3D env->vstart; i < vl; i++) {                            \
@@ -1418,6 +1430,12 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
 void *vs2,   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
     env->vstart =3D 0;                                                \
+    /* set tail elements to 1s */                                   \
+    if (vta) {                                                      \
+        for (; i < total_elems; i++) {                              \
+            vext_set_elem_mask(vd, i, 1);                           \
+        }                                                           \
+    }                                                               \
 }
=20
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
--=20
2.34.2


