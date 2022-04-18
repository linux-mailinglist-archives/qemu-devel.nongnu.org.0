Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD59505CA8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 18:47:05 +0200 (CEST)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngUWm-0008DO-5F
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 12:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ngUQp-0008MX-IY; Mon, 18 Apr 2022 12:40:55 -0400
Received: from [187.72.171.209] (port=5022 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ngUQo-0006YK-1Y; Mon, 18 Apr 2022 12:40:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Apr 2022 13:39:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 61FD78000A0;
 Mon, 18 Apr 2022 13:39:03 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH for-7.1 08/10] target/ppc: implement addg6s
Date: Mon, 18 Apr 2022 13:38:21 -0300
Message-Id: <20220418163823.61866-9-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418163823.61866-1-victor.colombo@eldorado.org.br>
References: <20220418163823.61866-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2022 16:39:03.0686 (UTC)
 FILETIME=[D0681A60:01D85342]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, victor.colombo@eldorado.org.br,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following Power ISA v2.06 instruction:
addg6s: Add and Generate Sixes

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/insn32.decode                   |  4 +++
 target/ppc/translate/fixedpoint-impl.c.inc | 35 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e16fad2853..f7d7dd69ce 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -296,6 +296,10 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
 PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
+## BCD Assist
+
+ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+
 ### Float-Point Load Instructions
 
 LFS             110000 ..... ..... ................     @D
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 1aab32be03..62f5027b5b 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -492,3 +492,38 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
+{
+    const uint64_t nibbles = 0x0f0f0f0f0f0f0f0fULL,
+                   carry_bits = 0x1010101010101010ULL;
+    TCGv t0, t1, t2;
+
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    t2 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_gpr[a->ra], nibbles);
+    tcg_gen_andi_tl(t1, cpu_gpr[a->rb], nibbles);
+    tcg_gen_add_tl(t0, t0, t1);
+    tcg_gen_andi_tl(t0, t0, carry_bits);
+    tcg_gen_shri_tl(t0, t0, 4);
+
+    tcg_gen_shri_tl(t1, cpu_gpr[a->ra], 4);
+    tcg_gen_shri_tl(t2, cpu_gpr[a->rb], 4);
+    tcg_gen_andi_tl(t1, t1, nibbles);
+    tcg_gen_andi_tl(t2, t2, nibbles);
+    tcg_gen_add_tl(t1, t1, t2);
+    tcg_gen_andi_tl(t1, t1, carry_bits);
+
+    tcg_gen_or_tl(t0, t0, t1);
+    tcg_gen_muli_tl(cpu_gpr[a->rt], t0, 6);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+
+    return true;
+}
-- 
2.25.1


