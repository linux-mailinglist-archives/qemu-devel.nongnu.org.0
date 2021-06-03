Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3454399CF8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:45:57 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loizF-0004q1-0l
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loie6-0008Lg-21; Thu, 03 Jun 2021 04:24:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45851 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidy-0000cY-9K; Thu, 03 Jun 2021 04:24:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5s4GqJz9t5K; Thu,  3 Jun 2021 18:22:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708561;
 bh=KFyGLNW9xM5OOutjX9afXvccBTpGBPF3dOVL+F42ddU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IuLQD4G2BAdZyDIBrdf6a2cD1cv4eAlPTSWmToV0Y0duFE2DNZPlQdjvOVwWW4Lm2
 wEKaxivxAN15DPeD7zW+qXGucLM2qdKx7/eVXHcQ9He7MOrM4K93Xi/NclzBLXI/kq
 T8U+sDKVk9xLhSiKE3IAodDmBuQvPIZwwm86fjys=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 40/42] target/ppc: Move addpcis to decodetree
Date: Thu,  3 Jun 2021 18:22:29 +1000
Message-Id: <20210603082231.601214-41-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-14-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode                   | 6 ++++++
 target/ppc/translate.c                     | 9 ---------
 target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++++
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 77edf407ab..93e5d44d9e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -23,6 +23,10 @@
 %ds_si          2:s14  !function=times_4
 @DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
 
+&DX             rt d
+%dx_d           6:s10 16:5 0:1
+@DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
+
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
 
@@ -90,6 +94,8 @@ STDUX           011111 ..... ..... ..... 0010110101 -   @X
 ADDI            001110 ..... ..... ................     @D
 ADDIS           001111 ..... ..... ................     @D
 
+ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
+
 ## Fixed-Point Logical Instructions
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ed5515f8e2..35d8831d44 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1779,14 +1779,6 @@ static void gen_addic_(DisasContext *ctx)
     gen_op_addic(ctx, 1);
 }
 
-/* addpcis */
-static void gen_addpcis(DisasContext *ctx)
-{
-    target_long d = DX(ctx->opcode);
-
-    tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], ctx->base.pc_next + (d << 16));
-}
-
 static inline void gen_op_arith_divw(DisasContext *ctx, TCGv ret, TCGv arg1,
                                      TCGv arg2, int sign, int compute_ov)
 {
@@ -7659,7 +7651,6 @@ GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
 GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
-GEN_HANDLER_E(addpcis, 0x13, 0x2, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(mulhw, 0x1F, 0x0B, 0x02, 0x00000400, PPC_INTEGER),
 GEN_HANDLER(mulhwu, 0x1F, 0x0B, 0x00, 0x00000400, PPC_INTEGER),
 GEN_HANDLER(mullw, 0x1F, 0x0B, 0x07, 0x00000000, PPC_INTEGER),
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 50933a3b9d..2713366791 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -194,6 +194,13 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
     return trans_ADDI(ctx, a);
 }
 
+static bool trans_ADDPCIS(DisasContext *ctx, arg_DX *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    tcg_gen_movi_tl(cpu_gpr[a->rt], ctx->base.pc_next + (a->d << 16));
+    return true;
+}
+
 static bool trans_INVALID(DisasContext *ctx, arg_INVALID *a)
 {
     gen_invalid(ctx);
-- 
2.31.1


