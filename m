Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D176F2DDE36
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:52:14 +0100 (CET)
Received: from localhost ([::1]:42904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8gX-0001Ra-SU
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Vw-0000Cm-IJ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:16 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1kq8Vt-0003sw-1s
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:41:16 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5Z0nJ148616;
 Fri, 18 Dec 2020 05:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=OXCWvj4mgviua6GnQjVXsdKjsJtFMIEp4FqO6/N1zwk=;
 b=TYnycTuQbDgfYOFY47nX+SF+MN6rCar+Hh/C1OQUHWdtGxlh2+C3qDPTUYkMZ6X06+1H
 CsVsi+lnw5844khiTDMLrKEGja91Q8lV+fkuHTegJZM9sxVBcyds+NkmItg0hiy8/F4c
 G5zI+HEmMN4S4xETLmMlgbk85W8e1kwi1YguRuMTFR+0zaVeTkYo9Qk2/aDONXQE+tb7
 nVpxaHk792BMj5HEOgd+sTYh9jBs0sQyHmmfVXfRsUVhEBsNuVxupcdgTKM1I57iMynP
 kPkljzEVeENoGUOHG0tArElnd1a3kDSj9OwnwcAHEfq92/Gwj6G90D3dpH6jMDOIP8Iy Zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35ckcbrw43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 05:41:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BI5ZLxS161134;
 Fri, 18 Dec 2020 05:41:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7ervmet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 05:41:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BI5f3Cp009782;
 Fri, 18 Dec 2020 05:41:04 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 21:41:02 -0800
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH v14 RESEND 09/21] multi-process: add qio channel read function
Date: Thu, 17 Dec 2020 21:40:39 -0800
Message-Id: <2db8d84f89fc7263a886eab482040507b1fb6a5d.1608263018.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1608263017.git.elena.ufimtseva@oracle.com>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180040
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Adds qio_channel_readv_full_all() to read both data and FDs.
Refactors existing code to use this function.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/io/channel.h | 25 ++++++++++++++++
 io/channel.c         | 71 ++++++++++++++++++++++++++++----------------
 2 files changed, 71 insertions(+), 25 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 2378567d4b..429ece9a05 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -774,6 +774,31 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
                                     IOHandler *io_write,
                                     void *opaque);
 
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
+ * Behaves like qio_channel_readv_full but will attempt
+ * to read all data specified (file handles and memory regions).
+ * The function will wait for all requested data
+ * to be read, yielding from the current coroutine
+ * if required.
+ *
+ * Returns: 0 if all bytes were read, or -1 on error
+ */
+
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov,
+                                int **fds, size_t *nfds,
+                                Error **errp);
+
 /**
  * qio_channel_writev_full_all:
  * @ioc: the channel object
diff --git a/io/channel.c b/io/channel.c
index bde1f6d0f4..0b084e343f 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -91,11 +91,47 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                               const struct iovec *iov,
                               size_t niov,
                               Error **errp)
+{
+    int ret = qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL, errp);
+
+    if (ret == -ECANCELED) {
+        error_prepend(errp,
+                      "Unexpected end-of-file before all bytes were read: ");
+        ret = -1;
+    }
+
+    return ret;
+}
+
+int qio_channel_readv_all(QIOChannel *ioc,
+                          const struct iovec *iov,
+                          size_t niov,
+                          Error **errp)
+{
+    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
+
+    if (ret == 0) {
+        ret = -1;
+        error_setg(errp,
+                   "Unexpected end-of-file before all bytes were read");
+    } else if (ret == 1) {
+        ret = 0;
+    }
+    return ret;
+}
+
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov,
+                                int **fds, size_t *nfds,
+                                Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
     struct iovec *local_iov_head = local_iov;
     unsigned int nlocal_iov = niov;
+    int **local_fds = fds;
+    size_t *local_nfds = nfds;
     bool partial = false;
 
     nlocal_iov = iov_copy(local_iov, nlocal_iov,
@@ -104,7 +140,8 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
+                                     local_nfds, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
@@ -112,20 +149,21 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
                 qio_channel_wait(ioc, G_IO_IN);
             }
             continue;
-        } else if (len < 0) {
-            goto cleanup;
-        } else if (len == 0) {
-            if (partial) {
-                error_setg(errp,
-                           "Unexpected end-of-file before all bytes were read");
+        }
+        if (len <= 0) {
+            if (partial && (len == 0)) {
+                ret = -ECANCELED;
             } else {
-                ret = 0;
+                ret = len;
             }
             goto cleanup;
         }
 
         partial = true;
         iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        local_fds = NULL;
+        local_nfds = 0;
     }
 
     ret = 1;
@@ -135,23 +173,6 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
     return ret;
 }
 
-int qio_channel_readv_all(QIOChannel *ioc,
-                          const struct iovec *iov,
-                          size_t niov,
-                          Error **errp)
-{
-    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
-
-    if (ret == 0) {
-        ret = -1;
-        error_setg(errp,
-                   "Unexpected end-of-file before all bytes were read");
-    } else if (ret == 1) {
-        ret = 0;
-    }
-    return ret;
-}
-
 int qio_channel_writev_all(QIOChannel *ioc,
                            const struct iovec *iov,
                            size_t niov,
-- 
2.25.GIT


