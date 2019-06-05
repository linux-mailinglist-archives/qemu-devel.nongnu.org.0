Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B64A3611C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 18:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYYfS-0005pV-NN
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 12:21:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYYc6-0003jO-HW
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYYc5-0000B4-4o
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:18:10 -0400
Received: from relay.sw.ru ([185.231.240.75]:33138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYYc4-00005n-TZ; Wed, 05 Jun 2019 12:18:09 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYYc1-0003ZF-FG; Wed, 05 Jun 2019 19:18:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 19:18:03 +0300
Message-Id: <20190605161804.118956-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190605161804.118956-1-vsementsov@virtuozzo.com>
References: <20190605161804.118956-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 1/2] io/channel: add
 qio_channel_set_keepalive
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
	mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/io/channel.h | 15 +++++++++++++++
 io/channel-socket.c  | 20 ++++++++++++++++++++
 io/channel.c         | 14 ++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index 59460cb1ec..b8789ea08a 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -124,6 +124,9 @@ struct QIOChannelClass {
     int (*io_set_blocking)(QIOChannel *ioc,
                            bool enabled,
                            Error **errp);
+    int (*io_set_keepalive)(QIOChannel *ioc,
+                            bool enabled,
+                            Error **errp);
 
     /* Optional callbacks */
     int (*io_shutdown)(QIOChannel *ioc,
@@ -490,6 +493,18 @@ int qio_channel_set_blocking(QIOChannel *ioc,
                              bool enabled,
                              Error **errp);
 
+/*
+ * qio_channel_set_keepalive:
+ * @ioc: the channel object
+ * @enabled: the keepalive flag state
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Returns 0 on success, -1 on error.
+ */
+int qio_channel_set_keepalive(QIOChannel *ioc,
+                              bool enabled,
+                              Error **errp);
+
 /**
  * qio_channel_close:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index bc5f80e780..84b474851b 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -656,6 +656,25 @@ qio_channel_socket_set_blocking(QIOChannel *ioc,
 }
 
 
+static int
+qio_channel_socket_set_keepalive(QIOChannel *ioc,
+                                 bool enabled,
+                                 Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    int val = enabled;
+    int ret = qemu_setsockopt(sioc->fd, SOL_SOCKET, SO_KEEPALIVE,
+                              &val, sizeof(val));
+
+    if (ret < 0) {
+        error_setg_errno(errp, errno, "Unable to set KEEPALIVE");
+        return -1;
+    }
+
+    return 0;
+}
+
+
 static void
 qio_channel_socket_set_delay(QIOChannel *ioc,
                              bool enabled)
@@ -762,6 +781,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_writev = qio_channel_socket_writev;
     ioc_klass->io_readv = qio_channel_socket_readv;
     ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
+    ioc_klass->io_set_keepalive = qio_channel_socket_set_keepalive;
     ioc_klass->io_close = qio_channel_socket_close;
     ioc_klass->io_shutdown = qio_channel_socket_shutdown;
     ioc_klass->io_set_cork = qio_channel_socket_set_cork;
diff --git a/io/channel.c b/io/channel.c
index 2a26c2a2c0..a9e62fdbdc 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -265,6 +265,20 @@ int qio_channel_set_blocking(QIOChannel *ioc,
     return klass->io_set_blocking(ioc, enabled, errp);
 }
 
+int qio_channel_set_keepalive(QIOChannel *ioc,
+                              bool enabled,
+                              Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_set_keepalive) {
+        error_setg(errp, "KEEPALIVE is not supported by IO channel");
+        return -1;
+    }
+
+    return klass->io_set_keepalive(ioc, enabled, errp);
+}
+
 
 int qio_channel_close(QIOChannel *ioc,
                       Error **errp)
-- 
2.18.0


