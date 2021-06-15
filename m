Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AB3A8A8C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:02:02 +0200 (CEST)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGC9-0007qu-6A
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz4-0002iW-HV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyz-0001A6-K0
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2+zlhDaNJzWudZvz0cVxV+WVRcQjyu9L8bzdOoRfmk=;
 b=JsLbPZV4qF03M2HhYuTWMRigUyqdxqTfVnFabRkPZGNO596SyZYLVzv1NKga9ejyM9qF0q
 RwsvIPHD41RUhKCiinW3EwUWTyjusxtdjq+m2b4mKkYr/107Vb985wt24/i6bc38rlZ5+V
 BJEUsc6x2Xnl8tyaIBXvqq7F7gMGl9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-JSV2XO9WPCqYnsJM_g9xCg-1; Tue, 15 Jun 2021 16:48:23 -0400
X-MC-Unique: JSV2XO9WPCqYnsJM_g9xCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30C07FC9E;
 Tue, 15 Jun 2021 20:48:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D63F75D9CA;
 Tue, 15 Jun 2021 20:48:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/34] nbd/client-connection: use QEMU_LOCK_GUARD
Date: Tue, 15 Jun 2021 15:47:42 -0500
Message-Id: <20210615204756.281505-21-eblake@redhat.com>
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We don't update connect_thread_func() to use QEMU_LOCK_GUARD, as it
will get more complex critical sections logic in further commit, where
QEMU_LOCK_GUARD doesn't help.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-19-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c | 95 +++++++++++++++++++----------------------
 1 file changed, 43 insertions(+), 52 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index f3b270d38cc8..eb5cae2eaea4 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -125,14 +125,14 @@ void nbd_client_connection_release(NBDClientConnection *conn)
         return;
     }

-    qemu_mutex_lock(&conn->mutex);
-    assert(!conn->detached);
-    if (conn->running) {
-        conn->detached = true;
-    } else {
-        do_free = true;
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        assert(!conn->detached);
+        if (conn->running) {
+            conn->detached = true;
+        } else {
+            do_free = true;
+        }
     }
-    qemu_mutex_unlock(&conn->mutex);

     if (do_free) {
         nbd_client_connection_do_free(conn);
@@ -150,62 +150,55 @@ void nbd_client_connection_release(NBDClientConnection *conn)
 QIOChannelSocket *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
 {
-    QIOChannelSocket *sioc = NULL;
     QemuThread thread;

-    qemu_mutex_lock(&conn->mutex);
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        /*
+         * Don't call nbd_co_establish_connection() in several coroutines in
+         * parallel. Only one call at once is supported.
+         */
+        assert(!conn->wait_co);

-    /*
-     * Don't call nbd_co_establish_connection() in several coroutines in
-     * parallel. Only one call at once is supported.
-     */
-    assert(!conn->wait_co);
+        if (!conn->running) {
+            if (conn->sioc) {
+                /* Previous attempt finally succeeded in background */
+                return g_steal_pointer(&conn->sioc);
+            }

-    if (!conn->running) {
-        if (conn->sioc) {
-            /* Previous attempt finally succeeded in background */
-            sioc = g_steal_pointer(&conn->sioc);
-            qemu_mutex_unlock(&conn->mutex);
-
-            return sioc;
+            conn->running = true;
+            error_free(conn->err);
+            conn->err = NULL;
+            qemu_thread_create(&thread, "nbd-connect",
+                               connect_thread_func, conn, QEMU_THREAD_DETACHED);
         }

-        conn->running = true;
-        error_free(conn->err);
-        conn->err = NULL;
-        qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
+        conn->wait_co = qemu_coroutine_self();
     }

-    conn->wait_co = qemu_coroutine_self();
-
-    qemu_mutex_unlock(&conn->mutex);
-
     /*
      * We are going to wait for connect-thread finish, but
      * nbd_co_establish_connection_cancel() can interrupt.
      */
     qemu_coroutine_yield();

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
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        if (conn->running) {
+            /*
+             * The connection attempt was canceled and the coroutine resumed
+             * before the connection thread finished its job.  Report the
+             * attempt as failed, but leave the connection thread running,
+             * to reuse it for the next connection attempt.
+             */
+            error_setg(errp, "Connection attempt cancelled by other operation");
+            return NULL;
+        } else {
+            error_propagate(errp, conn->err);
+            conn->err = NULL;
+            return g_steal_pointer(&conn->sioc);
+        }
     }

-    qemu_mutex_unlock(&conn->mutex);
-
-    return sioc;
+    abort(); /* unreachable */
 }

 /*
@@ -220,11 +213,9 @@ void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
     Coroutine *wait_co;

-    qemu_mutex_lock(&conn->mutex);
-
-    wait_co = g_steal_pointer(&conn->wait_co);
-
-    qemu_mutex_unlock(&conn->mutex);
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        wait_co = g_steal_pointer(&conn->wait_co);
+    }

     if (wait_co) {
         aio_co_wake(wait_co);
-- 
2.31.1


