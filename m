Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A853E576
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:29:17 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEfM-0003Ng-5U
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEG6-0004j4-E6; Mon, 06 Jun 2022 11:03:10 -0400
Received: from [187.72.171.209] (port=49794 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEG4-000524-M2; Mon, 06 Jun 2022 11:03:10 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 6 Jun 2022 12:01:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 914F2801301;
 Mon,  6 Jun 2022 12:01:36 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 7/7] target/ppc: use int128.h methods in vsubcuq
Date: Mon,  6 Jun 2022 12:00:37 -0300
Message-Id: <20220606150037.338931-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Jun 2022 15:01:36.0824 (UTC)
 FILETIME=[51A58380:01D879B6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And also move the insn to decodetree and remove the now unused
avr_qw_not, avr_qw_cmpu, and avr_qw_add methods.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  1 +
 target/ppc/int_helper.c             | 51 +++--------------------------
 target/ppc/translate/vmx-impl.c.inc |  5 +--
 target/ppc/translate/vmx-ops.c.inc  |  2 +-
 5 files changed, 9 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 04ced6ef70..84a41d85b0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -211,7 +211,7 @@ DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VSUBUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VSUBECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VSUBEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VSUBCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsldoi, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vextractub, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vextractuh, TCG_CALL_NO_RWG, void, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5e6f3b668e..65a6a42f78 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -556,6 +556,7 @@ VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
 VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
+VSUBCUQ         000100 ..... ..... ..... 10101000000    @VX
 VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
 
 VSUBECUQ        000100 ..... ..... ..... ..... 111111   @VA
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c995f8de77..f1a9fbf0c5 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2176,38 +2176,6 @@ VGENERIC_DO(popcntd, u64)
 
 #undef VGENERIC_DO
 
-#ifndef CONFIG_INT128
-
-static inline void avr_qw_not(ppc_avr_t *t, ppc_avr_t a)
-{
-    t->u64[0] = ~a.u64[0];
-    t->u64[1] = ~a.u64[1];
-}
-
-static int avr_qw_cmpu(ppc_avr_t a, ppc_avr_t b)
-{
-    if (a.VsrD(0) < b.VsrD(0)) {
-        return -1;
-    } else if (a.VsrD(0) > b.VsrD(0)) {
-        return 1;
-    } else if (a.VsrD(1) < b.VsrD(1)) {
-        return -1;
-    } else if (a.VsrD(1) > b.VsrD(1)) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
-static void avr_qw_add(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
-{
-    t->VsrD(1) = a.VsrD(1) + b.VsrD(1);
-    t->VsrD(0) = a.VsrD(0) + b.VsrD(0) +
-                     (~a.VsrD(1) < b.VsrD(1));
-}
-
-#endif
-
 void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     r->s128 = int128_add(a->s128, b->s128);
@@ -2250,22 +2218,13 @@ void helper_VSUBEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
                          int128_make64(int128_getlo(c->s128) & 1));
 }
 
-void helper_vsubcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VSUBCUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-#ifdef CONFIG_INT128
-    r->u128 = (~a->u128 < ~b->u128) ||
-                 (a->u128 + ~b->u128 == (__uint128_t)-1);
-#else
-    int carry = (avr_qw_cmpu(*a, *b) > 0);
-    if (!carry) {
-        ppc_avr_t tmp;
-        avr_qw_not(&tmp, *b);
-        avr_qw_add(&tmp, *a, tmp);
-        carry = ((tmp.VsrSD(0) == -1ull) && (tmp.VsrSD(1) == -1ull));
-    }
+    Int128 tmp = int128_not(b->s128);
+
+    r->VsrD(1) = int128_ult(int128_not(a->s128), tmp) ||
+                 int128_eq(int128_add(a->s128, tmp), int128_makes64(-1));
     r->VsrD(0) = 0;
-    r->VsrD(1) = carry;
-#endif
 }
 
 void helper_VSUBECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 671992f7d1..e644ad3236 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
-GEN_VXFORM(vsubcuq, 0, 21);
 GEN_VXFORM_TRANS(vsl, 2, 7);
 GEN_VXFORM_TRANS(vsr, 2, 11);
 GEN_VXFORM_ENV(vpkuhum, 7, 0);
@@ -2856,9 +2855,6 @@ GEN_VXFORM_DUAL(vsubuwm, PPC_ALTIVEC, PPC_NONE, \
                 bcdus, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubsbs, PPC_ALTIVEC, PPC_NONE, \
                 bcdtrunc, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_DUAL(vsubcuq, PPC2_ALTIVEC_207, PPC_NONE, \
-                bcdutrunc, PPC_NONE, PPC2_ISA300)
-
 
 static void gen_vsbox(DisasContext *ctx)
 {
@@ -3098,6 +3094,7 @@ TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
 
 TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 
+TRANS_FLAGS2(ALTIVEC_207, VSUBCUQ, do_vx_helper, gen_helper_VSUBCUQ)
 TRANS_FLAGS2(ALTIVEC_207, VSUBUQM, do_vx_helper, gen_helper_VSUBUQM)
 
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 9395806f3d..a3a0fd0650 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -127,7 +127,7 @@ GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM_300(bcdtrunc, 0, 20),
-GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
+GEN_VXFORM_300(bcdutrunc, 0, 21),
 GEN_VXFORM(vsl, 2, 7),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
-- 
2.25.1


