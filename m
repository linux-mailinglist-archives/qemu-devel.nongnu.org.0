Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8C2F6507
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:51:17 +0100 (CET)
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04u4-0001WW-5O
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04m0-00035f-2y
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:42:56 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04lv-00027G-Ue
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:42:55 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFYDGQ150067;
 Thu, 14 Jan 2021 15:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=LLIRcwgCTjZoHvRroNsLVEunGT14CqWDeKriqluRVAc=;
 b=EmHo1jle5dpLTWxrD7w7Mhx6PlQ7uh1Ku2Cgf0Kwiotni3bERMJhlfov6AA06lOJx7D4
 iOCLgYu9070qZA4g92XF3CropwaUZb2lQCwSCzNx6FLmLcDVKsgzpXVygjR5Ksjmwunh
 MzEy4j8GDJAMvWaUMWFmHiTLj1nvTsPWAydz118DB5/tQXtskLS5rixUjUkje55A9PCG
 nmVpTLkvzzzClsbbxb/S68WXbYvtxxg5ANUe5xa1noMT0sqPKVlBulobgLvx8M7O9+GT
 l50Xa7uVdxLOnIM/0UBmv7Wyu7jFP98QNfuaFsjU++3upBu57sK5fs50QKWbr/cewjWC Xw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 360kd00sgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:42:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFZ9O2188515;
 Thu, 14 Jan 2021 15:40:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 360kenc63f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:40:36 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10EFeZjx016519;
 Thu, 14 Jan 2021 15:40:35 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 07:40:34 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Date: Thu, 14 Jan 2021 10:40:03 -0500
Message-Id: <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610638428.git.jag.raman@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610638428.git.jag.raman@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
 include/io/channel.h | 51 +++++++++++++++++++++++++++++++
 io/channel.c         | 85 ++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 120 insertions(+), 16 deletions(-)

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
index 0d4b8b5..8d3341f 100644
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
@@ -112,20 +140,42 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                 qio_channel_wait(ioc, G_IO_IN);
             }
             continue;
-        } else if (len < 0) {
-            goto cleanup;
-        } else if (len == 0) {
-            if (partial) {
-                error_setg(errp,
-                           "Unexpected end-of-file before all bytes were read");
-            } else {
+        }
+
+        if (len <= 0) {
+            size_t fd_idx = 0;
+
+            if ((len == 0) && !partial) {
                 ret = 0;
+                goto cleanup;
+            } else if (len == 0) {
+                error_prepend(errp,
+                              "Unexpected end-of-file before all bytes were read.");
             }
+
+            if (nfds) {
+                fd_idx = *nfds;
+                *nfds = 0;
+            }
+
+            while (fds && fd_idx) {
+                close((*fds)[fd_idx - 1]);
+                fd_idx--;
+            }
+
+            if (fds) {
+                g_free(*fds);
+                *fds = NULL;
+            }
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
@@ -135,20 +185,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
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


