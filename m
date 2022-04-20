Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9031508ABC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:24:45 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBG8-0003FJ-Tw
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMZ-0005sj-L1
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMX-0004Td-Jy
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gn6oTfNR11dSJgc7IJQScc8iucP8X8SkdT/VhxTf8nw=;
 b=BFLQWiu21GPbXpUFTFehzs2Dm5aXPOPGY3wYGsvEyKrRoay4pKVeppkmw0DtzTgTY0x27V
 TcaGMiKyqKjSOitN2zmuRPJf9aErsHOgGLeSI7SGholAhOqMNsEZVfO8GvI3/JRRRyRryb
 j7qX0ernjaDOkf3EkLINYyoxb3ILmz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5--Kup17eaOKyMJlcpFbpSnQ-1; Wed, 20 Apr 2022 09:27:13 -0400
X-MC-Unique: -Kup17eaOKyMJlcpFbpSnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BA7E811E78;
 Wed, 20 Apr 2022 13:27:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0C77774;
 Wed, 20 Apr 2022 13:27:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 09/41] build-sys: simplify MSI's QEMU_GA_VERSION
Date: Wed, 20 Apr 2022 17:25:52 +0400
Message-Id: <20220420132624.2439741-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

No need to pass it from configure environment down to wixl. Let simply
set a wixl -D variable. If it needs to be configurable, we should have a
proper option.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure                 |  4 ----
 qga/installer/qemu-ga.wxs | 10 +++++-----
 qga/meson.build           |  2 +-
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 5ac653b21351..321e66809234 100755
--- a/configure
+++ b/configure
@@ -2697,9 +2697,6 @@ fi
 if test "$QEMU_GA_DISTRO" = ""; then
   QEMU_GA_DISTRO=Linux
 fi
-if test "$QEMU_GA_VERSION" = ""; then
-    QEMU_GA_VERSION=$(cat $source_path/VERSION)
-fi
 
 # Mac OS X ships with a broken assembler
 roms=
@@ -2788,7 +2785,6 @@ fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   echo "QEMU_GA_DISTRO=${QEMU_GA_DISTRO}" >> $config_host_mak
-  echo "QEMU_GA_VERSION=${QEMU_GA_VERSION}" >> $config_host_mak
 else
   echo "CONFIG_POSIX=y" >> $config_host_mak
 fi
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 53d836c06a96..2c49a2336e11 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -1,7 +1,7 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Wix xmlns="http://schemas.microsoft.com/wix/2006/wi">
-  <?ifndef env.QEMU_GA_VERSION ?>
-    <?error Environment variable QEMU_GA_VERSION undefined?>
+  <?ifndef var.QEMU_GA_VERSION ?>
+    <?error Variable QEMU_GA_VERSION undefined ?>
   <?endif?>
 
   <?ifndef env.QEMU_GA_DISTRO ?>
@@ -42,7 +42,7 @@
     Id="*"
     UpgradeCode="{EB6B8302-C06E-4BEC-ADAC-932C68A3A98D}"
     Manufacturer="$(var.QEMU_GA_MANUFACTURER)"
-    Version="$(env.QEMU_GA_VERSION)"
+    Version="$(var.QEMU_GA_VERSION)"
     Language="1033">
     <?if $(var.Arch) = 32 ?>
     <Condition Message="Error: 32-bit version of Qemu GA can not be installed on 64-bit Windows.">NOT VersionNT64</Condition>
@@ -54,7 +54,7 @@
       Compressed="yes"
       InstallScope="perMachine"
       />
-    <Media Id="1" Cabinet="qemu_ga.$(env.QEMU_GA_VERSION).cab" EmbedCab="yes" />
+    <Media Id="1" Cabinet="qemu_ga.$(var.QEMU_GA_VERSION).cab" EmbedCab="yes" />
     <Property Id="WHSLogo">1</Property>
     <MajorUpgrade
       DowngradeErrorMessage="Error: A newer version of QEMU guest agent is already installed."
@@ -133,7 +133,7 @@
             <RegistryKey Root="HKLM"
                          Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(env.QEMU_GA_DISTRO)\Tools\QemuGA">
               <RegistryValue Type="string" Name="ProductID" Value="fb0a0d66-c7fb-4e2e-a16b-c4a3bfe8d13b" />
-              <RegistryValue Type="string" Name="Version" Value="$(env.QEMU_GA_VERSION)" />
+              <RegistryValue Type="string" Name="Version" Value="$(var.QEMU_GA_VERSION)" />
             </RegistryKey>
           </Component>
         </Directory>
diff --git a/qga/meson.build b/qga/meson.build
index 6e57de430d29..fb437062612e 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -122,12 +122,12 @@ if targetos == 'windows'
                             depends: deps,
                             command: [
                               find_program('env'),
-                              'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
                               'BUILD_DIR=' + meson.build_root(),
                               wixl, '-o', '@OUTPUT0@', '@INPUT0@',
                               qemu_ga_msi_arch[cpu],
                               qemu_ga_msi_vss,
+                              '-D', 'QEMU_GA_VERSION=' + meson.project_version(),
                             ])
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
-- 
2.35.1.693.g805e0a68082a


