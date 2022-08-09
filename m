Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDB58D586
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:41:22 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKng-0003Pf-RD
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLKfl-0004d2-Nv
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:33:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:48329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLKfj-0008VR-1E
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660033987; x=1691569987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5sOqkDGHzexi1sf9Jyn32uzYDO1PiXfLlG6b2bZZbU=;
 b=i3OA3O0084Tj+bi+r16TlWKJztw4XTa9QnC6umy7yMIjTYsMNvoIwMqu
 OgLXIQN8cOw8A2MlU0FQbjn+VIuv5kx1R6xMU3WsLr1DUNut69Tgse1lL
 r0L9uAF1kTYpGcL7H2Dkh5WqI85u25l3tO4nXiwV0953vWJU5mZRXwiJ6
 qA7fhNq24mNeFvnTzUGPUlTUI9VzeG+9VzCRT53Zes8zBjQ9U2C0MaYLM
 CmXuDDK7rrUVzcbNr30YQGfzvSF8dhaw0LXSoI4m2bMWqQKn8P/9x3F+H
 MFFKa/biCP5JGE+nlENEQuhdPCcKCEFdE9Y/sgNii4OCFGfFtR6Movotr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316712891"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="316712891"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="633251192"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga008.jf.intel.com with ESMTP; 09 Aug 2022 01:33:02 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v4 2/2] Update test code of AVX512 support for xbzrle_encode
Date: Tue,  9 Aug 2022 16:32:49 +0800
Message-Id: <20220809083249.1646952-3-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809083249.1646952-1-ling1.xu@intel.com>
References: <20220809083249.1646952-1-ling1.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=ling1.xu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
---
 tests/unit/test-xbzrle.c | 458 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 457 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-xbzrle.c b/tests/unit/test-xbzrle.c
index ef951b6e54..2676123ce3 100644
--- a/tests/unit/test-xbzrle.c
+++ b/tests/unit/test-xbzrle.c
@@ -16,6 +16,35 @@
 
 #define XBZRLE_PAGE_SIZE 4096
 
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
 static void test_uleb(void)
 {
     uint32_t i, val;
@@ -173,11 +202,438 @@ static void test_encode_decode(void)
     }
 }
 
+static float *encode_decode_zero(void)
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
+    static float result_zero[2];
+    result_zero[0] = time_val;
+    result_zero[1] = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(buffer512);
+    g_free(compressed512);
+
+    return result_zero;
+}
+
+static void test_encode_decode_zero_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_zero();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Zero test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *encode_decode_unchanged(void)
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
+    static float result_unchanged[2];
+    result_unchanged[0] = time_val;
+    result_unchanged[1] = time_val512;
+
+    g_free(test);
+    g_free(compressed);
+    g_free(test512);
+    g_free(compressed512);
+
+    return result_unchanged;
+}
+
+static void test_encode_decode_unchanged_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_unchanged();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Unchanged test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *encode_decode_1_byte(void)
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
+    static float result_1_byte[2];
+    result_1_byte[0] = time_val;
+    result_1_byte[1] = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_1_byte;
+}
+
+static void test_encode_decode_1_byte_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_1_byte();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("1 byte test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *encode_decode_overflow(void)
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
+    static float result_overflow[2];
+    result_overflow[0] = time_val;
+    result_overflow[1] = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_overflow;
+}
+
+static void test_encode_decode_overflow_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_overflow();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Overflow test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *encode_decode_range_avx512(void)
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
+    static float result_range[2];
+    result_range[0] = time_val;
+    result_range[1] = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_range;
+}
+
+static void test_encode_decode_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_range_avx512();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Encode decode test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *encode_decode_random(void)
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
+    static float result_random[2];
+    result_random[0] = time_val;
+    result_random[1] = time_val512;
+
+    g_free(buffer);
+    g_free(compressed);
+    g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_random;
+}
+
+static void test_encode_decode_random_avx512(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_random();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Random test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
     g_test_rand_int();
     g_test_add_func("/xbzrle/uleb", test_uleb);
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
+    } else {
+        g_test_add_func("/xbzrle/encode_decode_zero", test_encode_decode_zero);
+        g_test_add_func("/xbzrle/encode_decode_unchanged",
+                        test_encode_decode_unchanged);
+        g_test_add_func("/xbzrle/encode_decode_1_byte", test_encode_decode_1_byte);
+        g_test_add_func("/xbzrle/encode_decode_overflow",
+                        test_encode_decode_overflow);
+        g_test_add_func("/xbzrle/encode_decode", test_encode_decode);
+    }
+    #else
     g_test_add_func("/xbzrle/encode_decode_zero", test_encode_decode_zero);
     g_test_add_func("/xbzrle/encode_decode_unchanged",
                     test_encode_decode_unchanged);
@@ -185,6 +641,6 @@ int main(int argc, char **argv)
     g_test_add_func("/xbzrle/encode_decode_overflow",
                     test_encode_decode_overflow);
     g_test_add_func("/xbzrle/encode_decode", test_encode_decode);
-
+    #endif
     return g_test_run();
 }
-- 
2.25.1


