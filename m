Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A3146AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:11:38 +0100 (CET)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iudCq-0007yp-Gg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iubA3-0003iw-3m
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iubA1-0005xj-RC
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52981
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iubA1-0005xM-Mn
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e74Ge0Ww7yZZA67xuglCD/tn2A4GJ0jR8Z8DEmaF9SQ=;
 b=bAQYcGTcbyAaYWzXQ9S19e7Zeyf8+KrZjGVrkxJPitTLOUCsff3EwVBfy8GzuDtmDp4N5G
 UZRE1D1R1deDlkQAjvWeal2TNtTiiy35tHov0dxC0ESdFkeEgSbxqfcGVqGIp8Cs8vFtbz
 YkuFlJF5oe/qG282LVzJ0HerHAVHDDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-fqQ-RirzNqazOZ9GKZPKew-1; Thu, 23 Jan 2020 07:00:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A9AE108838B
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 12:00:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F2D785754;
 Thu, 23 Jan 2020 12:00:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 068/111] contrib/libvhost-user: Protect slave fd with mutex
Date: Thu, 23 Jan 2020 11:57:58 +0000
Message-Id: <20200123115841.138849-69-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fqQ-RirzNqazOZ9GKZPKew-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

In future patches we'll be performing commands on the slave-fd driven
by commands on queues, since those queues will be driven by individual
threads we need to make sure they don't attempt to use the slave-fd
for multiple commands in parallel.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 24 ++++++++++++++++++++----
 contrib/libvhost-user/libvhost-user.h |  3 +++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/=
libvhost-user.c
index ec27b78ff1..63e41062a4 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -392,26 +392,37 @@ vu_send_reply(VuDev *dev, int conn_fd, VhostUserMsg *=
vmsg)
     return vu_message_write(dev, conn_fd, vmsg);
 }
=20
+/*
+ * Processes a reply on the slave channel.
+ * Entered with slave_mutex held and releases it before exit.
+ * Returns true on success.
+ */
 static bool
 vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg)
 {
     VhostUserMsg msg_reply;
+    bool result =3D false;
=20
     if ((vmsg->flags & VHOST_USER_NEED_REPLY_MASK) =3D=3D 0) {
-        return true;
+        result =3D true;
+        goto out;
     }
=20
     if (!vu_message_read(dev, dev->slave_fd, &msg_reply)) {
-        return false;
+        goto out;
     }
=20
     if (msg_reply.request !=3D vmsg->request) {
         DPRINT("Received unexpected msg type. Expected %d received %d",
                vmsg->request, msg_reply.request);
-        return false;
+        goto out;
     }
=20
-    return msg_reply.payload.u64 =3D=3D 0;
+    result =3D msg_reply.payload.u64 =3D=3D 0;
+
+out:
+    pthread_mutex_unlock(&dev->slave_mutex);
+    return result;
 }
=20
 /* Kick the log_call_fd if required. */
@@ -1105,10 +1116,13 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq=
 *vq, int fd,
         return false;
     }
=20
+    pthread_mutex_lock(&dev->slave_mutex);
     if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
+        pthread_mutex_unlock(&dev->slave_mutex);
         return false;
     }
=20
+    /* Also unlocks the slave_mutex */
     return vu_process_message_reply(dev, &vmsg);
 }
=20
@@ -1628,6 +1642,7 @@ vu_deinit(VuDev *dev)
         close(dev->slave_fd);
         dev->slave_fd =3D -1;
     }
+    pthread_mutex_destroy(&dev->slave_mutex);
=20
     if (dev->sock !=3D -1) {
         close(dev->sock);
@@ -1663,6 +1678,7 @@ vu_init(VuDev *dev,
     dev->remove_watch =3D remove_watch;
     dev->iface =3D iface;
     dev->log_call_fd =3D -1;
+    pthread_mutex_init(&dev->slave_mutex, NULL);
     dev->slave_fd =3D -1;
     dev->max_queues =3D max_queues;
=20
diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/=
libvhost-user.h
index 46b600799b..1844b6f8d4 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -19,6 +19,7 @@
 #include <stddef.h>
 #include <sys/poll.h>
 #include <linux/vhost.h>
+#include <pthread.h>
 #include "standard-headers/linux/virtio_ring.h"
=20
 /* Based on qemu/hw/virtio/vhost-user.c */
@@ -355,6 +356,8 @@ struct VuDev {
     VuVirtq *vq;
     VuDevInflightInfo inflight_info;
     int log_call_fd;
+    /* Must be held while using slave_fd */
+    pthread_mutex_t slave_mutex;
     int slave_fd;
     uint64_t log_size;
     uint8_t *log_table;
--=20
2.24.1


