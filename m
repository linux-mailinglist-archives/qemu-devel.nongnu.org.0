Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05840CC50
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:06:23 +0200 (CEST)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZIc-0004W1-Bk
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6l-0006qM-AN
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6j-0006y2-MO
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5k33/WjhnjqrPOeMVHgyyNGwRokJxqIE8rdiNy64aY=;
 b=cw7145y1FnjYF7jc+FT84hpOnZ+zwCmsRtJVamEUUpI7aWsuw1macFpEm8eouqbik2c6So
 xrjA2Di+HfXnbsvwEJtt61B+jENN7KxV74FcsnlBHtMCPoNXYQSZKDwRbxpNlMn9qPYcNB
 TB6nQem2Fzu1lKM79Ct6xs7wxTE6MhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-Ghs7VUoTNGK2-mGU7iHFWg-1; Wed, 15 Sep 2021 13:54:02 -0400
X-MC-Unique: Ghs7VUoTNGK2-mGU7iHFWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E5E802928;
 Wed, 15 Sep 2021 17:54:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF06810016FB;
 Wed, 15 Sep 2021 17:54:00 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/32] qcow2: refactor handle_dependencies() loop body
Date: Wed, 15 Sep 2021 19:53:05 +0200
Message-Id: <20210915175318.853225-20-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

No logic change, just prepare for the following commit. While being
here do also small grammar fix in a comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210824101517.59802-3-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-cluster.c | 49 ++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..9917e5c28c 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1400,29 +1400,36 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
 
         if (end <= old_start || start >= old_end) {
             /* No intersection */
-        } else {
-            if (start < old_start) {
-                /* Stop at the start of a running allocation */
-                bytes = old_start - start;
-            } else {
-                bytes = 0;
-            }
+            continue;
+        }
 
-            /* Stop if already an l2meta exists. After yielding, it wouldn't
-             * be valid any more, so we'd have to clean up the old L2Metas
-             * and deal with requests depending on them before starting to
-             * gather new ones. Not worth the trouble. */
-            if (bytes == 0 && *m) {
-                *cur_bytes = 0;
-                return 0;
-            }
+        /* Conflict */
 
-            if (bytes == 0) {
-                /* Wait for the dependency to complete. We need to recheck
-                 * the free/allocated clusters when we continue. */
-                qemu_co_queue_wait(&old_alloc->dependent_requests, &s->lock);
-                return -EAGAIN;
-            }
+        if (start < old_start) {
+            /* Stop at the start of a running allocation */
+            bytes = old_start - start;
+        } else {
+            bytes = 0;
+        }
+
+        /*
+         * Stop if an l2meta already exists. After yielding, it wouldn't
+         * be valid any more, so we'd have to clean up the old L2Metas
+         * and deal with requests depending on them before starting to
+         * gather new ones. Not worth the trouble.
+         */
+        if (bytes == 0 && *m) {
+            *cur_bytes = 0;
+            return 0;
+        }
+
+        if (bytes == 0) {
+            /*
+             * Wait for the dependency to complete. We need to recheck
+             * the free/allocated clusters when we continue.
+             */
+            qemu_co_queue_wait(&old_alloc->dependent_requests, &s->lock);
+            return -EAGAIN;
         }
     }
 
-- 
2.31.1


