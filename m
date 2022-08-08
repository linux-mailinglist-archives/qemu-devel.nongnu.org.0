Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC558C437
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 09:38:47 +0200 (CEST)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKxLQ-0001lB-DJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 03:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oKxHj-0005zc-4Z
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:34:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oKxHf-0005qq-CQ
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659944083; x=1691480083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3fyRcdV607T8tj7zj8UMdNF/cX+XV/5F3DxiHUwkcYE=;
 b=EPx99dEHhAu4e2mmsxcrCctbUt61RvlIhPS0hsElKzgkIQ8eZeGGLrkU
 amzWg+fGyb9b49znT082r4CzpPBrUeX3qoMcMBalDBelOCs6pie1iMYuc
 p3fjFl6+43Lh3UnBc9v5cDuMiqzhxJ/CkpHebnFY/xLdLaAY0D2cTLMK2
 cfJktTE5pTg+ta0SGMdb/WIJXIck4ac+Rwfx9r6ReEnaoMNNmC2SxZeZc
 tMjO+01qlXi/r+iuMbJMm4/7RC6n7wVq+wiZNE5GMEBSWleZ5SItkjuJw
 wfDnhTadL51Bnmfhtf97Tuq72nkq4fB0Wu5Wb+mmqVzCQLYKYHXmUYkeG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="288091534"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="288091534"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 00:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="663826348"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by fmsmga008.fm.intel.com with ESMTP; 08 Aug 2022 00:34:36 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v3 1/2] Update AVX512 support for xbzrle_encode_buffer function
Date: Mon,  8 Aug 2022 15:34:28 +0800
Message-Id: <20220808073429.1484302-2-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220808073429.1484302-1-ling1.xu@intel.com>
References: <20220808073429.1484302-1-ling1.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ling1.xu@intel.com;
 helo=mga11.intel.com
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

This commit update runtime check of AVX512, and implements avx512 of
xbzrle_encode_buffer function to accelerate xbzrle encoding speed.
Compared with C version of xbzrle_encode_buffer function, avx512 version
can achieve almost 60%-70% performance improvement on unit test provided
by Qemu. In addition, we provide one more unit test called
"test_encode_decode_random", in which dirty data are randomly located in
4K page, and this case can achieve almost 140% performance gain.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
---
 meson.build        |  16 ++++
 meson_options.txt  |   2 +
 migration/ram.c    |  41 ++++++++++
 migration/xbzrle.c | 181 +++++++++++++++++++++++++++++++++++++++++++++
 migration/xbzrle.h |   4 +
 5 files changed, 244 insertions(+)

diff --git a/meson.build b/meson.build
index 294e9a8f32..4222b77e9f 100644
--- a/meson.build
+++ b/meson.build
@@ -2262,6 +2262,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
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
index dc1de9ddbc..d9c1ac2f7a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -83,6 +83,35 @@
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 
+#if defined(CONFIG_AVX512BW_OPT)
+static bool IS_CPU_SUPPORT_AVX512BW;
+#include "qemu/cpuid.h"
+static void __attribute__((constructor)) init_cpu_flag(void)
+{
+    unsigned max = __get_cpuid_max(0, NULL);
+    int a, b, c, d;
+    IS_CPU_SUPPORT_AVX512BW = false;
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
+                IS_CPU_SUPPORT_AVX512BW = true;
+            }
+        }
+    }
+    return ;
+}
+#endif
+
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
@@ -802,9 +831,21 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
 
     /* XBZRLE encoding (if there is no overflow) */
+    #if defined(CONFIG_AVX512BW_OPT)
+    if (likely(IS_CPU_SUPPORT_AVX512BW)) {
+        encoded_len = xbzrle_encode_buffer_512(prev_cached_page, XBZRLE.current_buf,
+                                               TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
+                                               TARGET_PAGE_SIZE);
+    } else {
+        encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
+                                           TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
+                                           TARGET_PAGE_SIZE);
+    }
+    #else
     encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
                                        TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
                                        TARGET_PAGE_SIZE);
+    #endif
 
     /*
      * Update the cache contents, so that it corresponds to the data
diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 1ba482ded9..4db09fdbdb 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -174,3 +174,184 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
 
     return d;
 }
+
+#if defined(CONFIG_AVX512BW_OPT)
+#pragma GCC push_options
+#pragma GCC target("avx512bw")
+
+#include <immintrin.h>
+#include <math.h>
+#define SET_ZERO512(r) r = _mm512_set1_epi32(0)
+int xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                             uint8_t *dst, int dlen)
+{
+    uint32_t zrun_len = 0, nzrun_len = 0;
+    int d = 0, i = 0, num = 0;
+    uint8_t *nzrun_start = NULL;
+    int count512s = (slen >> 6);
+    int res = slen % 64;
+    bool never_same = true;
+    while (count512s--) {
+        if (d + 2 > dlen) {
+            return -1;
+        }
+        __m512i old_data = _mm512_mask_loadu_epi8(old_data,
+                               0xffffffffffffffff, old_buf + i);
+        __m512i new_data = _mm512_mask_loadu_epi8(new_data,
+                                                 0xffffffffffffffff, new_buf + i);
+        /* in mask bit 1 for same, 0 for diff */
+        __mmask64  comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
+
+        int bytesToCheck = 64;
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
+                if (comp == 0xffffffffffffffff) {
+                    i += 64;
+                    zrun_len += 64;
+                    break;
+                }
+                never_same = false;
+                num = __builtin_ctzl(~comp);
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
+            /* has diff */
+            if ((bytesToCheck == 64) && (comp == 0x0)) {
+                i += 64;
+                nzrun_len += 64;
+                break;
+            }
+            num = __builtin_ctzl(comp);
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
+    if (res) {
+        /* the number of data is less than 64 */
+        unsigned long long mask = pow(2, res);
+        mask -= 1;
+        __m512i r = SET_ZERO512(r);
+        __m512i old_data = _mm512_mask_loadu_epi8(r, mask, old_buf + i);
+        __m512i new_data = _mm512_mask_loadu_epi8(r, mask, new_buf + i);
+        __mmask64 comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
+
+        int bytesToCheck = res;
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
+                never_same = false;
+                num = __builtin_ctzl(~comp);
+                num = (num < bytesToCheck) ? num : bytesToCheck;
+                zrun_len += num;
+                bytesToCheck -= num;
+                comp >>= num;
+                i += num;
+                if (bytesToCheck) {
+                    /* diff after same */
+                    d += uleb128_encode_small(dst + d, zrun_len);
+                    zrun_len = 0;
+                } else {
+                    break;
+                }
+            }
+
+            if (never_same || zrun_len) {
+                d += uleb128_encode_small(dst + d, zrun_len);
+                zrun_len = 0;
+                never_same = false;
+            }
+            /* has diff */
+            num = __builtin_ctzl(comp);
+            num = (num < bytesToCheck) ? num : bytesToCheck;
+            nzrun_len += num;
+            bytesToCheck -= num;
+            comp >>= num;
+            i += num;
+            if (bytesToCheck) {
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
+    if (zrun_len) {
+        return (zrun_len == slen) ? 0 : d;
+    }
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
\ No newline at end of file
diff --git a/migration/xbzrle.h b/migration/xbzrle.h
index a0db507b9c..6247de5f00 100644
--- a/migration/xbzrle.h
+++ b/migration/xbzrle.h
@@ -18,4 +18,8 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
                          uint8_t *dst, int dlen);
 
 int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen);
+#if defined(CONFIG_AVX512BW_OPT)
+int xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                             uint8_t *dst, int dlen);
+#endif
 #endif
-- 
2.25.1


