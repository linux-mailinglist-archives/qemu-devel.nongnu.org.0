Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B151BB5B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:04:09 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXP6-0000Ws-EN
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWf4-0007Qm-3N
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:25471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWf1-00080O-Uj
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nspy6ScmfmxJvkKy6xaXMmxbASccohQU5I65OHpVnk4=;
 b=QGXYlgHiwYkxIO98dubP/GA8ewjUlE7v03rN57G1/r4kHPhmCweSGjekizXhaGUcd/073P
 vFtwdJwJYvLRtw9xivK7+Ax6VeK845qJ8tN3Udc65AeI51pkcXWhTZlZSbx2DNQItKhc8r
 zbvsaJIBnX54iQjsCqhV0RRx9Z540eo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-s7sSNLa3NTe--ybk3lmraA-1; Thu, 05 May 2022 04:16:30 -0400
X-MC-Unique: s7sSNLa3NTe--ybk3lmraA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A3F100BABB;
 Thu,  5 May 2022 08:16:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 037A514A507B;
 Thu,  5 May 2022 08:16:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 14/15] qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with
 glib bindir
Date: Thu,  5 May 2022 12:14:30 +0400
Message-Id: <20220505081431.934739-15-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-1-marcandre.lureau@redhat.com>
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use more conventional variables to set the location of pre-built
DLL/bin.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                 |  9 ++++++---
 meson.build               |  5 ++++-
 qga/installer/qemu-ga.wxs | 24 ++++++++++++------------
 qga/meson.build           |  2 +-
 4 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index 59c43bea05eb..616cd2d0e36c 100755
--- a/configure
+++ b/configure
@@ -2023,6 +2023,11 @@ for i in $glib_modules; do
     fi
 done
 
+glib_bindir="$($pkg_config --variable=bindir glib-2.0)"
+if test -z "$glib_bindir" ; then
+	glib_bindir="$($pkg_config --variable=prefix glib-2.0)"/bin
+fi
+
 # This workaround is required due to a bug in pkg-config file for glib as it
 # doesn't define GLIB_STATIC_COMPILATION for pkg-config --static
 
@@ -2430,8 +2435,6 @@ if test "$QEMU_GA_VERSION" = ""; then
     QEMU_GA_VERSION=$(cat $source_path/VERSION)
 fi
 
-QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
-
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
@@ -2518,7 +2521,6 @@ if test "$debug_tcg" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  echo "QEMU_GA_MSI_MINGW_BIN_PATH=${QEMU_GA_MSI_MINGW_BIN_PATH}" >> $config_host_mak
   echo "QEMU_GA_MANUFACTURER=${QEMU_GA_MANUFACTURER}" >> $config_host_mak
   echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
   echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
@@ -2639,6 +2641,7 @@ echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
+echo "GLIB_BINDIR=$glib_bindir" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
diff --git a/meson.build b/meson.build
index c26aa442d40e..2f68b6cb8634 100644
--- a/meson.build
+++ b/meson.build
@@ -443,7 +443,10 @@ add_project_arguments(config_host['GLIB_CFLAGS'].split(),
                       native: false, language: ['c', 'cpp', 'objc'])
 glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
                           link_args: config_host['GLIB_LIBS'].split(),
-                          version: config_host['GLIB_VERSION'])
+                          version: config_host['GLIB_VERSION'],
+                          variables: {
+                            'bindir': config_host['GLIB_BINDIR'],
+                          })
 # override glib dep with the configure results (for subprojects)
 meson.override_dependency('glib-2.0', glib)
 
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index e5b0958e1898..813d1c6ca6ae 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -58,7 +58,7 @@
           </Component>
           <?ifdef var.InstallVss?>
           <Component Id="libstdc++_6_lib" Guid="{55E737B5-9127-4A11-9FC3-A29367714574}">
-            <File Id="libstdc++-6.lib" Name="libstdc++-6.dll" Source="$(var.Mingw_bin)/libstdc++-6.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="libstdc++-6.lib" Name="libstdc++-6.dll" Source="$(var.BIN_DIR)/libstdc++-6.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="qga_vss_dll" Guid="{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
             <File Id="qga_vss.dll" Name="qga-vss.dll" Source="$(var.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath="yes" DiskId="1"/>
@@ -69,40 +69,40 @@
           <?endif?>
           <?if $(var.Arch) = "32"?>
           <Component Id="gspawn-helper-console" Guid="{446185B3-87BE-43D2-96B8-0FEFD9E8696D}">
-            <File Id="gspawn-win32-helper-console.exe" Name="gspawn-win32-helper-console.exe" Source="$(var.Mingw_bin)/gspawn-win32-helper-console.exe" KeyPath="yes" DiskId="1"/>
+            <File Id="gspawn-win32-helper-console.exe" Name="gspawn-win32-helper-console.exe" Source="$(var.BIN_DIR)/gspawn-win32-helper-console.exe" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="gspawn-helper" Guid="{CD67A5A3-2DB1-4DA1-A67A-8D71E797B466}">
-            <File Id="gspawn-win32-helper.exe" Name="gspawn-win32-helper.exe" Source="$(var.Mingw_bin)/gspawn-win32-helper-console.exe" KeyPath="yes" DiskId="1"/>
+            <File Id="gspawn-win32-helper.exe" Name="gspawn-win32-helper.exe" Source="$(var.BIN_DIR)/gspawn-win32-helper-console.exe" KeyPath="yes" DiskId="1"/>
           </Component>
           <?endif?>
           <?if $(var.Arch) = "64"?>
           <Component Id="gspawn-helper-console" Guid="{9E615A9F-349A-4992-A5C2-C10BAD173660}">
-            <File Id="gspawn-win64-helper-console.exe" Name="gspawn-win64-helper-console.exe" Source="$(var.Mingw_bin)/gspawn-win64-helper-console.exe" KeyPath="yes" DiskId="1"/>
+            <File Id="gspawn-win64-helper-console.exe" Name="gspawn-win64-helper-console.exe" Source="$(var.BIN_DIR)/gspawn-win64-helper-console.exe" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="gspawn-helper" Guid="{D201AD22-1846-4E4F-B6E1-C7A908ED2457}">
-            <File Id="gspawn-win64-helper.exe" Name="gspawn-win64-helper.exe" Source="$(var.Mingw_bin)/gspawn-win64-helper-console.exe" KeyPath="yes" DiskId="1"/>
+            <File Id="gspawn-win64-helper.exe" Name="gspawn-win64-helper.exe" Source="$(var.BIN_DIR)/gspawn-win64-helper-console.exe" KeyPath="yes" DiskId="1"/>
           </Component>
           <?endif?>
           <Component Id="iconv" Guid="{35EE3558-D34B-4F0A-B8BD-430FF0775246}">
-            <File Id="iconv.dll" Name="iconv.dll" Source="$(var.Mingw_bin)/iconv.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="iconv.dll" Name="iconv.dll" Source="$(var.BIN_DIR)/iconv.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="libgcc_arch_lib" Guid="{ADD4D07D-4515-4AB6-AF3E-C904961B4BB0}">
-            <File Id="libgcc_arch_lib" Name="$(var.ArchLib)" Source="$(var.Mingw_bin)/$(var.ArchLib)" KeyPath="yes" DiskId="1"/>
+            <File Id="libgcc_arch_lib" Name="$(var.ArchLib)" Source="$(var.BIN_DIR)/$(var.ArchLib)" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="libglib" Guid="{D31BFD83-2773-4B65-B45A-E0D2ADA58679}">
-            <File Id="libglib_2.0_0.dll" Name="libglib-2.0-0.dll" Source="$(var.Mingw_bin)/libglib-2.0-0.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="libglib_2.0_0.dll" Name="libglib-2.0-0.dll" Source="$(var.BIN_DIR)/libglib-2.0-0.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="libintl" Guid="{A641BC2D-A907-4A94-9149-F30ED430878F}">
-            <File Id="libintl_8.dll" Name="libintl-8.dll" Source="$(var.Mingw_bin)/libintl-8.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="libintl_8.dll" Name="libintl-8.dll" Source="$(var.BIN_DIR)/libintl-8.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="libssp" Guid="{7880087B-02B4-4EF6-A5D3-D18F8E3D90E1}">
-            <File Id="libssp_0.dll" Name="libssp-0.dll" Source="$(var.Mingw_bin)/libssp-0.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="libssp_0.dll" Name="libssp-0.dll" Source="$(var.BIN_DIR)/libssp-0.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="libwinpthread" Guid="{6C117C78-0F47-4B07-8F34-6BEE11643829}">
-            <File Id="libwinpthread_1.dll" Name="libwinpthread-1.dll" Source="$(var.Mingw_bin)/libwinpthread-1.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="libwinpthread_1.dll" Name="libwinpthread-1.dll" Source="$(var.BIN_DIR)/libwinpthread-1.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="libpcre" Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
-            <File Id="libpcre_1.dll" Name="libpcre-1.dll" Source="$(var.Mingw_bin)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="libpcre_1.dll" Name="libpcre-1.dll" Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
             <RegistryKey Root="HKLM"
diff --git a/qga/meson.build b/qga/meson.build
index 3ad3bc0260cf..51b1e611b194 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -125,7 +125,7 @@ if targetos == 'windows'
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
                               '-D', 'BUILD_DIR=' + meson.build_root(),
-                              '-D', 'Mingw_bin=' + config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
+                              '-D', 'BIN_DIR=' + glib.get_variable('bindir'),
                               '-D', 'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               '-D', 'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
                               '-D', 'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
-- 
2.36.0.44.g0f828332d5ac


