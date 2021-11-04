Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28113445363
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:54:57 +0100 (CET)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micGe-0006Qr-85
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic6K-0005QP-Br; Thu, 04 Nov 2021 08:44:16 -0400
Received: from [201.28.113.2] (port=43952 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic6I-0000L9-GC; Thu, 04 Nov 2021 08:44:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 28614800BA7;
 Thu,  4 Nov 2021 09:39:24 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 22/25] target/ppc: implemented XXSPLTIDP instruction
Date: Thu,  4 Nov 2021 09:37:16 -0300
Message-Id: <20211104123719.323713-23-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:24.0535 (UTC)
 FILETIME=[FF9B0870:01D7D178]
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

Implemented the instruction XXSPLTIDP using decodetree.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode            |  2 ++
 target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index bd71f616cc..20aa2b4615 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -169,6 +169,8 @@ PLXVP           000001 00 0--.-- .................. \
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
 
+XXSPLTIDP       000001 01 0000 -- -- ................ \
+                100000 ..... 0010 . ................    @8RR_D
 XXSPLTIW        000001 01 0000 -- -- ................ \
                 100000 ..... 0011 . ................    @8RR_D
 XXSPLTI32DX     000001 01 0000 -- -- ................ \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 7116141a6a..180d329f1a 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1476,6 +1476,16 @@ static bool trans_XXSPLTIW(DisasContext *ctx, arg_8RR_D *a)
     return true;
 }
 
+static bool trans_XXSPLTIDP(DisasContext *ctx, arg_8RR_D *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_dup_imm(MO_64, vsr_full_offset(a->xt), 16, 16,
+                         helper_todouble(a->si));
+    return true;
+}
+
 static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
 {
     TCGv_i32 imm;
-- 
2.25.1


