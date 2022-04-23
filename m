Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60F50CA8F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:22:11 +0200 (CEST)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFiE-0002oe-Fl
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFl-0007P9-Bv
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:45 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFj-0005CA-JJ
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:45 -0400
Received: by mail-ej1-x633.google.com with SMTP id ks6so21216739ejb.1
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PLsHIOV/J8FTVgiR3cSfFeze3Hzo4lQbC39Sk+I6bk0=;
 b=lANLVmdK6zyfPzXeuLnyDd121rxYOBkHlMdw9wEsGp7kInjyIMZ7eUlAzhaTDOBxtP
 /EkNELo+OmjRBld5TXiljZxBBGyYnR4KZRF+NOLEh8halc1k74dgd4s7WtzWA3NNPs6o
 LjJBTfZSkpuhkYQWf7DfhywnxERsAq2Czkv3C1vlhg4bM4FUVVTdZfZoJuUfOKLslTvW
 o+xcSeFp5f2JvO9AQCN/141oqs2H7B9a//NDCoWNJggQhPppqjdqn1lZ5O1o1ID63CJz
 DbcmSyXZmuEmrfSlaYw8lUvrRnZB/tQ8Za7pXd+K2b9c1fzIQzJ5pbkKw7IsjHlc2jiz
 XdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PLsHIOV/J8FTVgiR3cSfFeze3Hzo4lQbC39Sk+I6bk0=;
 b=ekNVlLL59P3DmdF30jBpkiF+DamQyOAN4ZlgdtV5/RIPbV414mmwijWa2o6H8R3Pjl
 zjbHIXztIjjCVmlG1w65rw9WAmXP/VJx16KSPz5XRNhH/94vubQz7sZAe+5dTk4om9/p
 X7UK+38DeV8bYEml6Y471JCEcmOPdu954OnbdputvwTv/ejGsGcJkL07lrcC/kDm/lia
 AG0rhM7SOIAXZTE+TuHJCje/yDQ3k8CXC5J1ZbdGGr+HiB8BTBOy6UvQUAwgknJCGaDv
 H/RuQwUTDmW2HnZQuK9DJR8WY/roho5dErn0UbRVdECq3EjSmTcTc6U9a0hc2RVbhEUy
 bI1w==
X-Gm-Message-State: AOAM531NUikpk1Wf49gpTAlx3ubTbXK5FqudUsMESp7yWE0roM/3PBBJ
 XK7yJgfBPnHRaiYNAnoILTTYvSZDhOTIyQ==
X-Google-Smtp-Source: ABdhPJxxbKR7X5VyOamt7JeJCtghkHWMN5vtvrmVDSX5c47gmjXS2COUo9tmeTc2cpx0yWw6q40F/g==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr8492807ejy.385.1650718362311; 
 Sat, 23 Apr 2022 05:52:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/34] meson, configure: move --interp-prefix to meson
Date: Sat, 23 Apr 2022 14:51:39 +0200
Message-Id: <20220423125151.27821-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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

This is the last CONFIG_* entry in config-host.mak that had to be
special cased.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 6 ------
 meson.build                   | 6 ++----
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 3f0fe1c4e1..2987713a85 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,6 @@ fi
 
 # default parameters
 cpu=""
-interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
@@ -696,8 +695,6 @@ for opt do
   ;;
   --prefix=*) prefix="$optarg"
   ;;
-  --interp-prefix=*) interp_prefix="$optarg"
-  ;;
   --cross-prefix=*)
   ;;
   --cc=*)
@@ -1090,8 +1087,6 @@ Options: [defaults in brackets after descriptions]
 Standard options:
   --help                   print this message
   --prefix=PREFIX          install in PREFIX [$prefix]
-  --interp-prefix=PREFIX   where to find shared libraries, etc.
-                           use %M for cpu name [$interp_prefix]
   --target-list=LIST       set target list (default: build all)
 $(echo Available targets: $default_target_list | \
   fold -s -w 53 | sed -e 's/^/                           /')
@@ -2288,7 +2283,6 @@ for target in $target_list; do
     esac
 done
 
-echo "CONFIG_QEMU_INTERP_PREFIX=$interp_prefix" | sed 's/%M/@0@/' >> $config_host_mak
 if test "$default_targets" = "yes"; then
   echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 66b2a3aa31..1fdc74c86a 100644
--- a/meson.build
+++ b/meson.build
@@ -2225,10 +2225,8 @@ if targetos == 'windows' and link_language == 'cpp'
 endif
 config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
-ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
-    'HAVE_GDB_BIN']
 foreach k, v: config_host
-  if k.startswith('CONFIG_') and not ignored.contains(k)
+  if k.startswith('CONFIG_')
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
@@ -2334,7 +2332,7 @@ foreach target : target_dirs
     config_target += {
       'CONFIG_USER_ONLY': 'y',
       'CONFIG_QEMU_INTERP_PREFIX':
-        config_host['CONFIG_QEMU_INTERP_PREFIX'].format(config_target['TARGET_NAME'])
+        get_option('interp_prefix').replace('%M', config_target['TARGET_NAME'])
     }
   endif
 
diff --git a/meson_options.txt b/meson_options.txt
index dc6fb796c6..848426460c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -27,6 +27,8 @@ option('block_drv_rw_whitelist', type : 'string', value : '',
        description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
 option('block_drv_ro_whitelist', type : 'string', value : '',
        description: 'set block driver read-only whitelist (by default affects only QEMU, not tools like qemu-img)')
+option('interp_prefix', type : 'string', value : '/usr/gnemul/qemu-%M',
+       description: 'where to find shared libraries etc., use %M for cpu name')
 option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
 option('trace_file', type: 'string', value: 'trace',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index bf9878e24f..a0c86db116 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -41,6 +41,8 @@ meson_options_help() {
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
+  printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
+  printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
   printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
@@ -252,6 +254,7 @@ _meson_option_parse() {
     --disable-iconv) printf "%s" -Diconv=disabled ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
+    --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
     --enable-keyring) printf "%s" -Dkeyring=enabled ;;
-- 
2.35.1



