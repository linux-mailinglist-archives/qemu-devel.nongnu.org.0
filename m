Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21A4B67BF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:38:06 +0100 (CET)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuHd-00048F-8S
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCG-0003rE-Nb
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:32 -0500
Received: from [2a00:1450:4864:20::52a] (port=33467
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCE-0008Q6-Pz
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:32 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b13so31191825edn.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XVnVeU9E3mpcEroUKHrZf65c5xkFEcPvt7vB9d+yeUw=;
 b=PCMRx5RFcHmOlXyoHR3ZVFjYEUY+wUe30LK6gjNrWTLAVt3UO9P7zKs+h2xPiOaXmC
 MdOFQTPUZi9CZ7fpuaCg5BGnR1U3L0b2D2iNBP2rcfw7j6RUeypV7/6at9UHLq80cJ4Q
 0ETWHPZVNXQHbrkteuFsxvxdUR+FFjPcx7NmtJ2FQ5VBXpbHn2DKxQBR85ikOzGgMxV0
 SBMlTA65fSN8uHw2YeWtN22nxPpJYO/vy6zoROWh8g9qvxin87fPipqAwMM/OJZ3ld4O
 1H850dWvQJnbi0HPLkbVsIh4sK7mZyGgDtaXD4t8apijx83hy7GGD/Ge5A3R5Zi4itOs
 XNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XVnVeU9E3mpcEroUKHrZf65c5xkFEcPvt7vB9d+yeUw=;
 b=6dXLxKktCO+SuG5sYDevDMpl+DO3X12awk7EfvmsXpuBdmUA2eJziYpAAPlcdx1nPZ
 RUlVYLmRdKoPb/Zb47Xk1IblVVc2TFcOB1GgKeLBC0X7sKBCTaRVFdj6s+ruCL1sAOCv
 SfJDnrPwAo296hsT13kczSHTaSSDEfK5RZjPyP1ykXkWur/zwKPJp6Db2sG+iXVvVtzN
 Yc1WdwS9i65Q/fOcIt2FUf/57u+Py0aJJJHq4uWIpDRM6T8kvc+aDyxq4Ghe2xO4qY7O
 73R6SlLTO9f59Uc8nEZd31AjpPiqz0AFR7N7QlIGJBCRSpixjT6/lkUKisU9oexVuV/f
 Ky4Q==
X-Gm-Message-State: AOAM530opR0fMyBmNITNK3S7RnKAulcn5kHD6uUy8f9vN4QCTo7lHN85
 SOsOwgzIBVPVunqAXvXPENWMsUEbQvs=
X-Google-Smtp-Source: ABdhPJz70u6slGtSlA7hOXFdBigQ/C1+C/kinBXevQNUJczSxPKbk073VNfFyi13k84bMGiieJlj2A==
X-Received: by 2002:aa7:dc42:: with SMTP id g2mr2941197edu.410.1644917549425; 
 Tue, 15 Feb 2022 01:32:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] configure, meson: move AVX tests to meson
Date: Tue, 15 Feb 2022 10:31:59 +0100
Message-Id: <20220215093223.110827-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For consistency with other tests, --enable-avx2 and --enable-avx512f
fail to compile on x86 systems if cpuid.h is not available.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 103 ----------------------------------
 meson.build                   |  50 ++++++++++++++++-
 meson_options.txt             |   4 ++
 scripts/meson-buildoptions.sh |   6 ++
 4 files changed, 58 insertions(+), 105 deletions(-)

diff --git a/configure b/configure
index 3a29eff5cc..a6a577277f 100755
--- a/configure
+++ b/configure
@@ -323,8 +323,6 @@ qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
 opengl="$default_feature"
-cpuid_h="no"
-avx2_opt="$default_feature"
 guest_agent="$default_feature"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
@@ -1033,14 +1031,6 @@ for opt do
   ;;
   --disable-tools) want_tools="no"
   ;;
-  --disable-avx2) avx2_opt="no"
-  ;;
-  --enable-avx2) avx2_opt="yes"
-  ;;
-  --disable-avx512f) avx512f_opt="no"
-  ;;
-  --enable-avx512f) avx512f_opt="yes"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -1406,8 +1396,6 @@ cat << EOF
   coroutine-pool  coroutine freelist (better performance)
   tpm             TPM support
   numa            libnuma support
-  avx2            AVX2 optimization support
-  avx512f         AVX512F optimization support
   replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
@@ -2740,85 +2728,6 @@ else # "$safe_stack" = ""
 fi
 fi
 
-########################################
-# check if cpuid.h is usable.
-
-cat > $TMPC << EOF
-#include <cpuid.h>
-int main(void) {
-    unsigned a, b, c, d;
-    unsigned max = __get_cpuid_max(0, 0);
-
-    if (max >= 1) {
-        __cpuid(1, a, b, c, d);
-    }
-
-    if (max >= 7) {
-        __cpuid_count(7, 0, a, b, c, d);
-    }
-
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    cpuid_h=yes
-fi
-
-##########################################
-# avx2 optimization requirement check
-#
-# There is no point enabling this if cpuid.h is not usable,
-# since we won't be able to select the new routines.
-
-if test "$cpuid_h" = "yes" && test "$avx2_opt" != "no"; then
-  cat > $TMPC << EOF
-#pragma GCC push_options
-#pragma GCC target("avx2")
-#include <cpuid.h>
-#include <immintrin.h>
-static int bar(void *a) {
-    __m256i x = *(__m256i *)a;
-    return _mm256_testz_si256(x, x);
-}
-int main(int argc, char *argv[]) { return bar(argv[0]); }
-EOF
-  if compile_object "-Werror" ; then
-    avx2_opt="yes"
-  else
-    avx2_opt="no"
-  fi
-fi
-
-##########################################
-# avx512f optimization requirement check
-#
-# There is no point enabling this if cpuid.h is not usable,
-# since we won't be able to select the new routines.
-# by default, it is turned off.
-# if user explicitly want to enable it, check environment
-
-if test "$cpuid_h" = "yes" && test "$avx512f_opt" = "yes"; then
-  cat > $TMPC << EOF
-#pragma GCC push_options
-#pragma GCC target("avx512f")
-#include <cpuid.h>
-#include <immintrin.h>
-static int bar(void *a) {
-    __m512i x = *(__m512i *)a;
-    return _mm512_test_epi64_mask(x, x);
-}
-int main(int argc, char *argv[])
-{
-	return bar(argv[0]);
-}
-EOF
-  if ! compile_object "-Werror" ; then
-    avx512f_opt="no"
-  fi
-else
-  avx512f_opt="no"
-fi
-
 ########################################
 # check if __[u]int128_t is usable.
 
@@ -3419,14 +3328,6 @@ if test "$opengl" = "yes" ; then
   echo "OPENGL_LIBS=$opengl_libs" >> $config_host_mak
 fi
 
-if test "$avx2_opt" = "yes" ; then
-  echo "CONFIG_AVX2_OPT=y" >> $config_host_mak
-fi
-
-if test "$avx512f_opt" = "yes" ; then
-  echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
-fi
-
 # XXX: suppress that
 if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
@@ -3459,10 +3360,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
 
-if test "$cpuid_h" = "yes" ; then
-  echo "CONFIG_CPUID_H=y" >> $config_host_mak
-fi
-
 if test "$int128" = "yes" ; then
   echo "CONFIG_INT128=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 15dfd66a3e..7a262051b7 100644
--- a/meson.build
+++ b/meson.build
@@ -1762,6 +1762,52 @@ config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
     return getauxval(AT_HWCAP) == 0;
   }'''))
 
+have_cpuid_h = cc.links('''
+  #include <cpuid.h>
+  int main(void) {
+    unsigned a, b, c, d;
+    unsigned max = __get_cpuid_max(0, 0);
+
+    if (max >= 1) {
+        __cpuid(1, a, b, c, d);
+    }
+
+    if (max >= 7) {
+        __cpuid_count(7, 0, a, b, c, d);
+    }
+
+    return 0;
+  }''')
+config_host_data.set('CONFIG_CPUID_H', have_cpuid_h)
+
+config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
+  .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX2') \
+  .require(cc.links('''
+    #pragma GCC push_options
+    #pragma GCC target("avx2")
+    #include <cpuid.h>
+    #include <immintrin.h>
+    static int bar(void *a) {
+      __m256i x = *(__m256i *)a;
+      return _mm256_testz_si256(x, x);
+    }
+    int main(int argc, char *argv[]) { return bar(argv[0]); }
+  '''), error_message: 'AVX2 not available').allowed())
+
+config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
+  .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX512F') \
+  .require(cc.links('''
+    #pragma GCC push_options
+    #pragma GCC target("avx512f")
+    #include <cpuid.h>
+    #include <immintrin.h>
+    static int bar(void *a) {
+      __m512i x = *(__m512i *)a;
+      return _mm512_test_epi64_mask(x, x);
+    }
+    int main(int argc, char *argv[]) { return bar(argv[0]); }
+  '''), error_message: 'AVX512F not available').allowed())
+
 config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
   #include <errno.h>
   #include <sys/types.h>
@@ -3289,8 +3335,8 @@ summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
 summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
 summary_info += {'memory allocator':  get_option('malloc')}
-summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
-summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
+summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
+summary_info += {'avx512f optimization': config_host_data.get('CONFIG_AVX512F_OPT')}
 summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
 summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
diff --git a/meson_options.txt b/meson_options.txt
index 95d527f773..6ff349023c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -68,6 +68,10 @@ option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
+option('avx2', type: 'feature', value: 'auto',
+       description: 'AVX2 optimizations')
+option('avx512f', type: 'feature', value: 'disabled',
+       description: 'AVX512F optimizations')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 48a454cece..dcfc39ec6b 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -26,6 +26,8 @@ meson_options_help() {
   printf "%s\n" '  alsa            ALSA sound support'
   printf "%s\n" '  attr            attr/xattr support'
   printf "%s\n" '  auth-pam        PAM access control'
+  printf "%s\n" '  avx2            AVX2 optimizations'
+  printf "%s\n" '  avx512f         AVX512F optimizations'
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
@@ -109,6 +111,10 @@ _meson_option_parse() {
     --disable-attr) printf "%s" -Dattr=disabled ;;
     --enable-auth-pam) printf "%s" -Dauth_pam=enabled ;;
     --disable-auth-pam) printf "%s" -Dauth_pam=disabled ;;
+    --enable-avx2) printf "%s" -Davx2=enabled ;;
+    --disable-avx2) printf "%s" -Davx2=disabled ;;
+    --enable-avx512f) printf "%s" -Davx512f=enabled ;;
+    --disable-avx512f) printf "%s" -Davx512f=disabled ;;
     --enable-bpf) printf "%s" -Dbpf=enabled ;;
     --disable-bpf) printf "%s" -Dbpf=disabled ;;
     --enable-brlapi) printf "%s" -Dbrlapi=enabled ;;
-- 
2.34.1



