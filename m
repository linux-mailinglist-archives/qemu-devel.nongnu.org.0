Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6C4ECE02
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:38:42 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZf5V-00021E-5U
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:38:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuO-0004UC-Rq; Wed, 30 Mar 2022 16:27:12 -0400
Received: from [187.72.171.209] (port=8867 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuN-0001WS-3R; Wed, 30 Mar 2022 16:27:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 17:25:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A8B968002AF;
 Wed, 30 Mar 2022 17:25:41 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 06/10] Implemented unsigned 256-by-128 division
Date: Wed, 30 Mar 2022 17:25:11 -0300
Message-Id: <20220330202515.66554-7-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 20:25:42.0279 (UTC)
 FILETIME=[53F37970:01D84474]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Based on already existing QEMU implementation, created an unsigned 256
bit by 128 bit division needed to implement the vector divide extended
unsigned instruction from PowerISA3.1

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 include/qemu/host-utils.h |  15 +++++
 include/qemu/int128.h     |  20 ++++++
 util/host-utils.c         | 128 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index ca979dc6cc..6479403935 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -32,6 +32,7 @@
 
 #include "qemu/compiler.h"
 #include "qemu/bswap.h"
+#include "qemu/int128.h"
 
 #ifdef CONFIG_INT128
 static inline void mulu64(uint64_t *plow, uint64_t *phigh,
@@ -142,6 +143,19 @@ static inline int clz64(uint64_t val)
     return val ? __builtin_clzll(val) : 64;
 }
 
+/**
+ * clz128 - count leading zeros in a 128-bit value.
+ * @val: The value to search
+ */
+static inline int clz128(Int128 a)
+{
+    if (int128_gethi(a)) {
+        return clz64(int128_gethi(a));
+    } else {
+        return clz64(int128_getlo(a)) + 64;
+    }
+}
+
 /**
  * clo64 - count leading ones in a 64-bit value.
  * @val: The value to search
@@ -849,4 +863,5 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
 #endif
 }
 
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
 #endif
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index ca32b0b276..b1eb094525 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -128,11 +128,21 @@ static inline bool int128_ge(Int128 a, Int128 b)
     return a >= b;
 }
 
+static inline bool int128_uge(Int128 a, Int128 b)
+{
+    return ((__uint128_t)a) >= ((__uint128_t)b);
+}
+
 static inline bool int128_lt(Int128 a, Int128 b)
 {
     return a < b;
 }
 
+static inline bool int128_ult(Int128 a, Int128 b)
+{
+    return (__uint128_t)a < (__uint128_t)b;
+}
+
 static inline bool int128_le(Int128 a, Int128 b)
 {
     return a <= b;
@@ -373,11 +383,21 @@ static inline bool int128_ge(Int128 a, Int128 b)
     return a.hi > b.hi || (a.hi == b.hi && a.lo >= b.lo);
 }
 
+static inline bool int128_uge(Int128 a, Int128 b)
+{
+    return (uint64_t)a.hi > (uint64_t)b.hi || (a.hi == b.hi && a.lo >= b.lo);
+}
+
 static inline bool int128_lt(Int128 a, Int128 b)
 {
     return !int128_ge(a, b);
 }
 
+static inline bool int128_ult(Int128 a, Int128 b)
+{
+    return !int128_uge(a, b);
+}
+
 static inline bool int128_le(Int128 a, Int128 b)
 {
     return int128_ge(b, a);
diff --git a/util/host-utils.c b/util/host-utils.c
index bcc772b8ec..a495cc820d 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -266,3 +266,131 @@ void ulshift(uint64_t *plow, uint64_t *phigh, int32_t shift, bool *overflow)
         *plow = *plow << shift;
     }
 }
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder via r.
+ * Returns lower 128 bit of quotient.
+ * Needs a normalized divisor (most significant bit set to 1).
+ *
+ * Adapted from include/qemu/host-utils.h udiv_qrnnd,
+ * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
+ * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
+ *
+ * Licensed under the GPLv2/LGPLv3
+ */
+static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
+{
+    Int128 d0, d1, q0, q1, r1, r0, m;
+    uint64_t mp0, mp1;
+
+    d0 = int128_make64(int128_getlo(d));
+    d1 = int128_make64(int128_gethi(d));
+
+    r1 = int128_remu(n1, d1);
+    q1 = int128_divu(n1, d1);
+    mp0 = int128_getlo(q1);
+    mp1 = int128_gethi(q1);
+    mulu128(&mp0, &mp1, int128_getlo(d0));
+    m = int128_make128(mp0, mp1);
+    r1 = int128_make128(int128_gethi(n0), int128_getlo(r1));
+    if (int128_ult(r1, m)) {
+        q1 = int128_sub(q1, int128_one());
+        r1 = int128_add(r1, d);
+        if (int128_uge(r1, d)) {
+            if (int128_ult(r1, m)) {
+                q1 = int128_sub(q1, int128_one());
+                r1 = int128_add(r1, d);
+            }
+        }
+    }
+    r1 = int128_sub(r1, m);
+
+    r0 = int128_remu(r1, d1);
+    q0 = int128_divu(r1, d1);
+    mp0 = int128_getlo(q0);
+    mp1 = int128_gethi(q0);
+    mulu128(&mp0, &mp1, int128_getlo(d0));
+    m = int128_make128(mp0, mp1);
+    r0 = int128_make128(int128_getlo(n0), int128_getlo(r0));
+    if (int128_ult(r0, m)) {
+        q0 = int128_sub(q0, int128_one());
+        r0 = int128_add(r0, d);
+        if (int128_uge(r0, d)) {
+            if (int128_ult(r0, m)) {
+                q0 = int128_sub(q0, int128_one());
+                r0 = int128_add(r0, d);
+            }
+        }
+    }
+    r0 = int128_sub(r0, m);
+
+    *r = r0;
+    return int128_or(int128_lshift(q1, 64), q0);
+}
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    Int128 dhi = *phigh;
+    Int128 dlo = *plow;
+    Int128 rem, dhighest;
+    int sh;
+
+    if (!int128_nz(divisor) || !int128_nz(dhi)) {
+        *plow  = int128_divu(dlo, divisor);
+        *phigh = int128_zero();
+        return int128_remu(dlo, divisor);
+    } else {
+        sh = clz128(divisor);
+
+        if (int128_ult(dhi, divisor)) {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor = int128_lshift(divisor, sh);
+                dhi = int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo = int128_lshift(dlo, sh);
+            }
+
+            *phigh = int128_zero();
+            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
+        } else {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor = int128_lshift(divisor, sh);
+                dhighest = int128_rshift(dhi, (128 - sh));
+                dhi = int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo = int128_lshift(dlo, sh);
+
+                *phigh = udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
+            } else {
+                /**
+                 * dhi >= divisor
+                 * Since the MSB of divisor is set (sh == 0),
+                 * (dhi - divisor) < divisor
+                 *
+                 * Thus, the high part of the quotient is 1, and we can
+                 * calculate the low part with a single call to udiv_qrnnd
+                 * after subtracting divisor from dhi
+                 */
+                dhi = int128_sub(dhi, divisor);
+                *phigh = int128_one();
+            }
+
+            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
+        }
+
+        /*
+         * since the dividend/divisor might have been normalized,
+         * the remainder might also have to be shifted back
+         */
+        rem = int128_urshift(rem, sh);
+        return rem;
+    }
+}
-- 
2.31.1


