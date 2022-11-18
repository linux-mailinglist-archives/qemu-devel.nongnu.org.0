Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6562FBDA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5N0-0006Dk-3q; Fri, 18 Nov 2022 12:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mx-0006Cg-G0
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5Mv-0002Vr-O9
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1TRrg66qOh8IxIlA+Vbaf9y3NkiX4nKpJe3iJJY+54=;
 b=cQm9ecScWfgQfYRdwhh+MkkMdz7gupN5iLLD2wt/BylEuNez6LL1eHh8F57fEPs7f5X5CP
 c3XeHk+/KsjdYziue97cUBl3AXRfcSldN0s72cytQOSAa4+Q4IKMN5t1lXEOxCtB++rE6/
 0iF1P97S4tuNk3PmHHVJEvLZXBQO+6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-UBAGYm6IPeCC-Mc5CL5F7w-1; Fri, 18 Nov 2022 12:41:31 -0500
X-MC-Unique: UBAGYm6IPeCC-Mc5CL5F7w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B77D884341;
 Fri, 18 Nov 2022 17:41:31 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE1E0492B04;
 Fri, 18 Nov 2022 17:41:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] block: Fix locking for bdrv_reopen_queue_child()
Date: Fri, 18 Nov 2022 18:41:01 +0100
Message-Id: <20221118174110.55183-7-kwolf@redhat.com>
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

Callers don't agree whether bdrv_reopen_queue_child() should be called
with the AioContext lock held or not. Standardise on holding the lock
(as done by QMP blockdev-reopen and the replication block driver) and
fix bdrv_reopen() to do the same.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 214e5055a5..191dfc5d0c 100644
--- a/block.c
+++ b/block.c
@@ -4153,6 +4153,8 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
  * bs_queue, or the existing bs_queue being used.
  *
  * bs must be drained between bdrv_reopen_queue() and bdrv_reopen_multiple().
+ *
+ * To be called with bs->aio_context locked.
  */
 static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
                                                  BlockDriverState *bs,
@@ -4311,6 +4313,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     return bs_queue;
 }
 
+/* To be called with bs->aio_context locked */
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs,
                                     QDict *options, bool keep_old_opts)
@@ -4475,11 +4478,11 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
     GLOBAL_STATE_CODE();
 
     bdrv_subtree_drained_begin(bs);
+    queue = bdrv_reopen_queue(NULL, bs, opts, keep_old_opts);
+
     if (ctx != qemu_get_aio_context()) {
         aio_context_release(ctx);
     }
-
-    queue = bdrv_reopen_queue(NULL, bs, opts, keep_old_opts);
     ret = bdrv_reopen_multiple(queue, errp);
 
     if (ctx != qemu_get_aio_context()) {
-- 
2.38.1


