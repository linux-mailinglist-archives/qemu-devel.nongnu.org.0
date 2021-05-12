Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94C337D3D0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:22:13 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguQu-0001Z3-Nk
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6j-0002Zx-8y; Wed, 12 May 2021 15:01:23 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6e-0002Bm-84; Wed, 12 May 2021 15:01:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 652A880139F;
 Wed, 12 May 2021 15:56:08 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 29/31] target/ppc: Implement cfuged instruction
Date: Wed, 12 May 2021 15:54:39 -0300
Message-Id: <20210512185441.3619828-30-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:08.0735 (UTC)
 FILETIME=[780E3AF0:01D74760]
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  4 +++
 target/ppc/int_helper.c                    | 39 ++++++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 16 +++++++--
 4 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ea9f2a236c..c517b9f025 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -46,6 +46,7 @@ DEF_HELPER_4(divwe, tl, env, tl, tl, i32)
 DEF_HELPER_FLAGS_1(popcntb, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_2(cmpb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_3(sraw, tl, env, tl, tl)
+DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d69c0bc14c..64788e2a4b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -87,6 +87,10 @@ STDUX           011111 ..... ..... ..... 0010110101 -   @X
 ADDI            001110 ..... ..... ................     @D
 ADDIS           001111 ..... ..... ................     @D
 
+## Fixed-Point Logical Instructions
+
+CFUGED          011111 ..... ..... ..... 0011011100 -   @X
+
 ### Move To/From System Register Instructions
 
 SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index a44c2d90ea..d1cfb915ae 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -320,6 +320,45 @@ target_ulong helper_popcntb(target_ulong val)
 }
 #endif
 
+uint64_t helper_cfuged(uint64_t src, uint64_t mask)
+{
+    target_ulong m, left = 0, right = 0;
+    unsigned int n, i = 64;
+    bool bit = 0;
+
+    if (mask == 0 || mask == -1) {
+        return src;
+    }
+
+    while (i) {
+        n = ctz64(mask);
+        if (n > i) {
+            n = i;
+        }
+
+        m = (1ll << n) - 1;
+        if (bit) {
+            right = ror64(right | (src & m), n);
+        } else {
+            left = ror64(left | (src & m), n);
+        }
+
+        src >>= n;
+        mask >>= n;
+        i -= n;
+        bit = !bit;
+        mask = ~mask;
+    }
+
+    if (bit) {
+        n = ctpop64(mask);
+    } else {
+        n = 64 - ctpop64(mask);
+    }
+
+    return left | (right >> n);
+}
+
 /*****************************************************************************/
 /* PowerPC 601 specific instructions (POWER bridge) */
 target_ulong helper_div(CPUPPCState *env, target_ulong arg1, target_ulong arg2)
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 37dd25148c..4617f7356b 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -210,8 +210,8 @@ static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
 
     tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
     tcg_gen_andi_tl(temp, temp, mask);
-    tcg_gen_movcond_tl(a->r?TCG_COND_EQ:TCG_COND_NE, cpu_gpr[a->rt], temp,
-                       tcg_constant_tl(0), tcg_constant_tl(a->n?-1:1),
+    tcg_gen_movcond_tl(rev?TCG_COND_EQ:TCG_COND_NE, cpu_gpr[a->rt], temp,
+                       tcg_constant_tl(0), tcg_constant_tl(neg?-1:1),
                        tcg_constant_tl(0));
     tcg_temp_free(temp);
 
@@ -222,3 +222,15 @@ TRANS(SETBC, do_set_bool_cond, false, false)
 TRANS(SETBCR, do_set_bool_cond, false, true)
 TRANS(SETNBC, do_set_bool_cond, true, false)
 TRANS(SETNBCR, do_set_bool_cond, true, true)
+
+static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+#if defined(TARGET_PPC64)
+    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
+#else
+    gen_invalid(ctx);
+#endif
+    return true;
+}
-- 
2.25.1


