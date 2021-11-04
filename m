Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764624453A8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:15:04 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mica7-0008NW-EF
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic6H-0005Jt-FA; Thu, 04 Nov 2021 08:44:13 -0400
Received: from [201.28.113.2] (port=43952 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic6G-0000L9-0G; Thu, 04 Nov 2021 08:44:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B8FFE800BA7;
 Thu,  4 Nov 2021 09:39:23 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 21/25] target/ppc: Implemented XXSPLTIW using decodetree
Date: Thu,  4 Nov 2021 09:37:15 -0300
Message-Id: <20211104123719.323713-22-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:24.0158 (UTC)
 FILETIME=[FF6181E0:01D7D178]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Implemented the XXSPLTIW instruction, using decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode            |  6 ++++++
 target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 134bc60c57..bd71f616cc 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -39,6 +39,10 @@
 @8RR_D_IX       ...... .. .... .. .. ................ \
                 ...... ..... ... ix:1 . ................ \
                 &8RR_D_IX si=%8rr_si xt=%8rr_xt
+&8RR_D          xt si:int32_t
+@8RR_D          ...... .. .... .. .. ................ \
+                ...... ..... ....  . ................ \
+                &8RR_D si=%8rr_si xt=%8rr_xt
 
 ### Fixed-Point Load Instructions
 
@@ -165,5 +169,7 @@ PLXVP           000001 00 0--.-- .................. \
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
 
+XXSPLTIW        000001 01 0000 -- -- ................ \
+                100000 ..... 0011 . ................    @8RR_D
 XXSPLTI32DX     000001 01 0000 -- -- ................ \
                 100000 ..... 000 .. ................    @8RR_D_IX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 360593a9ab..7116141a6a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1466,6 +1466,16 @@ static bool trans_XXSPLTIB(DisasContext *ctx, arg_X_imm8 *a)
     return true;
 }
 
+static bool trans_XXSPLTIW(DisasContext *ctx, arg_8RR_D *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_dup_imm(MO_32, vsr_full_offset(a->xt), 16, 16, a->si);
+
+    return true;
+}
+
 static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
 {
     TCGv_i32 imm;
-- 
2.25.1


