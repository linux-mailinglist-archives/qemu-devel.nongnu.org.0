Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C816210FB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:39:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNs9-00086D-60; Tue, 08 Nov 2022 07:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrn-0007mF-Ov
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrh-000126-Rf
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbVD6LB6hd+aULt57ZpK1JUvQf7Q2WY8CUIRT+yvYFM=;
 b=dvHZHw1LwWkquPd+uV16L1ZcXa3IvYKpKrnL4CAEVfN8TQpPTsi2MUxMVHz764YH3mOnHf
 MzRlYY+Ifd9cKm4Eg8koziiabdSyVWpgOAxQvyy/8oV0Ze7ZAQS3iB8/Gc+fVm0v+Ivvez
 cnynSUyGDTYuGhuLaXHkiQFocoquof0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-PTdO1b-DN8-l4OLAZSj0Mg-1; Tue, 08 Nov 2022 07:38:04 -0500
X-MC-Unique: PTdO1b-DN8-l4OLAZSj0Mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C717C833AEF;
 Tue,  8 Nov 2022 12:38:03 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9DA69E70;
 Tue,  8 Nov 2022 12:38:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 08/13] stream: Replace subtree drain with a single node drain
Date: Tue,  8 Nov 2022 13:37:33 +0100
Message-Id: <20221108123738.530873-9-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 include/block/block-global-state.h |  3 +++
 block.c                            | 17 ++++++++++++++---
 block/stream.c                     | 20 ++++++++++----------
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index bb42ed9559..7923415d4e 100644
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
index 2f6b25875f..43b893dd6c 100644
--- a/block.c
+++ b/block.c
@@ -3395,14 +3395,15 @@ static int bdrv_set_backing_noperm(BlockDriverState *bs,
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
@@ -3412,7 +3413,17 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
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
index 694709bd25..81dcf5a417 100644
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
@@ -82,7 +85,7 @@ static int stream_prepare(Job *job)
             }
         }
 
-        bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
+        bdrv_set_backing_hd_drained(unfiltered_bs, base, &local_err);
         ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
         if (local_err) {
             error_report_err(local_err);
@@ -92,10 +95,7 @@ static int stream_prepare(Job *job)
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


