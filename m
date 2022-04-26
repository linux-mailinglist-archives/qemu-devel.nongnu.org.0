Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F39510A49
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:20:26 +0200 (CEST)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRfd-0001LW-Lo
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRay-0008O6-5V
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaw-0007ke-7g
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NWCrW8c/jl6KkJ2RV1ObtlFqCzDEFW+1nyah64b4neQ=;
 b=iaXicE/uhnPp70r2Ss2ptR6W7BfG7pDv7Gl99YLICTZ0Icn0rhItyRBbuYS9HWeU96hoaC
 YlWOhcBi58iuRmoln9EVizs4hRgyoeFGScp1OKM1tYX80ROUtlSmz1QU4ZxiyvAQpQlaCZ
 pdv0rCWCPUNbtK7z2IgcYrwAgr+T+Q8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-G5nH3KnaNhiAlnpUPw8f4A-1; Tue, 26 Apr 2022 16:15:28 -0400
X-MC-Unique: G5nH3KnaNhiAlnpUPw8f4A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6FF6857AA6;
 Tue, 26 Apr 2022 20:15:27 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FC8F556200;
 Tue, 26 Apr 2022 20:15:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] nbd: take receive_mutex when reading requests[].receiving
Date: Tue, 26 Apr 2022 15:15:12 -0500
Message-Id: <20220426201514.170410-12-eblake@redhat.com>
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

requests[].receiving is set by nbd_receive_replies() under the receive_mutex;
Read it under the same mutex as well.  Waking up receivers on errors happens
after each reply finishes processing, in nbd_co_receive_one_chunk().
If there is no currently-active reply, there are two cases:

* either there is no active request at all, in which case no
element of request[] can have .receiving = true

* or nbd_receive_replies() must be running and owns receive_mutex;
in that case it will get back to nbd_co_receive_one_chunk() because
the socket has been shutdown, and all waiting coroutines will wake up
in turn.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-9-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a5c690cef76b..3bfcf4d97c42 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -131,6 +131,7 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }

+/* Called with s->receive_mutex taken.  */
 static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
@@ -142,12 +143,13 @@ static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
     return false;
 }

-static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
+static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s)
 {
     int i;

+    QEMU_LOCK_GUARD(&s->receive_mutex);
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        if (nbd_recv_coroutine_wake_one(&s->requests[i]) && !all) {
+        if (nbd_recv_coroutine_wake_one(&s->requests[i])) {
             return;
         }
     }
@@ -168,8 +170,6 @@ static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
     } else {
         s->state = NBD_CLIENT_QUIT;
     }
-
-    nbd_recv_coroutines_wake(s, true);
 }

 static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
@@ -432,11 +432,10 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)

             qemu_coroutine_yield();
             /*
-             * We may be woken for 3 reasons:
+             * We may be woken for 2 reasons:
              * 1. From this function, executing in parallel coroutine, when our
              *    handle is received.
-             * 2. From nbd_channel_error(), when connection is lost.
-             * 3. From nbd_co_receive_one_chunk(), when previous request is
+             * 2. From nbd_co_receive_one_chunk(), when previous request is
              *    finished and s->reply.handle set to 0.
              * Anyway, it's OK to lock the mutex and go to the next iteration.
              */
@@ -928,7 +927,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     }
     s->reply.handle = 0;

-    nbd_recv_coroutines_wake(s, false);
+    nbd_recv_coroutines_wake(s);

     return ret;
 }
-- 
2.35.1


