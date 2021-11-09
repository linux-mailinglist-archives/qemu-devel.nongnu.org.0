Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A244A743
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:01 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL9o-0002Hm-7X
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK53-00068d-J2; Tue, 09 Nov 2021 00:54:01 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:49979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK50-0006wU-2J; Tue, 09 Nov 2021 00:54:01 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp66dmz4xfR; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=NtOuuyY8N2Cz9Ll8TVGix9QU5rx7tOTfcz0YdTg3j6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mpX4DZuTHF7u1IVMhZf9RaqSkM18MiYSPuAkQFlK161ATMV+w/n4mp+lYBv2UuNa6
 I9ApAs47kRVxslb3Lc/2HApada2ISm8Fxh/vwAwPKlAK/rk/k9KU5Sr0PATLLVn+6A
 xzuFYVKvJaWFK5HcEHNwoMkP/M2Oa3GIAXpr2S6U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 46/54] target/ppc: moved XXSPLTIB to using decodetree
Date: Tue,  9 Nov 2021 16:51:56 +1100
Message-Id: <20211109055204.230765-47-david@gibson.dropbear.id.au>
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

Changed the function that handles XXSPLTIB emulation to using
decodetree, but still use the same logic as before

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-20-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++--------------
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5d425ec076..fd73946122 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -96,6 +96,10 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
+%x_xt           0:1 21:5
+&X_imm8         xt imm:uint8_t
+@X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
+
 &X_tb_sp_rc     rt rb sp rc:bool
 @X_tb_sp_rc     ...... rt:5 sp:2 ... rb:5 .......... rc:1       &X_tb_sp_rc
 
@@ -414,4 +418,5 @@ STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
 
 ## VSX splat instruction
 
+XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
 XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index ce8796d139..ad25a0daf0 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1455,23 +1455,15 @@ static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
 
 #define pattern(x) (((x) & 0xff) * (~(uint64_t)0 / 0xff))
 
-static void gen_xxspltib(DisasContext *ctx)
+static bool trans_XXSPLTIB(DisasContext *ctx, arg_X_imm8 *a)
 {
-    uint8_t uim8 = IMM8(ctx->opcode);
-    int rt = xT(ctx->opcode);
-
-    if (rt < 32) {
-        if (unlikely(!ctx->vsx_enabled)) {
-            gen_exception(ctx, POWERPC_EXCP_VSXU);
-            return;
-        }
+    if (a->xt < 32) {
+        REQUIRE_VSX(ctx);
     } else {
-        if (unlikely(!ctx->altivec_enabled)) {
-            gen_exception(ctx, POWERPC_EXCP_VPU);
-            return;
-        }
+        REQUIRE_VECTOR(ctx);
     }
-    tcg_gen_gvec_dup_imm(MO_8, vsr_full_offset(rt), 16, 16, uim8);
+    tcg_gen_gvec_dup_imm(MO_8, vsr_full_offset(a->xt), 16, 16, a->imm);
+    return true;
 }
 
 static void gen_xxsldwi(DisasContext *ctx)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index b669b64d35..152d1e5c3b 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -348,7 +348,6 @@ GEN_XX3FORM(xxmrghw, 0x08, 0x02, PPC2_VSX),
 GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
 GEN_XX3FORM(xxperm, 0x08, 0x03, PPC2_ISA300),
 GEN_XX3FORM(xxpermr, 0x08, 0x07, PPC2_ISA300),
-GEN_XX1FORM(xxspltib, 0x08, 0x0B, PPC2_ISA300),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
 GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
-- 
2.33.1


