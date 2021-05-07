Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBAE3765A5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:56:39 +0200 (CEST)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf023-0000Tf-0D
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezcL-0001S5-SA
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:30:05 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezcJ-00023p-Gn
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:30:05 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CE4SK096866;
 Fri, 7 May 2021 12:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=bhXktVqVbHebVf1zMiTZRGxxftF1sfcsqPDmjMN9oAc=;
 b=UfxB40QJCSglHuqIaOKbgDY6mwzjBFK5pb7b62nIdsVVGBEXPrWnflLtyQkDVDgjDQHc
 sy6OwGaSADDofMYz96Dy+gWxxlFUOmCt6bZeQsCOVq5LCJD6eezTvGjZucYtdLHmaXM4
 eWFoTtqx2pyWZok3HxD4mwU/z2pW+puyG9P8feF6grSwc/ALc0kC32rRbppH7CJbppuI
 AHR3wX5y67+CfbeiqaBBRWjRk10Qwh92orKlSUsBLi3yPRwpTOOjmIxcWPUtuZ+IwoND
 SEluGVh7DeJvE1BN4cKFUdDNRxml/jjGnIdW8ojg5jYINldhjWN+iA5U+V2ts7MHSUr6 sg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 38ctd89d1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFN5C031201;
 Fri, 7 May 2021 12:28:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38css8ss6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:59 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CSwSE071605;
 Fri, 7 May 2021 12:28:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 38css8ss54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:58 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSve9017194;
 Fri, 7 May 2021 12:28:57 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:56 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 09/22] cpr: HMP interfaces
Date: Fri,  7 May 2021 05:25:07 -0700
Message-Id: <1620390320-301716-10-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: wkejXdTJdjsuLdbkhkoqfIcb2uyZ6jPW
X-Proofpoint-ORIG-GUID: wkejXdTJdjsuLdbkhkoqfIcb2uyZ6jPW
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
index 435c591..5c79c5a 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -351,6 +351,50 @@ SRST
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
+Return a space-delimited list of modes supported by cprsave.
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
+Create a checkpoint of the whole virtual machine and save it in *file*.
+If *mode* is 'reboot', the checkpoint remains valid after a host kexec
+reboot.  Guest ram must be backed by persistant shared memory.
+If *mode* is 'restart', pause the VCPUs, exec /usr/bin/qemu-exec if it
+exists, else exec argv[0], passing all the original command line arguments.
+Guest ram must be allocated with the memfd-alloc machine option.
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
index 605d572..e4ebdf1 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -58,6 +58,9 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
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
index 0ad5b77..e115a23 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -33,6 +33,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -1173,6 +1174,53 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
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


