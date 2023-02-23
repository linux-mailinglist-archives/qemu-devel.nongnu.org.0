Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B706A0FDE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGha-0006zS-Da; Thu, 23 Feb 2023 13:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhR-0006rY-HM
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhP-0003B4-QI
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aX19loUnvz4eVtXt5ZbOL2UKg0Uz6K3mCszEj/MO8k=;
 b=WL51JMnIKj4oUiS6oZp6Wy+ZGaer5idZLg3WV1Q0A+FM3bzjRkHnLeGm8OKCn+HWbCmXOU
 I22c39vUchVNo96kp+eABDWP1C657/bkvbMK3a/oDqPorjWsbZ9U2Zp5s5mfmsxLPTThGH
 zJwJ4qTte9ZppJIhcQPmIC7w+8u85mo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-h0dq3DL0MtOg64P1GkZ3Jw-1; Thu, 23 Feb 2023 13:52:09 -0500
X-MC-Unique: h0dq3DL0MtOg64P1GkZ3Jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F5641C05140;
 Thu, 23 Feb 2023 18:52:09 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C6791121314;
 Thu, 23 Feb 2023 18:52:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 19/29] block: Mark bdrv_co_eject/lock_medium() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:36 +0100
Message-Id: <20230223185146.306454-20-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_eject() and bdrv_co_lock_medium() need to hold a reader lock for
the graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-20-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 7 +++++--
 include/block/block_int-common.h | 6 ++++--
 block.c                          | 2 ++
 block/block-backend.c            | 2 ++
 block/copy-on-read.c             | 6 ++++--
 block/filter-compress.c          | 4 ++--
 block/raw-format.c               | 6 ++++--
 7 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 88db63492a..bf2748011e 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -148,8 +148,11 @@ int bdrv_get_flags(BlockDriverState *bs);
 bool coroutine_fn GRAPH_RDLOCK bdrv_co_is_inserted(BlockDriverState *bs);
 bool co_wrapper_bdrv_rdlock bdrv_is_inserted(BlockDriverState *bs);
 
-void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked);
-void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
+void coroutine_fn GRAPH_RDLOCK
+bdrv_co_lock_medium(BlockDriverState *bs, bool locked);
+
+void coroutine_fn GRAPH_RDLOCK
+bdrv_co_eject(BlockDriverState *bs, bool eject_flag);
 
 const char *bdrv_get_format_name(BlockDriverState *bs);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index b4a82269e5..30e6bd4909 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -714,8 +714,10 @@ struct BlockDriver {
     /* removable device specific */
     bool coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_is_inserted)(
         BlockDriverState *bs);
-    void coroutine_fn (*bdrv_co_eject)(BlockDriverState *bs, bool eject_flag);
-    void coroutine_fn (*bdrv_co_lock_medium)(BlockDriverState *bs, bool locked);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_eject)(
+        BlockDriverState *bs, bool eject_flag);
+    void coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_lock_medium)(
+        BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices */
     BlockAIOCB *coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_aio_ioctl)(
diff --git a/block.c b/block.c
index 738b42046c..1060194e8f 100644
--- a/block.c
+++ b/block.c
@@ -6849,6 +6849,7 @@ void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     if (drv && drv->bdrv_co_eject) {
         drv->bdrv_co_eject(bs, eject_flag);
@@ -6863,6 +6864,7 @@ void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     BlockDriver *drv = bs->drv;
     IO_CODE();
+    assert_bdrv_graph_readable();
     trace_bdrv_lock_medium(bs, locked);
 
     if (drv && drv->bdrv_co_lock_medium) {
diff --git a/block/block-backend.c b/block/block-backend.c
index 20af699f00..278b04ce69 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2013,6 +2013,7 @@ void coroutine_fn blk_co_lock_medium(BlockBackend *blk, bool locked)
 {
     BlockDriverState *bs = blk_bs(blk);
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     if (bs) {
         bdrv_co_lock_medium(bs, locked);
@@ -2024,6 +2025,7 @@ void coroutine_fn blk_co_eject(BlockBackend *blk, bool eject_flag)
     BlockDriverState *bs = blk_bs(blk);
     char *id;
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     if (bs) {
         bdrv_co_eject(bs, eject_flag);
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 78da353f88..20215cff93 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -213,13 +213,15 @@ cor_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }
 
 
-static void coroutine_fn cor_co_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn GRAPH_RDLOCK
+cor_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 
-static void coroutine_fn cor_co_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn GRAPH_RDLOCK
+cor_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     bdrv_co_lock_medium(bs->file->bs, locked);
 }
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 0dd5606410..c7d50a67a7 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -114,14 +114,14 @@ static void compress_refresh_limits(BlockDriverState *bs, Error **errp)
 }
 
 
-static void coroutine_fn
+static void coroutine_fn GRAPH_RDLOCK
 compress_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
 
-static void coroutine_fn
+static void coroutine_fn GRAPH_RDLOCK
 compress_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     bdrv_co_lock_medium(bs->file->bs, locked);
diff --git a/block/raw-format.c b/block/raw-format.c
index 646606e223..f4203d4806 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -405,12 +405,14 @@ raw_co_truncate(BlockDriverState *bs, int64_t offset, bool exact,
     return bdrv_co_truncate(bs->file, offset, exact, prealloc, flags, errp);
 }
 
-static void coroutine_fn raw_co_eject(BlockDriverState *bs, bool eject_flag)
+static void coroutine_fn GRAPH_RDLOCK
+raw_co_eject(BlockDriverState *bs, bool eject_flag)
 {
     bdrv_co_eject(bs->file->bs, eject_flag);
 }
 
-static void coroutine_fn raw_co_lock_medium(BlockDriverState *bs, bool locked)
+static void coroutine_fn GRAPH_RDLOCK
+raw_co_lock_medium(BlockDriverState *bs, bool locked)
 {
     bdrv_co_lock_medium(bs->file->bs, locked);
 }
-- 
2.39.2


