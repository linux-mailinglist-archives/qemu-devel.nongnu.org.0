Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADED6EE6E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:36:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMXD-0008KQ-J8; Tue, 25 Apr 2023 13:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWr-00074W-Rg
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWp-0004M4-7y
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9j5V4899zaEUbii13wNh//xksGF0atUNQEVr/ORyxuY=;
 b=FIH66LkyyeukYOw3qfIFEHK/uOjJfnPFKDU4ehk/O7Bq2jQJo5fCXg7P0bAzc2wZBXzDK3
 h20QUVQ9WO7BHTT+3wvnNrBgx924X8h0Omu9BOg2VF7PWyVF0AZCESBSLS3zHca6GkT2a7
 EgmWitnTqIWslQ2hxxu6i8CXP6vNnaI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-Tm1XgubiMhOkHj-m3JZ2zQ-1; Tue, 25 Apr 2023 13:32:31 -0400
X-MC-Unique: Tm1XgubiMhOkHj-m3JZ2zQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF601185A7A7;
 Tue, 25 Apr 2023 17:32:30 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6BE7492B03;
 Tue, 25 Apr 2023 17:32:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 19/20] block: Mark bdrv_recurse_can_replace() and callers
 GRAPH_RDLOCK
Date: Tue, 25 Apr 2023 19:31:57 +0200
Message-Id: <20230425173158.574203-20-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_recurse_can_replace() need to hold a reader lock for the graph
because it accesses the children list of a node.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h     | 5 +++--
 include/block/block_int-common.h       | 4 ++--
 include/block/block_int-global-state.h | 4 ++--
 block/blkverify.c                      | 5 +++--
 block/mirror.c                         | 4 ++++
 block/quorum.c                         | 4 ++--
 blockdev.c                             | 3 +++
 7 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index ec3ddb17a8..f234bca0b6 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -163,8 +163,9 @@ int bdrv_amend_options(BlockDriverState *bs_new, QemuOpts *opts,
                        Error **errp);
 
 /* check if a named node can be replaced when doing drive-mirror */
-BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
-                                        const char *node_name, Error **errp);
+BlockDriverState * GRAPH_RDLOCK
+check_to_replace_node(BlockDriverState *parent_bs, const char *node_name,
+                      Error **errp);
 
 int no_coroutine_fn bdrv_activate(BlockDriverState *bs, Error **errp);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 37d094796e..024ded4fc2 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -217,8 +217,8 @@ struct BlockDriver {
      * same data as @bs without it affecting @bs's behavior (that is,
      * without it being visible to @bs's parents).
      */
-    bool (*bdrv_recurse_can_replace)(BlockDriverState *bs,
-                                     BlockDriverState *to_replace);
+    bool GRAPH_RDLOCK_PTR (*bdrv_recurse_can_replace)(
+        BlockDriverState *bs, BlockDriverState *to_replace);
 
     int (*bdrv_probe_device)(const char *filename);
 
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 902406eb99..da5fb31089 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -225,8 +225,8 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
  */
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp);
 
-bool bdrv_recurse_can_replace(BlockDriverState *bs,
-                              BlockDriverState *to_replace);
+bool GRAPH_RDLOCK bdrv_recurse_can_replace(BlockDriverState *bs,
+                                           BlockDriverState *to_replace);
 
 /*
  * Default implementation for BlockDriver.bdrv_child_perm() that can
diff --git a/block/blkverify.c b/block/blkverify.c
index 1c16f86b2e..7326461f30 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -265,8 +265,9 @@ static int coroutine_fn GRAPH_RDLOCK blkverify_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(s->test_file->bs);
 }
 
-static bool blkverify_recurse_can_replace(BlockDriverState *bs,
-                                          BlockDriverState *to_replace)
+static bool GRAPH_RDLOCK
+blkverify_recurse_can_replace(BlockDriverState *bs,
+                              BlockDriverState *to_replace)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
diff --git a/block/mirror.c b/block/mirror.c
index a2f46783cf..99409f893f 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -747,7 +747,10 @@ static int mirror_exit_common(Job *job)
          * Cannot use check_to_replace_node() here, because that would
          * check for an op blocker on @to_replace, and we have our own
          * there.
+         *
+         * TODO Pull out the writer lock from bdrv_replace_node() to here
          */
+        bdrv_graph_rdlock_main_loop();
         if (bdrv_recurse_can_replace(src, to_replace)) {
             bdrv_replace_node(to_replace, target_bs, &local_err);
         } else {
@@ -756,6 +759,7 @@ static int mirror_exit_common(Job *job)
                        "would not lead to an abrupt change of visible data",
                        to_replace->node_name, target_bs->node_name);
         }
+        bdrv_graph_rdunlock_main_loop();
         bdrv_drained_end(target_bs);
         if (local_err) {
             error_report_err(local_err);
diff --git a/block/quorum.c b/block/quorum.c
index ff5a0a2da3..f28758cf2b 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -825,8 +825,8 @@ static coroutine_fn GRAPH_RDLOCK int quorum_co_flush(BlockDriverState *bs)
     return result;
 }
 
-static bool quorum_recurse_can_replace(BlockDriverState *bs,
-                                       BlockDriverState *to_replace)
+static bool GRAPH_RDLOCK
+quorum_recurse_can_replace(BlockDriverState *bs, BlockDriverState *to_replace)
 {
     BDRVQuorumState *s = bs->opaque;
     int i;
diff --git a/blockdev.c b/blockdev.c
index eb509cf964..bfca91ee4e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2951,6 +2951,9 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
     BlockDriverState *unfiltered_bs;
     int job_flags = JOB_DEFAULT;
 
+    GLOBAL_STATE_CODE();
+    GRAPH_RDLOCK_GUARD_MAINLOOP();
+
     if (!has_speed) {
         speed = 0;
     }
-- 
2.40.0


