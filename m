Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBCB5A2584
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:10:07 +0200 (CEST)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWHu-0001U2-ON
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oRW5l-0004Xx-VY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:57:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:31255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oRW5j-0006aB-8a
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661507851; x=1693043851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMjOAVYERuwlVQR9QbJlfIWxE4OCVQhCM8Jpv9gulNQ=;
 b=IESPBE+WIuPJekGXZqKUw4d/1O6E6lFTtr6AOfVHL7kxEE0wyqRo0snh
 Nik+1T+GLnGHeck2s8nCwOt4cBtTHsWYvV7QmINWs4PpoYC3+7yk9LMcL
 UEtcwYbcscNEuN2/4w7vl8besqjq4BIOASpOq0EiAscvJo0twyX5F27C6
 Mmcuumcr/d248A+y3FJsGV5HR5HZySZu3Ot6gfdd87i9pSwTfbr7qGcUN
 wLRgU68yKzN2SqJyHXAfInyB0P0nhE38nBXDOe61+pIDkjDK6oWfDRYLs
 3LNri1TEzGrkw7XjWBUOTL8lHgRN8yVHTZZV3Ubxy9LyksYRuiKGudEIz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295250443"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="295250443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="639999936"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga008.jf.intel.com with ESMTP; 26 Aug 2022 02:57:27 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v6 2/2] Unit test code and benchmark code
Date: Fri, 26 Aug 2022 17:57:19 +0800
Message-Id: <20220826095719.2887535-3-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826095719.2887535-1-ling1.xu@intel.com>
References: <20220826095719.2887535-1-ling1.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=ling1.xu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unit test code is in test-xbzrle.c, and benchmark code is in xbzrle-bench.c
for performance benchmarking.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
---
 tests/bench/meson.build    |   4 +
 tests/bench/xbzrle-bench.c | 465 +++++++++++++++++++++++++++++++++++++
 tests/unit/test-xbzrle.c   |  39 +++-
 3 files changed, 503 insertions(+), 5 deletions(-)
 create mode 100644 tests/bench/xbzrle-bench.c

diff --git a/tests/bench/meson.build b/tests/bench/meson.build
index 279a8fcc33..daefead58d 100644
--- a/tests/bench/meson.build
+++ b/tests/bench/meson.build
@@ -3,6 +3,10 @@ qht_bench = executable('qht-bench',
                        sources: 'qht-bench.c',
                        dependencies: [qemuutil])
 
+xbzrle_bench = executable('xbzrle-bench',
+                       sources: 'xbzrle-bench.c',
+                       dependencies: [qemuutil,migration])
+
 executable('atomic_add-bench',
            sources: files('atomic_add-bench.c'),
            dependencies: [qemuutil],
diff --git a/tests/bench/xbzrle-bench.c b/tests/bench/xbzrle-bench.c
new file mode 100644
index 0000000000..d71397e6f4
--- /dev/null
+++ b/tests/bench/xbzrle-bench.c
@@ -0,0 +1,465 @@
+/*
+ * Xor Based Zero Run Length Encoding unit tests.
+ *
+ * Copyright 2013 Red Hat, Inc. and/or its affiliates
+ *
+ * Authors:
+ *  Orit Wasserman  <owasserm@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "../migration/xbzrle.h"
+
+#define XBZRLE_PAGE_SIZE 4096
+
+#if defined(CONFIG_AVX512BW_OPT)
+static bool is_cpu_support_avx512bw;
+#include "qemu/cpuid.h"
+static void __attribute__((constructor)) init_cpu_flag(void)
+{
+    unsigned max = __get_cpuid_max(0, NULL);
+    int a, b, c, d;
+    is_cpu_support_avx512bw = false;
+    if (max >= 1) {
+        __cpuid(1, a, b, c, d);
+         /* We must check that AVX is not just available, but usable.  */
+        if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >= 7) {
+            int bv;
+            __asm("xgetbv" : "=a"(bv), "=d"(d) : "c"(0));
+            __cpuid_count(7, 0, a, b, c, d);
+           /* 0xe6:
+            *  XCR0[7:5] = 111b (OPMASK state, upper 256-bit of ZMM0-ZMM15
+            *                    and ZMM16-ZMM31 state are enabled by OS)
+            *  XCR0[2:1] = 11b (XMM state and YMM state are enabled by OS)
+            */
+            if ((bv & 0xe6) == 0xe6 && (b & bit_AVX512BW)) {
+                is_cpu_support_avx512bw = true;
+            }
+        }
+    }
+    return ;
+}
+#endif
+
+struct ResTime {
+    float t_raw;
+    float t_512;
+};
+
+static void encode_decode_zero(struct ResTime *res)
+{
+    uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0;
+    int dlen = 0, dlen512 = 0;
+    int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
+
+    for (i = diff_len; i > 0; i--) {
+        buffer[1000 + i] = i;
+        buffer512[1000 + i] = i;
+    }
+
+    buffer[1000 + diff_len + 3] = 103;
+    buffer[1000 + diff_len + 5] = 105;
+
+    buffer512[1000 + diff_len + 3] = 103;
+    buffer512[1000 + diff_len + 5] = 105;
+
+    /* encode zero page */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
+    dlen = xbzrle_encode_buffer(buffer, buffer, XBZRLE_PAGE_SIZE, compressed,
+                       XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
+    g_assert(dlen == 0);
+
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_avx512(buffer512, buffer512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(dlen512 == 0);
+
+    res->t_raw = time_val;
+    res->t_512 = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(buffer512);
+    g_free(compressed512);
+
+}
+
+static void test_encode_decode_zero_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    struct ResTime res;
+    for (i = 0; i < 10000; i++) {
+        encode_decode_zero(&res);
+        time_raw += res.t_raw;
+        time_512 += res.t_512;
+    }
+    printf("Zero test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static void encode_decode_unchanged(struct ResTime *res)
+{
+    uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0;
+    int dlen = 0, dlen512 = 0;
+    int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
+
+    for (i = diff_len; i > 0; i--) {
+        test[1000 + i] = i + 4;
+        test512[1000 + i] = i + 4;
+    }
+
+    test[1000 + diff_len + 3] = 107;
+    test[1000 + diff_len + 5] = 109;
+
+    test512[1000 + diff_len + 3] = 107;
+    test512[1000 + diff_len + 5] = 109;
+
+    /* test unchanged buffer */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
+    dlen = xbzrle_encode_buffer(test, test, XBZRLE_PAGE_SIZE, compressed,
+                                XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
+    g_assert(dlen == 0);
+
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_avx512(test512, test512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(dlen512 == 0);
+
+    res->t_raw = time_val;
+    res->t_512 = time_val512;
+
+    g_free(test);
+    g_free(compressed);
+    g_free(test512);
+    g_free(compressed512);
+
+}
+
+static void test_encode_decode_unchanged_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    struct ResTime res;
+    for (i = 0; i < 10000; i++) {
+        encode_decode_unchanged(&res);
+        time_raw += res.t_raw;
+        time_512 += res.t_512;
+    }
+    printf("Unchanged test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static void encode_decode_1_byte(struct ResTime *res)
+{
+    uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed = g_malloc(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc(XBZRLE_PAGE_SIZE);
+    int dlen = 0, rc = 0, dlen512 = 0, rc512 = 0;
+    uint8_t buf[2];
+    uint8_t buf512[2];
+
+    test[XBZRLE_PAGE_SIZE - 1] = 1;
+    test512[XBZRLE_PAGE_SIZE - 1] = 1;
+
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
+    dlen = xbzrle_encode_buffer(buffer, test, XBZRLE_PAGE_SIZE, compressed,
+                       XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
+    g_assert(dlen == (uleb128_encode_small(&buf[0], 4095) + 2));
+
+    rc = xbzrle_decode_buffer(compressed, dlen, buffer, XBZRLE_PAGE_SIZE);
+    g_assert(rc == XBZRLE_PAGE_SIZE);
+    g_assert(memcmp(test, buffer, XBZRLE_PAGE_SIZE) == 0);
+
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_avx512(buffer512, test512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(dlen512 == (uleb128_encode_small(&buf512[0], 4095) + 2));
+
+    rc512 = xbzrle_decode_buffer(compressed512, dlen512, buffer512,
+                                 XBZRLE_PAGE_SIZE);
+    g_assert(rc512 == XBZRLE_PAGE_SIZE);
+    g_assert(memcmp(test512, buffer512, XBZRLE_PAGE_SIZE) == 0);
+
+    res->t_raw = time_val;
+    res->t_512 = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+}
+
+static void test_encode_decode_1_byte_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    struct ResTime res;
+    for (i = 0; i < 10000; i++) {
+        encode_decode_1_byte(&res);
+        time_raw += res.t_raw;
+        time_512 += res.t_512;
+    }
+    printf("1 byte test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static void encode_decode_overflow(struct ResTime *res)
+{
+    uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0, rc = 0, rc512 = 0;
+
+    for (i = 0; i < XBZRLE_PAGE_SIZE / 2 - 1; i++) {
+        test[i * 2] = 1;
+        test512[i * 2] = 1;
+    }
+
+    /* encode overflow */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
+    rc = xbzrle_encode_buffer(buffer, test, XBZRLE_PAGE_SIZE, compressed,
+                              XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
+    g_assert(rc == -1);
+
+    t_start512 = clock();
+    rc512 = xbzrle_encode_buffer_avx512(buffer512, test512, XBZRLE_PAGE_SIZE,
+                                     compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(rc512 == -1);
+
+    res->t_raw = time_val;
+    res->t_512 = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+}
+
+static void test_encode_decode_overflow_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    struct ResTime res;
+    for (i = 0; i < 10000; i++) {
+        encode_decode_overflow(&res);
+        time_raw += res.t_raw;
+        time_512 += res.t_512;
+    }
+    printf("Overflow test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static void encode_decode_range_avx512(struct ResTime *res)
+{
+    uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed = g_malloc(XBZRLE_PAGE_SIZE);
+    uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0, rc = 0, rc512 = 0;
+    int dlen = 0, dlen512 = 0;
+
+    int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
+
+    for (i = diff_len; i > 0; i--) {
+        buffer[1000 + i] = i;
+        test[1000 + i] = i + 4;
+        buffer512[1000 + i] = i;
+        test512[1000 + i] = i + 4;
+    }
+
+    buffer[1000 + diff_len + 3] = 103;
+    test[1000 + diff_len + 3] = 107;
+
+    buffer[1000 + diff_len + 5] = 105;
+    test[1000 + diff_len + 5] = 109;
+
+    buffer512[1000 + diff_len + 3] = 103;
+    test512[1000 + diff_len + 3] = 107;
+
+    buffer512[1000 + diff_len + 5] = 105;
+    test512[1000 + diff_len + 5] = 109;
+
+    /* test encode/decode */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
+    dlen = xbzrle_encode_buffer(test, buffer, XBZRLE_PAGE_SIZE, compressed,
+                                XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
+    rc = xbzrle_decode_buffer(compressed, dlen, test, XBZRLE_PAGE_SIZE);
+    g_assert(rc < XBZRLE_PAGE_SIZE);
+    g_assert(memcmp(test, buffer, XBZRLE_PAGE_SIZE) == 0);
+
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_avx512(test512, buffer512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    rc512 = xbzrle_decode_buffer(compressed512, dlen512, test512, XBZRLE_PAGE_SIZE);
+    g_assert(rc512 < XBZRLE_PAGE_SIZE);
+    g_assert(memcmp(test512, buffer512, XBZRLE_PAGE_SIZE) == 0);
+
+    res->t_raw = time_val;
+    res->t_512 = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+}
+
+static void test_encode_decode_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    struct ResTime res;
+    for (i = 0; i < 10000; i++) {
+        encode_decode_range_avx512(&res);
+        time_raw += res.t_raw;
+        time_512 += res.t_512;
+    }
+    printf("Encode decode test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static void encode_decode_random(struct ResTime *res)
+{
+    uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed = g_malloc(XBZRLE_PAGE_SIZE);
+    uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0, rc = 0, rc512 = 0;
+    int dlen = 0, dlen512 = 0;
+
+    int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1);
+    /* store the index of diff */
+    int dirty_index[diff_len];
+    for (int j = 0; j < diff_len; j++) {
+        dirty_index[j] = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1);
+    }
+    for (i = diff_len - 1; i >= 0; i--) {
+        buffer[dirty_index[i]] = i;
+        test[dirty_index[i]] = i + 4;
+        buffer512[dirty_index[i]] = i;
+        test512[dirty_index[i]] = i + 4;
+    }
+
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
+    dlen = xbzrle_encode_buffer(test, buffer, XBZRLE_PAGE_SIZE, compressed,
+                                XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
+    rc = xbzrle_decode_buffer(compressed, dlen, test, XBZRLE_PAGE_SIZE);
+    g_assert(rc < XBZRLE_PAGE_SIZE);
+
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_avx512(test512, buffer512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    rc512 = xbzrle_decode_buffer(compressed512, dlen512, test512, XBZRLE_PAGE_SIZE);
+    g_assert(rc512 < XBZRLE_PAGE_SIZE);
+
+    res->t_raw = time_val;
+    res->t_512 = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+}
+
+static void test_encode_decode_random_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    struct ResTime res;
+    for (i = 0; i < 10000; i++) {
+        encode_decode_random(&res);
+        time_raw += res.t_raw;
+        time_512 += res.t_512;
+    }
+    printf("Random test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    g_test_rand_int();
+    #if defined(CONFIG_AVX512BW_OPT)
+    if (likely(is_cpu_support_avx512bw)) {
+        g_test_add_func("/xbzrle/encode_decode_zero", test_encode_decode_zero_avx512);
+        g_test_add_func("/xbzrle/encode_decode_unchanged",
+                        test_encode_decode_unchanged_avx512);
+        g_test_add_func("/xbzrle/encode_decode_1_byte", test_encode_decode_1_byte_avx512);
+        g_test_add_func("/xbzrle/encode_decode_overflow",
+                        test_encode_decode_overflow_avx512);
+        g_test_add_func("/xbzrle/encode_decode", test_encode_decode_avx512);
+        g_test_add_func("/xbzrle/encode_decode_random", test_encode_decode_random_avx512);
+    }
+    #endif
+    return g_test_run();
+}
diff --git a/tests/unit/test-xbzrle.c b/tests/unit/test-xbzrle.c
index ef951b6e54..547046d093 100644
--- a/tests/unit/test-xbzrle.c
+++ b/tests/unit/test-xbzrle.c
@@ -16,6 +16,35 @@
 
 #define XBZRLE_PAGE_SIZE 4096
 
+int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
+     uint8_t *, int) = xbzrle_encode_buffer;
+#if defined(CONFIG_AVX512BW_OPT)
+#include "qemu/cpuid.h"
+static void __attribute__((constructor)) init_cpu_flag(void)
+{
+    unsigned max = __get_cpuid_max(0, NULL);
+    int a, b, c, d;
+    if (max >= 1) {
+        __cpuid(1, a, b, c, d);
+         /* We must check that AVX is not just available, but usable.  */
+        if ((c & bit_OSXSAVE) && (c & bit_AVX) && max >= 7) {
+            int bv;
+            __asm("xgetbv" : "=a"(bv), "=d"(d) : "c"(0));
+            __cpuid_count(7, 0, a, b, c, d);
+           /* 0xe6:
+            *  XCR0[7:5] = 111b (OPMASK state, upper 256-bit of ZMM0-ZMM15
+            *                    and ZMM16-ZMM31 state are enabled by OS)
+            *  XCR0[2:1] = 11b (XMM state and YMM state are enabled by OS)
+            */
+            if ((bv & 0xe6) == 0xe6 && (b & bit_AVX512BW)) {
+                xbzrle_encode_buffer_func = xbzrle_encode_buffer_avx512;
+            }
+        }
+    }
+    return ;
+}
+#endif
+
 static void test_uleb(void)
 {
     uint32_t i, val;
@@ -54,7 +83,7 @@ static void test_encode_decode_zero(void)
     buffer[1000 + diff_len + 5] = 105;
 
     /* encode zero page */
-    dlen = xbzrle_encode_buffer(buffer, buffer, XBZRLE_PAGE_SIZE, compressed,
+    dlen = xbzrle_encode_buffer_func(buffer, buffer, XBZRLE_PAGE_SIZE, compressed,
                        XBZRLE_PAGE_SIZE);
     g_assert(dlen == 0);
 
@@ -78,7 +107,7 @@ static void test_encode_decode_unchanged(void)
     test[1000 + diff_len + 5] = 109;
 
     /* test unchanged buffer */
-    dlen = xbzrle_encode_buffer(test, test, XBZRLE_PAGE_SIZE, compressed,
+    dlen = xbzrle_encode_buffer_func(test, test, XBZRLE_PAGE_SIZE, compressed,
                                 XBZRLE_PAGE_SIZE);
     g_assert(dlen == 0);
 
@@ -96,7 +125,7 @@ static void test_encode_decode_1_byte(void)
 
     test[XBZRLE_PAGE_SIZE - 1] = 1;
 
-    dlen = xbzrle_encode_buffer(buffer, test, XBZRLE_PAGE_SIZE, compressed,
+    dlen = xbzrle_encode_buffer_func(buffer, test, XBZRLE_PAGE_SIZE, compressed,
                        XBZRLE_PAGE_SIZE);
     g_assert(dlen == (uleb128_encode_small(&buf[0], 4095) + 2));
 
@@ -121,7 +150,7 @@ static void test_encode_decode_overflow(void)
     }
 
     /* encode overflow */
-    rc = xbzrle_encode_buffer(buffer, test, XBZRLE_PAGE_SIZE, compressed,
+    rc = xbzrle_encode_buffer_func(buffer, test, XBZRLE_PAGE_SIZE, compressed,
                               XBZRLE_PAGE_SIZE);
     g_assert(rc == -1);
 
@@ -152,7 +181,7 @@ static void encode_decode_range(void)
     test[1000 + diff_len + 5] = 109;
 
     /* test encode/decode */
-    dlen = xbzrle_encode_buffer(test, buffer, XBZRLE_PAGE_SIZE, compressed,
+    dlen = xbzrle_encode_buffer_func(test, buffer, XBZRLE_PAGE_SIZE, compressed,
                                 XBZRLE_PAGE_SIZE);
 
     rc = xbzrle_decode_buffer(compressed, dlen, test, XBZRLE_PAGE_SIZE);
-- 
2.25.1


