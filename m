Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31D508C95
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:57:00 +0200 (CEST)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhChP-0001PI-Az
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLi-0001SU-JD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:35 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLf-0000wI-Rf
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id q20so1466763wmq.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Lv5dQ8P3un+jwEbZUgvImxqI5ppzL6YawEqsjlx02M=;
 b=p0hjM/QTmVV+l5vkPMg3sbfRRIlA0J2RHGpaDNviYQyd02g3XhnBwYlgqrZYvfgMP2
 ZaRtaS7RNHt6ViKLEHTdWdNltsDnw9V3DbyhNxvr3slIiY8DdfKHnLQD2fagOmYPc6PA
 GEkCN/148yhbRmpNKFyiq+l2++t6pQhLeTy0Klm7MZl4xhDL9MANzyt9hj12oMwgY5kl
 3joSqZyc6VXHpMt1LWYC0itozfkBlaz2fiiyHN8ffGrH9JhI0EL0JxcdsCZCXs4d8lKo
 QKQxHxE4fBrUwxLcxzbeOqMfECw//Z5S2PzMqMHF41Md4XyGkYxckXMpYSiVAUT2mJh6
 UoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1Lv5dQ8P3un+jwEbZUgvImxqI5ppzL6YawEqsjlx02M=;
 b=RRqv3iBCts2LG0XZe1gY4on1rJOKrZbmJQEVPy0qbbmAHZvaeFTxGBkojpAOqiNWwx
 oGGZFlyFHmTJ4SXta3Ly3pY+q/glRa7nIDhQBexCVIKnRgugwmu0LK4jJ++Fe8pKaBXu
 FxZegP6VoGc6IBOnOfM/TAUDa/PmpuzdwlFfUfayoYx89i2TscRxhSxcFvvlwtrz7Aa5
 EdjxjCLeiuHChFsBjMHn06YbFJVrXKR+4ObxUWl04UrniV2vr/bdaI6RXjGyRSIcd68O
 HES08N7DrGI6dJIEdX13jw8Z4vbwrYoh/p1/tyq9QpNB5uqPD8ZT0UFthjI/A8zJz8ju
 YiHA==
X-Gm-Message-State: AOAM530QxZ3uRT76FhOV1Haj8saQ8LtTbebG2tcA7CewRiFppBOSbeJJ
 cr9WDkWHrV849ZcylI7ZRN87+1PvqDpLgw==
X-Google-Smtp-Source: ABdhPJxB/BDCrIt4IvMc5+UulNhWLvO8Kb1Acg1Yjylz5JXNeeAUw+oXqxauWB1oa7PSm0f4u1hXrg==
X-Received: by 2002:a05:600c:6011:b0:38e:bc5f:5197 with SMTP id
 az17-20020a05600c601100b0038ebc5f5197mr4326257wmb.37.1650468869967; 
 Wed, 20 Apr 2022 08:34:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/34] meson, configure: move --enable-module-upgrades to meson
Date: Wed, 20 Apr 2022 17:33:46 +0200
Message-Id: <20220420153407.73926-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
 configure                     | 14 --------------
 meson.build                   |  7 ++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  4 ++++
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 75e8b1e7aa..d4d51eff06 100755
--- a/configure
+++ b/configure
@@ -310,7 +310,6 @@ fortify_source="$default_feature"
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
index 84156df809..3c47d82180 100644
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
@@ -3563,7 +3568,7 @@ summary_info += {'block layer':       have_block}
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



