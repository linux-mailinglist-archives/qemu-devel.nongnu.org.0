Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FC233609
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 17:52:03 +0200 (CEST)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Aqg-0000zY-6W
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 11:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AdO-0007Wf-GE
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:38:18 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AdM-0002Au-8i
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:38:18 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFXbZP007647;
 Thu, 30 Jul 2020 15:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=yiR9ky1zjTylsw8BvTXwpDDI6qX/bEvwcYOs2wTpK2g=;
 b=jLeRnvBKmk3fqCsGN5XETuObcAsvUR0IfiKA5km8vUp+JKn0cppTODFVSB6dYeYthEdt
 SCMz+3CUnzDWohYmt7wHJJarex5WvRYBqy/7A5M2jFN/86Lq87gG/Tp7T0K8bdb8AmtJ
 VvcTchZ+6rLpqhY8svvt5b7/rLKiR43l6xPQfJFvH5vYm7t7WmgGNdtJffntuOO2uJuM
 1gtL3AZLjAnUXBhtJPN2uJtMCthTNIEbvrFCoL7iq/8mx0ShHUL3WqPc6tsP7O2nYbsL
 UC0UCbKotxXIJQaQSFSHyfaRVwbecRUUo3xuFHyf12gHZbTjVYGBGiOqs+ytzIDadvER QA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 32hu1jmffm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 15:38:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFYkbK172237;
 Thu, 30 Jul 2020 15:38:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 32hu5x0wnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 15:38:12 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06UFcBVv014547;
 Thu, 30 Jul 2020 15:38:11 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jul 2020 08:38:11 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V1 22/32] char: qio_channel_socket_accept reuse fd
Date: Thu, 30 Jul 2020 08:14:26 -0700
Message-Id: <1596122076-341293-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=1 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=1 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300111
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 11:37:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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

From: Mark Kanda <mark.kanda@oracle.com>

Add an fd argument to qio_channel_socket_accept.  If not -1, the channel
uses that fd instead of accepting a new socket connection.  All callers
pass -1 in this patch, so no functional change.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/io/channel-socket.h    |  3 ++-
 io/channel-socket.c            | 12 +++++++++---
 io/net-listener.c              |  4 ++--
 scsi/qemu-pr-helper.c          |  2 +-
 tests/qtest/tpm-emu.c          |  2 +-
 tests/test-char.c              |  2 +-
 tests/test-io-channel-socket.c |  4 ++--
 7 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index 777ff59..0ffc560 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -248,6 +248,7 @@ qio_channel_socket_get_remote_address(QIOChannelSocket *ioc,
 /**
  * qio_channel_socket_accept:
  * @ioc: the socket channel object
+ * @reuse_fd: fd to reuse; -1 otherwise
  * @errp: pointer to a NULL-initialized error object
  *
  * If the socket represents a server, then this accepts
@@ -258,7 +259,7 @@ qio_channel_socket_get_remote_address(QIOChannelSocket *ioc,
  */
 QIOChannelSocket *
 qio_channel_socket_accept(QIOChannelSocket *ioc,
-                          Error **errp);
+                          int reuse_fd, Error **errp);
 
 
 #endif /* QIO_CHANNEL_SOCKET_H */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index e1b4667..dde12bf 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -352,7 +352,7 @@ void qio_channel_socket_dgram_async(QIOChannelSocket *ioc,
 
 QIOChannelSocket *
 qio_channel_socket_accept(QIOChannelSocket *ioc,
-                          Error **errp)
+                          int reuse_fd, Error **errp)
 {
     QIOChannelSocket *cioc;
 
@@ -362,8 +362,14 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
 
  retry:
     trace_qio_channel_socket_accept(ioc);
-    cioc->fd = qemu_accept(ioc->fd, (struct sockaddr *)&cioc->remoteAddr,
-                           &cioc->remoteAddrLen);
+
+    if (reuse_fd != -1) {
+        cioc->fd = reuse_fd;
+    } else {
+        cioc->fd = qemu_accept(ioc->fd, (struct sockaddr *)&cioc->remoteAddr,
+                               &cioc->remoteAddrLen);
+    }
+
     if (cioc->fd < 0) {
         if (errno == EINTR) {
             goto retry;
diff --git a/io/net-listener.c b/io/net-listener.c
index 5d8a226..bbdea1e 100644
--- a/io/net-listener.c
+++ b/io/net-listener.c
@@ -45,7 +45,7 @@ static gboolean qio_net_listener_channel_func(QIOChannel *ioc,
     QIOChannelSocket *sioc;
 
     sioc = qio_channel_socket_accept(QIO_CHANNEL_SOCKET(ioc),
-                                     NULL);
+                                     -1, NULL);
     if (!sioc) {
         return TRUE;
     }
@@ -194,7 +194,7 @@ static gboolean qio_net_listener_wait_client_func(QIOChannel *ioc,
     QIOChannelSocket *sioc;
 
     sioc = qio_channel_socket_accept(QIO_CHANNEL_SOCKET(ioc),
-                                     NULL);
+                                     -1, NULL);
     if (!sioc) {
         return TRUE;
     }
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 57ad830..0e6d683 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -800,7 +800,7 @@ static gboolean accept_client(QIOChannel *ioc, GIOCondition cond, gpointer opaqu
     PRHelperClient *prh;
 
     cioc = qio_channel_socket_accept(QIO_CHANNEL_SOCKET(ioc),
-                                     NULL);
+                                     -1, NULL);
     if (!cioc) {
         return TRUE;
     }
diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
index 2e8eb7b..19e5dab 100644
--- a/tests/qtest/tpm-emu.c
+++ b/tests/qtest/tpm-emu.c
@@ -83,7 +83,7 @@ void *tpm_emu_ctrl_thread(void *data)
     g_cond_signal(&s->data_cond);
 
     qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
-    ioc = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
+    ioc = QIO_CHANNEL(qio_channel_socket_accept(lioc, -1, &error_abort));
     g_assert(ioc);
 
     {
diff --git a/tests/test-char.c b/tests/test-char.c
index 614bdac..1bb6ae0 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -884,7 +884,7 @@ char_socket_client_server_thread(gpointer data)
     QIOChannelSocket *cioc;
 
 retry:
-    cioc = qio_channel_socket_accept(ioc, &error_abort);
+    cioc = qio_channel_socket_accept(ioc, -1, &error_abort);
     g_assert_nonnull(cioc);
 
     if (char_socket_ping_pong(QIO_CHANNEL(cioc), NULL) != 0) {
diff --git a/tests/test-io-channel-socket.c b/tests/test-io-channel-socket.c
index d43083a..0d410cf 100644
--- a/tests/test-io-channel-socket.c
+++ b/tests/test-io-channel-socket.c
@@ -75,7 +75,7 @@ static void test_io_channel_setup_sync(SocketAddress *listen_addr,
     qio_channel_set_delay(*src, false);
 
     qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
-    *dst = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
+    *dst = QIO_CHANNEL(qio_channel_socket_accept(lioc, -1, &error_abort));
     g_assert(*dst);
 
     test_io_channel_set_socket_bufs(*src, *dst);
@@ -143,7 +143,7 @@ static void test_io_channel_setup_async(SocketAddress *listen_addr,
     g_assert(!data.err);
 
     qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
-    *dst = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
+    *dst = QIO_CHANNEL(qio_channel_socket_accept(lioc, -1, &error_abort));
     g_assert(*dst);
 
     qio_channel_set_delay(*src, false);
-- 
1.8.3.1


