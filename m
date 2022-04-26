Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56497510A2E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:17:50 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRd7-0003Sh-EH
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRau-0008Kx-0R
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRaq-0007gx-QQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffUmBBvR1gSg1T0sSF77O/Pq1KjYaK2gtjPpbdvx0R8=;
 b=C9aQKVYCAWUZ3FCuQ6Dkg2cFpIbQNjJvJxGYVLHNL4+c5LZUjZEBCWYgtM5XGrmMjZM6Sa
 odBT9bZ8jmqVTddBkLAMYspaVULBr3OS6WQejGYomumEQ9HorPy7cMEVqArSw92zUQ2iyz
 GAg6msu5b7Ri7yZnt+Fu928Rqb3YrjI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-6qutV5pPMiugRl13_SJawg-1; Tue, 26 Apr 2022 16:15:26 -0400
X-MC-Unique: 6qutV5pPMiugRl13_SJawg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2560F80005D;
 Tue, 26 Apr 2022 20:15:26 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 677D2556200;
 Tue, 26 Apr 2022 20:15:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] nbd: code motion and function renaming
Date: Tue, 26 Apr 2022 15:15:10 -0500
Message-Id: <20220426201514.170410-10-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Prepare for the next patch, so that the diff is less confusing.

nbd_client_connecting is moved closer to the definition point.

nbd_client_connecting_wait() is kept only for the reconnection
logic; when it is used to check if a request has to be reissued,
use the renamed function nbd_client_will_reconnect().  In the
next patch, the two cases will have different locking requirements.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220414175756.671165-7-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index cea77becba4d..3cba874b1cf5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -254,18 +254,15 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->open_timer, expire_time_ns);
 }

-static bool nbd_client_connecting(BDRVNBDState *s)
-{
-    NBDClientState state = qatomic_load_acquire(&s->state);
-    return state == NBD_CLIENT_CONNECTING_WAIT ||
-        state == NBD_CLIENT_CONNECTING_NOWAIT;
-}
-
 static bool nbd_client_connecting_wait(BDRVNBDState *s)
 {
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }

+static bool nbd_client_will_reconnect(BDRVNBDState *s)
+{
+    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
+}
 /*
  * Update @bs with information learned during a completed negotiation process.
  * Return failure if the server's advertised options are incompatible with the
@@ -355,6 +352,13 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     return 0;
 }

+static bool nbd_client_connecting(BDRVNBDState *s)
+{
+    NBDClientState state = qatomic_load_acquire(&s->state);
+    return state == NBD_CLIENT_CONNECTING_WAIT ||
+        state == NBD_CLIENT_CONNECTING_NOWAIT;
+}
+
 /* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
@@ -1190,7 +1194,7 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));

     return ret ? ret : request_ret;
 }
@@ -1249,7 +1253,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));

     return ret ? ret : request_ret;
 }
@@ -1407,7 +1411,7 @@ static int coroutine_fn nbd_client_co_block_status(
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));

     if (ret < 0 || request_ret < 0) {
         return ret ? ret : request_ret;
-- 
2.35.1


