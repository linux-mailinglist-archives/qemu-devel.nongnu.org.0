Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800964EC6E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:57:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BB8-0008LU-F0; Fri, 16 Dec 2022 08:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAv-0008FR-Rl
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAu-0007me-8E
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdkUecZ3fnFBz2ce6lTzIducoVVwFlj7f/bkGwutaWQ=;
 b=HF09qMPLEarO0U7A3JcTU6Au/h/x69GSW7m1kqoc6+K6ozvmYfdlrZUPjo/ctixkp3dJD6
 XRGhkULyf9TFFUnav0liNWsQYyTZGWJmupdZiG3V25sCuzRrSqOUt6ZRMx9aN+k8ml/NuE
 IdCFS7C2h8RFTTU++MQBfpJByGh51G0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-j5XbqbytN-qJoQahaSmkuA-1; Fri, 16 Dec 2022 08:54:51 -0500
X-MC-Unique: j5XbqbytN-qJoQahaSmkuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8504A1C08980;
 Fri, 16 Dec 2022 13:54:51 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A259E40C2064;
 Fri, 16 Dec 2022 13:54:50 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 6/8] qga-win: choose the right libpcre version to include in
 MSI package
Date: Fri, 16 Dec 2022 15:54:37 +0200
Message-Id: <20221216135439.465033-7-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
References: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Andrey Drobyshev via <qemu-devel@nongnu.org>

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
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/installer/qemu-ga.wxs | 12 +++++++++---
 qga/meson.build           |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 813d1c6ca6..447effdfe1 100644
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
index 3cfb9166e5..d3b0f8bbd0 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -123,6 +123,11 @@ if targetos == 'windows'
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
@@ -136,6 +141,7 @@ if targetos == 'windows'
                               '-D', 'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               '-D', 'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
                               '-D', 'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
+                              '-D', 'LIBPCRE=' + libpcre,
                             ])
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
-- 
2.25.1


