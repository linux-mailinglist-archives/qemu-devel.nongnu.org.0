Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA13A8AE7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:16:44 +0200 (CEST)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGQN-0004np-Fx
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzL-0003J0-SK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzA-0001GT-2M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XK+osHD091m4Tdr5I26eCX8OVZ2HajRv/geqf0btSkw=;
 b=C215zEjZR1uNRd5Lf2bpmu2DOglB87FPlufSQp+Ee2dQCAI1YCETMd+t8pPtVvQ9tkmHw8
 PG/tT3ScZkzQB6ygO/6504aoZn6JRJh72K/+AVx39JVRq1xgH6iz2YIV3bC2s50Y71P2+9
 lgV0i2ycERqtmyDo1GqH4r2dsuv3g9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Oj95WWD-P2m4qn39z0tDLg-1; Tue, 15 Jun 2021 16:48:33 -0400
X-MC-Unique: Oj95WWD-P2m4qn39z0tDLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91EA180EDB1;
 Tue, 15 Jun 2021 20:48:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 234445D9CA;
 Tue, 15 Jun 2021 20:48:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/34] block/nbd: reuse nbd_co_do_establish_connection() in
 nbd_open()
Date: Tue, 15 Jun 2021 15:47:54 -0500
Message-Id: <20210615204756.281505-33-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The only last step we need to reuse the function is coroutine-wrapper.
nbd_open() may be called from non-coroutine context. So, generate the
wrapper and use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-31-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/coroutines.h |   6 +++
 block/nbd.c        | 103 +++------------------------------------------
 2 files changed, 11 insertions(+), 98 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 4cfb4946e65e..514d169d23d6 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -66,4 +66,10 @@ int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
 int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
                                         QEMUIOVector *qiov, int64_t pos);

+int generated_co_wrapper
+nbd_do_establish_connection(BlockDriverState *bs, Error **errp);
+int coroutine_fn
+nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
+
+
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/nbd.c b/block/nbd.c
index bf2e9393146b..5e7e238b4790 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -44,6 +44,7 @@
 #include "block/qdict.h"
 #include "block/nbd.h"
 #include "block/block_int.h"
+#include "block/coroutines.h"

 #include "qemu/yank.h"

@@ -99,11 +100,6 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;

-static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
-                                                  SocketAddress *saddr,
-                                                  Error **errp);
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp);
 static void nbd_yank(void *opaque);

 static void nbd_clear_bdrvstate(BlockDriverState *bs)
@@ -356,8 +352,8 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
     return 0;
 }

-static int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
-                                                       Error **errp)
+int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
+                                                Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
@@ -1573,83 +1569,6 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }

-static QIOChannelSocket *nbd_establish_connection(BlockDriverState *bs,
-                                                  SocketAddress *saddr,
-                                                  Error **errp)
-{
-    ERRP_GUARD();
-    QIOChannelSocket *sioc;
-
-    sioc = qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
-
-    qio_channel_socket_connect_sync(sioc, saddr, errp);
-    if (*errp) {
-        object_unref(OBJECT(sioc));
-        return NULL;
-    }
-
-    yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank, bs);
-    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
-
-    return sioc;
-}
-
-/* nbd_client_handshake takes ownership on sioc. */
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    AioContext *aio_context = bdrv_get_aio_context(bs);
-    int ret;
-
-    trace_nbd_client_handshake(s->export);
-    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);
-
-    s->info.request_sizes = true;
-    s->info.structured_reply = true;
-    s->info.base_allocation = true;
-    s->info.x_dirty_bitmap = g_strdup(s->x_dirty_bitmap);
-    s->info.name = g_strdup(s->export ?: "");
-    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), s->tlscreds,
-                                s->hostname, &s->ioc, &s->info, errp);
-    g_free(s->info.x_dirty_bitmap);
-    g_free(s->info.name);
-    if (ret < 0) {
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                 nbd_yank, bs);
-        object_unref(OBJECT(sioc));
-        return ret;
-    }
-
-    if (s->ioc) {
-        /* sioc is referenced by s->ioc */
-        object_unref(OBJECT(sioc));
-    } else {
-        s->ioc = QIO_CHANNEL(sioc);
-    }
-    sioc = NULL;
-
-    ret = nbd_handle_updated_info(bs, errp);
-    if (ret < 0) {
-        /*
-         * We have connected, but must fail for other reasons.
-         * Send NBD_CMD_DISC as a courtesy to the server.
-         */
-        NBDRequest request = { .type = NBD_CMD_DISC };
-
-        nbd_send_request(s->ioc, &request);
-
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                 nbd_yank, bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-        return ret;
-    }
-
-    return 0;
-}

 /*
  * Parse nbd_open options
@@ -2039,7 +1958,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    QIOChannelSocket *sioc;

     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
@@ -2057,22 +1975,11 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->conn = nbd_client_connection_new(s->saddr, true, s->export,
                                         s->x_dirty_bitmap, s->tlscreds);

-    /*
-     * establish TCP connection, return error if it fails
-     * TODO: Configurable retry-until-timeout behaviour.
-     */
-    sioc = nbd_establish_connection(bs, s->saddr, errp);
-    if (!sioc) {
-        ret = -ECONNREFUSED;
-        goto fail;
-    }
-
-    ret = nbd_client_handshake(bs, sioc, errp);
+    /* TODO: Configurable retry-until-timeout behaviour. */
+    ret = nbd_do_establish_connection(bs, errp);
     if (ret < 0) {
         goto fail;
     }
-    /* successfully connected */
-    s->state = NBD_CLIENT_CONNECTED;

     s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
     bdrv_inc_in_flight(bs);
-- 
2.31.1


