Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F72EAFDD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:18:23 +0100 (CET)
Received: from localhost ([::1]:35608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp2M-0000OQ-Po
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwoti-00049U-5A
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:26 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotg-00049s-Bi
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:25 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtfdH138063;
 Tue, 5 Jan 2021 16:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Ng2Q+bNSRXq8vcQaGrGjVigIrSDiB3ewBIVgEsNqMgE=;
 b=NrLlL/axGYLVfdJ3h1tw/BlKGuehI4aZWsXc4vNX/aanOA7tDX15u6lC5W9kiv+EXiWh
 FgB9/scnSbbLHVbV84+QHeVgsFnRFmLXhsx3yl65RSzCkG5/SI6KMNdgZkxh3nw8+XQm
 aaW4gIw1nFcPfiFqcm9xNyG+v9tjLA4m7KEx3BBNaCiF41YHoXuWuS9xsfKy7dLsq3l2
 o3xnk2yeRRyp+Vr25QBlg3nQhsd25HJaXWXJXh72j33yZYUKZstSw9q/tHe4FXF5jee1
 U8b4PQOycMm9+kJa2losIDjgu4ksUCCf8l4UqkQqkAhw53SUO5/uVRCx7R5pn7dLaKnt qQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35tg8r1h0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuNl9029067;
 Tue, 5 Jan 2021 16:09:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35uxnsvbav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:19 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G9IGH018472;
 Tue, 5 Jan 2021 16:09:18 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:18 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 22/22] simplify savevm
Date: Tue,  5 Jan 2021 07:42:10 -0800
Message-Id: <1609861330-129855-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
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

Use qf_file_open to simplify a few functions in savevm.c.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/savevm.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index a843d20..994ad1a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2788,8 +2788,8 @@ int save_snapshot(const char *name, Error **errp)
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
                                 Error **errp)
 {
+    const char *ioc_name = "migration-xen-save-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int saved_vm_running;
     int ret;
 
@@ -2803,13 +2803,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     vm_stop(RUN_STATE_SAVE_VM);
     global_state_store_running();
 
-    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT, 0660, errp);
-    if (!ioc) {
+    f = qf_file_open(filename, O_WRONLY | O_CREAT, 0660, ioc_name, errp);
+    if (!f) {
         goto the_end;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
-    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
         error_setg(errp, QERR_IO_ERROR);
@@ -2837,8 +2834,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
 
 void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
+    const char *ioc_name = "migration-xen-load-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
@@ -2850,14 +2847,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     }
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    ioc = qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0, errp);
-    if (!ioc) {
+    f = qf_file_open(filename, O_RDONLY | O_BINARY, 0, ioc_name, errp);
+    if (!f) {
         return;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
-    f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
-
     ret = qemu_loadvm_state(f);
     qemu_fclose(f);
     if (ret < 0) {
-- 
1.8.3.1


