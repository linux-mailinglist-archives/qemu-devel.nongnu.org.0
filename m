Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890512EAFED
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:22:12 +0100 (CET)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp63-0004QN-Ib
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwote-00044s-Pc
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:23 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotc-00043u-Lw
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:22 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FsjoM094290;
 Tue, 5 Jan 2021 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=P+c/iE7ZNt+1iAl9fEdT5Q4GJTbqiM/4QSgP4j+Xs+w=;
 b=LkRbSUKtIFevm639KIFdPjxdmSl36Eb5gX0Ajbf5WnXltm8GJSpfZCfkg7F8LjN9+FgV
 IaNe/auV+v72KXcDuS/3pXk1+H+cugkwZ4+/JWmrd37/3Wzux8yFKQ33TSG28qHWk3V3
 96qiSa1DOOhpucPhnaooTaz07yWbyAU4f6NHmtTJhSnLWb/Q0VcBZNlT23TGURd0NsSM
 eNPl6D8wQkLrm06BIHAbb2B6UJf2a96qJmiQKvHvGciw80gZVQorubo5Ro2ofO7mgpVW
 awmQ8GIbavyQseJnOuAtg3dPiLM0r44vUzKX4QreDF2FHIIWz5rQQj0v14vgtj8knsa+ GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35tebasjwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FulaQ187551;
 Tue, 5 Jan 2021 16:09:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 35v1f8snr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:16 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G9GcG018678;
 Tue, 5 Jan 2021 16:09:16 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:15 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 19/22] monitor: cpr support
Date: Tue,  5 Jan 2021 07:42:07 -0800
Message-Id: <1609861330-129855-20-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
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

A monitor socket requires special treatment.  Save and restore the
qmp negotiation status.  Stop the monitor's iothread in cpsave. Otherwise,
the thread will detect the close of the monitor socket and call unsetenv_fd,which modifies environ and races with execv which uses environ.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/monitor/monitor.h |  2 ++
 migration/cpr.c           |  2 ++
 monitor/monitor.c         |  5 +++++
 monitor/qmp.c             | 43 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 1018d75..5456cff 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -22,6 +22,8 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp);
 int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp);
 int monitor_init_opts(QemuOpts *opts, Error **errp);
 void monitor_cleanup(void);
+void monitor_iothread_stop(void);
+void monitor_cprsave(void);
 
 int monitor_suspend(Monitor *mon);
 void monitor_resume(Monitor *mon);
diff --git a/migration/cpr.c b/migration/cpr.c
index de85d56..0f49c7d 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -137,9 +137,11 @@ void cprsave(const char *file, CprMode mode, Error **errp)
         if (vfio_cprsave()) {
             goto err;
         }
+        monitor_iothread_stop();
         walkenv(FD_PREFIX, preserve_fd, 0);
         vhost_dev_reset_all();
         qemu_term_exit();
+        monitor_cprsave();
         setenv("QEMU_START_FREEZE", "", 1);
         qemu_system_exec_request();
     }
diff --git a/monitor/monitor.c b/monitor/monitor.c
index b385a3d..1bda67c 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -591,6 +591,11 @@ void monitor_cleanup(void)
     }
 }
 
+void monitor_iothread_stop(void)
+{
+    iothread_stop(mon_iothread);
+}
+
 static void monitor_qapi_event_init(void)
 {
     monitor_qapi_event_state = g_hash_table_new(qapi_event_throttle_hash,
diff --git a/monitor/qmp.c b/monitor/qmp.c
index d433cea..d7eeab1 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -33,6 +33,7 @@
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qstring.h"
 #include "trace.h"
+#include "qemu/env.h"
 
 struct QMPRequest {
     /* Owner of the request */
@@ -398,6 +399,21 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
     monitor_list_append(&mon->common);
 }
 
+static void setenv_qmp(const char *name, bool val)
+{
+    setenv_bool(name, val);
+}
+
+static bool getenv_qmp(const char *name)
+{
+    bool ret = getenv_bool(name);
+    if (ret != -1) {
+        unsetenv_bool(name);
+        return ret;
+    }
+    return false;
+}
+
 void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
 {
     MonitorQMP *mon = g_new0(MonitorQMP, 1);
@@ -438,4 +454,31 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /*
+     * If a chr->label qmp env var is true, this is a restored qmp
+     * connection with capabilities negotiated.
+     */
+    if (getenv_qmp(chr->label) == true) {
+        mon->commands = &qmp_commands;
+    }
+}
+
+/* Save the result of capability negotiation in the environment */
+
+void monitor_cprsave(void)
+{
+    Monitor *mon;
+    MonitorQMP *qmp_mon;
+
+    QTAILQ_FOREACH(mon, &mon_list, entry) {
+        if (!monitor_is_qmp(mon)) {
+            continue;
+        }
+
+        qmp_mon = container_of(mon, MonitorQMP, common);
+        if (qmp_mon->commands == &qmp_commands) {
+            setenv_qmp(mon->chr.chr->label, true);
+        }
+    }
 }
-- 
1.8.3.1


