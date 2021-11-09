Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046C44A6A8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:11:19 +0100 (CET)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKLm-0003Xi-Ib
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3f-0004Sq-It; Tue, 09 Nov 2021 00:52:38 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:51955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3X-0006eu-LJ; Tue, 09 Nov 2021 00:52:31 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn6sqbz4xdh; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=daNdh+0z7mIscA/+vk9wlvEtLmeSwD9eZrAQ2LjbpZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ppT3Z1qeHj6uQrb9RZ8yzLL8yPhLhAv5e1L4iw2vBP+wLaNNnBvAN8HRAwI4kP/g9
 el188CfHOCtPKnFUsracXi09tpvwJ5fLFrb6xAXMFCCLhnvDWmQKoZqasSkYGBP7GH
 Xe9hrU0f7WiebG58pj6t6eU54jAQhWeIuwj4wt1o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 08/54] target/ppc: Implement cnttzdm
Date: Tue,  9 Nov 2021 16:51:18 +1100
Message-Id: <20211109055204.230765-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Implement the following PowerISA v3.1 instruction:
cnttzdm: Count Trailing Zeros Doubleword Under Bit Mask

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-9-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode                   |  1 +
 target/ppc/translate/fixedpoint-impl.c.inc | 28 ++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index eb3383c99c..ee8c90d520 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -125,6 +125,7 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
 CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
+CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index c9e9ae35df..d3dc0a474e 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -415,7 +415,7 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
 }
 
 #if defined(TARGET_PPC64)
-static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
+static void do_cntzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask, bool trail)
 {
     TCGv_i64 tmp;
     TCGLabel *l1;
@@ -424,12 +424,20 @@ static void do_cntlzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask)
     l1 = gen_new_label();
 
     tcg_gen_and_i64(tmp, src, mask);
-    tcg_gen_clzi_i64(tmp, tmp, 64);
+    if (trail) {
+        tcg_gen_ctzi_i64(tmp, tmp, 64);
+    } else {
+        tcg_gen_clzi_i64(tmp, tmp, 64);
+    }
 
     tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
 
     tcg_gen_subfi_i64(tmp, 64, tmp);
-    tcg_gen_shr_i64(tmp, mask, tmp);
+    if (trail) {
+        tcg_gen_shl_i64(tmp, mask, tmp);
+    } else {
+        tcg_gen_shr_i64(tmp, mask, tmp);
+    }
     tcg_gen_ctpop_i64(tmp, tmp);
 
     gen_set_label(l1);
@@ -443,7 +451,19 @@ static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
 #if defined(TARGET_PPC64)
-    do_cntlzdm(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+    do_cntzdm(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb], false);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
+static bool trans_CNTTZDM(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+#if defined(TARGET_PPC64)
+    do_cntzdm(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb], true);
 #else
     qemu_build_not_reached();
 #endif
-- 
2.33.1


