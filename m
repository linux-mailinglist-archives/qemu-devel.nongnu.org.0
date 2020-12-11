Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEC2D7BAE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:57:49 +0100 (CET)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knljo-00038P-Qm
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlh4-0001DN-RN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:54:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlgy-00053I-Du
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:54:58 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGrS0X005959;
 Fri, 11 Dec 2020 16:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=8ChdizvACFhuk6mPTEHvVn7Easr+CrNglEF9DDcvX+k=;
 b=GEk7LYM4IWTUS9lPwKin95goUpbFD3pvne/G0eeRz8tFyoTQsflZKvfIA6ppWzp3uoP0
 Ihb3Fn8lXjh66U8he/jgPaK5IKxvMM2SE4IvcknUPT0nIAQHba4zY17w6P0dxNo+CkLf
 W4VFPNQV7MlDlxpUv5Lr+1yD3flQzbDaH0DpvAymEBHz2p80ojGHoYrP2NVpQRfFjgZB
 qv07hzr0Nc1jp3jDYg8OLdMXraRnIXBfoEsOOFjzsfZ5fVCX7yz9JoMI5BeJIw8dk4hC
 qKrhq9JzCzD8yxKa84RtJSKaHMAl0aUas43M/iNy4Y0goXBiMdmEJ+6Yt28IA0eZrTdq kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35825mkm65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 16:54:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGiwQv135614;
 Fri, 11 Dec 2020 16:52:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 358kstp4qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 16:52:50 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBGqoMK010201;
 Fri, 11 Dec 2020 16:52:50 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 08:52:49 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] vl: Add an -action option to respond to guest events
Date: Fri, 11 Dec 2020 11:52:41 -0500
Message-Id: <1607705564-26264-2-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110113
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: david.edmondson@oracle.com, pbonzini@redhat.com, mihai.carabas@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several command line options currently in use are meant to modify
the behavior of QEMU in response to certain guest events like:
-no-reboot, -no-shutdown, -watchdog-action.

These can be grouped into a single option of the form:

-action event=action

Which can be used to specify the existing options above in the
following format:

-action reboot=none|shutdown
-action shutdown=poweroff|pause
-action watchdog=reset|shutdown|poweroff|pause|debug|none|inject-nmi

This is done in preparation for adding yet another option of this
type, which modifies the QEMU behavior when a guest panic occurs.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
---
 MAINTAINERS                      |  2 +
 include/sysemu/runstate-action.h | 21 +++++++++
 include/sysemu/sysemu.h          |  1 -
 monitor/qmp-cmds.c               |  3 +-
 qapi/run-state.json              | 90 +++++++++++++++++++++++++++++++++++++
 qemu-options.hx                  | 22 +++++++++
 softmmu/meson.build              |  1 +
 softmmu/runstate-action.c        | 96 ++++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c                     | 43 ++++++++++++++----
 ui/sdl2.c                        |  5 ++-
 10 files changed, 272 insertions(+), 12 deletions(-)
 create mode 100644 include/sysemu/runstate-action.h
 create mode 100644 softmmu/runstate-action.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160..7dcc4bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2332,6 +2332,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
+F: include/sysemu/runstate-action.h
 F: util/main-loop.c
 F: util/qemu-timer.c
 F: softmmu/vl.c
@@ -2340,6 +2341,7 @@ F: softmmu/cpus.c
 F: softmmu/cpu-throttle.c
 F: softmmu/cpu-timers.c
 F: softmmu/icount.c
+F: softmmu/runstate-action.c
 F: qapi/run-state.json
 
 Read, Copy, Update (RCU)
diff --git a/include/sysemu/runstate-action.h b/include/sysemu/runstate-action.h
new file mode 100644
index 0000000..dba4b85
--- /dev/null
+++ b/include/sysemu/runstate-action.h
@@ -0,0 +1,21 @@
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
+int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp);
+int runstate_action_parse(QemuOptsList *opts_list, const char *optarg);
+
+#endif /* RUNSTATE_ACTION_H */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 817ff4c..dd6897f 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -43,7 +43,6 @@ extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
 extern int graphic_rotate;
-extern int no_shutdown;
 extern int old_param;
 extern int boot_menu;
 extern bool boot_strict;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a08143b..3589550 100644
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
index 964c8ef..7d8ce61 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -329,6 +329,96 @@
             'inject-nmi' ] }
 
 ##
+# @RunStateEventType:
+#
+# An enumeration of Run State event types
+#
+# @reboot: Guest reboot
+#
+# @shutdown: Guest shutdown
+#
+# @watchdog: A watchdog device's timer has expired
+#
+# Since: 6.0
+##
+{ 'enum': 'RunStateEventType',
+  'data': [ 'reboot', 'shutdown', 'watchdog' ] }
+
+##
+# @RunStateAction:
+#
+# Describes a guest event and the subsequent action that is taken
+# by QEMU when such event takes place.
+#
+# Since: 6.0
+##
+{ 'union': 'RunStateAction',
+  'base': { 'event': 'RunStateEventType' },
+  'discriminator': 'event',
+  'data': {
+    'reboot': 'RunStateRebootAction',
+    'shutdown': 'RunStateShutdownAction',
+    'watchdog': 'RunStateWatchdogAction' } }
+
+##
+# @RunStateRebootAction:
+#
+# @action: Action taken by QEMU when guest reboots
+#
+# Since: 6.0
+##
+{ 'struct': 'RunStateRebootAction',
+  'data': { 'action': 'RebootAction' } }
+
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
+# @RunStateShutdownAction:
+#
+# @action: Action taken by QEMU when guest shuts down
+#
+# Since: 6.0
+##
+{ 'struct': 'RunStateShutdownAction',
+  'data': { 'action': 'ShutdownAction' } }
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
+##
+# @RunStateWatchdogAction:
+#
+# @action: Action taken by QEMU when watchdog device timer expires
+#
+# Since: 6.0
+##
+{ 'struct': 'RunStateWatchdogAction',
+  'data': { 'action': 'WatchdogAction' } }
+
+##
 # @watchdog-set-action:
 #
 # Set watchdog action
diff --git a/qemu-options.hx b/qemu-options.hx
index 104632e..a0d50f0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3894,6 +3894,28 @@ SRST
     changes to the disk image.
 ERST
 
+DEF("action", HAS_ARG, QEMU_OPTION_action,
+    "-action reboot=none|shutdown\n"
+    "                   action when guest reboots [default=none]\n"
+    "-action shutdown=poweroff|pause\n"
+    "                   action when guest shuts down [default=poweroff]\n"
+    "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
+    "                   action when watchdog fires [default=reset]\n",
+    QEMU_ARCH_ALL)
+SRST
+``-action event=action``
+    The action parameter serves to modify QEMU's default behavior when
+    certain guest events occur. It provides a generic method for specifying the
+    same behaviors that are modified by the ``-no-reboot`` and ``-no-shutdown``
+    parameters.
+
+    Examples:
+
+    ``-action reboot=shutdown,shutdown=pause``
+    ``-watchdog i6300esb -action watchdog=pause``
+
+ERST
+
 DEF("loadvm", HAS_ARG, QEMU_OPTION_loadvm, \
     "-loadvm [tag|id]\n" \
     "                start right away with a saved state (loadvm in monitor)\n",
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 8f7210b..8ad586e 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -10,6 +10,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'qtest.c',
   'vl.c',
   'cpu-timers.c',
+  'runstate-action.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
new file mode 100644
index 0000000..5eae320
--- /dev/null
+++ b/softmmu/runstate-action.c
@@ -0,0 +1,96 @@
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
+static void runstate_action_help(void)
+{
+    int idx;
+
+    printf("Events for which an action can be specified:\n");
+    for (idx = 0; idx < RUN_STATE_EVENT_TYPE__MAX; idx++) {
+        printf("%10s\n", RunStateEventType_str(idx));
+    }
+}
+
+/*
+ * Process an event|action pair and set the appropriate internal
+ * state if event and action are valid.
+ */
+static int set_runstate_action(void *opaque, const char *event,
+                                const char *action, Error **errp)
+{
+    int event_idx;
+
+    event_idx = qapi_enum_parse(&RunStateEventType_lookup, event, -1, errp);
+
+    switch (event_idx) {
+    case RUN_STATE_EVENT_TYPE_REBOOT:
+        reboot_action = qapi_enum_parse(&RebootAction_lookup,
+                                            action, -1, errp);
+        break;
+    case RUN_STATE_EVENT_TYPE_SHUTDOWN:
+        shutdown_action = qapi_enum_parse(&ShutdownAction_lookup,
+                                            action, -1, errp);
+        break;
+    case RUN_STATE_EVENT_TYPE_WATCHDOG:
+        if (select_watchdog_action(action) == -1) {
+            error_report("invalid parameter value: %s", action);
+            exit(1);
+        }
+        break;
+    default:
+        /*
+         * The event and action types are checked for validity in the calls to
+         * qapi_enum_parse(), which will cause an exit if the requested event or
+         * action are invalid, since error_fatal is used as the error parameter.
+         * This case is unreachable unless those conditions change.
+         */
+        g_assert_not_reached();
+    }
+
+    return 0;
+}
+
+/*
+ * Parse provided -action arguments from cmdline.
+ */
+int runstate_action_parse(QemuOptsList *opts_list, const char *optarg)
+{
+    QemuOpts *opts;
+
+    if (!strcmp(optarg, "help")) {
+        runstate_action_help();
+        return -1;
+    }
+
+    opts = qemu_opts_parse_noisily(opts_list, optarg, false);
+    if (!opts) {
+        return -1;
+    }
+    return 0;
+}
+
+/*
+ * Process all the -action parameters parsed from cmdline.
+ */
+int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp)
+{
+    if (qemu_opt_foreach(opts, set_runstate_action, NULL, errp)) {
+        return -1;
+    }
+    return 0;
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5..35575a1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -34,6 +34,7 @@
 #include "qemu/uuid.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/seccomp.h"
 #include "sysemu/tcg.h"
 #include "sysemu/xen.h"
@@ -147,8 +148,6 @@ Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
 int fd_bootchk = 1;
-static int no_reboot;
-int no_shutdown = 0;
 int graphic_rotate = 0;
 const char *watchdog;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
@@ -506,6 +505,21 @@ static QemuOptsList qemu_fw_cfg_opts = {
     },
 };
 
+static QemuOptsList qemu_action_opts = {
+    .name = "action",
+    /*
+     * When lists are merged, the location is set to the first use of the
+     * option. If a subsequent option has an invalid parameter, the error msg
+     * will display the wrong location. Avoid this by not merging the lists.
+     */
+    .merge_lists = false,
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_action_opts.head),
+    .desc = {
+        /* Validation is done when processing the runstate actions */
+        { }
+    },
+};
+
 /**
  * Get machine options
  *
@@ -1436,7 +1450,7 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
                                    !!info, info);
     vm_stop(RUN_STATE_GUEST_PANICKED);
-    if (!no_shutdown) {
+    if (shutdown_action == SHUTDOWN_ACTION_POWEROFF) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
@@ -1477,7 +1491,8 @@ void qemu_system_guest_crashloaded(GuestPanicInformation *info)
 
 void qemu_system_reset_request(ShutdownCause reason)
 {
-    if (no_reboot && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
+    if (reboot_action == REBOOT_ACTION_SHUTDOWN &&
+            reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
         shutdown_requested = reason;
     } else {
         reset_requested = reason;
@@ -1554,7 +1569,7 @@ void qemu_system_killed(int signal, pid_t pid)
 {
     shutdown_signal = signal;
     shutdown_pid = pid;
-    no_shutdown = 0;
+    shutdown_action = SHUTDOWN_ACTION_POWEROFF;
 
     /* Cannot call qemu_system_shutdown_request directly because
      * we are in a signal handler.
@@ -1628,7 +1643,7 @@ static bool main_loop_should_exit(void)
     if (request) {
         qemu_kill_report();
         qemu_system_shutdown(request);
-        if (no_shutdown) {
+        if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
             vm_stop(RUN_STATE_SHUTDOWN);
         } else {
             return true;
@@ -2948,6 +2963,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_icount_opts);
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
+    qemu_add_opts(&qemu_action_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     runstate_init();
@@ -3420,6 +3436,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 watchdog = optarg;
                 break;
+            case QEMU_OPTION_action:
+                if (runstate_action_parse(qemu_find_opts("action"),
+                                            optarg) < 0) {
+                    exit(1);
+                }
+                break;
             case QEMU_OPTION_watchdog_action:
                 if (select_watchdog_action(optarg) == -1) {
                     error_report("unknown -watchdog-action parameter");
@@ -3565,10 +3587,10 @@ void qemu_init(int argc, char **argv, char **envp)
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
@@ -3902,6 +3924,11 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_opts_foreach(qemu_find_opts("name"),
                       parse_name, NULL, &error_fatal);
 
+    if (qemu_opts_foreach(qemu_find_opts("action"),
+                        process_runstate_actions, NULL, &error_fatal)) {
+        exit(1);
+    }
+
 #ifndef _WIN32
     qemu_opts_foreach(qemu_find_opts("add-fd"),
                       parse_add_fd, NULL, &error_fatal);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 189d26e..993c311 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -30,6 +30,7 @@
 #include "ui/input.h"
 #include "ui/sdl2.h"
 #include "sysemu/runstate.h"
+#include "sysemu/runstate-action.h"
 #include "sysemu/sysemu.h"
 #include "ui/win32-kbd-hook.h"
 
@@ -604,7 +605,7 @@ static void handle_windowevent(SDL_Event *ev)
                 allow_close = false;
             }
             if (allow_close) {
-                no_shutdown = 0;
+                shutdown_action = SHUTDOWN_ACTION_POWEROFF;
                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
             }
         } else {
@@ -651,7 +652,7 @@ void sdl2_poll_events(struct sdl2_console *scon)
                 allow_close = false;
             }
             if (allow_close) {
-                no_shutdown = 0;
+                shutdown_action = SHUTDOWN_ACTION_POWEROFF;
                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
             }
             break;
-- 
1.8.3.1


