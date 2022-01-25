Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626CE49C1B0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:03:30 +0100 (CET)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYan-0001fh-Ee
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:03:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYWJ-0006tu-C1; Tue, 25 Jan 2022 21:58:51 -0500
Received: from [187.72.171.209] (port=56550 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCYWH-0004u9-Ij; Tue, 25 Jan 2022 21:58:51 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B974080001E;
 Tue, 25 Jan 2022 09:20:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 03/38] target/ppc: Moved vector multiply high and low to
 decodetree
Date: Tue, 25 Jan 2022 09:19:08 -0300
Message-Id: <20220125121943.3269077-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:35.0193 (UTC)
 FILETIME=[F4569E90:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Moved instructions vmulld, vmulhuw, vmulhsw, vmulhud and vmulhsd to
decodetree

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  8 ++++----
 target/ppc/insn32.decode            |  6 ++++++
 target/ppc/int_helper.c             |  8 ++++----
 target/ppc/translate/vmx-impl.c.inc | 21 ++++++++++++++++-----
 target/ppc/translate/vmx-ops.c.inc  |  5 -----
 5 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6f2c3b32e7..02eda1c137 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -207,10 +207,10 @@ DEF_HELPER_3(VMULOUB, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUH, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUW, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUD, void, avr, avr, avr)
-DEF_HELPER_3(vmulhsw, void, avr, avr, avr)
-DEF_HELPER_3(vmulhuw, void, avr, avr, avr)
-DEF_HELPER_3(vmulhsd, void, avr, avr, avr)
-DEF_HELPER_3(vmulhud, void, avr, avr, avr)
+DEF_HELPER_3(VMULHSW, void, avr, avr, avr)
+DEF_HELPER_3(VMULHUW, void, avr, avr, avr)
+DEF_HELPER_3(VMULHSD, void, avr, avr, avr)
+DEF_HELPER_3(VMULHUD, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index cab372fa44..4774548b3d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -497,3 +497,9 @@ VMULESD         000100 ..... ..... ..... 01111001000    @VX
 VMULOSD         000100 ..... ..... ..... 00111001000    @VX
 VMULEUD         000100 ..... ..... ..... 01011001000    @VX
 VMULOUD         000100 ..... ..... ..... 00011001000    @VX
+
+VMULHSW         000100 ..... ..... ..... 01110001001    @VX
+VMULHUW         000100 ..... ..... ..... 01010001001    @VX
+VMULHSD         000100 ..... ..... ..... 01111001001    @VX
+VMULHUD         000100 ..... ..... ..... 01011001001    @VX
+VMULLD          000100 ..... ..... ..... 00111001001    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 56b9e9369b..e134162fdd 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1200,7 +1200,7 @@ void helper_VMULOUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(1), b->VsrD(1));
 }
 
-void helper_vmulhsw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int i;
 
@@ -1209,7 +1209,7 @@ void helper_vmulhsw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
-void helper_vmulhuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int i;
 
@@ -1219,7 +1219,7 @@ void helper_vmulhuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
-void helper_vmulhsd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     uint64_t discard;
 
@@ -1227,7 +1227,7 @@ void helper_vmulhsd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     muls64(&discard, &r->u64[1], a->s64[1], b->s64[1]);
 }
 
-void helper_vmulhud(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     uint64_t discard;
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 430579addd..62d0642226 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -799,11 +799,6 @@ static void trans_vclzd(DisasContext *ctx)
 }
 
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM_V(vmulld, MO_64, tcg_gen_gvec_mul, 4, 7);
-GEN_VXFORM(vmulhuw, 4, 10);
-GEN_VXFORM(vmulhud, 4, 11);
-GEN_VXFORM(vmulhsw, 4, 14);
-GEN_VXFORM(vmulhsd, 4, 15);
 GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
 GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
@@ -2103,6 +2098,17 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
     return true;
 }
 
+static bool trans_VMULLD(DisasContext *ctx, arg_VX *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_mul(MO_64, avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                     avr_full_offset(a->vrb), 16, 16);
+
+    return true;
+}
+
 TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
 TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
 TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
@@ -2120,6 +2126,11 @@ TRANS_FLAGS2(ISA310, VMULOSD, do_vx_helper, gen_helper_VMULOSD)
 TRANS_FLAGS2(ISA310, VMULEUD, do_vx_helper, gen_helper_VMULEUD)
 TRANS_FLAGS2(ISA310, VMULOUD, do_vx_helper, gen_helper_VMULOUD)
 
+TRANS_FLAGS2(ISA310, VMULHSW, do_vx_helper, gen_helper_VMULHSW)
+TRANS_FLAGS2(ISA310, VMULHSD, do_vx_helper, gen_helper_VMULHSD)
+TRANS_FLAGS2(ISA310, VMULHUW, do_vx_helper, gen_helper_VMULHUW)
+TRANS_FLAGS2(ISA310, VMULHUD, do_vx_helper, gen_helper_VMULHUD)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index f310b2fbde..914e68e5b0 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -102,11 +102,6 @@ GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_207(vmuluwm, 4, 2),
-GEN_VXFORM_310(vmulld, 4, 7),
-GEN_VXFORM_310(vmulhuw, 4, 10),
-GEN_VXFORM_310(vmulhud, 4, 11),
-GEN_VXFORM_310(vmulhsw, 4, 14),
-GEN_VXFORM_310(vmulhsd, 4, 15),
 GEN_VXFORM(vslb, 2, 4),
 GEN_VXFORM(vslh, 2, 5),
 GEN_VXFORM_DUAL(vslw, vrlwnm, 2, 6, PPC_ALTIVEC, PPC_NONE),
-- 
2.25.1


