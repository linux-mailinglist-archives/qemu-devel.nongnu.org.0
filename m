Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE57397AD4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 21:48:56 +0200 (CEST)
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loANj-0004uz-Bf
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 15:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1loABV-0002Wy-6M; Tue, 01 Jun 2021 15:36:17 -0400
Received: from [201.28.113.2] (port=31942 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1loABT-0002Jl-Ip; Tue, 01 Jun 2021 15:36:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 1 Jun 2021 16:35:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B30C080148B;
 Tue,  1 Jun 2021 16:35:44 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v6 11/14] target/ppc: Implement cfuged instruction
Date: Tue,  1 Jun 2021 16:35:25 -0300
Message-Id: <20210601193528.2533031-12-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jun 2021 19:35:45.0206 (UTC)
 FILETIME=[50CDED60:01D7571D]
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, groug@kaod.org,
 luis.pires@eldorado.org.br, lagarcia@br.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  4 ++
 target/ppc/int_helper.c                    | 62 ++++++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 12 +++++
 4 files changed, 79 insertions(+)

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
index bc69c70493..d4044d9069 100644
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
index 41f8477d4b..efa833ef64 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -320,6 +320,68 @@ target_ulong helper_popcntb(target_ulong val)
 }
 #endif
 
+uint64_t helper_cfuged(uint64_t src, uint64_t mask)
+{
+    /*
+     * Instead of processing the mask bit-by-bit from the most significant to
+     * the least significant bit, as described in PowerISA, we'll handle it in
+     * blocks of 'n' zeros/ones from LSB to MSB. To avoid the decision to use
+     * ctz or cto, we negate the mask at the end of the loop.
+     */
+    target_ulong m, left = 0, right = 0;
+    unsigned int n, i = 64;
+    bool bit = false; /* tracks if we are processing zeros or ones */
+
+    if (mask == 0 || mask == -1) {
+        return src;
+    }
+
+    /* Processes the mask in blocks, from LSB to MSB */
+    while (i) {
+        /* Find how many bits we should take */
+        n = ctz64(mask);
+        if (n > i) {
+            n = i;
+        }
+
+        /*
+         * Extracts 'n' trailing bits of src and put them on the leading 'n'
+         * bits of 'right' or 'left', pushing down the previously extracted
+         * values.
+         */
+        m = (1ll << n) - 1;
+        if (bit) {
+            right = ror64(right | (src & m), n);
+        } else {
+            left = ror64(left | (src & m), n);
+        }
+
+        /*
+         * Discards the processed bits from 'src' and 'mask'. Note that we are
+         * removing 'n' trailing zeros from 'mask', but the logical shift will
+         * add 'n' leading zeros back, so the population count of 'mask' is kept
+         * the same.
+         */
+        src >>= n;
+        mask >>= n;
+        i -= n;
+        bit = !bit;
+        mask = ~mask;
+    }
+
+    /*
+     * At the end, right was ror'ed ctpop(mask) times. To put it back in place,
+     * we'll shift it more 64-ctpop(mask) times.
+     */
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
index 5f9845fa40..50933a3b9d 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -227,3 +227,15 @@ TRANS(SETBC, do_set_bool_cond, false, false)
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
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.25.1


