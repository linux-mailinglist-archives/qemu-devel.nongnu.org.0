Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F8376535
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:32:56 +0200 (CEST)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezf5-0002Ms-3m
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbO-0000Tl-PI
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:06 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbJ-0001Rh-Ug
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:06 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CE4ER096860;
 Fri, 7 May 2021 12:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=HHD0ffPoFv2m54Poufo3HoNOdK4KuAozbrE4/GpZMyA=;
 b=nwwJv5uWpGtni5a3w6Zntgd+mLwW284dS32C9zwZEHnIQwXNR4jlwfli3MRI6GScscdC
 z20dWddCMoNgnMfky9O1Nwa1FD+50QWQxEUIXpWRwn1abJkNx0cVE67jY2n0Z3nGdNdi
 ijBKlhPgZD6XVg3EDpWyRcCozhz+oyL0SaSnmM31I+jfDf5lBayLrCD4oLP3Ec25B7Nu
 ytzQbaxmGFD8SQdRAHSo3Xi5H7IUAaudG087qmb4VgrvPmPMvJPhD0bNoyAxXZEjWRQs
 J4W5h5LBx6oBWb2d9Y5m10H7mwu9y3FuQ+Ttvizknj0z4TL9khrk0bfbsR3o2QYeeBZI rw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 38ctd89d19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFYZL068959;
 Fri, 7 May 2021 12:28:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38csrev2fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:57 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSuQL109918;
 Fri, 7 May 2021 12:28:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 38csrev2ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:56 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CSsRM011644;
 Fri, 7 May 2021 12:28:54 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:54 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 06/22] vl: add helper to request re-exec
Date: Fri,  7 May 2021 05:25:04 -0700
Message-Id: <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: DMCnyyMy6mxF5A4nUoSRRDZV8eqRAKzZ
X-Proofpoint-ORIG-GUID: DMCnyyMy6mxF5A4nUoSRRDZV8eqRAKzZ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a qemu_exec_requested() hook that causes the main loop to exit and
re-exec qemu using the same initial arguments.  If /usr/bin/qemu-exec
exists, exec that instead.  This is an optional site-specific trampoline
that may alter the environment before exec'ing the qemu binary.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 include/sysemu/sysemu.h   |  1 +
 softmmu/globals.c         |  1 +
 softmmu/runstate.c        | 28 ++++++++++++++++++++++++++++
 softmmu/vl.c              |  1 +
 5 files changed, 32 insertions(+)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691..50c84af 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -56,6 +56,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
 void qemu_system_shutdown_request(ShutdownCause reason);
+void qemu_system_exec_request(void);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
 void qemu_register_shutdown_notifier(Notifier *notifier);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667..f56058e 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -9,6 +9,7 @@
 /* vl.c */
 
 extern int only_migratable;
+extern char **argv_main;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81..2bb630d 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -60,6 +60,7 @@ bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 int icount_align_option;
+char **argv_main;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
  * little-endian "wire format" described in the SMBIOS 2.6 specification.
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c..bea7513 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -338,6 +338,7 @@ static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
 static pid_t shutdown_pid;
+static int exec_requested;
 static int powerdown_requested;
 static int debug_requested;
 static int suspend_requested;
@@ -367,6 +368,11 @@ static int qemu_shutdown_requested(void)
     return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
 }
 
+static int qemu_exec_requested(void)
+{
+    return qatomic_xchg(&exec_requested, 0);
+}
+
 static void qemu_kill_report(void)
 {
     if (!qtest_driver() && shutdown_signal) {
@@ -625,6 +631,13 @@ void qemu_system_shutdown_request(ShutdownCause reason)
     qemu_notify_event();
 }
 
+void qemu_system_exec_request(void)
+{
+    shutdown_requested = 1;
+    exec_requested = 1;
+    qemu_notify_event();
+}
+
 static void qemu_system_powerdown(void)
 {
     qapi_event_send_powerdown();
@@ -660,6 +673,16 @@ void qemu_system_debug_request(void)
     qemu_notify_event();
 }
 
+static void qemu_exec(void)
+{
+    const char *helper = "/usr/bin/qemu-exec";
+    const char *bin = !access(helper, X_OK) ? helper : argv_main[0];
+
+    execvp(bin, argv_main);
+    error_report("execvp failed, errno %d.", errno);
+    exit(1);
+}
+
 static bool main_loop_should_exit(void)
 {
     RunState r;
@@ -673,6 +696,11 @@ static bool main_loop_should_exit(void)
     }
     request = qemu_shutdown_requested();
     if (request) {
+
+        if (qemu_exec_requested()) {
+            qemu_exec();
+            /* not reached */
+        }
         qemu_kill_report();
         qemu_system_shutdown(request);
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb526..04ab752 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2662,6 +2662,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
+    argv_main = argv;
 
     qemu_init_subsystems();
 
-- 
1.8.3.1


