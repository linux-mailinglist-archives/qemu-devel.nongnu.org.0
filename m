Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E7526914
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:14:30 +0200 (CEST)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZo5-0001mJ-TM
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZij-0001aT-PV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1npZih-00072B-Sk
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652465335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Olum9Pty0O24L9mPdjGTqHP2sNTsbWFCGNZznGFul1I=;
 b=bHitKL4wpZAhfzq727ke83lLt6txa4sxaw2xKw9tDnBj0fGx6aRmibBasQ/rP925IB0A+x
 YkFsKIgyKprTGNRGCZJCKPontEo6wMxoDdDKXE6S939m6g6BuWtnrEUOilxGdKJjlpBUtv
 c340D1LMxkHVzsCPQizU/Slh7K9L6GU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-t3KHer6HOUyJ8XbbR-2emw-1; Fri, 13 May 2022 14:08:53 -0400
X-MC-Unique: t3KHer6HOUyJ8XbbR-2emw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32A8880CDA7;
 Fri, 13 May 2022 18:08:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B12ED43EA06;
 Fri, 13 May 2022 18:08:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 11/15] qga/wixl: prefer variables over environment
Date: Fri, 13 May 2022 20:08:17 +0200
Message-Id: <20220513180821.905149-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220513180821.905149-1-marcandre.lureau@redhat.com>
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

No need to setup an environment or to check if the variable is undefined
manually.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/installer/qemu-ga.wxs | 30 +++++++++---------------------
 qga/meson.build           |  9 ++++-----
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 0950e8c6be..8a19aa1656 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -1,17 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Wix xmlns="http://schemas.microsoft.com/wix/2006/wi">
-  <?ifndef env.QEMU_GA_VERSION ?>
-    <?error Environment variable QEMU_GA_VERSION undefined?>
-  <?endif?>
-
-  <?ifndef env.QEMU_GA_DISTRO ?>
-    <?error Environment variable QEMU_GA_DISTRO undefined?>
-  <?endif?>
-
-  <?ifndef env.QEMU_GA_MANUFACTURER ?>
-    <?error Environment variable QEMU_GA_MANUFACTURER undefined?>
-  <?endif?>
-
   <?ifndef var.Arch?>
     <?error Define Arch to 32 or 64?>
   <?endif?>
@@ -43,20 +31,20 @@
     Name="QEMU guest agent"
     Id="*"
     UpgradeCode="{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
-    Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
-    Version="$(env.QEMU_GA_VERSION)"
+    Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
+    Version="$(var.QEMU_GA_VERSION)"
     Language="1033">
     <?if $(var.Arch) = 32 ?>
     <Condition Message="Error: 32-bit version of Qemu GA can not be installed on 64-bit Windows.">NOT VersionNT64</Condition>
     <?endif?>
     <Package
-      Manufacturer="$(env.QEMU_GA_MANUFACTURER)"
+      Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
       InstallerVersion="200"
       Languages="1033"
       Compressed="yes"
       InstallScope="perMachine"
       />
-    <Media Id="1" Cabinet="qemu_ga.$(env.QEMU_GA_VERSION).cab" EmbedCab="yes" />
+    <Media Id="1" Cabinet="qemu_ga.$(var.QEMU_GA_VERSION).cab" EmbedCab="yes" />
     <Property Id="WHSLogo">1</Property>
     <MajorUpgrade
       DowngradeErrorMessage="Error: A newer version of QEMU guest agent is already installed."
@@ -66,7 +54,7 @@
       <Directory Id="$(var.GaProgramFilesFolder)" Name="QEMU Guest Agent">
         <Directory Id="qemu_ga_directory" Name="Qemu-ga">
           <Component Id="qemu_ga" Guid="{908B7199-DE2A-4DC6-A8D0-27A5AE444FEA}">
-            <File Id="qemu_ga.exe" Name="qemu-ga.exe" Source="$(env.BUILD_DIR)/qga/qemu-ga.exe" KeyPath="yes" DiskId="1"/>
+            <File Id="qemu_ga.exe" Name="qemu-ga.exe" Source="$(var.BUILD_DIR)/qga/qemu-ga.exe" KeyPath="yes" DiskId="1"/>
             <ServiceInstall
               Id="ServiceInstaller"
               Type="ownProcess"
@@ -88,10 +76,10 @@
             <File Id="libstdc++-6.lib" Name="libstdc++-6.dll" Source="$(var.Mingw_bin)/libstdc++-6.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="qga_vss_dll" Guid="{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
-            <File Id="qga_vss.dll" Name="qga-vss.dll" Source="$(env.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath="yes" DiskId="1"/>
+            <File Id="qga_vss.dll" Name="qga-vss.dll" Source="$(var.BUILD_DIR)/qga/vss-win32/qga-vss.dll" KeyPath="yes" DiskId="1"/>
           </Component>
           <Component Id="qga_vss_tlb" Guid="{D8D584B1-59C2-4FB7-A91F-636FF7BFA66E}">
-            <File Id="qga_vss.tlb" Name="qga-vss.tlb" Source="$(env.BUILD_DIR)/qga/vss-win32/qga-vss.tlb" KeyPath="yes" DiskId="1"/>
+            <File Id="qga_vss.tlb" Name="qga-vss.tlb" Source="$(var.BUILD_DIR)/qga/vss-win32/qga-vss.tlb" KeyPath="yes" DiskId="1"/>
           </Component>
           <?endif?>
           <?if $(var.Arch) = "32"?>
@@ -133,9 +121,9 @@
           </Component>
           <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
             <RegistryKey Root="HKLM"
-                         Key="Software\$(env.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
+                         Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(var.QEMU_GA_DISTRO)\Tools\QemuGA">
               <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
-              <RegistryValue Type="string" Name="Version" Value="$(env.QEMU_GA_VERSION)" />
+              <RegistryValue Type="string" Name="Version" Value="$(var.QEMU_GA_VERSION)" />
             </RegistryKey>
           </Component>
         </Directory>
diff --git a/qga/meson.build b/qga/meson.build
index 6d9f39bb32..3ad3bc0260 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -121,15 +121,14 @@ if targetos == 'windows'
                             output: 'qemu-ga-@0@.msi'.format(host_arch),
                             depends: deps,
                             command: [
-                              find_program('env'),
-                              'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
-                              'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
-                              'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
-                              'BUILD_DIR=' + meson.build_root(),
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
+                              '-D', 'BUILD_DIR=' + meson.build_root(),
                               '-D', 'Mingw_bin=' + config_host['QEMU_GA_MSI_MINGW_BIN_PATH'],
+                              '-D', 'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
+                              '-D', 'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
+                              '-D', 'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
                             ])
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
-- 
2.36.1


