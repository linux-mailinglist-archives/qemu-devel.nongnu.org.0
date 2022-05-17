Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C927552A346
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:24:07 +0200 (CEST)
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxBG-0006Yk-Rt
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwVn-0004EJ-MU; Tue, 17 May 2022 08:41:15 -0400
Received: from [187.72.171.209] (port=53711 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwVd-0004gP-4t; Tue, 17 May 2022 08:41:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:31 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B6A7E800C32;
 Tue, 17 May 2022 09:39:31 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 07/12] target/ppc: declare xvxsigsp helper with call flags
Date: Tue, 17 May 2022 09:39:24 -0300
Message-Id: <20220517123929.284511-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:32.0020 (UTC)
 FILETIME=[2834A740:01D869EB]
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move xvxsigsp to decodetree, declare helper_xvxsigsp with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             |  2 +-
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  4 ++++
 target/ppc/translate/vsx-impl.c.inc | 18 +++++++++++++++++-
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 5 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index dd90031d8a..15e8192a7b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3198,7 +3198,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb)
     return xt;
 }
 
-void helper_xvxsigsp(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
+void helper_XVXSIGSP(ppc_vsr_t *xt, ppc_vsr_t *xb)
 {
     ppc_vsr_t t = { };
     uint32_t exp, i, fraction;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9be69fa91e..aed1b24fdb 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -531,7 +531,7 @@ DEF_HELPER_FLAGS_2(XXGENPCVDM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
-DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
+DEF_HELPER_FLAGS_2(XVXSIGSP, TCG_CALL_NO_RWG, void, vsr, vsr)
 DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVB, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVH, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d4c2615b1a..483349ff6d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -710,6 +710,10 @@ XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
 XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
 XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
 
+## VSX Binary Floating-Point Math Support Instructions
+
+XVXSIGSP        111100 ..... 01001 ..... 111011011 ..   @XX2
+
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
 XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9b4f309d9d..ca11e2c4b8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2151,7 +2151,23 @@ static void gen_xvxexpdp(DisasContext *ctx)
     tcg_temp_free_i64(xbl);
 }
 
-GEN_VSX_HELPER_X2(xvxsigsp, 0x00, 0x04, 0, PPC2_ISA300)
+static bool trans_XVXSIGSP(DisasContext *ctx, arg_XX2 *a)
+{
+    TCGv_ptr t, b;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    t = gen_vsr_ptr(a->xt);
+    b = gen_vsr_ptr(a->xb);
+
+    gen_helper_XVXSIGSP(t, b);
+
+    tcg_temp_free_ptr(t);
+    tcg_temp_free_ptr(b);
+
+    return true;
+}
 
 static void gen_xvxsigdp(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 52d7ab30cd..4524c5b02a 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -156,7 +156,6 @@ GEN_XX3FORM(xviexpdp, 0x00, 0x1F, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxexpdp, 0x16, 0x1D, 0x00, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxsigdp, 0x16, 0x1D, 0x01, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxexpsp, 0x16, 0x1D, 0x08, PPC2_ISA300),
-GEN_XX2FORM_EO(xvxsigsp, 0x16, 0x1D, 0x09, PPC2_ISA300),
 
 /* DCMX  =  bit[25] << 6 | bit[29] << 5 | bit[11:15] */
 #define GEN_XX2FORM_DCMX(name, opc2, opc3, fl2) \
-- 
2.25.1


