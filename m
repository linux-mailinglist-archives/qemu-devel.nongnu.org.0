Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9D399CEA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:43:55 +0200 (CEST)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loixH-0000mM-1A
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loie0-0008Fg-E1; Thu, 03 Jun 2021 04:24:00 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60737 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidx-0000bu-1p; Thu, 03 Jun 2021 04:23:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5r13vGz9t54; Thu,  3 Jun 2021 18:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708560;
 bh=7HbCeEYP4Knr/13RSg7pmc7d1IGZGsIdCR9HfHS96C0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JcAizsZa6lMoTkBqaiewruOCC8wAJg/HDvdXF7L4EtIUQr/GJmLjLi173+2d9aJ22
 biswcspGo1uzWUJPam0z4JZQvj1XFxhEZDnx+jNky8EbinamMvUfZPPBGiBtc8Srle
 UGyrB0hyH9ejq230fBZPyrvzrBIrwE6HQPMKGNFI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 37/42] target/ppc: Implement setbc/setbcr/stnbc/setnbcr
 instructions
Date: Thu,  3 Jun 2021 18:22:26 +1000
Message-Id: <20210603082231.601214-38-david@gibson.dropbear.id.au>
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following PowerISA v3.1 instructions:
setbc: Set Boolean Condition
setbcr: Set Boolean Condition Reverse
setnbc: Set Negative Boolean Condition
setnbcr: Set Negative Boolean Condition Reverse

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-11-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
index 2d2d874146..5f9845fa40 100644
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
+    if (neg) {
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
2.31.1


