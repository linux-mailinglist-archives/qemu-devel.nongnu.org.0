Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1C233634
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 18:01:34 +0200 (CEST)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Azt-00043v-2p
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AfR-0001X9-GG
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:40:25 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AfL-0002Vv-0G
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:40:25 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFXQsV007512;
 Thu, 30 Jul 2020 15:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=nYgT/y57sVzpOSiaYIaK+jjHlfq5K79EuRuiPY25c60=;
 b=b6tbzol30La8tD87BoxgppdoxH3E7J9KREUqyPa9GXweWn2XnDsog4HYdYhoDY9EajxA
 kPZ7iFiIMWJFk5Jj+NlegHwygsFqDLZjOnXlw4AeD+ouujPslSDCIuhuQOjTMauAZEWy
 e+eo7uSuX5xceyEvixl4uCc+dc8Hy0Yq1K0nlmL1aQBiHTNEBgw12WyTMhCUcXSLoUeo
 k284HeikC17b7cnEviS5olItJgyNsZ5iI+14AWwYSAae+7zKaL38uk5Hjh1zDbc7zpnB
 HyCB/AEbL8rqOqI/gFOGcJTrHmtFgVYjARWFUD4ToBP22RDHf81tmgYgP/QkgMYdfTRW 8Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 32hu1jmfv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 15:40:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFWpSk188385;
 Thu, 30 Jul 2020 15:38:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 32hu5xja5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 15:38:15 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06UFcEXp020515;
 Thu, 30 Jul 2020 15:38:14 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jul 2020 08:38:14 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V1 26/32] monitor: save/restore QMP negotiation status
Date: Thu, 30 Jul 2020 08:14:30 -0700
Message-Id: <1596122076-341293-27-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=1 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300111
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 11:37:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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

From: Mark Kanda <mark.kanda@oracle.com>

Save and restore QMP compatibility negotiation status across cprsave and
cprload.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/sysemu.h |  1 +
 migration/savevm.c      |  1 +
 monitor/qmp.c           | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 3e7bfee..c5b2f24 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -30,6 +30,7 @@ void load_cpr_snapshot(const char *file, Error **errp);
 void save_chardev_fds(void);
 void save_vnc_fds(void);
 void load_vnc_fds(void);
+void save_qmp_negotiation_status(void);
 
 extern int autostart;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 35fafb7..225eaa6 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2770,6 +2770,7 @@ void save_cpr_snapshot(const char *file, const char *mode, Error **errp)
         save_chardev_fds();
         save_vnc_fds();
         walkenv(FD_PREFIX, preserve_fd, 0);
+        save_qmp_negotiation_status();
         qemu_system_exec_request();
         putenv((char *)"QEMU_START_FREEZE=");
     }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index d433cea..9944ce5 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -33,6 +33,8 @@
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qstring.h"
 #include "trace.h"
+#include "qemu/env.h"
+#include "sysemu/sysemu.h"
 
 struct QMPRequest {
     /* Owner of the request */
@@ -398,6 +400,21 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
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
@@ -438,4 +455,29 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
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
+void save_qmp_negotiation_status(void)
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


