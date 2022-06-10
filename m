Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B1546C5A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:30:35 +0200 (CEST)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjP0-0005Mz-4F
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJx-00013I-CB; Fri, 10 Jun 2022 14:25:22 -0400
Received: from [187.72.171.209] (port=48290 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJv-0003eJ-HI; Fri, 10 Jun 2022 14:25:20 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0186E800058;
 Fri, 10 Jun 2022 15:23:43 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH RESEND v2 09/11] target/ppc: implement addg6s
Date: Fri, 10 Jun 2022 15:23:08 -0300
Message-Id: <20220610182310.68715-10-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
References: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:43.0228 (UTC)
 FILETIME=[3732EBC0:01D87CF7]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following Power ISA v2.06 instruction:
addg6s: Add and Generate Sixes

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/insn32.decode                   |  4 +++
 target/ppc/translate/fixedpoint-impl.c.inc | 37 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index da507758b8..f71721f3c0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -311,6 +311,10 @@ CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
 PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
+## BCD Assist
+
+ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+
 ### Float-Point Load Instructions
 
 LFS             110000 ..... ..... ................     @D
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 1aab32be03..490e49cfc7 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -492,3 +492,40 @@ static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
+{
+    const uint64_t carry_bits = 0x1111111111111111ULL;
+    TCGv t0, t1, carry, zero = tcg_constant_tl(0);
+
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+
+    t0 = tcg_temp_new();
+    t1 = tcg_const_tl(0);
+    carry = tcg_const_tl(0);
+
+    for (int i = 0; i < 16; i++) {
+        tcg_gen_shri_tl(t0, cpu_gpr[a->ra], i * 4);
+        tcg_gen_andi_tl(t0, t0, 0xf);
+        tcg_gen_add_tl(t1, t1, t0);
+
+        tcg_gen_shri_tl(t0, cpu_gpr[a->rb], i * 4);
+        tcg_gen_andi_tl(t0, t0, 0xf);
+        tcg_gen_add_tl(t1, t1, t0);
+
+        tcg_gen_andi_tl(t1, t1, 0x10);
+        tcg_gen_setcond_tl(TCG_COND_NE, t1, t1, zero);
+
+        tcg_gen_shli_tl(t0, t1, i * 4);
+        tcg_gen_or_tl(carry, carry, t0);
+    }
+
+    tcg_gen_xori_tl(carry, carry, (target_long)carry_bits);
+    tcg_gen_muli_tl(cpu_gpr[a->rt], carry, 6);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(carry);
+
+    return true;
+}
-- 
2.25.1


