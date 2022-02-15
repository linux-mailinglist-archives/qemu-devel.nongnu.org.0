Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6894B681E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:47:40 +0100 (CET)
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuQt-0002Ef-8I
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCN-0004HP-FJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:39 -0500
Received: from [2a00:1450:4864:20::636] (port=43848
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCL-0008Rt-5y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:39 -0500
Received: by mail-ej1-x636.google.com with SMTP id d10so42876866eje.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zhzbJ767n7/0p+5JsD4NIlyqO+FKtLZx4tLmECyeVwc=;
 b=dQRvWbE/z8RVlhicxZK71Im8UDr/v6jne9JKskYRXMY2tNtdfxhSGQzqppX7qyOEx6
 tLVzu5bcyQRD/BxWA3KOPEswvZg08V31ZcZslrKMEFmy8wWO39nd+k+WvsZnHFTQgNzD
 N1izVnRj4K7omYKbyszy2j/F9EJRMSE2ksmJxVTu2wYASu0DYVte6YeUSzqJL063LSxv
 6Kgzf79khUSESf0wZs2zPGvSgLhaPC3+6gAG8qmeuze+f98U1eedf+gGwq+zFV8rlrXn
 EqKNs7esyOD+sp0XXWEb12eDY95PK5Tv4jH+I8xoHy4EZnzjMAwoz0DQjJEFWRmoc8Jq
 SCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zhzbJ767n7/0p+5JsD4NIlyqO+FKtLZx4tLmECyeVwc=;
 b=4dmylJBL0TMoMnijSBziF274xnJecEnWkAnMvx8CvJbsgyZ+gcwVaQ5N6RxNwpx0KW
 niVZqRY0CpQtBougFs/ul5RlmJNh1jCUiySL9APsdJV+mtZyCqxZDMl40aS3mCh7IhZv
 i6NX6Y4RCOvQMjQuJED+ztPFmRQeOA6mRKbACNt93CA/ZLNtpW775assaEoZmNtPsNAp
 V0xF7+3pYh3Zg3lTLxKEwVoCQd4ohbjgVrsKYPUYJC7ruIkk2z/cq7TuAX3+HnHmpWBW
 n9kEubagu/3JcO+DwaISDiXA8XmWLH3fF4cuQSVeDEW98TVNpa9zgMN0yd3zTqxUQbzf
 lZQA==
X-Gm-Message-State: AOAM533HKMTS4kFXUGa6tQ4Ph4gl5zkYV+GpCUrULbs/5TrEFQv/fxZd
 3nLb/R4pAbPP2Cs5tFK5ywANdEGyKl8=
X-Google-Smtp-Source: ABdhPJxGOPf2ovDTaDWQd9C/RJl+M2arwavjZzXfVxsvX74HbXKDDnf2I8lP8VlB+hQdqQxrtfy6TA==
X-Received: by 2002:a17:906:73cc:: with SMTP id
 n12mr2212998ejl.459.1644917555856; 
 Tue, 15 Feb 2022 01:32:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] configure,
 meson: move coroutine options to meson_options.txt
Date: Tue, 15 Feb 2022 10:32:09 +0100
Message-Id: <20220215093223.110827-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 31 -------------------------------
 meson.build                   | 11 +++++++++--
 meson_options.txt             |  4 ++++
 scripts/meson-buildoptions.sh |  7 +++++++
 4 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index 5a4a642846..1cc836ee55 100755
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
@@ -1258,8 +1250,6 @@ Advanced options (experts only):
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
-  --enable-debug-stack-usage
-                           track the maximum stack usage of stacks created by qemu_alloc_stack
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -1289,7 +1279,6 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  coroutine-pool  coroutine freelist (better performance)
   opengl          opengl support
   tools           build qemu-io, qemu-nbd and qemu-img tools
   gio             libgio support
@@ -2498,17 +2487,6 @@ else
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
 
@@ -3102,15 +3080,6 @@ if [ "$bsd" = "yes" ] ; then
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
index 8fc23df33d..79ceff64a7 100644
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
@@ -3403,7 +3410,7 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        have_membarrier}
-summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
+summary_info += {'debug stack usage': get_option('debug_stack_usage')}
 summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
@@ -3471,7 +3478,7 @@ summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
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
index a2d6f34b21..9a6e53a2e7 100644
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
@@ -164,6 +167,8 @@ _meson_option_parse() {
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
+    --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=true ;;
+    --disable-coroutine-pool) printf "%s" -Dcoroutine_pool=false ;;
     --enable-crypto-afalg) printf "%s" -Dcrypto_afalg=enabled ;;
     --disable-crypto-afalg) printf "%s" -Dcrypto_afalg=disabled ;;
     --enable-curl) printf "%s" -Dcurl=enabled ;;
@@ -174,6 +179,8 @@ _meson_option_parse() {
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



