Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF63941A220
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:02:34 +0200 (CEST)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyhl-0004XI-Nr
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybo-0002nr-Tw
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybl-00034A-Ic
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7cYrL1csZev2/4P5tAvdGKtIzV1H0EVC7XYk93Rlo0=;
 b=eyyYaguWCzP8QRXhEDXXZIks87AW9GnrDmWbdLeBXWyrg7rnXwGaXfOTkpDes+/ciQ1wSL
 PRK41Z40yjqzL5xTYEfU03dWrdsK1fgETNZ6FKjsnOrz4jS3ZPwrZ491GYgssKtQBx5Ih6
 RmvtELPUc6nHgh3OWswLQ/VCx+oZu5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-AfMgT85BONWmoGEc5pJUUw-1; Mon, 27 Sep 2021 17:56:19 -0400
X-MC-Unique: AfMgT85BONWmoGEc5pJUUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D741006AA4;
 Mon, 27 Sep 2021 21:56:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA8295D9D5;
 Mon, 27 Sep 2021 21:56:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] block/nbd: check that received handle is valid
Date: Mon, 27 Sep 2021 16:55:44 -0500
Message-Id: <20210927215545.3930309-20-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If we don't have active request, that waiting for this handle to be
received, we should report an error.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210902103805.25686-6-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 8ff6daf43d46..5ef462db1b7f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -58,6 +58,7 @@ typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
     bool receiving;         /* sleeping in the yield in nbd_receive_replies */
+    bool reply_possible;    /* reply header not yet received */
 } NBDClientRequest;

 typedef enum NBDClientState {
@@ -415,14 +416,7 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             return 0;
         }
         ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
-            /*
-             * We only check that ind2 request exists. But don't check
-             * whether it is now waiting for the reply header or
-             * not. We can't just check s->requests[ind2].receiving:
-             * ind2 request may wait in trying to lock
-             * receive_mutex. So that's a TODO.
-             */
+        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
@@ -468,6 +462,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
+    s->requests[i].reply_possible = true;

     request->handle = INDEX_TO_HANDLE(s, i);

-- 
2.31.1


