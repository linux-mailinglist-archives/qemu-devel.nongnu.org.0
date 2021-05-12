Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3C37D402
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:53:46 +0200 (CEST)
Received: from localhost ([::1]:56176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguvR-0003vg-Qm
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6Z-0002V6-Eb; Wed, 12 May 2021 15:01:13 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6O-0002Bm-RX; Wed, 12 May 2021 15:01:04 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0FFC28000C2;
 Wed, 12 May 2021 15:56:08 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 28/31] target/ppc: Implement setbc/setbcr/stnbc/setnbcr
 instructions
Date: Wed, 12 May 2021 15:54:38 -0300
Message-Id: <20210512185441.3619828-29-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:08.0423 (UTC)
 FILETIME=[77DE9F70:01D74760]
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
 target/ppc/insn32.decode                   | 10 ++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 21 +++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 8460100177..d69c0bc14c 100644
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
index 04a974214f..37dd25148c 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -201,3 +201,24 @@ static bool trans_PNOP(DisasContext *ctx, arg_PNOP *a)
     }
     return true;
 }
+
+static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    uint32_t mask = 0x08 >> (a->bi & 0x03);
+    TCGv temp = tcg_temp_new();
+
+    tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
+    tcg_gen_andi_tl(temp, temp, mask);
+    tcg_gen_movcond_tl(a->r?TCG_COND_EQ:TCG_COND_NE, cpu_gpr[a->rt], temp,
+                       tcg_constant_tl(0), tcg_constant_tl(a->n?-1:1),
+                       tcg_constant_tl(0));
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


