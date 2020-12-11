Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828F2D7BCF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:02:00 +0100 (CET)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlnr-0005LD-0X
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlfA-00081L-VY
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:53:01 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlf6-0004JS-Fy
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:53:00 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGoClW120041;
 Fri, 11 Dec 2020 16:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=466UzwlmAWSNxP1UdP6sV+07ya2npA2iiwNSInGQhO0=;
 b=yMjqU0eAP9bG/4mWZZiAYp9hNhsVeEhAdOuG+ASuf5wSevlbf7NRErNP2vrsC/C7BCUd
 sgH+ULm/uMZmXLHCAuUqZULx3ryG+YZR28vqjZSqD5wZiMm2ET8/VJcrMSp0Y74mxN5U
 sZaJV0f6uCWt5dnkclGfA8t54aOIUY963Nh0/SdwuBM1/Osmiz8Vi4IPlNLCf3JZScrG
 SMLJzZLPH0G8Y2QhQDUA4lxUGOqpQfw3ENwpqKe5Q0rRBc4I2ucbZhOaj/67dWCyaXrJ
 i+QAi73GtUR8jGwjactLocGFrrRMq3siaBp95e8nBO49iHntLHWfl4hsvB9DSOSIgxec gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3581mrbjfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 16:52:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGjsKJ031693;
 Fri, 11 Dec 2020 16:52:51 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 358m547xrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 16:52:51 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBGqp2P008418;
 Fri, 11 Dec 2020 16:52:51 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 08:52:50 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] qmp: Allow setting -action parameters on the fly
Date: Fri, 11 Dec 2020 11:52:43 -0500
Message-Id: <1607705564-26264-4-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
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

Add a QMP command to allow for the behaviors specified by the
-action event=action command line option to be set at runtime.
The new command is named set-action and takes optional
arguments with an event and a corresponding action to take.

Example:

-> { "execute": "set-action",
     "arguments": {
	"reboot": "none",
	"shutdown": "poweroff",
	"panic": "none",
	"watchdog": "debug" } }
<- { "return": {} }

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
---
 qapi/run-state.json       | 34 ++++++++++++++++++++++++++++++++++
 softmmu/runstate-action.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 03ff78b..4732a89 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -453,6 +453,40 @@
 { 'command': 'watchdog-set-action', 'data' : {'action': 'WatchdogAction'} }
 
 ##
+# @set-action:
+#
+# Set the actions that will be taken by the emulator in response to guest
+# events.
+#
+# @reboot: @RebootAction action taken on guest reboot.
+#
+# @shutdown: @ShutdownAction action taken on guest shutdown.
+#
+# @panic: @PanicAction action taken on guest panic.
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
+#                     "panic": "pause",
+#                     "watchdog": "inject-nmi" } }
+# <- { "return": {} }
+##
+{ 'command': 'set-action',
+  'data': { '*reboot': 'RebootAction',
+            '*shutdown': 'ShutdownAction',
+            '*panic': 'PanicAction',
+            '*watchdog': 'WatchdogAction' },
+  'allow-preconfig': true }
+
+##
 # @GUEST_PANICKED:
 #
 # Emitted when guest OS panic is detected
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index bc30102..92feebf 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -40,6 +40,35 @@ static void fix_panic_action(void)
 }
 
 /*
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
+    if (has_panic) {
+        panic_action = panic;
+    }
+
+    if (has_watchdog) {
+        qmp_watchdog_set_action(watchdog, errp);
+    }
+
+    /* Process shutdown last, in case the panic action needs to be altered */
+    if (has_shutdown) {
+        shutdown_action = shutdown;
+        fix_panic_action();
+    }
+}
+
+/*
  * Process an event|action pair and set the appropriate internal
  * state if event and action are valid.
  */
-- 
1.8.3.1


