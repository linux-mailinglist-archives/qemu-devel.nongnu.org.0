Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41803436BB5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:02:12 +0200 (CEST)
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeGR-0004ZY-9A
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde2J-0003jh-Pa; Thu, 21 Oct 2021 15:47:36 -0400
Received: from [201.28.113.2] (port=10704 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde2H-0007UN-4j; Thu, 21 Oct 2021 15:47:35 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id F326B800145;
 Thu, 21 Oct 2021 16:46:56 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 08/33] target/ppc: Implement cnttzdm
Date: Thu, 21 Oct 2021 16:45:22 -0300
Message-Id: <20211021194547.672988-9-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:57.0467 (UTC)
 FILETIME=[682950B0:01D7C6B4]
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

From: Luis Pires <luis.pires@eldorado.org.br>

Implement the following PowerISA v3.1 instruction:
cnttzdm: Count Trailing Zeros Doubleword Under Bit Mask

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  1 +
 target/ppc/int_helper.c                    | 16 ++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ee7c82fb60..115bdf474a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -48,6 +48,7 @@ DEF_HELPER_FLAGS_2(cmpb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(CNTLZDM, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_2(CNTTZDM, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 221cb00dd6..3d692e9e6a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -204,6 +204,7 @@ ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
 
 CFUGED          011111 ..... ..... ..... 0011011100 -   @X
 CNTLZDM         011111 ..... ..... ..... 0000111011 -   @X
+CNTTZDM         011111 ..... ..... ..... 1000111011 -   @X
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index dcef356034..efda78ed8e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -404,6 +404,22 @@ uint64_t helper_CNTLZDM(uint64_t src, uint64_t mask)
     return count;
 }
 
+uint64_t helper_CNTTZDM(uint64_t src, uint64_t mask)
+{
+    uint64_t count = 0;
+
+    while (mask != 0) {
+        if ((src >> ctz64(mask)) & 1) {
+            break;
+        }
+
+        count++;
+        mask &= mask - 1;
+    }
+
+    return count;
+}
+
 /*****************************************************************************/
 /* PowerPC 601 specific instructions (POWER bridge) */
 target_ulong helper_div(CPUPPCState *env, target_ulong arg1, target_ulong arg2)
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 814fef2782..8c66fca96a 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -427,3 +427,15 @@ static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
 #endif
     return true;
 }
+
+static bool trans_CNTTZDM(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+#if defined(TARGET_PPC64)
+    gen_helper_CNTTZDM(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.25.1


