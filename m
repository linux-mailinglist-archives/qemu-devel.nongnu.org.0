Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088684ADF9A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:27:15 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUGo-000103-32
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRka-0004cm-PL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHRkY-0001sV-He
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkU+3bMXQ5Q1RXFuQl/YoAUzbZXdN9D5MiHPMBhEA5M=;
 b=bwEyMi/xxakF9uA+NLJJ96f+gcRLR6CO05IKxkEDk2X3JmaACFozFI1lS0NZrdonnhitzd
 kn8qIYT34BLr79X7+yjBS3hKAMZGvFwG8HRnTQv9C/1MroxJ9RGsvprPb228tRCRo+wM2C
 qDZi3zTR8mxnMXDrU8J399TL5jYy5Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-rpGCOerCMZyGBnodhBouXw-1; Tue, 08 Feb 2022 09:45:42 -0500
X-MC-Unique: rpGCOerCMZyGBnodhBouXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 811FE1091DA0;
 Tue,  8 Feb 2022 14:45:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1AD77D3CE;
 Tue,  8 Feb 2022 14:45:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] introduce qemu-qmp-*
Date: Tue,  8 Feb 2022 09:44:58 -0500
Message-Id: <20220208144458.1079634-4-pbonzini@redhat.com>
In-Reply-To: <20220208144458.1079634-1-pbonzini@redhat.com>
References: <20220208144458.1079634-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 armbru@redhat.com, f4bug@amsat.org, mirela.grujic@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                 |  16 +++--
 softmmu/{vl.c => climain.c} |   2 +-
 softmmu/meson.build         |   1 -
 softmmu/qmpmain.c           | 120 ++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+), 6 deletions(-)
 rename softmmu/{vl.c => climain.c} (99%)
 create mode 100644 softmmu/qmpmain.c

diff --git a/meson.build b/meson.build
index 5f43355071..eed85d3d1a 100644
--- a/meson.build
+++ b/meson.build
@@ -3003,14 +3003,21 @@ foreach target : target_dirs
     execs = [{
       'name': 'qemu-system-' + target_name,
       'win_subsystem': 'console',
-      'sources': files('softmmu/main.c'),
+      'sources': [files('softmmu/climain.c', 'softmmu/main.c')],
       'dependencies': []
     }]
-    if targetos == 'windows' and (sdl.found() or gtk.found())
+    if targetos != 'windows'
+      execs += [{
+        'name': 'qemu-qmp-' + target_name,
+        'win_subsystem': 'console',
+        'sources': [files('softmmu/qmpmain.c', 'softmmu/main.c')],
+        'dependencies': []
+      }]
+    elif sdl.found() or gtk.found()
       execs += [{
         'name': 'qemu-system-' + target_name + 'w',
         'win_subsystem': 'windows',
-        'sources': files('softmmu/main.c'),
+        'sources': [files('softmmu/climain.c', 'softmmu/main.c')],
         'dependencies': []
       }]
     endif
@@ -3019,7 +3026,7 @@ foreach target : target_dirs
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
         'win_subsystem': 'console',
-        'sources': specific_fuzz.sources(),
+        'sources': [files('softmmu/climain.c'), specific_fuzz.sources()],
         'dependencies': specific_fuzz.dependencies(),
       }]
     endif
@@ -3040,6 +3047,7 @@ foreach target : target_dirs
     emulator = executable(exe_name, exe['sources'],
                install: true,
                c_args: c_args,
+               include_directories: target_inc,
                dependencies: arch_deps + deps + exe['dependencies'],
                objects: lib.extract_all_objects(recursive: true),
                link_language: link_language,
diff --git a/softmmu/vl.c b/softmmu/climain.c
similarity index 99%
rename from softmmu/vl.c
rename to softmmu/climain.c
index 5e1b35ba48..0489850415 100644
--- a/softmmu/vl.c
+++ b/softmmu/climain.c
@@ -1,5 +1,5 @@
 /*
- * QEMU System Emulator
+ * QEMU System Emulator command-line interface
  *
  * Copyright (c) 2003-2008 Fabrice Bellard
  *
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018ab..d53673f8d2 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -12,7 +12,6 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'memory.c',
   'memory_mapping.c',
   'qtest.c',
-  'vl.c',
   'cpu-timers.c',
   'runstate-action.c',
 )])
diff --git a/softmmu/qmpmain.c b/softmmu/qmpmain.c
new file mode 100644
index 0000000000..d976736ed9
--- /dev/null
+++ b/softmmu/qmpmain.c
@@ -0,0 +1,120 @@
+/*
+ * QEMU System Emulator machine interface
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/rcu.h"
+#include "qemu-common.h"
+#include "chardev/char.h"
+#include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-types-sockets.h"
+#include "qemu/systemd.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/sysemu.h"
+#include "ui/console.h"
+#include "hw/qdev-core.h"
+
+static void open_socket_and_monitor(void)
+{
+    int nfds = check_socket_activation();
+    Chardev *chardev;
+    if (nfds > 1) {
+        error_report("QEMU only supports listening on one socket");
+        exit(1);
+    }
+    if (!nfds) {
+        ChardevBackend backend = {
+            .type = CHARDEV_BACKEND_KIND_STDIO,
+            .u.stdio.data = &(ChardevStdio) {
+                .has_signal = true,
+                .signal = false
+            }
+        };
+        chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_STDIO, &backend, NULL, &error_fatal);
+    } else {
+        ChardevBackend backend = {
+           .type = CHARDEV_BACKEND_KIND_SOCKET,
+           .u.socket.data = &(ChardevSocket) {
+               .addr = &(SocketAddressLegacy) {
+                   .type = SOCKET_ADDRESS_TYPE_FD,
+                   .u.fd.data = &(String){
+                       .str = (char *) stringify(FIRST_SOCKET_ACTIVATION_FD)
+                   }
+               }
+           }
+        };
+        chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_SOCKET, &backend, NULL, &error_fatal);
+    }
+    monitor_init_qmp(chardev, true, &error_fatal);
+}
+
+bool defaults_enabled(void)
+{
+    return false;
+}
+
+DisplayOptions *qmp_query_display_options(Error **errp)
+{
+    error_setg(errp, "You're running too fast!");
+    return NULL;
+}
+
+Chardev *serial_hd(int i)
+{
+    return NULL;
+}
+
+void qmp_x_exit_preconfig(Error **errp)
+{
+    error_setg(errp, "You're running too fast!");
+}
+
+void qemu_init(int argc, char **argv, char **envp)
+{
+    error_init(argv[0]);
+    qemu_init_exec_dir(argv[0]);
+
+    qemu_init_subsystems();
+
+    /* Missing: parse -name, -sandbox, -trace, -L */
+
+    /*
+     * Clear error location left behind by the loop.
+     * Best done right after the loop.  Do not insert code here!
+     */
+    loc_set_none();
+
+    /* Missing: process -name, -sandbox, -trace, -L */
+
+    rcu_disable_atfork();
+    qemu_init_main_loop(&error_fatal);
+    cpu_timers_init();
+    open_socket_and_monitor();
+
+    /* Missing: replay_configure, configure_rtc */
+
+    /* machine-set:
+     *    qemu_create_machine();
+     *    qemu_apply_machine_options();
+     *    phase_advance(PHASE_MACHINE_CREATED);
+     *
+     * accel-set:
+     *    configure_accelerators(argv[0]);
+     *    phase_advance(PHASE_ACCEL_CREATED);
+     *    machine type deprecation
+     *    migration_object_init();
+     *    cpu_type...
+     *    accel_setup_post(current_machine);
+     *    machine_run_board_init(current_machine, errp);
+     */
+
+    init_displaystate();
+    os_setup_signal_handling();
+}
-- 
2.31.1


