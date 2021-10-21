Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C47436C35
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:33:30 +0200 (CEST)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdekj-0008Fz-LB
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7N-0002hz-Lp; Thu, 21 Oct 2021 15:52:51 -0400
Received: from [201.28.113.2] (port=46784 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7L-0005Hb-GQ; Thu, 21 Oct 2021 15:52:49 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1477E80012A;
 Thu, 21 Oct 2021 16:47:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 27/33] target/ppc: moved XXSPLTW to using decodetree
Date: Thu, 21 Oct 2021 16:45:41 -0300
Message-Id: <20211021194547.672988-28-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:05.0582 (UTC)
 FILETIME=[6CFF90E0:01D7C6B4]
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
 luis.pires@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Changed the function that handles XXSPLTW emulation to using decodetree,
but still using the same logic.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  9 +++++++++
 target/ppc/translate/vsx-impl.c.inc | 17 ++++++-----------
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e4508631b0..5d425ec076 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -116,6 +116,11 @@
 &X_vrt_frbp     vrt frbp
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
 
+&XX2            xt xb uim:uint8_t
+%xx2_xt         0:1 21:5
+%xx2_xb         1:1 11:5
+@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=%xx2_xt xb=%xx2_xb
+
 &Z22_bf_fra     bf fra dm
 @Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_fra
 
@@ -406,3 +411,7 @@ LXVX            011111 ..... ..... ..... 0100 - 01100 . @X_TSX
 STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
 LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
 STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
+
+## VSX splat instruction
+
+XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 4b40d2dbe0..a35e290f16 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1461,26 +1461,21 @@ static void gen_xxsel(DisasContext *ctx)
                         vsr_full_offset(rb), vsr_full_offset(ra), 16, 16);
 }
 
-static void gen_xxspltw(DisasContext *ctx)
+static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
 {
-    int rt = xT(ctx->opcode);
-    int rb = xB(ctx->opcode);
-    int uim = UIM(ctx->opcode);
     int tofs, bofs;
 
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
+    REQUIRE_VSX(ctx);
 
-    tofs = vsr_full_offset(rt);
-    bofs = vsr_full_offset(rb);
-    bofs += uim << MO_32;
+    tofs = vsr_full_offset(a->xt);
+    bofs = vsr_full_offset(a->xb);
+    bofs += a->uim << MO_32;
 #ifndef HOST_WORDS_BIG_ENDIAN
     bofs ^= 8 | 4;
 #endif
 
     tcg_gen_gvec_dup_mem(MO_32, tofs, bofs, 16, 16);
+    return true;
 }
 
 #define pattern(x) (((x) & 0xff) * (~(uint64_t)0 / 0xff))
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index b94f3fa4e0..b669b64d35 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -348,7 +348,6 @@ GEN_XX3FORM(xxmrghw, 0x08, 0x02, PPC2_VSX),
 GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
 GEN_XX3FORM(xxperm, 0x08, 0x03, PPC2_ISA300),
 GEN_XX3FORM(xxpermr, 0x08, 0x07, PPC2_ISA300),
-GEN_XX2FORM(xxspltw, 0x08, 0x0A, PPC2_VSX),
 GEN_XX1FORM(xxspltib, 0x08, 0x0B, PPC2_ISA300),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
-- 
2.25.1


