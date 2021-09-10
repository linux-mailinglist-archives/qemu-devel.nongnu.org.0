Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD989406AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:48:44 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOf1O-0006Xc-Gx
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegT-0002XO-UM; Fri, 10 Sep 2021 07:27:05 -0400
Received: from [201.28.113.2] (port=13634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegQ-0001ua-NL; Fri, 10 Sep 2021 07:27:05 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 8321C800C19;
 Fri, 10 Sep 2021 08:26:51 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 07/22] host-utils: add 128-bit quotient support to
 divu128/divs128
Date: Fri, 10 Sep 2021 08:26:09 -0300
Message-Id: <20210910112624.72748-8-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:51.0744 (UTC)
 FILETIME=[C06B9600:01D7A636]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will be used to implement new decimal floating point
instructions from Power ISA 3.1.

A new argument, prem, was added to divu128/divs128 to receive the
remainder, freeing up phigh to receive the high 64 bits of the
quotient.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 include/hw/clock.h        |   8 +--
 include/qemu/host-utils.h |  22 +++++--
 target/ppc/int_helper.c   |  13 ++--
 util/host-utils.c         | 132 ++++++++++++++++++++++++++------------
 4 files changed, 115 insertions(+), 60 deletions(-)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index 5a40a076aa..2f162f7a6f 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -319,12 +319,8 @@ static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
     if (clk->period == 0) {
         return 0;
     }
-    /*
-     * BUG: when CONFIG_INT128 is not defined, the current implementation of
-     * divu128 does not return a valid truncated quotient, so the result will
-     * be wrong.
-     */
-    divu128(&lo, &hi, clk->period);
+
+    divu128(&lo, &hi, NULL, clk->period);
     return lo;
 }
 
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 08a17e16e5..eee58c0874 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -56,26 +56,34 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     return (__int128_t)a * b / c;
 }
 
-static inline void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+static inline void divu128(uint64_t *plow, uint64_t *phigh, uint64_t *prem,
+                           uint64_t divisor)
 {
     __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
     __uint128_t result = dividend / divisor;
     *plow = result;
-    *phigh = dividend % divisor;
+    *phigh = result >> 64;
+    if (prem) {
+        *prem = dividend % divisor;
+    }
 }
 
-static inline void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+static inline void divs128(uint64_t *plow, int64_t *phigh, int64_t *prem,
+                           int64_t divisor)
 {
-    __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
+    __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
     __int128_t result = dividend / divisor;
     *plow = result;
-    *phigh = dividend % divisor;
+    *phigh = result >> 64;
+    if (prem) {
+        *prem = dividend % divisor;
+    }
 }
 #else
 void muls64(uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b);
 void mulu64(uint64_t *plow, uint64_t *phigh, uint64_t a, uint64_t b);
-void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
-void divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
+void divu128(uint64_t *plow, uint64_t *phigh, uint64_t *prem, uint64_t divisor);
+void divs128(uint64_t *plow, int64_t *phigh, int64_t *prem, int64_t divisor);
 
 static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 510faf24cf..b3d302390a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -108,7 +108,7 @@ uint64_t helper_divdeu(CPUPPCState *env, uint64_t ra, uint64_t rb, uint32_t oe)
         overflow = 1;
         rt = 0; /* Undefined */
     } else {
-        divu128(&rt, &ra, rb);
+        divu128(&rt, &ra, NULL, rb);
     }
 
     if (oe) {
@@ -120,7 +120,7 @@ uint64_t helper_divdeu(CPUPPCState *env, uint64_t ra, uint64_t rb, uint32_t oe)
 
 uint64_t helper_divde(CPUPPCState *env, uint64_t rau, uint64_t rbu, uint32_t oe)
 {
-    int64_t rt = 0;
+    uint64_t rt = 0;
     int64_t ra = (int64_t)rau;
     int64_t rb = (int64_t)rbu;
     int overflow = 0;
@@ -129,7 +129,7 @@ uint64_t helper_divde(CPUPPCState *env, uint64_t rau, uint64_t rbu, uint32_t oe)
         overflow = 1;
         rt = 0; /* Undefined */
     } else {
-        divs128(&rt, &ra, rb);
+        divs128(&rt, &ra, NULL, rb);
     }
 
     if (oe) {
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
+        divu128(&lo_value, &hi_value, &rem, 1000000000000000ULL);
 
-        for (i = 1; i < 16; hi_value /= 10, i++) {
-            bcd_put_digit(&ret, hi_value % 10, i);
+        for (i = 1; i < 16; rem /= 10, i++) {
+            bcd_put_digit(&ret, rem % 10, i);
         }
 
         for (; i < 32; lo_value /= 10, i++) {
diff --git a/util/host-utils.c b/util/host-utils.c
index 701a371843..8834f3503f 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -87,72 +87,122 @@ void muls64 (uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b)
 }
 
 /*
- * Unsigned 128-by-64 division. Returns quotient via plow and
- * remainder via phigh.
- * The result must fit in 64 bits (plow) - otherwise, the result
- * is undefined.
- * This function will cause a division by zero if passed a zero divisor.
+ * Unsigned 128-by-64 division.
+ * Returns quotient via plow and phigh.
+ * Optionally (if prem != NULL), returns the remainder via prem.
  */
-void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+void divu128(uint64_t *plow, uint64_t *phigh, uint64_t *prem, uint64_t divisor)
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
+        if (prem) {
+            *prem = dlo % divisor;
+        }
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
+        if (prem) {
+            /*
+             * since the dividend/divisor might have been normalized,
+             * the remainder might also have to be shifted back
+             */
+            *prem = rem >> sh;
+        }
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
+ * Optionally (if prem != NULL), returns the remainder via prem.
  */
-void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+void divs128(uint64_t *plow, int64_t *phigh, int64_t *prem, int64_t divisor)
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
+    divu128(&unsig_lo, &unsig_hi, &rem, (uint64_t)divisor);
 
-    if (sgn_dvdnd  ^ sgn_divsr) {
-        *plow = 0 - *plow;
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
+
+    if (prem) {
+        if (neg_remainder) {
+            *prem = -rem;
+        } else {
+            *prem = rem;
+        }
     }
 }
 #endif
-- 
2.25.1


