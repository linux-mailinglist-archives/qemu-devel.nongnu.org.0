Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F464CCAB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:52:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S57-0004hS-5m; Wed, 14 Dec 2022 08:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4a-00049P-Kz
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4Z-0003Re-5B
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WN2BIH5RB0UxqTU7KOCUu5Ltph8mel4R7vct0PWrDME=;
 b=GGAaXmSJaU7paiaKCTwpOhf4ezXiY/e/x9VSqenpUvNqmO2rY1gTEESejviSzBOMilvWqZ
 2BAtuxoa5aYGSDALDNMKVD28eTCUwCYIz1atHVU8YVAiPNgpMzKsw4zK3ecM4aNSgiAMUQ
 wwmrl1wUJmyKnTtY5bxwVJ2BRQQIMBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-r_qbeGrxNeSssa_S0SDTZw-1; Wed, 14 Dec 2022 08:45:19 -0500
X-MC-Unique: r_qbeGrxNeSssa_S0SDTZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5F4285A588;
 Wed, 14 Dec 2022 13:45:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5E5814171BE;
 Wed, 14 Dec 2022 13:45:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/51] block: Fix locking for bdrv_reopen_queue_child()
Date: Wed, 14 Dec 2022 14:44:12 +0100
Message-Id: <20221214134453.31665-11-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Callers don't agree whether bdrv_reopen_queue_child() should be called
with the AioContext lock held or not. Standardise on holding the lock
(as done by QMP blockdev-reopen and the replication block driver) and
fix bdrv_reopen() to do the same.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221118174110.55183-7-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index ce71545551..3266519455 100644
--- a/block.c
+++ b/block.c
@@ -4174,6 +4174,8 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
  * bs_queue, or the existing bs_queue being used.
  *
  * bs must be drained between bdrv_reopen_queue() and bdrv_reopen_multiple().
+ *
+ * To be called with bs->aio_context locked.
  */
 static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
                                                  BlockDriverState *bs,
@@ -4332,6 +4334,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     return bs_queue;
 }
 
+/* To be called with bs->aio_context locked */
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs,
                                     QDict *options, bool keep_old_opts)
@@ -4492,11 +4495,11 @@ int bdrv_reopen(BlockDriverState *bs, QDict *opts, bool keep_old_opts,
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


