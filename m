Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF54703CC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:23:58 +0100 (CET)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhkb-00007c-33
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:23:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgvj-0003nN-3g; Fri, 10 Dec 2021 09:31:23 -0500
Received: from [201.28.113.2] (port=64946 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgvf-0001mA-Mh; Fri, 10 Dec 2021 09:31:21 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Dec 2021 11:13:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 2012B8009F6;
 Fri, 10 Dec 2021 11:13:53 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/4] target/ppc: Move xs{max,min}[cj]dp to decodetree
Date: Fri, 10 Dec 2021 11:13:45 -0300
Message-Id: <20211210141347.38603-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Dec 2021 14:13:53.0425 (UTC)
 FILETIME=[29660010:01D7EDD0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Dec 2021 10:20:17 -0500
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
Cc: danielhb413@gmail.com, groug@kaod.org,
 Victor Colombo <victor.colombo@eldorado.org.br>, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Victor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/insn32.decode            | 17 +++++++++++++---
 target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++----
 target/ppc/translate/vsx-ops.c.inc  |  4 ----
 3 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e135b8aba4..759b2a9aa5 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -123,10 +123,14 @@
 &X_vrt_frbp     vrt frbp
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
 
+%xx_xt          0:1 21:5
+%xx_xb          1:1 11:5
+%xx_xa          2:1 16:5
 &XX2            xt xb uim:uint8_t
-%xx2_xt         0:1 21:5
-%xx2_xb         1:1 11:5
-@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=%xx2_xt xb=%xx2_xb
+@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=%xx_xt xb=%xx_xb
+
+&XX3            xt xa xb
+@XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
 &Z22_bf_fra     bf fra dm
 @Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_fra
@@ -427,3 +431,10 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
 ## VSX Vector Load Special Value Instruction
 
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
+
+## VSX Comparison Instructions
+
+XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
+XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
+XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
+XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 02df75339e..e2447750dd 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1098,10 +1098,6 @@ GEN_VSX_HELPER_R2_AB(xscmpoqp, 0x04, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_R2_AB(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_X3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
 GEN_VSX_HELPER_R2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
@@ -2185,6 +2181,32 @@ TRANS(XXBLENDVH, do_xxblendv, MO_16)
 TRANS(XXBLENDVW, do_xxblendv, MO_32)
 TRANS(XXBLENDVD, do_xxblendv, MO_64)
 
+static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
+                            void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
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
+TRANS(XSMAXCDP, do_xsmaxmincjdp, gen_helper_xsmaxcdp)
+TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsmincdp)
+TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
+TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 152d1e5c3b..f980bc1bae 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -207,10 +207,6 @@ GEN_VSX_XFORM_300(xscmpoqp, 0x04, 0x04, 0x00600001),
 GEN_VSX_XFORM_300(xscmpuqp, 0x04, 0x14, 0x00600001),
 GEN_XX3FORM(xsmaxdp, 0x00, 0x14, PPC2_VSX),
 GEN_XX3FORM(xsmindp, 0x00, 0x15, PPC2_VSX),
-GEN_XX3FORM(xsmaxcdp, 0x00, 0x10, PPC2_ISA300),
-GEN_XX3FORM(xsmincdp, 0x00, 0x11, PPC2_ISA300),
-GEN_XX3FORM(xsmaxjdp, 0x00, 0x12, PPC2_ISA300),
-GEN_XX3FORM(xsminjdp, 0x00, 0x13, PPC2_ISA300),
 GEN_XX2FORM_EO(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300),
 GEN_XX2FORM(xscvdpsp, 0x12, 0x10, PPC2_VSX),
 GEN_XX2FORM(xscvdpspn, 0x16, 0x10, PPC2_VSX207),
-- 
2.25.1


