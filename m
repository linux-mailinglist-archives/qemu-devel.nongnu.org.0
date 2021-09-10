Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CED406AE8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:44:00 +0200 (CEST)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOewp-0002tz-Fj
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegX-0002fi-1c; Fri, 10 Sep 2021 07:27:09 -0400
Received: from [201.28.113.2] (port=13634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOegV-0001ua-1G; Fri, 10 Sep 2021 07:27:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B09BD8014C3;
 Fri, 10 Sep 2021 08:26:51 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 08/22] host-utils: add unit tests for divu128/divs128
Date: Fri, 10 Sep 2021 08:26:10 -0300
Message-Id: <20210910112624.72748-9-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:51.0916 (UTC)
 FILETIME=[C085D4C0:01D7A636]
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

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 tests/unit/meson.build   |   1 +
 tests/unit/test-div128.c | 197 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 tests/unit/test-div128.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 5736d285b2..96e3b23162 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -23,6 +23,7 @@ tests = {
   # all code tested by test-x86-cpuid is inside topology.h
   'test-x86-cpuid': [],
   'test-cutils': [],
+  'test-div128': [],
   'test-shift128': [],
   'test-mul64': [],
   # all code tested by test-int128 is inside int128.h
diff --git a/tests/unit/test-div128.c b/tests/unit/test-div128.c
new file mode 100644
index 0000000000..1afe7f0748
--- /dev/null
+++ b/tests/unit/test-div128.c
@@ -0,0 +1,197 @@
+/*
+ * Test 128-bit division functions
+ *
+ * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+
+typedef struct {
+    uint64_t high;
+    uint64_t low;
+    uint64_t rhigh;
+    uint64_t rlow;
+    uint64_t divisor;
+    uint64_t remainder;
+} test_data_unsigned;
+
+typedef struct {
+    int64_t high;
+    uint64_t low;
+    int64_t rhigh;
+    uint64_t rlow;
+    int64_t divisor;
+    int64_t remainder;
+} test_data_signed;
+
+static const test_data_unsigned test_table_unsigned[] = {
+    /* Dividend fits in 64 bits */
+    { 0x0000000000000000ULL, 0x0000000000000000ULL,
+      0x0000000000000000ULL, 0x0000000000000000ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x0000000000000000ULL, 0x0000000000000003ULL,
+      0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x0000000000000002ULL, 0x0000000000000001ULL},
+    { 0x0000000000000000ULL, 0x8000000000000000ULL,
+      0x0000000000000000ULL, 0x8000000000000000ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x0000000000000000ULL, 0xa000000000000000ULL,
+      0x0000000000000000ULL, 0x0000000000000002ULL,
+      0x4000000000000000ULL, 0x2000000000000000ULL},
+    { 0x0000000000000000ULL, 0x8000000000000000ULL,
+      0x0000000000000000ULL, 0x0000000000000001ULL,
+      0x8000000000000000ULL, 0x0000000000000000ULL},
+
+    /* Dividend > 64 bits, with MSB 0 */
+    { 0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x0000000000000001ULL, 0x000000000000000dULL,
+      0x123456789abcdefeULL, 0x03456789abcdf03bULL},
+    { 0x123456789abcdefeULL, 0xefedcba987654321ULL,
+      0x0123456789abcdefULL, 0xeefedcba98765432ULL,
+      0x0000000000000010ULL, 0x0000000000000001ULL},
+
+    /* Dividend > 64 bits, with MSB 1 */
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL,
+      0xfeeddccbbaa99887ULL, 0x766554433221100fULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0feeddccbbaa9988ULL, 0x7766554433221100ULL,
+      0x0000000000000010ULL, 0x000000000000000fULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x000000000000000eULL, 0x00f0f0f0f0f0f35aULL,
+      0x123456789abcdefeULL, 0x0f8922bc55ef90c3ULL},
+
+    /**
+     * Divisor == 64 bits, with MSB 1
+     * and high 64 bits of dividend >= divisor
+     * (for testing normalization)
+     */
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0x0000000000000000ULL,
+      0xfeeddccbbaa99887ULL, 0x766554433221100fULL},
+    { 0xfeeddccbbaa99887ULL, 0x766554433221100fULL,
+      0x0000000000000001ULL, 0xfddbb9977553310aULL,
+      0x8000000000000001ULL, 0x78899aabbccddf05ULL},
+
+    /* Dividend > 64 bits, divisor almost as big */
+    { 0x0000000000000001ULL, 0x23456789abcdef01ULL,
+      0x0000000000000000ULL, 0x000000000000000fULL,
+      0x123456789abcdefeULL, 0x123456789abcde1fULL},
+};
+
+static const test_data_signed test_table_signed[] = {
+    /* Positive dividend, positive/negative divisors */
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000001LL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x00000000005e30a7ULL,
+      0x0000000000000002LL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffffa1cf59ULL,
+      0xfffffffffffffffeLL, 0x0000000000000000LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x0000000000178c29ULL,
+      0x0000000000000008LL, 0x0000000000000006LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffffe873d7ULL,
+      0xfffffffffffffff8LL, 0x0000000000000006LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0x0000000000000000LL, 0x000000000000550dULL,
+      0x0000000000000237LL, 0x0000000000000183LL},
+    { 0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0xffffffffffffaaf3ULL,
+      0xfffffffffffffdc9LL, 0x0000000000000183LL},
+
+    /* Negative dividend, positive/negative divisors */
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000001LL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x0000000000bc614eULL,
+      0xffffffffffffffffLL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffffa1cf59ULL,
+      0x0000000000000002LL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x00000000005e30a7ULL,
+      0xfffffffffffffffeLL, 0x0000000000000000LL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffffe873d7ULL,
+      0x0000000000000008LL, 0xfffffffffffffffaLL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x0000000000178c29ULL,
+      0xfffffffffffffff8LL, 0xfffffffffffffffaLL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0xffffffffffffffffLL, 0xffffffffffffaaf3ULL,
+      0x0000000000000237LL, 0xfffffffffffffe7dLL},
+    { 0xffffffffffffffffLL, 0xffffffffff439eb2ULL,
+      0x0000000000000000LL, 0x000000000000550dULL,
+      0xfffffffffffffdc9LL, 0xfffffffffffffe7dLL},
+};
+
+static void test_divu128(void)
+{
+    int i;
+    uint64_t rem;
+    test_data_unsigned tmp;
+
+    for (i = 0; i < ARRAY_SIZE(test_table_unsigned); ++i) {
+        tmp = test_table_unsigned[i];
+
+        divu128(&tmp.low, &tmp.high, &rem, tmp.divisor);
+        g_assert_cmpuint(tmp.low, ==, tmp.rlow);
+        g_assert_cmpuint(tmp.high, ==, tmp.rhigh);
+        g_assert_cmpuint(rem, ==, tmp.remainder);
+    }
+}
+
+static void test_divs128(void)
+{
+    int i;
+    int64_t rem;
+    test_data_signed tmp;
+
+    for (i = 0; i < ARRAY_SIZE(test_table_signed); ++i) {
+        tmp = test_table_signed[i];
+
+        divs128(&tmp.low, &tmp.high, &rem, tmp.divisor);
+        g_assert_cmpuint(tmp.low, ==, tmp.rlow);
+        g_assert_cmpuint(tmp.high, ==, tmp.rhigh);
+        g_assert_cmpuint(rem, ==, tmp.remainder);
+    }
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/host-utils/test_divu128", test_divu128);
+    g_test_add_func("/host-utils/test_divs128", test_divs128);
+    return g_test_run();
+}
-- 
2.25.1


