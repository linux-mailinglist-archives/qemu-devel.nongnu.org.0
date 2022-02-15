Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C964B6863
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:00:49 +0100 (CET)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJudc-0006rx-UU
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:00:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCU-0004ZK-1T
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:46 -0500
Received: from [2a00:1450:4864:20::636] (port=42837
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCR-0008U7-8p
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:45 -0500
Received: by mail-ej1-x636.google.com with SMTP id hw13so14355234ejc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3qbl9Xo8xHu5lXB1Jbn7zsUkdB0YWZ+ivvO8wTe+Ao=;
 b=ZBh0HaQOUlt1hqOJf2C5Ua62dMf7P5CPPNobH/wuCspAhnHQetTZlFLsOhZhfEylGt
 XdgYLG4mym9SZ5nSaaUrd/60VcvjwLt6S0q6741Z1cKsTl3qdnLIIzQU5UoSKrU/6f0U
 +Bg6vYSbWPsGnQqHlkj2Y4Z6RBT2Z5p9vIg4G55jCPotnsvUeHjHL4BUYXq8o/r/gsn/
 SiyaugGq0zq3Sm8NI/r+Y37HZHGHJUvf+V6chh011U/FquujrL3Bj2mCRhAPghY9SfFZ
 urf1yTw7GiLTvdtGxufKBalY40qQk3aBs5xnR3FcWroHvjPGDda5k+HUgy+8ZmHZQf2W
 rA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C3qbl9Xo8xHu5lXB1Jbn7zsUkdB0YWZ+ivvO8wTe+Ao=;
 b=7ncDOwBT8APgLcKpsA2SQoTCpI3+Cu9aQlle6IyDmDmQ1oiEfX2NdYRzPGlXexsopO
 KLf7hfEEVsjeIOcD53w8dCdemoOuhqe85Dcg8F7pqLAhGxSvS2wcJKzd94UUCg/oAFfJ
 s8DNzDhw8qtsNFHmHDYV1QJVCWT43Rh1UUxby32AoH6QrWyvq9FD0aR8jFcmQE9y6P9D
 /T0dwmLLBTxav+VaAmJ7IS2L3G1Uw55xp6iECdXK2GxF8MWDPGytxDKZt/9S8xoQjC17
 JudOUcP4mYRb6y8SrxXF2kAstv5WWFiTYpbvF69Mm3CaCKxw7Bjj10qCtfHfl1OyZ21E
 YaSQ==
X-Gm-Message-State: AOAM530SB1xqXQvsAefCV4127Z/7sIFmzg2L0JK7fomTEDZFbWyWvxAW
 R3eu9/RaLq0yn7jy910CGM1IbOATkyc=
X-Google-Smtp-Source: ABdhPJyik8DoMyjm/pR2RA5cMfzSIZxlzgnl77v8Be6pukuTiaR1w37SNGNHhEy4HlWA8wSFe0KJNA==
X-Received: by 2002:a17:906:9be4:: with SMTP id
 de36mr2205055ejc.228.1644917561894; 
 Tue, 15 Feb 2022 01:32:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] configure,
 meson: replace VSS SDK checks and options with --enable-vss-sdk
Date: Tue, 15 Feb 2022 10:32:18 +0100
Message-Id: <20220215093223.110827-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The VSS headers are part of standard MS VS SDK, at least since version
15, and probably before that.

They are also included with MinGW, although currently broken.

Let's streamline a bit the options, by not making it so special, and
instead rely on proper system headers configuration or user
--extra-cxxflags. This still requires some extra step to cross-build
with MinGW as described in the meson.build file now.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[Use a "feature"-type option. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 47 -----------------------------------
 meson.build                   | 10 +++++++-
 meson_options.txt             |  2 ++
 qga/meson.build               | 21 ++++++++++++++--
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 33 insertions(+), 50 deletions(-)

diff --git a/configure b/configure
index 20968ca7ac..a518f51cef 100755
--- a/configure
+++ b/configure
@@ -316,7 +316,6 @@ pkgversion=""
 pie=""
 trace_backends="log"
 trace_file="trace"
-vss_win32_sdk="$default_feature"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
@@ -952,12 +951,6 @@ for opt do
   ;;
   --disable-zlib-test)
   ;;
-  --with-vss-sdk) vss_win32_sdk=""
-  ;;
-  --with-vss-sdk=*) vss_win32_sdk="$optarg"
-  ;;
-  --without-vss-sdk) vss_win32_sdk="no"
-  ;;
   --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
       echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&2
   ;;
@@ -1220,8 +1213,6 @@ Advanced options (experts only):
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
-  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
-  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
   --enable-plugins
                            enable plugins via shared library loading
@@ -2277,41 +2268,6 @@ EOF
   fi
 fi
 
-##########################################
-# check if we have VSS SDK headers for win
-
-guest_agent_with_vss="no"
-if test "$mingw32" = "yes" && \
-        test "$vss_win32_sdk" != "no" ; then
-  case "$vss_win32_sdk" in
-    "")   vss_win32_include="-isystem $source_path" ;;
-    *\ *) # The SDK is installed in "Program Files" by default, but we cannot
-          # handle path with spaces. So we symlink the headers into ".sdk/vss".
-          vss_win32_include="-isystem $source_path/.sdk/vss"
-	  symlink "$vss_win32_sdk/inc" "$source_path/.sdk/vss/inc"
-	  ;;
-    *)    vss_win32_include="-isystem $vss_win32_sdk"
-  esac
-  cat > $TMPC << EOF
-#define __MIDL_user_allocate_free_DEFINED__
-#include <inc/win2003/vss.h>
-int main(void) { return VSS_CTX_BACKUP; }
-EOF
-  if compile_prog "$vss_win32_include" "" ; then
-    guest_agent_with_vss="yes"
-    QEMU_CFLAGS="$QEMU_CFLAGS $vss_win32_include"
-  else
-    if test "$vss_win32_sdk" != "" ; then
-      echo "ERROR: Please download and install Microsoft VSS SDK:"
-      echo "ERROR:   http://www.microsoft.com/en-us/download/details.aspx?id=23490"
-      echo "ERROR: On POSIX-systems, you can extract the SDK headers by:"
-      echo "ERROR:   scripts/extract-vsssdk-headers setup.exe"
-      echo "ERROR: The headers are extracted in the directory \`inc'."
-      feature_not_found "VSS support"
-    fi
-  fi
-fi
-
 ##########################################
 # check if mingw environment provides a recent ntddscsi.h
 guest_agent_ntddscsi="no"
@@ -2841,9 +2797,6 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  if test "$guest_agent_with_vss" = "yes" ; then
-    echo "CONFIG_QGA_VSS=y" >> $config_host_mak
-  fi
   if test "$guest_agent_ntddscsi" = "yes" ; then
     echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
   fi
diff --git a/meson.build b/meson.build
index 96d64ec28f..39126d1cc6 100644
--- a/meson.build
+++ b/meson.build
@@ -1932,6 +1932,14 @@ config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
     return -1;
   }'''))
 
+have_vss = false
+if targetos == 'windows' and link_language == 'cpp'
+  have_vss = cxx.compiles('''
+    #define __MIDL_user_allocate_free_DEFINED__
+    #include <inc/win2003/vss.h>
+    int main(void) { return VSS_CTX_BACKUP; }''')
+endif
+
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
@@ -3598,7 +3606,7 @@ summary_info += {'libiscsi support':  libiscsi}
 summary_info += {'libnfs support':    libnfs}
 if targetos == 'windows'
   if have_ga
-    summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
+    summary_info += {'QGA VSS support':   have_qga_vss}
     summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
   endif
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 417b543314..aad337592d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -42,6 +42,8 @@ option('guest_agent_msi', type : 'feature', value : 'auto',
        description: 'Build MSI package for the QEMU Guest Agent')
 option('tools', type : 'feature', value : 'auto',
        description: 'build support utilities that come with QEMU')
+option('qga_vss', type : 'feature', value: 'auto',
+       description: 'build QGA VSS support (broken with MinGW)')
 
 option('malloc_trim', type : 'feature', value : 'auto',
        description: 'enable libc malloc_trim() for memory optimization')
diff --git a/qga/meson.build b/qga/meson.build
index 97cc391fe1..a32c141dd0 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -2,9 +2,26 @@ if not have_ga
   if get_option('guest_agent_msi').enabled()
     error('Guest agent MSI requested, but the guest agent is not being built')
   endif
+  have_qga_vss = false
   subdir_done()
 endif
 
+have_qga_vss = get_option('qga_vss') \
+  .require(targetos == 'windows',
+           error_message: 'VSS support requires Windows') \
+  .require(link_language == 'cpp',
+           error_message: 'VSS support requires a C++ compiler') \
+  .require(have_vss, error_message: '''VSS support requires VSS headers.
+    If your Visual Studio installation doesn't have the VSS headers,
+    Please download and install Microsoft VSS SDK:
+    http://www.microsoft.com/en-us/download/details.aspx?id=23490
+    On POSIX-systems, MinGW doesn't yet provide working headers.
+    you can extract the SDK headers by:
+    $ scripts/extract-vsssdk-headers setup.exe
+    The headers are extracted in the directory 'inc/win2003'.
+    Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc/win2003"''') \
+  .allowed()
+
 all_qga = []
 
 qga_qapi_outputs = [
@@ -63,7 +80,7 @@ gen_tlb = []
 qga_libs = []
 if targetos == 'windows'
   qga_libs += ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32', '-lwininet', '-liphlpapi', '-lnetapi32']
-  if 'CONFIG_QGA_VSS' in config_host
+  if have_qga_vss
     qga_libs += ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++', '-Wl,--enable-stdcall-fixup']
     subdir('vss-win32')
   endif
@@ -93,7 +110,7 @@ if targetos == 'windows'
   if wixl.found()
     deps = [gen_tlb, qga]
     qemu_ga_msi_vss = []
-    if 'CONFIG_QGA_VSS' in config_host
+    if have_qga_vss
       qemu_ga_msi_vss = ['-D', 'InstallVss']
       deps += qga_vss
     endif
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index cc9bb4b1fd..688d881ff0 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -20,6 +20,7 @@ meson_options_help() {
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-profiler        profiler support'
+  printf "%s\n" '  --enable-qga-vss         build QGA VSS support'
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
@@ -285,6 +286,8 @@ _meson_option_parse() {
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
     --disable-qed) printf "%s" -Dqed=disabled ;;
+    --enable-qga-vss) printf "%s" -Dqga_vss=enabled ;;
+    --disable-qga-vss) printf "%s" -Dqga_vss=disabled ;;
     --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=true ;;
     --disable-qom-cast-debug) printf "%s" -Dqom_cast_debug=false ;;
     --enable-rbd) printf "%s" -Drbd=enabled ;;
-- 
2.34.1



