Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE81436BDA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:13:36 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeRT-0002NU-0P
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3a-0005Ru-1W; Thu, 21 Oct 2021 15:48:54 -0400
Received: from [201.28.113.2] (port=47716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3X-0001rY-LQ; Thu, 21 Oct 2021 15:48:53 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0F6A980012A;
 Thu, 21 Oct 2021 16:46:59 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 13/33] target/ppc: Implement vpdepd/vpextd instruction
Date: Thu, 21 Oct 2021 16:45:27 -0300
Message-Id: <20211021194547.672988-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:59.0534 (UTC)
 FILETIME=[6964B6E0:01D7C6B4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vmx-impl.c.inc | 36 +++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6ce06b231d..4666c06f55 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -336,3 +336,5 @@ DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
 VCLZDM          000100 ..... ..... ..... 11110000100    @VX
 VCTZDM          000100 ..... ..... ..... 11111000100    @VX
+VPDEPD          000100 ..... ..... ..... 10111001101    @VX
+VPEXTD          000100 ..... ..... ..... 10110001101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ee9426862c..b240fd5fc6 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1613,6 +1613,42 @@ static bool trans_VCTZDM(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+static bool trans_VPDEPD(DisasContext *ctx, arg_VX *a)
+{
+    static const TCGOpcode vecop_list[] = { 0 };
+    static const GVecGen3 g = {
+        .fni8 = gen_helper_PDEPD,
+        .opt_opc = vecop_list,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &g);
+
+    return true;
+}
+
+static bool trans_VPEXTD(DisasContext *ctx, arg_VX *a)
+{
+    static const TCGOpcode vecop_list[] = { 0 };
+    static const GVecGen3 g = {
+        .fni8 = gen_helper_PEXTD,
+        .opt_opc = vecop_list,
+        .vece = MO_64,
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &g);
+
+    return true;
+}
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.25.1


