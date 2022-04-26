Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD1510A4C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:21:17 +0200 (CEST)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRgS-00039a-Du
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRat-0008Kh-Aq
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaq-0007gh-Ph
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzOyfTOnBb8YRErLFxSFW6eSvQDZgv0VnCi+E8Ojimo=;
 b=fgxq8ca2Dzcnb6udkylQNKCaHRxQ6aMM9C7GI4yl7QoC2qYC+qsBGuX5Q6R4uPGl/QbiCM
 GWFsp2zTc/nMkW37ygd1NRkdNuHZqGZ/EUSYlwR3EyYXD6qrP2/BZhV7kZXnWsTvupPXpY
 OlLQm/HlF6QBDOpAqvQ4yrTrA0YqTBw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-A6SL7UpYNBGD_4JjGGazJg-1; Tue, 26 Apr 2022 16:15:23 -0400
X-MC-Unique: A6SL7UpYNBGD_4JjGGazJg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60EA4299E762;
 Tue, 26 Apr 2022 20:15:23 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADA825550A7;
 Tue, 26 Apr 2022 20:15:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] nbd: remove peppering of nbd_client_connected
Date: Tue, 26 Apr 2022 15:15:07 -0500
Message-Id: <20220426201514.170410-7-eblake@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

It is unnecessary to check nbd_client_connected() because every time
s->state is moved out of NBD_CLIENT_CONNECTED the socket is shut down
and all coroutines are resumed.

The only case where it was actually needed is when the NBD
server disconnects and there is no reconnect-delay.  In that
case, nbd_receive_replies() does not set s->reply.handle and
nbd_co_do_receive_one_chunk() cannot continue.  For that one case,
check the return value of nbd_receive_replies().

As to the others:

* nbd_receive_replies() can put the current coroutine to sleep if another
reply is ongoing; then it will be woken by nbd_channel_error(), called
by the ongoing reply.  Or it can try itself to read a reply header and
fail, thus calling nbd_channel_error() itself.

* nbd_co_send_request() will write the body of the request and fail

* nbd_reply_chunk_iter_receive() will call nbd_co_receive_one_chunk()
and then nbd_co_do_receive_one_chunk(), which will handle the failure as
above; or it will just detect a previous call to nbd_iter_channel_error()
via iter->ret < 0.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-4-pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3a6e60920304..326546f6cd4c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -409,10 +409,6 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             return 0;
         }

-        if (!nbd_client_connected(s)) {
-            return -EIO;
-        }
-
         if (s->reply.handle != 0) {
             /*
              * Some other request is being handled now. It should already be
@@ -512,7 +508,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (nbd_client_connected(s) && rc >= 0) {
+        if (rc >= 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc = -EIO;
@@ -829,8 +825,8 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     }
     *request_ret = 0;

-    nbd_receive_replies(s, handle);
-    if (!nbd_client_connected(s)) {
+    ret = nbd_receive_replies(s, handle);
+    if (ret < 0) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -982,11 +978,6 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err = NULL;
-    if (!nbd_client_connected(s)) {
-        error_setg(&local_err, "Connection closed");
-        nbd_iter_channel_error(iter, -EIO, &local_err);
-        goto break_loop;
-    }

     if (iter->done) {
         /* Previous iteration was last. */
@@ -1007,7 +998,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     }

     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply. */
-    if (nbd_reply_is_simple(reply) || !nbd_client_connected(s)) {
+    if (nbd_reply_is_simple(reply) || iter->ret < 0) {
         goto break_loop;
     }

-- 
2.35.1


