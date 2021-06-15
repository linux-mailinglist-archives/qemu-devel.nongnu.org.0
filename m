Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588033A8B09
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:21:47 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGVE-0004BT-Po
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzK-0003I1-0X
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzA-0001HE-I7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCYU+dUTh+hdt/nbwoaF3c2Xc8nUzuwyD+IQEyyXs/o=;
 b=Iob/rCovU/1WC9mSTz334wKz8reZjwbqky77f1vjxJ7lXEmkh6FlJBcT54t3gHvRaT1qWD
 DtDj2w3Yre9x4wnsA/Xe2fE7N6qubbigz1gLTwJgyRUCIxncpJd3hfRQuBZESvKnwcgmwY
 eIBr2qxYLwf6pF32FQqMyOuENzDqFPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-HqerLBgKMu-yIf7qKR33qw-1; Tue, 15 Jun 2021 16:48:34 -0400
X-MC-Unique: HqerLBgKMu-yIf7qKR33qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37A82FC97;
 Tue, 15 Jun 2021 20:48:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C05F85D9CA;
 Tue, 15 Jun 2021 20:48:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/34] block/nbd: add nbd_client_connected() helper
Date: Tue, 15 Jun 2021 15:47:55 -0500
Message-Id: <20210615204756.281505-34-eblake@redhat.com>
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

We already have two similar helpers for other state. Let's add another
one for convenience.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-32-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5e7e238b4790..5cfb749e089d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -122,15 +122,20 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }

+static bool nbd_client_connected(BDRVNBDState *s)
+{
+    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+        if (nbd_client_connected(s)) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+        if (nbd_client_connected(s)) {
             qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
         }
         s->state = NBD_CLIENT_QUIT;
@@ -228,7 +233,7 @@ static void nbd_client_attach_aio_context(BlockDriverState *bs,
      * s->connection_co is either yielded from nbd_receive_reply or from
      * nbd_co_reconnect_loop()
      */
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED) {
+    if (nbd_client_connected(s)) {
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }

@@ -499,7 +504,7 @@ static coroutine_fn void nbd_connection_entry(void *opaque)
             nbd_co_reconnect_loop(s);
         }

-        if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+        if (!nbd_client_connected(s)) {
             continue;
         }

@@ -578,7 +583,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }

-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         rc = -EIO;
         goto err;
     }
@@ -605,8 +610,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED &&
-            rc >= 0) {
+        if (nbd_client_connected(s) && rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -931,7 +935,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     s->requests[i].receiving = true;
     qemu_coroutine_yield();
     s->requests[i].receiving = false;
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -1090,7 +1094,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err = NULL;
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (!nbd_client_connected(s)) {
         error_setg(&local_err, "Connection closed");
         nbd_iter_channel_error(iter, -EIO, &local_err);
         goto break_loop;
@@ -1115,8 +1119,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }

     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) ||
-        qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTED) {
+    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
         goto break_loop;
     }

-- 
2.31.1


