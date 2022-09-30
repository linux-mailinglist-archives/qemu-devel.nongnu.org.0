Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9D5F1068
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:03:05 +0200 (CEST)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJPk-0002ZR-L8
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFn-0006Z0-4a
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFl-0006eQ-Bq
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7czzlhi5w12m0DWfQP1MbMeBwia4vqarbxFxOZtN9k8=;
 b=XYJvjXBVQ56KlMwDRFmIpizYluLQNfmfu6Pu4iuSzwgdJg26npCrUkSXvHfgc8Ur+aCJ5v
 PXADEQP/JNVwVw5XtqlLUV+mXNQuXexMmMlC8zfdeRfDRJD0UJOg5hm0cjxmhwG6VTtrWI
 /knSO5d99ZzSPflPJFKRFMC67x6cUpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-CFAHD3LgPxejj9KNIBZSzA-1; Fri, 30 Sep 2022 12:52:41 -0400
X-MC-Unique: CFAHD3LgPxejj9KNIBZSzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C20101CC92;
 Fri, 30 Sep 2022 16:52:40 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C83717583;
 Fri, 30 Sep 2022 16:52:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 07/18] block: make serializing requests functions 'void'
Date: Fri, 30 Sep 2022 18:52:11 +0200
Message-Id: <20220930165222.249716-8-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: "Denis V. Lunev" <den@openvz.org>

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
Message-Id: <20220817083736.40981-3-den@openvz.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-io.h |  2 +-
 block/io.c                   | 23 +++++++----------------
 2 files changed, 8 insertions(+), 17 deletions(-)

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
-- 
2.37.3


