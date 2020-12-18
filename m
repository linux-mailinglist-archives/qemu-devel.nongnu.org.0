Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96D2DE66A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:21:41 +0100 (CET)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHZd-0002PG-0Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRj-0002KI-T6
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRT-0005KO-DQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JlaYswQA0vvc45miU+Q8W6Iwdxog2uKkMMyy708v14=;
 b=GMkMdstkeF4unJGGn9hHryBJXbEWrSTMKEm/lLFCqa2mfh+nr41nulMNychtrsG+TTqsgI
 QLSUWoG74Ndwjn4iMwbgDI8EsoNyE8unogdPhLBVhEfdXuUJAqIDl/vSv7bFXB0Ut5E6ZM
 BPx8BZCLzUuLDbGNDfscfdO3TClZ8Cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-helDwy9vO_KdZ8-qemTYvw-1; Fri, 18 Dec 2020 10:13:11 -0500
X-MC-Unique: helDwy9vO_KdZ8-qemTYvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F367B8102;
 Fri, 18 Dec 2020 15:13:10 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C3237A0;
 Fri, 18 Dec 2020 15:13:10 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/30] block/io: bdrv_wait_serialising_requests_locked: drop
 extra bs arg
Date: Fri, 18 Dec 2020 16:12:27 +0100
Message-Id: <20201218151249.715731-9-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bs is linked in req, so no needs to pass it separately. Most of
tracked-requests API doesn't have bs argument. Actually, after this
patch only tracked_request_begin has it, but it's for purpose.

While being here, also add a comment about what "_locked" is.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201021145859.11201-5-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/io.c b/block/io.c
index 640136b8bc..d7015378a3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -788,16 +788,16 @@ bdrv_find_conflicting_request(BdrvTrackedRequest *self)
     return NULL;
 }
 
+/* Called with self->bs->reqs_lock held */
 static bool coroutine_fn
-bdrv_wait_serialising_requests_locked(BlockDriverState *bs,
-                                      BdrvTrackedRequest *self)
+bdrv_wait_serialising_requests_locked(BdrvTrackedRequest *self)
 {
     BdrvTrackedRequest *req;
     bool waited = false;
 
     while ((req = bdrv_find_conflicting_request(self))) {
         self->waiting_for = req;
-        qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
+        qemu_co_queue_wait(&req->wait_queue, &self->bs->reqs_lock);
         self->waiting_for = NULL;
         waited = true;
     }
@@ -821,7 +821,7 @@ bool bdrv_mark_request_serialising(BdrvTrackedRequest *req, uint64_t align)
 
     req->overlap_offset = MIN(req->overlap_offset, overlap_offset);
     req->overlap_bytes = MAX(req->overlap_bytes, overlap_bytes);
-    waited = bdrv_wait_serialising_requests_locked(bs, req);
+    waited = bdrv_wait_serialising_requests_locked(req);
     qemu_co_mutex_unlock(&bs->reqs_lock);
     return waited;
 }
@@ -903,7 +903,7 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     }
 
     qemu_co_mutex_lock(&bs->reqs_lock);
-    waited = bdrv_wait_serialising_requests_locked(bs, self);
+    waited = bdrv_wait_serialising_requests_locked(self);
     qemu_co_mutex_unlock(&bs->reqs_lock);
 
     return waited;
-- 
2.29.2


