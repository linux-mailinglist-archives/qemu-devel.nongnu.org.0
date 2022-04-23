Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31C50CA62
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:08:29 +0200 (CEST)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFUy-0003sQ-Tn
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFS-0007Jh-JG
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFQ-00059M-Vk
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:26 -0400
Received: by mail-ej1-x630.google.com with SMTP id u15so21097286ejf.11
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DkMapKTANfwabAYkl4R+oiUOYt3T4trbJF1ExycOS+s=;
 b=BwI18csxO9CkLqAng35yuhx9YMJscUPnYgN492K4Io1pGknFwHUa3SRHoZhYXsSc7M
 YkNvD5Kc3ZtbhxjQmPwOQzpmUbHRjP0POH390HZhQ8iujDe3nI8EIm/1T/r5ZxwTUm8+
 k5IoSmSgSEqv/Nz/VwsHIGy0YQ5rF/l6S/va3KCESSfufrrxSb3zbtSPhy1suc5mhD/3
 yTYiskBlbVTrFWWzbOAjjemgwM/tLRLwIqY6KGxyxgkC+6BibwN6XyAAgAIpjeMe117O
 V8MugSqfASxRq2gqWiPTW5710J6M1BveXO1Wzptid4vweoxgu4jhwnsdHWN/7/yzRAov
 FPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DkMapKTANfwabAYkl4R+oiUOYt3T4trbJF1ExycOS+s=;
 b=ZwPLysgti2eOiXwNzPzuKIZsKqYOHZ51AQjH2LTYBA0+xmyNoDF7VcxiWX54VBTxPg
 ypRJVrmiq87c5ElFuEclPbcIum12Nl7xAZdaxA5P0mAaUM2IbfTRgy7ngtY+3HKZAXA0
 dPmqVo/RMJbev0C6HvVls0rLHv0+R70AT05td6RMS1TK3npKRsAxbbWkiBhwXLxsGKsS
 xwCf76NtQnVD8+haxPqbZeAA4VWGaHO1x5InayjUbJmE5FihEdS/dm6y2YM6qJyRGkyN
 eIwbft27J8KiUw8t5XPzOD6CvtpZS+7X50bKh9IlA7DB0G9qWUMQDDursyv8zdyUwtKC
 Dsfg==
X-Gm-Message-State: AOAM5318m5BJjBrV3U+H4e7lS+Xkl9tAZ2mp9I+V0Xlam4CQzgAbXja1
 4PMdnxfA1HbnaJOJvQ6WUAVNgLXhXGgD+g==
X-Google-Smtp-Source: ABdhPJxslNMU+29esstEPBOOQfkrSif7cOHN7fx6U0rs9Ge1OpsFDG6DkAeSQULr6yLpNUKh2/jHxw==
X-Received: by 2002:a17:906:7d83:b0:6ce:fee:9256 with SMTP id
 v3-20020a1709067d8300b006ce0fee9256mr8469188ejo.647.1650718343238; 
 Sat, 23 Apr 2022 05:52:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/34] meson,
 configure: move --enable-module-upgrades to meson
Date: Sat, 23 Apr 2022 14:51:30 +0200
Message-Id: <20220423125151.27821-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
 configure                     | 14 --------------
 meson.build                   |  7 ++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  4 ++++
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 1fb70bf614..59c43bea05 100755
--- a/configure
+++ b/configure
@@ -310,7 +310,6 @@ fortify_source="yes"
 gcov="no"
 EXESUF=""
 modules="no"
-module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
 softmmu="yes"
@@ -762,10 +761,6 @@ for opt do
   --disable-modules)
       modules="no"
   ;;
-  --disable-module-upgrades) module_upgrades="no"
-  ;;
-  --enable-module-upgrades) module_upgrades="yes"
-  ;;
   --cpu=*)
   ;;
   --target-list=*) target_list="$optarg"
@@ -1218,7 +1213,6 @@ cat << EOF
   bsd-user        all BSD usermode emulation targets
   pie             Position Independent Executables
   modules         modules support (non-Windows)
-  module-upgrades try to load modules from alternate paths for upgrades
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
   lto             Enable Link-Time Optimization.
@@ -1487,11 +1481,6 @@ if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
   error_exit "Modules are not available for Windows"
 fi
 
-# module_upgrades is only reasonable if modules are enabled
-if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
-  error_exit "Can't enable module-upgrades as Modules are not enabled"
-fi
-
 # Static linking is not possible with plugins, modules or PIE
 if test "$static" = "yes" ; then
   if test "$modules" = "yes" ; then
@@ -2563,9 +2552,6 @@ if test "$modules" = "yes"; then
   echo "CONFIG_STAMP=_$( (echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ )" >> $config_host_mak
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
-if test "$module_upgrades" = "yes"; then
-  echo "CONFIG_MODULE_UPGRADES=y" >> $config_host_mak
-fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 
 if test "$xen" = "enabled" ; then
diff --git a/meson.build b/meson.build
index 19032a829b..77045cf7d4 100644
--- a/meson.build
+++ b/meson.build
@@ -1548,6 +1548,11 @@ endif
 
 config_host_data.set('HOST_' + host_arch.to_upper(), 1)
 
+if get_option('module_upgrades') and not enable_modules
+  error('Cannot enable module-upgrades as modules are not enabled')
+endif
+config_host_data.set('CONFIG_MODULE_UPGRADES', get_option('module_upgrades'))
+
 config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BDRV_WHITELIST_TOOLS', get_option('block_drv_whitelist_in_tools'))
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
@@ -3574,7 +3579,7 @@ summary_info += {'block layer':       have_block}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
-  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
+  summary_info += {'alternative module path': get_option('module_upgrades')}
 endif
 summary_info += {'fuzzing support':   get_option('fuzzing')}
 if have_system
diff --git a/meson_options.txt b/meson_options.txt
index d140c0ef89..cf18663833 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -34,6 +34,8 @@ option('fuzzing', type : 'boolean', value: false,
        description: 'build fuzzing targets')
 option('gettext', type : 'feature', value : 'auto',
        description: 'Localization of the GTK+ user interface')
+option('module_upgrades', type : 'boolean', value : false,
+       description: 'try to load modules from alternate paths for upgrades')
 option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
 option('sparse', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 92be3e6187..a269534394 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -19,6 +19,8 @@ meson_options_help() {
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
+  printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
+  printf "%s\n" '                           upgrades'
   printf "%s\n" '  --enable-profiler        profiler support'
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
@@ -268,6 +270,8 @@ _meson_option_parse() {
     --disable-malloc-trim) printf "%s" -Dmalloc_trim=disabled ;;
     --enable-membarrier) printf "%s" -Dmembarrier=enabled ;;
     --disable-membarrier) printf "%s" -Dmembarrier=disabled ;;
+    --enable-module-upgrades) printf "%s" -Dmodule_upgrades=true ;;
+    --disable-module-upgrades) printf "%s" -Dmodule_upgrades=false ;;
     --enable-mpath) printf "%s" -Dmpath=enabled ;;
     --disable-mpath) printf "%s" -Dmpath=disabled ;;
     --enable-multiprocess) printf "%s" -Dmultiprocess=enabled ;;
-- 
2.35.1



