Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF478516EAC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 13:15:53 +0200 (CEST)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlU1w-0000uW-TV
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 07:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nlTyd-0006Ms-Ul; Mon, 02 May 2022 07:12:29 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nlTyX-0004QN-Uo; Mon, 02 May 2022 07:12:24 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C251311F108;
 Mon,  2 May 2022 11:12:10 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 07 Mar 2022 01:38:18 -0800
Subject: [PATCH qemu v13 07/15] target/riscv: rvv: Add tail agnostic for
 vector integer shift instructions
Message-ID: <165148992946.19543.7306630137674612238-7@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <165148992946.19543.7306630137674612238-0@git.sr.ht>
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 11 +++++++++++
 target/riscv/vector_helper.c            | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_tran=
s/trans_rvv.c.inc
index d15858fc6f..430847b0f9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1858,6 +1858,16 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVec=
Gen2sFn32 *gvec_fn,
     }
=20
     if (a->vm && s->vl_eq_vlmax) {
+        if (s->vta && s->lmul < 0) {
+            /*
+             * tail elements may pass vlmax when lmul < 0
+             * set tail elements to 1s
+             */
+            uint32_t vlenb =3D s->cfg_ptr->vlen >> 3;
+            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
+                             vreg_ofs(s, a->rd), -1,
+                             vlenb, vlenb);
+        }
         TCGv_i32 src1 =3D tcg_temp_new_i32();
=20
         tcg_gen_trunc_tl_i32(src1, get_gpr(s, a->rs1, EXT_NONE));
@@ -1916,6 +1926,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a) =
            \
                                                                    \
         data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        data =3D FIELD_DP32(data, VDATA, VTA, s->vta);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e00f9353b9..c1ae2ea2f1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1273,6 +1273,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
                   \
 {                                                                         \
     uint32_t vm =3D vext_vm(desc);                                          \
     uint32_t vl =3D env->vl;                                                \
+    uint32_t esz =3D sizeof(TS1);                                           \
+    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);          \
+    uint32_t vta =3D vext_vta(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
     for (i =3D env->vstart; i < vl; i++) {                                  \
@@ -1284,6 +1287,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,       =
                   \
         *((TS1 *)vd + HS1(i)) =3D OP(s2, s1 & MASK);                        \
     }                                                                     \
     env->vstart =3D 0;                                                      \
+    /* set tail elements to 1s */                                         \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
 }
=20
 GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
@@ -1308,6 +1313,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,=
      \
 {                                                           \
     uint32_t vm =3D vext_vm(desc);                            \
     uint32_t vl =3D env->vl;                                  \
+    uint32_t esz =3D sizeof(TD);                              \
+    uint32_t total_elems =3D                                  \
+        vext_get_total_elems(env, desc, esz);               \
+    uint32_t vta =3D vext_vta(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i =3D env->vstart; i < vl; i++) {                    \
@@ -1318,6 +1327,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, =
     \
         *((TD *)vd + HD(i)) =3D OP(s2, s1 & MASK);            \
     }                                                       \
     env->vstart =3D 0;                                        \
+    /* set tail elements to 1s */                           \
+    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);\
 }
=20
 GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
--=20
2.34.2


