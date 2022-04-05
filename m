Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C44F3D77
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 21:59:12 +0200 (CEST)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbpKY-0006id-UZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 15:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHg-0003pB-KK; Tue, 05 Apr 2022 15:56:12 -0400
Received: from [187.72.171.209] (port=24543 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHf-00049c-5H; Tue, 05 Apr 2022 15:56:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 5 Apr 2022 16:56:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 13E928000CB;
 Tue,  5 Apr 2022 16:56:01 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 1/9] qemu/int128: add int128_urshift
Date: Tue,  5 Apr 2022 16:55:50 -0300
Message-Id: <20220405195558.66144-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2022 19:56:01.0589 (UTC)
 FILETIME=[2D0E3E50:01D84927]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement an unsigned right shift for Int128 values and add the same
tests cases of int128_rshift in the unit test.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 include/qemu/int128.h    | 19 +++++++++++++++++++
 tests/unit/test-int128.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 2c4064256c..3af01f38cd 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -83,6 +83,11 @@ static inline Int128 int128_rshift(Int128 a, int n)
     return a >> n;
 }
 
+static inline Int128 int128_urshift(Int128 a, int n)
+{
+    return (__uint128_t)a >> n;
+}
+
 static inline Int128 int128_lshift(Int128 a, int n)
 {
     return a << n;
@@ -299,6 +304,20 @@ static inline Int128 int128_rshift(Int128 a, int n)
     }
 }
 
+static inline Int128 int128_urshift(Int128 a, int n)
+{
+    uint64_t h = a.hi;
+    if (!n) {
+        return a;
+    }
+    h = h >> (n & 63);
+    if (n >= 64) {
+        return int128_make64(h);
+    } else {
+        return int128_make128((a.lo >> n) | ((uint64_t)a.hi << (64 - n)), h);
+    }
+}
+
 static inline Int128 int128_lshift(Int128 a, int n)
 {
     uint64_t l = a.lo << (n & 63);
diff --git a/tests/unit/test-int128.c b/tests/unit/test-int128.c
index b86a3c76e6..ae0f552193 100644
--- a/tests/unit/test-int128.c
+++ b/tests/unit/test-int128.c
@@ -206,6 +206,37 @@ static void test_rshift(void)
     test_rshift_one(0xFFFE8000U,  0, 0xFFFFFFFFFFFFFFFEULL, 0x8000000000000000ULL);
 }
 
+static void __attribute__((__noinline__)) ATTRIBUTE_NOCLONE
+test_urshift_one(uint32_t x, int n, uint64_t h, uint64_t l)
+{
+    Int128 a = expand(x);
+    Int128 r = int128_urshift(a, n);
+    g_assert_cmpuint(int128_getlo(r), ==, l);
+    g_assert_cmpuint(int128_gethi(r), ==, h);
+}
+
+static void test_urshift(void)
+{
+    test_urshift_one(0x00010000U, 64, 0x0000000000000000ULL, 0x0000000000000001ULL);
+    test_urshift_one(0x80010000U, 64, 0x0000000000000000ULL, 0x8000000000000001ULL);
+    test_urshift_one(0x7FFE0000U, 64, 0x0000000000000000ULL, 0x7FFFFFFFFFFFFFFEULL);
+    test_urshift_one(0xFFFE0000U, 64, 0x0000000000000000ULL, 0xFFFFFFFFFFFFFFFEULL);
+    test_urshift_one(0x00010000U, 60, 0x0000000000000000ULL, 0x0000000000000010ULL);
+    test_urshift_one(0x80010000U, 60, 0x0000000000000008ULL, 0x0000000000000010ULL);
+    test_urshift_one(0x00018000U, 60, 0x0000000000000000ULL, 0x0000000000000018ULL);
+    test_urshift_one(0x80018000U, 60, 0x0000000000000008ULL, 0x0000000000000018ULL);
+    test_urshift_one(0x7FFE0000U, 60, 0x0000000000000007ULL, 0xFFFFFFFFFFFFFFE0ULL);
+    test_urshift_one(0xFFFE0000U, 60, 0x000000000000000FULL, 0xFFFFFFFFFFFFFFE0ULL);
+    test_urshift_one(0x7FFE8000U, 60, 0x0000000000000007ULL, 0xFFFFFFFFFFFFFFE8ULL);
+    test_urshift_one(0xFFFE8000U, 60, 0x000000000000000FULL, 0xFFFFFFFFFFFFFFE8ULL);
+    test_urshift_one(0x00018000U,  0, 0x0000000000000001ULL, 0x8000000000000000ULL);
+    test_urshift_one(0x80018000U,  0, 0x8000000000000001ULL, 0x8000000000000000ULL);
+    test_urshift_one(0x7FFE0000U,  0, 0x7FFFFFFFFFFFFFFEULL, 0x0000000000000000ULL);
+    test_urshift_one(0xFFFE0000U,  0, 0xFFFFFFFFFFFFFFFEULL, 0x0000000000000000ULL);
+    test_urshift_one(0x7FFE8000U,  0, 0x7FFFFFFFFFFFFFFEULL, 0x8000000000000000ULL);
+    test_urshift_one(0xFFFE8000U,  0, 0xFFFFFFFFFFFFFFFEULL, 0x8000000000000000ULL);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -219,5 +250,6 @@ int main(int argc, char **argv)
     g_test_add_func("/int128/int128_ge", test_ge);
     g_test_add_func("/int128/int128_gt", test_gt);
     g_test_add_func("/int128/int128_rshift", test_rshift);
+    g_test_add_func("/int128/int128_urshift", test_urshift);
     return g_test_run();
 }
-- 
2.31.1


