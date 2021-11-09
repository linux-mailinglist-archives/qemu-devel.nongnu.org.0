Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299D44A695
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:04:05 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKEm-0005rR-BH
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3h-0004Su-Gg; Tue, 09 Nov 2021 00:52:40 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=41221
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3c-0006fb-S5; Tue, 09 Nov 2021 00:52:36 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp06jxz4xdf; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=e4FkczxZIuxThYsrdcXOxmMs2Gkqd+il6D9R36eeEY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mMXIexsPbkEmDd+EvJIogACXESFp4THYeCRnIf61rcvXYxFfNAWhYGUSZFMwMd3OZ
 vQtED8NKTO7RWdTGg24GzkF1E/e9d/1KppMLnDUuqcWdSrR+htzUyb+6zAKQ53dvks
 dVp41IrVzoPrLvqPi7Sigk72OJh8VryZ1xK2R4mc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 10/54] target/ppc: Implement pextd instruction
Date: Tue,  9 Nov 2021 16:51:20 +1100
Message-Id: <20211109055204.230765-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-11-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  1 +
 target/ppc/int_helper.c                    | 18 ++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 3e22957559..808c582382 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -49,6 +49,7 @@ DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(bpermd, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c47a6a02e1..e13f920702 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -127,6 +127,7 @@ CFUGED          011111 ..... ..... ..... 0011011100 -   @X
 CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
 CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
+PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 337bb7f4d3..913d76be6e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -404,6 +404,24 @@ uint64_t helper_PDEPD(uint64_t src, uint64_t mask)
 
     return result;
 }
+
+uint64_t helper_PEXTD(uint64_t src, uint64_t mask)
+{
+    int i, o;
+    uint64_t result = 0;
+
+    if (mask == -1) {
+        return src;
+    }
+
+    for (o = 0; mask != 0; o++) {
+        i = ctz64(mask);
+        mask &= mask - 1;
+        result |= ((src >> i) & 1) << o;
+    }
+
+    return result;
+}
 #endif
 
 /*****************************************************************************/
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index f0bf69fbac..220b099fcd 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -481,3 +481,15 @@ static bool trans_PDEPD(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+static bool trans_PEXTD(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+#if defined(TARGET_PPC64)
+    gen_helper_PEXTD(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.33.1


