Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB74CC3B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:28:29 +0100 (CET)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpFc-00072e-SD
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpA7-0007AU-Ls; Thu, 03 Mar 2022 12:22:47 -0500
Received: from [187.72.171.209] (port=35509 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpA5-0004O4-M0; Thu, 03 Mar 2022 12:22:47 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 3 Mar 2022 14:22:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2C65C800502;
 Thu,  3 Mar 2022 14:22:23 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 3/5] tests/tcg/ppc64le: drop __int128 usage in bcdsub
Date: Thu,  3 Mar 2022 14:20:39 -0300
Message-Id: <20220303172041.1915037-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Mar 2022 17:22:23.0647 (UTC)
 FILETIME=[3F1A2AF0:01D82F23]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: thuth@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Using __int128 with inline asm constraints like "v" generates incorrect
code when compiling with LLVM/Clang (e.g., only one doubleword of the
VSR is loaded). Instead, use a GPR pair to pass the 128-bits value and
load the VSR with mtvsrd/xxmrghd.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
I'm avoiding newer insns like mtvsrdd/mfvsrld to move values between VSR
and GPR so we can run this test in a POWER8 machine.

v2:
 - No vector types to avoid endian-dependent code.
---
 tests/tcg/ppc64le/bcdsub.c | 117 +++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 64 deletions(-)

diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
index 8c188cae6d..c9ca5357cb 100644
--- a/tests/tcg/ppc64le/bcdsub.c
+++ b/tests/tcg/ppc64le/bcdsub.c
@@ -1,6 +1,7 @@
 #include <assert.h>
 #include <unistd.h>
 #include <signal.h>
+#include <stdint.h>
 
 #define CRF_LT  (1 << 3)
 #define CRF_GT  (1 << 2)
@@ -8,21 +9,32 @@
 #define CRF_SO  (1 << 0)
 #define UNDEF   0
 
-#define BCDSUB(vra, vrb, ps)                    \
-    asm ("bcdsub. %1,%2,%3,%4;"                 \
-         "mfocrf %0,0b10;"                      \
-         : "=r" (cr), "=v" (vrt)                \
-         : "v" (vra), "v" (vrb), "i" (ps)       \
-         : );
+#define BCDSUB(AH, AL, BH, BL, PS)                          \
+    asm ("mtvsrd 32, %3\n\t"                                \
+         "mtvsrd 33, %4\n\t"                                \
+         "xxmrghd 32, 32, 33\n\t"                           \
+         "mtvsrd 33, %5\n\t"                                \
+         "mtvsrd 34, %6\n\t"                                \
+         "xxmrghd 33, 33, 34\n\t"                           \
+         "bcdsub. 0, 0, 1, %7\n\t"                          \
+         "mfocrf %0, 0b10\n\t"                              \
+         "mfvsrd %1, 32\n\t"                                \
+         "xxswapd 32, 32\n\t"                               \
+         "mfvsrd %2, 32\n\t"                                \
+         : "=r" (cr), "=r" (th), "=r" (tl)                  \
+         : "r" (AH), "r" (AL), "r" (BH), "r" (BL), "i" (PS) \
+         : "v0", "v1", "v2");
 
-#define TEST(vra, vrb, ps, exp_res, exp_cr6)    \
+#define TEST(AH, AL, BH, BL, PS, TH, TL, CR6)   \
     do {                                        \
-        __int128 vrt = 0;                       \
         int cr = 0;                             \
-        BCDSUB(vra, vrb, ps);                   \
-        if (exp_res)                            \
-            assert(vrt == exp_res);             \
-        assert((cr >> 4) == exp_cr6);           \
+        uint64_t th, tl;                        \
+        BCDSUB(AH, AL, BH, BL, PS);             \
+        if (TH || TL) {                         \
+            assert(tl == TL);                   \
+            assert(th == TH);                   \
+        }                                       \
+        assert((cr >> 4) == CR6);               \
     } while (0)
 
 
@@ -33,13 +45,13 @@
  */
 void test_bcdsub_eq(void)
 {
-    __int128 a, b;
-
     /* maximum positive BCD value */
-    a = b = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
-
-    TEST(a, b, 0, 0xc, CRF_EQ);
-    TEST(a, b, 1, 0xf, CRF_EQ);
+    TEST(0x9999999999999999, 0x999999999999999c,
+         0x9999999999999999, 0x999999999999999c,
+         0, 0x0, 0xc, CRF_EQ);
+    TEST(0x9999999999999999, 0x999999999999999c,
+         0x9999999999999999, 0x999999999999999c,
+         1, 0x0, 0xf, CRF_EQ);
 }
 
 /*
@@ -49,21 +61,16 @@ void test_bcdsub_eq(void)
  */
 void test_bcdsub_gt(void)
 {
-    __int128 a, b, c;
+    /* maximum positive and negative one BCD values */
+    TEST(0x9999999999999999, 0x999999999999999c, 0x0, 0x1d, 0,
+         0x0, 0xc, (CRF_GT | CRF_SO));
+    TEST(0x9999999999999999, 0x999999999999999c, 0x0, 0x1d, 1,
+         0x0, 0xf, (CRF_GT | CRF_SO));
 
-    /* maximum positive BCD value */
-    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999c);
-
-    /* negative one BCD value */
-    b = (__int128) 0x1d;
-
-    TEST(a, b, 0, 0xc, (CRF_GT | CRF_SO));
-    TEST(a, b, 1, 0xf, (CRF_GT | CRF_SO));
-
-    c = (((__int128) 0x9999999999999999) << 64 | 0x999999999999998c);
-
-    TEST(c, b, 0, a, CRF_GT);
-    TEST(c, b, 1, (a | 0x3), CRF_GT);
+    TEST(0x9999999999999999, 0x999999999999998c, 0x0, 0x1d, 0,
+         0x9999999999999999, 0x999999999999999c, CRF_GT);
+    TEST(0x9999999999999999, 0x999999999999998c, 0x0, 0x1d, 1,
+         0x9999999999999999, 0x999999999999999f, CRF_GT);
 }
 
 /*
@@ -73,45 +80,27 @@ void test_bcdsub_gt(void)
  */
 void test_bcdsub_lt(void)
 {
-    __int128 a, b;
+    /* positive zero and positive one BCD values */
+    TEST(0x0, 0xc, 0x0, 0x1c, 0, 0x0, 0x1d, CRF_LT);
+    TEST(0x0, 0xc, 0x0, 0x1c, 1, 0x0, 0x1d, CRF_LT);
 
-    /* positive zero BCD value */
-    a = (__int128) 0xc;
-
-    /* positive one BCD value */
-    b = (__int128) 0x1c;
-
-    TEST(a, b, 0, 0x1d, CRF_LT);
-    TEST(a, b, 1, 0x1d, CRF_LT);
-
-    /* maximum negative BCD value */
-    a = (((__int128) 0x9999999999999999) << 64 | 0x999999999999999d);
-
-    /* positive one BCD value */
-    b = (__int128) 0x1c;
-
-    TEST(a, b, 0, 0xd, (CRF_LT | CRF_SO));
-    TEST(a, b, 1, 0xd, (CRF_LT | CRF_SO));
+    /* maximum negative and positive one BCD values */
+    TEST(0x9999999999999999, 0x999999999999999d, 0x0, 0x1c, 0,
+         0x0, 0xd, (CRF_LT | CRF_SO));
+    TEST(0x9999999999999999, 0x999999999999999d, 0x0, 0x1c, 1,
+         0x0, 0xd, (CRF_LT | CRF_SO));
 }
 
 void test_bcdsub_invalid(void)
 {
-    __int128 a, b;
+    TEST(0x0, 0x1c, 0x0, 0xf00, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(0x0, 0x1c, 0x0, 0xf00, 1, UNDEF, UNDEF, CRF_SO);
 
-    /* positive one BCD value */
-    a = (__int128) 0x1c;
-    b = 0xf00;
+    TEST(0x0, 0xf00, 0x0, 0x1c, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(0x0, 0xf00, 0x0, 0x1c, 1, UNDEF, UNDEF, CRF_SO);
 
-    TEST(a, b, 0, UNDEF, CRF_SO);
-    TEST(a, b, 1, UNDEF, CRF_SO);
-
-    TEST(b, a, 0, UNDEF, CRF_SO);
-    TEST(b, a, 1, UNDEF, CRF_SO);
-
-    a = 0xbad;
-
-    TEST(a, b, 0, UNDEF, CRF_SO);
-    TEST(a, b, 1, UNDEF, CRF_SO);
+    TEST(0x0, 0xbad, 0x0, 0xf00, 0, UNDEF, UNDEF, CRF_SO);
+    TEST(0x0, 0xbad, 0x0, 0xf00, 1, UNDEF, UNDEF, CRF_SO);
 }
 
 int main(void)
-- 
2.25.1


