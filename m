Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E453A8A8B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:01:58 +0200 (CEST)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGC5-0007f3-5q
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz1-0002XR-8h
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyy-00018o-NV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrpC/1JwhBQjWgXCdr94wN9YVSaSpsW0HlNiqF3x0R4=;
 b=FZUFPSG/NqqC4KrwqN9XhMFRjQzNXZvkf2XA//skXmJT6j2yQNpxA5qvCUvqKCawczfUmL
 LG9TnKO5r0RZOeUrJDYN+rigwIvzoQr1xWPYlPElBQs2y6CwIzjLq1FkYyY+Mhmssv4xsk
 6F+ldecmdon0YvK4uZY4QHHBPqv72Tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-C5V3G3VEMEe_rzem72wj6Q-1; Tue, 15 Jun 2021 16:48:21 -0400
X-MC-Unique: C5V3G3VEMEe_rzem72wj6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9D2010064B0;
 Tue, 15 Jun 2021 20:48:20 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA025D9CA;
 Tue, 15 Jun 2021 20:48:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/34] block/nbd: introduce nbd_client_connection_release()
Date: Tue, 15 Jun 2021 15:47:40 -0500
Message-Id: <20210615204756.281505-19-eblake@redhat.com>
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

This is a last step of creating bs-independent nbd connection
interface. With next commit we can finally move it to separate file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-17-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index e7261aeaef7b..fa6e5e85bd6f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,7 +127,7 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;

-static void nbd_free_connect_thread(NBDClientConnection *conn);
+static void nbd_client_connection_release(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
@@ -139,22 +139,9 @@ static void nbd_yank(void *opaque);
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDClientConnection *conn = s->conn;
-    bool do_free = false;

-    qemu_mutex_lock(&conn->mutex);
-    assert(!conn->detached);
-    if (conn->running) {
-        conn->detached = true;
-    } else {
-        do_free = true;
-    }
-    qemu_mutex_unlock(&conn->mutex);
-
-    /* the runaway thread will clean up itself */
-    if (do_free) {
-        nbd_free_connect_thread(conn);
-    }
+    nbd_client_connection_release(s->conn);
+    s->conn = NULL;

     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));

@@ -372,7 +359,7 @@ nbd_client_connection_new(const SocketAddress *saddr)
     return conn;
 }

-static void nbd_free_connect_thread(NBDClientConnection *conn)
+static void nbd_client_connection_do_free(NBDClientConnection *conn)
 {
     if (conn->sioc) {
         qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
@@ -414,12 +401,34 @@ static void *connect_thread_func(void *opaque)
     qemu_mutex_unlock(&conn->mutex);

     if (do_free) {
-        nbd_free_connect_thread(conn);
+        nbd_client_connection_do_free(conn);
     }

     return NULL;
 }

+static void nbd_client_connection_release(NBDClientConnection *conn)
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
 /*
  * Get a new connection in context of @conn:
  *   if the thread is running, wait for completion
-- 
2.31.1


