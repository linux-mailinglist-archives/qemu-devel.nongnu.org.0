Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A757CE40
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:54:01 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXYt-0000I9-Sf
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oETTO-0005N7-Ba
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:32:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:1766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oETTK-0000x9-No
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658399518; x=1689935518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Yx+QD6dGs3wP6H+5PYyzmKCBqlBXkJP6ASzkZMAkts=;
 b=P4nrAlRJab4awiPcAYyzm3wGJtWGg7wksug6utjQM/1qlnydTPGkGTFF
 wZi1elKMOxg8/Mh5XvAEVD3bR5pb0a5f8TNu/abRMzy9rOf4atdRlAl7i
 NBDFs6rMXF68ex1FGdUY8XsDOx4iTRKGWQ83m5H0zh4SMXXw3ZZO/ALYM
 wx8wcXvQeU/6zhpqpxvKqGGp1HSXL63SXLZWTH8+QW+x8qaq7PjRXX0mL
 VpHSgprORoTKxYp2q4QNMprjDTJV48t4h4gKtsCU+JPjunIcfkheyGhlO
 4JDCxLj5sbBOeVuCRJYzdqZwcdo2BdupiO2QuzA0MPGTijs1HJ+YjMvJ7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="267407928"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="267407928"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 03:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="598415364"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga002.jf.intel.com with ESMTP; 21 Jul 2022 03:31:55 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH 1/1] Add AVX512 support for xbzrle_encode_buffer function
Date: Thu, 21 Jul 2022 18:31:47 +0800
Message-Id: <20220721103147.96608-2-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721103147.96608-1-ling1.xu@intel.com>
References: <20220721103147.96608-1-ling1.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=ling1.xu@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Jul 2022 10:50:32 -0400
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

This commit adds AVX512 implementation of xbzrle_encode_buffer function to
accelerate xbzrle encoding speed. Compared with C version of xbzrle_encode_buffer function,
AVX512 version can achieve almost 60%-70% performance improvement on unit test provided by qemu.
In addition, we provide one more unit test called "test_encode_decode_random", in which
dirty data are randomly located in 4K page, and this case can achieve almost 140% performance gain.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>
---
 configure                | 434 ++++++++++++++++++++++++++++++++++++++-
 migration/ram.c          |   6 +
 migration/xbzrle.c       | 177 ++++++++++++++++
 migration/xbzrle.h       |   4 +
 tests/unit/test-xbzrle.c | 307 +++++++++++++++++++++++++--
 5 files changed, 908 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index 4f12481765..7685479297 100755
--- a/configure
+++ b/configure
@@ -587,6 +587,431 @@ else
   cpu=$(uname -m)
 fi
 
+# cpu flag for x86
+x86_cpu_flags=""
+
+get_x86_cpu_flags(){
+    # check sse flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128 a,b;
+    int res= _mm_ucomieq_ss(a,b);
+    return 0;
+}
+EOF
+    local_cpu_flag="-msse"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -msse"
+    fi
+
+    # check sse2 flag
+    cat > $TMPC << EOF
+#include <emmintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128d a,b;
+    int res= _mm_ucomineq_sd (a, b);
+    return 0;
+}
+EOF
+    local_cpu_flag="-msse2"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -msse2"
+    fi
+
+    # check sse3 flag
+    cat > $TMPC << EOF
+#include <pmmintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128 a;
+    __m128  res= _mm_moveldup_ps (a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-msse3"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -msse3"
+    fi
+
+    # check ssse3 flag
+    cat > $TMPC << EOF
+#include <tmmintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128i a;
+    __m12i8  res= _mm_abs_epi32 (a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mssse3"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mssse3"
+    fi
+
+    # check sse4.1 flag
+    cat > $TMPC << EOF
+#include <smmintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128 a;
+    __m128 res=_mm_ceil_ps (a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-msse4.1"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -msse4.1"
+    fi
+
+    # check sse4.2 flag
+    cat > $TMPC << EOF
+#include <nmmintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128i a,b;
+    __m128i res=_mm_cmpgt_epi64 (a,b);
+    return 0;
+}
+EOF
+    local_cpu_flag="-msse4.2"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -msse4.2"
+    fi
+
+    # check avx flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m256 a;
+    __m256 res= _mm256_ceil_ps(a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx"
+    fi
+
+    # check avx2 flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m256i a;
+    __m256i res= _mm256_abs_epi32(a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx2"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx2"
+    fi
+
+    # check AVX_VNNI flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128i a,b,c;
+    __m128i res= _mm_dpbusd_epi32(a,b,c);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavxvnni"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavxvnni"
+    fi
+
+    # check AVX512f flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128d a;
+    __m512d res= _mm512_broadcastsd_pd(a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512f"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512f"
+    fi
+
+    # check AVX512bw flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a;
+    __m512i res= _mm512_abs_epi8(a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512bw"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512bw"
+    fi
+
+    # check AVX512CD flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a;
+    __mmask16 k;
+    __m512i res= _mm512_maskz_lzcnt_epi32 (k, a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512cd"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512cd"
+    fi
+
+    # check AVX512DQ flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __mmask8 a,b;
+    __mmask8 res=_kxor_mask8(a,b);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512dq"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512dq"
+    fi
+
+    # check AVX512ER flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512d a;
+    __m512d res=_mm512_rsqrt28_pd(a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512er"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512er"
+    fi
+
+    # check AVX512IFMA52 flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a,b,c;
+    __m512i res= _mm512_madd52lo_epu64 (a, b, c);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512ifma"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512ifma"
+    fi
+
+    # check AVX512PF flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    char* base_addr;
+    __mmask8 k;
+    __m512i vindex;
+    _mm512_mask_prefetch_i64scatter_pd (base_addr, k, vindex, 1, 2);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512pf"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512pf"
+    fi
+
+    # check AVX512VPOPCNTDQ flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a;
+    __mmask8 k;
+    __m512i res= _mm512_maskz_popcnt_epi64(k,a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512vpopcntdq"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512vpopcntdq"
+    fi
+
+    # check AVX512_4VNNIW flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a,b,c,d,e;
+    __m128 g;
+    __m512i res= _mm512_4dpwssd_epi32 (a, b, c, d, e, &g);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx5124vnniw"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx5124vnniw"
+    fi
+
+    # check AVX512_BITALG flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a;
+    __m512i res= _mm512_popcnt_epi16 (a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512bitalg"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512bitalg"
+    fi
+
+    # check AVX512_VBMI flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a,b,c;
+    __m512i res= _mm512_permutex2var_epi8  (a, b, c);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512vbmi"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512vbmi"
+    fi
+
+    # check AVX512_VBMI2 flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a,b,c;
+    __m512i res= _mm512_shrdv_epi64  (a, b, c);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512vbmi2"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512vbmi2"
+    fi
+
+    # check AVX512_VNNI flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m512i a,b,c;
+    __mmask16 k;
+    __m512i res=  _mm512_maskz_dpwssds_epi32 (k,a, b, c);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512vnni"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512vnni"
+    fi
+
+    # check AVX512_FP16 flag
+    cat > $TMPC << EOF
+#include <immintrin.h>
+int main(int argc, char *argv[])
+{
+    __m128h a;
+    __m128 res=  _mm_castph_ps (a);
+    return 0;
+}
+EOF
+    local_cpu_flag="-mavx512fp16"
+    rm -f  $TMPE
+    do_cc $local_cpu_flag  -o $TMPE $TMPC
+    if [ -e  $TMPE ]
+    then
+        x86_cpu_flags="$x86_cpu_flags -mavx512fp16"
+    fi
+}
+
 # Normalise host CPU name, set multilib cflags
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
@@ -595,16 +1020,19 @@ case "$cpu" in
 
   i386|i486|i586|i686|i86pc|BePC)
     cpu="i386"
-    CPU_CFLAGS="-m32" ;;
+    get_x86_cpu_flags
+    CPU_CFLAGS="-m32 $x86_cpu_flags" ;;
   x32)
     cpu="x86_64"
-    CPU_CFLAGS="-mx32" ;;
+    get_x86_cpu_flags
+    CPU_CFLAGS="-mx32 $x86_cpu_flags" ;;
   x86_64|amd64)
     cpu="x86_64"
+    get_x86_cpu_flags
     # ??? Only extremely old AMD cpus do not have cmpxchg16b.
     # If we truly care, we should simply detect this case at
     # runtime and generate the fallback to serial emulation.
-    CPU_CFLAGS="-m64 -mcx16" ;;
+    CPU_CFLAGS="-m64 -mcx16 $x86_cpu_flags" ;;
 
   mips*)
     cpu="mips" ;;
diff --git a/migration/ram.c b/migration/ram.c
index 01f9cc1d72..3b931c325f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -747,9 +747,15 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
     memcpy(XBZRLE.current_buf, *current_data, TARGET_PAGE_SIZE);
 
     /* XBZRLE encoding (if there is no overflow) */
+    #if defined(__x86_64__) && defined(__AVX512BW__)
+    encoded_len = xbzrle_encode_buffer_512(prev_cached_page, XBZRLE.current_buf,
+                                       TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
+                                       TARGET_PAGE_SIZE);
+    #else
     encoded_len = xbzrle_encode_buffer(prev_cached_page, XBZRLE.current_buf,
                                        TARGET_PAGE_SIZE, XBZRLE.encoded_buf,
                                        TARGET_PAGE_SIZE);
+    #endif
 
     /*
      * Update the cache contents, so that it corresponds to the data
diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index 1ba482ded9..9eea1c0a5f 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -174,3 +174,180 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
 
     return d;
 }
+
+#if defined(__x86_64__) && defined(__AVX512BW__)
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
+#endif
diff --git a/migration/xbzrle.h b/migration/xbzrle.h
index a0db507b9c..e03ee51d3a 100644
--- a/migration/xbzrle.h
+++ b/migration/xbzrle.h
@@ -18,4 +18,8 @@ int xbzrle_encode_buffer(uint8_t *old_buf, uint8_t *new_buf, int slen,
                          uint8_t *dst, int dlen);
 
 int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen);
+#if defined(__x86_64__) && defined(__AVX512BW__)
+int xbzrle_encode_buffer_512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                             uint8_t *dst, int dlen);
+#endif
 #endif
diff --git a/tests/unit/test-xbzrle.c b/tests/unit/test-xbzrle.c
index ef951b6e54..653016826f 100644
--- a/tests/unit/test-xbzrle.c
+++ b/tests/unit/test-xbzrle.c
@@ -38,111 +38,280 @@ static void test_uleb(void)
     g_assert(val == 0);
 }
 
-static void test_encode_decode_zero(void)
+static float *test_encode_decode_zero(void)
 {
     uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
     int i = 0;
-    int dlen = 0;
+    int dlen = 0, dlen512 = 0;
     int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
 
     for (i = diff_len; i > 0; i--) {
         buffer[1000 + i] = i;
+        buffer512[1000 + i] = i;
     }
 
     buffer[1000 + diff_len + 3] = 103;
     buffer[1000 + diff_len + 5] = 105;
 
+    buffer512[1000 + diff_len + 3] = 103;
+    buffer512[1000 + diff_len + 5] = 105;
+
     /* encode zero page */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
     dlen = xbzrle_encode_buffer(buffer, buffer, XBZRLE_PAGE_SIZE, compressed,
                        XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
     g_assert(dlen == 0);
 
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_512(buffer512, buffer512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(dlen512 == 0);
+
+    static float result_zero[2];
+    result_zero[0] = time_val;
+    result_zero[1] = time_val512;
+
     g_free(buffer);
     g_free(compressed);
+    g_free(buffer512);
+    g_free(compressed512);
+
+    return result_zero;
+}
+
+static void test_encode_decode_zero_range(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = test_encode_decode_zero();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Zero test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
 }
 
-static void test_encode_decode_unchanged(void)
+static float *test_encode_decode_unchanged(void)
 {
     uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
     int i = 0;
-    int dlen = 0;
+    int dlen = 0, dlen512 = 0;
     int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
 
     for (i = diff_len; i > 0; i--) {
         test[1000 + i] = i + 4;
+        test512[1000 + i] = i + 4;
     }
 
     test[1000 + diff_len + 3] = 107;
     test[1000 + diff_len + 5] = 109;
 
+    test512[1000 + diff_len + 3] = 107;
+    test512[1000 + diff_len + 5] = 109;
+
     /* test unchanged buffer */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
     dlen = xbzrle_encode_buffer(test, test, XBZRLE_PAGE_SIZE, compressed,
                                 XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
     g_assert(dlen == 0);
 
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_512(test512, test512, XBZRLE_PAGE_SIZE,
+                                       compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(dlen512 == 0);
+
+    static float result_unchanged[2];
+    result_unchanged[0] = time_val;
+    result_unchanged[1] = time_val512;
+
     g_free(test);
     g_free(compressed);
+    g_free(test512);
+    g_free(compressed512);
+
+    return result_unchanged;
 }
 
-static void test_encode_decode_1_byte(void)
+static void test_encode_decode_unchanged_range(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = test_encode_decode_unchanged();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Unchanged test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *test_encode_decode_1_byte(void)
 {
     uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *compressed = g_malloc(XBZRLE_PAGE_SIZE);
-    int dlen = 0, rc = 0;
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc(XBZRLE_PAGE_SIZE);
+    int dlen = 0, rc = 0, dlen512 = 0, rc512 = 0;
     uint8_t buf[2];
+    uint8_t buf512[2];
 
     test[XBZRLE_PAGE_SIZE - 1] = 1;
+    test512[XBZRLE_PAGE_SIZE - 1] = 1;
 
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
     dlen = xbzrle_encode_buffer(buffer, test, XBZRLE_PAGE_SIZE, compressed,
                        XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
     g_assert(dlen == (uleb128_encode_small(&buf[0], 4095) + 2));
 
     rc = xbzrle_decode_buffer(compressed, dlen, buffer, XBZRLE_PAGE_SIZE);
     g_assert(rc == XBZRLE_PAGE_SIZE);
     g_assert(memcmp(test, buffer, XBZRLE_PAGE_SIZE) == 0);
 
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_512(buffer512, test512, XBZRLE_PAGE_SIZE,
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
     g_free(buffer);
     g_free(compressed);
     g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_1_byte;
 }
 
-static void test_encode_decode_overflow(void)
+static void test_encode_decode_1_byte_range(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = test_encode_decode_1_byte();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("1 byte test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
+
+static float *test_encode_decode_overflow(void)
 {
     uint8_t *compressed = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
-    int i = 0, rc = 0;
+    uint8_t *compressed512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0, rc = 0, rc512 = 0;
 
     for (i = 0; i < XBZRLE_PAGE_SIZE / 2 - 1; i++) {
         test[i * 2] = 1;
+        test512[i * 2] = 1;
     }
 
     /* encode overflow */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
     rc = xbzrle_encode_buffer(buffer, test, XBZRLE_PAGE_SIZE, compressed,
                               XBZRLE_PAGE_SIZE);
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
     g_assert(rc == -1);
 
+    t_start512 = clock();
+    rc512 = xbzrle_encode_buffer_512(buffer512, test512, XBZRLE_PAGE_SIZE,
+                                     compressed512, XBZRLE_PAGE_SIZE);
+    t_end512 = clock();
+    float time_val512 = difftime(t_end512, t_start512);
+    g_assert(rc512 == -1);
+
+    static float result_overflow[2];
+    result_overflow[0] = time_val;
+    result_overflow[1] = time_val512;
+
     g_free(buffer);
     g_free(compressed);
     g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_overflow;
+}
+
+static void test_encode_decode_overflow_range(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = test_encode_decode_overflow();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Overflow test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
 }
 
-static void encode_decode_range(void)
+static float *encode_decode_range(void)
 {
     uint8_t *buffer = g_malloc0(XBZRLE_PAGE_SIZE);
     uint8_t *compressed = g_malloc(XBZRLE_PAGE_SIZE);
     uint8_t *test = g_malloc0(XBZRLE_PAGE_SIZE);
-    int i = 0, rc = 0;
-    int dlen = 0;
+    uint8_t *buffer512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    uint8_t *compressed512 = g_malloc(XBZRLE_PAGE_SIZE);
+    uint8_t *test512 = g_malloc0(XBZRLE_PAGE_SIZE);
+    int i = 0, rc = 0, rc512 = 0;
+    int dlen = 0, dlen512 = 0;
 
     int diff_len = g_test_rand_int_range(0, XBZRLE_PAGE_SIZE - 1006);
 
     for (i = diff_len; i > 0; i--) {
         buffer[1000 + i] = i;
         test[1000 + i] = i + 4;
+        buffer512[1000 + i] = i;
+        test512[1000 + i] = i + 4;
     }
 
     buffer[1000 + diff_len + 3] = 103;
@@ -151,26 +320,129 @@ static void encode_decode_range(void)
     buffer[1000 + diff_len + 5] = 105;
     test[1000 + diff_len + 5] = 109;
 
+    buffer512[1000 + diff_len + 3] = 103;
+    test512[1000 + diff_len + 3] = 107;
+
+    buffer512[1000 + diff_len + 5] = 105;
+    test512[1000 + diff_len + 5] = 109;
+
     /* test encode/decode */
+    time_t t_start, t_end, t_start512, t_end512;
+    t_start = clock();
     dlen = xbzrle_encode_buffer(test, buffer, XBZRLE_PAGE_SIZE, compressed,
                                 XBZRLE_PAGE_SIZE);
-
+    t_end = clock();
+    float time_val = difftime(t_end, t_start);
     rc = xbzrle_decode_buffer(compressed, dlen, test, XBZRLE_PAGE_SIZE);
     g_assert(rc < XBZRLE_PAGE_SIZE);
     g_assert(memcmp(test, buffer, XBZRLE_PAGE_SIZE) == 0);
 
+    t_start512 = clock();
+    dlen512 = xbzrle_encode_buffer_512(test512, buffer512, XBZRLE_PAGE_SIZE,
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
     g_free(buffer);
     g_free(compressed);
     g_free(test);
+    g_free(buffer512);
+    g_free(compressed512);
+    g_free(test512);
+
+    return result_range;
 }
 
 static void test_encode_decode(void)
 {
     int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
+    for (i = 0; i < 10000; i++) {
+        res = encode_decode_range();
+        time_raw += res[0];
+        time_512 += res[1];
+    }
+    printf("Encode decode test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
+}
 
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
+    dlen512 = xbzrle_encode_buffer_512(test512, buffer512, XBZRLE_PAGE_SIZE,
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
+static void test_encode_decode_random(void)
+{
+    int i;
+    float time_raw = 0.0, time_512 = 0.0;
+    float *res;
     for (i = 0; i < 10000; i++) {
-        encode_decode_range();
+        res = encode_decode_random();
+        time_raw += res[0];
+        time_512 += res[1];
     }
+    printf("Random test:\n");
+    printf("Raw xbzrle_encode time is %f ms\n", time_raw);
+    printf("512 xbzrle_encode time is %f ms\n", time_512);
 }
 
 int main(int argc, char **argv)
@@ -178,13 +450,14 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_test_rand_int();
     g_test_add_func("/xbzrle/uleb", test_uleb);
-    g_test_add_func("/xbzrle/encode_decode_zero", test_encode_decode_zero);
+    g_test_add_func("/xbzrle/encode_decode_zero", test_encode_decode_zero_range);
     g_test_add_func("/xbzrle/encode_decode_unchanged",
-                    test_encode_decode_unchanged);
-    g_test_add_func("/xbzrle/encode_decode_1_byte", test_encode_decode_1_byte);
+                    test_encode_decode_unchanged_range);
+    g_test_add_func("/xbzrle/encode_decode_1_byte", test_encode_decode_1_byte_range);
     g_test_add_func("/xbzrle/encode_decode_overflow",
-                    test_encode_decode_overflow);
+                    test_encode_decode_overflow_range);
     g_test_add_func("/xbzrle/encode_decode", test_encode_decode);
+    g_test_add_func("/xbzrle/encode_decode_random", test_encode_decode_random);
 
     return g_test_run();
 }
-- 
2.25.1


