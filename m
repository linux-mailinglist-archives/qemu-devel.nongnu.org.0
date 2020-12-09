Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CFE2D48A5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:12:19 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3wo-0003yz-Lk
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3fk-0006O9-PV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:54:40 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3fh-0003UL-3M
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:54:40 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HnP9Z127563;
 Wed, 9 Dec 2020 17:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=ge6zjb+cQDm22IpfOB24PMgEKmmnDd94vtR9rpvIh80=;
 b=DpuXs5tcI5WCFiWXvnGNFQjI19LVpZ9AwtIfMVdL4AWvem43m+UStUBjnXN2DQvhccqW
 PGqM35b59sbjP+/eigdC0ncbwiwiKsyfy5vzM7O/aBLds8uOX1OkEVNiCEtg/5YA0Xt3
 VuD6n7cSfvfQVsAcHxY9o0kQQ8gocwPCIRtYW0e0Zfqq5kWvr8WA4gy86lUXKw3PeErU
 z1UzRpE6fB95ol4VtEThTlWO63pOvAB23GJwEwGreBETT4IRkSCN88k6hv5KcaQ+7LBZ
 Lwjz9vQ7hEj0gFcrFW9+Hk4NpIKtbonypOyJ7vVfHZP6A/arfXVlYePaM8ObJVydgSKv 5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 357yqc1mcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:54:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HoibZ034908;
 Wed, 9 Dec 2020 17:52:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 358kyv1nfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:52:35 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9HqYAX007384;
 Wed, 9 Dec 2020 17:52:34 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:52:34 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] vl: Add an -action option to respond to guest events
Date: Wed,  9 Dec 2020 12:52:13 -0500
Message-Id: <1607536336-24701-2-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=1 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090126
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=aserp2130.oracle.com
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
Cc: david.edmondson@oracle.com, pbonzini@redhat.com
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
 MAINTAINERS                      |   2 +
 include/sysemu/runstate-action.h |  16 +++++
 include/sysemu/sysemu.h          |   1 +
 qapi/run-state.json              |  88 ++++++++++++++++++++++++++
 qemu-options.hx                  |  22 +++++++
 softmmu/meson.build              |   1 +
 softmmu/runstate-action.c        | 131 +++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c                     |  30 ++++++++-
 8 files changed, 290 insertions(+), 1 deletion(-)
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
index 0000000..f545ab3
--- /dev/null
+++ b/include/sysemu/runstate-action.h
@@ -0,0 +1,16 @@
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
+/* in softmmu/runstate-action.c */
+int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp);
+int runstate_action_parse(QemuOptsList *opts_list, const char *optarg);
+
+#endif /* RUNSTATE_ACTION_H */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 817ff4c..5480e61 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -43,6 +43,7 @@ extern int win2k_install_hack;
 extern int alt_grab;
 extern int ctrl_grab;
 extern int graphic_rotate;
+extern int no_reboot;
 extern int no_shutdown;
 extern int old_param;
 extern int boot_menu;
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 964c8ef..6b033c1 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -329,6 +329,94 @@
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
+# @pause: pause the VM
+#
+# @poweroff: Shutdown the VM and exit
+#
+# Since: 6.0
+##
+{ 'enum': 'ShutdownAction',
+  'data': [ 'pause', 'poweroff' ] }
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
index 0000000..f1fd457
--- /dev/null
+++ b/softmmu/runstate-action.c
@@ -0,0 +1,131 @@
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
+#include "sysemu/sysemu.h"
+#include "sysemu/watchdog.h"
+#include "qemu/config-file.h"
+#include "qapi/error.h"
+#include "qemu/option_int.h"
+#include "qapi/qapi-commands-run-state.h"
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
+ * Set the internal state to react to a guest reboot event
+ * as specified by the action parameter.
+ */
+static void reboot_set_action(RebootAction act, Error **errp)
+{
+    switch (act) {
+    case REBOOT_ACTION_NONE:
+        no_reboot = 0;
+        break;
+    case REBOOT_ACTION_SHUTDOWN:
+        no_reboot = 1;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/*
+ * Set the internal state to react to a guest shutdown event
+ * as specified by the action parameter.
+ */
+static void shutdown_set_action(ShutdownAction act, Error **errp)
+{
+    switch (act) {
+    case SHUTDOWN_ACTION_PAUSE:
+        no_shutdown = 1;
+        break;
+    case SHUTDOWN_ACTION_POWEROFF:
+        no_shutdown = 0;
+        break;
+    default:
+        g_assert_not_reached();
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
+    int event_idx, act_idx;
+
+    event_idx = qapi_enum_parse(&RunStateEventType_lookup, event, -1, errp);
+
+    switch (event_idx) {
+    case RUN_STATE_EVENT_TYPE_REBOOT:
+        act_idx = qapi_enum_parse(&RebootAction_lookup, action, -1, errp);
+        reboot_set_action(act_idx, NULL);
+        break;
+    case RUN_STATE_EVENT_TYPE_SHUTDOWN:
+        act_idx = qapi_enum_parse(&ShutdownAction_lookup, action, -1, errp);
+        shutdown_set_action(act_idx, NULL);
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
index e6e0ad5..2b1583e 100644
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
@@ -147,7 +148,7 @@ Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
 int fd_bootchk = 1;
-static int no_reboot;
+int no_reboot;
 int no_shutdown = 0;
 int graphic_rotate = 0;
 const char *watchdog;
@@ -506,6 +507,21 @@ static QemuOptsList qemu_fw_cfg_opts = {
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
@@ -2948,6 +2964,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_icount_opts);
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
+    qemu_add_opts(&qemu_action_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     runstate_init();
@@ -3420,6 +3437,12 @@ void qemu_init(int argc, char **argv, char **envp)
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
@@ -3902,6 +3925,11 @@ void qemu_init(int argc, char **argv, char **envp)
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
-- 
1.8.3.1


