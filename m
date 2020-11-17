Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D092B6FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 21:25:13 +0100 (CET)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf7XM-0003Ej-DI
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 15:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kf7Rt-0000K9-DU
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 15:19:33 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:51036
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kf7Rr-000639-4D
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 15:19:32 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 8F96DDA15EB;
 Tue, 17 Nov 2020 21:19:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id C_1VE8Lih6xw; Tue, 17 Nov 2020 21:18:42 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 792FADA061C;
 Tue, 17 Nov 2020 21:18:42 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 370EE460019; Tue, 17 Nov 2020 21:18:42 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: [PATCH for-5.2] meson: Fix build with --disable-guest-agent-msi
Date: Tue, 17 Nov 2020 21:18:34 +0100
Message-Id: <20201117201834.408892-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 14:07:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QGA MSI target requires several macros which are only available
without --disable-guest-agent-msi.

Don't define that target if configure was called with --disable-guest-agent-msi.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qga/meson.build | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/qga/meson.build b/qga/meson.build
index 53ba6de5f8..520af6ce9b 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -61,23 +61,25 @@ if targetos == 'windows'
     if 'CONFIG_QGA_VSS' in config_host and 'QEMU_GA_MSI_WITH_VSS' in config_host
       deps += qga_vss
     endif
-    qga_msi = custom_target('QGA MSI',
-                            input: files('installer/qemu-ga.wxs'),
-                            output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
-                            depends: deps,
-                            command: [
-                              find_program('env'),
-                              'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
-                              'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
-                              'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
-                              'BUILD_DIR=' + meson.build_root(),
-                              wixl, '-o', '@OUTPUT0@', '@INPUT0@',
-                              config_host['QEMU_GA_MSI_ARCH'].split(),
-                              config_host['QEMU_GA_MSI_WITH_VSS'].split(),
-                              config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
-                            ])
-    all_qga += [qga_msi]
-    alias_target('msi', qga_msi)
+    if 'CONFIG_QGA_MSI' in config_host
+      qga_msi = custom_target('QGA MSI',
+                              input: files('installer/qemu-ga.wxs'),
+                              output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
+                              depends: deps,
+                              command: [
+                                find_program('env'),
+                                'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
+                                'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
+                                'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
+                                'BUILD_DIR=' + meson.build_root(),
+                                wixl, '-o', '@OUTPUT0@', '@INPUT0@',
+                                config_host['QEMU_GA_MSI_ARCH'].split(),
+                                config_host['QEMU_GA_MSI_WITH_VSS'].split(),
+                                config_host['QEMU_GA_MSI_MINGW_DLL_PATH'].split(),
+                              ])
+      all_qga += [qga_msi]
+      alias_target('msi', qga_msi)
+    endif
   endif
 else
   install_subdir('run', install_dir: get_option('localstatedir'))
-- 
2.29.2


