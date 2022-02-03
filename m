Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F474A8B02
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:56:11 +0100 (CET)
Received: from localhost ([::1]:40162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgL3-0000bv-VA
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-00053C-Vp
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:46 -0500
Received: from [2a00:1450:4864:20::630] (port=37653
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzn-0008Gt-Vr
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:13 -0500
Received: by mail-ej1-x630.google.com with SMTP id ah7so10955241ejc.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ha8wvjU9CxQ0aoj2lI8t3nc2LsyfSuXCud//Z7L9c0I=;
 b=UiyB9MzKM3TGksOqZpsFKY2tSY9kV8uHddRzkCFyVbyGyV+EcFem89ncCh4jIAdyD4
 wGI8e0SKTWrOC9/yWqyhfOsGr0gBzxQRtbRSrYSGKZXpDBY/UpQwraD9IVhqlTi4L898
 Cwx+GEbYize8fM8oKGSKLgVLAGT9P2BvejDW0YLxOMWtbraTQen4VJRcWPbf2o2jLArh
 iQL5wZd6PMwOX7LOF+sVZm1dnieSVENTMOGbGmnBY2NnDLqvXWsZEfwhTFiojE+RiFWL
 qvvEpVnbggSPKZ0ZmHKIHOLgJxghROwev241+SDj7I1Q6jEmCUzYebZWPBuOMbfD2zsK
 x3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ha8wvjU9CxQ0aoj2lI8t3nc2LsyfSuXCud//Z7L9c0I=;
 b=viHDOXo46NvJfw6Hx8/vlmUPph/A/mgW4ya6xpisFiT1b2yFp+3iVP7N5WbtCAJBf4
 AQO2J8rTOSP0thVZkfXnwWZfcXsVcPnoJm13sz41s+LyhucFdzzpJX5FhOGAfyGaF89O
 986BX0SudzHtSNN70/xM2WI7g/JeCrlbzLi1ul8P1M6lJ7G5beOaVzY6mpx7mrfdkUeo
 2NMSOxiuxOuKqWAbrNTpr2E2CB2DcUcHqmzwAHG/cBPw0CSBE0+pgnuzTQjHuo/ozX7j
 iPVJjXSGb1w77eBmo7mObJ6PZOgLzvLufx1vhDk0AIA+c60Vdjq1QfExA7SpVOJdKQ0V
 qO4w==
X-Gm-Message-State: AOAM531pxYvOxaJXMvXAxOGZq1/jg24HCyo4rSSXZrOfbyTaClUwjo9E
 t9VcgvjTnOAMbGXKinDF7Fa1ofVqku0=
X-Google-Smtp-Source: ABdhPJyLHOyXroIgynjtKCpGwfdML0ZITj7QKhD3Hi21JuLkPx8hseuNho0aPqEQbW/PAYFQpFqSqg==
X-Received: by 2002:a17:907:6e1a:: with SMTP id
 sd26mr29225684ejc.270.1643909650644; 
 Thu, 03 Feb 2022 09:34:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/27] configure,
 meson: move coroutine options to meson_options.txt
Date: Thu,  3 Feb 2022 18:33:45 +0100
Message-Id: <20220203173359.292068-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 31 -------------------------------
 meson.build                   | 11 +++++++++--
 meson_options.txt             |  4 ++++
 scripts/meson-buildoptions.sh |  7 +++++++
 4 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index a3aefb99c2..dda586cc69 100755
--- a/configure
+++ b/configure
@@ -322,8 +322,6 @@ vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
 coroutine=""
-coroutine_pool="$default_feature"
-debug_stack_usage="no"
 tls_priority="NORMAL"
 plugins="$default_feature"
 secret_keyring="$default_feature"
@@ -937,12 +935,6 @@ for opt do
   ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
-  --disable-coroutine-pool) coroutine_pool="no"
-  ;;
-  --enable-coroutine-pool) coroutine_pool="yes"
-  ;;
-  --enable-debug-stack-usage) debug_stack_usage="yes"
-  ;;
   --disable-vhost-net) vhost_net="no"
   ;;
   --enable-vhost-net) vhost_net="yes"
@@ -1272,8 +1264,6 @@ Advanced options (experts only):
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
-  --enable-debug-stack-usage
-                           track the maximum stack usage of stacks created by qemu_alloc_stack
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -1303,7 +1293,6 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  coroutine-pool  coroutine freelist (better performance)
   opengl          opengl support
   tools           build qemu-io, qemu-nbd and qemu-img tools
   gio             libgio support
@@ -2519,17 +2508,6 @@ else
   esac
 fi
 
-if test "$coroutine_pool" = ""; then
-  coroutine_pool=yes
-fi
-
-if test "$debug_stack_usage" = "yes"; then
-  if test "$coroutine_pool" = "yes"; then
-    echo "WARN: disabling coroutine pool for stack usage debugging"
-    coroutine_pool=no
-  fi
-fi
-
 ##################################################
 # SafeStack
 
@@ -3123,15 +3101,6 @@ if [ "$bsd" = "yes" ] ; then
 fi
 
 echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
-if test "$coroutine_pool" = "yes" ; then
-  echo "CONFIG_COROUTINE_POOL=1" >> $config_host_mak
-else
-  echo "CONFIG_COROUTINE_POOL=0" >> $config_host_mak
-fi
-
-if test "$debug_stack_usage" = "yes" ; then
-  echo "CONFIG_DEBUG_STACK_USAGE=y" >> $config_host_mak
-fi
 
 if test "$have_asan_iface_fiber" = "yes" ; then
     echo "CONFIG_ASAN_IFACE_FIBER=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 610a6d4a77..e44f8bf750 100644
--- a/meson.build
+++ b/meson.build
@@ -1548,7 +1548,14 @@ config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 'big')
 
+have_coroutine_pool = get_option('coroutine_pool')
+if get_option('debug_stack_usage') and have_coroutine_pool
+  message('Disabling coroutine pool to measure stack usage')
+  have_coroutine_pool = false
+endif
+config_host_data.set10('CONFIG_COROUTINE_POOL', have_coroutine_pool)
 config_host_data.set('CONFIG_DEBUG_MUTEX', get_option('debug_mutex'))
+config_host_data.set('CONFIG_DEBUG_STACK_USAGE', get_option('debug_stack_usage'))
 config_host_data.set('CONFIG_GPROF', get_option('gprof'))
 config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
 config_host_data.set('CONFIG_QOM_CAST_DEBUG', get_option('qom_cast_debug'))
@@ -3407,7 +3414,7 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        have_membarrier}
-summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
+summary_info += {'debug stack usage': get_option('debug_stack_usage')}
 summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
@@ -3475,7 +3482,7 @@ summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 # Block layer
 summary_info = {}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
-summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
+summary_info += {'coroutine pool':    have_coroutine_pool}
 if have_block
   summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
   summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
diff --git a/meson_options.txt b/meson_options.txt
index 781e4d5170..03ae957102 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -246,8 +246,12 @@ option('block_drv_whitelist_in_tools', type: 'boolean', value: false,
        description: 'use block whitelist also in tools instead of only QEMU')
 option('rng_none', type: 'boolean', value: false,
        description: 'dummy RNG, avoid using /dev/(u)random and getrandom()')
+option('coroutine_pool', type: 'boolean', value: true,
+       description: 'coroutine freelist (better performance)')
 option('debug_mutex', type: 'boolean', value: false,
        description: 'mutex debugging support')
+option('debug_stack_usage', type: 'boolean', value: false,
+       description: 'measure coroutine stack usage')
 option('qom_cast_debug', type: 'boolean', value: false,
        description: 'cast debugging support')
 option('gprof', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index e3e5167fb9..74bc6458d4 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -8,7 +8,10 @@ meson_options_help() {
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
+  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
+  printf "%s\n" '  --enable-debug-stack-usage'
+  printf "%s\n" '                           measure coroutine stack usage'
   printf "%s\n" '  --enable-fdt[=CHOICE]    Whether and how to find the libfdt library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
@@ -165,6 +168,8 @@ _meson_option_parse() {
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
+    --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=true ;;
+    --disable-coroutine-pool) printf "%s" -Dcoroutine_pool=false ;;
     --enable-crypto-afalg) printf "%s" -Dcrypto_afalg=enabled ;;
     --disable-crypto-afalg) printf "%s" -Dcrypto_afalg=disabled ;;
     --enable-curl) printf "%s" -Dcurl=enabled ;;
@@ -175,6 +180,8 @@ _meson_option_parse() {
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
     --enable-debug-mutex) printf "%s" -Ddebug_mutex=true ;;
     --disable-debug-mutex) printf "%s" -Ddebug_mutex=false ;;
+    --enable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=true ;;
+    --disable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=false ;;
     --enable-dmg) printf "%s" -Ddmg=enabled ;;
     --disable-dmg) printf "%s" -Ddmg=disabled ;;
     --enable-docs) printf "%s" -Ddocs=enabled ;;
-- 
2.34.1



