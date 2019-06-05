Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5235A46
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 12:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYSuG-0001u7-1M
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 06:12:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYSr9-0008HM-Hc
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYSr8-0007as-HQ
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:09:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:47172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYSr8-0007Ys-9Q; Wed, 05 Jun 2019 06:09:18 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYSr4-0000xT-1J; Wed, 05 Jun 2019 13:09:14 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 13:09:12 +0300
Message-Id: <20190605100913.34972-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190605100913.34972-1-vsementsov@virtuozzo.com>
References: <20190605100913.34972-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 1/2] io/channel: add qio_channel_set_keepalive
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
 include/io/channel.h | 13 +++++++++++++
 io/channel-socket.c  | 19 +++++++++++++++++++
 io/channel.c         | 14 ++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/include/io/channel.h b/include/io/channel.h
index 59460cb1ec..34d871a414 100644
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
@@ -490,6 +493,16 @@ int qio_channel_set_blocking(QIOChannel *ioc,
                              bool enabled,
                              Error **errp);
 
+/*
+ * qio_channel_set_keepalive:
+ * @ioc: the channel object
+ * @enabled: the keepalive flag state
+ * @errp: pointer to a NULL-initialized error object
+ */
+int qio_channel_set_keepalive(QIOChannel *ioc,
+                              bool enabled,
+                              Error **errp);
+
 /**
  * qio_channel_close:
  * @ioc: the channel object
diff --git a/io/channel-socket.c b/io/channel-socket.c
index bc5f80e780..5c1ea08660 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -656,6 +656,24 @@ qio_channel_socket_set_blocking(QIOChannel *ioc,
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
+    }
+
+    return ret;
+}
+
+
 static void
 qio_channel_socket_set_delay(QIOChannel *ioc,
                              bool enabled)
@@ -762,6 +780,7 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_writev = qio_channel_socket_writev;
     ioc_klass->io_readv = qio_channel_socket_readv;
     ioc_klass->io_set_blocking = qio_channel_socket_set_blocking;
+    ioc_klass->io_set_keepalive = qio_channel_socket_set_keepalive;
     ioc_klass->io_close = qio_channel_socket_close;
     ioc_klass->io_shutdown = qio_channel_socket_shutdown;
     ioc_klass->io_set_cork = qio_channel_socket_set_cork;
diff --git a/io/channel.c b/io/channel.c
index 2a26c2a2c0..0f0b2b7b65 100644
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
+        return -ENOTSUP;
+    }
+
+    return klass->io_set_keepalive(ioc, enabled, errp);
+}
+
 
 int qio_channel_close(QIOChannel *ioc,
                       Error **errp)
-- 
2.18.0


