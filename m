Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58A436B89
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:52:36 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mde79-0000DN-58
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3P-00055r-KF; Thu, 21 Oct 2021 15:48:43 -0400
Received: from [201.28.113.2] (port=47716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde3N-0001rY-M5; Thu, 21 Oct 2021 15:48:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BE72380012A;
 Thu, 21 Oct 2021 16:46:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 10/33] target/ppc: Implement pextd instruction
Date: Thu, 21 Oct 2021 16:45:24 -0300
Message-Id: <20211021194547.672988-11-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:58.0315 (UTC)
 FILETIME=[68AAB5B0:01D7C6B4]
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
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  1 +
 target/ppc/int_helper.c                    | 18 ++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4a87e1258b..3c4a01fd65 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -50,6 +50,7 @@ DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(CNTLZDM, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(CNTTZDM, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ff70b3e863..65075f0d03 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -206,6 +206,7 @@ CFUGED          011111 ..... ..... ..... 0011011100 -   @X
 CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
 CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 PDEPD           011111 ..... ..... ..... 0010011100 -   @X
+PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ba8ff1a475..8994e68068 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -438,6 +438,24 @@ uint64_t helper_PDEPD(uint64_t src, uint64_t mask)
     return result;
 }
 
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
+
 /*****************************************************************************/
 /* PowerPC 601 specific instructions (POWER bridge) */
 target_ulong helper_div(CPUPPCState *env, target_ulong arg1, target_ulong arg2)
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index c86b4621b8..37806396f2 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -451,3 +451,15 @@ static bool trans_PDEPD(DisasContext *ctx, arg_X *a)
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
2.25.1


