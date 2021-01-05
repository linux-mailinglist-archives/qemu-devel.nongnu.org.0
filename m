Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0592EAFDE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:18:26 +0100 (CET)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp2P-0000Tq-1V
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotb-0003ya-2E
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:19 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotV-0003rn-5r
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:18 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Ft4EL094589;
 Tue, 5 Jan 2021 16:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=7i4w3KiW8uVoEnJ0gDLqxwKqNbmMawd7mp9fpN9woeI=;
 b=vpjL8+tNQFGJN/9NfcotAQ+V9VQrJCIAA7mqO20Of1aBLnnMSbzsvhf3Jdja9XZyk4jI
 MEIqbD0Ni/6w9y6pqHaEsQnYtHP6RTXIliGrUlURhdYcSZwD7Hbtca7VKb+GrWUEsZ7g
 flI7x6LUlYlfZUCqlfFSmB7qpJfCLKDGDh6vJ9xnQJoPQO/HD5lH4zncpuukiPkcAE3r
 IsaL9/kcrk5POk277/k26OcTXRmSKTZXp+m2Krc+spF3de8tS4sM5VW3vCsX2ojsZv0F
 ikS1bD6jeqMkn97OwPdyA4OYiIovDh7cMouvNNuzyWQXVj5Lr2ZyDG7oZETVpoeOhiVM Fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35tebasjve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtKvd175795;
 Tue, 5 Jan 2021 16:09:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35vct61vq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:09 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G97E0020434;
 Tue, 5 Jan 2021 16:09:07 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:07 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 09/22] cpr: HMP interfaces
Date: Tue,  5 Jan 2021 07:41:57 -0800
Message-Id: <1609861330-129855-10-git-send-email-steven.sistare@oracle.com>
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

cprsave <file> <mode>
  Call cprsave().
  Arguments:
    file : save vmstate to this file name
    mode: "reboot" or "restart"

cprload <file>
  Call cprload().
  Arguments:
    file : load vmstate from this file name

cprinfo
  Print to stdout a space-delimited list of modes supported by cprsave.
  Arguments: none

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h |  3 +++
 monitor/hmp-cmds.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 60f395c..8577850 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -354,6 +354,50 @@ SRST
 ERST
 
     {
+        .name       = "cprinfo",
+        .args_type  = "",
+        .params     = "",
+        .help       = "return list of modes supported by cprsave",
+        .cmd        = hmp_cprinfo,
+    },
+
+SRST
+``cprinfo``
+    Return a space-delimited list of modes supported by cprsave.
+ERST
+
+    {
+        .name       = "cprsave",
+        .args_type  = "file:s,mode:s",
+        .params     = "file 'restart'|'reboot'",
+        .help       = "create a checkpoint of the VM in file",
+        .cmd        = hmp_cprsave,
+    },
+
+SRST
+``cprsave`` *file* *mode*
+    Create a checkpoint of the whole virtual machine and save it in *file*.
+    If *mode* is 'reboot', the checkpoint remains valid after a host kexec
+    reboot.  Guest ram must be backed by persistant shared memory.
+    If *mode* is 'restart', pause the VCPUs, exec /usr/bin/qemu-exec if it
+    exists, else exec argv[0], passing all the original command line arguments.
+    Guest ram must be allocated with the memfd-anon option.
+ERST
+
+    {
+        .name       = "cprload",
+        .args_type  = "file:s",
+        .params     = "file",
+        .help       = "load VM checkpoint from file",
+        .cmd        = hmp_cprload,
+    },
+
+SRST
+``cprload`` *file*
+Load a virtual machine from checkpoint file *file* and continue VCPUs.
+ERST
+
+    {
         .name       = "delvm",
         .args_type  = "name:s",
         .params     = "tag",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index c986cfd..919b9a9 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -59,6 +59,9 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
+void hmp_cprinfo(Monitor *mon, const QDict *qdict);
+void hmp_cprsave(Monitor *mon, const QDict *qdict);
+void hmp_cprload(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ae4b6a4..e64b754 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -32,6 +32,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-net.h"
@@ -1139,6 +1140,53 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+void hmp_cprinfo(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    CprInfo *cprinfo;
+    CprModeList *mode;
+
+    cprinfo = qmp_cprinfo(&err);
+    if (err) {
+        goto out;
+    }
+
+    for (mode = cprinfo->modes; mode; mode = mode->next) {
+        monitor_printf(mon, "%s ", CprMode_str(mode->value));
+    }
+
+out:
+    hmp_handle_error(mon, err);
+    qapi_free_CprInfo(cprinfo);
+}
+
+void hmp_cprsave(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *mode;
+    int val;
+
+    mode = qdict_get_try_str(qdict, "mode");
+    val = qapi_enum_parse(&CprMode_lookup, mode, -1, &err);
+
+    if (val == -1) {
+        goto out;
+    }
+
+    qmp_cprsave(qdict_get_try_str(qdict, "file"), val, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_cprload(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_cprload(qdict_get_try_str(qdict, "file"), &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
-- 
1.8.3.1


