Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C89510A3F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:18:34 +0200 (CEST)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRdo-0005Ox-PE
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRat-0008Kc-Aq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaq-0007gf-PZ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK8ZKYS+M44q6vDqE/25+UaXJLMIu/2UuhFbMc1ka6M=;
 b=cCGtyHxRK/9JpE0iJGF6QtN2kpJRqWEb5NwpzBhBflrOHcDJmkUmbM6ABZZj3kQqf6pWDo
 YuJr8YQqKgnmMGBhpPmPYPBb+mGREJc1oBEvI6Y3DQpTiWNNWZn33KmWP14p6J4Avx0S0s
 onuM6mxBMaxFqp3WftQSZvLt0tQaY7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-VSbfpmibMh2aUka34qNZcw-1; Tue, 26 Apr 2022 16:15:25 -0400
X-MC-Unique: VSbfpmibMh2aUka34qNZcw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 378D51875067;
 Tue, 26 Apr 2022 20:15:25 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 933585550A7;
 Tue, 26 Apr 2022 20:15:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] nbd: use a QemuMutex to synchronize yanking,
 reconnection and coroutines
Date: Tue, 26 Apr 2022 15:15:09 -0500
Message-Id: <20220426201514.170410-9-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The condition for waiting on the s->free_sema queue depends on
both s->in_flight and s->state.  The latter is currently using
atomics, but this is quite dubious and probably wrong.

Because s->state is written in the main thread too, for example by
the yank callback, it cannot be protected by a CoMutex.  Introduce a
separate lock that can be used by nbd_co_send_request(); later on this
lock will also be used for s->state.  There will not be any contention
on the lock unless there is a yank or reconnect, so this is not
performance sensitive.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-6-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1e7f6093123b..cea77becba4d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -71,17 +71,22 @@ typedef struct BDRVNBDState {
     QIOChannel *ioc; /* The current I/O channel */
     NBDExportInfo info;

-    CoMutex send_mutex;
+    /*
+     * Protects free_sema, in_flight, requests[].coroutine,
+     * reconnect_delay_timer.
+     */
+    QemuMutex requests_lock;
     CoQueue free_sema;
-
-    CoMutex receive_mutex;
     int in_flight;
-    NBDClientState state;
-
+    NBDClientRequest requests[MAX_NBD_REQUESTS];
     QEMUTimer *reconnect_delay_timer;
+
+    CoMutex send_mutex;
+    CoMutex receive_mutex;
+    NBDClientState state;
+
     QEMUTimer *open_timer;

-    NBDClientRequest requests[MAX_NBD_REQUESTS];
     NBDReply reply;
     BlockDriverState *bs;

@@ -350,7 +355,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     return 0;
 }

-/* called under s->send_mutex */
+/* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     bool blocking = nbd_client_connecting_wait(s);
@@ -382,9 +387,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    qemu_co_mutex_unlock(&s->send_mutex);
+    qemu_mutex_unlock(&s->requests_lock);
     nbd_co_do_establish_connection(s->bs, blocking, NULL);
-    qemu_co_mutex_lock(&s->send_mutex);
+    qemu_mutex_lock(&s->requests_lock);

     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
@@ -466,11 +471,10 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int rc, i = -1;

-    qemu_co_mutex_lock(&s->send_mutex);
-
+    qemu_mutex_lock(&s->requests_lock);
     while (s->in_flight == MAX_NBD_REQUESTS ||
            (!nbd_client_connected(s) && s->in_flight > 0)) {
-        qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
+        qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
     }

     s->in_flight++;
@@ -491,13 +495,13 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
         }
     }

-    g_assert(qemu_in_coroutine());
     assert(i < MAX_NBD_REQUESTS);
-
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
+    qemu_mutex_unlock(&s->requests_lock);

+    qemu_co_mutex_lock(&s->send_mutex);
     request->handle = INDEX_TO_HANDLE(s, i);

     assert(s->ioc);
@@ -517,17 +521,19 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     } else {
         rc = nbd_send_request(s->ioc, request);
     }
+    qemu_co_mutex_unlock(&s->send_mutex);

-err:
     if (rc < 0) {
+        qemu_mutex_lock(&s->requests_lock);
+err:
         nbd_channel_error(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
         }
         s->in_flight--;
         qemu_co_queue_next(&s->free_sema);
+        qemu_mutex_unlock(&s->requests_lock);
     }
-    qemu_co_mutex_unlock(&s->send_mutex);
     return rc;
 }

@@ -1017,12 +1023,11 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     return true;

 break_loop:
+    qemu_mutex_lock(&s->requests_lock);
     s->requests[HANDLE_TO_INDEX(s, handle)].coroutine = NULL;
-
-    qemu_co_mutex_lock(&s->send_mutex);
     s->in_flight--;
     qemu_co_queue_next(&s->free_sema);
-    qemu_co_mutex_unlock(&s->send_mutex);
+    qemu_mutex_unlock(&s->requests_lock);

     return false;
 }
@@ -1855,8 +1860,9 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;

     s->bs = bs;
-    qemu_co_mutex_init(&s->send_mutex);
+    qemu_mutex_init(&s->requests_lock);
     qemu_co_queue_init(&s->free_sema);
+    qemu_co_mutex_init(&s->send_mutex);
     qemu_co_mutex_init(&s->receive_mutex);

     if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
@@ -2043,9 +2049,11 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)

     reconnect_delay_timer_del(s);

+    qemu_mutex_lock(&s->requests_lock);
     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
     }
+    qemu_mutex_unlock(&s->requests_lock);

     nbd_co_establish_connection_cancel(s->conn);
 }
-- 
2.35.1


