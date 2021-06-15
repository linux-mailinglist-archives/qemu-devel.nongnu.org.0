Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65813A8ABE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:10:19 +0200 (CEST)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGKA-0001ft-Oh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzA-0002qn-Mn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz1-0001Bq-LF
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzFaETPbCpP681WQuP7XvvfW/B9P/wTmbMtNfUCE9lE=;
 b=b5L8pEWV78dHGvMiGzi36uDqFOfhGE0b6+z89tfikZ/uCLoP6byfdkocg8wOBCsPcuh8eV
 5XMCQcL3nIJWc4IB8dXcD7AiQXItjZbiLL972G6WM8071UutkJ5VANuhXnWDxHtG6GBXy2
 o1kNduspfKUDNxt4Ls4DWSc+Z0wjcz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-HnsWyvyZP0mAiOl73MQmZQ-1; Tue, 15 Jun 2021 16:48:24 -0400
X-MC-Unique: HnsWyvyZP0mAiOl73MQmZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F073E107ACF6;
 Tue, 15 Jun 2021 20:48:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A04BE5D9CA;
 Tue, 15 Jun 2021 20:48:23 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/34] nbd/client-connection: shutdown connection on release
Date: Tue, 15 Jun 2021 15:47:45 -0500
Message-Id: <20210615204756.281505-24-eblake@redhat.com>
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now, when a thread can do negotiation and retry, it may run relatively
long. We need a mechanism to stop it, when the user is not interested
in a result any more. So, on nbd_client_connection_release() let's
shutdown the socket, and do not retry connection if thread is detached.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610100802.5888-22-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 032b38ed3e9b..883f9cf158cb 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -168,9 +168,13 @@ static void *connect_thread_func(void *opaque)
     uint64_t timeout = 1;
     uint64_t max_timeout = 16;

-    while (true) {
+    qemu_mutex_lock(&conn->mutex);
+    while (!conn->detached) {
+        assert(!conn->sioc);
         conn->sioc = qio_channel_socket_new();

+        qemu_mutex_unlock(&conn->mutex);
+
         error_free(conn->err);
         conn->err = NULL;
         conn->updated_info = conn->initial_info;
@@ -188,14 +192,20 @@ static void *connect_thread_func(void *opaque)
         conn->updated_info.x_dirty_bitmap = NULL;
         conn->updated_info.name = NULL;

+        qemu_mutex_lock(&conn->mutex);
+
         if (ret < 0) {
             object_unref(OBJECT(conn->sioc));
             conn->sioc = NULL;
-            if (conn->do_retry) {
+            if (conn->do_retry && !conn->detached) {
+                qemu_mutex_unlock(&conn->mutex);
+
                 sleep(timeout);
                 if (timeout < max_timeout) {
                     timeout *= 2;
                 }
+
+                qemu_mutex_lock(&conn->mutex);
                 continue;
             }
         }
@@ -203,7 +213,7 @@ static void *connect_thread_func(void *opaque)
         break;
     }

-    qemu_mutex_lock(&conn->mutex);
+    /* mutex is locked */

     assert(conn->running);
     conn->running = false;
@@ -237,6 +247,10 @@ void nbd_client_connection_release(NBDClientConnection *conn)
         } else {
             do_free = true;
         }
+        if (conn->sioc) {
+            qio_channel_shutdown(QIO_CHANNEL(conn->sioc),
+                                 QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        }
     }

     if (do_free) {
-- 
2.31.1


