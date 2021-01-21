Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399772FEC4E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:51:31 +0100 (CET)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2aN0-00071u-8s
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2aKj-000625-MH
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2aKg-0004NY-9x
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611236942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HxDFf1QkCxJ4F+rMXmvBGpBK69eKDKUraaoosTqEESc=;
 b=RAHPadHbTHlQlfgSqYRzZzMnF1q2elcXpxAGwEIeS7Pf9y/hHPcI+Kn3auJ3gu4leBVLyA
 RGgN96zjnbMjKZLOgCA9Wga1Usabs5ZEbbGa/uaXeAADxX6yeG/0NFQXI+tfMuxAiDYboY
 SSG7Kwh1vqFKHzdhozTKMJwsyJ/JqIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-R-KIn4T3MU6J4k2gXwVbww-1; Thu, 21 Jan 2021 08:48:59 -0500
X-MC-Unique: R-KIn4T3MU6J4k2gXwVbww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DC9C8030A0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 13:48:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD54A5D9C6
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 13:48:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: convert wixl detection to Meson
Date: Thu, 21 Jan 2021 08:48:57 -0500
Message-Id: <20210121134857.1003066-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 configure         | 84 ++++++++++-------------------------------------
 meson.build       | 10 ++++--
 meson_options.txt |  2 ++
 qga/meson.build   | 55 +++++++++++++++++++------------
 4 files changed, 61 insertions(+), 90 deletions(-)

diff --git a/configure b/configure
index 753d0dd18e..6c98552452 100755
--- a/configure
+++ b/configure
@@ -404,7 +404,7 @@ zstd="auto"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
 guest_agent_ntddscsi="no"
-guest_agent_msi="$default_feature"
+guest_agent_msi="auto"
 vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
@@ -1334,9 +1334,9 @@ for opt do
   ;;
   --disable-guest-agent) guest_agent="no"
   ;;
-  --enable-guest-agent-msi) guest_agent_msi="yes"
+  --enable-guest-agent-msi) guest_agent_msi="enabled"
   ;;
-  --disable-guest-agent-msi) guest_agent_msi="no"
+  --disable-guest-agent-msi) guest_agent_msi="disabled"
   ;;
   --with-vss-sdk) vss_win32_sdk=""
   ;;
@@ -5341,62 +5341,19 @@ if [ "$guest_agent" != "no" ]; then
   fi
 fi
 
-# Guest agent Window MSI  package
+# Guest agent Windows MSI package
 
-if test "$guest_agent" != yes; then
-  if test "$guest_agent_msi" = yes; then
-    error_exit "MSI guest agent package requires guest agent enabled"
-  fi
-  guest_agent_msi=no
-elif test "$mingw32" != "yes"; then
-  if test "$guest_agent_msi" = "yes"; then
-    error_exit "MSI guest agent package is available only for MinGW Windows cross-compilation"
-  fi
-  guest_agent_msi=no
-elif ! has wixl; then
-  if test "$guest_agent_msi" = "yes"; then
-    error_exit "MSI guest agent package requires wixl tool installed ( usually from msitools package )"
-  fi
-  guest_agent_msi=no
-else
-  # we support qemu-ga, mingw32, and wixl: default to MSI enabled if it wasn't
-  # disabled explicitly
-  if test "$guest_agent_msi" != "no"; then
-    guest_agent_msi=yes
-  fi
+if test "$QEMU_GA_MANUFACTURER" = ""; then
+  QEMU_GA_MANUFACTURER=QEMU
 fi
-
-if test "$guest_agent_msi" = "yes"; then
-  if test "$guest_agent_with_vss" = "yes"; then
-    QEMU_GA_MSI_WITH_VSS="-D InstallVss"
-  fi
-
-  if test "$QEMU_GA_MANUFACTURER" = ""; then
-    QEMU_GA_MANUFACTURER=QEMU
-  fi
-
-  if test "$QEMU_GA_DISTRO" = ""; then
-    QEMU_GA_DISTRO=Linux
-  fi
-
-  if test "$QEMU_GA_VERSION" = ""; then
-      QEMU_GA_VERSION=$(cat $source_path/VERSION)
-  fi
-
-  QEMU_GA_MSI_MINGW_DLL_PATH="-D Mingw_dlls=$($pkg_config --variable=prefix glib-2.0)/bin"
-
-  case "$cpu" in
-  x86_64)
-    QEMU_GA_MSI_ARCH="-a x64 -D Arch=64"
-    ;;
-  i386)
-    QEMU_GA_MSI_ARCH="-D Arch=32"
-    ;;
-  *)
-    error_exit "CPU $cpu not supported for building installation package"
-    ;;
-  esac
+if test "$QEMU_GA_DISTRO" = ""; then
+  QEMU_GA_DISTRO=Linux
 fi
+if test "$QEMU_GA_VERSION" = ""; then
+    QEMU_GA_VERSION=$(cat $source_path/VERSION)
+fi
+
+QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
 # Mac OS X ships with a broken assembler
 roms=
@@ -5495,15 +5452,10 @@ if test "$mingw32" = "yes" ; then
   if test "$guest_agent_ntddscsi" = "yes" ; then
     echo "CONFIG_QGA_NTDDSCSI=y" >> $config_host_mak
   fi
-  if test "$guest_agent_msi" = "yes"; then
-    echo "CONFIG_QGA_MSI=y" >> $config_host_mak
-    echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
-    echo "QEMU_GA_MSI_WITH_VSS=${QEMU_GA_MSI_WITH_VSS}" >> $config_host_mak
-    echo "QEMU_GA_MSI_ARCH=${QEMU_GA_MSI_ARCH}" >> $config_host_mak
-    echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
-    echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
-    echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
-  fi
+  echo "QEMU_GA_MSI_MINGW_DLL_PATH=${QEMU_GA_MSI_MINGW_DLL_PATH}" >> $config_host_mak
+  echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
+  echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
+  echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
 else
   echo "CONFIG_POSIX=y" >> $config_host_mak
 fi
@@ -6420,7 +6372,7 @@ NINJA=$ninja $meson setup \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
-        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
+        -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
         $cross_arg \
         "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index 4a5f265bd0..49dd0c185f 100644
--- a/meson.build
+++ b/meson.build
@@ -2142,6 +2142,8 @@ endif
 
 if 'CONFIG_GUEST_AGENT' in config_host
   subdir('qga')
+elif get_option('guest_agent_msi').enabled()
+  error('Guest agent MSI requested, but the guest agent is not being built')
 endif
 
 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
@@ -2406,9 +2408,11 @@ if targetos == 'windows'
   if 'WIN_SDK' in config_host
     summary_info += {'Windows SDK':       config_host['WIN_SDK']}
   endif
-  summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
-  summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
-  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
+  if config_host.has_key('CONFIG_GUEST_AGENT')
+    summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
+    summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
+    summary_info += {'QGA MSI support':   wixl.found()}
+  endif
 endif
 summary_info += {'seccomp support':   seccomp.found()}
 summary_info += {'CFI support':       get_option('cfi')}
diff --git a/meson_options.txt b/meson_options.txt
index 7dcd81c06a..95f1079829 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -17,6 +17,8 @@ option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
 option('sparse', type : 'feature', value : 'auto',
        description: 'sparse checker')
+option('guest_agent_msi', type : 'feature', value : 'auto',
+       description: 'Build MSI package for the QEMU Guest Agent')
 
 option('malloc_trim', type : 'feature', value : 'auto',
        description: 'enable libc malloc_trim() for memory optimization')
diff --git a/qga/meson.build b/qga/meson.build
index 520af6ce9b..cfb1fbc085 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -55,33 +55,46 @@ if targetos == 'windows'
     gen_tlb = []
   endif
 
-  wixl = find_program('wixl', required: false)
+  qemu_ga_msi_arch = {
+    'x86': ['-D', 'Arch=32'],
+    'x86_64': ['-a', 'x64', '-D', 'Arch=64']
+  }
+  wixl = not_found
+  if cpu in qemu_ga_msi_arch
+    wixl = find_program('wixl', required: get_option('guest_agent_msi'))
+  elif get_option('guest_agent_msi').enabled()
+    error('CPU not supported for building guest agent installation package')
+  endif
+
   if wixl.found()
     deps = [gen_tlb, qga]
-    if 'CONFIG_QGA_VSS' in config_host and 'QEMU_GA_MSI_WITH_VSS' in config_host
+    qemu_ga_msi_vss = []
+    if 'CONFIG_QGA_VSS' in config_host
+      qemu_ga_msi_vss = ['-D', 'InstallVss']
       deps += qga_vss
     endif
-    if 'CONFIG_QGA_MSI' in config_host
-      qga_msi = custom_target('QGA MSI',
-                              input: files('installer/qemu-ga.wxs'),
-                              output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
-                              depends: deps,
-                              command: [
-                                find_program('env'),
-                                'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
-                                'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
-                                'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
-                                'BUILD_DIR=' + meson.build_root(),
-                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
-                                config_host['QEMU_GA_MSI_ARCH'].split(),
-                                config_host['QEMU_GA_MSI_WITH_VSS'].split(),
-                                config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
-                              ])
-      all_qga += [qga_msi]
-      alias_target('msi', qga_msi)
-    endif
+    qga_msi = custom_target('QGA MSI',
+                            input: files('installer/qemu-ga.wxs'),
+                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
+                            depends: deps,
+                            command: [
+                              find_program('env'),
+                              'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
+                              'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
+                              'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
+                              'BUILD_DIR=' + meson.build_root(),
+                              wixl, '-o', '@OUTPUT0@', '@INPUT0@',
+                              qemu_ga_msi_arch[cpu],
+                              qemu_ga_msi_vss,
+                              '-D', 'Mingw_dlls=' + config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
+                            ])
+    all_qga += [qga_msi]
+    alias_target('msi', qga_msi)
   endif
 else
+  if get_option('guest_agent_msi').enabled()
+    error('MSI guest agent package is available only for MinGW Windows cross-compilation')
+  endif
   install_subdir('run', install_dir: get_option('localstatedir'))
 endif
 
-- 
2.26.2


