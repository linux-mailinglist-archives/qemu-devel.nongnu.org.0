Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8C4A8A3C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:38:06 +0100 (CET)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg3Z-0007sK-4H
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzj-0004ms-WB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:08 -0500
Received: from [2a00:1450:4864:20::52c] (port=37559
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzh-0008El-6V
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:07 -0500
Received: by mail-ed1-x52c.google.com with SMTP id c24so7629437edy.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikMwDyDVLO+cWRc3IGkvymgTBa1JT8ifSYvwRBGFStQ=;
 b=ZODJ00DNCU+rZoS18Il3B5RZCDMh0hq5vEx5C0QfYhh2SOyN+xae/O7aDyI2biVF5r
 WDoh2QO3UhGtTjEtm6ytqdIYAVnZnbFIn2UuQm7MEaLo7PJIBbPXizMLUxyNNpujjXN+
 udb13x6sJItF3ggaY48gZ4Pe6rfe9/bmpQIBjfjk1nVmTdmjfoXR1LT34bicKkOFSMpk
 4oIvP+Z5NmzM+1mwbW+dSgkd9HtwT79sivec3/lIHfmvJkJorwPb0saqKQtV2lHqFUix
 ToqVtCzyKQ72zEbGVeKdCdWOZ0wU1qG8rRM9K6Az70s+achav6ZFnBTSrQZmhHgIHaxG
 Z1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ikMwDyDVLO+cWRc3IGkvymgTBa1JT8ifSYvwRBGFStQ=;
 b=ePCI7XU8nzp4NkvcC6Le9iqV5zdUQe9yNrwSG5bJAtHgbM4vY6jZAojT8MgrJnyOyL
 GTNG4uZa3+wE+tzYuEiYZrS5b9Jbs4U8F8gojn37Afir4j2cR/aHIFD1wsBVUU9MKkwe
 hBPB7lA+Sm/fCepKvtKdP5A0m0KA5S5Hv4MFsqm41K/Uqjui80pSFLho/Kqzs6/67iea
 krkUwLObaGVQi37XSvDPVNNqnmOkrwtrfI8uJEhibqSNCn94elz1+jNVPBHGeToE9P0Z
 Wd1/2VrSCCzeESGseOrkdafC3n7OpYWpuUytKIsRrenXkl2w6LFjoX4WDkxcd+GF6hyK
 j2QA==
X-Gm-Message-State: AOAM5333gEs3C2mGeHGmoAtktDkVAYAv8RuxXCeNEGvUP6pyveEt9sUQ
 daZIx+Uk+6498Rpa0DWfmBiAb2qPqJE=
X-Google-Smtp-Source: ABdhPJwSi8r1iKegsNCX6E3lfdlN0C8XvdS0tp7hKAur8NOmk9C5mZtTn8ILhp7LVso6wn8vNCGA+w==
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr35880984edb.6.1643909643578; 
 Thu, 03 Feb 2022 09:34:03 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/27] configure, meson: move AVX tests to meson
Date: Thu,  3 Feb 2022 18:33:35 +0100
Message-Id: <20220203173359.292068-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For consistency with other tests, --enable-avx2 and --enable-avx512f
fail to compile on x86 systems if cpuid.h is not available.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 103 ----------------------------------
 meson.build                   |  50 ++++++++++++++++-
 meson_options.txt             |   4 ++
 scripts/meson-buildoptions.sh |   6 ++
 4 files changed, 58 insertions(+), 105 deletions(-)

diff --git a/configure b/configure
index e6cfc0e4be..ebac59652b 100755
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
@@ -1420,8 +1410,6 @@ cat << EOF
   coroutine-pool  coroutine freelist (better performance)
   tpm             TPM support
   numa            libnuma support
-  avx2            AVX2 optimization support
-  avx512f         AVX512F optimization support
   replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
@@ -2761,85 +2749,6 @@ else # "$safe_stack" = ""
 fi
 fi
 
-########################################
-# check if cpuid.h is usable.
-
-cat > $TMPC << EOF
-#include <cpuid.h>
-int main(void) {
-    unsigned a, b, c, d;
-    int max = __get_cpuid_max(0, 0);
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
 
@@ -3440,14 +3349,6 @@ if test "$opengl" = "yes" ; then
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
@@ -3480,10 +3381,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
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
index 9ef0286f21..123121924e 100644
--- a/meson.build
+++ b/meson.build
@@ -1762,6 +1762,52 @@ config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
     return getauxval(AT_HWCAP) == 0;
   }'''))
 
+have_cpuid_h = cc.links('''
+  #include <cpuid.h>
+  int main(void) {
+    unsigned a, b, c, d;
+    int max = __get_cpuid_max(0, 0);
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
@@ -3293,8 +3339,8 @@ summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
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
index a4af02c527..a5cbe0ea00 100644
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
@@ -110,6 +112,10 @@ _meson_option_parse() {
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



