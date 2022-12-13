Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF89B64B82B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 16:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56yH-0000QW-EA; Tue, 13 Dec 2022 10:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p56yF-0000Q6-7C; Tue, 13 Dec 2022 10:13:27 -0500
Received: from relay.virtuozzo.com ([130.117.225.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p56yD-0002vQ-5D; Tue, 13 Dec 2022 10:13:26 -0500
Received: from [192.168.16.151] (helo=roughy.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <andrey.drobyshev@virtuozzo.com>) id 1p56xU-00Ewjh-KY;
 Tue, 13 Dec 2022 16:12:40 +0100
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, andrey.drobyshev@virtuozzo.com, den@virtuozzo.com,
 kkostiuk@redhat.com, sw@weilnetz.de
Subject: [PATCH v2] qga-win: choose the right libpcre version to include in
 MSI package
Date: Tue, 13 Dec 2022 17:13:43 +0200
Message-Id: <20221213151343.90235-1-andrey.drobyshev@virtuozzo.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=andrey.drobyshev@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
From:  Andrey Drobyshev via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

According to GLib changelog [1], since version 2.73.2 GLib is using
libpcre2 instead of libpcre.  As a result, qemu-ga MSI installation
fails due to missing DLL when linked with the newer GLib.

This commit makes wixl to put the right libpcre version into the MSI
bundle: either libpcre-1.dll or libpcre2-8-0.dll, depending on the
present version of GLib.

[1] https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2

Previous version:
https://lists.nongnu.org/archive/html/qemu-trivial/2022-11/msg00237.html

Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
---
 qga/installer/qemu-ga.wxs | 12 +++++++++---
 qga/meson.build           |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index e344c38e74..9f0bacae81 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -101,9 +101,15 @@
           <Component Id="libwinpthread" Guid="{6C117C78-0F47-4B07-8F34-6BEE11643829}">
             <File Id="libwinpthread_1.dll" Name="libwinpthread-1.dll" Source="$(var.BIN_DIR)/libwinpthread-1.dll" KeyPath="yes" DiskId="1"/>
           </Component>
-          <Component Id="libpcre" Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
-            <File Id="libpcre_1.dll" Name="libpcre-1.dll" Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
-          </Component>
+          <?if $(var.LIBPCRE) = "libpcre1"?>
+            <Component Id="libpcre" Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
+              <File Id="libpcre_1.dll" Name="libpcre-1.dll" Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
+            </Component>
+          <?else?>
+            <Component Id="libpcre" Guid="{F92A3804-B59C-419D-8F29-99A30352C156}">
+              <File Id="libpcre2_8_0.dll" Name="libpcre2-8-0.dll" Source="$(var.BIN_DIR)/libpcre2-8-0.dll" KeyPath="yes" DiskId="1"/>
+            </Component>
+          <?endif?>
           <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
             <RegistryKey Root="HKLM"
                          Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(var.QEMU_GA_DISTRO)\Tools\QemuGA">
diff --git a/qga/meson.build b/qga/meson.build
index 1ff159edc1..ad17dc7dca 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -140,6 +140,11 @@ if targetos == 'windows'
       qemu_ga_msi_vss = ['-D', 'InstallVss']
       deps += qga_vss
     endif
+    if glib.version() < '2.73.2'
+      libpcre = 'libpcre1'
+    else
+      libpcre = 'libpcre2'
+    endif
     qga_msi = custom_target('QGA MSI',
                             input: files('installer/qemu-ga.wxs'),
                             output: 'qemu-ga-@0@.msi'.format(host_arch),
@@ -153,6 +158,7 @@ if targetos == 'windows'
                               '-D', 'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               '-D', 'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
                               '-D', 'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
+                              '-D', 'LIBPCRE=' + libpcre,
                             ])
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
-- 
2.34.3


