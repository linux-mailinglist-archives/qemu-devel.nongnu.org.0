Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723A22D486A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:57:52 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3ip-00009G-G8
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3du-0004Ra-HI
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:52:47 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:41168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3do-0002sY-9s
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:52:46 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HnwIF148794;
 Wed, 9 Dec 2020 17:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Q0yDKWT9WUgI6MMRCMBGHJ0+GdVtT5c97BjYiEUK9wY=;
 b=gpfJeMYYsqkyIEJ3gEpuZJFuEORYIN0EqFL04cnVjdx60Ck6fzzb9HV188rMB7JbJqZ+
 /h+7uLbM46EX1JRegj9idmsMByll5zdgBW/WslzdHPgo7eSdfvYV8y9Gpn/zOZnwim+I
 XFz/5ZKa0RLsoKwAzTQwOyCs2pnFJ2kRio1YIOMaV1S2vSESmSJ870ylKdl0RlfUn9pk
 5QBDy7EYWtsRNJlQ4ICtSBRP+7Q8Q+weIcC/gC54SQClaDnf2JwFMF4G2rKbwap15r5+
 uRE9gaCxgimDsR9mBuKGPA50NVJatfGR6HSe46s0jeN5w0+LCdE2nDUiZ8UBKEmyLKTG MA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3581mr1ekg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:52:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HoZGW073723;
 Wed, 9 Dec 2020 17:52:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 358m40m06k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:52:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9HqZBC007389;
 Wed, 9 Dec 2020 17:52:35 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:52:34 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qmp: Allow setting -action parameters on the fly
Date: Wed,  9 Dec 2020 12:52:15 -0500
Message-Id: <1607536336-24701-4-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090126
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Add a QMP command to allow for the behaviors specified by the
-action event=action command line option to be set at runtime.
The new command is named set-action, and takes a single argument
of type RunStateAction, which contains an event|action pair.

Example:

-> { "execute": "set-action",
     "arguments": { "pair": {
         "event": "shutdown",
	  "action": "pause" } } }
<- { "return": {} }

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
---
 qapi/run-state.json       | 22 ++++++++++++++++++++++
 softmmu/runstate-action.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 27b62ce..ead9dab 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -451,6 +451,28 @@
 { 'command': 'watchdog-set-action', 'data' : {'action': 'WatchdogAction'} }
 
 ##
+# @set-action:
+#
+# Set the action that will be taken by the emulator in response to a guest
+# event.
+#
+# @pair: a @RunStateAction type that describes an event|action pair.
+#
+# Returns: Nothing on success.
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "set-action",
+#         "arguments": { "pair": {
+#             "event": "shutdown",
+#             "action": "pause" } } }
+# <- { "return": {} }
+##
+{ 'command': 'set-action', 'data' : {'pair': 'RunStateAction'} }
+
+##
 # @GUEST_PANICKED:
 #
 # Emitted when guest OS panic is detected
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index a644d80..7877e7e 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -80,6 +80,35 @@ static void panic_set_action(PanicAction action, Error **errp)
 }
 
 /*
+ * Receives a RunStateAction type which represents an event|action pair
+ * and sets the internal state as requested.
+ */
+void qmp_set_action(RunStateAction *pair, Error **errp)
+{
+    switch (pair->event) {
+    case RUN_STATE_EVENT_TYPE_REBOOT:
+        reboot_set_action(pair->u.reboot.action, NULL);
+        break;
+    case RUN_STATE_EVENT_TYPE_SHUTDOWN:
+        shutdown_set_action(pair->u.shutdown.action, NULL);
+        break;
+    case RUN_STATE_EVENT_TYPE_PANIC:
+        panic_set_action(pair->u.panic.action, NULL);
+        break;
+    case RUN_STATE_EVENT_TYPE_WATCHDOG:
+        qmp_watchdog_set_action(pair->u.watchdog.action, NULL);
+        break;
+    default:
+        /*
+         * The fields in the RunStateAction argument are validated
+         * by the QMP marshalling code before this function is called.
+         * This case is unreachable unless new variants are added.
+         */
+        g_assert_not_reached();
+    }
+}
+
+/*
  * Process an event|action pair and set the appropriate internal
  * state if event and action are valid.
  */
-- 
1.8.3.1


