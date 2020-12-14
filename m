Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478842D928C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:20:33 +0100 (CET)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogHg-0001T6-8q
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogCr-0004rn-NZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:15:33 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:46266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogCp-0007Bf-7a
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:15:33 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5DpV6087981;
 Mon, 14 Dec 2020 05:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=+fwk46T9QZ+3By75r4vme/SQQZRot7+Ss7Qs4tZeF+o=;
 b=BhdKMXlV3/+fce0V9IMZgSYxg4Luf1cjBcKk7CXK0O5xCE9OYRZDr2ogjDHFM+W1p6Q2
 CzOTXi893f2QABWIjpfc154IChlPnz4dTIKJjYItH8e/PEVBl/viqp3eqY7aoVjI1CeI
 m91U/mR1GQ5/eWi/LlYE0+XIRlaoC1hR1Zhiz/LbPXWClmyj1y/TCnGi5pdGJNi4dbkX
 0qYOtOUuwv/8CC5wATImKQT76Gpdixv/Q1VACPaqkRCTKUwEmfYOR2c4xkBdnRkzzMDc
 3Xmf2HC1CG2xuT5ho6sZvx/JBz4347A3Tc2Bid9rZHeRO6ijE26hE65bQgstbKzBW8IY 7Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35ckcb3gw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 05:15:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5Aoj7184533;
 Mon, 14 Dec 2020 05:15:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 35d7rw1nkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 05:15:22 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BE5FKVg030608;
 Mon, 14 Dec 2020 05:15:20 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Dec 2020 21:15:20 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 07/19] multi-process: add qio channel function to transmit
 data and fds
Date: Mon, 14 Dec 2020 00:14:47 -0500
Message-Id: <a366c7f80a862b4f32445f8334e2f36767b102a3.1607922214.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
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

Adds QIO channel functions that transmit and receive iovs along with fds.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/io/channel.h | 50 +++++++++++++++++++++++++++++++++++++++++
 io/channel.c         | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 4d6fe45..c2d9836 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -774,4 +774,54 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
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
+ * Behaves like qio_channel_readvv_full but will attempt
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
+/**
+ * qio_channel_writev_full_all:
+ * @ioc: the channel object
+ * @iov: the array of memory regions to write data from
+ * @niov: the length of the @iov array
+ * @fds: an array of file handles to send
+ * @nfds: number of file handles in @fds
+ * @errp: pointer to a NULL-initialized error object
+ *
+ *
+ * Behaves like qio_channel_writev_full but will attempt
+ * to send all data passed (file handles and memory regions).
+ * The function will wait for all requested data
+ * to be written, yielding from the current coroutine
+ * if required.
+ *
+ * Returns: 0 if all bytes were written, or -1 on error
+ */
+
+int qio_channel_writev_full_all(QIOChannel *ioc,
+                           const struct iovec *iov,
+                           size_t niov,
+                           int *fds, size_t nfds,
+                           Error **errp);
+
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index 93d449d..13b0e7a 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -152,15 +152,72 @@ int qio_channel_readv_all(QIOChannel *ioc,
     return ret;
 }
 
+int qio_channel_readv_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov,
+                                int **fds, size_t *nfds,
+                                Error **errp)
+{
+    int ret = -1;
+    struct iovec *local_iov = g_new(struct iovec, niov);
+    struct iovec *local_iov_head = local_iov;
+    unsigned int nlocal_iov = niov;
+    int **local_fds = fds;
+    size_t *local_nfds = nfds;
+
+    nlocal_iov = iov_copy(local_iov, nlocal_iov,
+                          iov, niov,
+                          0, iov_size(iov, niov));
+
+    while (nlocal_iov > 0) {
+        ssize_t len;
+        len = qio_channel_readv_full(ioc, local_iov, nlocal_iov, local_fds,
+                                     local_nfds, errp);
+        if (len == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_OUT);
+            } else {
+                qio_channel_wait(ioc, G_IO_OUT);
+            }
+            continue;
+        }
+        if (len <= 0) {
+            ret = len;
+            goto cleanup;
+        }
+
+        iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        local_fds = NULL;
+        local_nfds = 0;
+    }
+
+    ret = 1;
+ cleanup:
+    g_free(local_iov_head);
+    return ret;
+}
+
 int qio_channel_writev_all(QIOChannel *ioc,
                            const struct iovec *iov,
                            size_t niov,
                            Error **errp)
 {
+    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+}
+
+int qio_channel_writev_full_all(QIOChannel *ioc,
+                                const struct iovec *iov,
+                                size_t niov,
+                                int *fds, size_t nfds,
+                                Error **errp)
+{
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
     struct iovec *local_iov_head = local_iov;
     unsigned int nlocal_iov = niov;
+    int *local_fds = fds;
+    size_t local_nfds = nfds;
 
     nlocal_iov = iov_copy(local_iov, nlocal_iov,
                           iov, niov,
@@ -168,7 +225,8 @@ int qio_channel_writev_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, local_fds,
+                                      local_nfds, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -182,6 +240,9 @@ int qio_channel_writev_all(QIOChannel *ioc,
         }
 
         iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        local_fds = NULL;
+        local_nfds = 0;
     }
 
     ret = 0;
-- 
1.8.3.1


