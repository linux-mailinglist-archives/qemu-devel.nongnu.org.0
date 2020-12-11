Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA62D7BA9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:56:19 +0100 (CET)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knliL-0001B1-UR
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlfA-0007zR-Q7
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:53:00 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlf6-0004JR-1h
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:52:59 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGo4Gt119947;
 Fri, 11 Dec 2020 16:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=yYE3S0IJePOkYWo2QQBSe/vtKkk7jcLYcway9wa47RY=;
 b=bZd2kchEgcud8mytH+714oBdB8LT+1kjTi6UR08ng8Mph7LmSYILoImxMefi/id18vW3
 fXwRD3tXNZ+PuGv/6AuCExF3E46wnxPJc+jmiJlSNcZQLDH07okRj6d5F7uSC0TbDUph
 /GAGZGfbuMJzUq9O1fmrHp3x4hM3Fr9DpeO2xDFvWV+A0zyjydl1PNiFjk+YoPAbDpkQ
 uGL1a7768tHGoXCJt3PQFxJBPAH9jk3v+zxgRq2iwQ7F6ibHMYRRsQKcXbc36QGrU7n4
 tYZAMae5kNMyVdrnulMLtHCsecYpuTh+N33MuRW0Yn1mc2Mxm0efzsNyyIFxK6B0lNS4 oQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3581mrbjfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 16:52:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGix50122913;
 Fri, 11 Dec 2020 16:52:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 358kyyad14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 16:52:51 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBGqotU008411;
 Fri, 11 Dec 2020 16:52:50 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 08:52:50 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] vl: Add option to avoid stopping VM upon guest panic
Date: Fri, 11 Dec 2020 11:52:42 -0500
Message-Id: <1607705564-26264-3-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110112
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
Cc: david.edmondson@oracle.com, pbonzini@redhat.com, mihai.carabas@oracle.com
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
---
 include/sysemu/runstate-action.h |  1 +
 qapi/run-state.json              | 27 ++++++++++++++++++++++++++-
 qemu-options.hx                  |  3 +++
 softmmu/runstate-action.c        | 17 +++++++++++++++++
 softmmu/vl.c                     | 23 +++++++++++++++++++----
 5 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/runstate-action.h b/include/sysemu/runstate-action.h
index dba4b85..cfc46ec 100644
--- a/include/sysemu/runstate-action.h
+++ b/include/sysemu/runstate-action.h
@@ -14,6 +14,7 @@
 /* in softmmu/runstate-action.c */
 extern RebootAction reboot_action;
 extern ShutdownAction shutdown_action;
+extern PanicAction panic_action;
 
 int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp);
 int runstate_action_parse(QemuOptsList *opts_list, const char *optarg);
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 7d8ce61..03ff78b 100644
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
@@ -409,6 +412,28 @@
   'data': [ 'poweroff', 'pause' ] }
 
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
+  'data': [ 'poweroff', 'pause', 'none' ] }
+
+##
 # @RunStateWatchdogAction:
 #
 # @action: Action taken by QEMU when watchdog device timer expires
diff --git a/qemu-options.hx b/qemu-options.hx
index a0d50f0..9ac5a26 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3899,6 +3899,8 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
     "                   action when guest reboots [default=none]\n"
     "-action shutdown=poweroff|pause\n"
     "                   action when guest shuts down [default=poweroff]\n"
+    "-action panic=poweroff|pause|none\n"
+    "                   action when guest panics [default=poweroff]\n"
     "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
     "                   action when watchdog fires [default=reset]\n",
     QEMU_ARCH_ALL)
@@ -3911,6 +3913,7 @@ SRST
 
     Examples:
 
+    ``-action panic=none``
     ``-action reboot=shutdown,shutdown=pause``
     ``-watchdog i6300esb -action watchdog=pause``
 
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index 5eae320..bc30102 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -15,6 +15,7 @@
 
 RebootAction reboot_action = REBOOT_ACTION_NONE;
 ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+PanicAction panic_action = PANIC_ACTION_POWEROFF;
 
 static void runstate_action_help(void)
 {
@@ -27,6 +28,18 @@ static void runstate_action_help(void)
 }
 
 /*
+ * When -no-shutdown is requested either explicitly or by using its equivalent
+ * -action option, the request should be honored even if a panic occurs.
+ */
+static void fix_panic_action(void)
+{
+    if (shutdown_action == SHUTDOWN_ACTION_PAUSE &&
+                panic_action == PANIC_ACTION_POWEROFF) {
+        panic_action = PANIC_ACTION_PAUSE;
+    }
+}
+
+/*
  * Process an event|action pair and set the appropriate internal
  * state if event and action are valid.
  */
@@ -45,6 +58,10 @@ static int set_runstate_action(void *opaque, const char *event,
     case RUN_STATE_EVENT_TYPE_SHUTDOWN:
         shutdown_action = qapi_enum_parse(&ShutdownAction_lookup,
                                             action, -1, errp);
+        fix_panic_action();
+        break;
+    case RUN_STATE_EVENT_TYPE_PANIC:
+        panic_action = qapi_enum_parse(&PanicAction_lookup, action, -1, errp);
         break;
     case RUN_STATE_EVENT_TYPE_WATCHDOG:
         if (select_watchdog_action(action) == -1) {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 35575a1..2ff0291 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1447,10 +1447,21 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     if (current_cpu) {
         current_cpu->crash_occurred = true;
     }
-    qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
-                                   !!info, info);
-    vm_stop(RUN_STATE_GUEST_PANICKED);
-    if (shutdown_action == SHUTDOWN_ACTION_POWEROFF) {
+    /*
+     * TODO:  Currently the available panic actions are: none, pause, and
+     * poweroff, but in principle debug and reset could be supported as well.
+     * Investigate any potential use cases for the unimplemented actions.
+     */
+    if (panic_action != PANIC_ACTION_NONE) {
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
+                                        !!info, info);
+        vm_stop(RUN_STATE_GUEST_PANICKED);
+    } else {
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_RUN,
+                                        !!info, info);
+    }
+
+    if (panic_action == PANIC_ACTION_POWEROFF) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
@@ -3591,6 +3602,10 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_no_shutdown:
                 shutdown_action = SHUTDOWN_ACTION_PAUSE;
+                /* no_shutdown is requested, also honor it if guest panics */
+                if (panic_action == PANIC_ACTION_POWEROFF) {
+                    panic_action = PANIC_ACTION_PAUSE;
+                }
                 break;
             case QEMU_OPTION_show_cursor:
                 warn_report("The -show-cursor option is deprecated. Please "
-- 
1.8.3.1


