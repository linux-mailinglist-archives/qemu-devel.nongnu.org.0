Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDD42F5478
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:11:04 +0100 (CET)
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznPz-0001KA-8V
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kznBa-0000HF-5V
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:56:10 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kznBY-0001S0-4v
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:56:09 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKs8Vm045274;
 Wed, 13 Jan 2021 20:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=yCsU9uHKmRMUunesa4vT3KTm61IlNacFlIaG6Bh6cm4=;
 b=w7gGEEdbq2HIbwtzY4+eQEnWGxYkFjhbSqlcjgm+wYIqTmPAxOR6vfP+tixxtO1pAcJM
 kOF8bFQ2CSZCRTWPwUPoyDCHt9RKQymwU9SzRD0dkNGrpv3KauP3PPvJJkMPJ6F5dliG
 AtR04LUqDcX4QIBfUneWuZ+qklUZdwuICnPXJP9pywWYhJy8AEAjSIIJAU00/sOSdT4m
 /EM1/I1CYY/iNuCHegUvNabltQ9rdgiw2OT6XYQsj3x3N/I0P4q8fd0MLqqaWveAFhIh
 neXjHmUNZ0pZHCyXBmq70uuQIGmhGC0kjtsqI6nY2fh1TJDXjUq+/Zg3NyDanhoR5+TI zA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kcywgqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:56:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKkanl123108;
 Wed, 13 Jan 2021 20:54:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 360kf8apjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:54:02 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10DKs0P1002324;
 Wed, 13 Jan 2021 20:54:00 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 12:54:00 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Date: Wed, 13 Jan 2021 15:53:27 -0500
Message-Id: <68865004c4ecce557214bac5b3c527cfe3681b77.1610570756.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130127
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Adds qio_channel_readv_full_all_eof() and qio_channel_readv_full_all()
to read both data and FDs. Refactors existing code to use these helpers.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/io/channel.h | 51 +++++++++++++++++++++++++++++++++
 io/channel.c         | 80 +++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 117 insertions(+), 14 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 19e76fc..f725665 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -778,6 +778,57 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
                                     void *opaque);
 
 /**
+ * qio_channel_readv_full_all_eof:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to read
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Performs same function as qio_channel_readv_all_eof.
+ * Additionally, attempts to read file descriptors shared
+ * over the channel. The function will wait for all
+ * requested data to be read, yielding from the current
+ * coroutine if required.
+ *
+ * Returns: 1 if all bytes were read, 0 if end-of-file
+ *          occurs without data, or -1 on error
+ */
+
+int qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   int **fds, size_t *nfds,
+                                   Error **errp);
+
+/**
+ * qio_channel_readv_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to read data to
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to read
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Performs same function as qio_channel_readv_all_eof.
+ * Additionally, attempts to read file descriptors shared
+ * over the channel. The function will wait for all
+ * requested data to be read, yielding from the current
+ * coroutine if required.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int **fds, size_t *nfds,
+                               Error **errp);
+
+/**
  * qio_channel_writev_full_all:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
diff --git a/io/channel.c b/io/channel.c
index 0d4b8b5..a7c19ad 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -92,19 +92,47 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                               size_t niov,
                               Error **errp)
 {
+    return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
+}
+
+int qio_channel_readv_all(QIOChannel *ioc,
+                          const struct iovec *iov,
+                          size_t niov,
+                          Error **errp)
+{
+    return qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
+}
+
+int qio_channel_readv_full_all_eof(QIOChannel *ioc,
+                                   const struct iovec *iov,
+                                   size_t niov,
+                                   int **fds, size_t *nfds,
+                                   Error **errp)
+{
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
     struct iovec *local_iov_head = local_iov;
     unsigned int nlocal_iov = niov;
+    int **local_fds = fds;
+    size_t *local_nfds = nfds;
     bool partial = false;
 
+    if (nfds) {
+        *nfds = 0;
+    }
+
+    if (fds) {
+        *fds = NULL;
+    }
+
     nlocal_iov = iov_copy(local_iov, nlocal_iov,
                           iov, niov,
                           0, iov_size(iov, niov));
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
+                                     local_nfds, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -112,20 +140,41 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                 qio_channel_wait(ioc, G_IO_IN);
             }
             continue;
-        } else if (len < 0) {
-            goto cleanup;
-        } else if (len == 0) {
-            if (partial) {
+        }
+
+        if (len <= 0) {
+            if ((len == 0) && partial) {
+                size_t fd_idx = 0;
+
                 error_setg(errp,
                            "Unexpected end-of-file before all bytes were read");
-            } else {
+
+                if (nfds) {
+                    fd_idx = *nfds;
+                    *nfds = 0;
+                }
+
+                while (fds && fd_idx) {
+                    close((*fds)[fd_idx - 1]);
+                    fd_idx--;
+                }
+
+                if (fds) {
+                    g_free(*fds);
+                    *fds = NULL;
+                }
+            } else if (len == 0) {
                 ret = 0;
             }
+
             goto cleanup;
         }
 
         partial = true;
         iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        local_fds = NULL;
+        local_nfds = 0;
     }
 
     ret = 1;
@@ -135,20 +184,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_readv_all(QIOChannel *ioc,
-                          const struct iovec *iov,
-                          size_t niov,
-                          Error **errp)
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                               const struct iovec *iov,
+                               size_t niov,
+                               int **fds, size_t *nfds,
+                               Error **errp)
 {
-    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
+    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
 
     if (ret == 0) {
-        ret = -1;
         error_setg(errp,
                    "Unexpected end-of-file before all bytes were read");
-    } else if (ret == 1) {
-        ret = 0;
+        return -1;
     }
+    if (ret == 1) {
+        return 0;
+    }
+
     return ret;
 }
 
-- 
1.8.3.1


