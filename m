Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284694B67D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:40:51 +0100 (CET)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuKI-000138-7d
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:40:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCH-0003uw-Gj
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:33 -0500
Received: from [2a00:1450:4864:20::52a] (port=45811
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCF-0008QG-CI
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:33 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z13so12788773edc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgMyPZYrb3nwjXIR9q8COjU2UhZ4fpa1Lv+L1kHYEeA=;
 b=hWrbhDf7qgwvsF2yURKTQcUs2AR2NYK9eYMDL3+r37tTQZ5L3usKTH6RmXhaRvdNvr
 oA+iKlDOFf7pT8+I0JoP5Acnu0L6H0wSIqSN5/Yd1Z+WO3B2gUzWJv65wlb3mdzOWp5j
 EtkSui/97+zfdj3eGin/6PuRzV4JqRrbluAqEq7MnmPBW0ySkhKT+cibh0WEBGtLjadv
 pi5qDhQMNH6hf1TshkcCmaYZpVubt1gC9OL5c0LIRyHv/2BmdzeRAgUdbdXOedwJDgUB
 V2TXc0kt6iqeJLovd6yEyqBPvywa+QW//QMxeHNjz1se9zJ9ZCb3IaXQ165aObRkxNYx
 7SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lgMyPZYrb3nwjXIR9q8COjU2UhZ4fpa1Lv+L1kHYEeA=;
 b=yhNjTEG02cxAYMxYemOjyex+osu1TTymE36wDJzTIFihudQp8ZboGifJTiTFzd54A4
 QSPKzeQ8S2DIgRZaDU2w1dnZFSy2vRhTkedJ0KaRIBo3cWvJOfzyKfr1GDXzc5ilVkJy
 dqU4B/qZQ3ySS6DiMTxRBXdqfA5/xTvIYMBP27GG2mFV9GCsvvnTMRQBaVsvGVCOEI/L
 CZ1QDCA220Lc2YcxKSvKzXT+DwanyQU9t3LziN5+lu7ejXbiDKhtox0KkVm/uc6dPLOg
 VjfxmD1HOtSLrbAoTiKjVMzbd6gW4Qj/jnkcg6iNrICF6S3ji26+yJ+WAVzgQOsK1UlL
 uD2A==
X-Gm-Message-State: AOAM533+Xtp2zJiFQFIR6Mz9ejEGqY3W4YYnUzkw7VNH0/23S/9q8S7o
 GEND4byFNpESrZCylh/ed4UGVm1cMio=
X-Google-Smtp-Source: ABdhPJzu1t14nGQWGn/D7Q+jpHGPkg41BNm4Dsp5Z2VZLop6NbXHjl963SSTg9GFrVlYC4vLoLqj3g==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr2957229edc.320.1644917550078; 
 Tue, 15 Feb 2022 01:32:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] configure, meson: move membarrier test to meson
Date: Tue, 15 Feb 2022 10:32:00 +0100
Message-Id: <20220215093223.110827-8-pbonzini@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test is a bit different from the others, in that it does not run
if $membarrier is empty.  For meson, the default can simply be disabled;
if one day we will toggle the default, no change is needed in meson.build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 40 -----------------------------------
 meson.build                   | 22 ++++++++++++++++++-
 meson_options.txt             |  6 ++++++
 scripts/meson-buildoptions.sh |  3 +++
 util/meson.build              |  4 +++-
 5 files changed, 33 insertions(+), 42 deletions(-)

diff --git a/configure b/configure
index a6a577277f..c49797012d 100755
--- a/configure
+++ b/configure
@@ -290,7 +290,6 @@ EXTRA_CXXFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
-membarrier="$default_feature"
 vhost_kernel="$default_feature"
 vhost_net="$default_feature"
 vhost_crypto="$default_feature"
@@ -967,10 +966,6 @@ for opt do
   ;;
   --enable-fdt=*) fdt="$optarg"
   ;;
-  --disable-membarrier) membarrier="no"
-  ;;
-  --enable-membarrier) membarrier="yes"
-  ;;
   --with-pkgversion=*) pkgversion="$optarg"
   ;;
   --with-coroutine=*) coroutine="$optarg"
@@ -1382,7 +1377,6 @@ cat << EOF
   lto             Enable Link-Time Optimization.
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-  membarrier      membarrier system call (for Linux 4.14+ or Windows)
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vhost-net       vhost-net kernel acceleration support
@@ -2823,37 +2817,6 @@ if test "$fortify_source" != "no"; then
   fi
 fi
 
-##########################################
-# check for usable membarrier system call
-if test "$membarrier" = "yes"; then
-    have_membarrier=no
-    if test "$mingw32" = "yes" ; then
-        have_membarrier=yes
-    elif test "$linux" = "yes" ; then
-        cat > $TMPC << EOF
-    #include <linux/membarrier.h>
-    #include <sys/syscall.h>
-    #include <unistd.h>
-    #include <stdlib.h>
-    int main(void) {
-        syscall(__NR_membarrier, MEMBARRIER_CMD_QUERY, 0);
-        syscall(__NR_membarrier, MEMBARRIER_CMD_SHARED, 0);
-	exit(0);
-    }
-EOF
-        if compile_prog "" "" ; then
-            have_membarrier=yes
-        fi
-    fi
-    if test "$have_membarrier" = "no"; then
-      feature_not_found "membarrier" "membarrier system call not available"
-    fi
-else
-    # Do not enable it by default even for Mingw32, because it doesn't
-    # work on Wine.
-    membarrier=no
-fi
-
 ##########################################
 # check for usable AF_ALG environment
 have_afalg=no
@@ -3315,9 +3278,6 @@ fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
-if test "$membarrier" = "yes" ; then
-  echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
-fi
 if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
   echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 7a262051b7..6dc38a7916 100644
--- a/meson.build
+++ b/meson.build
@@ -1808,6 +1808,26 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
     int main(int argc, char *argv[]) { return bar(argv[0]); }
   '''), error_message: 'AVX512F not available').allowed())
 
+if get_option('membarrier').disabled()
+  have_membarrier = false
+elif targetos == 'windows'
+  have_membarrier = true
+elif targetos == 'linux'
+  have_membarrier = cc.compiles('''
+    #include <linux/membarrier.h>
+    #include <sys/syscall.h>
+    #include <unistd.h>
+    #include <stdlib.h>
+    int main(void) {
+        syscall(__NR_membarrier, MEMBARRIER_CMD_QUERY, 0);
+        syscall(__NR_membarrier, MEMBARRIER_CMD_SHARED, 0);
+        exit(0);
+    }''')
+endif
+config_host_data.set('CONFIG_MEMBARRIER', get_option('membarrier') \
+  .require(have_membarrier, error_message: 'membarrier system call not available') \
+  .allowed())
+
 config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
   #include <errno.h>
   #include <sys/types.h>
@@ -3331,7 +3351,7 @@ summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
-summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
+summary_info += {'membarrier':        have_membarrier}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
 summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
 summary_info += {'memory allocator':  get_option('malloc')}
diff --git a/meson_options.txt b/meson_options.txt
index 6ff349023c..49f14f960e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -68,6 +68,12 @@ option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
+
+# Do not enable it by default even for Mingw32, because it doesn't
+# work on Wine.
+option('membarrier', type: 'feature', value: 'disabled',
+       description: 'membarrier system call (for Linux 4.14+ or Windows')
+
 option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')
 option('avx512f', type: 'feature', value: 'disabled',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index dcfc39ec6b..c204ede02b 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -65,6 +65,7 @@ meson_options_help() {
   printf "%s\n" '  lzfse           lzfse support for DMG images'
   printf "%s\n" '  lzo             lzo compression support'
   printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory optimization'
+  printf "%s\n" '  membarrier      membarrier system call (for Linux 4.14+ or Windows'
   printf "%s\n" '  mpath           Multipath persistent reservation passthrough'
   printf "%s\n" '  multiprocess    Out of process device emulation support'
   printf "%s\n" '  netmap          netmap network backend support'
@@ -204,6 +205,8 @@ _meson_option_parse() {
     --enable-malloc=*) quote_sh "-Dmalloc=$2" ;;
     --enable-malloc-trim) printf "%s" -Dmalloc_trim=enabled ;;
     --disable-malloc-trim) printf "%s" -Dmalloc_trim=disabled ;;
+    --enable-membarrier) printf "%s" -Dmembarrier=enabled ;;
+    --disable-membarrier) printf "%s" -Dmembarrier=disabled ;;
     --enable-mpath) printf "%s" -Dmpath=enabled ;;
     --disable-mpath) printf "%s" -Dmpath=disabled ;;
     --enable-multiprocess) printf "%s" -Dmultiprocess=enabled ;;
diff --git a/util/meson.build b/util/meson.build
index c9a9cc1cf5..3736988b9f 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -35,7 +35,9 @@ util_ss.add(files('crc32c.c'))
 util_ss.add(files('uuid.c'))
 util_ss.add(files('getauxval.c'))
 util_ss.add(files('rcu.c'))
-util_ss.add(when: 'CONFIG_MEMBARRIER', if_true: files('sys_membarrier.c'))
+if have_membarrier
+  util_ss.add(files('sys_membarrier.c'))
+endif
 util_ss.add(files('log.c'))
 util_ss.add(files('pagesize.c'))
 util_ss.add(files('qdist.c'))
-- 
2.34.1



