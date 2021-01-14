Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF552F64FD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:47:46 +0100 (CET)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04qe-00067n-Sx
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04m1-00038U-5S
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:42:57 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l04lr-00025s-KS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:42:56 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFYBo1149877;
 Thu, 14 Jan 2021 15:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=tITNisM76d2ptiLo4WZ9Z0oHxop9K3Kuk+IOTcDyeg0=;
 b=ayk4C+ygFoyngpsQnkvB1hi83C6MIZ8yeCqJyaghtS+6Fk2bAfoJv/k4xzWulSONDaNq
 zVt9qcm01N2PLXJZlG/3eE7qwf5ki+uDvarYvcahfLSXigy4K7Mb9oAqw96krsUCmWA6
 XgnKJoU2ZnZOZonthj7pgc5U5dqiRdeE6HcHGmEzZsVR1wmq1MxgsMBMr4YExE2EJ+Jh
 2n18SaF0OH2WzuDvxIaIo5NIE5kNliDBbofcbEoufqzvTqBq8fJuhUVZGJJnPnMtQHHG
 ae/AodRoUEZr/gjLjLQJ17h3ajGAIvNeEjQ5A+xHg89qLjQrRO/IUx/PN8BIYs8SjZN8 2Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kd00sgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:42:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EFYroN093459;
 Thu, 14 Jan 2021 15:40:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 360kf9nyfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 15:40:35 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10EFeX4N019469;
 Thu, 14 Jan 2021 15:40:33 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 07:40:33 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v19 07/20] io: add qio_channel_writev_full_all helper
Date: Thu, 14 Jan 2021 10:40:02 -0500
Message-Id: <2542fd7d9e65fa20163699233530b76acf70de0a.1610638428.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610638428.git.jag.raman@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610638428.git.jag.raman@oracle.com>
References: <cover.1610638428.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140090
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

Adds qio_channel_writev_full_all() to transmit both data and FDs.
Refactors existing code to use this helper.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/io/channel.h | 25 +++++++++++++++++++++++++
 io/channel.c         | 15 ++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index ab9ea77..19e76fc 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -777,4 +777,29 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
                                     IOHandler *io_write,
                                     void *opaque);
 
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
+                                const struct iovec *iov,
+                                size_t niov,
+                                int *fds, size_t nfds,
+                                Error **errp);
+
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel.c b/io/channel.c
index 93d449d..0d4b8b5 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -157,6 +157,15 @@ int qio_channel_writev_all(QIOChannel *ioc,
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
@@ -168,7 +177,8 @@ int qio_channel_writev_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
+        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
+                                      errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -182,6 +192,9 @@ int qio_channel_writev_all(QIOChannel *ioc,
         }
 
         iov_discard_front(&local_iov, &nlocal_iov, len);
+
+        fds = NULL;
+        nfds = 0;
     }
 
     ret = 0;
-- 
1.8.3.1


