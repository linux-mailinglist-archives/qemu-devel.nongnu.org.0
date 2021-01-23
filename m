Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F103015EC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:36:11 +0100 (CET)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K1K-0000W8-LY
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxE-0003Wk-7c
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx7-0005pu-3b
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JzEjrGDu5ACPuC4O5nwB5bLh4ysrzqhSgrkqN+kLKI=;
 b=LwUqEj3pBG3BPnjMX+IXIKBP7lw1qr52jMTavqMxJfGK58SmCnhcFY24kJPewwhnSV8JTE
 Qm/K1sh5rjfg+jmAqVHC57ViDzflyMJteNcJ3vAiCXtEts/V2tzD3Q1/c4HCo+xAsMbMXM
 oefTmR3ftMVKR7iLxLTmrrI08MPM7K0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-7EEQUyNoOjqpGDVuE9OzGw-1; Sat, 23 Jan 2021 09:31:45 -0500
X-MC-Unique: 7EEQUyNoOjqpGDVuE9OzGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9925806663
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A392719486
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/31] meson: convert wixl detection to Meson
Date: Sat, 23 Jan 2021 09:31:11 -0500
Message-Id: <20210123143128.1167797-15-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Makefile          |  2 --
 configure         | 84 ++++++++++-------------------------------------
 meson.build       | 10 ++++--
 meson_options.txt |  2 ++
 qga/meson.build   | 55 +++++++++++++++++++------------
 5 files changed, 61 insertions(+), 92 deletions(-)

diff --git a/Makefile b/Makefile
index 2a926aaeb0..a380bbfa12 100644
--- a/Makefile
+++ b/Makefile
@@ -335,9 +335,7 @@ endif
 ifdef CONFIG_WIN32
 	@echo  'Windows targets:'
 	$(call print-help,installer,Build NSIS-based installer for QEMU)
-ifdef CONFIG_QGA_MSI
 	$(call print-help,msi,Build MSI-based installer for qemu-ga)
-endif
 	@echo  ''
 endif
 	$(call print-help,$(MAKE) [targets],(quiet build, default))
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



