Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4F2D3299
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:23:54 +0100 (CET)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiaX-000476-3s
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmiS7-0007su-R6
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:15:14 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kmiS1-0007Tk-Jy
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:15:11 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8J9IVP098393;
 Tue, 8 Dec 2020 19:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=WpBu+h6zx2OWrB4QyP0nWA4cWe8kbsktFYEr6Jg3Qd8=;
 b=MvK61hJZVGzIKbFHJSgWfgHnlSRndDF6VAOSEF90aVLvDsxaSTpYS3YRZVzmt/2rDgCw
 AciiFdkVJQpxNhXDDT7YhjWH4kn7TWFo5ifg3V9BefzP3b/LPdeAece0iKS9E7YfL4dN
 eMg9iVSsvIGJnHBTSRFvrxqswN3NxJhd90bw/k7Bc1XLaFGPEYfwzRz6rbUzL+PL0shf
 kxu0pkEJa9s41e99ruf6xl1ceGj8pOtVZOJVelv1awpmb3ATWsCCyC+eGoEEZ5wTb3jI
 T106JaYoiynnuu+zm/sLEZZt/rS9FmSdL+w/5Z1HGtm7H8yvvZo+TlfQAd7yYm1RGaAq Tg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35825m4jtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 08 Dec 2020 19:15:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8JAV1L140299;
 Tue, 8 Dec 2020 19:15:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 358m3y5wjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Dec 2020 19:15:00 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B8JEwIH028391;
 Tue, 8 Dec 2020 19:14:59 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 11:14:58 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qmp: Allow setting -action parameters on the fly
Date: Tue,  8 Dec 2020 14:14:49 -0500
Message-Id: <1607454890-3339-4-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
References: <1607454890-3339-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080117
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add QMP commands to allow for the behaviors specified by the
-action event=action command line option to be set at runtime,
mimicking the watchdog-set-action QMP command.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
---
 qapi/run-state.json       | 27 +++++++++++++++++++++++++++
 softmmu/runstate-action.c |  6 +++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 27b62ce..de27516 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -451,6 +451,33 @@
 { 'command': 'watchdog-set-action', 'data' : {'action': 'WatchdogAction'} }
 
 ##
+# @reboot-set-action:
+#
+# Set reboot action
+#
+# Since: 6.0
+##
+{ 'command': 'reboot-set-action', 'data' : {'action': 'RebootAction'} }
+
+##
+# @shutdown-set-action:
+#
+# Set shutdown action
+#
+# Since: 6.0
+##
+{ 'command': 'shutdown-set-action', 'data' : {'action': 'ShutdownAction'} }
+
+##
+# @panic-set-action:
+#
+# Set panic action
+#
+# Since: 6.0
+##
+{ 'command': 'panic-set-action', 'data' : {'action': 'PanicAction'} }
+
+##
 # @GUEST_PANICKED:
 #
 # Emitted when guest OS panic is detected
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index 9c92595..aef23b8 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -29,7 +29,7 @@ static void runstate_action_help(void)
  * Set the internal state to react to a guest reboot event
  * as specified by the action parameter.
  */
-static void qmp_reboot_set_action(RebootAction act, Error **errp)
+void qmp_reboot_set_action(RebootAction act, Error **errp)
 {
     switch (act) {
     case REBOOT_ACTION_NONE:
@@ -47,7 +47,7 @@ static void qmp_reboot_set_action(RebootAction act, Error **errp)
  * Set the internal state to react to a guest shutdown event
  * as specified by the action parameter.
  */
-static void qmp_shutdown_set_action(ShutdownAction act, Error **errp)
+void qmp_shutdown_set_action(ShutdownAction act, Error **errp)
 {
     switch (act) {
     case SHUTDOWN_ACTION_PAUSE:
@@ -65,7 +65,7 @@ static void qmp_shutdown_set_action(ShutdownAction act, Error **errp)
  * Set the internal state to react to a guest panic event
  * as specified by the action parameter.
  */
-static void qmp_panic_set_action(PanicAction action, Error **errp)
+void qmp_panic_set_action(PanicAction action, Error **errp)
 {
     switch (action) {
     case PANIC_ACTION_NONE:
-- 
1.8.3.1


