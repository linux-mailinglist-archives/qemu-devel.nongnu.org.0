Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1443A8A92
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:04:51 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGEs-0006Ka-W1
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzD-00033E-OV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0001Eu-Ca
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+BLBZYyc/XTK+SJC9L390FFiqjPgeOkKjk8dlP/7Rs=;
 b=ZqH18TT1I+GgLVBe/sklS0f71gPUChnkeEdXVodtknlt9wnxD3h1qAnuHBXWHL/XWBDsd6
 Y2ftIgITCdm3/FPoSwja13WsoMNO7dCxHLXvayiF0Db/k6OU422B6DJlEVqO6S9BPKeIew
 ZIBIOwep2N4i0zN6XmqJgqtNoQUEY60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-Hr75lVBoMWaE7G2p0l17CA-1; Tue, 15 Jun 2021 16:48:30 -0400
X-MC-Unique: Hr75lVBoMWaE7G2p0l17CA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D57FCA6;
 Tue, 15 Jun 2021 20:48:29 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 030C95D9CA;
 Tue, 15 Jun 2021 20:48:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/34] block/nbd: drop BDRVNBDState::sioc
Date: Tue, 15 Jun 2021 15:47:49 -0500
Message-Id: <20210615204756.281505-28-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Currently sioc pointer is used just to pass from socket-connection to
nbd negotiation. Drop the field, and use local variables instead. With
next commit we'll update nbd/client-connection.c to behave
appropriately (return only top-most ioc, not two channels).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-26-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 98 ++++++++++++++++++++++++++---------------------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 2abcedd464c7..9f193d130bcd 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -67,8 +67,7 @@ typedef enum NBDClientState {
 } NBDClientState;

 typedef struct BDRVNBDState {
-    QIOChannelSocket *sioc; /* The master data channel */
-    QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
+    QIOChannel *ioc; /* The current I/O channel */
     NBDExportInfo info;

     CoMutex send_mutex;
@@ -100,9 +99,11 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;

-static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
-                                    Error **errp);
-static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
+static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
+                                                  SocketAddress *saddr,
+                                                  Error **errp);
+static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
+                                Error **errp);
 static void nbd_yank(void *opaque);

 static void nbd_clear_bdrvstate(BlockDriverState *bs)
@@ -359,6 +360,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     AioContext *aio_context = bdrv_get_aio_context(s->bs);
+    QIOChannelSocket *sioc;

     if (!nbd_client_connecting(s)) {
         return;
@@ -393,27 +395,26 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
     }

-    s->sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
-    if (!s->sioc) {
+    sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
+    if (!sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }

-    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
     if (s->ioc) {
-        qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
-        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
+        /* sioc is referenced by s->ioc */
+        object_unref(OBJECT(sioc));
     } else {
-        s->ioc = QIO_CHANNEL(s->sioc);
-        object_ref(OBJECT(s->ioc));
+        s->ioc = QIO_CHANNEL(sioc);
     }
+    sioc = NULL;
+
+    qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);

     yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
                            s->bs);
@@ -430,8 +431,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)

         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;

@@ -566,8 +565,6 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
     }
@@ -1566,7 +1563,7 @@ static void nbd_yank(void *opaque)
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

     qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
-    qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
 }

 static void nbd_client_close(BlockDriverState *bs)
@@ -1581,57 +1578,64 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }

-static int nbd_establish_connection(BlockDriverState *bs,
-                                    SocketAddress *saddr,
-                                    Error **errp)
+static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
+                                                  SocketAddress *saddr,
+                                                  Error **errp)
 {
     ERRP_GUARD();
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    QIOChannelSocket *sioc;

-    s->sioc = qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(s->sioc), "nbd-client");
+    sioc = qio_channel_socket_new();
+    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");

-    qio_channel_socket_connect_sync(s->sioc, saddr, errp);
+    qio_channel_socket_connect_sync(sioc, saddr, errp);
     if (*errp) {
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
-        return -1;
+        object_unref(OBJECT(sioc));
+        return NULL;
     }

     yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank, bs);
-    qio_channel_set_delay(QIO_CHANNEL(s->sioc), false);
+    qio_channel_set_delay(QIO_CHANNEL(sioc), false);

-    return 0;
+    return sioc;
 }

-/* nbd_client_handshake takes ownership on s->sioc. On failure it's unref'ed. */
-static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
+/* nbd_client_handshake takes ownership on sioc. */
+static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
+                                Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     AioContext *aio_context = bdrv_get_aio_context(bs);
     int ret;

     trace_nbd_client_handshake(s->export);
-    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
+    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);

     s->info.request_sizes = true;
     s->info.structured_reply = true;
     s->info.base_allocation = true;
     s->info.x_dirty_bitmap = g_strdup(s->x_dirty_bitmap);
     s->info.name = g_strdup(s->export ?: "");
-    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(s->sioc), s->tlscreds,
+    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), s->tlscreds,
                                 s->hostname, &s->ioc, &s->info, errp);
     g_free(s->info.x_dirty_bitmap);
     g_free(s->info.name);
     if (ret < 0) {
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                  nbd_yank, bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
+        object_unref(OBJECT(sioc));
         return ret;
     }

+    if (s->ioc) {
+        /* sioc is referenced by s->ioc */
+        object_unref(OBJECT(sioc));
+    } else {
+        s->ioc = QIO_CHANNEL(sioc);
+    }
+    sioc = NULL;
+
     ret = nbd_handle_updated_info(bs, errp);
     if (ret < 0) {
         /*
@@ -1640,23 +1644,15 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
          */
         NBDRequest request = { .type = NBD_CMD_DISC };

-        nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
+        nbd_send_request(s->ioc, &request);

         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
                                  nbd_yank, bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
-
         return ret;
     }

-    if (!s->ioc) {
-        s->ioc = QIO_CHANNEL(s->sioc);
-        object_ref(OBJECT(s->ioc));
-    }
-
     return 0;
 }

@@ -2048,6 +2044,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    QIOChannelSocket *sioc;

     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
@@ -2069,12 +2066,13 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
-    if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
+    sioc = nbd_establish_connection(bs, s->saddr, errp);
+    if (!sioc) {
         ret = -ECONNREFUSED;
         goto fail;
     }

-    ret = nbd_client_handshake(bs, errp);
+    ret = nbd_client_handshake(bs, sioc, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.31.1


