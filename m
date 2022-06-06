Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5553E54F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:09:40 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEMN-0004im-Hv
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEG0-0004UL-SH; Mon, 06 Jun 2022 11:03:04 -0400
Received: from [187.72.171.209] (port=49794 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyEFz-000524-6y; Mon, 06 Jun 2022 11:03:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 6 Jun 2022 12:01:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2CF4C801301;
 Mon,  6 Jun 2022 12:01:36 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 5/7] target/ppc: use int128.h methods in vsubuqm
Date: Mon,  6 Jun 2022 12:00:35 -0300
Message-Id: <20220606150037.338931-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
References: <20220606150037.338931-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Jun 2022 15:01:36.0433 (UTC)
 FILETIME=[5169DA10:01D879B6]
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

And also move the insn to decodetree

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             | 19 ++-----------------
 target/ppc/translate/vmx-impl.c.inc |  5 ++---
 target/ppc/translate/vmx-ops.c.inc  |  2 +-
 5 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f6b1b2fad2..1c02ad85e5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -208,7 +208,7 @@ DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VSUBUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 35252ddd4f..a8d3a5a8a1 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -556,6 +556,8 @@ VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
 VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
+VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
+
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
 VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index a12f2831ac..625cc92a55 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2176,12 +2176,6 @@ VGENERIC_DO(popcntd, u64)
 
 #undef VGENERIC_DO
 
-#if HOST_BIG_ENDIAN
-#define QW_ONE { .u64 = { 0, 1 } }
-#else
-#define QW_ONE { .u64 = { 1, 0 } }
-#endif
-
 #ifndef CONFIG_INT128
 
 static inline void avr_qw_not(ppc_avr_t *t, ppc_avr_t a)
@@ -2245,18 +2239,9 @@ void helper_VADDECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     r->VsrD(1) = carry_out;
 }
 
-void helper_vsubuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VSUBUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-#ifdef CONFIG_INT128
-    r->u128 = a->u128 - b->u128;
-#else
-    ppc_avr_t tmp;
-    ppc_avr_t one = QW_ONE;
-
-    avr_qw_not(&tmp, *b);
-    avr_qw_add(&tmp, *a, tmp);
-    avr_qw_add(r, tmp, one);
-#endif
+    r->s128 = int128_sub(a->s128, b->s128);
 }
 
 void helper_vsubeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 8c0e5bcc03..1e665534c3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
-GEN_VXFORM(vsubuqm, 0, 20);
 GEN_VXFORM(vsubcuq, 0, 21);
 GEN_VXFORM3(vsubeuqm, 31, 0);
 GEN_VXFORM3(vsubecuq, 31, 0);
@@ -2858,8 +2857,6 @@ GEN_VXFORM_DUAL(vsubuwm, PPC_ALTIVEC, PPC_NONE, \
                 bcdus, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubsbs, PPC_ALTIVEC, PPC_NONE, \
                 bcdtrunc, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_DUAL(vsubuqm, PPC2_ALTIVEC_207, PPC_NONE, \
-                bcdtrunc, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubcuq, PPC2_ALTIVEC_207, PPC_NONE, \
                 bcdutrunc, PPC_NONE, PPC2_ISA300)
 
@@ -3102,6 +3099,8 @@ TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
 
 TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 
+TRANS_FLAGS2(ALTIVEC_207, VSUBUQM, do_vx_helper, gen_helper_VSUBUQM)
+
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
                          void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 33e05929cb..9feef9afee 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -126,7 +126,7 @@ GEN_VXFORM(vsubuws, 0, 26),
 GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
+GEN_VXFORM_300(bcdtrunc, 0, 20),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM(vsl, 2, 7),
-- 
2.25.1


