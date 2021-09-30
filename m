Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF4B41D2F4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:58:38 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp5Y-0005fX-DD
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos9-00011z-Sl; Thu, 30 Sep 2021 01:44:45 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos7-0003VS-Ry; Thu, 30 Sep 2021 01:44:45 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR1KWqz4xbg; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=qhmA7dMFPqO69K7C9FemWed6fVmEm5KeIrFF6VnDAOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cTEybkzpvxGJmTbSJAeGPDptPb2ZeILzaWcxAL2OzlJHMqLuJ6NaCAEpewrG6ZcmR
 jRUJA2DP53iJmvQAu+IZftWulHdyc8RWilXmBZrBDAjAHRULbWQYK1e3coTqfqO4EH
 24ONiDgzdIad4IdqYEwZTW33CfhKYZUHpJGY4UTM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 13/44] target/ppc: fix setting of CR flags in bcdcfsq
Date: Thu, 30 Sep 2021 15:43:55 +1000
Message-Id: <20210930054426.357344-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

According to the ISA, CR should be set based on the source value, and
not on the packed decimal result.
The way this was implemented would cause GT, LT and EQ to be set
incorrectly when the source value was too large and the 31 least
significant digits of the packed decimal result ended up being all zero.
This would happen for source values of +/-10^31, +/-10^32, etc.

The new implementation fixes this and also skips the result calculation
altogether in case of src overflow.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <20210823150235.35759-1-luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/int_helper.c | 61 ++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c2d3248d1e..f5dac3aa87 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2480,10 +2480,26 @@ uint32_t helper_bcdctz(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
     return cr;
 }
 
+/**
+ * Compare 2 128-bit unsigned integers, passed in as unsigned 64-bit pairs
+ *
+ * Returns:
+ * > 0 if ahi|alo > bhi|blo,
+ * 0 if ahi|alo == bhi|blo,
+ * < 0 if ahi|alo < bhi|blo
+ */
+static inline int ucmp128(uint64_t alo, uint64_t ahi,
+                          uint64_t blo, uint64_t bhi)
+{
+    return (ahi == bhi) ?
+        (alo > blo ? 1 : (alo == blo ? 0 : -1)) :
+        (ahi > bhi ? 1 : -1);
+}
+
 uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
 {
     int i;
-    int cr = 0;
+    int cr;
     uint64_t lo_value;
     uint64_t hi_value;
     ppc_avr_t ret = { .u64 = { 0, 0 } };
@@ -2492,28 +2508,47 @@ uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
         lo_value = -b->VsrSD(1);
         hi_value = ~b->VsrD(0) + !lo_value;
         bcd_put_digit(&ret, 0xD, 0);
+
+        cr = CRF_LT;
     } else {
         lo_value = b->VsrD(1);
         hi_value = b->VsrD(0);
         bcd_put_digit(&ret, bcd_preferred_sgn(0, ps), 0);
-    }
 
-    if (divu128(&lo_value, &hi_value, 1000000000000000ULL) ||
-            lo_value > 9999999999999999ULL) {
-        cr = CRF_SO;
+        if (hi_value == 0 && lo_value == 0) {
+            cr = CRF_EQ;
+        } else {
+            cr = CRF_GT;
+        }
     }
 
-    for (i = 1; i < 16; hi_value /= 10, i++) {
-        bcd_put_digit(&ret, hi_value % 10, i);
-    }
+    /*
+     * Check src limits: abs(src) <= 10^31 - 1
+     *
+     * 10^31 - 1 = 0x0000007e37be2022 c0914b267fffffff
+     */
+    if (ucmp128(lo_value, hi_value,
+                0xc0914b267fffffffULL, 0x7e37be2022ULL) > 0) {
+        cr |= CRF_SO;
 
-    for (; i < 32; lo_value /= 10, i++) {
-        bcd_put_digit(&ret, lo_value % 10, i);
-    }
+        /*
+         * According to the ISA, if src wouldn't fit in the destination
+         * register, the result is undefined.
+         * In that case, we leave r unchanged.
+         */
+    } else {
+        divu128(&lo_value, &hi_value, 1000000000000000ULL);
 
-    cr |= bcd_cmp_zero(&ret);
+        for (i = 1; i < 16; hi_value /= 10, i++) {
+            bcd_put_digit(&ret, hi_value % 10, i);
+        }
 
-    *r = ret;
+        for (; i < 32; lo_value /= 10, i++) {
+            bcd_put_digit(&ret, lo_value % 10, i);
+        }
+
+        *r = ret;
+    }
 
     return cr;
 }
-- 
2.31.1


