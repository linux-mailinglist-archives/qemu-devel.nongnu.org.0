Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7A436C34
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:32:35 +0200 (CEST)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdejq-0006hB-5Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7S-0002kZ-3Z; Thu, 21 Oct 2021 15:52:55 -0400
Received: from [201.28.113.2] (port=46784 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7O-0005Hb-Ra; Thu, 21 Oct 2021 15:52:53 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 79EE0800145;
 Thu, 21 Oct 2021 16:47:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 28/33] target/ppc: moved XXSPLTIB to using decodetree
Date: Thu, 21 Oct 2021 16:45:42 -0300
Message-Id: <20211021194547.672988-29-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:06.0035 (UTC)
 FILETIME=[6D44B030:01D7C6B4]
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

Changed the function that handles XXSPLTIB emulation to using
decodetree, but still use the same logic as before

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
index a35e290f16..3dbdfc2539 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1480,23 +1480,15 @@ static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2 *a)
 
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
2.25.1


