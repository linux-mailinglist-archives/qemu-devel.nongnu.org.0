Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341A62FBD9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Nz-0007ML-4j; Fri, 18 Nov 2022 12:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5NI-0006rQ-Mc
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:42:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N9-0002Yv-BO
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjw36sLhD0jdWx8N0NQKgoE6ortEtOlsf3vy73cWMg8=;
 b=YyntmQlwyWZpaQQykfriA588BhycewChRTYg7mNn0k+7srivSrqPZDh1TSNEkerGdddAW3
 DVU6r88l19vslyKY4t4Oolli2P+AFyee0IErd5zgEQ8kbbf9drHjb51CZlHBnAfUvNNekg
 QTsEJ338A2n5DfN0en9/7rNSZtMAxaM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-i9Z5KpMZNnqHAN72RDxLyg-1; Fri, 18 Nov 2022 12:41:45 -0500
X-MC-Unique: i9Z5KpMZNnqHAN72RDxLyg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A870B1C05132;
 Fri, 18 Nov 2022 17:41:44 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D9A492B04;
 Fri, 18 Nov 2022 17:41:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] block: Remove poll parameter from
 bdrv_parent_drained_begin_single()
Date: Fri, 18 Nov 2022 18:41:10 +0100
Message-Id: <20221118174110.55183-16-kwolf@redhat.com>
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

All callers of bdrv_parent_drained_begin_single() pass poll=false now,
so we don't need the parameter any more.

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
index 3f12aba6ce..8c9f4ee37c 100644
--- a/block.c
+++ b/block.c
@@ -2419,7 +2419,7 @@ static void bdrv_replace_child_abort(void *opaque)
          * new_bs drained when calling bdrv_replace_child_tran() is not a
          * requirement any more.
          */
-        bdrv_parent_drained_begin_single(s->child, false);
+        bdrv_parent_drained_begin_single(s->child);
         assert(!bdrv_parent_drained_poll_single(s->child));
     }
     assert(s->child->quiesced_parent);
@@ -3061,7 +3061,7 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
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


