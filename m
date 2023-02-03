Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFC689E27
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxuC-0007gS-Dj; Fri, 03 Feb 2023 10:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu9-0007eb-IS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu8-0005PQ-5b
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbZs8InVURnoMKD74IuoMRwN06NholNMEjHQObAQmSU=;
 b=VCnL0AJvGxtTC7V1AvZZ3D5B3BPwCdooqUVD5LhA3hg6l6RS5aMgvexr7Hn+gSCW0cphe5
 95l5FBb1Z3uQExuOo5dIqqTcjlOcrOvQ6/WyA3EZpYind1iPBBX2Qj8XbyVsuhcJO9cg8V
 BR/pBVEIzLGBfTd850NlP8TMQ6t31pw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-KHXVru0HNvKLhn8mnvR0rA-1; Fri, 03 Feb 2023 10:23:04 -0500
X-MC-Unique: KHXVru0HNvKLhn8mnvR0rA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D80E887A9E7;
 Fri,  3 Feb 2023 15:23:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF06040168BD;
 Fri,  3 Feb 2023 15:23:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 21/23] block: Mark bdrv_co_delete_file() and callers
 GRAPH_RDLOCK
Date: Fri,  3 Feb 2023 16:22:00 +0100
Message-Id: <20230203152202.49054-22-kwolf@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_delete_file() need to hold a reader lock for the graph.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 8 ++++++--
 include/block/block_int-common.h | 4 ++--
 block.c                          | 1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index bf2748011e..a195a9fb11 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -90,8 +90,12 @@ int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
-int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
-void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs);
+
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
+
+void coroutine_fn GRAPH_RDLOCK
+bdrv_co_delete_file_noerr(BlockDriverState *bs);
 
 
 /* async block I/O */
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 88d9897c97..257a9d18c6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -649,8 +649,8 @@ struct BlockDriver {
     int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_flush)(BlockDriverState *bs);
 
     /* Delete a created file. */
-    int coroutine_fn (*bdrv_co_delete_file)(BlockDriverState *bs,
-                                            Error **errp);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_delete_file)(
+        BlockDriverState *bs, Error **errp);
 
     /*
      * Flushes all data that was already written to the OS all the way down to
diff --git a/block.c b/block.c
index e2da543f3a..1e378e881d 100644
--- a/block.c
+++ b/block.c
@@ -740,6 +740,7 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
 
     IO_CODE();
     assert(bs != NULL);
+    assert_bdrv_graph_readable();
 
     if (!bs->drv) {
         error_setg(errp, "Block node '%s' is not opened", bs->filename);
-- 
2.38.1


