Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269606FDDC8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:26:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiqA-0003k9-7Q; Wed, 10 May 2023 08:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipl-0002gx-3a
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipf-0007pc-U2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VYzP2+MoxRIsAXhhnClbZ0nRAdJq6JskrQsc0DsYbcI=;
 b=DltKoQ4eu3qbTIAwiM5P6c58kgLCNWWKl+phFXSmUvMe/PAK8YOWZzbu8yElJA88hc5yh/
 SMh81qTMKUv6p5Ezsr/D3XJSqzWBpSRCD+noK+ar+zIqryPykInLTdbu4IqfXbbPLPEZQo
 kJ7QgXZtAoLRGFEG9atfU+d7GBTpB9Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-wzPXXlsVMPmZUYzzNJ4MoA-1; Wed, 10 May 2023 08:22:03 -0400
X-MC-Unique: wzPXXlsVMPmZUYzzNJ4MoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 723E91C0513D;
 Wed, 10 May 2023 12:22:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EEA063F86;
 Wed, 10 May 2023 12:22:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 27/28] block: Mark bdrv_refresh_limits() and callers
 GRAPH_RDLOCK
Date: Wed, 10 May 2023 14:21:10 +0200
Message-Id: <20230510122111.46566-28-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
bdrv_refresh_limits() need to hold a reader lock for the graph because
it accesses the children list of a node.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230504115750.54437-21-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


