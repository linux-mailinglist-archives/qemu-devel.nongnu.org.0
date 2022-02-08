Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7414AE2A9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:52:57 +0100 (CET)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXTs-0004OW-1o
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHXB6-0008VA-9e; Tue, 08 Feb 2022 15:33:32 -0500
Received: from [187.72.171.209] (port=64195 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHXB4-0001mu-2u; Tue, 08 Feb 2022 15:33:31 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 8 Feb 2022 17:31:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C71AC801D1B;
 Tue,  8 Feb 2022 17:31:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 3/3] tests/tcg/ppc64le: Use vector types instead of
 __int128
Date: Tue,  8 Feb 2022 17:31:45 -0300
Message-Id: <20220208203145.3844662-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Feb 2022 20:31:58.0180 (UTC)
 FILETIME=[EB59EA40:01D81D2A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

LLVM/Clang doesn't like inline asm with __int128, use a vector type
instead.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
Alternatively, we could pass VSR values in GPR pairs, as we did in
tests/tcg/ppc64le/non_signalling_xscv.c
---
 tests/tcg/ppc64le/bcdsub.c | 92 +++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
index 8c188cae6d..17403daf22 100644
--- a/tests/tcg/ppc64le/bcdsub.c
+++ b/tests/tcg/ppc64le/bcdsub.c
@@ -1,6 +1,7 @@
 #include <assert.h>
 #include <unistd.h>
 #include <signal.h>
+#include <altivec.h>
 
 #define CRF_LT  (1 << 3)
 #define CRF_GT  (1 << 2)
@@ -8,6 +9,16 @@
 #define CRF_SO  (1 << 0)
 #define UNDEF   0
 
+#ifdef __LITTLE_ENDIAN__
+#define HIGH(T) (T)[1]
+#define LOW(T) (T)[0]
+#define U128(H, L) (vector unsigned long long) {L, H}
+#else
+#define HIGH(T) (T)[0]
+#define LOW(T) (T)[1]
+#define U128(H, L) (vector unsigned long long) {H, L}
+#endif
+
 #define BCDSUB(vra, vrb, ps)                    \
     asm ("bcdsub. %1,%2,%3,%4;"                 \
          "mfocrf %0,0b10;"                      \
@@ -15,17 +26,18 @@
          : "v" (vra), "v" (vrb), "i" (ps)       \
          : );
 
-#define TEST(vra, vrb, ps, exp_res, exp_cr6)    \
-    do {                                        \
-        __int128 vrt = 0;                       \
-        int cr = 0;                             \
-        BCDSUB(vra, vrb, ps);                   \
-        if (exp_res)                            \
-            assert(vrt == exp_res);             \
-        assert((cr >> 4) == exp_cr6);           \
+#define TEST(vra, vrb, ps, exp_res_h, exp_res_l, exp_cr6)   \
+    do {                                                    \
+        vector unsigned long long vrt = U128(0, 0);         \
+        int cr = 0;                                         \
+        BCDSUB(vra, vrb, ps);                               \
+        if (exp_res_h || exp_res_l) {                       \
+            assert(HIGH(vrt) == exp_res_h);                 \
+            assert(LOW(vrt) == exp_res_l);                  \
+        }                                                   \
+        assert((cr >> 4) == exp_cr6);                       \
     } while (0)
 
-
 /*
  * Unbounded result is equal to zero:
  *   sign = (PS) ? 0b1111 : 0b1100
@@ -33,13 +45,13 @@
  */
 void test_bcdsub_eq(void)
 {
-    __int128 a, b;
+    vector unsigned long long a, b;
 
     /* maximum positive BCD value */
-    a = b = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
+    a = b = U128(0x9999999999999999, 0x999999999999999c);
 
-    TEST(a, b, 0, 0xc, CRF_EQ);
-    TEST(a, b, 1, 0xf, CRF_EQ);
+    TEST(a, b, 0, 0x0, 0xc, CRF_EQ);
+    TEST(a, b, 1, 0x0, 0xf, CRF_EQ);
 }
 
 /*
@@ -49,21 +61,21 @@ void test_bcdsub_eq(void)
  */
 void test_bcdsub_gt(void)
 {
-    __int128 a, b, c;
+    vector unsigned long long a, b, c;
 
     /* maximum positive BCD value */
-    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
+    a = U128(0x9999999999999999, 0x999999999999999c);
 
     /* negative one BCD value */
-    b = (__int128) 0x1d;
+    b = U128(0x0, 0x1d);
 
-    TEST(a, b, 0, 0xc, (CRF_GT | CRF_SO));
-    TEST(a, b, 1, 0xf, (CRF_GT | CRF_SO));
+    TEST(a, b, 0, 0x0, 0xc, (CRF_GT | CRF_SO));
+    TEST(a, b, 1, 0x0, 0xf, (CRF_GT | CRF_SO));
 
-    c = (((__int128) 0x9999999999999999) << 64 | 0x999999999999998c);
+    c = U128(0x9999999999999999, 0x999999999999998c);
 
-    TEST(c, b, 0, a, CRF_GT);
-    TEST(c, b, 1, (a | 0x3), CRF_GT);
+    TEST(c, b, 0, HIGH(a), LOW(a), CRF_GT);
+    TEST(c, b, 1, HIGH(a), (LOW(a) | 0x3), CRF_GT);
 }
 
 /*
@@ -73,45 +85,45 @@ void test_bcdsub_gt(void)
  */
 void test_bcdsub_lt(void)
 {
-    __int128 a, b;
+    vector unsigned long long a, b;
 
     /* positive zero BCD value */
-    a = (__int128) 0xc;
+    a = U128(0x0, 0xc);
 
     /* positive one BCD value */
-    b = (__int128) 0x1c;
+    b = U128(0x0, 0x1c);
 
-    TEST(a, b, 0, 0x1d, CRF_LT);
-    TEST(a, b, 1, 0x1d, CRF_LT);
+    TEST(a, b, 0, 0x0, 0x1d, CRF_LT);
+    TEST(a, b, 1, 0x0, 0x1d, CRF_LT);
 
     /* maximum negative BCD value */
-    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999d);
+    a = U128(0x9999999999999999, 0x999999999999999d);
 
     /* positive one BCD value */
-    b = (__int128) 0x1c;
+    b = U128(0x0, 0x1c);
 
-    TEST(a, b, 0, 0xd, (CRF_LT | CRF_SO));
-    TEST(a, b, 1, 0xd, (CRF_LT | CRF_SO));
+    TEST(a, b, 0, 0x0, 0xd, (CRF_LT | CRF_SO));
+    TEST(a, b, 1, 0x0, 0xd, (CRF_LT | CRF_SO));
 }
 
 void test_bcdsub_invalid(void)
 {
-    __int128 a, b;
+    vector unsigned long long a, b;
 
     /* positive one BCD value */
-    a = (__int128) 0x1c;
-    b = 0xf00;
+    a = U128(0x0, 0x1c);
+    b = U128(0x0, 0xf00);
 
-    TEST(a, b, 0, UNDEF, CRF_SO);
-    TEST(a, b, 1, UNDEF, CRF_SO);
+    TEST(a, b, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(a, b, 1, UNDEF, UNDEF, CRF_SO);
 
-    TEST(b, a, 0, UNDEF, CRF_SO);
-    TEST(b, a, 1, UNDEF, CRF_SO);
+    TEST(b, a, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(b, a, 1, UNDEF, UNDEF, CRF_SO);
 
-    a = 0xbad;
+    a = U128(0x0, 0xbad);
 
-    TEST(a, b, 0, UNDEF, CRF_SO);
-    TEST(a, b, 1, UNDEF, CRF_SO);
+    TEST(a, b, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(a, b, 1, UNDEF, UNDEF, CRF_SO);
 }
 
 int main(void)
-- 
2.25.1


