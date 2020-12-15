Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B62DB345
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:08:57 +0100 (CET)
Received: from localhost ([::1]:57746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEkq-0004Lo-Qc
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXM-00037F-Ux
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXH-0001UR-W7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWSF7Fum71TItsPJ2akCp3uKJmKCONJRf8BYpa6EcmY=;
 b=G5XCf4H4Dz9COSFMqjstVQ7nWouLvKbDVh6aYdCbIaaKbV99FY/zs7kAQy3dhnzbV++PYb
 2vY0yplDn2cmn/xgve23H5Wc+MxWnnJP2J4uik20ux6gRDRX3VazRtIf5j6L18yiS/dL+T
 DTrqbG83r9FTqtExWkmY3bvsZqTe8cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Ns6DadTUNUG50ab9xE1tvg-1; Tue, 15 Dec 2020 12:54:52 -0500
X-MC-Unique: Ns6DadTUNUG50ab9xE1tvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDD5210054FF;
 Tue, 15 Dec 2020 17:54:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CC12100238C;
 Tue, 15 Dec 2020 17:54:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/45] qmp: generalize watchdog-set-action to
 -no-reboot/-no-shutdown
Date: Tue, 15 Dec 2020 12:54:14 -0500
Message-Id: <20201215175445.1272776-15-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>

Add a QMP command to allow for the behaviors specified by the
-no-reboot and -no-shutdown command line option to be set at runtime.
The new command is named set-action and takes optional arguments, named
after an event, that provide a corresponding action to take.

Example:

-> { "execute": "set-action",
     "arguments": {
	"reboot": "none",
	"shutdown": "poweroff",
	"watchdog": "debug" } }
<- { "return": {} }

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Message-Id: <1607705564-26264-4-git-send-email-alejandro.j.jimenez@oracle.com>
[Split the series differently, with -action based on the QMP command. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                      |  2 ++
 include/sysemu/runstate-action.h | 18 ++++++++++
 include/sysemu/sysemu.h          |  2 --
 monitor/qmp-cmds.c               |  3 +-
 qapi/run-state.json              | 58 ++++++++++++++++++++++++++++++++
 softmmu/globals.c                |  2 --
 softmmu/meson.build              |  1 +
 softmmu/runstate-action.c        | 41 ++++++++++++++++++++++
 softmmu/runstate.c               | 10 +++---
 softmmu/vl.c                     |  5 +--
 ui/sdl2.c                        |  5 +--
 11 files changed, 134 insertions(+), 13 deletions(-)
 create mode 100644 include/sysemu/runstate-action.h
 create mode 100644 softmmu/runstate-action.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 138b4ed461..1d6ea877be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2357,6 +2357,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
+F: include/sysemu/runstate-action.h
 F: util/main-loop.c
 F: util/qemu-timer.c
 F: softmmu/vl.c
@@ -2365,6 +2366,7 @@ F: softmmu/cpus.c
 F: softmmu/cpu-throttle.c
 F: softmmu/cpu-timers.c
 F: softmmu/icount.c
+F: softmmu/runstate-action.c
 F: qapi/run-state.json
 
 Read, Copy, Update (RCU)
diff --git a/include/sysemu/runstate-action.h b/include/sysemu/runstate-action.h
new file mode 100644
index 0000000000..51a461c4ac
--- /dev/null
+++ b/include/sysemu/runstate-action.h
@@ -0,0 +1,18 @@
+/*
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef RUNSTATE_ACTION_H
+#define RUNSTATE_ACTION_H
+
+#include "qapi/qapi-commands-run-state.h"
+
+/* in softmmu/runstate-action.c */
+extern RebootAction reboot_action;
+extern ShutdownAction shutdown_action;
+
+#endif /* RUNSTATE_ACTION_H */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index e8f463ff30..8fae667172 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -43,8 +43,6 @@ extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
 extern int graphic_rotate;
-extern int no_shutdown;
-extern int no_reboot;
 extern int old_param;
 extern int boot_menu;
 extern bool boot_strict;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index d141aaa132..34f7e75b7b 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -26,6 +26,7 @@
 #include "ui/vnc.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
@@ -72,7 +73,7 @@ UuidInfo *qmp_query_uuid(Error **errp)
 
 void qmp_quit(Error **errp)
 {
-    no_shutdown = 0;
+    shutdown_action = SHUTDOWN_ACTION_POWEROFF;
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_QMP_QUIT);
 }
 
diff --git a/qapi/run-state.json b/qapi/run-state.json
index a47c500f83..25e82d1be1 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -325,6 +325,34 @@
   'data': [ 'reset', 'shutdown', 'poweroff', 'pause', 'debug', 'none',
             'inject-nmi' ] }
 
+##
+# @RebootAction:
+#
+# Possible QEMU actions upon guest reboot
+#
+# @none: Reset the VM
+#
+# @shutdown: Shutdown the VM and exit
+#
+# Since: 6.0
+##
+{ 'enum': 'RebootAction',
+  'data': [ 'none', 'shutdown' ] }
+
+##
+# @ShutdownAction:
+#
+# Possible QEMU actions upon guest shutdown
+#
+# @poweroff: Shutdown the VM and exit
+#
+# @pause: pause the VM#
+#
+# Since: 6.0
+##
+{ 'enum': 'ShutdownAction',
+  'data': [ 'poweroff', 'pause' ] }
+
 ##
 # @watchdog-set-action:
 #
@@ -334,6 +362,36 @@
 ##
 { 'command': 'watchdog-set-action', 'data' : {'action': 'WatchdogAction'} }
 
+##
+# @set-action:
+#
+# Set the actions that will be taken by the emulator in response to guest
+# events.
+#
+# @reboot: @RebootAction action taken on guest reboot.
+#
+# @shutdown: @ShutdownAction action taken on guest shutdown.
+#
+# @watchdog: @WatchdogAction action taken when watchdog timer expires .
+#
+# Returns: Nothing on success.
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "set-action",
+#      "arguments": { "reboot": "shutdown",
+#                     "shutdown" : "pause",
+#                     "watchdog": "inject-nmi" } }
+# <- { "return": {} }
+##
+{ 'command': 'set-action',
+  'data': { '*reboot': 'RebootAction',
+            '*shutdown': 'ShutdownAction',
+            '*watchdog': 'WatchdogAction' },
+  'allow-preconfig': true }
+
 ##
 # @GUEST_PANICKED:
 #
diff --git a/softmmu/globals.c b/softmmu/globals.c
index e62d9cd8da..7d0fc81183 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -46,8 +46,6 @@ Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
 int singlestep;
 int fd_bootchk = 1;
-int no_reboot;
-int no_shutdown;
 int graphic_rotate;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
 int nb_option_roms;
diff --git a/softmmu/meson.build b/softmmu/meson.build
index e5865b97cb..2dab6c7eb6 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -14,6 +14,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'qtest.c',
   'vl.c',
   'cpu-timers.c',
+  'runstate-action.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
new file mode 100644
index 0000000000..44de01adaf
--- /dev/null
+++ b/softmmu/runstate-action.c
@@ -0,0 +1,41 @@
+/*
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/runstate-action.h"
+#include "sysemu/watchdog.h"
+#include "qemu/config-file.h"
+#include "qapi/error.h"
+#include "qemu/option_int.h"
+
+RebootAction reboot_action = REBOOT_ACTION_NONE;
+ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+
+/*
+ * Receives actions to be applied for specific guest events
+ * and sets the internal state as requested.
+ */
+void qmp_set_action(bool has_reboot, RebootAction reboot,
+                    bool has_shutdown, ShutdownAction shutdown,
+                    bool has_panic, PanicAction panic,
+                    bool has_watchdog, WatchdogAction watchdog,
+                    Error **errp)
+{
+    if (has_reboot) {
+        reboot_action = reboot;
+    }
+
+    if (has_watchdog) {
+        qmp_watchdog_set_action(watchdog, errp);
+    }
+
+    /* Process shutdown last, in case the panic action needs to be altered */
+    if (has_shutdown) {
+        shutdown_action = shutdown;
+    }
+}
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 892f2f679f..bd0522ed9e 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -54,6 +54,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/tpm.h"
 #include "trace.h"
@@ -471,7 +472,7 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
                                    !!info, info);
     vm_stop(RUN_STATE_GUEST_PANICKED);
-    if (!no_shutdown) {
+    if (shutdown_action == SHUTDOWN_ACTION_POWEROFF) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
@@ -512,7 +513,8 @@ void qemu_system_guest_crashloaded(GuestPanicInformation *info)
 
 void qemu_system_reset_request(ShutdownCause reason)
 {
-    if (no_reboot && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
+    if (reboot_action == REBOOT_ACTION_SHUTDOWN &&
+        reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
         shutdown_requested = reason;
     } else {
         reset_requested = reason;
@@ -591,7 +593,7 @@ void qemu_system_killed(int signal, pid_t pid)
 {
     shutdown_signal = signal;
     shutdown_pid = pid;
-    no_shutdown = 0;
+    shutdown_action = SHUTDOWN_ACTION_POWEROFF;
 
     /* Cannot call qemu_system_shutdown_request directly because
      * we are in a signal handler.
@@ -658,7 +660,7 @@ static bool main_loop_should_exit(void)
     if (request) {
         qemu_kill_report();
         qemu_system_shutdown(request);
-        if (no_shutdown) {
+        if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
             vm_stop(RUN_STATE_SHUTDOWN);
         } else {
             return true;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 20db39b556..04d94da843 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -36,6 +36,7 @@
 #include "qemu/uuid.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/seccomp.h"
 #include "sysemu/tcg.h"
 #include "sysemu/xen.h"
@@ -3154,10 +3155,10 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_opts_parse_noisily(olist, "hpet=off", false);
                 break;
             case QEMU_OPTION_no_reboot:
-                no_reboot = 1;
+                reboot_action = REBOOT_ACTION_SHUTDOWN;
                 break;
             case QEMU_OPTION_no_shutdown:
-                no_shutdown = 1;
+                shutdown_action = SHUTDOWN_ACTION_PAUSE;
                 break;
             case QEMU_OPTION_show_cursor:
                 warn_report("The -show-cursor option is deprecated. Please "
diff --git a/ui/sdl2.c b/ui/sdl2.c
index a578017268..5e49709283 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -30,6 +30,7 @@
 #include "ui/input.h"
 #include "ui/sdl2.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/sysemu.h"
 #include "ui/win32-kbd-hook.h"
 
@@ -606,7 +607,7 @@ static void handle_windowevent(SDL_Event *ev)
                 allow_close = false;
             }
             if (allow_close) {
-                no_shutdown = 0;
+                shutdown_action = SHUTDOWN_ACTION_POWEROFF;
                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
             }
         } else {
@@ -653,7 +654,7 @@ void sdl2_poll_events(struct sdl2_console *scon)
                 allow_close = false;
             }
             if (allow_close) {
-                no_shutdown = 0;
+                shutdown_action = SHUTDOWN_ACTION_POWEROFF;
                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
             }
             break;
-- 
2.26.2



