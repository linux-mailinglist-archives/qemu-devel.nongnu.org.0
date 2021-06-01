Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92828397AD8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 21:51:47 +0200 (CEST)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAQU-0002cf-ES
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 15:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1loACe-0004iy-Co; Tue, 01 Jun 2021 15:37:28 -0400
Received: from [201.28.113.2] (port=61001 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1loACc-0003Xn-Qj; Tue, 01 Jun 2021 15:37:28 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 16:35:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B1FA380148C;
 Tue,  1 Jun 2021 16:35:45 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v6 13/14] target/ppc: Move addpcis to decodetree
Date: Tue,  1 Jun 2021 16:35:27 -0300
Message-Id: <20210601193528.2533031-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2021 19:35:46.0190 (UTC)
 FILETIME=[516412E0:01D7571D]
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, groug@kaod.org,
 luis.pires@eldorado.org.br, lagarcia@br.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


