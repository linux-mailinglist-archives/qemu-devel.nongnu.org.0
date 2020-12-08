Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7E2D329E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:28:32 +0100 (CET)
Received: from localhost ([::1]:46932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmif1-0008Vz-TP
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmiTx-0000H4-KQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:17:06 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmiTt-0007oe-Rw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:17:04 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8J9x0k029390;
 Tue, 8 Dec 2020 19:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=ExN+tFiH8ci654jF68vXB+1ZOCnGFJ4J8cj8AtKmyuE=;
 b=MCHaq1L2+d3R0kVlS70qUrhTlc9qu/Go5v3H6aBYtczON5fd/8LhbblizAt8nNAi3wlg
 5EbE3/DNN1XX5nxDBl0wDups2Cee8D8skcnBGOnVJDrBZo1eJI2FiajQ/+/Z6V9rIjM1
 bUWH2M/LkiK9sF0+2RMFaIea+J6C8hB/dfZhbm5tIE+YxxynnqeRxUp+VW9DulrWibxE
 vgekvVPpCUcBkov10YHtGutJkZRHzbhkFw01wVXN9hl0/ks8muUtUuLs5PFzk5J/jWoO
 pTPWYQb+4TTkhbVNeMlKleVecMkeqsLrKFr+hcBjNyh2ermU1xs8OJQRK8aco7Z1+ON/ lQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3581mqvhhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 08 Dec 2020 19:16:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8JAVVk140153;
 Tue, 8 Dec 2020 19:14:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 358m3y5wjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Dec 2020 19:14:58 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B8JEw3U031456;
 Tue, 8 Dec 2020 19:14:58 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 11:14:58 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] vl: Add option to avoid stopping VM upon guest panic
Date: Tue,  8 Dec 2020 14:14:48 -0500
Message-Id: <1607454890-3339-3-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080117
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=userp2130.oracle.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current default action of pausing a guest after a panic event
is received leaves the responsibility to resume guest execution to the
management layer. The reasons for this behavior are discussed here:
https://lore.kernel.org/qemu-devel/52148F88.5000509@redhat.com/

However, in instances like the case of older guests (Linux and
Windows) using a pvpanic device but missing support for the
PVPANIC_CRASHLOADED event, and Windows guests using the hv-crash
enlightenment, it is desirable to allow the guests to continue
running after sending a PVPANIC_PANICKED event. This allows such
guests to proceed to capture a crash dump and automatically reboot
without intervention of a management layer.

Add an option to avoid stopping a VM after a panic event is received,
by passing:

-action panic=none

in the command line arguments, or during runtime by using an upcoming
QMP command.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
---
 include/sysemu/sysemu.h   |  1 +
 qapi/run-state.json       | 27 ++++++++++++++++++++++++++-
 qemu-options.hx           |  3 +++
 softmmu/runstate-action.c | 22 ++++++++++++++++++++++
 softmmu/vl.c              | 14 +++++++++++---
 5 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 5480e61..863142e 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -45,6 +45,7 @@ extern int ctrl_grab;
 extern int graphic_rotate;
 extern int no_reboot;
 extern int no_shutdown;
+extern int pause_on_panic;
 extern int old_param;
 extern int boot_menu;
 extern bool boot_strict;
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 6b033c1..27b62ce 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -337,12 +337,14 @@
 #
 # @shutdown: Guest shutdown
 #
+# @panic: Guest has panicked
+#
 # @watchdog: A watchdog device's timer has expired
 #
 # Since: 6.0
 ##
 { 'enum': 'RunStateEventType',
-  'data': [ 'reboot', 'shutdown', 'watchdog' ] }
+  'data': [ 'reboot', 'shutdown', 'panic', 'watchdog' ] }
 
 ##
 # @RunStateAction:
@@ -358,6 +360,7 @@
   'data': {
     'reboot': 'RunStateRebootAction',
     'shutdown': 'RunStateShutdownAction',
+    'panic': 'RunStatePanicAction',
     'watchdog': 'RunStateWatchdogAction' } }
 
 ##
@@ -407,6 +410,28 @@
   'data': [ 'pause', 'poweroff' ] }
 
 ##
+# @RunStatePanicAction:
+#
+# @action: Action taken by QEMU when guest panicks
+#
+# Since: 6.0
+##
+{ 'struct': 'RunStatePanicAction',
+  'data': { 'action': 'PanicAction' } }
+
+##
+# @PanicAction:
+#
+# @none: Continue VM execution
+#
+# @pause: Pause the VM
+#
+# Since: 6.0
+##
+{ 'enum': 'PanicAction',
+  'data': [ 'none', 'pause' ] }
+
+##
 # @RunStateWatchdogAction:
 #
 # @action: Action taken by QEMU when watchdog device timer expires
diff --git a/qemu-options.hx b/qemu-options.hx
index a0d50f0..8b7d8bb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3899,6 +3899,8 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
     "                   action when guest reboots [default=none]\n"
     "-action shutdown=poweroff|pause\n"
     "                   action when guest shuts down [default=poweroff]\n"
+    "-action panic=pause|none\n"
+    "                   action when guest panics [default=pause]\n"
     "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
     "                   action when watchdog fires [default=reset]\n",
     QEMU_ARCH_ALL)
@@ -3911,6 +3913,7 @@ SRST
 
     Examples:
 
+    ``-action panic=none``
     ``-action reboot=shutdown,shutdown=pause``
     ``-watchdog i6300esb -action watchdog=pause``
 
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index bbbbc07..9c92595 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -62,6 +62,24 @@ static void qmp_shutdown_set_action(ShutdownAction act, Error **errp)
 }
 
 /*
+ * Set the internal state to react to a guest panic event
+ * as specified by the action parameter.
+ */
+static void qmp_panic_set_action(PanicAction action, Error **errp)
+{
+    switch (action) {
+    case PANIC_ACTION_NONE:
+        pause_on_panic = 0;
+        break;
+    case PANIC_ACTION_PAUSE:
+        pause_on_panic = 1;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/*
  * Process an event|action pair and set the appropriate internal
  * state if event and action are valid.
  */
@@ -81,6 +99,10 @@ static int set_runstate_action(void *opaque, const char *event,
         act_idx = qapi_enum_parse(&ShutdownAction_lookup, action, -1, errp);
         qmp_shutdown_set_action(act_idx, NULL);
         break;
+    case RUN_STATE_EVENT_TYPE_PANIC:
+        act_idx = qapi_enum_parse(&PanicAction_lookup, action, -1, errp);
+        qmp_panic_set_action(act_idx, NULL);
+        break;
     case RUN_STATE_EVENT_TYPE_WATCHDOG:
         if (select_watchdog_action(action) == -1) {
             error_report("unknown watchdog action parameter");
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2b1583e..20f89cb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -150,6 +150,7 @@ int singlestep = 0;
 int fd_bootchk = 1;
 int no_reboot;
 int no_shutdown = 0;
+int pause_on_panic = 1;
 int graphic_rotate = 0;
 const char *watchdog;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
@@ -1449,9 +1450,16 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     if (current_cpu) {
         current_cpu->crash_occurred = true;
     }
-    qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
-                                   !!info, info);
-    vm_stop(RUN_STATE_GUEST_PANICKED);
+
+    if (pause_on_panic) {
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
+                                        !!info, info);
+        vm_stop(RUN_STATE_GUEST_PANICKED);
+    } else {
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_RUN,
+                                        !!info, info);
+    }
+
     if (!no_shutdown) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
-- 
1.8.3.1


