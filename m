Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9F439FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:22:19 +0200 (CEST)
Received: from localhost ([::1]:47504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5Y2-0006qF-Ej
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5Od-0006a0-O5; Mon, 25 Oct 2021 15:12:35 -0400
Received: from [201.28.113.2] (port=11219 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5OZ-0006mU-P1; Mon, 25 Oct 2021 15:12:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 25 Oct 2021 16:12:26 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 4A60F800BA7;
 Mon, 25 Oct 2021 16:12:26 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 03/19] host-utils: add 128-bit quotient support to
 divu128/divs128
Date: Mon, 25 Oct 2021 16:11:38 -0300
Message-Id: <20211025191154.350831-4-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025191154.350831-1-luis.pires@eldorado.org.br>
References: <20211025191154.350831-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Oct 2021 19:12:26.0579 (UTC)
 FILETIME=[3F77E230:01D7C9D4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will be used to implement new decimal floating point
instructions from Power ISA 3.1.

The remainder is now returned directly by divu128/divs128,
freeing up phigh to receive the high 64 bits of the quotient.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/clock.h        |   6 +-
 include/qemu/host-utils.h |  20 +++---
 target/ppc/int_helper.c   |   9 +--
 util/host-utils.c         | 127 ++++++++++++++++++++++++++------------
 4 files changed, 105 insertions(+), 57 deletions(-)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index 7443e6c4ab..5c927cee7f 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -323,11 +323,7 @@ static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
     if (clk->period == 0) {
         return 0;
     }
-    /*
-     * BUG: when CONFIG_INT128 is not defined, the current implementation of
-     * divu128 does not return a valid truncated quotient, so the result will
-     * be wrong.
-     */
+
     divu128(&lo, &hi, clk->period);
     return lo;
 }
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 08a17e16e5..a3a7ced78d 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -56,26 +56,32 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     return (__int128_t)a * b / c;
 }
 
-static inline void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+static inline uint64_t divu128(uint64_t *plow, uint64_t *phigh,
+                               uint64_t divisor)
 {
     __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
     __uint128_t result = dividend / divisor;
+
     *plow = result;
-    *phigh = dividend % divisor;
+    *phigh = result >> 64;
+    return dividend % divisor;
 }
 
-static inline void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+static inline int64_t divs128(uint64_t *plow, int64_t *phigh,
+                              int64_t divisor)
 {
-    __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
+    __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
     __int128_t result = dividend / divisor;
+
     *plow = result;
-    *phigh = dividend % divisor;
+    *phigh = result >> 64;
+    return dividend % divisor;
 }
 #else
 void muls64(uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b);
 void mulu64(uint64_t *plow, uint64_t *phigh, uint64_t a, uint64_t b);
-void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
-void divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
+uint64_t divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
+int64_t divs128(uint64_t *plow, int64_t *phigh, int64_t divisor);
 
 static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 510faf24cf..eeb7781a9e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -120,7 +120,7 @@ uint64_t helper_divdeu(CPUPPCState *env, uint64_t ra, uint64_t rb, uint32_t oe)
 
 uint64_t helper_divde(CPUPPCState *env, uint64_t rau, uint64_t rbu, uint32_t oe)
 {
-    int64_t rt = 0;
+    uint64_t rt = 0;
     int64_t ra = (int64_t)rau;
     int64_t rb = (int64_t)rbu;
     int overflow = 0;
@@ -2506,6 +2506,7 @@ uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
     int cr;
     uint64_t lo_value;
     uint64_t hi_value;
+    uint64_t rem;
     ppc_avr_t ret = { .u64 = { 0, 0 } };
 
     if (b->VsrSD(0) < 0) {
@@ -2541,10 +2542,10 @@ uint32_t helper_bcdcfsq(ppc_avr_t *r, ppc_avr_t *b, uint32_t ps)
          * In that case, we leave r unchanged.
          */
     } else {
-        divu128(&lo_value, &hi_value, 1000000000000000ULL);
+        rem = divu128(&lo_value, &hi_value, 1000000000000000ULL);
 
-        for (i = 1; i < 16; hi_value /= 10, i++) {
-            bcd_put_digit(&ret, hi_value % 10, i);
+        for (i = 1; i < 16; rem /= 10, i++) {
+            bcd_put_digit(&ret, rem % 10, i);
         }
 
         for (; i < 32; lo_value /= 10, i++) {
diff --git a/util/host-utils.c b/util/host-utils.c
index 701a371843..bcc772b8ec 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -87,72 +87,117 @@ void muls64 (uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b)
 }
 
 /*
- * Unsigned 128-by-64 division. Returns quotient via plow and
- * remainder via phigh.
- * The result must fit in 64 bits (plow) - otherwise, the result
- * is undefined.
- * This function will cause a division by zero if passed a zero divisor.
+ * Unsigned 128-by-64 division.
+ * Returns the remainder.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
  */
-void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+uint64_t divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
 {
     uint64_t dhi = *phigh;
     uint64_t dlo = *plow;
-    unsigned i;
-    uint64_t carry = 0;
+    uint64_t rem, dhighest;
+    int sh;
 
     if (divisor == 0 || dhi == 0) {
         *plow  = dlo / divisor;
-        *phigh = dlo % divisor;
+        *phigh = 0;
+        return dlo % divisor;
     } else {
+        sh = clz64(divisor);
 
-        for (i = 0; i < 64; i++) {
-            carry = dhi >> 63;
-            dhi = (dhi << 1) | (dlo >> 63);
-            if (carry || (dhi >= divisor)) {
-                dhi -= divisor;
-                carry = 1;
+        if (dhi < divisor) {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor <<= sh;
+                dhi = (dhi << sh) | (dlo >> (64 - sh));
+                dlo <<= sh;
+            }
+
+            *phigh = 0;
+            *plow = udiv_qrnnd(&rem, dhi, dlo, divisor);
+        } else {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor <<= sh;
+                dhighest = dhi >> (64 - sh);
+                dhi = (dhi << sh) | (dlo >> (64 - sh));
+                dlo <<= sh;
+
+                *phigh = udiv_qrnnd(&dhi, dhighest, dhi, divisor);
             } else {
-                carry = 0;
+                /**
+                 * dhi >= divisor
+                 * Since the MSB of divisor is set (sh == 0),
+                 * (dhi - divisor) < divisor
+                 *
+                 * Thus, the high part of the quotient is 1, and we can
+                 * calculate the low part with a single call to udiv_qrnnd
+                 * after subtracting divisor from dhi
+                 */
+                dhi -= divisor;
+                *phigh = 1;
             }
-            dlo = (dlo << 1) | carry;
+
+            *plow = udiv_qrnnd(&rem, dhi, dlo, divisor);
         }
 
-        *plow = dlo;
-        *phigh = dhi;
+        /*
+         * since the dividend/divisor might have been normalized,
+         * the remainder might also have to be shifted back
+         */
+        return rem >> sh;
     }
 }
 
 /*
- * Signed 128-by-64 division. Returns quotient via plow and
- * remainder via phigh.
- * The result must fit in 64 bits (plow) - otherwise, the result
- * is undefined.
- * This function will cause a division by zero if passed a zero divisor.
+ * Signed 128-by-64 division.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
  */
-void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+int64_t divs128(uint64_t *plow, int64_t *phigh, int64_t divisor)
 {
-    int sgn_dvdnd = *phigh < 0;
-    int sgn_divsr = divisor < 0;
+    bool neg_quotient = false, neg_remainder = false;
+    uint64_t unsig_hi = *phigh, unsig_lo = *plow;
+    uint64_t rem;
 
-    if (sgn_dvdnd) {
-        *plow = ~(*plow);
-        *phigh = ~(*phigh);
-        if (*plow == (int64_t)-1) {
-            *plow = 0;
-            (*phigh)++;
-         } else {
-            (*plow)++;
-         }
+    if (*phigh < 0) {
+        neg_quotient = !neg_quotient;
+        neg_remainder = !neg_remainder;
+
+        if (unsig_lo == 0) {
+            unsig_hi = -unsig_hi;
+        } else {
+            unsig_hi = ~unsig_hi;
+            unsig_lo = -unsig_lo;
+        }
     }
 
-    if (sgn_divsr) {
-        divisor = 0 - divisor;
+    if (divisor < 0) {
+        neg_quotient = !neg_quotient;
+
+        divisor = -divisor;
     }
 
-    divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
+    rem = divu128(&unsig_lo, &unsig_hi, (uint64_t)divisor);
+
+    if (neg_quotient) {
+        if (unsig_lo == 0) {
+            *phigh = -unsig_hi;
+            *plow = 0;
+        } else {
+            *phigh = ~unsig_hi;
+            *plow = -unsig_lo;
+        }
+    } else {
+        *phigh = unsig_hi;
+        *plow = unsig_lo;
+    }
 
-    if (sgn_dvdnd  ^ sgn_divsr) {
-        *plow = 0 - *plow;
+    if (neg_remainder) {
+        return -rem;
+    } else {
+        return rem;
     }
 }
 #endif
-- 
2.25.1


