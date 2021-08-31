Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11393FCBD9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:52:08 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6zX-00089m-PP
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6ry-000743-Qg; Tue, 31 Aug 2021 12:44:18 -0400
Received: from [201.28.113.2] (port=43158 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6rw-0008P9-Vj; Tue, 31 Aug 2021 12:44:18 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:10 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DF69D800930;
 Tue, 31 Aug 2021 13:43:08 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 04/19] host-utils: add 128-bit quotient support to
 divu128/divs128
Date: Tue, 31 Aug 2021 13:39:52 -0300
Message-Id: <20210831164007.297781-5-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:10.0729 (UTC)
 FILETIME=[48A55F90:01D79E87]
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

A new argument, prem, was added to divu128/divs128 to receive the
remainder, freeing up phigh to receive the high 64 bits of the
quotient.

For scenarios supported by the previous implementation
(<= 64-bit quotient) with large (> 64-bit) dividends, testing showed
that:
- when dividend >> divisor, the performance of the new implementation
is equivalent to the old one.
- as the dividend and the divisor get closer (e.g. 65-bit dividend and
64-bit divisor), the performance is significantly improved, due to the
smaller number of shift-subtract iterations.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 include/hw/clock.h        |   8 +--
 include/qemu/host-utils.h |  20 ++++--
 target/ppc/int_helper.c   |  13 ++--
 util/host-utils.c         | 128 +++++++++++++++++++++++++++-----------
 4 files changed, 113 insertions(+), 56 deletions(-)

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
index 3648ca6759..6f18b29921 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -52,26 +52,34 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
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
     __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
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
index ff75fdf1e1..80f5a45cbd 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -87,75 +87,127 @@ void muls64 (uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b)
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
+    uint64_t result_bit;
+    uint64_t carry_bit = 0;
     unsigned i;
-    uint64_t carry = 0;
+    int dividend_lz_bits, divisor_lz_bits;
+    int diff_lz_bits;
 
     if (divisor == 0) {
         /* intentionally cause a division by 0 */
         *plow = 1 / divisor;
     } else if (dhi == 0) {
         *plow  = dlo / divisor;
-        *phigh = dlo % divisor;
+        *phigh = 0;
+        if (prem) {
+            *prem = dlo % divisor;
+        }
     } else {
+        dividend_lz_bits = clz64(dhi);
+        divisor_lz_bits = clz64(divisor);
+        diff_lz_bits = dividend_lz_bits - divisor_lz_bits;
 
-        for (i = 0; i < 64; i++) {
-            carry = dhi >> 63;
-            dhi = (dhi << 1) | (dlo >> 63);
-            if (carry || (dhi >= divisor)) {
+        /*
+         * Move relevant bits of dividend and divisor all the way to the left
+         */
+        if (dividend_lz_bits > 0) {
+            /* 0 < dividend_lz_bits < 64 */
+            dhi = dhi << dividend_lz_bits | dlo >> (64 - dividend_lz_bits);
+            dlo = dlo << dividend_lz_bits;
+        }
+        if (divisor_lz_bits > 0) {
+            /* 0 < divisor_lz_bits < 64 */
+            divisor = divisor << divisor_lz_bits;
+        }
+
+        for (i = 0; i < 65 - diff_lz_bits; i++) {
+            if (carry_bit || (dhi >= divisor)) {
                 dhi -= divisor;
-                carry = 1;
+                result_bit = 1;
             } else {
-                carry = 0;
+                result_bit = 0;
             }
-            dlo = (dlo << 1) | carry;
+
+            carry_bit = dhi >> 63;
+            dhi = (dhi << 1) | (dlo >> 63);
+            dlo = (dlo << 1) | result_bit;
         }
 
+        if (prem) {
+            if (divisor_lz_bits == 63) {
+                *prem = carry_bit;
+            } else {
+                *prem = carry_bit << (63 - divisor_lz_bits) |
+                    dhi >> (divisor_lz_bits + 1);
+            }
+        }
         *plow = dlo;
-        *phigh = dhi;
+        if (diff_lz_bits <= 0) {
+            *phigh = dhi & (0xffffffffffffffffULL >> (63 + diff_lz_bits));
+        } else {
+            *phigh = 0;
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
+    int neg_quotient = 0, neg_remainder = 0;
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
+        neg_quotient = ~neg_quotient;
+        neg_remainder = ~neg_remainder;
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
+        neg_quotient = ~neg_quotient;
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


