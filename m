Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48260512D33
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:41:40 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njymR-0003lt-CE
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2F-0000TJ-Js
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:56 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2D-00058T-CI
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:55 -0400
Received: by mail-ej1-x635.google.com with SMTP id y3so7566848ejo.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPDUEcIQiysEsQ1ZLwh7qMFjmYPaWcbwmlZFyAXP/vg=;
 b=WbVWdb1uFJ1KBHxfQEB6/CYfhGwco3ct19nQ5JfaFT7GYrUH3qPEepqQ38TF7+2wLY
 qHRTgaFQwV8vQP3ReSCEIcOdWtM1f+ZUGAVxnPwdU0d8vK3tcAXoDfPNjKj3kgvx+Boe
 swb2LcSVbP+5NCvQO1tvt7iA+MVeUXZDibrlSN4nmyTnE1GvLbosNb9fOV3fnwlIEweF
 SQevrlm2En9xyJkDdwIvW7Qo1QavgD0PJmUg+2/7Oh5X95B/Ig4XV/u8JenfiN/yAyWy
 Tj92LLtTS6yUz/EQwE5+ezTmlOkWurkLAfXkBAIZxktjCnftIaKx+t4Bt8k64MFMAcGl
 7I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nPDUEcIQiysEsQ1ZLwh7qMFjmYPaWcbwmlZFyAXP/vg=;
 b=3GKlDYAeeLYsxmZ/H6uMjwnRjPlsO4q7fp0OCNlzRr/uQooPLMG1NxteCg6rUZ4pky
 J2bd3KMUc8veZlz49NVRhAzUpqhUlN+bMmY6RIWA3slqM4TR1c28y7n7o14QmDZVyVHj
 3XN/Q2WOGpj9LpiNRerBwFqpj1E0LWUEN7etCNWiUmNY+IKcmFC/9gMLwTO/tksIEyi1
 V+Rer6Mw6jwlQF4qvhLh1Q81tN65HgdTPsvmFGK7Fo3jgJuuzC/c6L6eQfXxZHSDmlLl
 c1bAlntCcTAo78IZdO1uek9YJFhKDp7gNnTPUkYpwTFlTgvccu4KECxHTn7/mzVLAYwa
 RYvQ==
X-Gm-Message-State: AOAM5304nuxK1oKUO2OcY9TKJmEW4ycpt48xatl23ybjeU3MnAKHD3hJ
 +uu4ZQkEYcB6VI5TCTedJkfBiZFr0QRu8w==
X-Google-Smtp-Source: ABdhPJxUDpLrN5lj5j5YP5xdy7ihTc2iDTv+UhzSuAPtZpzP8S06AAPYjkgDZ+l0Aj8tZb421ARFNA==
X-Received: by 2002:a17:907:3f07:b0:6f3:c0ee:d6a3 with SMTP id
 hq7-20020a1709073f0700b006f3c0eed6a3mr7685440ejc.410.1651128832059; 
 Wed, 27 Apr 2022 23:53:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] meson, configure: move --enable-module-upgrades to meson
Date: Thu, 28 Apr 2022 08:53:34 +0200
Message-Id: <20220428065335.189795-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index ab1ac9b959..1fe7d257ff 100644
--- a/meson.build
+++ b/meson.build
@@ -1550,6 +1550,11 @@ endif
 
 config_host_data.set('HOST_' + host_arch.to_upper(), 1)
 
+if get_option('module_upgrades') and not enable_modules
+  error('Cannot enable module-upgrades as modules are not enabled')
+endif
+config_host_data.set('CONFIG_MODULE_UPGRADES', get_option('module_upgrades'))
+
 config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BDRV_WHITELIST_TOOLS', get_option('block_drv_whitelist_in_tools'))
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
@@ -3576,7 +3581,7 @@ summary_info += {'block layer':       have_block}
 summary_info += {'Install blobs':     get_option('install_blobs')}
 summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
-  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
+  summary_info += {'alternative module path': get_option('module_upgrades')}
 endif
 summary_info += {'fuzzing support':   get_option('fuzzing')}
 if have_system
diff --git a/meson_options.txt b/meson_options.txt
index 65f7010bae..af432a4ee6 100644
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
index ee80f01cea..21366b2102 100644
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



