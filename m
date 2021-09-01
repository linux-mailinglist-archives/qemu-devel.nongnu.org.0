Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17843FDEB1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:31:34 +0200 (CEST)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSD7-0007MF-Nq
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzR-0005R3-K7
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzP-0003o0-KN
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptmW75KyIzcJGjJ/kFpJ8re3VNKXO76q5hbA08JudWY=;
 b=EJgwC63z3GzfFZhBYyQ+HsMC65WxnYsVluJuBjhZmpSiUObaFifJDrIYI08f4qolm/b5dN
 XM1+CMIhpP0o5AWS2YJ73P/Qz5LlWhJT/U8+/IKWWwGXNPHUOuXpFCk9hfXA2r7l4yW7by
 Gtl2xK6zIir5Reb1tiB3q8afwD1Xfvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-PP8YfaIFPqyhL1xZ0Lp3Wg-1; Wed, 01 Sep 2021 11:17:21 -0400
X-MC-Unique: PP8YfaIFPqyhL1xZ0Lp3Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 983B410053E7;
 Wed,  1 Sep 2021 15:17:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4161A60C9F;
 Wed,  1 Sep 2021 15:17:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/56] block/block-copy: introduce block_copy_set_copy_opts()
Date: Wed,  1 Sep 2021 17:15:50 +0200
Message-Id: <20210901151619.689075-28-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We'll need a possibility to set compress and use_copy_range options
after initialization of the state. So make corresponding part of
block_copy_state_new() separate and public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210824083856.17408-8-vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  3 +++
 block/block-copy.c         | 49 ++++++++++++++++++++++----------------
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 734389d32a..dca6c4ce36 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -28,6 +28,9 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp);
 
+/* Function should be called prior any actual copy request */
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 58b4345a5a..e83870ff81 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -315,6 +315,33 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
 }
 
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress)
+{
+    /* Keep BDRV_REQ_SERIALISING set (or not set) in block_copy_state_new() */
+    s->write_flags = (s->write_flags & BDRV_REQ_SERIALISING) |
+        (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
+
+    if (s->max_transfer < s->cluster_size) {
+        /*
+         * copy_range does not respect max_transfer. We don't want to bother
+         * with requests smaller than block-copy cluster size, so fallback to
+         * buffered copying (read and write respect max_transfer on their
+         * behalf).
+         */
+        s->method = COPY_READ_WRITE_CLUSTER;
+    } else if (compress) {
+        /* Compression supports only cluster-size writes and no copy-range. */
+        s->method = COPY_READ_WRITE_CLUSTER;
+    } else {
+        /*
+         * If copy range enabled, start with COPY_RANGE_SMALL, until first
+         * successful copy_range (look at block_copy_do_copy).
+         */
+        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
+    }
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp)
@@ -353,32 +380,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
-            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
+        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
                                     cluster_size),
     };
 
-    if (s->max_transfer < cluster_size) {
-        /*
-         * copy_range does not respect max_transfer. We don't want to bother
-         * with requests smaller than block-copy cluster size, so fallback to
-         * buffered copying (read and write respect max_transfer on their
-         * behalf).
-         */
-        s->method = COPY_READ_WRITE_CLUSTER;
-    } else if (compress) {
-        /* Compression supports only cluster-size writes and no copy-range. */
-        s->method = COPY_READ_WRITE_CLUSTER;
-    } else {
-        /*
-         * If copy range enabled, start with COPY_RANGE_SMALL, until first
-         * successful copy_range (look at block_copy_do_copy).
-         */
-        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
-    }
+    block_copy_set_copy_opts(s, use_copy_range, compress);
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-- 
2.31.1


