Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31A6EE6E2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:35:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMX5-0007wb-N9; Tue, 25 Apr 2023 13:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWk-0006kt-5d
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWg-0004Ib-2C
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+/knfoDy8T3MlsOXbU80GG1FTl1vSNiph6inn5lsn0=;
 b=MNYzqe5yUgjKdhKsfUD99FKttOReSF7fGrNVuCSKt9horusQs8sa/iq99/p6jQK83DJcxF
 lImeSZKrcBwV9TvYi+p9xAeuBizL6H09I/Icpom/uTM3rwKcPPbJqvHO80yh9BGPdvENO/
 ot4tx+FGXmr0o4UAM7fD1Bn207pRqqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-kZ6KMT7uM1mhHfZrEXPNYg-1; Tue, 25 Apr 2023 13:32:22 -0400
X-MC-Unique: kZ6KMT7uM1mhHfZrEXPNYg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 620D31C0512E;
 Tue, 25 Apr 2023 17:32:21 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2E3492B0F;
 Tue, 25 Apr 2023 17:32:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 13/20] block: Mark bdrv_co_get_allocated_file_size() and
 callers GRAPH_RDLOCK
Date: Tue, 25 Apr 2023 19:31:51 +0200
Message-Id: <20230425173158.574203-14-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_get_allocated_file_size() need to hold a reader lock for the
graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 7 +++++--
 include/block/block_int-common.h | 2 +-
 block.c                          | 4 +++-
 block/vmdk.c                     | 2 +-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 5dab88521d..fb2adb31c7 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -84,8 +84,11 @@ int64_t coroutine_mixed_fn bdrv_nb_sectors(BlockDriverState *bs);
 int64_t coroutine_fn GRAPH_RDLOCK bdrv_co_getlength(BlockDriverState *bs);
 int64_t co_wrapper_mixed_bdrv_rdlock bdrv_getlength(BlockDriverState *bs);
 
-int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs);
-int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
+int64_t coroutine_fn GRAPH_RDLOCK
+bdrv_co_get_allocated_file_size(BlockDriverState *bs);
+
+int64_t co_wrapper_bdrv_rdlock
+bdrv_get_allocated_file_size(BlockDriverState *bs);
 
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 6fb28cd8fa..6e0365d8f2 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -685,7 +685,7 @@ struct BlockDriver {
     int64_t coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_getlength)(
         BlockDriverState *bs);
 
-    int64_t coroutine_fn (*bdrv_co_get_allocated_file_size)(
+    int64_t coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_get_allocated_file_size)(
         BlockDriverState *bs);
 
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
diff --git a/block.c b/block.c
index abec940867..3ccb935950 100644
--- a/block.c
+++ b/block.c
@@ -5750,7 +5750,8 @@ exit:
  * sums the size of all data-bearing children.  (This excludes backing
  * children.)
  */
-static int64_t coroutine_fn bdrv_sum_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn GRAPH_RDLOCK
+bdrv_sum_allocated_file_size(BlockDriverState *bs)
 {
     BdrvChild *child;
     int64_t child_size, sum = 0;
@@ -5778,6 +5779,7 @@ int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         return -ENOMEDIUM;
diff --git a/block/vmdk.c b/block/vmdk.c
index 11b553ef25..fddbd1c86c 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2845,7 +2845,7 @@ static void vmdk_close(BlockDriverState *bs)
     error_free(s->migration_blocker);
 }
 
-static int64_t coroutine_fn
+static int64_t coroutine_fn GRAPH_RDLOCK
 vmdk_co_get_allocated_file_size(BlockDriverState *bs)
 {
     int i;
-- 
2.40.0


