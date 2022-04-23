Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A732150CA7A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:16:03 +0200 (CEST)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFcI-0007jD-P3
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFf-0007L7-6c
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFd-0005BL-4y
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:38 -0400
Received: by mail-ej1-x62b.google.com with SMTP id k23so21201538ejd.3
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4yKm4UvJ2WgE67gn1ecRfThuqqNn2HqpkFCAhFSxTkc=;
 b=WIrnPUo76cHxpkKmXYsWIFFI0LBQ4Z7kC/SLRX1vdKDngcF1BIcNiRYrn4RI3gQRP+
 9ObQSKj5vMjEeiSllRQZZ1PhD8LJVkH0lGLDSXxQmq1wRYlIsESOUq9CTpxmjSUDeMeO
 3jWdszTjJiQYAWoczhamhOK9wNBaWnNq4pAtly3LZhA66iiRtH3QriUDWMYpXWckWwxA
 sYuOuQ8QY/hsCD71jIU91BR+PIle2+xL5q6cen6S60YtMgG+Mc1MqyoXxbglSveLjVmG
 EEDCpero7dSlHeR0tWSYnf9UI0znhXCn+711iMI0gQw7BWjnm9IGANQHPzS22MT+oXbH
 NUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4yKm4UvJ2WgE67gn1ecRfThuqqNn2HqpkFCAhFSxTkc=;
 b=TiVLXk1cXhC3kkznQddyfA1o1Ht2haUiy7e9e0gOAEzM495f82774KPOx1ftDvYMg0
 ErKz2gy5hGNeIikDvkacGXRz1JVekiJpwaalPZLuryF7hz7ZngZzGUh3djnGgLbvXwgj
 m6vy0MwqImaPwJSWQedo5/B6vqh6+btcTZaZT3c18N6keiEWDx+z6ncIh6IPeV0VA/0a
 Zwq9bRfqJKlRY1Db5SnA28q9NTuf8jc2C3tzSeKEcfq2V0uDwk+MIfuxhn1gcClGm4P+
 OzJu3cKYNNjGBG/ryd34FhL4eFo9t90O36QnfqIc2pXLn2xsvofvib5UxbFWseK/mR8b
 fKGw==
X-Gm-Message-State: AOAM532CvObkTme754QOg+jPoRsQvcwNqvZX/QITjC06gPEB+Wp7H6HH
 cv/KDlzszNE7uAXn+dkyh2oJ9Po4bUQudQ==
X-Google-Smtp-Source: ABdhPJyUEI+lBKDYgDtCGMjoxAX93q9R1BQUy/+CvGa/ukaH1rxymVVdXNsnqiZl5wOAYe4u42BRtw==
X-Received: by 2002:a17:907:da7:b0:6df:9ff4:10c7 with SMTP id
 go39-20020a1709070da700b006df9ff410c7mr8130334ejc.106.1650718355834; 
 Sat, 23 Apr 2022 05:52:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/34] configure: switch string options to automatic parsing
Date: Sat, 23 Apr 2022 14:51:35 +0200
Message-Id: <20220423125151.27821-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 24 +-----------------------
 scripts/meson-buildoptions.py |  5 +----
 scripts/meson-buildoptions.sh |  9 +++++++++
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/configure b/configure
index a6ba59cf6f..8de8fea4af 100755
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
@@ -2483,15 +2465,11 @@ if test "$skip_meson" = no; then
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



