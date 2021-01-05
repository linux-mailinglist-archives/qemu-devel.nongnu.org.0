Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EFB2EAFCC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:13:25 +0100 (CET)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwoxY-0001CQ-BU
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotY-0003vz-Mc
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotU-0003nt-JP
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:16 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Fsv9Z031211;
 Tue, 5 Jan 2021 16:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=OjVXc7WTAXRG/aeXGkEMVmWgqm8aa65uYxqI5U9rDZc=;
 b=KykcG2/yy5XoOnlGfuJkQVf7hmeKSaUxPA1F/zvo9P/FOpsCtwvEbueDmXaWzYPGbLxc
 p8kjo5X4yp6+oLmmurftxQyEb40KJGLnhchQUrvxRaWwdJ8/eZdxcDdlCMN3LrIm+v/1
 79yq5Myc4FosWil2VbhqtNpDACKwfINnBC7aIckkRj+3XwWkZInGE5RfiB5+XOXtilXh
 CPI5Q1CwBTGM8TcTW5mu6TlhV0HfA6W991MULbOZbFVAv3ikAuX1FKHZUE1qCFg1boOF
 1rPzVNi4ENbdqeWXQ49NItIoSWJjPi1Z89eEb8UJWSGo7HTHErxZ63iy2UpNHwAymTjC VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35tgsksg3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtLBt175897;
 Tue, 5 Jan 2021 16:09:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35vct61vmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:06 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G95Fw018512;
 Tue, 5 Jan 2021 16:09:05 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:04 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 06/22] vl: add helper to request re-exec
Date: Tue,  5 Jan 2021 07:41:54 -0800
Message-Id: <1609861330-129855-7-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=steven.sistare@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
 include/sysemu/sysemu.h |  1 +
 softmmu/vl.c            | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 408eb56..2ab9f95 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -17,6 +17,7 @@ extern bool memfd_alloc;
 
 void qemu_add_data_dir(const char *path);
 
+void qemu_system_exec_request(void);
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5668e2b..d395e80 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -165,6 +165,7 @@ uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 bool wakeup_suspend_enabled;
 bool memfd_alloc;
+static char **argv_main;
 
 int icount_align_option;
 
@@ -1294,6 +1295,7 @@ static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
 static pid_t shutdown_pid;
+static int exec_requested;
 static int powerdown_requested;
 static int debug_requested;
 static int suspend_requested;
@@ -1324,6 +1326,11 @@ static int qemu_shutdown_requested(void)
     return atomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
 }
 
+static int qemu_exec_requested(void)
+{
+    return atomic_xchg(&exec_requested, 0);
+}
+
 static void qemu_kill_report(void)
 {
     if (!qtest_driver() && shutdown_signal) {
@@ -1570,6 +1577,13 @@ void qemu_system_shutdown_request(ShutdownCause reason)
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
@@ -1605,6 +1619,16 @@ void qemu_system_debug_request(void)
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
@@ -1625,6 +1649,11 @@ static bool main_loop_should_exit(void)
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
         if (no_shutdown) {
@@ -2872,6 +2901,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     os_set_line_buffering();
 
+    argv_main = argv;
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
 
-- 
1.8.3.1


