Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28B64CCA2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5V-0004xD-F6; Wed, 14 Dec 2022 08:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4l-0004Nu-VT
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4h-0003Vw-O7
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnPV/ZPt9RpAZYDdgPJaNIIgcql8+y0WmYiZEJS/zcU=;
 b=OJTNxJ2aWfRQ9Os9l1TF1hW2LNStTaFe8zQBRYq97amoos2BGgGeTxqXU76HKdxUiflLZT
 7aPNpwLphSWWX1zPbtzHmTtjyIiic0U5n6yxPyFYnhbcFwakBdqZMPx0jfOM1rlLzff1Q2
 b4Bk6GwD9RNgJ1/T7ndiJeJ48Wc4jaE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-LzckEaQCPwywoS23vos1Rg-1; Wed, 14 Dec 2022 08:45:28 -0500
X-MC-Unique: LzckEaQCPwywoS23vos1Rg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9881E101A521;
 Wed, 14 Dec 2022 13:45:27 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D84A314171BE;
 Wed, 14 Dec 2022 13:45:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 19/51] block: Remove poll parameter from
 bdrv_parent_drained_begin_single()
Date: Wed, 14 Dec 2022 14:44:21 +0100
Message-Id: <20221214134453.31665-20-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

All callers of bdrv_parent_drained_begin_single() pass poll=false now,
so we don't need the parameter any more.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221118174110.55183-16-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h | 5 ++---
 block.c                  | 4 ++--
 block/io.c               | 8 ++------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 65e6d2569b..92aaa7c1e9 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -287,10 +287,9 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
 /**
  * bdrv_parent_drained_begin_single:
  *
- * Begin a quiesced section for the parent of @c. If @poll is true, wait for
- * any pending activity to cease.
+ * Begin a quiesced section for the parent of @c.
  */
-void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
+void bdrv_parent_drained_begin_single(BdrvChild *c);
 
 /**
  * bdrv_parent_drained_poll_single:
diff --git a/block.c b/block.c
index faaeca8472..97073092c4 100644
--- a/block.c
+++ b/block.c
@@ -2417,7 +2417,7 @@ static void bdrv_replace_child_abort(void *opaque)
          * new_bs drained when calling bdrv_replace_child_tran() is not a
          * requirement any more.
          */
-        bdrv_parent_drained_begin_single(s->child, false);
+        bdrv_parent_drained_begin_single(s->child);
         assert(!bdrv_parent_drained_poll_single(s->child));
     }
     assert(s->child->quiesced_parent);
@@ -3090,7 +3090,7 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
      * a problem, we already did this), but it will still poll until the parent
      * is fully quiesced, so it will not be negatively affected either.
      */
-    bdrv_parent_drained_begin_single(new_child, false);
+    bdrv_parent_drained_begin_single(new_child);
     bdrv_replace_child_noperm(new_child, child_bs);
 
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
diff --git a/block/io.c b/block/io.c
index ae64830eac..38e57d1f67 100644
--- a/block/io.c
+++ b/block/io.c
@@ -53,7 +53,7 @@ static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore)
         if (c == ignore) {
             continue;
         }
-        bdrv_parent_drained_begin_single(c, false);
+        bdrv_parent_drained_begin_single(c);
     }
 }
 
@@ -105,9 +105,8 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
     return busy;
 }
 
-void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
+void bdrv_parent_drained_begin_single(BdrvChild *c)
 {
-    AioContext *ctx = bdrv_child_get_parent_aio_context(c);
     IO_OR_GS_CODE();
 
     assert(!c->quiesced_parent);
@@ -116,9 +115,6 @@ void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
     }
-    if (poll) {
-        AIO_WAIT_WHILE(ctx, bdrv_parent_drained_poll_single(c));
-    }
 }
 
 static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
-- 
2.38.1


