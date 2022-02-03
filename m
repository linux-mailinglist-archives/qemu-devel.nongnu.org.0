Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8A4A8B20
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:03:04 +0100 (CET)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgRj-0006kD-KZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:03:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0T-0005Lh-Rv
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: from [2a00:1450:4864:20::630] (port=35639
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008JL-3t
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: by mail-ej1-x630.google.com with SMTP id s5so11021831ejx.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bk2AULvrkMaO5YDXQAHCo1/R9b7RPCRavHkNNTdCR7M=;
 b=MYFhAlB9d4rmLNtSg3UrkT0qAeSEE611MUBm22OackoZhsoXXI1gqHCIF+r98Z3y/I
 Iin/wlKfCpMXnFD4L2YL3newb2QFD1xNJu/e1grC3qRIuuhmTQPLAzyciz7840j1IESW
 oU/fn/lBCGxFb2SDl6fp86+4HN12F+SZ1riwpEu/AFUT8TcggSG3HKHG5GWluLjo6/BB
 n5TtBmKh8CpZ3sgBQreSzWNOYqKK8yIF2J+Fa+W52nWi+A1hTXjQHRuOpx0M4D28r4ml
 LQoC43DS5cOWy2StWAq8kPL9iKz1REVvlxUXPVoICMYMhu80CXmIB2uDtfLez2RD0eW9
 LLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bk2AULvrkMaO5YDXQAHCo1/R9b7RPCRavHkNNTdCR7M=;
 b=bRxL7pc7aEByJ8bAg9e4Uq6+TfbX0NaMcCroH7UdC25kHC/vgj6WWw6rkYXUPj6/d8
 Z27h7vnueJCWwOSHl1nSVKCTQQt2vO2opqa3Ll/uBC/x/clHJ+0cmJp3CobWf0bs1PWN
 lO4n8mted1CUAXUNPTrVpw+iJ2cw6EuROXLQuKspsNguJwWXPc/CdaKm1/gPryAeV+EI
 JXwM5tl2SylHvECAcHa+vFT/Kkp5W9kCEpAbDRy3B1/0B4a/jif9DQKSxsJ1oRBNqquL
 OjzQRzo07V0rkhHeipw2GzU1yW+k6bRXr5W6oNZdU8BPxhZaN2meFDOtCXO9+HAEQ6oB
 Y9lQ==
X-Gm-Message-State: AOAM5313U+fptv21VNBBfU//rNgV4VlPAm9yOXZKthNNQbNczXh+O9HN
 6ntgc9UIx1A3vOnW6fHIjY9mNpHxcUk=
X-Google-Smtp-Source: ABdhPJwOTUb8PyGh9qTq9gIXUUd0lR/GtaI+F1CzfzR2+YEMCvV7Vutf9OoOwrf4m4JylmhZK8LmwQ==
X-Received: by 2002:a17:906:99c2:: with SMTP id
 s2mr29231269ejn.635.1643909657597; 
 Thu, 03 Feb 2022 09:34:17 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/27] configure,
 meson: replace VSS SDK checks and options with --enable-vss-sdk
Date: Thu,  3 Feb 2022 18:33:54 +0100
Message-Id: <20220203173359.292068-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index 3fb28891d3..f67088044f 100755
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
@@ -1234,8 +1227,6 @@ Advanced options (experts only):
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
-  --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
-  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
   --enable-plugins
                            enable plugins via shared library loading
@@ -2298,41 +2289,6 @@ EOF
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
@@ -2862,9 +2818,6 @@ if test "$debug_tcg" = "yes" ; then
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
index e1667954b9..e3499a7e9a 100644
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
@@ -3602,7 +3610,7 @@ summary_info += {'libiscsi support':  libiscsi}
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
index 97cc391fe1..ca795f44fb 100644
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
+    The headers are extracted in the directory \`inc'.
+    Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc"''') \
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
index 895d8310b4..23de2a6c62 100644
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
@@ -288,6 +289,8 @@ _meson_option_parse() {
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



