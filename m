Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40025376598
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:52:07 +0200 (CEST)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezxe-00040B-AU
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbZ-0000uH-Jj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:18 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:50044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbV-0001YB-Tv
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:17 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CES77148914;
 Fri, 7 May 2021 12:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=+vyo8cyFeJn4HRpXZj3DzYe6S1G5SWpclntcSWRLX3c=;
 b=NZYoKEPUtlciKqYbtFrrhs6rPqs7XhVusLOKv+zhiOFgaFCJ1JLFZWaFSXQod2gh0hk8
 MKbC+dVADeQ69/xCjdG12uXgn/nfHvwxktEgc/uyqUOwC69iEIzgCr/gHT7w4+yegiTQ
 F8PsH9p7ZkZcYu2m34FWFSrsqHbmSgIG3XDraWMvCz9tl4+Rj18FIrBJ8zR4FnxcDwWL
 VbgIH0Tn0Bn4YHiBYxjmjb0Wc719S18rsi0aorV2z+SZWGfC6yvy3iYUkNgz1h500YRP
 bwc2X0swLns0zhUh6LVYOFBwv9reyvzrldXrBf0c/Tw+p8mVujY7ofiFM3Vp2nghcD/B 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 38csrd9ewx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGRC8174290;
 Fri, 7 May 2021 12:29:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb6de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:10 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CP1Zx010092;
 Fri, 7 May 2021 12:29:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 38csrtb6cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:09 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CT8dZ019345;
 Fri, 7 May 2021 12:29:08 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:29:08 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 22/22] simplify savevm
Date: Fri,  7 May 2021 05:25:20 -0700
Message-Id: <1620390320-301716-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: UlBFNy98ERtzMxsnbvdEAn9lgbBVBB-z
X-Proofpoint-GUID: UlBFNy98ERtzMxsnbvdEAn9lgbBVBB-z
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070085
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
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

Use qf_file_open to simplify a few functions in savevm.c.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/savevm.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 52e2d72..d02bce2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2904,8 +2904,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
                                 Error **errp)
 {
+    const char *ioc_name = "migration-xen-save-state";
+    int flags = O_WRONLY | O_CREAT | O_TRUNC;
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int saved_vm_running;
     int ret;
 
@@ -2919,14 +2920,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     vm_stop(RUN_STATE_SAVE_VM);
     global_state_store_running();
 
-    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT | O_TRUNC,
-                                    0660, errp);
-    if (!ioc) {
+    f = qf_file_open(filename, flags, 0660, ioc_name, errp);
+    if (!f) {
         goto the_end;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
-    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
         error_setg(errp, QERR_IO_ERROR);
@@ -2954,8 +2951,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
 
 void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
+    const char *ioc_name = "migration-xen-load-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
@@ -2967,14 +2964,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
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


