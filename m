Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E54A8A6B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:42:47 +0100 (CET)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg86-000548-QT
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzk-0004n7-6c
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:08 -0500
Received: from [2a00:1450:4864:20::62f] (port=42766
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzh-0008Er-MY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:07 -0500
Received: by mail-ej1-x62f.google.com with SMTP id m4so11020097ejb.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ry6LL0bKpcrkCS2cgM8W7MJUh+QXnhadtGtNpHWMkLo=;
 b=k/VfejHhhAx7bB9Gll1FOsSblX8ZGnlt2PD0T/JJJjAwhaWTYC5u+0nBRCKLJT1715
 KpaFlmBmBki4+ypm38FKx4IPSybOI8wzBMgIqMDxbrG7MfILpuvovybb5bQcmKPqUOKf
 MK8g9eiwSfnDquxxdnHguePLFXr4R5lf2JOPN0eiD/cx4MvYQx8bzcfcwOS46k/DbBk5
 7nva/umPjG5uJJN7LXpAezTsMg5mZ6EsRzKubDNfAVH6PkrqQj7//SZgnXDqcRQUMytY
 pbEexHvG3A4qIxbZvbIGClbneGswaLwmfMSmVT6WIHmg1Ubr63wpE+nmmTmcKG2m5C4V
 MeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ry6LL0bKpcrkCS2cgM8W7MJUh+QXnhadtGtNpHWMkLo=;
 b=JbfKP4UVH+dnfDjQgWTbZ6msUA8tWCozvRv30D0FEJ/icPiyQAPDrt3BOd13tLlj4O
 0hAR86Omt5mSBnswl90KyyVXEdMqvUUWRV2r9kxJYIDTAbEuXJKfkKW+A8HTk8BGS/9/
 abOqe3A+GoQx8TvWiT0JunPspl9LHZriH9WcO8mEDbNTft4D+zQamCpqRpw/N7o3Tx+H
 yVK6ExIcucurg+3t3xhj8wwhcec11V4/zFQFHE4egkSPRmVD460z0jOOfWnW8oIy+34K
 1n5za58fY/+eDyYlTFrMr37KS9zcpCWuHXNWV36qOGYDQPn+uVttPyG8lz9iapoxFIWp
 Pijg==
X-Gm-Message-State: AOAM533FhElGeolqJx8pF/Z9uPcKNDVFHhRr2UrwFzg5s4jGL0aLXXVN
 DgfFWe6dJpcjnXeiFmDXfApwTFA02mc=
X-Google-Smtp-Source: ABdhPJxPoXiAcK6WvsrwqW6Tk7SYRUJ4RplOdfJWVtXyzFSNoGtCbmbdokGqIYLj6P976wUvM/004Q==
X-Received: by 2002:a17:907:7f1a:: with SMTP id
 qf26mr24304812ejc.20.1643909644225; 
 Thu, 03 Feb 2022 09:34:04 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/27] configure, meson: move membarrier test to meson
Date: Thu,  3 Feb 2022 18:33:36 +0100
Message-Id: <20220203173359.292068-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
index ebac59652b..9dc0d79b0e 100755
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
@@ -1396,7 +1391,6 @@ cat << EOF
   lto             Enable Link-Time Optimization.
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-  membarrier      membarrier system call (for Linux 4.14+ or Windows)
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vhost-net       vhost-net kernel acceleration support
@@ -2844,37 +2838,6 @@ if test "$fortify_source" != "no"; then
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
@@ -3336,9 +3299,6 @@ fi
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
index 123121924e..16f7563360 100644
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
@@ -3335,7 +3355,7 @@ summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
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
index a5cbe0ea00..61716e827c 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -66,6 +66,7 @@ meson_options_help() {
   printf "%s\n" '  lzfse           lzfse support for DMG images'
   printf "%s\n" '  lzo             lzo compression support'
   printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory optimization'
+  printf "%s\n" '  membarrier      membarrier system call (for Linux 4.14+ or Windows'
   printf "%s\n" '  mpath           Multipath persistent reservation passthrough'
   printf "%s\n" '  multiprocess    Out of process device emulation support'
   printf "%s\n" '  netmap          netmap network backend support'
@@ -207,6 +208,8 @@ _meson_option_parse() {
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



