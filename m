Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24FB44A6F7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:41:57 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKpO-00069h-B6
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:41:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK52-00068a-0P; Tue, 09 Nov 2021 00:54:01 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:54667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4y-0006wH-9v; Tue, 09 Nov 2021 00:53:58 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp5z7wz4xfQ; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=zHL9mx2Nt5pGqTNJRuaGsXk8Je4dotdAaWVkIJSuSEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TFLNwn5+PhnPoO0TCSCt4dWdNi8YIg0h5mZtG+AZkfoCLaISXuYzy48dKtjyYTmyP
 vuSsPI1X2YPba+3MtV5/mHUzELSavET28AlywXFoQuxE6a80w2CS15PN+kGm7Akawj
 I7CTGZSaThZ0AOS2Gg7NYg9wym10jtR5H+lbHGj0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 45/54] target/ppc: moved XXSPLTW to using decodetree
Date: Tue,  9 Nov 2021 16:51:55 +1100
Message-Id: <20211109055204.230765-46-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Changed the function that handles XXSPLTW emulation to using decodetree,
but still using the same logic.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-19-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
index 6c60e29cca..ce8796d139 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1436,26 +1436,21 @@ static void gen_xxsel(DisasContext *ctx)
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
2.33.1


