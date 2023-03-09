Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565966B233D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:41:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEcy-00044w-KQ; Thu, 09 Mar 2023 06:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcw-00044I-EL
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcr-0005HL-WE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678362001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh27hEro4wp6FiqdAusgjALeXt3VYLUJKKq28EP241U=;
 b=SmHLbQRoKweIgBAlXP1h+UtNqJCDZImvS0hgigXhOqnOIAN7R4+qE10/QfuPwmw2VCRjOb
 K96rbAUW7bszKqF3tlZxcKGWAwe0eZLkyiEaIa/SRUrnQwXR5Tl/vUtDeltPMmXDtDAemj
 3b5RGYG+1nw6uWkyjiOnhI+x6vGBOMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-xBKdJgrrOjWJ1bCcQI0zZg-1; Thu, 09 Mar 2023 06:39:57 -0500
X-MC-Unique: xBKdJgrrOjWJ1bCcQI0zZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F97F185A78B;
 Thu,  9 Mar 2023 11:39:57 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21CED4010E7B;
 Thu,  9 Mar 2023 11:39:56 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH nbd 2/4] nbd: Split out block device state from underlying NBD
 connections
Date: Thu,  9 Mar 2023 11:39:44 +0000
Message-Id: <20230309113946.1528247-3-rjones@redhat.com>
In-Reply-To: <20230309113946.1528247-1-rjones@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To implement multi-conn, we will put multiple underlying NBD
connections (ie. NBDClientConnection) inside the NBD block device
handle (BDRVNBDState).  This requires first breaking the one-to-one
relationship between NBDClientConnection and BDRVNBDState.

To do this a new structure (NBDConnState) is implemented.
NBDConnState takes all the per-connection state out of the block
driver struct.  BDRVNBDState now contains a conns[] array of pointers
to NBDConnState, one for each underlying multi-conn connection.

After this change there is still a one-to-one relationship because we
only ever use the zeroth slot in the conns[] array.  Thus this does
not implement multi-conn yet.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/coroutines.h |   5 +-
 block/nbd.c        | 674 ++++++++++++++++++++++++---------------------
 2 files changed, 358 insertions(+), 321 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index dd9f3d449b..14b01d8591 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -62,7 +62,7 @@ int coroutine_fn GRAPH_RDLOCK
 bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 
 int coroutine_fn
-nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
+nbd_co_do_establish_connection(BlockDriverState *bs, void *cs, bool blocking,
                                Error **errp);
 
 
@@ -86,6 +86,7 @@ bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState **file,
                                int *depth);
 int co_wrapper_mixed
-nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
+nbd_do_establish_connection(BlockDriverState *bs, void *cs, bool blocking,
+                            Error **errp);
 
 #endif /* BLOCK_COROUTINES_H */
diff --git a/block/nbd.c b/block/nbd.c
index 5ffae0b798..84e8a1add0 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -51,8 +51,8 @@
 #define MAX_NBD_REQUESTS    16
 #define MAX_MULTI_CONN      16
 
-#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs))
-#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs))
+#define HANDLE_TO_INDEX(cs, handle) ((handle) ^ (uint64_t)(intptr_t)(cs))
+#define INDEX_TO_HANDLE(cs, index)  ((index)  ^ (uint64_t)(intptr_t)(cs))
 
 typedef struct {
     Coroutine *coroutine;
@@ -67,7 +67,10 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef struct BDRVNBDState {
+/* A single client connection. */
+typedef struct NBDConnState {
+    struct BDRVNBDState *s; /* Points to enclosing BDRVNBDState */
+
     QIOChannel *ioc; /* The current I/O channel */
     NBDExportInfo info;
 
@@ -94,7 +97,12 @@ typedef struct BDRVNBDState {
 
     QEMUTimer *open_timer;
 
-    BlockDriverState *bs;
+    NBDClientConnection *conn;
+} NBDConnState;
+
+typedef struct BDRVNBDState {
+    /* The underlying NBD connections */
+    NBDConnState *conns[MAX_MULTI_CONN];
 
     /* Connection parameters */
     uint32_t reconnect_delay;
@@ -108,7 +116,7 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;
 
-    NBDClientConnection *conn;
+    BlockDriverState *bs;
 } BDRVNBDState;
 
 static void nbd_yank(void *opaque);
@@ -117,14 +125,16 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    nbd_client_connection_release(s->conn);
-    s->conn = NULL;
+    nbd_client_connection_release(s->conns[0]->conn);
+    s->conns[0]->conn = NULL;
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
     /* Must not leave timers behind that would access freed data */
-    assert(!s->reconnect_delay_timer);
-    assert(!s->open_timer);
+    assert(!s->conns[0]->reconnect_delay_timer);
+    assert(!s->conns[0]->open_timer);
+
+    g_free(s->conns[0]);
 
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
@@ -151,139 +161,143 @@ static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
     return false;
 }
 
-static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s)
+static void coroutine_fn nbd_recv_coroutines_wake(NBDConnState *cs)
 {
     int i;
 
-    QEMU_LOCK_GUARD(&s->receive_mutex);
+    QEMU_LOCK_GUARD(&cs->receive_mutex);
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        if (nbd_recv_coroutine_wake_one(&s->requests[i])) {
+        if (nbd_recv_coroutine_wake_one(&cs->requests[i])) {
             return;
         }
     }
 }
 
 /* Called with s->requests_lock held.  */
-static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
+static void coroutine_fn nbd_channel_error_locked(NBDConnState *cs, int ret)
 {
-    if (s->state == NBD_CLIENT_CONNECTED) {
-        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    if (cs->state == NBD_CLIENT_CONNECTED) {
+        qio_channel_shutdown(cs->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
     }
 
     if (ret == -EIO) {
-        if (s->state == NBD_CLIENT_CONNECTED) {
-            s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
-                                            NBD_CLIENT_CONNECTING_NOWAIT;
+        if (cs->state == NBD_CLIENT_CONNECTED) {
+            cs->state = cs->s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
+                                                 NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        s->state = NBD_CLIENT_QUIT;
+        cs->state = NBD_CLIENT_QUIT;
     }
 }
 
-static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
+static void coroutine_fn nbd_channel_error(NBDConnState *cs, int ret)
 {
-    QEMU_LOCK_GUARD(&s->requests_lock);
-    nbd_channel_error_locked(s, ret);
+    QEMU_LOCK_GUARD(&cs->requests_lock);
+    nbd_channel_error_locked(cs, ret);
 }
 
-static void reconnect_delay_timer_del(BDRVNBDState *s)
+static void reconnect_delay_timer_del(NBDConnState *cs)
 {
-    if (s->reconnect_delay_timer) {
-        timer_free(s->reconnect_delay_timer);
-        s->reconnect_delay_timer = NULL;
+    if (cs->reconnect_delay_timer) {
+        timer_free(cs->reconnect_delay_timer);
+        cs->reconnect_delay_timer = NULL;
     }
 }
 
 static void reconnect_delay_timer_cb(void *opaque)
 {
-    BDRVNBDState *s = opaque;
+    NBDConnState *cs = opaque;
 
-    reconnect_delay_timer_del(s);
-    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
-        if (s->state != NBD_CLIENT_CONNECTING_WAIT) {
+    reconnect_delay_timer_del(cs);
+    WITH_QEMU_LOCK_GUARD(&cs->requests_lock) {
+        if (cs->state != NBD_CLIENT_CONNECTING_WAIT) {
             return;
         }
-        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        cs->state = NBD_CLIENT_CONNECTING_NOWAIT;
     }
-    nbd_co_establish_connection_cancel(s->conn);
+    nbd_co_establish_connection_cancel(cs->conn);
 }
 
-static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
+static void reconnect_delay_timer_init(NBDConnState *cs,
+                                       uint64_t expire_time_ns)
 {
-    assert(!s->reconnect_delay_timer);
-    s->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
-                                             QEMU_CLOCK_REALTIME,
-                                             SCALE_NS,
-                                             reconnect_delay_timer_cb, s);
-    timer_mod(s->reconnect_delay_timer, expire_time_ns);
+    assert(!cs->reconnect_delay_timer);
+    cs->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(cs->s->bs),
+                                              QEMU_CLOCK_REALTIME,
+                                              SCALE_NS,
+                                              reconnect_delay_timer_cb, cs);
+    timer_mod(cs->reconnect_delay_timer, expire_time_ns);
 }
 
-static void nbd_teardown_connection(BlockDriverState *bs)
+static void nbd_teardown_connection(NBDConnState *cs)
 {
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    assert(!cs->in_flight);
 
-    assert(!s->in_flight);
-
-    if (s->ioc) {
-        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, s->bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
+    if (cs->ioc) {
+        qio_channel_shutdown(cs->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(cs->s->bs->node_name),
+                                 nbd_yank, cs);
+        object_unref(OBJECT(cs->ioc));
+        cs->ioc = NULL;
     }
 
-    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
-        s->state = NBD_CLIENT_QUIT;
+    WITH_QEMU_LOCK_GUARD(&cs->requests_lock) {
+        cs->state = NBD_CLIENT_QUIT;
     }
 }
 
-static void open_timer_del(BDRVNBDState *s)
+static void open_timer_del(NBDConnState *cs)
 {
-    if (s->open_timer) {
-        timer_free(s->open_timer);
-        s->open_timer = NULL;
+    if (cs->open_timer) {
+        timer_free(cs->open_timer);
+        cs->open_timer = NULL;
     }
 }
 
 static void open_timer_cb(void *opaque)
 {
-    BDRVNBDState *s = opaque;
+    NBDConnState *cs = opaque;
 
-    nbd_co_establish_connection_cancel(s->conn);
-    open_timer_del(s);
+    nbd_co_establish_connection_cancel(cs->conn);
+    open_timer_del(cs);
 }
 
-static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
+static void open_timer_init(NBDConnState *cs, uint64_t expire_time_ns)
 {
-    assert(!s->open_timer);
-    s->open_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
-                                  QEMU_CLOCK_REALTIME,
-                                  SCALE_NS,
-                                  open_timer_cb, s);
-    timer_mod(s->open_timer, expire_time_ns);
+    assert(!cs->open_timer);
+    cs->open_timer = aio_timer_new(bdrv_get_aio_context(cs->s->bs),
+                                   QEMU_CLOCK_REALTIME,
+                                   SCALE_NS,
+                                   open_timer_cb, cs);
+    timer_mod(cs->open_timer, expire_time_ns);
 }
 
-static bool nbd_client_will_reconnect(BDRVNBDState *s)
+static bool nbd_client_will_reconnect(NBDConnState *cs)
 {
     /*
      * Called only after a socket error, so this is not performance sensitive.
      */
-    QEMU_LOCK_GUARD(&s->requests_lock);
-    return s->state == NBD_CLIENT_CONNECTING_WAIT;
+    QEMU_LOCK_GUARD(&cs->requests_lock);
+    return cs->state == NBD_CLIENT_CONNECTING_WAIT;
 }
 
 /*
  * Update @bs with information learned during a completed negotiation process.
  * Return failure if the server's advertised options are incompatible with the
  * client's needs.
+ *
+ * Note that we are only called for the first connection (s->conns[0])
+ * because multi-conn assumes that all other connections are alike.
+ * We don't check that assumption but probably should (XXX).
  */
-static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
+static int nbd_handle_updated_info(BlockDriverState *bs,
+                                   NBDConnState *cs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
 
     if (s->x_dirty_bitmap) {
-        if (!s->info.base_allocation) {
+        if (!cs->info.base_allocation) {
             error_setg(errp, "requested x-dirty-bitmap %s not found",
                        s->x_dirty_bitmap);
             return -EINVAL;
@@ -293,21 +307,21 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
         }
     }
 
-    if (s->info.flags & NBD_FLAG_READ_ONLY) {
+    if (cs->info.flags & NBD_FLAG_READ_ONLY) {
         ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
         if (ret < 0) {
             return ret;
         }
     }
 
-    if (s->info.flags & NBD_FLAG_SEND_FUA) {
+    if (cs->info.flags & NBD_FLAG_SEND_FUA) {
         bs->supported_write_flags = BDRV_REQ_FUA;
         bs->supported_zero_flags |= BDRV_REQ_FUA;
     }
 
-    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
+    if (cs->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
         bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
-        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
+        if (cs->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
             bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
         }
     }
@@ -318,129 +332,132 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
 }
 
 int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
+                                                void *csvp,
                                                 bool blocking, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnState *cs = csvp;
     int ret;
     IO_CODE();
 
-    assert(!s->ioc);
+    assert(!cs->ioc);
 
-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, blocking, errp);
-    if (!s->ioc) {
+    cs->ioc = nbd_co_establish_connection(cs->conn, &cs->info, blocking, errp);
+    if (!cs->ioc) {
         return -ECONNREFUSED;
     }
 
-    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
-                           bs);
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank, cs);
 
-    ret = nbd_handle_updated_info(s->bs, NULL);
-    if (ret < 0) {
-        /*
-         * We have connected, but must fail for other reasons.
-         * Send NBD_CMD_DISC as a courtesy to the server.
-         */
-        NBDRequest request = { .type = NBD_CMD_DISC };
+    if (cs == s->conns[0]) {
+        ret = nbd_handle_updated_info(s->bs, cs, NULL);
+        if (ret < 0) {
+            /*
+             * We have connected, but must fail for other reasons.
+             * Send NBD_CMD_DISC as a courtesy to the server.
+             */
+            NBDRequest request = { .type = NBD_CMD_DISC };
 
-        nbd_send_request(s->ioc, &request);
+            nbd_send_request(cs->ioc, &request);
 
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
+            yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                     nbd_yank, cs);
+            object_unref(OBJECT(cs->ioc));
+            cs->ioc = NULL;
 
-        return ret;
+            return ret;
+        }
     }
 
-    qio_channel_set_blocking(s->ioc, false, NULL);
-    qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
+    qio_channel_set_blocking(cs->ioc, false, NULL);
+    qio_channel_attach_aio_context(cs->ioc, bdrv_get_aio_context(bs));
 
     /* successfully connected */
-    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
-        s->state = NBD_CLIENT_CONNECTED;
+    WITH_QEMU_LOCK_GUARD(&cs->requests_lock) {
+        cs->state = NBD_CLIENT_CONNECTED;
     }
 
     return 0;
 }
 
 /* Called with s->requests_lock held.  */
-static bool nbd_client_connecting(BDRVNBDState *s)
+static bool nbd_client_connecting(NBDConnState *cs)
 {
-    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
-        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
+    return cs->state == NBD_CLIENT_CONNECTING_WAIT ||
+        cs->state == NBD_CLIENT_CONNECTING_NOWAIT;
 }
 
 /* Called with s->requests_lock taken.  */
-static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
+static coroutine_fn void nbd_reconnect_attempt(NBDConnState *cs)
 {
     int ret;
-    bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
+    bool blocking = cs->state == NBD_CLIENT_CONNECTING_WAIT;
 
     /*
      * Now we are sure that nobody is accessing the channel, and no one will
      * try until we set the state to CONNECTED.
      */
-    assert(nbd_client_connecting(s));
-    assert(s->in_flight == 1);
+    assert(nbd_client_connecting(cs));
+    assert(cs->in_flight == 1);
 
-    trace_nbd_reconnect_attempt(s->bs->in_flight);
+    trace_nbd_reconnect_attempt(cs->s->bs->in_flight);
 
-    if (blocking && !s->reconnect_delay_timer) {
+    if (blocking && !cs->reconnect_delay_timer) {
         /*
          * It's the first reconnect attempt after switching to
          * NBD_CLIENT_CONNECTING_WAIT
          */
-        g_assert(s->reconnect_delay);
-        reconnect_delay_timer_init(s,
+        g_assert(cs->s->reconnect_delay);
+        reconnect_delay_timer_init(cs,
             qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
-            s->reconnect_delay * NANOSECONDS_PER_SECOND);
+            cs->s->reconnect_delay * NANOSECONDS_PER_SECOND);
     }
 
     /* Finalize previous connection if any */
-    if (s->ioc) {
-        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, s->bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
+    if (cs->ioc) {
+        qio_channel_detach_aio_context(QIO_CHANNEL(cs->ioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(cs->s->bs->node_name),
+                                 nbd_yank, cs);
+        object_unref(OBJECT(cs->ioc));
+        cs->ioc = NULL;
     }
 
-    qemu_mutex_unlock(&s->requests_lock);
-    ret = nbd_co_do_establish_connection(s->bs, blocking, NULL);
-    trace_nbd_reconnect_attempt_result(ret, s->bs->in_flight);
-    qemu_mutex_lock(&s->requests_lock);
+    qemu_mutex_unlock(&cs->requests_lock);
+    ret = nbd_co_do_establish_connection(cs->s->bs, cs, blocking, NULL);
+    trace_nbd_reconnect_attempt_result(ret, cs->s->bs->in_flight);
+    qemu_mutex_lock(&cs->requests_lock);
 
     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
      * we no longer need this timer.  Delete it so it will not outlive
      * this I/O request (so draining removes all timers).
      */
-    reconnect_delay_timer_del(s);
+    reconnect_delay_timer_del(cs);
 }
 
-static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
+static coroutine_fn int nbd_receive_replies(NBDConnState *cs, uint64_t handle)
 {
     int ret;
-    uint64_t ind = HANDLE_TO_INDEX(s, handle), ind2;
-    QEMU_LOCK_GUARD(&s->receive_mutex);
+    uint64_t ind = HANDLE_TO_INDEX(cs, handle), ind2;
+    QEMU_LOCK_GUARD(&cs->receive_mutex);
 
     while (true) {
-        if (s->reply.handle == handle) {
+        if (cs->reply.handle == handle) {
             /* We are done */
             return 0;
         }
 
-        if (s->reply.handle != 0) {
+        if (cs->reply.handle != 0) {
             /*
              * Some other request is being handled now. It should already be
-             * woken by whoever set s->reply.handle (or never wait in this
+             * woken by whoever set cs->reply.handle (or never wait in this
              * yield). So, we should not wake it here.
              */
-            ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-            assert(!s->requests[ind2].receiving);
+            ind2 = HANDLE_TO_INDEX(cs, cs->reply.handle);
+            assert(!cs->requests[ind2].receiving);
 
-            s->requests[ind].receiving = true;
-            qemu_co_mutex_unlock(&s->receive_mutex);
+            cs->requests[ind].receiving = true;
+            qemu_co_mutex_unlock(&cs->receive_mutex);
 
             qemu_coroutine_yield();
             /*
@@ -448,105 +465,105 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
              * 1. From this function, executing in parallel coroutine, when our
              *    handle is received.
              * 2. From nbd_co_receive_one_chunk(), when previous request is
-             *    finished and s->reply.handle set to 0.
+             *    finished and cs->reply.handle set to 0.
              * Anyway, it's OK to lock the mutex and go to the next iteration.
              */
 
-            qemu_co_mutex_lock(&s->receive_mutex);
-            assert(!s->requests[ind].receiving);
+            qemu_co_mutex_lock(&cs->receive_mutex);
+            assert(!cs->requests[ind].receiving);
             continue;
         }
 
         /* We are under mutex and handle is 0. We have to do the dirty work. */
-        assert(s->reply.handle == 0);
-        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, NULL);
+        assert(cs->reply.handle == 0);
+        ret = nbd_receive_reply(cs->s->bs, cs->ioc, &cs->reply, NULL);
         if (ret <= 0) {
             ret = ret ? ret : -EIO;
-            nbd_channel_error(s, ret);
+            nbd_channel_error(cs, ret);
             return ret;
         }
-        if (nbd_reply_is_structured(&s->reply) && !s->info.structured_reply) {
-            nbd_channel_error(s, -EINVAL);
+        if (nbd_reply_is_structured(&cs->reply) &&
+            !cs->info.structured_reply) {
+            nbd_channel_error(cs, -EINVAL);
             return -EINVAL;
         }
-        ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
-            nbd_channel_error(s, -EINVAL);
+        ind2 = HANDLE_TO_INDEX(cs, cs->reply.handle);
+        if (ind2 >= MAX_NBD_REQUESTS || !cs->requests[ind2].coroutine) {
+            nbd_channel_error(cs, -EINVAL);
             return -EINVAL;
         }
-        if (s->reply.handle == handle) {
+        if (cs->reply.handle == handle) {
             /* We are done */
             return 0;
         }
-        nbd_recv_coroutine_wake_one(&s->requests[ind2]);
+        nbd_recv_coroutine_wake_one(&cs->requests[ind2]);
     }
 }
 
-static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
+static int coroutine_fn nbd_co_send_request(NBDConnState *cs,
                                             NBDRequest *request,
                                             QEMUIOVector *qiov)
 {
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int rc, i = -1;
 
-    qemu_mutex_lock(&s->requests_lock);
-    while (s->in_flight == MAX_NBD_REQUESTS ||
-           (s->state != NBD_CLIENT_CONNECTED && s->in_flight > 0)) {
-        qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
+    qemu_mutex_lock(&cs->requests_lock);
+    while (cs->in_flight == MAX_NBD_REQUESTS ||
+           (cs->state != NBD_CLIENT_CONNECTED && cs->in_flight > 0)) {
+        qemu_co_queue_wait(&cs->free_sema, &cs->requests_lock);
     }
 
-    s->in_flight++;
-    if (s->state != NBD_CLIENT_CONNECTED) {
-        if (nbd_client_connecting(s)) {
-            nbd_reconnect_attempt(s);
-            qemu_co_queue_restart_all(&s->free_sema);
+    cs->in_flight++;
+    if (cs->state != NBD_CLIENT_CONNECTED) {
+        if (nbd_client_connecting(cs)) {
+            nbd_reconnect_attempt(cs);
+            qemu_co_queue_restart_all(&cs->free_sema);
         }
-        if (s->state != NBD_CLIENT_CONNECTED) {
+        if (cs->state != NBD_CLIENT_CONNECTED) {
             rc = -EIO;
             goto err;
         }
     }
 
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        if (s->requests[i].coroutine == NULL) {
+        if (cs->requests[i].coroutine == NULL) {
             break;
         }
     }
 
     assert(i < MAX_NBD_REQUESTS);
-    s->requests[i].coroutine = qemu_coroutine_self();
-    s->requests[i].offset = request->from;
-    s->requests[i].receiving = false;
-    qemu_mutex_unlock(&s->requests_lock);
+    cs->requests[i].coroutine = qemu_coroutine_self();
+    cs->requests[i].offset = request->from;
+    cs->requests[i].receiving = false;
+    qemu_mutex_unlock(&cs->requests_lock);
 
-    qemu_co_mutex_lock(&s->send_mutex);
-    request->handle = INDEX_TO_HANDLE(s, i);
+    qemu_co_mutex_lock(&cs->send_mutex);
+    request->handle = INDEX_TO_HANDLE(cs, i);
 
-    assert(s->ioc);
+    assert(cs->ioc);
 
     if (qiov) {
-        qio_channel_set_cork(s->ioc, true);
-        rc = nbd_send_request(s->ioc, request);
-        if (rc >= 0 && qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
+        qio_channel_set_cork(cs->ioc, true);
+        rc = nbd_send_request(cs->ioc, request);
+        if (rc >= 0 && qio_channel_writev_all(cs->ioc, qiov->iov, qiov->niov,
                                               NULL) < 0) {
             rc = -EIO;
         }
-        qio_channel_set_cork(s->ioc, false);
+        qio_channel_set_cork(cs->ioc, false);
     } else {
-        rc = nbd_send_request(s->ioc, request);
+        rc = nbd_send_request(cs->ioc, request);
     }
-    qemu_co_mutex_unlock(&s->send_mutex);
+    qemu_co_mutex_unlock(&cs->send_mutex);
 
     if (rc < 0) {
-        qemu_mutex_lock(&s->requests_lock);
+        qemu_mutex_lock(&cs->requests_lock);
 err:
-        nbd_channel_error_locked(s, rc);
+        nbd_channel_error_locked(cs, rc);
         if (i != -1) {
-            s->requests[i].coroutine = NULL;
+            cs->requests[i].coroutine = NULL;
         }
-        s->in_flight--;
-        qemu_co_queue_next(&s->free_sema);
-        qemu_mutex_unlock(&s->requests_lock);
+        cs->in_flight--;
+        qemu_co_queue_next(&cs->free_sema);
+        qemu_mutex_unlock(&cs->requests_lock);
     }
     return rc;
 }
@@ -569,7 +586,7 @@ static inline uint64_t payload_advance64(uint8_t **payload)
     return ldq_be_p(*payload - 8);
 }
 
-static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
+static int nbd_parse_offset_hole_payload(NBDConnState *cs,
                                          NBDStructuredReplyChunk *chunk,
                                          uint8_t *payload, uint64_t orig_offset,
                                          QEMUIOVector *qiov, Error **errp)
@@ -592,8 +609,8 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
                          " region");
         return -EINVAL;
     }
-    if (s->info.min_block &&
-        !QEMU_IS_ALIGNED(hole_size, s->info.min_block)) {
+    if (cs->info.min_block &&
+        !QEMU_IS_ALIGNED(hole_size, cs->info.min_block)) {
         trace_nbd_structured_read_compliance("hole");
     }
 
@@ -607,7 +624,7 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
  * Based on our request, we expect only one extent in reply, for the
  * base:allocation context.
  */
-static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
+static int nbd_parse_blockstatus_payload(NBDConnState *cs,
                                          NBDStructuredReplyChunk *chunk,
                                          uint8_t *payload, uint64_t orig_length,
                                          NBDExtent *extent, Error **errp)
@@ -622,11 +639,11 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
     }
 
     context_id = payload_advance32(&payload);
-    if (s->info.context_id != context_id) {
+    if (cs->info.context_id != context_id) {
         error_setg(errp, "Protocol error: unexpected context id %d for "
                          "NBD_REPLY_TYPE_BLOCK_STATUS, when negotiated context "
                          "id is %d", context_id,
-                         s->info.context_id);
+                         cs->info.context_id);
         return -EINVAL;
     }
 
@@ -651,14 +668,14 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
      * up to the full block and change the status to fully-allocated
      * (always a safe status, even if it loses information).
      */
-    if (s->info.min_block && !QEMU_IS_ALIGNED(extent->length,
-                                                   s->info.min_block)) {
+    if (cs->info.min_block &&
+        !QEMU_IS_ALIGNED(extent->length, cs->info.min_block)) {
         trace_nbd_parse_blockstatus_compliance("extent length is unaligned");
-        if (extent->length > s->info.min_block) {
+        if (extent->length > cs->info.min_block) {
             extent->length = QEMU_ALIGN_DOWN(extent->length,
-                                             s->info.min_block);
+                                             cs->info.min_block);
         } else {
-            extent->length = s->info.min_block;
+            extent->length = cs->info.min_block;
             extent->flags = 0;
         }
     }
@@ -685,7 +702,7 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
      * since nbd_client_co_block_status is only expecting the low two
      * bits to be set.
      */
-    if (s->alloc_depth && extent->flags > 2) {
+    if (cs->s->alloc_depth && extent->flags > 2) {
         extent->flags = 2;
     }
 
@@ -735,16 +752,16 @@ static int nbd_parse_error_payload(NBDStructuredReplyChunk *chunk,
 }
 
 static int coroutine_fn
-nbd_co_receive_offset_data_payload(BDRVNBDState *s, uint64_t orig_offset,
+nbd_co_receive_offset_data_payload(NBDConnState *cs, uint64_t orig_offset,
                                    QEMUIOVector *qiov, Error **errp)
 {
     QEMUIOVector sub_qiov;
     uint64_t offset;
     size_t data_size;
     int ret;
-    NBDStructuredReplyChunk *chunk = &s->reply.structured;
+    NBDStructuredReplyChunk *chunk = &cs->reply.structured;
 
-    assert(nbd_reply_is_structured(&s->reply));
+    assert(nbd_reply_is_structured(&cs->reply));
 
     /* The NBD spec requires at least one byte of payload */
     if (chunk->length <= sizeof(offset)) {
@@ -753,7 +770,7 @@ nbd_co_receive_offset_data_payload(BDRVNBDState *s, uint64_t orig_offset,
         return -EINVAL;
     }
 
-    if (nbd_read64(s->ioc, &offset, "OFFSET_DATA offset", errp) < 0) {
+    if (nbd_read64(cs->ioc, &offset, "OFFSET_DATA offset", errp) < 0) {
         return -EIO;
     }
 
@@ -765,13 +782,14 @@ nbd_co_receive_offset_data_payload(BDRVNBDState *s, uint64_t orig_offset,
                          " region");
         return -EINVAL;
     }
-    if (s->info.min_block && !QEMU_IS_ALIGNED(data_size, s->info.min_block)) {
+    if (cs->info.min_block &&
+        !QEMU_IS_ALIGNED(data_size, cs->info.min_block)) {
         trace_nbd_structured_read_compliance("data");
     }
 
     qemu_iovec_init(&sub_qiov, qiov->niov);
     qemu_iovec_concat(&sub_qiov, qiov, offset - orig_offset, data_size);
-    ret = qio_channel_readv_all(s->ioc, sub_qiov.iov, sub_qiov.niov, errp);
+    ret = qio_channel_readv_all(cs->ioc, sub_qiov.iov, sub_qiov.niov, errp);
     qemu_iovec_destroy(&sub_qiov);
 
     return ret < 0 ? -EIO : 0;
@@ -779,14 +797,14 @@ nbd_co_receive_offset_data_payload(BDRVNBDState *s, uint64_t orig_offset,
 
 #define NBD_MAX_MALLOC_PAYLOAD 1000
 static coroutine_fn int nbd_co_receive_structured_payload(
-        BDRVNBDState *s, void **payload, Error **errp)
+        NBDConnState *cs, void **payload, Error **errp)
 {
     int ret;
     uint32_t len;
 
-    assert(nbd_reply_is_structured(&s->reply));
+    assert(nbd_reply_is_structured(&cs->reply));
 
-    len = s->reply.structured.length;
+    len = cs->reply.structured.length;
 
     if (len == 0) {
         return 0;
@@ -803,7 +821,7 @@ static coroutine_fn int nbd_co_receive_structured_payload(
     }
 
     *payload = g_new(char, len);
-    ret = nbd_read(s->ioc, *payload, len, "structured payload", errp);
+    ret = nbd_read(cs->ioc, *payload, len, "structured payload", errp);
     if (ret < 0) {
         g_free(*payload);
         *payload = NULL;
@@ -829,11 +847,11 @@ static coroutine_fn int nbd_co_receive_structured_payload(
  * corresponding to the server's error reply), and errp is unchanged.
  */
 static coroutine_fn int nbd_co_do_receive_one_chunk(
-        BDRVNBDState *s, uint64_t handle, bool only_structured,
+        NBDConnState *cs, uint64_t handle, bool only_structured,
         int *request_ret, QEMUIOVector *qiov, void **payload, Error **errp)
 {
     int ret;
-    int i = HANDLE_TO_INDEX(s, handle);
+    int i = HANDLE_TO_INDEX(cs, handle);
     void *local_payload = NULL;
     NBDStructuredReplyChunk *chunk;
 
@@ -842,34 +860,34 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     }
     *request_ret = 0;
 
-    ret = nbd_receive_replies(s, handle);
+    ret = nbd_receive_replies(cs, handle);
     if (ret < 0) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
-    assert(s->ioc);
+    assert(cs->ioc);
 
-    assert(s->reply.handle == handle);
+    assert(cs->reply.handle == handle);
 
-    if (nbd_reply_is_simple(&s->reply)) {
+    if (nbd_reply_is_simple(&cs->reply)) {
         if (only_structured) {
             error_setg(errp, "Protocol error: simple reply when structured "
                              "reply chunk was expected");
             return -EINVAL;
         }
 
-        *request_ret = -nbd_errno_to_system_errno(s->reply.simple.error);
+        *request_ret = -nbd_errno_to_system_errno(cs->reply.simple.error);
         if (*request_ret < 0 || !qiov) {
             return 0;
         }
 
-        return qio_channel_readv_all(s->ioc, qiov->iov, qiov->niov,
+        return qio_channel_readv_all(cs->ioc, qiov->iov, qiov->niov,
                                      errp) < 0 ? -EIO : 0;
     }
 
     /* handle structured reply chunk */
-    assert(s->info.structured_reply);
-    chunk = &s->reply.structured;
+    assert(cs->info.structured_reply);
+    chunk = &cs->reply.structured;
 
     if (chunk->type == NBD_REPLY_TYPE_NONE) {
         if (!(chunk->flags & NBD_REPLY_FLAG_DONE)) {
@@ -891,7 +909,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
             return -EINVAL;
         }
 
-        return nbd_co_receive_offset_data_payload(s, s->requests[i].offset,
+        return nbd_co_receive_offset_data_payload(cs, cs->requests[i].offset,
                                                   qiov, errp);
     }
 
@@ -899,7 +917,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
         payload = &local_payload;
     }
 
-    ret = nbd_co_receive_structured_payload(s, payload, errp);
+    ret = nbd_co_receive_structured_payload(cs, payload, errp);
     if (ret < 0) {
         return ret;
     }
@@ -919,23 +937,23 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
  * Return value is a fatal error code or normal nbd reply error code
  */
 static coroutine_fn int nbd_co_receive_one_chunk(
-        BDRVNBDState *s, uint64_t handle, bool only_structured,
+        NBDConnState *cs, uint64_t handle, bool only_structured,
         int *request_ret, QEMUIOVector *qiov, NBDReply *reply, void **payload,
         Error **errp)
 {
-    int ret = nbd_co_do_receive_one_chunk(s, handle, only_structured,
+    int ret = nbd_co_do_receive_one_chunk(cs, handle, only_structured,
                                           request_ret, qiov, payload, errp);
 
     if (ret < 0) {
         memset(reply, 0, sizeof(*reply));
-        nbd_channel_error(s, ret);
+        nbd_channel_error(cs, ret);
     } else {
         /* For assert at loop start in nbd_connection_entry */
-        *reply = s->reply;
+        *reply = cs->reply;
     }
-    s->reply.handle = 0;
+    cs->reply.handle = 0;
 
-    nbd_recv_coroutines_wake(s);
+    nbd_recv_coroutines_wake(cs);
 
     return ret;
 }
@@ -976,16 +994,16 @@ static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
  * NBD_FOREACH_REPLY_CHUNK
  * The pointer stored in @payload requires g_free() to free it.
  */
-#define NBD_FOREACH_REPLY_CHUNK(s, iter, handle, structured, \
+#define NBD_FOREACH_REPLY_CHUNK(cs, iter, handle, structured, \
                                 qiov, reply, payload) \
     for (iter = (NBDReplyChunkIter) { .only_structured = structured }; \
-         nbd_reply_chunk_iter_receive(s, &iter, handle, qiov, reply, payload);)
+         nbd_reply_chunk_iter_receive(cs, &iter, handle, qiov, reply, payload);)
 
 /*
  * nbd_reply_chunk_iter_receive
  * The pointer stored in @payload requires g_free() to free it.
  */
-static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
+static bool coroutine_fn nbd_reply_chunk_iter_receive(NBDConnState *cs,
                                                       NBDReplyChunkIter *iter,
                                                       uint64_t handle,
                                                       QEMUIOVector *qiov,
@@ -1006,7 +1024,7 @@ static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
         reply = &local_reply;
     }
 
-    ret = nbd_co_receive_one_chunk(s, handle, iter->only_structured,
+    ret = nbd_co_receive_one_chunk(cs, handle, iter->only_structured,
                                    &request_ret, qiov, reply, payload,
                                    &local_err);
     if (ret < 0) {
@@ -1038,21 +1056,21 @@ static bool coroutine_fn nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     return true;
 
 break_loop:
-    qemu_mutex_lock(&s->requests_lock);
-    s->requests[HANDLE_TO_INDEX(s, handle)].coroutine = NULL;
-    s->in_flight--;
-    qemu_co_queue_next(&s->free_sema);
-    qemu_mutex_unlock(&s->requests_lock);
+    qemu_mutex_lock(&cs->requests_lock);
+    cs->requests[HANDLE_TO_INDEX(cs, handle)].coroutine = NULL;
+    cs->in_flight--;
+    qemu_co_queue_next(&cs->free_sema);
+    qemu_mutex_unlock(&cs->requests_lock);
 
     return false;
 }
 
-static int coroutine_fn nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
+static int coroutine_fn nbd_co_receive_return_code(NBDConnState *cs, uint64_t handle,
                                                    int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
 
-    NBD_FOREACH_REPLY_CHUNK(s, iter, handle, false, NULL, NULL, NULL) {
+    NBD_FOREACH_REPLY_CHUNK(cs, iter, handle, false, NULL, NULL, NULL) {
         /* nbd_reply_chunk_iter_receive does all the work */
     }
 
@@ -1061,7 +1079,7 @@ static int coroutine_fn nbd_co_receive_return_code(BDRVNBDState *s, uint64_t han
     return iter.ret;
 }
 
-static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
+static int coroutine_fn nbd_co_receive_cmdread_reply(NBDConnState *cs, uint64_t handle,
                                                      uint64_t offset, QEMUIOVector *qiov,
                                                      int *request_ret, Error **errp)
 {
@@ -1070,7 +1088,7 @@ static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t h
     void *payload = NULL;
     Error *local_err = NULL;
 
-    NBD_FOREACH_REPLY_CHUNK(s, iter, handle, s->info.structured_reply,
+    NBD_FOREACH_REPLY_CHUNK(cs, iter, handle, cs->info.structured_reply,
                             qiov, &reply, &payload)
     {
         int ret;
@@ -1086,17 +1104,17 @@ static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t h
              */
             break;
         case NBD_REPLY_TYPE_OFFSET_HOLE:
-            ret = nbd_parse_offset_hole_payload(s, &reply.structured, payload,
+            ret = nbd_parse_offset_hole_payload(cs, &reply.structured, payload,
                                                 offset, qiov, &local_err);
             if (ret < 0) {
-                nbd_channel_error(s, ret);
+                nbd_channel_error(cs, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
             }
             break;
         default:
             if (!nbd_reply_type_is_error(chunk->type)) {
                 /* not allowed reply type */
-                nbd_channel_error(s, -EINVAL);
+                nbd_channel_error(cs, -EINVAL);
                 error_setg(&local_err,
                            "Unexpected reply type: %d (%s) for CMD_READ",
                            chunk->type, nbd_reply_type_lookup(chunk->type));
@@ -1113,7 +1131,7 @@ static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t h
     return iter.ret;
 }
 
-static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
+static int coroutine_fn nbd_co_receive_blockstatus_reply(NBDConnState *cs,
                                                          uint64_t handle, uint64_t length,
                                                          NBDExtent *extent,
                                                          int *request_ret, Error **errp)
@@ -1125,7 +1143,7 @@ static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
     bool received = false;
 
     assert(!extent->length);
-    NBD_FOREACH_REPLY_CHUNK(s, iter, handle, false, NULL, &reply, &payload) {
+    NBD_FOREACH_REPLY_CHUNK(cs, iter, handle, false, NULL, &reply, &payload) {
         int ret;
         NBDStructuredReplyChunk *chunk = &reply.structured;
 
@@ -1134,23 +1152,23 @@ static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
         switch (chunk->type) {
         case NBD_REPLY_TYPE_BLOCK_STATUS:
             if (received) {
-                nbd_channel_error(s, -EINVAL);
+                nbd_channel_error(cs, -EINVAL);
                 error_setg(&local_err, "Several BLOCK_STATUS chunks in reply");
                 nbd_iter_channel_error(&iter, -EINVAL, &local_err);
             }
             received = true;
 
-            ret = nbd_parse_blockstatus_payload(s, &reply.structured,
+            ret = nbd_parse_blockstatus_payload(cs, &reply.structured,
                                                 payload, length, extent,
                                                 &local_err);
             if (ret < 0) {
-                nbd_channel_error(s, ret);
+                nbd_channel_error(cs, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
             }
             break;
         default:
             if (!nbd_reply_type_is_error(chunk->type)) {
-                nbd_channel_error(s, -EINVAL);
+                nbd_channel_error(cs, -EINVAL);
                 error_setg(&local_err,
                            "Unexpected reply type: %d (%s) "
                            "for CMD_BLOCK_STATUS",
@@ -1173,12 +1191,11 @@ static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
     return iter.ret;
 }
 
-static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request,
+static int coroutine_fn nbd_co_request(NBDConnState *cs, NBDRequest *request,
                                        QEMUIOVector *write_qiov)
 {
     int ret, request_ret;
     Error *local_err = NULL;
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     assert(request->type != NBD_CMD_READ);
     if (write_qiov) {
@@ -1189,12 +1206,12 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
     }
 
     do {
-        ret = nbd_co_send_request(bs, request, write_qiov);
+        ret = nbd_co_send_request(cs, request, write_qiov);
         if (ret < 0) {
             continue;
         }
 
-        ret = nbd_co_receive_return_code(s, request->handle,
+        ret = nbd_co_receive_return_code(cs, request->handle,
                                          &request_ret, &local_err);
         if (local_err) {
             trace_nbd_co_request_fail(request->from, request->len,
@@ -1205,7 +1222,7 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_will_reconnect(s));
+    } while (ret < 0 && nbd_client_will_reconnect(cs));
 
     return ret ? ret : request_ret;
 }
@@ -1222,6 +1239,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
         .from = offset,
         .len = bytes,
     };
+    NBDConnState * const cs = s->conns[0];
 
     assert(bytes <= NBD_MAX_BUFFER_SIZE);
 
@@ -1234,13 +1252,13 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
      * advertised size because the block layer rounded size up, then
      * truncate the request to the server and tail-pad with zero.
      */
-    if (offset >= s->info.size) {
+    if (offset >= cs->info.size) {
         assert(bytes < BDRV_SECTOR_SIZE);
         qemu_iovec_memset(qiov, 0, 0, bytes);
         return 0;
     }
-    if (offset + bytes > s->info.size) {
-        uint64_t slop = offset + bytes - s->info.size;
+    if (offset + bytes > cs->info.size) {
+        uint64_t slop = offset + bytes - cs->info.size;
 
         assert(slop < BDRV_SECTOR_SIZE);
         qemu_iovec_memset(qiov, bytes - slop, 0, slop);
@@ -1248,12 +1266,12 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
     }
 
     do {
-        ret = nbd_co_send_request(bs, &request, NULL);
+        ret = nbd_co_send_request(cs, &request, NULL);
         if (ret < 0) {
             continue;
         }
 
-        ret = nbd_co_receive_cmdread_reply(s, request.handle, offset, qiov,
+        ret = nbd_co_receive_cmdread_reply(cs, request.handle, offset, qiov,
                                            &request_ret, &local_err);
         if (local_err) {
             trace_nbd_co_request_fail(request.from, request.len, request.handle,
@@ -1263,7 +1281,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_will_reconnect(s));
+    } while (ret < 0 && nbd_client_will_reconnect(cs));
 
     return ret ? ret : request_ret;
 }
@@ -1278,10 +1296,11 @@ static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offs
         .from = offset,
         .len = bytes,
     };
+    NBDConnState * const cs = s->conns[0];
 
-    assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
+    assert(!(cs->info.flags & NBD_FLAG_READ_ONLY));
     if (flags & BDRV_REQ_FUA) {
-        assert(s->info.flags & NBD_FLAG_SEND_FUA);
+        assert(cs->info.flags & NBD_FLAG_SEND_FUA);
         request.flags |= NBD_CMD_FLAG_FUA;
     }
 
@@ -1290,7 +1309,7 @@ static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offs
     if (!bytes) {
         return 0;
     }
-    return nbd_co_request(bs, &request, qiov);
+    return nbd_co_request(cs, &request, qiov);
 }
 
 static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
@@ -1302,45 +1321,47 @@ static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_
         .from = offset,
         .len = bytes,  /* .len is uint32_t actually */
     };
+    NBDConnState * const cs = s->conns[0];
 
     assert(bytes <= UINT32_MAX); /* rely on max_pwrite_zeroes */
 
-    assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
-    if (!(s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES)) {
+    assert(!(cs->info.flags & NBD_FLAG_READ_ONLY));
+    if (!(cs->info.flags & NBD_FLAG_SEND_WRITE_ZEROES)) {
         return -ENOTSUP;
     }
 
     if (flags & BDRV_REQ_FUA) {
-        assert(s->info.flags & NBD_FLAG_SEND_FUA);
+        assert(cs->info.flags & NBD_FLAG_SEND_FUA);
         request.flags |= NBD_CMD_FLAG_FUA;
     }
     if (!(flags & BDRV_REQ_MAY_UNMAP)) {
         request.flags |= NBD_CMD_FLAG_NO_HOLE;
     }
     if (flags & BDRV_REQ_NO_FALLBACK) {
-        assert(s->info.flags & NBD_FLAG_SEND_FAST_ZERO);
+        assert(cs->info.flags & NBD_FLAG_SEND_FAST_ZERO);
         request.flags |= NBD_CMD_FLAG_FAST_ZERO;
     }
 
     if (!bytes) {
         return 0;
     }
-    return nbd_co_request(bs, &request, NULL);
+    return nbd_co_request(cs, &request, NULL);
 }
 
 static int coroutine_fn nbd_client_co_flush(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = { .type = NBD_CMD_FLUSH };
+    NBDConnState * const cs = s->conns[0];
 
-    if (!(s->info.flags & NBD_FLAG_SEND_FLUSH)) {
+    if (!(cs->info.flags & NBD_FLAG_SEND_FLUSH)) {
         return 0;
     }
 
     request.from = 0;
     request.len = 0;
 
-    return nbd_co_request(bs, &request, NULL);
+    return nbd_co_request(cs, &request, NULL);
 }
 
 static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
@@ -1352,15 +1373,16 @@ static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t off
         .from = offset,
         .len = bytes, /* len is uint32_t */
     };
+    NBDConnState * const cs = s->conns[0];
 
     assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */
 
-    assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
-    if (!(s->info.flags & NBD_FLAG_SEND_TRIM) || !bytes) {
+    assert(!(cs->info.flags & NBD_FLAG_READ_ONLY));
+    if (!(cs->info.flags & NBD_FLAG_SEND_TRIM) || !bytes) {
         return 0;
     }
 
-    return nbd_co_request(bs, &request, NULL);
+    return nbd_co_request(cs, &request, NULL);
 }
 
 static int coroutine_fn nbd_client_co_block_status(
@@ -1371,16 +1393,17 @@ static int coroutine_fn nbd_client_co_block_status(
     NBDExtent extent = { 0 };
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     Error *local_err = NULL;
+    NBDConnState * const cs = s->conns[0];
 
     NBDRequest request = {
         .type = NBD_CMD_BLOCK_STATUS,
         .from = offset,
         .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
-                   MIN(bytes, s->info.size - offset)),
+                   MIN(bytes, cs->info.size - offset)),
         .flags = NBD_CMD_FLAG_REQ_ONE,
     };
 
-    if (!s->info.base_allocation) {
+    if (!cs->info.base_allocation) {
         *pnum = bytes;
         *map = offset;
         *file = bs;
@@ -1394,23 +1417,23 @@ static int coroutine_fn nbd_client_co_block_status(
      * up, we truncated the request to the server (above), or are
      * called on just the hole.
      */
-    if (offset >= s->info.size) {
+    if (offset >= cs->info.size) {
         *pnum = bytes;
         assert(bytes < BDRV_SECTOR_SIZE);
         /* Intentionally don't report offset_valid for the hole */
         return BDRV_BLOCK_ZERO;
     }
 
-    if (s->info.min_block) {
-        assert(QEMU_IS_ALIGNED(request.len, s->info.min_block));
+    if (cs->info.min_block) {
+        assert(QEMU_IS_ALIGNED(request.len, cs->info.min_block));
     }
     do {
-        ret = nbd_co_send_request(bs, &request, NULL);
+        ret = nbd_co_send_request(cs, &request, NULL);
         if (ret < 0) {
             continue;
         }
 
-        ret = nbd_co_receive_blockstatus_reply(s, request.handle, bytes,
+        ret = nbd_co_receive_blockstatus_reply(cs, request.handle, bytes,
                                                &extent, &request_ret,
                                                &local_err);
         if (local_err) {
@@ -1421,7 +1444,7 @@ static int coroutine_fn nbd_client_co_block_status(
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_will_reconnect(s));
+    } while (ret < 0 && nbd_client_will_reconnect(cs));
 
     if (ret < 0 || request_ret < 0) {
         return ret ? ret : request_ret;
@@ -1440,8 +1463,10 @@ static int nbd_client_reopen_prepare(BDRVReopenState *state,
                                      BlockReopenQueue *queue, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)state->bs->opaque;
+    NBDConnState * const cs = s->conns[0];
 
-    if ((state->flags & BDRV_O_RDWR) && (s->info.flags & NBD_FLAG_READ_ONLY)) {
+    if ((state->flags & BDRV_O_RDWR) &&
+        (cs->info.flags & NBD_FLAG_READ_ONLY)) {
         error_setg(errp, "Can't reopen read-only NBD mount as read/write");
         return -EACCES;
     }
@@ -1450,24 +1475,23 @@ static int nbd_client_reopen_prepare(BDRVReopenState *state,
 
 static void nbd_yank(void *opaque)
 {
-    BlockDriverState *bs = opaque;
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnState *cs = opaque;
 
-    QEMU_LOCK_GUARD(&s->requests_lock);
-    qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-    s->state = NBD_CLIENT_QUIT;
+    QEMU_LOCK_GUARD(&cs->requests_lock);
+    qio_channel_shutdown(QIO_CHANNEL(cs->ioc),
+                         QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    cs->state = NBD_CLIENT_QUIT;
 }
 
-static void nbd_client_close(BlockDriverState *bs)
+static void nbd_client_close(NBDConnState *cs)
 {
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = { .type = NBD_CMD_DISC };
 
-    if (s->ioc) {
-        nbd_send_request(s->ioc, &request);
+    if (cs->ioc) {
+        nbd_send_request(cs->ioc, &request);
     }
 
-    nbd_teardown_connection(bs);
+    nbd_teardown_connection(cs);
 }
 
 
@@ -1888,10 +1912,13 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     s->bs = bs;
-    qemu_mutex_init(&s->requests_lock);
-    qemu_co_queue_init(&s->free_sema);
-    qemu_co_mutex_init(&s->send_mutex);
-    qemu_co_mutex_init(&s->receive_mutex);
+
+    s->conns[0] = g_new0(NBDConnState, 1);
+    s->conns[0]->s = s;
+    qemu_mutex_init(&s->conns[0]->requests_lock);
+    qemu_co_queue_init(&s->conns[0]->free_sema);
+    qemu_co_mutex_init(&s->conns[0]->send_mutex);
+    qemu_co_mutex_init(&s->conns[0]->receive_mutex);
 
     if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
         return -EEXIST;
@@ -1902,18 +1929,19 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    s->conn = nbd_client_connection_new(s->saddr, true, s->export,
-                                        s->x_dirty_bitmap, s->tlscreds,
-                                        s->tlshostname);
+    s->conns[0]->conn =
+        nbd_client_connection_new(s->saddr, true, s->export,
+                                  s->x_dirty_bitmap, s->tlscreds,
+                                  s->tlshostname);
 
     if (s->open_timeout) {
-        nbd_client_connection_enable_retry(s->conn);
-        open_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+        nbd_client_connection_enable_retry(s->conns[0]->conn);
+        open_timer_init(s->conns[0], qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
                         s->open_timeout * NANOSECONDS_PER_SECOND);
     }
 
-    s->state = NBD_CLIENT_CONNECTING_WAIT;
-    ret = nbd_do_establish_connection(bs, true, errp);
+    s->conns[0]->state = NBD_CLIENT_CONNECTING_WAIT;
+    ret = nbd_do_establish_connection(bs, s->conns[0], true, errp);
     if (ret < 0) {
         goto fail;
     }
@@ -1923,23 +1951,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
      * Delete it, because we do not want it to be around when this node
      * is drained or closed.
      */
-    open_timer_del(s);
+    open_timer_del(s->conns[0]);
 
-    nbd_client_connection_enable_retry(s->conn);
+    nbd_client_connection_enable_retry(s->conns[0]->conn);
 
     /*
      * We set s->multi_conn in nbd_process_options above, but now that
      * we have connected if the server doesn't advertise that it is
      * safe for multi-conn, force it to 1.
      */
-    if (!(s->info.flags & NBD_FLAG_CAN_MULTI_CONN)) {
+    if (!(s->conns[0]->info.flags & NBD_FLAG_CAN_MULTI_CONN)) {
         s->multi_conn = 1;
     }
 
     return 0;
 
 fail:
-    open_timer_del(s);
+    open_timer_del(s->conns[0]);
     nbd_clear_bdrvstate(bs);
     return ret;
 }
@@ -1952,8 +1980,9 @@ static int coroutine_fn nbd_co_flush(BlockDriverState *bs)
 static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    uint32_t min = s->info.min_block;
-    uint32_t max = MIN_NON_ZERO(NBD_MAX_BUFFER_SIZE, s->info.max_block);
+    NBDConnState * const cs = s->conns[0];
+    uint32_t min = cs->info.min_block;
+    uint32_t max = MIN_NON_ZERO(NBD_MAX_BUFFER_SIZE, cs->info.max_block);
 
     /*
      * If the server did not advertise an alignment:
@@ -1968,8 +1997,8 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
      *   sub-sector requests
      */
     if (!min) {
-        min = (!QEMU_IS_ALIGNED(s->info.size, BDRV_SECTOR_SIZE) ||
-               s->info.base_allocation) ? 1 : BDRV_SECTOR_SIZE;
+        min = (!QEMU_IS_ALIGNED(cs->info.size, BDRV_SECTOR_SIZE) ||
+               cs->info.base_allocation) ? 1 : BDRV_SECTOR_SIZE;
     }
 
     bs->bl.request_alignment = min;
@@ -1977,15 +2006,17 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.max_pwrite_zeroes = max;
     bs->bl.max_transfer = max;
 
-    if (s->info.opt_block &&
-        s->info.opt_block > bs->bl.opt_transfer) {
-        bs->bl.opt_transfer = s->info.opt_block;
+    if (cs->info.opt_block &&
+        cs->info.opt_block > bs->bl.opt_transfer) {
+        bs->bl.opt_transfer = cs->info.opt_block;
     }
 }
 
 static void nbd_close(BlockDriverState *bs)
 {
-    nbd_client_close(bs);
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    nbd_client_close(s->conns[0]);
     nbd_clear_bdrvstate(bs);
 }
 
@@ -2002,13 +2033,14 @@ static int coroutine_fn nbd_co_truncate(BlockDriverState *bs, int64_t offset,
                                         BdrvRequestFlags flags, Error **errp)
 {
     BDRVNBDState *s = bs->opaque;
+    NBDConnState * const cs = s->conns[0];
 
-    if (offset != s->info.size && exact) {
+    if (offset != cs->info.size && exact) {
         error_setg(errp, "Cannot resize NBD nodes");
         return -ENOTSUP;
     }
 
-    if (offset > s->info.size) {
+    if (offset > cs->info.size) {
         error_setg(errp, "Cannot grow NBD nodes");
         return -EINVAL;
     }
@@ -2019,8 +2051,9 @@ static int coroutine_fn nbd_co_truncate(BlockDriverState *bs, int64_t offset,
 static int64_t coroutine_fn nbd_co_getlength(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
+    NBDConnState * const cs = s->conns[0];
 
-    return s->info.size;
+    return cs->info.size;
 }
 
 static void nbd_refresh_filename(BlockDriverState *bs)
@@ -2083,25 +2116,27 @@ static const char *const nbd_strong_runtime_opts[] = {
 static void nbd_cancel_in_flight(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    NBDConnState * const cs = s->conns[0];
 
-    reconnect_delay_timer_del(s);
+    reconnect_delay_timer_del(cs);
 
-    qemu_mutex_lock(&s->requests_lock);
-    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
-        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+    qemu_mutex_lock(&cs->requests_lock);
+    if (cs->state == NBD_CLIENT_CONNECTING_WAIT) {
+        cs->state = NBD_CLIENT_CONNECTING_NOWAIT;
     }
-    qemu_mutex_unlock(&s->requests_lock);
+    qemu_mutex_unlock(&cs->requests_lock);
 
-    nbd_co_establish_connection_cancel(s->conn);
+    nbd_co_establish_connection_cancel(cs->conn);
 }
 
 static void nbd_attach_aio_context(BlockDriverState *bs,
                                    AioContext *new_context)
 {
     BDRVNBDState *s = bs->opaque;
+    NBDConnState * const cs = s->conns[0];
 
     /* The open_timer is used only during nbd_open() */
-    assert(!s->open_timer);
+    assert(!cs->open_timer);
 
     /*
      * The reconnect_delay_timer is scheduled in I/O paths when the
@@ -2112,22 +2147,23 @@ static void nbd_attach_aio_context(BlockDriverState *bs,
      * Since the AioContext can only be changed when a node is drained,
      * the reconnect_delay_timer cannot be active here.
      */
-    assert(!s->reconnect_delay_timer);
+    assert(!cs->reconnect_delay_timer);
 
-    if (s->ioc) {
-        qio_channel_attach_aio_context(s->ioc, new_context);
+    if (cs->ioc) {
+        qio_channel_attach_aio_context(cs->ioc, new_context);
     }
 }
 
 static void nbd_detach_aio_context(BlockDriverState *bs)
 {
     BDRVNBDState *s = bs->opaque;
+    NBDConnState * const cs = s->conns[0];
 
-    assert(!s->open_timer);
-    assert(!s->reconnect_delay_timer);
+    assert(!cs->open_timer);
+    assert(!cs->reconnect_delay_timer);
 
-    if (s->ioc) {
-        qio_channel_detach_aio_context(s->ioc);
+    if (cs->ioc) {
+        qio_channel_detach_aio_context(cs->ioc);
     }
 }
 
-- 
2.39.2


