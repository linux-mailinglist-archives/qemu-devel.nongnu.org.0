Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E44404CF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:18:49 +0200 (CEST)
Received: from localhost ([::1]:44826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZGy-000395-SA
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYWD-0001Y3-J5; Fri, 29 Oct 2021 16:30:31 -0400
Received: from [201.28.113.2] (port=54018 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYWB-0004EY-NX; Fri, 29 Oct 2021 16:30:29 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:26:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 83803800B36;
 Fri, 29 Oct 2021 17:26:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 30/34] target/ppc: implemented XXSPLTI32DX
Date: Fri, 29 Oct 2021 17:24:21 -0300
Message-Id: <20211029202424.175401-31-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:26:36.0076 (UTC)
 FILETIME=[453A3EC0:01D7CD03]
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Implemented XXSPLTI32DX emulation using decodetree

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
- 8RR_D si field is now unsigned
- Implemented with two tcg_gen_st_i32
---
 target/ppc/insn64.decode            | 11 +++++++++++
 target/ppc/translate/vsx-impl.c.inc | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 880ac3edc7..134bc60c57 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -32,6 +32,14 @@
                 ...... ..... ra:5 ................       \
                 &PLS_D si=%pls_si rt=%rt_tsxp
 
+# Format 8RR:D
+%8rr_si         32:s16 0:16
+%8rr_xt         16:1 21:5
+&8RR_D_IX       xt ix si
+@8RR_D_IX       ...... .. .... .. .. ................ \
+                ...... ..... ... ix:1 . ................ \
+                &8RR_D_IX si=%8rr_si xt=%8rr_xt
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -156,3 +164,6 @@ PLXVP           000001 00 0--.-- .................. \
                 111010 ..... ..... ................     @8LS_D_TSXP
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
+
+XXSPLTI32DX     000001 01 0000 -- -- ................ \
+                100000 ..... 000 .. ................    @8RR_D_IX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b64b965255..552f05bbda 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1466,6 +1466,23 @@ static bool trans_XXSPLTIB(DisasContext *ctx, arg_X_imm8 *a)
     return true;
 }
 
+static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
+{
+    TCGv_i32 imm;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    imm = tcg_constant_i32(a->si);
+
+    tcg_gen_st_i32(imm, cpu_env,
+        offsetof(CPUPPCState, vsr[a->xt].VsrW(0 + a->ix)));
+    tcg_gen_st_i32(imm, cpu_env,
+        offsetof(CPUPPCState, vsr[a->xt].VsrW(2 + a->ix)));
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
-- 
2.25.1


