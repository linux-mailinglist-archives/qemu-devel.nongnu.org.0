Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E0445E8D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:23:03 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipoj-00071E-Kc
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1miplY-00047Z-Tm
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:44 -0400
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:57936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1miplV-0003zC-Gn
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07760695|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.000804269-0.000131237-0.999065;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.LnnfNlI_1636082370; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LnnfNlI_1636082370)
 by smtp.aliyun-inc.com(10.147.40.26); Fri, 05 Nov 2021 11:19:31 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Support modules for Windows
Date: Fri,  5 Nov 2021 11:19:25 +0800
Message-Id: <20211105031925.83740-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.169; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-169.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 configure   |  7 +------
 meson.build | 34 ++++++++++++++++++++++++----------
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index 33682cb971..6280e412a9 100755
--- a/configure
+++ b/configure
@@ -1422,7 +1422,7 @@ cat << EOF
   bsd-user        all BSD usermode emulation targets
   guest-agent     build the QEMU Guest Agent
   pie             Position Independent Executables
-  modules         modules support (non-Windows)
+  modules         modules support
   module-upgrades try to load modules from alternate paths for upgrades
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
@@ -1698,11 +1698,6 @@ else
   QEMU_CFLAGS="$QEMU_CFLAGS -Wno-missing-braces"
 fi
 
-# Our module code doesn't support Windows
-if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
-  error_exit "Modules are not available for Windows"
-fi
-
 # module_upgrades is only reasonable if modules are enabled
 if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
   error_exit "Can't enable module-upgrades as Modules are not enabled"
diff --git a/meson.build b/meson.build
index 47df10afc2..26195cb24f 100644
--- a/meson.build
+++ b/meson.build
@@ -2625,7 +2625,7 @@ block_mods = []
 softmmu_mods = []
 foreach d, list : modules
   foreach m, module_ss : list
-    if enable_modules and targetos != 'windows'
+    if enable_modules
       module_ss = module_ss.apply(config_all, strict: false)
       sl = static_library(d + '-' + m, [genh, module_ss.sources()],
                           dependencies: [modulecommon, module_ss.dependencies()], pic: true)
@@ -2658,7 +2658,7 @@ endforeach
 
 foreach d, list : target_modules
   foreach m, module_ss : list
-    if enable_modules and targetos != 'windows'
+    if enable_modules
       foreach target : target_dirs
         if target.endswith('-softmmu')
           config_target = config_target_mak[target]
@@ -2800,14 +2800,15 @@ common_ss.add(hwcore)
 ###########
 # Targets #
 ###########
-
-foreach m : block_mods + softmmu_mods
-  shared_module(m.name(),
-                name_prefix: '',
-                link_whole: m,
-                install: true,
-                install_dir: qemu_moddir)
-endforeach
+if targetos != 'windows'
+  foreach m : block_mods + softmmu_mods
+    shared_module(m.name(),
+                  name_prefix: '',
+                  link_whole: m,
+                  install: true,
+                  install_dir: qemu_moddir)
+  endforeach
+endif
 
 softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
@@ -2826,6 +2827,7 @@ common_all = static_library('common',
 feature_to_c = find_program('scripts/feature_to_c.sh')
 
 emulators = {}
+emulator = 0
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
@@ -2966,6 +2968,7 @@ foreach target : target_dirs
                link_language: link_language,
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
+               implib: true,
                win_subsystem: exe['win_subsystem'])
 
     if targetos == 'darwin'
@@ -3023,6 +3026,17 @@ foreach target : target_dirs
     endif
   endforeach
 endforeach
+if (targetos == 'windows')
+  foreach m : block_mods + softmmu_mods
+    shared_module(m.name(),
+	    name_prefix: '',
+	    link_whole: m,
+	    install: true,
+	    dependencies: glib,
+	    link_with: emulator,
+	    install_dir: qemu_moddir)
+  endforeach
+endif
 
 # Other build targets
 
-- 
2.25.1


