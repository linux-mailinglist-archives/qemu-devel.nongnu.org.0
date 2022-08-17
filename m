Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D252C596B7A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:41:57 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEce-0001IY-VH
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oOEZM-0004sZ-C6; Wed, 17 Aug 2022 04:38:32 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:35566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oOEZJ-0006Af-AV; Wed, 17 Aug 2022 04:38:32 -0400
Received: from [192.168.16.116] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oOEX9-00GAqg-VT;
 Wed, 17 Aug 2022 10:37:27 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 2/2] block: make serializing requests functions 'void'
Date: Wed, 17 Aug 2022 10:37:36 +0200
Message-Id: <20220817083736.40981-3-den@openvz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220817083736.40981-1-den@openvz.org>
References: <20220817083736.40981-1-den@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return codes of the following functions are never used in the code:
* bdrv_wait_serialising_requests_locked
* bdrv_wait_serialising_requests
* bdrv_make_request_serialising

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Peter Lieven <pl@kamp.de>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/io.c                   | 23 +++++++----------------
 include/block/block_int-io.h |  2 +-
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/block/io.c b/block/io.c
index 0a8cbefe86..51d8f943a4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -828,20 +828,16 @@ bdrv_find_conflicting_request(BdrvTrackedRequest *self)
 }
 
 /* Called with self->bs->reqs_lock held */
-static bool coroutine_fn
+static void coroutine_fn
 bdrv_wait_serialising_requests_locked(BdrvTrackedRequest *self)
 {
     BdrvTrackedRequest *req;
-    bool waited = false;
 
     while ((req = bdrv_find_conflicting_request(self))) {
         self->waiting_for = req;
         qemu_co_queue_wait(&req->wait_queue, &self->bs->reqs_lock);
         self->waiting_for = NULL;
-        waited = true;
     }
-
-    return waited;
 }
 
 /* Called with req->bs->reqs_lock held */
@@ -934,36 +930,31 @@ void bdrv_dec_in_flight(BlockDriverState *bs)
     bdrv_wakeup(bs);
 }
 
-static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self)
+static void coroutine_fn
+bdrv_wait_serialising_requests(BdrvTrackedRequest *self)
 {
     BlockDriverState *bs = self->bs;
-    bool waited = false;
 
     if (!qatomic_read(&bs->serialising_in_flight)) {
-        return false;
+        return;
     }
 
     qemu_co_mutex_lock(&bs->reqs_lock);
-    waited = bdrv_wait_serialising_requests_locked(self);
+    bdrv_wait_serialising_requests_locked(self);
     qemu_co_mutex_unlock(&bs->reqs_lock);
-
-    return waited;
 }
 
-bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
+void coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
                                                 uint64_t align)
 {
-    bool waited;
     IO_CODE();
 
     qemu_co_mutex_lock(&req->bs->reqs_lock);
 
     tracked_request_set_serialising(req, align);
-    waited = bdrv_wait_serialising_requests_locked(req);
+    bdrv_wait_serialising_requests_locked(req);
 
     qemu_co_mutex_unlock(&req->bs->reqs_lock);
-
-    return waited;
 }
 
 int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 91cdd61692..4b0b3e17ef 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -73,7 +73,7 @@ static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
     return bdrv_co_pwritev(child, offset, bytes, &qiov, flags);
 }
 
-bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
+void coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
                                                 uint64_t align);
 BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs);
 
-- 
2.32.0


