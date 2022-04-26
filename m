Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B2510A68
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:26:37 +0200 (CEST)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRlc-00031h-LF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRav-0008Mq-4L
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaq-0007h4-Sa
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qhPGVEbfD3irPp3UvcspcGH0EDnw1L+eKwzCdjgsc8=;
 b=FjtJEp8qnQID03MwsWVoPag3E0Con2mHGO8/stjI0j5HTdLPF3C3M9XL9FGUYrp7FwfEB0
 egPFSIT/GlrIKXC7ljV9GHVxMmqOn2QfiPDHfwZWchL2Sv+kvS4aggS55yMCE52714cAQX
 U+NZ7uo5h8JN7E5uHpWbqzpWbvOOsdg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-YaJrrhRWP3CS1NclytkXjA-1; Tue, 26 Apr 2022 16:15:24 -0400
X-MC-Unique: YaJrrhRWP3CS1NclytkXjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C63B185A79C;
 Tue, 26 Apr 2022 20:15:24 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 974C65550A7;
 Tue, 26 Apr 2022 20:15:23 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] nbd: keep send_mutex/free_sema handling outside
 nbd_co_do_establish_connection
Date: Tue, 26 Apr 2022 15:15:08 -0500
Message-Id: <20220426201514.170410-8-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Elevate s->in_flight early so that other incoming requests will wait
on the CoQueue in nbd_co_send_request; restart them after getting back
from nbd_reconnect_attempt.  This could be after the reconnect timer or
nbd_cancel_in_flight have cancelled the attempt, so there is no
need anymore to cancel the requests there.

nbd_co_send_request now handles both stopping and restarting pending
requests after a successful connection, and there is no need to
hold send_mutex in nbd_co_do_establish_connection.  The current setup
is confusing because nbd_co_do_establish_connection is called both with
send_mutex taken and without it.  Before the patch it uses free_sema which
(at least in theory...) is protected by send_mutex, after the patch it
does not anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-5-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: wrap long line]
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/coroutines.h |  5 ++--
 block/nbd.c        | 58 +++++++++++++++++++++-------------------------
 2 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index b293e943c87f..8ea70d45f9a4 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -59,7 +59,8 @@ int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
                                         QEMUIOVector *qiov, int64_t pos);

 int coroutine_fn
-nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
+nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
+                               Error **errp);


 int coroutine_fn
@@ -109,7 +110,7 @@ bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState **file,
                                int *depth);
 int generated_co_wrapper
-nbd_do_establish_connection(BlockDriverState *bs, Error **errp);
+nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);

 int generated_co_wrapper
 blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
diff --git a/block/nbd.c b/block/nbd.c
index 326546f6cd4c..1e7f6093123b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -187,9 +187,6 @@ static void reconnect_delay_timer_cb(void *opaque)
     if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         nbd_co_establish_connection_cancel(s->conn);
-        while (qemu_co_enter_next(&s->free_sema, NULL)) {
-            /* Resume all queued requests */
-        }
     }

     reconnect_delay_timer_del(s);
@@ -310,11 +307,10 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
 }

 int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
-                                                Error **errp)
+                                                bool blocking, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
-    bool blocking = nbd_client_connecting_wait(s);
     IO_CODE();

     assert(!s->ioc);
@@ -350,7 +346,6 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,

     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
-    qemu_co_queue_restart_all(&s->free_sema);

     return 0;
 }
@@ -358,26 +353,26 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 /* called under s->send_mutex */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
+    bool blocking = nbd_client_connecting_wait(s);
+
+    /*
+     * Now we are sure that nobody is accessing the channel, and no one will
+     * try until we set the state to CONNECTED.
+     */
     assert(nbd_client_connecting(s));
-    assert(s->in_flight == 0);
+    assert(s->in_flight == 1);

-    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
-        !s->reconnect_delay_timer)
-    {
+    if (blocking && !s->reconnect_delay_timer) {
         /*
-         * It's first reconnect attempt after switching to
+         * It's the first reconnect attempt after switching to
          * NBD_CLIENT_CONNECTING_WAIT
          */
+        g_assert(s->reconnect_delay);
         reconnect_delay_timer_init(s,
             qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
             s->reconnect_delay * NANOSECONDS_PER_SECOND);
     }

-    /*
-     * Now we are sure that nobody is accessing the channel, and no one will
-     * try until we set the state to CONNECTED.
-     */
-
     /* Finalize previous connection if any */
     if (s->ioc) {
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
@@ -387,7 +382,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    nbd_co_do_establish_connection(s->bs, NULL);
+    qemu_co_mutex_unlock(&s->send_mutex);
+    nbd_co_do_establish_connection(s->bs, blocking, NULL);
+    qemu_co_mutex_lock(&s->send_mutex);

     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
@@ -472,21 +469,21 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     qemu_co_mutex_lock(&s->send_mutex);

     while (s->in_flight == MAX_NBD_REQUESTS ||
-           (!nbd_client_connected(s) && s->in_flight > 0))
-    {
+           (!nbd_client_connected(s) && s->in_flight > 0)) {
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }

-    if (nbd_client_connecting(s)) {
-        nbd_reconnect_attempt(s);
-    }
-
-    if (!nbd_client_connected(s)) {
-        rc = -EIO;
-        goto err;
-    }
-
     s->in_flight++;
+    if (!nbd_client_connected(s)) {
+        if (nbd_client_connecting(s)) {
+            nbd_reconnect_attempt(s);
+            qemu_co_queue_restart_all(&s->free_sema);
+        }
+        if (!nbd_client_connected(s)) {
+            rc = -EIO;
+            goto err;
+        }
+    }

     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
         if (s->requests[i].coroutine == NULL) {
@@ -526,8 +523,8 @@ err:
         nbd_channel_error(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
-            s->in_flight--;
         }
+        s->in_flight--;
         qemu_co_queue_next(&s->free_sema);
     }
     qemu_co_mutex_unlock(&s->send_mutex);
@@ -1882,7 +1879,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     }

     s->state = NBD_CLIENT_CONNECTING_WAIT;
-    ret = nbd_do_establish_connection(bs, errp);
+    ret = nbd_do_establish_connection(bs, true, errp);
     if (ret < 0) {
         goto fail;
     }
@@ -2048,7 +2045,6 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)

     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        qemu_co_queue_restart_all(&s->free_sema);
     }

     nbd_co_establish_connection_cancel(s->conn);
-- 
2.35.1


