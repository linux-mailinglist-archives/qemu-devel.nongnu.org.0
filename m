Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FB0693C39
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:30:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb7-0001ZH-05; Sun, 12 Feb 2023 21:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb5-0001Ys-Ck
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb3-00034r-B8
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ImAledL35n3b32So8PCwQBc3/Z1i939uMWYRhKZc5U=;
 b=fwqyOF63ar3ZT6KVP+MyipZUUC6X67GtejjdhMOu52dyNSY5KH+bK/6gAXtduAITSz4OSf
 WTecYnqKRsLhsNSxcIc5iRmLL0SunTy7yIoHMiIYmCUaX3568+mo345dHXma5cvfqLwcfD
 SwwwDQTgFuOBUmc/2nPgpv9RBwvZ4AY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-W3ngZc5TPUaLCaVyVGbBiQ-1; Sun, 12 Feb 2023 21:29:35 -0500
X-MC-Unique: W3ngZc5TPUaLCaVyVGbBiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bd21-20020a05600c1f1500b003dc5cb10dcfso5414558wmb.9
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ImAledL35n3b32So8PCwQBc3/Z1i939uMWYRhKZc5U=;
 b=ydZTyG14uMNHTo6SI7e6SJO3ScDvo4drwdS3NywWQXahOBDMsCmRuuEcR3E2CqIi9I
 2f1132WuFFmvSSh3yjQJoXM7S5o/I8K7n1S5ErRgyh5rYn1hpb7NoZnV8u5o6Y8/yi0A
 F8ylioXhOLDU1GXc1waC2SRgd7Yw7wWFMF5Egta8KKjERLsaX+cZOzXZ4SpJGVN1Dx9X
 gD59zlUSZ4TUq6sBgB2/hQQe0I//gACYH/BWwP8ZGOxM+ixxMCJHbpgzd4oUWdyCOE2v
 vT/Bu9+brdzJjdxhhnZ46ggQYcKJm72va30Y+tZrkCCJiEglRxDf/UslylXjYa5pFT1R
 x9/g==
X-Gm-Message-State: AO0yUKXYusje1LfeeQ+uCkptkFpJP9vb+KDuVoN3PM1FEzJSJb4V1Cae
 nWqIDDns3PCO0eThmxB0mHWkbupA8JYpWSSOAq97ZQ8qYqX8DlW2UTyuJBnjZHo6M1WSalge5a3
 p5ccC6+a5NF4gbajKzNDAAm6ZIt9K7UJE+J+chJ9qZziZ11jN5k+JAk2KnD6u9hUlGMWDa222
X-Received: by 2002:a05:600c:180f:b0:3dc:50c2:cc1 with SMTP id
 n15-20020a05600c180f00b003dc50c20cc1mr17322912wmp.23.1676255373749; 
 Sun, 12 Feb 2023 18:29:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+0BGW5iw5jbfgot5KqDh7ALMHXa0fJzk0JRh3cdvx5BFLx/ad7iR/pu5G4Iby0RR0V+l5/bQ==
X-Received: by 2002:a05:600c:180f:b0:3dc:50c2:cc1 with SMTP id
 n15-20020a05600c180f00b003dc50c20cc1mr17322892wmp.23.1676255373462; 
 Sun, 12 Feb 2023 18:29:33 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003dfe8c4c497sm15677380wml.39.2023.02.12.18.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:32 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 ling xu <ling1.xu@intel.com>, Zhou Zhao <zhou.zhao@intel.com>,
 Jun Jin <jun.i.jin@intel.com>
Subject: [PULL 12/22] AVX512 support for xbzrle_encode_buffer
Date: Mon, 13 Feb 2023 03:29:01 +0100
Message-Id: <20230213022911.68490-13-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: ling xu <ling1.xu@intel.com>

This commit is the same with [PATCH v6 1/2], and provides avx512 support for xbzrle_encode_buffer
function to accelerate xbzrle encoding speed. Runtime check of avx512
support and benchmark for this feature are added. Compared with C
version of xbzrle_encode_buffer function, avx512 version can achieve
50%-70% performance improvement on benchmarking. In addition, if dirty
data is randomly located in 4K page, the avx512 version can achieve
almost 140% performance gain.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 meson.build                   |  17 +++++
 migration/xbzrle.h            |   4 ++
 migration/ram.c               |  34 +++++++++-
 migration/xbzrle.c            | 124 ++++++++++++++++++++++++++++++++++
 meson_options.txt             |   2 +
 scripts/meson-buildoptions.sh |   3 +
 6 files changed, 181 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 4ba3bf3431..c626ccfa82 100644
--- a/meson.build
+++ b/meson.build
@@ -2351,6 +2351,22 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
     int main(int argc, char *argv[]) { return bar(argv[argc - 1]); }
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
+      __m512i *x = a;
+      __m512i res= _mm512_abs_epi8(*x);
+      return res[1];
+    }
+    int main(int argc, char *argv[]) { return bar(argv[0]); }
+  '''), error_message: 'AVX512BW not available').allowed())
+
 have_pvrdma = get_option('pvrdma') \
   .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
   .require(cc.compiles(gnu_source_prefix + '''
@@ -3783,6 +3799,7 @@ summary_info += {'debug stack usage': get_option('debug_stack_usage')}
 summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
+summary_info += {'avx512bw optimization': config_host_data.get('CONFIG_AVX512BW_OPT')}
 summary_info += {'avx512f optimization': config_host_data.get('CONFIG_AVX512F_OPT')}
 summary_info += {'gprof enabled':     get_option('gprof')}
 summary_info += {'gcov':              get_option('b_coverage')}
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
diff --git a/migration/ram.c b/migration/ram.c
index 0890816a30..18ac68b181 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -83,6 +83,34 @@
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
+}
+#endif
+
 XBZRLECacheStats xbzrle_counters;
 
 /* used by the search for pages to send */
@@ -806,9 +834,9 @@ static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
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
index 1ba482ded9..05366e86c0 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -174,3 +174,127 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
 
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
+    uint32_t count_residual = slen & 0b111111;
+    bool never_same = true;
+    uint64_t mask_residual = 1;
+    mask_residual <<= count_residual;
+    mask_residual -= 1;
+    __m512i r = _mm512_set1_epi32(0);
+
+    while (count512s) {
+        if (d + 2 > dlen) {
+            return -1;
+        }
+
+        int bytes_to_check = 64;
+        uint64_t mask = 0xffffffffffffffff;
+        if (count512s == 1) {
+            bytes_to_check = count_residual;
+            mask = mask_residual;
+        }
+        __m512i old_data = _mm512_mask_loadu_epi8(r,
+                                                  mask, old_buf + i);
+        __m512i new_data = _mm512_mask_loadu_epi8(r,
+                                                  mask, new_buf + i);
+        uint64_t comp = _mm512_cmpeq_epi8_mask(old_data, new_data);
+        count512s--;
+
+        bool is_same = (comp & 0x1);
+        while (bytes_to_check) {
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
+                num = (num < bytes_to_check) ? num : bytes_to_check;
+                zrun_len += num;
+                bytes_to_check -= num;
+                comp >>= num;
+                i += num;
+                if (bytes_to_check) {
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
+            if ((bytes_to_check == 64) && (comp == 0x0)) {
+                i += 64;
+                nzrun_len += 64;
+                break;
+            }
+            num = __builtin_ctzll(comp);
+            num = (num < bytes_to_check) ? num : bytes_to_check;
+            nzrun_len += num;
+            bytes_to_check -= num;
+            comp >>= num;
+            i += num;
+            if (bytes_to_check) {
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
diff --git a/meson_options.txt b/meson_options.txt
index 559a571b6b..e5f199119e 100644
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
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0f71e92dcb..c2982ea087 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -70,6 +70,7 @@ meson_options_help() {
   printf "%s\n" '  attr            attr/xattr support'
   printf "%s\n" '  auth-pam        PAM access control'
   printf "%s\n" '  avx2            AVX2 optimizations'
+  printf "%s\n" '  avx512bw        AVX512BW optimizations'
   printf "%s\n" '  avx512f         AVX512F optimizations'
   printf "%s\n" '  blkio           libblkio block device driver'
   printf "%s\n" '  bochs           bochs image format support'
@@ -198,6 +199,8 @@ _meson_option_parse() {
     --disable-auth-pam) printf "%s" -Dauth_pam=disabled ;;
     --enable-avx2) printf "%s" -Davx2=enabled ;;
     --disable-avx2) printf "%s" -Davx2=disabled ;;
+    --enable-avx512bw) printf "%s" -Davx512bw=enabled ;;
+    --disable-avx512bw) printf "%s" -Davx512bw=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
     --enable-gcov) printf "%s" -Db_coverage=true ;;
-- 
2.39.1


