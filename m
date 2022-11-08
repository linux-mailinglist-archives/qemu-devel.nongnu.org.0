Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CD62110E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNsS-0008Or-SB; Tue, 08 Nov 2022 07:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNs0-0007uu-JP
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrr-0001XX-Th
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5AvUSk33icUn6VLINECmBDRqlVEXNjmiajH7cm7YfA=;
 b=HdxESQ743KJrJECj8MwtFnfn9sqKKbKiWgqxKYvQHiLmmTPRYUpFY/8uzTBXClcktG0sqs
 yprQNrluuOhBsSHdZpotWpGmjWsmlO/10bP5l0j4ovia3SXeYFqaUH5kC5Ej7/HowbxXZ0
 gwcBSVQSvwcY/88xjNjGY6du6JasOLc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-zneTLLdwPRql8HqzNSq3dA-1; Tue, 08 Nov 2022 07:38:11 -0500
X-MC-Unique: zneTLLdwPRql8HqzNSq3dA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3D7A1C07557;
 Tue,  8 Nov 2022 12:38:10 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9155210197;
 Tue,  8 Nov 2022 12:38:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 13/13] block: Remove poll parameter from
 bdrv_parent_drained_begin_single()
Date: Tue,  8 Nov 2022 13:37:38 +0100
Message-Id: <20221108123738.530873-14-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 block/io.c               | 7 ++-----
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index ddce8550a9..35669f0e62 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -285,10 +285,9 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
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
index 12039e9b8a..c200f7afa0 100644
--- a/block.c
+++ b/block.c
@@ -2409,7 +2409,7 @@ static void bdrv_replace_child_abort(void *opaque)
          * new_bs drained when calling bdrv_replace_child_tran() is not a
          * requirement any more.
          */
-        bdrv_parent_drained_begin_single(s->child, false);
+        bdrv_parent_drained_begin_single(s->child);
         assert(!bdrv_parent_drained_poll_single(s->child));
     }
     assert(s->child->parent_quiesce_counter);
@@ -3016,7 +3016,7 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
      * bdrv_replace_child_noperm() will undrain it if the child node is not
      * drained. The child was only just created, so polling is not necessary.
      */
-    bdrv_parent_drained_begin_single(new_child, false);
+    bdrv_parent_drained_begin_single(new_child);
     bdrv_replace_child_noperm(new_child, child_bs);
 
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
diff --git a/block/io.c b/block/io.c
index d0f641926f..9bcb19e5ee 100644
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
 
@@ -103,7 +103,7 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore)
     return busy;
 }
 
-void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
+void bdrv_parent_drained_begin_single(BdrvChild *c)
 {
     IO_OR_GS_CODE();
     assert(c->parent_quiesce_counter == 0);
@@ -111,9 +111,6 @@ void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
     }
-    if (poll) {
-        BDRV_POLL_WHILE(c->bs, bdrv_parent_drained_poll_single(c));
-    }
 }
 
 static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
-- 
2.38.1


