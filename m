Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DB386BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:08:08 +0200 (CEST)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likT9-0002xt-48
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFT-0006KW-CM; Mon, 17 May 2021 16:53:59 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFR-0001mN-Ri; Mon, 17 May 2021 16:53:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id EA51B80139F;
 Mon, 17 May 2021 17:50:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 19/23] target/ppc: Implement setbc/setbcr/stnbc/setnbcr
 instructions
Date: Mon, 17 May 2021 17:50:21 -0300
Message-Id: <20210517205025.3777947-20-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:36.0411 (UTC)
 FILETIME=[49932CB0:01D74B5E]
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following PowerISA v3.1 instructions:
setbc: Set Boolean Condition
setbcr: Set Boolean Condition Reverse
setnbc: Set Negative Boolean Condition
setnbcr: Set Negative Boolean Condition Reverse

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v5:
- Style fix;
- Use tcg_gen_setcondi_tl instead of tcg_gen_movcond_tl.
---
 target/ppc/insn32.decode                   | 10 ++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 23 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 00ec0f4328..bc69c70493 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -26,6 +26,9 @@
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
+&X_bi           rt bi
+@X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -83,3 +86,10 @@ STDUX           011111 ..... ..... ..... 0010110101 -   @X
 
 ADDI            001110 ..... ..... ................     @D
 ADDIS           001111 ..... ..... ................     @D
+
+### Move To/From System Register Instructions
+
+SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
+SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
+SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
+SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 2d2d874146..204848d017 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -204,3 +204,26 @@ static bool trans_PNOP(DisasContext *ctx, arg_PNOP *a)
 {
     return true;
 }
+
+static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    uint32_t mask = 0x08 >> (a->bi & 0x03);
+    TCGCond cond = rev ? TCG_COND_EQ : TCG_COND_NE;
+    TCGv temp = tcg_temp_new();
+
+    tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
+    tcg_gen_andi_tl(temp, temp, mask);
+    tcg_gen_setcondi_tl(cond, cpu_gpr[a->rt], temp, 0);
+    if(neg) {
+        tcg_gen_neg_tl(cpu_gpr[a->rt], cpu_gpr[a->rt]);
+    }
+    tcg_temp_free(temp);
+
+    return true;
+}
+
+TRANS(SETBC, do_set_bool_cond, false, false)
+TRANS(SETBCR, do_set_bool_cond, false, true)
+TRANS(SETNBC, do_set_bool_cond, true, false)
+TRANS(SETNBCR, do_set_bool_cond, true, true)
-- 
2.25.1


