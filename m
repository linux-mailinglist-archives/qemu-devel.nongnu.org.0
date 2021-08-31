Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DB3FCBC3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:48:34 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6w5-00025P-ID
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6rv-0006w1-Pr; Tue, 31 Aug 2021 12:44:15 -0400
Received: from [201.28.113.2] (port=43158 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6rt-0008P9-7b; Tue, 31 Aug 2021 12:44:15 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 94F47800930;
 Tue, 31 Aug 2021 13:43:06 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 03/19] host-utils: move checks out of divu128/divs128
Date: Tue, 31 Aug 2021 13:39:51 -0300
Message-Id: <20210831164007.297781-4-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:08.0432 (UTC)
 FILETIME=[4746E100:01D79E87]
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

In preparation for changing the divu128/divs128 implementations
to allow for quotients larger than 64 bits, move the div-by-zero
and overflow checks to the callers.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 include/hw/clock.h        |  5 +++--
 include/qemu/host-utils.h | 36 +++++++++++++-----------------------
 target/ppc/int_helper.c   | 14 +++++++++-----
 util/host-utils.c         | 39 +++++++++++++++++++--------------------
 4 files changed, 44 insertions(+), 50 deletions(-)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index a7187eab95..5a40a076aa 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -320,8 +320,9 @@ static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
         return 0;
     }
     /*
-     * Ignore divu128() return value as we've caught div-by-zero and don't
-     * need different behaviour for overflow.
+     * BUG: when CONFIG_INT128 is not defined, the current implementation of
+     * divu128 does not return a valid truncated quotient, so the result will
+     * be wrong.
      */
     divu128(&lo, &hi, clk->period);
     return lo;
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 0c6715774c..3648ca6759 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -52,36 +52,26 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     return (__int128_t)a * b / c;
 }
 
-static inline int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
-{
-    if (divisor == 0) {
-        return 1;
-    } else {
-        __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
-        __uint128_t result = dividend / divisor;
-        *plow = result;
-        *phigh = dividend % divisor;
-        return result > UINT64_MAX;
-    }
+static inline void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+{
+    __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
+    __uint128_t result = dividend / divisor;
+    *plow = result;
+    *phigh = dividend % divisor;
 }
 
-static inline int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+static inline void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
 {
-    if (divisor == 0) {
-        return 1;
-    } else {
-        __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
-        __int128_t result = dividend / divisor;
-        *plow = result;
-        *phigh = dividend % divisor;
-        return result != *plow;
-    }
+    __int128_t dividend = ((__int128_t)*phigh << 64) | *plow;
+    __int128_t result = dividend / divisor;
+    *plow = result;
+    *phigh = dividend % divisor;
 }
 #else
 void muls64(uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b);
 void mulu64(uint64_t *plow, uint64_t *phigh, uint64_t a, uint64_t b);
-int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
-int divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
+void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
+void divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
 
 static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f5dac3aa87..510faf24cf 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -104,10 +104,11 @@ uint64_t helper_divdeu(CPUPPCState *env, uint64_t ra, uint64_t rb, uint32_t oe)
     uint64_t rt = 0;
     int overflow = 0;
 
-    overflow = divu128(&rt, &ra, rb);
-
-    if (unlikely(overflow)) {
+    if (unlikely(rb == 0 || ra >= rb)) {
+        overflow = 1;
         rt = 0; /* Undefined */
+    } else {
+        divu128(&rt, &ra, rb);
     }
 
     if (oe) {
@@ -122,10 +123,13 @@ uint64_t helper_divde(CPUPPCState *env, uint64_t rau, uint64_t rbu, uint32_t oe)
     int64_t rt = 0;
     int64_t ra = (int64_t)rau;
     int64_t rb = (int64_t)rbu;
-    int overflow = divs128(&rt, &ra, rb);
+    int overflow = 0;
 
-    if (unlikely(overflow)) {
+    if (unlikely(rb == 0 || uabs64(ra) >= uabs64(rb))) {
+        overflow = 1;
         rt = 0; /* Undefined */
+    } else {
+        divs128(&rt, &ra, rb);
     }
 
     if (oe) {
diff --git a/util/host-utils.c b/util/host-utils.c
index a789a11b46..ff75fdf1e1 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -86,10 +86,14 @@ void muls64 (uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b)
     *phigh = rh;
 }
 
-/* Unsigned 128x64 division.  Returns 1 if overflow (divide by zero or */
-/* quotient exceeds 64 bits).  Otherwise returns quotient via plow and */
-/* remainder via phigh. */
-int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+/*
+ * Unsigned 128-by-64 division. Returns quotient via plow and
+ * remainder via phigh.
+ * The result must fit in 64 bits (plow) - otherwise, the result
+ * is undefined.
+ * This function will cause a division by zero if passed a zero divisor.
+ */
+void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
 {
     uint64_t dhi = *phigh;
     uint64_t dlo = *plow;
@@ -97,13 +101,11 @@ int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
     uint64_t carry = 0;
 
     if (divisor == 0) {
-        return 1;
+        /* intentionally cause a division by 0 */
+        *plow = 1 / divisor;
     } else if (dhi == 0) {
         *plow  = dlo / divisor;
         *phigh = dlo % divisor;
-        return 0;
-    } else if (dhi >= divisor) {
-        return 1;
     } else {
 
         for (i = 0; i < 64; i++) {
@@ -120,15 +122,20 @@ int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
 
         *plow = dlo;
         *phigh = dhi;
-        return 0;
     }
 }
 
-int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+/*
+ * Signed 128-by-64 division. Returns quotient via plow and
+ * remainder via phigh.
+ * The result must fit in 64 bits (plow) - otherwise, the result
+ * is undefined.
+ * This function will cause a division by zero if passed a zero divisor.
+ */
+void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
 {
     int sgn_dvdnd = *phigh < 0;
     int sgn_divsr = divisor < 0;
-    int overflow = 0;
 
     if (sgn_dvdnd) {
         *plow = ~(*plow);
@@ -145,19 +152,11 @@ int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
         divisor = 0 - divisor;
     }
 
-    overflow = divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
+    divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
 
     if (sgn_dvdnd  ^ sgn_divsr) {
         *plow = 0 - *plow;
     }
-
-    if (!overflow) {
-        if ((*plow < 0) ^ (sgn_dvdnd ^ sgn_divsr)) {
-            overflow = 1;
-        }
-    }
-
-    return overflow;
 }
 #endif
 
-- 
2.25.1


