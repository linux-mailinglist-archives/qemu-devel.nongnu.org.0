Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8F406ACC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:41:36 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOeuV-0000f8-TV
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegP-0002Od-Iq; Fri, 10 Sep 2021 07:27:01 -0400
Received: from [201.28.113.2] (port=13634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegN-0001ua-PN; Fri, 10 Sep 2021 07:27:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6003A8014C3;
 Fri, 10 Sep 2021 08:26:51 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 06/22] host-utils: move udiv_qrnnd() to host-utils
Date: Fri, 10 Sep 2021 08:26:08 -0300
Message-Id: <20210910112624.72748-7-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:51.0572 (UTC)
 FILETIME=[C0515740:01D7A636]
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

Move udiv_qrnnd() from include/fpu/softfloat-macros.h to host-utils,
so it can be reused by divu128().

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 include/fpu/softfloat-macros.h | 82 ----------------------------------
 include/qemu/host-utils.h      | 81 +++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 82 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index 81c3fe8256..f35cdbfa63 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -8,7 +8,6 @@
  * so some portions are provided under:
  *  the SoftFloat-2a license
  *  the BSD license
- *  GPL-v2-or-later
  *
  * Any future contributions to this file after December 1st 2014 will be
  * taken to be licensed under the Softfloat-2a license unless specifically
@@ -75,10 +74,6 @@ this code that are retained.
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Portions of this work are licensed under the terms of the GNU GPL,
- * version 2 or later. See the COPYING file in the top-level directory.
- */
-
 #ifndef FPU_SOFTFLOAT_MACROS_H
 #define FPU_SOFTFLOAT_MACROS_H
 
@@ -585,83 +580,6 @@ static inline uint64_t estimateDiv128To64(uint64_t a0, uint64_t a1, uint64_t b)
 
 }
 
-/* From the GNU Multi Precision Library - longlong.h __udiv_qrnnd
- * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
- *
- * Licensed under the GPLv2/LGPLv3
- */
-static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
-                                  uint64_t n0, uint64_t d)
-{
-#if defined(__x86_64__)
-    uint64_t q;
-    asm("divq %4" : "=a"(q), "=d"(*r) : "0"(n0), "1"(n1), "rm"(d));
-    return q;
-#elif defined(__s390x__) && !defined(__clang__)
-    /* Need to use a TImode type to get an even register pair for DLGR.  */
-    unsigned __int128 n = (unsigned __int128)n1 << 64 | n0;
-    asm("dlgr %0, %1" : "+r"(n) : "r"(d));
-    *r = n >> 64;
-    return n;
-#elif defined(_ARCH_PPC64) && defined(_ARCH_PWR7)
-    /* From Power ISA 2.06, programming note for divdeu.  */
-    uint64_t q1, q2, Q, r1, r2, R;
-    asm("divdeu %0,%2,%4; divdu %1,%3,%4"
-        : "=&r"(q1), "=r"(q2)
-        : "r"(n1), "r"(n0), "r"(d));
-    r1 = -(q1 * d);         /* low part of (n1<<64) - (q1 * d) */
-    r2 = n0 - (q2 * d);
-    Q = q1 + q2;
-    R = r1 + r2;
-    if (R >= d || R < r2) { /* overflow implies R > d */
-        Q += 1;
-        R -= d;
-    }
-    *r = R;
-    return Q;
-#else
-    uint64_t d0, d1, q0, q1, r1, r0, m;
-
-    d0 = (uint32_t)d;
-    d1 = d >> 32;
-
-    r1 = n1 % d1;
-    q1 = n1 / d1;
-    m = q1 * d0;
-    r1 = (r1 << 32) | (n0 >> 32);
-    if (r1 < m) {
-        q1 -= 1;
-        r1 += d;
-        if (r1 >= d) {
-            if (r1 < m) {
-                q1 -= 1;
-                r1 += d;
-            }
-        }
-    }
-    r1 -= m;
-
-    r0 = r1 % d1;
-    q0 = r1 / d1;
-    m = q0 * d0;
-    r0 = (r0 << 32) | (uint32_t)n0;
-    if (r0 < m) {
-        q0 -= 1;
-        r0 += d;
-        if (r0 >= d) {
-            if (r0 < m) {
-                q0 -= 1;
-                r0 += d;
-            }
-        }
-    }
-    r0 -= m;
-
-    *r = r0;
-    return (q1 << 32) | q0;
-#endif
-}
-
 /*----------------------------------------------------------------------------
 | Returns an approximation to the square root of the 32-bit significand given
 | by `a'.  Considered as an integer, `a' must be at least 2^31.  If bit 0 of
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index e82e6239af..08a17e16e5 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -23,6 +23,10 @@
  * THE SOFTWARE.
  */
 
+/* Portions of this work are licensed under the terms of the GNU GPL,
+ * version 2 or later. See the COPYING file in the top-level directory.
+ */
+
 #ifndef HOST_UTILS_H
 #define HOST_UTILS_H
 
@@ -726,4 +730,81 @@ void urshift(uint64_t *plow, uint64_t *phigh, int32_t shift);
  */
 void ulshift(uint64_t *plow, uint64_t *phigh, int32_t shift, bool *overflow);
 
+/* From the GNU Multi Precision Library - longlong.h __udiv_qrnnd
+ * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
+ *
+ * Licensed under the GPLv2/LGPLv3
+ */
+static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
+                                  uint64_t n0, uint64_t d)
+{
+#if defined(__x86_64__)
+    uint64_t q;
+    asm("divq %4" : "=a"(q), "=d"(*r) : "0"(n0), "1"(n1), "rm"(d));
+    return q;
+#elif defined(__s390x__) && !defined(__clang__)
+    /* Need to use a TImode type to get an even register pair for DLGR.  */
+    unsigned __int128 n = (unsigned __int128)n1 << 64 | n0;
+    asm("dlgr %0, %1" : "+r"(n) : "r"(d));
+    *r = n >> 64;
+    return n;
+#elif defined(_ARCH_PPC64) && defined(_ARCH_PWR7)
+    /* From Power ISA 2.06, programming note for divdeu.  */
+    uint64_t q1, q2, Q, r1, r2, R;
+    asm("divdeu %0,%2,%4; divdu %1,%3,%4"
+        : "=&r"(q1), "=r"(q2)
+        : "r"(n1), "r"(n0), "r"(d));
+    r1 = -(q1 * d);         /* low part of (n1<<64) - (q1 * d) */
+    r2 = n0 - (q2 * d);
+    Q = q1 + q2;
+    R = r1 + r2;
+    if (R >= d || R < r2) { /* overflow implies R > d */
+        Q += 1;
+        R -= d;
+    }
+    *r = R;
+    return Q;
+#else
+    uint64_t d0, d1, q0, q1, r1, r0, m;
+
+    d0 = (uint32_t)d;
+    d1 = d >> 32;
+
+    r1 = n1 % d1;
+    q1 = n1 / d1;
+    m = q1 * d0;
+    r1 = (r1 << 32) | (n0 >> 32);
+    if (r1 < m) {
+        q1 -= 1;
+        r1 += d;
+        if (r1 >= d) {
+            if (r1 < m) {
+                q1 -= 1;
+                r1 += d;
+            }
+        }
+    }
+    r1 -= m;
+
+    r0 = r1 % d1;
+    q0 = r1 / d1;
+    m = q0 * d0;
+    r0 = (r0 << 32) | (uint32_t)n0;
+    if (r0 < m) {
+        q0 -= 1;
+        r0 += d;
+        if (r0 >= d) {
+            if (r0 < m) {
+                q0 -= 1;
+                r0 += d;
+            }
+        }
+    }
+    r0 -= m;
+
+    *r = r0;
+    return (q1 << 32) | q0;
+#endif
+}
+
 #endif
-- 
2.25.1


