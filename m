Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872619F2CC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 11:43:09 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLOHc-00034a-IX
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 05:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jLOGO-0001Pa-5J
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:41:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jLOGL-0001zb-Qn
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:41:51 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jLOGL-0001wz-FE
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:41:49 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0369dovi089372;
 Mon, 6 Apr 2020 09:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=zIeNg9GJ442gcJiKn8WcNNdmeKePXBPreKOVh7LX5jE=;
 b=sqzGm/3DmLBQONhMzabQ1+zDUK7LaCgeNeTki2afJ4layHnUWgmkNSVwBbiR8At8My2g
 J+dSzCOZbhJ6Ptpz3WX/7OdJ5E0JGdvonVhd9exa+i/Y1FwN+xGGFtMxYJzLE+tJbjxR
 rZglctqEdN4pHj0hYuaJsfEMFGTanB+hQ+ABWANZ0t+SO5hLWHDdHE8J4wVDXYP1GEiy
 6qNli99+NPt+Mb25q4VnjfpvsZEAlgE5iTg/9RHwAA6TG+RHLSyoz9Vn2WvGvU18D54i
 7j6GldtdfJu8cFx7lRNrLoR50jeo1iSHjIu/MiAavsr58f3O71iKD1uX5xcfp8iyOg1z Uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 306hnqwtvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Apr 2020 09:41:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0369cbxX006560;
 Mon, 6 Apr 2020 09:41:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 3073xvtt92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Apr 2020 09:41:40 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0369fdg6006731;
 Mon, 6 Apr 2020 09:41:39 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 Apr 2020 02:41:38 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/36] multi-process: Refactor chardev functions out of vl.c
Date: Mon,  6 Apr 2020 02:40:54 -0700
Message-Id: <751edf3f6993127a439ed8f80b90fb52e8129d97.1586165555.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1586165555.git.elena.ufimtseva@oracle.com>
References: <cover.1586165555.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=1
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060083
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.86
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Some of the initialization helper functions w.r.t chardev
in vl.c are also used by the remote process. Therefore, these functions
are refactored into shared files that both QEMU & remote process
could use.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 chardev/char.c         | 14 ++++++++++++++
 include/chardev/char.h |  2 ++
 softmmu/vl.c           | 14 --------------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index e77564060d..47dcf93da7 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1196,3 +1196,17 @@ static void register_types(void)
 }
 
 type_init(register_types);
+
+int chardev_init_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    Error *local_err = NULL;
+
+    if (!qemu_chr_new_from_opts(opts, NULL, &local_err)) {
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return -1;
+        }
+        exit(0);
+    }
+    return 0;
+}
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 00589a6025..0804e78f7a 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -290,4 +290,6 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+int chardev_init_func(void *opaque, QemuOpts *opts, Error **errp);
+
 #endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 33568108b0..9517f0b167 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2039,20 +2039,6 @@ static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
     return qdev_device_help(opts);
 }
 
-static int chardev_init_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    Error *local_err = NULL;
-
-    if (!qemu_chr_new_from_opts(opts, NULL, &local_err)) {
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return -1;
-        }
-        exit(0);
-    }
-    return 0;
-}
-
 #ifdef CONFIG_VIRTFS
 static int fsdev_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
-- 
2.25.GIT


