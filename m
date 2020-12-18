Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D430C2DE651
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:16:14 +0100 (CET)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHUL-0003p4-TM
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRS-0001nb-Ev
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRQ-0005J7-Gq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjNjrx90XKG//IjNFwwul7DqKmA9bmAOojMsq5hElc8=;
 b=Uu4wlKgAbyLpuJiP6dMP+NXdumTp6I96inCFxxRKP6Ky6UTO8D/oxOByF2crgc1dIiex6R
 PwE/bbn+/58qdpFcdriKSq3H0/rqWxC87BGf0DK+2sB3Wqoc763Jyr7SvnNeMvzpeODWXk
 1CaiwYZYLIdBmzpgOBeyb39OOaXoaEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-swVfubwrPXm_Ek86nJHTnw-1; Fri, 18 Dec 2020 10:13:09 -0500
X-MC-Unique: swVfubwrPXm_Ek86nJHTnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82663B8101;
 Fri, 18 Dec 2020 15:13:08 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F632C154;
 Fri, 18 Dec 2020 15:13:07 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/30] block/io: split out bdrv_find_conflicting_request
Date: Fri, 18 Dec 2020 16:12:26 +0100
Message-Id: <20201218151249.715731-8-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

To be reused in separate.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201021145859.11201-4-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 71 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/block/io.c b/block/io.c
index 27370107b2..640136b8bc 100644
--- a/block/io.c
+++ b/block/io.c
@@ -754,43 +754,54 @@ static bool tracked_request_overlaps(BdrvTrackedRequest *req,
     return true;
 }
 
+/* Called with self->bs->reqs_lock held */
+static BdrvTrackedRequest *
+bdrv_find_conflicting_request(BdrvTrackedRequest *self)
+{
+    BdrvTrackedRequest *req;
+
+    QLIST_FOREACH(req, &self->bs->tracked_requests, list) {
+        if (req == self || (!req->serialising && !self->serialising)) {
+            continue;
+        }
+        if (tracked_request_overlaps(req, self->overlap_offset,
+                                     self->overlap_bytes))
+        {
+            /*
+             * Hitting this means there was a reentrant request, for
+             * example, a block driver issuing nested requests.  This must
+             * never happen since it means deadlock.
+             */
+            assert(qemu_coroutine_self() != req->co);
+
+            /*
+             * If the request is already (indirectly) waiting for us, or
+             * will wait for us as soon as it wakes up, then just go on
+             * (instead of producing a deadlock in the former case).
+             */
+            if (!req->waiting_for) {
+                return req;
+            }
+        }
+    }
+
+    return NULL;
+}
+
 static bool coroutine_fn
 bdrv_wait_serialising_requests_locked(BlockDriverState *bs,
                                       BdrvTrackedRequest *self)
 {
     BdrvTrackedRequest *req;
-    bool retry;
     bool waited = false;
 
-    do {
-        retry = false;
-        QLIST_FOREACH(req, &bs->tracked_requests, list) {
-            if (req == self || (!req->serialising && !self->serialising)) {
-                continue;
-            }
-            if (tracked_request_overlaps(req, self->overlap_offset,
-                                         self->overlap_bytes))
-            {
-                /* Hitting this means there was a reentrant request, for
-                 * example, a block driver issuing nested requests.  This must
-                 * never happen since it means deadlock.
-                 */
-                assert(qemu_coroutine_self() != req->co);
-
-                /* If the request is already (indirectly) waiting for us, or
-                 * will wait for us as soon as it wakes up, then just go on
-                 * (instead of producing a deadlock in the former case). */
-                if (!req->waiting_for) {
-                    self->waiting_for = req;
-                    qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
-                    self->waiting_for = NULL;
-                    retry = true;
-                    waited = true;
-                    break;
-                }
-            }
-        }
-    } while (retry);
+    while ((req = bdrv_find_conflicting_request(self))) {
+        self->waiting_for = req;
+        qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
+        self->waiting_for = NULL;
+        waited = true;
+    }
+
     return waited;
 }
 
-- 
2.29.2


