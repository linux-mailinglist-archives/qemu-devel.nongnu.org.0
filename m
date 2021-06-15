Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F63A8AA5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:08:12 +0200 (CEST)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGI7-0004KY-11
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0002l6-PU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz0-0001B3-Ri
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFMVKfQtMMpQYNRwQPBWHumqxuiHO+WDs9tT8kpnAiw=;
 b=KiQdN9TgyIXLim7N4ufwtavsD/EnhHjQR76+tUM8y26FaJdPg+bRUYkNFKq7kl4Cd+JOcM
 9T9Tjzy316vud6/xruZuoX7jlvjrf4omX/EnQbsJBBtLVMPEZQ2TMWjsKCdhxoLpkjdupe
 YNCn43u9gBl0OgQO4J3gAajFOkdul2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-ek91K7jPOKiUYY4LHwS39Q-1; Tue, 15 Jun 2021 16:48:23 -0400
X-MC-Unique: ek91K7jPOKiUYY4LHwS39Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D0B100C621;
 Tue, 15 Jun 2021 20:48:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64B2E5D9E2;
 Tue, 15 Jun 2021 20:48:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/34] nbd/client-connection: add possibility of negotiation
Date: Tue, 15 Jun 2021 15:47:43 -0500
Message-Id: <20210615204756.281505-22-eblake@redhat.com>
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

Add arguments and logic to support nbd negotiation in the same thread
after successful connection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-20-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     |   9 +++-
 block/nbd.c             |   4 +-
 nbd/client-connection.c | 105 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 109 insertions(+), 9 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 57381be76fc5..5d86e6a393ff 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -409,11 +409,16 @@ const char *nbd_err_lookup(int err);
 /* nbd/client-connection.c */
 typedef struct NBDClientConnection NBDClientConnection;

-NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
+                                               bool do_negotiation,
+                                               const char *export_name,
+                                               const char *x_dirty_bitmap,
+                                               QCryptoTLSCreds *tlscreds);
 void nbd_client_connection_release(NBDClientConnection *conn);

 QIOChannelSocket *coroutine_fn
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
+                            QIOChannel **ioc, Error **errp);

 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);

diff --git a/block/nbd.c b/block/nbd.c
index 26914509f153..df9d241313f4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -357,7 +357,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    s->sioc = nbd_co_establish_connection(s->conn, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
@@ -2035,7 +2035,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }

-    s->conn = nbd_client_connection_new(s->saddr);
+    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);

     /*
      * establish TCP connection, return error if it fails
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index eb5cae2eaea4..4ed37cd73fa1 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -30,8 +30,11 @@
 #include "qapi/clone-visitor.h"

 struct NBDClientConnection {
-    /* Initialization constants */
+    /* Initialization constants, never change */
     SocketAddress *saddr; /* address to connect to */
+    QCryptoTLSCreds *tlscreds;
+    NBDExportInfo initial_info;
+    bool do_negotiation;

     QemuMutex mutex;

@@ -42,7 +45,9 @@ struct NBDClientConnection {
      * nbd_co_establish_connection then steals these pointers while
      * under the mutex.
      */
+    NBDExportInfo updated_info;
     QIOChannelSocket *sioc;
+    QIOChannel *ioc;
     Error *err;

     /* All further fields are accessed only under mutex */
@@ -56,12 +61,25 @@ struct NBDClientConnection {
     Coroutine *wait_co;
 };

-NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
+                                               bool do_negotiation,
+                                               const char *export_name,
+                                               const char *x_dirty_bitmap,
+                                               QCryptoTLSCreds *tlscreds)
 {
     NBDClientConnection *conn = g_new(NBDClientConnection, 1);

+    object_ref(OBJECT(tlscreds));
     *conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, saddr),
+        .tlscreds = tlscreds,
+        .do_negotiation = do_negotiation,
+
+        .initial_info.request_sizes = true,
+        .initial_info.structured_reply = true,
+        .initial_info.base_allocation = true,
+        .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
+        .initial_info.name = g_strdup(export_name ?: "")
     };

     qemu_mutex_init(&conn->mutex);
@@ -77,9 +95,61 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
     }
     error_free(conn->err);
     qapi_free_SocketAddress(conn->saddr);
+    object_unref(OBJECT(conn->tlscreds));
+    g_free(conn->initial_info.x_dirty_bitmap);
+    g_free(conn->initial_info.name);
     g_free(conn);
 }

+/*
+ * Connect to @addr and do NBD negotiation if @info is not null. If @tlscreds
+ * are given @outioc is returned. @outioc is provided only on success.  The call
+ * may be cancelled from other thread by simply qio_channel_shutdown(sioc).
+ */
+static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
+                       NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
+                       QIOChannel **outioc, Error **errp)
+{
+    int ret;
+
+    if (outioc) {
+        *outioc = NULL;
+    }
+
+    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
+
+    if (!info) {
+        return 0;
+    }
+
+    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
+                                tlscreds ? addr->u.inet.host : NULL,
+                                outioc, info, errp);
+    if (ret < 0) {
+        /*
+         * nbd_receive_negotiate() may setup tls ioc and return it even on
+         * failure path. In this case we should use it instead of original
+         * channel.
+         */
+        if (outioc && *outioc) {
+            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
+            object_unref(OBJECT(*outioc));
+            *outioc = NULL;
+        } else {
+            qio_channel_close(QIO_CHANNEL(sioc), NULL);
+        }
+
+        return ret;
+    }
+
+    return 0;
+}
+
 static void *connect_thread_func(void *opaque)
 {
     NBDClientConnection *conn = opaque;
@@ -90,13 +160,18 @@ static void *connect_thread_func(void *opaque)

     error_free(conn->err);
     conn->err = NULL;
-    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
+    conn->updated_info = conn->initial_info;
+
+    ret = nbd_connect(conn->sioc, conn->saddr,
+                      conn->do_negotiation ? &conn->updated_info : NULL,
+                      conn->tlscreds, &conn->ioc, &conn->err);
     if (ret < 0) {
         object_unref(OBJECT(conn->sioc));
         conn->sioc = NULL;
     }

-    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);
+    conn->updated_info.x_dirty_bitmap = NULL;
+    conn->updated_info.name = NULL;

     qemu_mutex_lock(&conn->mutex);

@@ -146,12 +221,24 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  *     result, just return it now
  *   otherwise the thread is not running, so start a thread and wait for
  *     completion
+ *
+ * If @info is not NULL, also do nbd-negotiation after successful connection.
+ * In this case info is used only as out parameter, and is fully initialized by
+ * nbd_co_establish_connection(). "IN" fields of info as well as related only to
+ * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
+ * include/block/nbd.h).
  */
 QIOChannelSocket *coroutine_fn
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
+nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
+                            QIOChannel **ioc, Error **errp)
 {
     QemuThread thread;

+    if (conn->do_negotiation) {
+        assert(info);
+        assert(ioc);
+    }
+
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
         /*
          * Don't call nbd_co_establish_connection() in several coroutines in
@@ -162,6 +249,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
         if (!conn->running) {
             if (conn->sioc) {
                 /* Previous attempt finally succeeded in background */
+                if (conn->do_negotiation) {
+                    *ioc = g_steal_pointer(&conn->ioc);
+                    memcpy(info, &conn->updated_info, sizeof(*info));
+                }
                 return g_steal_pointer(&conn->sioc);
             }

@@ -194,6 +285,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
         } else {
             error_propagate(errp, conn->err);
             conn->err = NULL;
+            if (conn->sioc && conn->do_negotiation) {
+                *ioc = g_steal_pointer(&conn->ioc);
+                memcpy(info, &conn->updated_info, sizeof(*info));
+            }
             return g_steal_pointer(&conn->sioc);
         }
     }
-- 
2.31.1


