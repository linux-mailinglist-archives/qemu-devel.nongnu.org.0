Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B9E399CFB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:46:28 +0200 (CEST)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loizj-0006gD-GC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loie6-0008Lf-2t; Thu, 03 Jun 2021 04:24:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57145 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidx-0000cV-SH; Thu, 03 Jun 2021 04:24:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5s1btgz9t5H; Thu,  3 Jun 2021 18:22:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708561;
 bh=W0eEheTbDJ3WJbjQVn97v55ot8/Dy8ULgRERo6bK4C4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h7i6t6qmFSc1XYLAQZxZW9b/CGoL8tGfUtMgqnlfI5FZBheg7KhKj1sbiT1BuGTuk
 9/AcwsxA1nR21mGrCUEpvg93tBbSkXMAkbeWAY9gEQN5f7fw1O5XT1HKBUke0fPweC
 eNYUp/rggVPDGHyBjnUcd/XHe/MxddlbVjOB2/0I=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 38/42] target/ppc: Implement cfuged instruction
Date: Thu,  3 Jun 2021 18:22:27 +1000
Message-Id: <20210603082231.601214-39-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-12-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


