Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFA508CBD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:05:05 +0200 (CEST)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCpE-0006rM-9v
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLn-0001Wt-M9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLl-0000yM-Tu
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id q20so1466956wmq.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+pFdnHYez6FG1+gMSjss9lN947m4DK6aL4zlGZJr2IQ=;
 b=TRoN63vDouHBE7beZF2ptjickn8aGuVh8P2WSwajLltVt9cr5qW9oJBQLOPBFrPfte
 UXdiq7N0f8ro/Rr67gqKX8+fAm6Yl8UxsG0Ng5n3vDvPv9lb0nkP3h3OR3esk62LUIrM
 E2OY6gvuET7RNKXeigRQmN7X9E8Isy5ZVFx1kZjswcbnh6YHk0fwJI/Sq6AlJvJvm3Da
 QU3dX1nnrl7IoSELlZkp8SAQXkjXK4N8IYs3C3YzfymMvnPANqI1If2dsdFnXIGCt0Ve
 95s/4fazoIAPDOdg6hy/gpZa4QOalH4OxOq+xP16mQSuqSUuVt6YjX0Za3GcqXvEz7fH
 X7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+pFdnHYez6FG1+gMSjss9lN947m4DK6aL4zlGZJr2IQ=;
 b=kOSwN1feKvWSTSoA8sq5YTuZkArEGetTrAlmRusTCdMIf+ESjj65YbTaFZ4+VQinJi
 gV7TrVPD0ehg8/xXw6+AF1u/gZ9b3r2vidpZoqXZTQCzvruF8Apk9hqA4CgLuVJrhbWs
 iLZs67n0MxjtTfq8vgm96tfJvfbxy5+88IwxLcGyRI0BlOgPVa/+1JND3eyzJYDrnQlz
 m7/Ih6QvqQ63agBjXOWsVq4TF1XiKFXVxvKP1FHO4EYxgomkaEtOwPW5hqKwRq6ZPwuL
 djbRwvex7uvJJUiJmPLHrxhZt6q03C7T3MNGNidu2MWGXq+eJGiYMVQDTNvlX15TXrx1
 p2Hg==
X-Gm-Message-State: AOAM533GSuR1yis1tQmwwr4gUgE9d3LyVfbefmhfuUvP1PWhwv0jBPmo
 Ao3mNBm97hbVvJx0nOmjs0rBEBuP6tP/Ag==
X-Google-Smtp-Source: ABdhPJxwcDJw0Yha+YUr4ft7CKb6cMuQ+ajfjxt1XQzSabHlhaTcWjnnP2WxLnpYHx1+vm37WOFqVQ==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id
 m1-20020a1ca301000000b003929bc5203cmr4317811wme.67.1650468876251; 
 Wed, 20 Apr 2022 08:34:36 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/34] configure: switch string options to automatic parsing
Date: Wed, 20 Apr 2022 17:33:51 +0200
Message-Id: <20220420153407.73926-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 24 +-----------------------
 scripts/meson-buildoptions.py |  5 +----
 scripts/meson-buildoptions.sh |  9 +++++++++
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/configure b/configure
index 87ceb33917..8f34f2a061 100755
--- a/configure
+++ b/configure
@@ -231,12 +231,10 @@ fi
 
 # default parameters
 cpu=""
-iasl="iasl"
 interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
-audio_drv_list="default"
 block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 host_cc="cc"
@@ -312,7 +310,6 @@ linux_user=""
 bsd_user=""
 pkgversion=""
 pie=""
-trace_file="trace"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
@@ -713,8 +710,6 @@ for opt do
   ;;
   --cxx=*)
   ;;
-  --iasl=*) iasl="$optarg"
-  ;;
   --objcc=*) objcc="$optarg"
   ;;
   --make=*) make="$optarg"
@@ -723,8 +718,6 @@ for opt do
   ;;
   --python=*) python="$optarg" ; explicit_python=yes
   ;;
-  --sphinx-build=*) sphinx_build="$optarg"
-  ;;
   --skip-meson) skip_meson=yes
   ;;
   --meson=*) meson="$optarg"
@@ -765,8 +758,6 @@ for opt do
                        error_exit "Can't mix --target-list-exclude with --target-list"
                    fi
   ;;
-  --with-trace-file=*) trace_file="$optarg"
-  ;;
   --with-default-devices) default_devices="true"
   ;;
   --without-default-devices) default_devices="false"
@@ -825,8 +816,6 @@ for opt do
     # configure to be used by RPM and similar macros that set
     # lots of directory switches by default.
   ;;
-  --audio-drv-list=*) audio_drv_list="$optarg"
-  ;;
   --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
   ;;
   --block-drv-ro-whitelist=*) block_drv_ro_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
@@ -1000,12 +989,7 @@ for opt do
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
   ;;
   # everything else has the same name in configure and meson
-  --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
-  ;;
-  *)
-      echo "ERROR: unknown option $opt"
-      echo "Try '$0 --help' for more information"
-      exit 1
+  --*) meson_option_parse "$opt" "$optarg"
   ;;
   esac
 done
@@ -1128,7 +1112,6 @@ $(echo Available targets: $default_target_list | \
 Advanced options (experts only):
   --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
   --cc=CC                  use C compiler CC [$cc]
-  --iasl=IASL              use ACPI compiler IASL [$iasl]
   --host-cc=CC             use C compiler CC [$host_cc] for code run at
                            build time
   --cxx=CXX                use C++ compiler CXX [$cxx]
@@ -1141,7 +1124,6 @@ Advanced options (experts only):
   --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
   --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
-  --sphinx-build=SPHINX    use specified sphinx-build [$sphinx_build]
   --meson=MESON            use specified meson [$meson]
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
@@ -2484,15 +2466,11 @@ if test "$skip_meson" = no; then
         --sysconfdir "$sysconfdir" \
         --localedir "$localedir" \
         --localstatedir "$local_statedir" \
-        -Daudio_drv_list=$audio_drv_list \
         -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
-        -Diasl="$iasl" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
-        -Dsphinx_build="$sphinx_build" \
-        -Dtrace_file="$trace_file" \
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
         -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 4af8d6e732..3e540e8bb3 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -26,21 +26,18 @@
 import sys
 
 SKIP_OPTIONS = {
-    "audio_drv_list",
     "default_devices",
     "docdir",
     "fuzzing_engine",
-    "iasl",
     "qemu_firmwarepath",
     "qemu_suffix",
     "smbd",
-    "sphinx_build",
-    "trace_file",
 }
 
 OPTION_NAMES = {
     "malloc": "enable-malloc",
     "trace_backends": "enable-trace-backends",
+    "trace_file": "with-trace-file",
 }
 
 BUILTIN_OPTIONS = {
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 5a06b7915c..63f2f1abcf 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,5 +1,7 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
+  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices:'
+  printf "%s\n" '                           alsa/coreaudio/default/dsound/jack/oss/pa/sdl)'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
@@ -32,6 +34,9 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
+  printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
+  printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
+  printf "%s\n" '  --with-trace-file=VALUE  Trace file prefix for simple backend [trace]'
   printf "%s\n" ''
   printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
   printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if available'
@@ -147,6 +152,7 @@ _meson_option_parse() {
     --disable-alsa) printf "%s" -Dalsa=disabled ;;
     --enable-attr) printf "%s" -Dattr=enabled ;;
     --disable-attr) printf "%s" -Dattr=disabled ;;
+    --audio-drv-list=*) quote_sh "-Daudio_drv_list=$2" ;;
     --enable-auth-pam) printf "%s" -Dauth_pam=enabled ;;
     --disable-auth-pam) printf "%s" -Dauth_pam=disabled ;;
     --enable-avx2) printf "%s" -Davx2=enabled ;;
@@ -229,6 +235,7 @@ _meson_option_parse() {
     --disable-hax) printf "%s" -Dhax=disabled ;;
     --enable-hvf) printf "%s" -Dhvf=enabled ;;
     --disable-hvf) printf "%s" -Dhvf=disabled ;;
+    --iasl=*) quote_sh "-Diasl=$2" ;;
     --enable-iconv) printf "%s" -Diconv=enabled ;;
     --disable-iconv) printf "%s" -Diconv=disabled ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
@@ -331,6 +338,7 @@ _meson_option_parse() {
     --disable-snappy) printf "%s" -Dsnappy=disabled ;;
     --enable-sparse) printf "%s" -Dsparse=enabled ;;
     --disable-sparse) printf "%s" -Dsparse=disabled ;;
+    --sphinx-build=*) quote_sh "-Dsphinx_build=$2" ;;
     --enable-spice) printf "%s" -Dspice=enabled ;;
     --disable-spice) printf "%s" -Dspice=disabled ;;
     --enable-spice-protocol) printf "%s" -Dspice_protocol=enabled ;;
@@ -346,6 +354,7 @@ _meson_option_parse() {
     --enable-tpm) printf "%s" -Dtpm=enabled ;;
     --disable-tpm) printf "%s" -Dtpm=disabled ;;
     --enable-trace-backends=*) quote_sh "-Dtrace_backends=$2" ;;
+    --with-trace-file=*) quote_sh "-Dtrace_file=$2" ;;
     --enable-u2f) printf "%s" -Du2f=enabled ;;
     --disable-u2f) printf "%s" -Du2f=disabled ;;
     --enable-usb-redir) printf "%s" -Dusb_redir=enabled ;;
-- 
2.35.1



