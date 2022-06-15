Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038C54CC1A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:03:27 +0200 (CEST)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UYI-0000tl-Ck
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOQ-00074B-KN
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOO-00011p-11
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:14 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE6ttH002488;
 Wed, 15 Jun 2022 14:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=A08uDRz32w84CgdUyaoFktFRTfiigyvbP/EByqmYtaI=;
 b=xmCBB6rRRpcQtSyVugeEdkyhpWZ35b0F12r1tvsZ8axIymI6Zy6pRJsIKVz/uAVqWLZ7
 IJTTUoUI5ZmC9QDdkbShVSWXf6Q/i8L5MxFPAt54DsJzPg52gQF3S3aFeeJqMiP+zB2p
 +L0wdR1UgwqskzH43tzVd/qhHWVghClxSJIhBziy/01bXkN2pE2mQI3PAyoEiVIcXHEq
 WliJQbBa70AeiX2d851r/9sbDQehuZ+GBj3+rKh5UtIbZg4LWym3kguRXneeJDzkMejx
 cGdq7qzeqWxrVC6esA+JKXc5K953FDo1QRU9U1C6vrG3ZWMv4t/ItIamVFGn+T4Cr1+s yQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrsjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:51 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7uU023102; Wed, 15 Jun 2022 14:52:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:50 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNJ018501;
 Wed, 15 Jun 2022 14:52:49 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-19; Wed, 15 Jun 2022 14:52:49 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 18/39] vl: helper to request re-exec
Date: Wed, 15 Jun 2022 07:52:05 -0700
Message-Id: <1655304746-102776-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: cjOrKPVHRIXCIluDjnUCYMoQae6NvcFj
X-Proofpoint-GUID: cjOrKPVHRIXCIluDjnUCYMoQae6NvcFj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a qemu_system_exec_request() hook that causes the main loop to exit and
re-exec qemu using the specified arguments.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 softmmu/runstate.c        | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index 16c1c41..6b0b4f1 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -63,6 +63,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
 void qemu_system_shutdown_request(ShutdownCause reason);
+int qemu_system_exec_request(const strList *args, Error **errp);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
 void qemu_register_shutdown_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index cfd6aa9..c35ab09 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -37,6 +37,7 @@
 #include "monitor/monitor.h"
 #include "net/net.h"
 #include "net/vhost_net.h"
+#include "qapi/util.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-events-run-state.h"
@@ -355,6 +356,7 @@ static NotifierList wakeup_notifiers =
 static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
+static GStrv exec_argv;
 
 ShutdownCause qemu_shutdown_requested_get(void)
 {
@@ -371,6 +373,11 @@ static int qemu_shutdown_requested(void)
     return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
 }
 
+static int qemu_exec_requested(void)
+{
+    return exec_argv != NULL;
+}
+
 static void qemu_kill_report(void)
 {
     if (!qtest_driver() && shutdown_signal) {
@@ -641,6 +648,18 @@ void qemu_system_shutdown_request(ShutdownCause reason)
     qemu_notify_event();
 }
 
+int qemu_system_exec_request(const strList *args, Error **errp)
+{
+    exec_argv = strv_from_strList(args);
+    if (!exec_argv[0]) {
+        error_setg(errp, "qemu_system_exec_request: argv[0] is NULL");
+        return 1;
+    }
+    shutdown_requested = 1;
+    qemu_notify_event();
+    return 0;
+}
+
 static void qemu_system_powerdown(void)
 {
     qapi_event_send_powerdown();
@@ -689,6 +708,13 @@ static bool main_loop_should_exit(void)
     }
     request = qemu_shutdown_requested();
     if (request) {
+
+        if (qemu_exec_requested()) {
+            execvp(exec_argv[0], exec_argv);
+            error_report("execvp %s failed: %s", exec_argv[0], strerror(errno));
+            g_strfreev(exec_argv);
+            exec_argv = NULL;
+        }
         qemu_kill_report();
         qemu_system_shutdown(request);
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
-- 
1.8.3.1


