Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CE2C7D2E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 04:13:36 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZd9-0006k1-FA
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 22:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjZXI-00086S-29; Sun, 29 Nov 2020 22:07:32 -0500
Received: from mail.csgraf.de ([188.138.100.120]:35290
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjZXD-00076d-Ko; Sun, 29 Nov 2020 22:07:31 -0500
Received: from localhost.localdomain
 (dynamic-077-009-091-089.77.9.pool.telefonica.de [77.9.91.89])
 by csgraf.de (Postfix) with ESMTPSA id 0E1B73900384;
 Mon, 30 Nov 2020 04:07:25 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hvf: Add hypervisor entitlement to output binaries
Date: Mon, 30 Nov 2020 04:07:16 +0100
Message-Id: <20201130030723.78326-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201130030723.78326-1-agraf@csgraf.de>
References: <20201130030723.78326-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
respective entitlement. Add an entitlement template and automatically self
sign and apply the entitlement in the build.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Make safe to ctrl-C
---
 accel/hvf/entitlements.plist |  8 ++++++++
 meson.build                  | 30 ++++++++++++++++++++++++++----
 scripts/entitlement.sh       | 13 +++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100755 scripts/entitlement.sh

diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
new file mode 100644
index 0000000000..154f3308ef
--- /dev/null
+++ b/accel/hvf/entitlements.plist
@@ -0,0 +1,8 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
+<plist version="1.0">
+<dict>
+    <key>com.apple.security.hypervisor</key>
+    <true/>
+</dict>
+</plist>
diff --git a/meson.build b/meson.build
index 5062407c70..2a7ff5560c 100644
--- a/meson.build
+++ b/meson.build
@@ -1844,9 +1844,14 @@ foreach target : target_dirs
     }]
   endif
   foreach exe: execs
-    emulators += {exe['name']:
-         executable(exe['name'], exe['sources'],
-               install: true,
+    exe_name = exe['name']
+    exe_sign = 'CONFIG_HVF' in config_target
+    if exe_sign
+      exe_name += '-unsigned'
+    endif
+
+    emulator = executable(exe_name, exe['sources'],
+               install: not exe_sign,
                c_args: c_args,
                dependencies: arch_deps + deps + exe['dependencies'],
                objects: lib.extract_all_objects(recursive: true),
@@ -1854,7 +1859,24 @@ foreach target : target_dirs
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
                gui_app: exe['gui'])
-    }
+
+    if exe_sign
+      exe_full = meson.current_build_dir() / exe['name']
+      emulators += {exe['name'] : custom_target(exe['name'],
+                   install: true,
+                   install_dir: get_option('bindir'),
+                   depends: emulator,
+                   output: exe['name'],
+                   command: [
+                     meson.current_source_dir() / 'scripts/entitlement.sh',
+                     meson.current_build_dir() / exe['name'] + '-unsigned',
+                     meson.current_build_dir() / exe['name'],
+                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+                   ])
+      }
+    else
+      emulators += {exe['name']: emulator}
+    endif
 
     if 'CONFIG_TRACE_SYSTEMTAP' in config_host
       foreach stp: [
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
new file mode 100755
index 0000000000..c540fa6435
--- /dev/null
+++ b/scripts/entitlement.sh
@@ -0,0 +1,13 @@
+#!/bin/sh -e
+#
+# Helper script for the build process to apply entitlements
+
+SRC="$1"
+DST="$2"
+ENTITLEMENT="$3"
+
+trap 'rm "$DST.tmp"' exit
+cp -af "$SRC" "$DST.tmp"
+codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
+mv "$DST.tmp" "$DST"
+trap '' exit
-- 
2.24.3 (Apple Git-128)


