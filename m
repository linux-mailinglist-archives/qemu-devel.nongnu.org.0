Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E46F6AC6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:03:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbd-0003sZ-9o; Thu, 04 May 2023 07:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbU-0003Nr-Lv
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbT-0004I1-47
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyC4UfHad+kz1MVbuLV290vv8pN3kMDozePOi0V/IbY=;
 b=FR2/oc5ukDWvx6SaELseUlZ4D7sBLMM3oWIy7vv23XD8kHHziFhbyDwstcgeoefJlhtiWi
 zy8vORzlkCF1TXxMZeAVr+zVXy9LIPFRA+z3wi1kb/aNEIB0enNhTVaOmOFU/oM4VNSAwy
 5ck7e+7UE9KP80uWxQ7NP0OHhKjRfVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-7vKJ2IbhMROxdiFaL7R6iQ-1; Thu, 04 May 2023 07:58:29 -0400
X-MC-Unique: 7vKJ2IbhMROxdiFaL7R6iQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19B80A0F387;
 Thu,  4 May 2023 11:58:29 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F11C6C15BAD;
 Thu,  4 May 2023 11:58:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 20/20] block: Mark bdrv_refresh_limits() and callers
 GRAPH_RDLOCK
Date: Thu,  4 May 2023 13:57:50 +0200
Message-Id: <20230504115750.54437-21-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
bdrv_refresh_limits() need to hold a reader lock for the graph because
it accesses the children list of a node.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block-global-state.h | 5 ++++-
 include/block/block_int-common.h   | 3 ++-
 block.c                            | 9 +++++++++
 block/io.c                         | 1 -
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index f234bca0b6..2d93423d35 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -133,7 +133,10 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
 BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
                                           const char *backing_file);
 void bdrv_refresh_filename(BlockDriverState *bs);
-void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp);
+
+void GRAPH_RDLOCK
+bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp);
+
 int bdrv_commit(BlockDriverState *bs);
 int bdrv_make_empty(BdrvChild *c, Error **errp);
 int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 024ded4fc2..4909876756 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -334,7 +334,8 @@ struct BlockDriver {
     int (*bdrv_debug_resume)(BlockDriverState *bs, const char *tag);
     bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
 
-    void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
+    void GRAPH_RDLOCK_PTR (*bdrv_refresh_limits)(
+        BlockDriverState *bs, Error **errp);
 
     /*
      * Returns 1 if newly created images are guaranteed to contain only
diff --git a/block.c b/block.c
index 1bc766c778..dad9a4fa43 100644
--- a/block.c
+++ b/block.c
@@ -1667,7 +1667,10 @@ bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv, const char *node_name,
         return ret;
     }
 
+    bdrv_graph_rdlock_main_loop();
     bdrv_refresh_limits(bs, NULL, &local_err);
+    bdrv_graph_rdunlock_main_loop();
+
     if (local_err) {
         error_propagate(errp, local_err);
         return -EINVAL;
@@ -3419,7 +3422,9 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
     }
 
 out:
+    bdrv_graph_rdlock_main_loop();
     bdrv_refresh_limits(parent_bs, tran, NULL);
+    bdrv_graph_rdunlock_main_loop();
 
     return 0;
 }
@@ -4917,7 +4922,9 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     qdict_del(bs->explicit_options, "backing");
     qdict_del(bs->options, "backing");
 
+    bdrv_graph_rdlock_main_loop();
     bdrv_refresh_limits(bs, NULL, NULL);
+    bdrv_graph_rdunlock_main_loop();
     bdrv_refresh_total_sectors(bs, bs->total_sectors);
 }
 
@@ -5316,7 +5323,9 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 out:
     tran_finalize(tran, ret);
 
+    bdrv_graph_rdlock_main_loop();
     bdrv_refresh_limits(bs_top, NULL, NULL);
+    bdrv_graph_rdunlock_main_loop();
 
     if (new_context && old_context != new_context) {
         aio_context_release(new_context);
diff --git a/block/io.c b/block/io.c
index 3bf9ef9d87..58557f2f96 100644
--- a/block/io.c
+++ b/block/io.c
@@ -160,7 +160,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
     bool have_limits;
 
     GLOBAL_STATE_CODE();
-    assume_graph_lock(); /* FIXME */
 
     if (tran) {
         BdrvRefreshLimitsState *s = g_new(BdrvRefreshLimitsState, 1);
-- 
2.40.1


