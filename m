Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16E4BFD93
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:52:12 +0100 (CET)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXSV-00051j-Aj
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:52:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWP5-0001mI-Ih; Tue, 22 Feb 2022 09:44:37 -0500
Received: from [187.72.171.209] (port=14718 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWP3-0006Am-5r; Tue, 22 Feb 2022 09:44:35 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:49 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 448BA8000A7;
 Tue, 22 Feb 2022 11:37:49 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 40/47] target/ppc: Move xscmp{eq,ge,gt}dp to decodetree
Date: Tue, 22 Feb 2022 11:36:38 -0300
Message-Id: <20220222143646.1268606-41-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:49.0712 (UTC)
 FILETIME=[C40F8100:01D827F9]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             |  7 +++----
 target/ppc/helper.h                 |  6 +++---
 target/ppc/insn32.decode            |  3 +++
 target/ppc/translate/vsx-impl.c.inc | 28 +++++++++++++++++++++++++---
 target/ppc/translate/vsx-ops.c.inc  |  3 ---
 5 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index eb62ae5455..bfe49a63f8 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2307,10 +2307,9 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 1, 0)
-VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1, 1)
-VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1, 1)
-
+VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 1, 0)
+VSX_SCALAR_CMP(XSCMPGEDP, float64, le, VsrD(0), 1, 1)
+VSX_SCALAR_CMP(XSCMPGTDP, float64, lt, VsrD(0), 1, 1)
 VSX_SCALAR_CMP(XSCMPEQQP, float128, eq, f128, 1, 0)
 VSX_SCALAR_CMP(XSCMPGEQP, float128, le, f128, 1, 1)
 VSX_SCALAR_CMP(XSCMPGTQP, float128, lt, f128, 1, 1)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index e44de15d07..8a57a48200 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -361,9 +361,9 @@ DEF_HELPER_5(XSMADDDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSMSUBDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMADDDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPEQDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGTDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSCMPGEDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPEQQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPGTQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSCMPGEQP, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d5c3bd13f7..a6e3855958 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -662,6 +662,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSCMPEQDP       111100 ..... ..... ..... 00000011 ...   @XX3
+XSCMPGEDP       111100 ..... ..... ..... 00010011 ...   @XX3
+XSCMPGTDP       111100 ..... ..... ..... 00001011 ...   @XX3
 XSCMPEQQP       111111 ..... ..... ..... 0001000100 -   @X
 XSCMPGEQP       111111 ..... ..... ..... 0011000100 -   @X
 XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index f0d02e61fc..29f04a4178 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1052,9 +1052,6 @@ GEN_VSX_HELPER_X2(xssqrtdp, 0x16, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xsrsqrtedp, 0x14, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2_AB(xstdivdp, 0x14, 0x07, 0, PPC2_VSX)
 GEN_VSX_HELPER_X1(xstsqrtdp, 0x14, 0x06, 0, PPC2_VSX)
-GEN_VSX_HELPER_X3(xscmpeqdp, 0x0C, 0x00, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpgtdp, 0x0C, 0x01, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xscmpgedp, 0x0C, 0x02, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2_AB(xscmpexpdp, 0x0C, 0x07, 0, PPC2_ISA300)
 GEN_VSX_HELPER_R2_AB(xscmpexpqp, 0x04, 0x05, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2_AB(xscmpodp, 0x0C, 0x05, 0, PPC2_VSX)
@@ -2473,6 +2470,31 @@ TRANS(XXBLENDVH, do_xxblendv, MO_16)
 TRANS(XXBLENDVW, do_xxblendv, MO_32)
 TRANS(XXBLENDVD, do_xxblendv, MO_64)
 
+static bool do_helper_XX3(DisasContext *ctx, arg_XX3 *a,
+    void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr xt, xa, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    xt = gen_vsr_ptr(a->xt);
+    xa = gen_vsr_ptr(a->xa);
+    xb = gen_vsr_ptr(a->xb);
+
+    helper(cpu_env, xt, xa, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+TRANS(XSCMPEQDP, do_helper_XX3, gen_helper_XSCMPEQDP)
+TRANS(XSCMPGEDP, do_helper_XX3, gen_helper_XSCMPGEDP)
+TRANS(XSCMPGTDP, do_helper_XX3, gen_helper_XSCMPGTDP)
+
 static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
                             void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 34310c1fb5..b8fd116728 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -186,9 +186,6 @@ GEN_XX2FORM(xssqrtdp,  0x16, 0x04, PPC2_VSX),
 GEN_XX2FORM(xsrsqrtedp,  0x14, 0x04, PPC2_VSX),
 GEN_XX3FORM(xstdivdp,  0x14, 0x07, PPC2_VSX),
 GEN_XX2FORM(xstsqrtdp,  0x14, 0x06, PPC2_VSX),
-GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
-GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
-GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
 GEN_XX3FORM(xscmpexpdp, 0x0C, 0x07, PPC2_ISA300),
 GEN_VSX_XFORM_300(xscmpexpqp, 0x04, 0x05, 0x00600001),
 GEN_XX2IFORM(xscmpodp,  0x0C, 0x05, PPC2_VSX),
-- 
2.25.1


