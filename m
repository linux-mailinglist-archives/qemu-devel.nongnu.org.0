Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A13A8A91
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:04:36 +0200 (CEST)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGEd-0005b7-0z
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0002kh-LP
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz1-0001BJ-1q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8iBpRtC0NrALa44ob+kWRWI5IIL6PR0RL+YVsIDMG98=;
 b=G+ycXXuQHv8D7/mqsdihBxZXzdCP8FABsypKDBxLXdOjciwh9e90nMR0jwbopCy6lAlUzQ
 1P5awIkGCWFu/mlX2zCXIVZ/c54cMJb3M6Bnxuw6Hf4HCg33OhpdgkNu2R/wuK/svu2pjV
 pxqY+6r3NlyA1ddcvKXdtiutFSdEZw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-t56aIzLYNfWOJqgt28RR2w-1; Tue, 15 Jun 2021 16:48:24 -0400
X-MC-Unique: t56aIzLYNfWOJqgt28RR2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F5DD100C609;
 Tue, 15 Jun 2021 20:48:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 052925D9CA;
 Tue, 15 Jun 2021 20:48:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/34] nbd/client-connection: implement connection retry
Date: Tue, 15 Jun 2021 15:47:44 -0500
Message-Id: <20210615204756.281505-23-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add an option for a thread to retry connecting until it succeeds. We'll
use nbd/client-connection both for reconnect and for initial connection
in nbd_open(), so we need a possibility to use same NBDClientConnection
instance to connect once in nbd_open() and then use retry semantics for
reconnect.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-21-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h     |  2 ++
 nbd/client-connection.c | 56 +++++++++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5d86e6a393ff..5bb54d831c8a 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -409,6 +409,8 @@ const char *nbd_err_lookup(int err);
 /* nbd/client-connection.c */
 typedef struct NBDClientConnection NBDClientConnection;

+void nbd_client_connection_enable_retry(NBDClientConnection *conn);
+
 NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 4ed37cd73fa1..032b38ed3e9b 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -35,6 +35,7 @@ struct NBDClientConnection {
     QCryptoTLSCreds *tlscreds;
     NBDExportInfo initial_info;
     bool do_negotiation;
+    bool do_retry;

     QemuMutex mutex;

@@ -61,6 +62,15 @@ struct NBDClientConnection {
     Coroutine *wait_co;
 };

+/*
+ * The function isn't protected by any mutex, only call it when the client
+ * connection attempt has not yet started.
+ */
+void nbd_client_connection_enable_retry(NBDClientConnection *conn)
+{
+    conn->do_retry = true;
+}
+
 NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
@@ -155,24 +165,44 @@ static void *connect_thread_func(void *opaque)
     NBDClientConnection *conn = opaque;
     int ret;
     bool do_free;
+    uint64_t timeout = 1;
+    uint64_t max_timeout = 16;

-    conn->sioc = qio_channel_socket_new();
+    while (true) {
+        conn->sioc = qio_channel_socket_new();

-    error_free(conn->err);
-    conn->err = NULL;
-    conn->updated_info = conn->initial_info;
+        error_free(conn->err);
+        conn->err = NULL;
+        conn->updated_info = conn->initial_info;

-    ret = nbd_connect(conn->sioc, conn->saddr,
-                      conn->do_negotiation ? &conn->updated_info : NULL,
-                      conn->tlscreds, &conn->ioc, &conn->err);
-    if (ret < 0) {
-        object_unref(OBJECT(conn->sioc));
-        conn->sioc = NULL;
+        ret = nbd_connect(conn->sioc, conn->saddr,
+                          conn->do_negotiation ? &conn->updated_info : NULL,
+                          conn->tlscreds, &conn->ioc, &conn->err);
+
+        /*
+         * conn->updated_info will finally be returned to the user. Clear the
+         * pointers to our internally allocated strings, which are IN parameters
+         * of nbd_receive_negotiate() and therefore nbd_connect(). Caller
+         * shoudn't be interested in these fields.
+         */
+        conn->updated_info.x_dirty_bitmap = NULL;
+        conn->updated_info.name = NULL;
+
+        if (ret < 0) {
+            object_unref(OBJECT(conn->sioc));
+            conn->sioc = NULL;
+            if (conn->do_retry) {
+                sleep(timeout);
+                if (timeout < max_timeout) {
+                    timeout *= 2;
+                }
+                continue;
+            }
+        }
+
+        break;
     }

-    conn->updated_info.x_dirty_bitmap = NULL;
-    conn->updated_info.name = NULL;
-
     qemu_mutex_lock(&conn->mutex);

     assert(conn->running);
-- 
2.31.1


