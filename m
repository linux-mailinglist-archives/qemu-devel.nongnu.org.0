Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87720440445
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:42:11 +0200 (CEST)
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYhW-00079z-8f
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRi-0001Nv-SP; Fri, 29 Oct 2021 16:25:50 -0400
Received: from [201.28.113.2] (port=65208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRh-0001sK-BR; Fri, 29 Oct 2021 16:25:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:25:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 94EF1800B36;
 Fri, 29 Oct 2021 17:25:41 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 07/34] target/ppc: Implement cntlzdm
Date: Fri, 29 Oct 2021 17:23:57 -0300
Message-Id: <20211029202424.175401-8-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:25:42.0110 (UTC)
 FILETIME=[250FAFE0:01D7CD03]
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
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Implement the following PowerISA v3.1 instruction:
cntlzdm: Count Leading Zeros Doubleword Under Bit Mask

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
- Inline implementation of cntlzdm
---
 target/ppc/insn32.decode                   |  1 +
 target/ppc/translate/fixedpoint-impl.c.inc | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9cb9fc00b8..221cb00dd6 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -203,6 +203,7 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
 ## Fixed-Point Logical Instructions
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
+CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 0d9c6e0996..c9e9ae35df 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -413,3 +413,39 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+#if defined(TARGET_PPC64)
+static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
+{
+    TCGv_i64 tmp;
+    TCGLabel *l1;
+
+    tmp = tcg_temp_local_new_i64();
+    l1 = gen_new_label();
+
+    tcg_gen_and_i64(tmp, src, mask);
+    tcg_gen_clzi_i64(tmp, tmp, 64);
+
+    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
+
+    tcg_gen_subfi_i64(tmp, 64, tmp);
+    tcg_gen_shr_i64(tmp, mask, tmp);
+    tcg_gen_ctpop_i64(tmp, tmp);
+
+    gen_set_label(l1);
+
+    tcg_gen_mov_i64(dst, tmp);
+}
+#endif
+
+static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+#if defined(TARGET_PPC64)
+    do_cntlzdm(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.25.1


