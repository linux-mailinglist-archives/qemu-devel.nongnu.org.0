Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201DA2F47B4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:39:24 +0100 (CET)
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzccd-0005VP-3L
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUn-0005na-TF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUi-0002wm-Vr
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610530271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VH0r/GZLW+747oKc/EuvS2rYYWlkaxPrcllC6yXz0X4=;
 b=L0W+E5jZXJ0JmBbXD9d81rAAg3xRBwkiBU2PWsMq34DEuh4SEDs5hTjCWfX9CXxrP77G7U
 sv34NyhYxMib8yJH/dwz+ULPMLlo7tj7EWD6wRVOY59/kV0BxbUz6cfJf1nCc5VWaLc2S6
 FSpmdZI/K2cTpXIoVaShQV4RaKZ5dIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-En7s5G6cOzGqFOslTUhcww-1; Wed, 13 Jan 2021 04:31:09 -0500
X-MC-Unique: En7s5G6cOzGqFOslTUhcww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB7C1005D44;
 Wed, 13 Jan 2021 09:31:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079456A916;
 Wed, 13 Jan 2021 09:31:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 877A311385FD; Wed, 13 Jan 2021 10:31:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] block/nbd.c: Add yank feature
Date: Wed, 13 Jan 2021 10:30:56 +0100
Message-Id: <20210113093101.550964-3-armbru@redhat.com>
In-Reply-To: <20210113093101.550964-1-armbru@redhat.com>
References: <20210113093101.550964-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, lukasstraub2@web.de,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Register a yank function which shuts down the socket and sets
s->state = NBD_CLIENT_QUIT. This is the same behaviour as if an
error occured.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <b73eb07db6d1fcd00667beb13ae6117260f002c3.1609167865.git.lukasstraub2@web.de>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/nbd.c | 153 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 92 insertions(+), 61 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 242a258f3a..42e10c7c93 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -35,6 +35,7 @@
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
+#include "qemu/atomic.h"
 
 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/qmp/qstring.h"
@@ -44,6 +45,8 @@
 #include "block/nbd.h"
 #include "block/block_int.h"
 
+#include "qemu/yank.h"
+
 #define EN_OPTSTR ":exportname="
 #define MAX_NBD_REQUESTS    16
 
@@ -141,14 +144,13 @@ typedef struct BDRVNBDState {
     NBDConnectThread *connect_thread;
 } BDRVNBDState;
 
-static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
-                                                  Error **errp);
-static QIOChannelSocket *nbd_co_establish_connection(BlockDriverState *bs,
-                                                     Error **errp);
+static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
+                                    Error **errp);
+static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
                                                bool detach);
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp);
+static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
+static void nbd_yank(void *opaque);
 
 static void nbd_clear_bdrvstate(BDRVNBDState *s)
 {
@@ -166,12 +168,12 @@ static void nbd_clear_bdrvstate(BDRVNBDState *s)
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
-        if (s->state == NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (s->state == NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
             qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
         }
         s->state = NBD_CLIENT_QUIT;
@@ -203,7 +205,7 @@ static void reconnect_delay_timer_cb(void *opaque)
 {
     BDRVNBDState *s = opaque;
 
-    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         while (qemu_co_enter_next(&s->free_sema, NULL)) {
             /* Resume all queued requests */
@@ -215,7 +217,7 @@ static void reconnect_delay_timer_cb(void *opaque)
 
 static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
 {
-    if (s->state != NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTING_WAIT) {
         return;
     }
 
@@ -260,7 +262,7 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
      * s->connection_co is either yielded from nbd_receive_reply or from
      * nbd_co_reconnect_loop()
      */
-    if (s->state == NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }
 
@@ -286,7 +288,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
 
     reconnect_delay_timer_del(s);
 
-    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         qemu_co_queue_restart_all(&s->free_sema);
     }
@@ -337,13 +339,14 @@ static void nbd_teardown_connection(BlockDriverState *bs)
 
 static bool nbd_client_connecting(BDRVNBDState *s)
 {
-    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
-        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
+    NBDClientState state = qatomic_load_acquire(&s->state);
+    return state == NBD_CLIENT_CONNECTING_WAIT ||
+        state == NBD_CLIENT_CONNECTING_NOWAIT;
 }
 
 static bool nbd_client_connecting_wait(BDRVNBDState *s)
 {
-    return s->state == NBD_CLIENT_CONNECTING_WAIT;
+    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
 static void connect_bh(void *opaque)
@@ -423,12 +426,12 @@ static void *connect_thread_func(void *opaque)
     return NULL;
 }
 
-static QIOChannelSocket *coroutine_fn
+static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 {
+    int ret;
     QemuThread thread;
     BDRVNBDState *s = bs->opaque;
-    QIOChannelSocket *res;
     NBDConnectThread *thr = s->connect_thread;
 
     qemu_mutex_lock(&thr->mutex);
@@ -445,10 +448,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     case CONNECT_THREAD_SUCCESS:
         /* Previous attempt finally succeeded in background */
         thr->state = CONNECT_THREAD_NONE;
-        res = thr->sioc;
+        s->sioc = thr->sioc;
         thr->sioc = NULL;
+        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                               nbd_yank, bs);
         qemu_mutex_unlock(&thr->mutex);
-        return res;
+        return 0;
     case CONNECT_THREAD_RUNNING:
         /* Already running, will wait */
         break;
@@ -480,8 +485,13 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
         thr->state = CONNECT_THREAD_NONE;
         error_propagate(errp, thr->err);
         thr->err = NULL;
-        res = thr->sioc;
+        s->sioc = thr->sioc;
         thr->sioc = NULL;
+        if (s->sioc) {
+            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                   nbd_yank, bs);
+        }
+        ret = (s->sioc ? 0 : -1);
         break;
     case CONNECT_THREAD_RUNNING:
     case CONNECT_THREAD_RUNNING_DETACHED:
@@ -490,7 +500,7 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
          * failed. Still connect thread is executing in background, and its
          * result may be used for next connection attempt.
          */
-        res = NULL;
+        ret = -1;
         error_setg(errp, "Connection attempt cancelled by other operation");
         break;
 
@@ -507,7 +517,7 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
     qemu_mutex_unlock(&thr->mutex);
 
-    return res;
+    return ret;
 }
 
 /*
@@ -560,7 +570,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     Error *local_err = NULL;
-    QIOChannelSocket *sioc;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -593,21 +602,22 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     /* Finalize previous connection if any */
     if (s->ioc) {
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc = NULL;
     }
 
-    sioc = nbd_co_establish_connection(s->bs, &local_err);
-    if (!sioc) {
+    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
     bdrv_dec_in_flight(s->bs);
 
-    ret = nbd_client_handshake(s->bs, sioc, &local_err);
+    ret = nbd_client_handshake(s->bs, &local_err);
 
     if (s->drained) {
         s->wait_drained_end = true;
@@ -639,7 +649,7 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
     uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
     uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
 
-    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
                                    s->reconnect_delay * NANOSECONDS_PER_SECOND);
     }
@@ -682,7 +692,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
     int ret = 0;
     Error *local_err = NULL;
 
-    while (s->state != NBD_CLIENT_QUIT) {
+    while (qatomic_load_acquire(&s->state) != NBD_CLIENT_QUIT) {
         /*
          * The NBD client can only really be considered idle when it has
          * yielded from qio_channel_readv_all_eof(), waiting for data. This is
@@ -697,7 +707,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
             nbd_co_reconnect_loop(s);
         }
 
-        if (s->state != NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
             continue;
         }
 
@@ -752,6 +762,8 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
     s->connection_co = NULL;
     if (s->ioc) {
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
         object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
         object_unref(OBJECT(s->ioc));
@@ -776,7 +788,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }
 
-    if (s->state != NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
         rc = -EIO;
         goto err;
     }
@@ -803,7 +815,8 @@ static int nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (rc >= 0 && s->state == NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED &&
+            rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -1128,7 +1141,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
     s->requests[i].receiving = false;
-    if (s->state != NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -1287,7 +1300,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err = NULL;
-    if (s->state != NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
         error_setg(&local_err, "Connection closed");
         nbd_iter_channel_error(iter, -EIO, &local_err);
         goto break_loop;
@@ -1312,7 +1325,8 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }
 
     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) || s->state != NBD_CLIENT_CONNECTED) {
+    if (nbd_reply_is_simple(reply) ||
+        qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
         goto break_loop;
     }
 
@@ -1744,6 +1758,15 @@ static int nbd_client_reopen_prepare(BDRVReopenState *state,
     return 0;
 }
 
+static void nbd_yank(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
+    qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
+
 static void nbd_client_close(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
@@ -1756,52 +1779,53 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }
 
-static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
-                                                  Error **errp)
+static int nbd_establish_connection(BlockDriverState *bs,
+                                    SocketAddress *saddr,
+                                    Error **errp)
 {
     ERRP_GUARD();
-    QIOChannelSocket *sioc;
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    sioc = qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
+    s->sioc = qio_channel_socket_new();
+    qio_channel_set_name(QIO_CHANNEL(s->sioc), "nbd-client");
 
-    qio_channel_socket_connect_sync(sioc, saddr, errp);
+    qio_channel_socket_connect_sync(s->sioc, saddr, errp);
     if (*errp) {
-        object_unref(OBJECT(sioc));
-        return NULL;
+        object_unref(OBJECT(s->sioc));
+        s->sioc = NULL;
+        return -1;
     }
 
-    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank, bs);
+    qio_channel_set_delay(QIO_CHANNEL(s->sioc), false);
 
-    return sioc;
+    return 0;
 }
 
-/* nbd_client_handshake takes ownership on sioc. On failure it is unref'ed. */
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
-                                Error **errp)
+/* nbd_client_handshake takes ownership on s->sioc. On failure it's unref'ed. */
+static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     AioContext *aio_context = bdrv_get_aio_context(bs);
     int ret;
 
     trace_nbd_client_handshake(s->export);
-
-    s->sioc = sioc;
-
-    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);
+    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);
 
     s->info.request_sizes = true;
     s->info.structured_reply = true;
     s->info.base_allocation = true;
     s->info.x_dirty_bitmap = g_strdup(s->x_dirty_bitmap);
     s->info.name = g_strdup(s->export ?: "");
-    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), s->tlscreds,
+    ret = nbd_receive_negotiate(aio_context, QIO_CHANNEL(s->sioc), s->tlscreds,
                                 s->hostname, &s->ioc, &s->info, errp);
     g_free(s->info.x_dirty_bitmap);
     g_free(s->info.name);
     if (ret < 0) {
-        object_unref(OBJECT(sioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                 nbd_yank, bs);
+        object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
         return ret;
     }
@@ -1834,7 +1858,7 @@ static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
     }
 
     if (!s->ioc) {
-        s->ioc = QIO_CHANNEL(sioc);
+        s->ioc = QIO_CHANNEL(s->sioc);
         object_ref(OBJECT(s->ioc));
     }
 
@@ -1850,9 +1874,11 @@ static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *sioc,
     {
         NBDRequest request = { .type = NBD_CMD_DISC };
 
-        nbd_send_request(s->ioc ?: QIO_CHANNEL(sioc), &request);
+        nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
 
-        object_unref(OBJECT(sioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                 nbd_yank, bs);
+        object_unref(OBJECT(s->sioc));
         s->sioc = NULL;
 
         return ret;
@@ -2244,7 +2270,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 {
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    QIOChannelSocket *sioc;
 
     ret = nbd_process_options(bs, options, errp);
     if (ret < 0) {
@@ -2255,17 +2280,22 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     qemu_co_mutex_init(&s->send_mutex);
     qemu_co_queue_init(&s->free_sema);
 
+    if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
+        return -EEXIST;
+    }
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
-    sioc = nbd_establish_connection(s->saddr, errp);
-    if (!sioc) {
+    if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
+        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
         return -ECONNREFUSED;
     }
 
-    ret = nbd_client_handshake(bs, sioc, errp);
+    ret = nbd_client_handshake(bs, errp);
     if (ret < 0) {
+        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
         nbd_clear_bdrvstate(s);
         return ret;
     }
@@ -2325,6 +2355,7 @@ static void nbd_close(BlockDriverState *bs)
     BDRVNBDState *s = bs->opaque;
 
     nbd_client_close(bs);
+    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
     nbd_clear_bdrvstate(s);
 }
 
-- 
2.26.2


