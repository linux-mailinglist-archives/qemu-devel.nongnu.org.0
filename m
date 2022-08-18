Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9F598116
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:51:17 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOcBI-0004PR-5T
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oObwj-0007mb-FP
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:36:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:6882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oObwe-0003zb-Rv
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660815368; x=1692351368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4c/V67Dkp9vrP0ycj7kDYdWKpwp5ORAnUo+FwmSB0Y=;
 b=jwLQQ2Ny7Mt5dgHdU5wL0Iy60t3CaGY7Sn7QjFwoTOmhIq8FrysQCC5g
 NT572uzSq/eVkDOzkz2cUlCYGfKq2D87De1NlBvjrwmJKmbV9NSh9gg+U
 B5HqQ6oqIK3wTn/eHvk1xSoRv0iD/AGvctG1KNRRc+D1FXnGt+IQ6qRc4
 027yWEpP0LNm6NqhvuHBu1GyJ2fLvukPt+vhytUW4R/uLSh2uTtFXrhN8
 QbkLYutDOTRYfrP0thuvbvJpWcEMrSH6T4qDVgpTp6LvwfsBi8w6X9EjC
 31nWGFHrgMFiMClyrNlAVEdcQaZ/8rphDXIC4SWamu0k1VNMMPiTYXblA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="292713284"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292713284"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 02:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584141620"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 02:36:05 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v5 1/2] Update AVX512 support for xbzrle_encode_buffer
Date: Thu, 18 Aug 2022 17:35:58 +0800
Message-Id: <20220818093559.2342594-2-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818093559.2342594-1-ling1.xu@intel.com>
References: <20220818093559.2342594-1-ling1.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=ling1.xu@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This commit updates code of avx512 support for xbzrle_encode_buffer function to
accelerate xbzrle encoding speed. We add runtime check of avx512 and add
benchmark for this feature. Compared with C version of
xbzrle_encode_buffer function, avx512 version can achieve 50%-70%
performance improvement on benchmarking. In addition, if dirty data is
randomly located in 4K page, the avx512 version can achieve almost 140%
performance gain.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
---
 meson.build        |  16 ++++++
 meson_options.txt  |   2 +
 migration/ram.c    |  35 ++++++++++--
 migration/xbzrle.c | 130 +++++++++++++++++++++++++++++++++++++++++++++
 migration/xbzrle.h |   4 ++
 5 files changed, 184 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 30a380752c..c9d90a5bff 100644
--- a/meson.build
+++ b/meson.build
@@ -2264,6 +2264,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
     int main(int argc, char *argv[]) { return bar(argv[0]); }
   '''), error_message: 'AVX512F not available').allowed())
 
+config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
+  .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX512BW') \
+  .require(cc.links('''
+    #pragma GCC push_options
+    #pragma GCC target("avx512bw")
+    #include <cpuid.h>
+    #include <immintrin.h>
+    static int bar(void *a) {
+
+      __m512i x = *(__m512i *)a;
+      __m512i res= _mm512_abs_epi8(x);
+      return res[1];
+    }
+    int main(int argc, char *argv[]) { return bar(argv[0]); }
+  '''), error_message: 'AVX512BW not available').allowed())
+
 have_pvrdma = get_option('pvrdma') \
   .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
   .require(cc.compiles(gnu_source_prefix + '''
diff --git a/meson_options.txt b/meson_options.txt
index e58e158396..07194bf680 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -104,6 +104,8 @@ option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')
 option('avx512f', type: 'feature', value: 'disabled',
        description: 'AVX512F optimizations')
+option('avx512bw', type: 'feature', value: 'auto',
+       description: 'AVX512BW optimizations')
 option('keyring', type: 'feature', value: 'auto',
        description: 'Linux keyring support')
 
diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..387bef2675 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -83,6 +83,35 @@
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 
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
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
@@ -802,9 +831,9 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
 
     /* XBZRLE encoding (if there is no overflow) */
-    encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
-                                       TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
-                                       TARGET_PAGE_SIZE);
+    encoded_len = xbzrle_encode_buffer_func(prev_cached_page, XBZRLE.current_buf,
+                                            TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
+                                            TARGET_PAGE_SIZE);
 
     /*
      * Update the cache contents, so that it corresponds to the data
diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 1ba482ded9..6da7f79625 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -174,3 +174,133 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
 
     return d;
 }
+
+#if defined(CONFIG_AVX512BW_OPT)
+#pragma GCC push_options
+#pragma GCC target("avx512bw")
+#include <immintrin.h>
+int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                             uint8_t *dst, int dlen)
+{
+    uint32_t zrun_len = 0, nzrun_len = 0;
+    int d = 0, i = 0, num = 0;
+    uint8_t *nzrun_start = NULL;
+    /* add 1 to include residual part in main loop */
+    uint32_t count512s = (slen >> 6) + 1;
+    /* countResidual is tail of data, i.e., countResidual = slen % 64 */
+    uint32_t countResidual = slen & 0b111111;
+    bool never_same = true;
+    uint64_t maskResidual = 1;
+    maskResidual <<= countResidual;
+    maskResidual -=1;
+    uint64_t comp = 0;
+    int bytesToCheck = 0;
+
+    while (count512s) {
+        if (d + 2 > dlen) {
+            return -1;
+        }
+
+        if(count512s != 1){
+            __m512i old_data = _mm512_mask_loadu_epi8(old_data,
+                                                      0xffffffffffffffff, old_buf + i);
+            __m512i new_data = _mm512_mask_loadu_epi8(new_data,
+                                                      0xffffffffffffffff, new_buf + i);
+            comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
+            bytesToCheck = 64;
+            count512s--;
+        } else {
+            __m512i old_data = _mm512_mask_loadu_epi8(old_data,
+                                                      maskResidual, old_buf + i);
+            __m512i new_data = _mm512_mask_loadu_epi8(new_data,
+                                                      maskResidual, new_buf + i);
+            comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
+            bytesToCheck = countResidual;
+            count512s--;
+        }
+
+        bool is_same = (comp & 0x1);
+        while (bytesToCheck) {
+            if (is_same) {
+                if (nzrun_len) {
+                    d += uleb128_encode_small(dst + d, nzrun_len);
+                    if (d + nzrun_len > dlen) {
+                        return -1;
+                    }
+                    nzrun_start = new_buf + i - nzrun_len;
+                    memcpy(dst + d, nzrun_start, nzrun_len);
+                    d += nzrun_len;
+                    nzrun_len = 0;
+                }
+                /* 64 data at a time for speed */
+                if (count512s && (comp == 0xffffffffffffffff)) {
+                    i += 64;
+                    zrun_len += 64;
+                    break;
+                }
+                never_same = false;
+                num = __builtin_ctzll(~comp);
+                num = (num < bytesToCheck) ? num : bytesToCheck;
+                zrun_len += num;
+                bytesToCheck -= num;
+                comp >>= num;
+                i += num;
+                if (bytesToCheck) {
+                    /* still has different data after same data */
+                    d += uleb128_encode_small(dst + d, zrun_len);
+                    zrun_len = 0;
+                } else {
+                    break;
+                }
+            }
+            if (never_same || zrun_len) {
+                /*
+                 * never_same only acts if
+                 * data begins with diff in first count512s
+                 */
+                d += uleb128_encode_small(dst + d, zrun_len);
+                zrun_len = 0;
+                never_same = false;
+            }
+            /* has diff, 64 data at a time for speed */
+            if ((bytesToCheck == 64) && (comp == 0x0)) {
+                i += 64;
+                nzrun_len += 64;
+                break;
+            }
+            num = __builtin_ctzll(comp);
+            num = (num < bytesToCheck) ? num : bytesToCheck;
+            nzrun_len += num;
+            bytesToCheck -= num;
+            comp >>= num;
+            i += num;
+            if (bytesToCheck) {
+                /* mask like 111000 */
+                d += uleb128_encode_small(dst + d, nzrun_len);
+                /* overflow */
+                if (d + nzrun_len > dlen) {
+                    return -1;
+                }
+                nzrun_start = new_buf + i - nzrun_len;
+                memcpy(dst + d, nzrun_start, nzrun_len);
+                d += nzrun_len;
+                nzrun_len = 0;
+                is_same = true;
+            }
+        }
+    }
+
+    if (nzrun_len != 0) {
+        d += uleb128_encode_small(dst + d, nzrun_len);
+        /* overflow */
+        if (d + nzrun_len > dlen) {
+            return -1;
+        }
+        nzrun_start = new_buf + i - nzrun_len;
+        memcpy(dst + d, nzrun_start, nzrun_len);
+        d += nzrun_len;
+    }
+    return d;
+}
+#pragma GCC pop_options
+#endif
diff --git a/migration/xbzrle.h b/migration/xbzrle.h
index a0db507b9c..6feb49160a 100644
--- a/migration/xbzrle.h
+++ b/migration/xbzrle.h
@@ -18,4 +18,8 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
                          uint8_t *dst, int dlen);
 
 int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen);
+#if defined(CONFIG_AVX512BW_OPT)
+int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                                uint8_t *dst, int dlen);
+#endif
 #endif
-- 
2.25.1


