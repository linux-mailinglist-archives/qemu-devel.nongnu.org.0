Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487543A8AC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:13:08 +0200 (CEST)
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGMt-0005wI-A9
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzA-0002qH-Fl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyy-00018q-TU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdrE4d7vMv4zt88o+nX63h1bWvkDQO/Bc3c70YHnaXY=;
 b=irb8Mj4SuRbqUf8bAoBoNBRoctds5mhA7djksUsSmhQg3CZiD8qXL4WjRGmGqlaVIZu6th
 efL20Zd+6MKWGqWQ0u/IlBctDVDwCIMrk30P4cFnY99YG4RpWDtJDHnbwnNjgpjOIAvK2z
 ZquZvAOxnFEobzRao2C6KTsnfwWUX7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140--vxgKsD2MYSM0eYGu3MUqA-1; Tue, 15 Jun 2021 16:48:22 -0400
X-MC-Unique: -vxgKsD2MYSM0eYGu3MUqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8935100C61A;
 Tue, 15 Jun 2021 20:48:21 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 301FC5D9CA;
 Tue, 15 Jun 2021 20:48:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/34] nbd: move connection code from block/nbd to
 nbd/client-connection
Date: Tue, 15 Jun 2021 15:47:41 -0500
Message-Id: <20210615204756.281505-20-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We now have bs-independent connection API, which consists of four
functions:

  nbd_client_connection_new()
  nbd_client_connection_release()
  nbd_co_establish_connection()
  nbd_co_establish_connection_cancel()

Move them to a separate file together with NBDClientConnection
structure which becomes private to the new API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-18-vsementsov@virtuozzo.com>
[eblake: comment tweaks]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     |  11 ++
 block/nbd.c             | 207 -----------------------------------
 nbd/client-connection.c | 232 ++++++++++++++++++++++++++++++++++++++++
 nbd/meson.build         |   1 +
 4 files changed, 244 insertions(+), 207 deletions(-)
 create mode 100644 nbd/client-connection.c

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f34d23bb037..57381be76fc5 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -406,4 +406,15 @@ const char *nbd_info_lookup(uint16_t info);
 const char *nbd_cmd_lookup(uint16_t info);
 const char *nbd_err_lookup(int err);

+/* nbd/client-connection.c */
+typedef struct NBDClientConnection NBDClientConnection;
+
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
+void nbd_client_connection_release(NBDClientConnection *conn);
+
+QIOChannelSocket *coroutine_fn
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+
+void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+
 #endif
diff --git a/block/nbd.c b/block/nbd.c
index fa6e5e85bd6f..26914509f153 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,33 +66,6 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;

-typedef struct NBDClientConnection {
-    /* Initialization constants */
-    SocketAddress *saddr; /* address to connect to */
-
-    QemuMutex mutex;
-
-    /*
-     * @sioc and @err represent a connection attempt.  While running
-     * is true, they are only used by the connection thread, and mutex
-     * locking is not needed.  Once the thread finishes,
-     * nbd_co_establish_connection then steals these pointers while
-     * under the mutex.
-     */
-    QIOChannelSocket *sioc;
-    Error *err;
-
-    /* All further fields are accessed only under mutex */
-    bool running; /* thread is running now */
-    bool detached; /* thread is detached and should cleanup the state */
-
-    /*
-     * wait_co: if non-NULL, which coroutine to wake in
-     * nbd_co_establish_connection() after yield()
-     */
-    Coroutine *wait_co;
-} NBDClientConnection;
-
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
     QIOChannel *ioc; /* The current I/O channel which may differ (eg TLS) */
@@ -127,12 +100,8 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;

-static void nbd_client_connection_release(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
-static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);

@@ -345,182 +314,6 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }

-static NBDClientConnection *
-nbd_client_connection_new(const SocketAddress *saddr)
-{
-    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
-
-    *conn = (NBDClientConnection) {
-        .saddr = QAPI_CLONE(SocketAddress, saddr),
-    };
-
-    qemu_mutex_init(&conn->mutex);
-
-    return conn;
-}
-
-static void nbd_client_connection_do_free(NBDClientConnection *conn)
-{
-    if (conn->sioc) {
-        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
-        object_unref(OBJECT(conn->sioc));
-    }
-    error_free(conn->err);
-    qapi_free_SocketAddress(conn->saddr);
-    g_free(conn);
-}
-
-static void *connect_thread_func(void *opaque)
-{
-    NBDClientConnection *conn = opaque;
-    int ret;
-    bool do_free;
-
-    conn->sioc = qio_channel_socket_new();
-
-    error_free(conn->err);
-    conn->err = NULL;
-    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
-    if (ret < 0) {
-        object_unref(OBJECT(conn->sioc));
-        conn->sioc = NULL;
-    }
-
-    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
-
-    qemu_mutex_lock(&conn->mutex);
-
-    assert(conn->running);
-    conn->running = false;
-    if (conn->wait_co) {
-        aio_co_wake(conn->wait_co);
-        conn->wait_co = NULL;
-    }
-    do_free = conn->detached;
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (do_free) {
-        nbd_client_connection_do_free(conn);
-    }
-
-    return NULL;
-}
-
-static void nbd_client_connection_release(NBDClientConnection *conn)
-{
-    bool do_free = false;
-
-    if (!conn) {
-        return;
-    }
-
-    qemu_mutex_lock(&conn->mutex);
-    assert(!conn->detached);
-    if (conn->running) {
-        conn->detached = true;
-    } else {
-        do_free = true;
-    }
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (do_free) {
-        nbd_client_connection_do_free(conn);
-    }
-}
-
-/*
- * Get a new connection in context of @conn:
- *   if the thread is running, wait for completion
- *   if the thread already succeeded in the background, and user didn't get the
- *     result, just return it now
- *   otherwise the thread is not running, so start a thread and wait for
- *     completion
- */
-static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
-{
-    QIOChannelSocket *sioc = NULL;
-    QemuThread thread;
-
-    qemu_mutex_lock(&conn->mutex);
-
-    /*
-     * Don't call nbd_co_establish_connection() in several coroutines in
-     * parallel. Only one call at once is supported.
-     */
-    assert(!conn->wait_co);
-
-    if (!conn->running) {
-        if (conn->sioc) {
-            /* Previous attempt finally succeeded in background */
-            sioc = g_steal_pointer(&conn->sioc);
-            qemu_mutex_unlock(&conn->mutex);
-
-            return sioc;
-        }
-
-        conn->running = true;
-        error_free(conn->err);
-        conn->err = NULL;
-        qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
-    }
-
-    conn->wait_co = qemu_coroutine_self();
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    /*
-     * We are going to wait for connect-thread finish, but
-     * nbd_co_establish_connection_cancel() can interrupt.
-     */
-    qemu_coroutine_yield();
-
-    qemu_mutex_lock(&conn->mutex);
-
-    if (conn->running) {
-        /*
-         * The connection attempt was canceled and the coroutine resumed
-         * before the connection thread finished its job.  Report the
-         * attempt as failed, but leave the connection thread running,
-         * to reuse it for the next connection attempt.
-         */
-        error_setg(errp, "Connection attempt cancelled by other operation");
-    } else {
-        error_propagate(errp, conn->err);
-        conn->err = NULL;
-        sioc = g_steal_pointer(&conn->sioc);
-    }
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    return sioc;
-}
-
-/*
- * nbd_co_establish_connection_cancel
- * Cancel nbd_co_establish_connection() asynchronously.
- *
- * Note that this function neither directly stops the thread nor closes the
- * socket, but rather safely wakes nbd_co_establish_connection() which is
- * sleeping in yield()
- */
-static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
-{
-    Coroutine *wait_co;
-
-    qemu_mutex_lock(&conn->mutex);
-
-    wait_co = g_steal_pointer(&conn->wait_co);
-
-    qemu_mutex_unlock(&conn->mutex);
-
-    if (wait_co) {
-        aio_co_wake(wait_co);
-    }
-}
-
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
new file mode 100644
index 000000000000..f3b270d38cc8
--- /dev/null
+++ b/nbd/client-connection.c
@@ -0,0 +1,232 @@
+/*
+ * QEMU Block driver for  NBD
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+
+#include "block/nbd.h"
+
+#include "qapi/qapi-visit-sockets.h"
+#include "qapi/clone-visitor.h"
+
+struct NBDClientConnection {
+    /* Initialization constants */
+    SocketAddress *saddr; /* address to connect to */
+
+    QemuMutex mutex;
+
+    /*
+     * @sioc and @err represent a connection attempt.  While running
+     * is true, they are only used by the connection thread, and mutex
+     * locking is not needed.  Once the thread finishes,
+     * nbd_co_establish_connection then steals these pointers while
+     * under the mutex.
+     */
+    QIOChannelSocket *sioc;
+    Error *err;
+
+    /* All further fields are accessed only under mutex */
+    bool running; /* thread is running now */
+    bool detached; /* thread is detached and should cleanup the state */
+
+    /*
+     * wait_co: if non-NULL, which coroutine to wake in
+     * nbd_co_establish_connection() after yield()
+     */
+    Coroutine *wait_co;
+};
+
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
+{
+    NBDClientConnection *conn = g_new(NBDClientConnection, 1);
+
+    *conn = (NBDClientConnection) {
+        .saddr = QAPI_CLONE(SocketAddress, saddr),
+    };
+
+    qemu_mutex_init(&conn->mutex);
+
+    return conn;
+}
+
+static void nbd_client_connection_do_free(NBDClientConnection *conn)
+{
+    if (conn->sioc) {
+        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
+        object_unref(OBJECT(conn->sioc));
+    }
+    error_free(conn->err);
+    qapi_free_SocketAddress(conn->saddr);
+    g_free(conn);
+}
+
+static void *connect_thread_func(void *opaque)
+{
+    NBDClientConnection *conn = opaque;
+    int ret;
+    bool do_free;
+
+    conn->sioc = qio_channel_socket_new();
+
+    error_free(conn->err);
+    conn->err = NULL;
+    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
+    if (ret < 0) {
+        object_unref(OBJECT(conn->sioc));
+        conn->sioc = NULL;
+    }
+
+    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
+
+    qemu_mutex_lock(&conn->mutex);
+
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
+        conn->wait_co = NULL;
+    }
+    do_free = conn->detached;
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
+
+    return NULL;
+}
+
+void nbd_client_connection_release(NBDClientConnection *conn)
+{
+    bool do_free = false;
+
+    if (!conn) {
+        return;
+    }
+
+    qemu_mutex_lock(&conn->mutex);
+    assert(!conn->detached);
+    if (conn->running) {
+        conn->detached = true;
+    } else {
+        do_free = true;
+    }
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
+}
+
+/*
+ * Get a new connection in context of @conn:
+ *   if the thread is running, wait for completion
+ *   if the thread already succeeded in the background, and user didn't get the
+ *     result, just return it now
+ *   otherwise the thread is not running, so start a thread and wait for
+ *     completion
+ */
+QIOChannelSocket *coroutine_fn
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
+{
+    QIOChannelSocket *sioc = NULL;
+    QemuThread thread;
+
+    qemu_mutex_lock(&conn->mutex);
+
+    /*
+     * Don't call nbd_co_establish_connection() in several coroutines in
+     * parallel. Only one call at once is supported.
+     */
+    assert(!conn->wait_co);
+
+    if (!conn->running) {
+        if (conn->sioc) {
+            /* Previous attempt finally succeeded in background */
+            sioc = g_steal_pointer(&conn->sioc);
+            qemu_mutex_unlock(&conn->mutex);
+
+            return sioc;
+        }
+
+        conn->running = true;
+        error_free(conn->err);
+        conn->err = NULL;
+        qemu_thread_create(&thread, "nbd-connect",
+                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
+    }
+
+    conn->wait_co = qemu_coroutine_self();
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    /*
+     * We are going to wait for connect-thread finish, but
+     * nbd_co_establish_connection_cancel() can interrupt.
+     */
+    qemu_coroutine_yield();
+
+    qemu_mutex_lock(&conn->mutex);
+
+    if (conn->running) {
+        /*
+         * The connection attempt was canceled and the coroutine resumed
+         * before the connection thread finished its job.  Report the
+         * attempt as failed, but leave the connection thread running,
+         * to reuse it for the next connection attempt.
+         */
+        error_setg(errp, "Connection attempt cancelled by other operation");
+    } else {
+        error_propagate(errp, conn->err);
+        conn->err = NULL;
+        sioc = g_steal_pointer(&conn->sioc);
+    }
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    return sioc;
+}
+
+/*
+ * nbd_co_establish_connection_cancel
+ * Cancel nbd_co_establish_connection() asynchronously.
+ *
+ * Note that this function neither directly stops the thread nor closes the
+ * socket, but rather safely wakes nbd_co_establish_connection() which is
+ * sleeping in yield()
+ */
+void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
+{
+    Coroutine *wait_co;
+
+    qemu_mutex_lock(&conn->mutex);
+
+    wait_co = g_steal_pointer(&conn->wait_co);
+
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (wait_co) {
+        aio_co_wake(wait_co);
+    }
+}
diff --git a/nbd/meson.build b/nbd/meson.build
index 2baaa3694801..b26d70565ebb 100644
--- a/nbd/meson.build
+++ b/nbd/meson.build
@@ -1,5 +1,6 @@
 block_ss.add(files(
   'client.c',
+  'client-connection.c',
   'common.c',
 ))
 blockdev_ss.add(files(
-- 
2.31.1


