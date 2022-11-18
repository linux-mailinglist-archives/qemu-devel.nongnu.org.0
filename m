Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B762FBDE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:43:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Ni-0007Dw-Hn; Fri, 18 Nov 2022 12:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5NE-0006iV-Mv
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N5-0002YC-8w
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFw2T9AG9d1MVPnF9NkPq89W1XqodJv1ETmeGgtfDFA=;
 b=CaQFZwebFT4sVFOEq+b452GEj5PNMfPlMoTU6IUjeQLVAdl4biakSbpz4BcL3bvEu0Yc1h
 pC+UYw63hU/HNoCGBH5IEnQsmcDfMjOXPeFMCaNLSXr2X3u09+tlhHmYMWuztQye3mTNUj
 yX6mjjEIrbRF9imTfdC+2h7FInB3pzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-ySYYfzz1NZGRgW35503rlw-1; Fri, 18 Nov 2022 12:41:35 -0500
X-MC-Unique: ySYYfzz1NZGRgW35503rlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 772B9811E7A;
 Fri, 18 Nov 2022 17:41:35 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3F5492B04;
 Fri, 18 Nov 2022 17:41:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] stream: Replace subtree drain with a single node
 drain
Date: Fri, 18 Nov 2022 18:41:04 +0100
Message-Id: <20221118174110.55183-10-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The subtree drain was introduced in commit b1e1af394d9 as a way to avoid
graph changes between finding the base node and changing the block graph
as necessary on completion of the image streaming job.

The block graph could change between these two points because
bdrv_set_backing_hd() first drains the parent node, which involved
polling and can do anything.

Subtree draining was an imperfect way to make this less likely (because
with it, fewer callbacks are called during this window). Everyone agreed
that it's not really the right solution, and it was only committed as a
stopgap solution.

This replaces the subtree drain with a solution that simply drains the
parent node before we try to find the base node, and then call a version
of bdrv_set_backing_hd() that doesn't drain, but just asserts that the
parent node is already drained.

This way, any graph changes caused by draining happen before we start
looking at the graph and things stay consistent between finding the base
node and changing the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-global-state.h |  3 +++
 block.c                            | 17 ++++++++++++++---
 block/stream.c                     | 26 ++++++++++++++++----------
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index c7bd4a2088..00e0cf8aea 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -82,6 +82,9 @@ int bdrv_open_file_child(const char *filename,
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp);
+int bdrv_set_backing_hd_drained(BlockDriverState *bs,
+                                BlockDriverState *backing_hd,
+                                Error **errp);
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
diff --git a/block.c b/block.c
index 298954d514..01a27bd77f 100644
--- a/block.c
+++ b/block.c
@@ -3405,14 +3405,15 @@ static int bdrv_set_backing_noperm(BlockDriverState *bs,
     return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
 }
 
-int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                        Error **errp)
+int bdrv_set_backing_hd_drained(BlockDriverState *bs,
+                                BlockDriverState *backing_hd,
+                                Error **errp)
 {
     int ret;
     Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
-    bdrv_drained_begin(bs);
+    assert(bs->quiesce_counter > 0);
 
     ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
     if (ret < 0) {
@@ -3422,7 +3423,17 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     ret = bdrv_refresh_perms(bs, errp);
 out:
     tran_finalize(tran, ret);
+    return ret;
+}
 
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
+{
+    int ret;
+    GLOBAL_STATE_CODE();
+
+    bdrv_drained_begin(bs);
+    ret = bdrv_set_backing_hd_drained(bs, backing_hd, errp);
     bdrv_drained_end(bs);
 
     return ret;
diff --git a/block/stream.c b/block/stream.c
index 694709bd25..8744ad103f 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -64,13 +64,16 @@ static int stream_prepare(Job *job)
     bdrv_cor_filter_drop(s->cor_filter_bs);
     s->cor_filter_bs = NULL;
 
-    bdrv_subtree_drained_begin(s->above_base);
+    /*
+     * bdrv_set_backing_hd() requires that unfiltered_bs is drained. Drain
+     * already here and use bdrv_set_backing_hd_drained() instead because
+     * the polling during drained_begin() might change the graph, and if we do
+     * this only later, we may end up working with the wrong base node (or it
+     * might even have gone away by the time we want to use it).
+     */
+    bdrv_drained_begin(unfiltered_bs);
 
     base = bdrv_filter_or_cow_bs(s->above_base);
-    if (base) {
-        bdrv_ref(base);
-    }
-
     unfiltered_base = bdrv_skip_filters(base);
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -82,7 +85,13 @@ static int stream_prepare(Job *job)
             }
         }
 
-        bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
+        bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
+
+        /*
+         * This call will do I/O, so the graph can change again from here on.
+         * We have already completed the graph change, so we are not in danger
+         * of operating on the wrong node any more if this happens.
+         */
         ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
         if (local_err) {
             error_report_err(local_err);
@@ -92,10 +101,7 @@ static int stream_prepare(Job *job)
     }
 
 out:
-    if (base) {
-        bdrv_unref(base);
-    }
-    bdrv_subtree_drained_end(s->above_base);
+    bdrv_drained_end(unfiltered_bs);
     return ret;
 }
 
-- 
2.38.1


