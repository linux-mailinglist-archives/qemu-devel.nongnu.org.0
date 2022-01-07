Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D072487D8F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:14:22 +0100 (CET)
Received: from localhost ([::1]:40542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vcz-0003WW-Ia
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:14:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uVF-00076v-3j; Fri, 07 Jan 2022 14:02:17 -0500
Received: from [201.28.113.2] (port=59912 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uVD-0008Dy-EE; Fri, 07 Jan 2022 14:02:16 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 7 Jan 2022 15:57:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1DDA8800473;
 Fri,  7 Jan 2022 15:57:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 33/37] target/ppc: Move xscmp{eq,ge,gt,ne}dp to decodetree
Date: Fri,  7 Jan 2022 15:56:49 -0300
Message-Id: <20220107185653.1609775-34-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2022 18:57:45.0482 (UTC)
 FILETIME=[74DCA6A0:01D803F8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Victor Colombo <victor.colombo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 9 ++++-----
 target/ppc/helper.h                 | 8 ++++----
 target/ppc/insn32.decode            | 4 ++++
 target/ppc/translate/vsx-impl.c.inc | 8 ++++----
 target/ppc/translate/vsx-ops.c.inc  | 4 ----
 5 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7d5420c550..75bd7de15a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2307,11 +2307,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 1, 0)
-VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1, 1)
-VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1, 1)
-VSX_SCALAR_CMP(xscmpnedp, float64, eq, VsrD(0), 0, 1)
-
+VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 1, 0)
+VSX_SCALAR_CMP(XSCMPGEDP, float64, le, VsrD(0), 1, 1)
+VSX_SCALAR_CMP(XSCMPGTDP, float64, lt, VsrD(0), 1, 1)
+VSX_SCALAR_CMP(XSCMPNEDP, float64, eq, VsrD(0), 0, 1)
 VSX_SCALAR_CMP(XSCMPEQQP, float128, eq, f128, 1, 0)
 VSX_SCALAR_CMP(XSCMPGEQP, float128, le, f128, 1, 1)
 VSX_SCALAR_CMP(XSCMPGTQP, float128, lt, f128, 1, 1)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index abcc51ae06..1df77748aa 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -366,10 +366,10 @@ DEF_HELPER_5(XSMADDDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSMSUBDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMADDDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpnedp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPEQDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGTDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGEDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPNEDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPEQQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPGTQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPGEQP, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 113aab0028..35bee046da 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -602,6 +602,10 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSCMPEQDP       111100 ..... ..... ..... 00000011 ...   @XX3
+XSCMPGEDP       111100 ..... ..... ..... 00010011 ...   @XX3
+XSCMPGTDP       111100 ..... ..... ..... 00001011 ...   @XX3
+XSCMPNEDP       111100 ..... ..... ..... 00011011 ...   @XX3
 XSCMPEQQP       111111 ..... ..... ..... 0001000100 -   @X
 XSCMPGEQP       111111 ..... ..... ..... 0011000100 -   @X
 XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b31e363c1b..bbe5a70e71 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1050,10 +1050,6 @@ GEN_VSX_HELPER_X2(xssqrtdp, 0x16, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xsrsqrtedp, 0x14, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2_AB(xstdivdp, 0x14, 0x07, 0, PPC2_VSX)
 GEN_VSX_HELPER_X1(xstsqrtdp, 0x14, 0x06, 0, PPC2_VSX)
-GEN_VSX_HELPER_X3(xscmpeqdp, 0x0C, 0x00, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpgtdp, 0x0C, 0x01, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpgedp, 0x0C, 0x02, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpnedp, 0x0C, 0x03, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2_AB(xscmpexpdp, 0x0C, 0x07, 0, PPC2_ISA300)
 GEN_VSX_HELPER_R2_AB(xscmpexpqp, 0x04, 0x05, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2_AB(xscmpodp, 0x0C, 0x05, 0, PPC2_VSX)
@@ -1183,6 +1179,10 @@ static bool do_helper_XX3(DisasContext *ctx, arg_XX3 *a,
 
 TRANS(XXPERM, do_helper_XX3, gen_helper_VPERM);
 TRANS(XXPERMR, do_helper_XX3, gen_helper_VPERMR);
+TRANS(XSCMPEQDP, do_helper_XX3, gen_helper_XSCMPEQDP)
+TRANS(XSCMPGEDP, do_helper_XX3, gen_helper_XSCMPGEDP)
+TRANS(XSCMPGTDP, do_helper_XX3, gen_helper_XSCMPGTDP)
+TRANS(XSCMPNEDP, do_helper_XX3, gen_helper_XSCMPNEDP)
 
 static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 9cfec53df0..b8fd116728 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -186,10 +186,6 @@ GEN_XX2FORM(xssqrtdp,  0x16, 0x04, PPC2_VSX),
 GEN_XX2FORM(xsrsqrtedp,  0x14, 0x04, PPC2_VSX),
 GEN_XX3FORM(xstdivdp,  0x14, 0x07, PPC2_VSX),
 GEN_XX2FORM(xstsqrtdp,  0x14, 0x06, PPC2_VSX),
-GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
-GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
-GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
-GEN_XX3FORM(xscmpnedp, 0x0C, 0x03, PPC2_ISA300),
 GEN_XX3FORM(xscmpexpdp, 0x0C, 0x07, PPC2_ISA300),
 GEN_VSX_XFORM_300(xscmpexpqp, 0x04, 0x05, 0x00600001),
 GEN_XX2IFORM(xscmpodp,  0x0C, 0x05, PPC2_VSX),
-- 
2.25.1


