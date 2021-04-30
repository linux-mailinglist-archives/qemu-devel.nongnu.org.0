Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F436F9A6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:55:50 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRkL-000274-Ls
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm1-0005J2-0l
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlt-0002xy-Av
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13FX3F7AkBscD7Wkf2F3HnEoJzTPRkLCZ/hDETKKFjY=;
 b=QWAOvIhCsMcGDTMSiPdmTkqfiIDZJRjJz3kh1UI+0tOHZeKqDvcE5P5AkhChYzF/atYo29
 qBDwqJV9+tFU78UwMlHFwVz4RW0HNQjolt3OX926YACh7p6suymlOWFyOsBugF9rKr518W
 wPdmWbdFtelSAGFILrUJ9XJmaVvUwIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-qb3AETMIPWq-cYbGN35MxQ-1; Fri, 30 Apr 2021 06:53:16 -0400
X-MC-Unique: qb3AETMIPWq-cYbGN35MxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 587A0108C290;
 Fri, 30 Apr 2021 10:53:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69C1A5F707;
 Fri, 30 Apr 2021 10:53:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/39] block: make bdrv_refresh_limits() to be a transaction
 action
Date: Fri, 30 Apr 2021 12:51:35 +0200
Message-Id: <20210430105147.125840-28-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

To be used in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-28-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  3 ++-
 block.c               |  9 ++++-----
 block/io.c            | 31 +++++++++++++++++++++++++++++--
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 85481a05c6..ad38259c91 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -9,6 +9,7 @@
 #include "block/dirty-bitmap.h"
 #include "block/blockjob.h"
 #include "qemu/hbitmap.h"
+#include "qemu/transactions.h"
 
 /*
  * generated_co_wrapper
@@ -421,7 +422,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
-void bdrv_refresh_limits(BlockDriverState *bs, Error **errp);
+void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp);
 int bdrv_commit(BlockDriverState *bs);
 int bdrv_make_empty(BdrvChild *c, Error **errp);
 int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
diff --git a/block.c b/block.c
index 1dc14908ac..9922943793 100644
--- a/block.c
+++ b/block.c
@@ -49,7 +49,6 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
-#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -1577,7 +1576,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
         return ret;
     }
 
-    bdrv_refresh_limits(bs, &local_err);
+    bdrv_refresh_limits(bs, NULL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return -EINVAL;
@@ -3363,7 +3362,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     }
 
 out:
-    bdrv_refresh_limits(bs, NULL);
+    bdrv_refresh_limits(bs, NULL, NULL);
 
     return ret;
 }
@@ -4847,7 +4846,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
         bdrv_set_backing_hd(bs, reopen_state->new_backing_bs, &error_abort);
     }
 
-    bdrv_refresh_limits(bs, NULL);
+    bdrv_refresh_limits(bs, NULL, NULL);
 }
 
 /*
@@ -5244,7 +5243,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 out:
     tran_finalize(tran, ret);
 
-    bdrv_refresh_limits(bs_top, NULL);
+    bdrv_refresh_limits(bs_top, NULL, NULL);
 
     return ret;
 }
diff --git a/block/io.c b/block/io.c
index ca2dca3007..35b6c56efc 100644
--- a/block/io.c
+++ b/block/io.c
@@ -133,13 +133,40 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
     dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
 }
 
-void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
+typedef struct BdrvRefreshLimitsState {
+    BlockDriverState *bs;
+    BlockLimits old_bl;
+} BdrvRefreshLimitsState;
+
+static void bdrv_refresh_limits_abort(void *opaque)
+{
+    BdrvRefreshLimitsState *s = opaque;
+
+    s->bs->bl = s->old_bl;
+}
+
+static TransactionActionDrv bdrv_refresh_limits_drv = {
+    .abort = bdrv_refresh_limits_abort,
+    .clean = g_free,
+};
+
+/* @tran is allowed to be NULL, in this case no rollback is possible. */
+void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
 {
     ERRP_GUARD();
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     bool have_limits;
 
+    if (tran) {
+        BdrvRefreshLimitsState *s = g_new(BdrvRefreshLimitsState, 1);
+        *s = (BdrvRefreshLimitsState) {
+            .bs = bs,
+            .old_bl = bs->bl,
+        };
+        tran_add(tran, &bdrv_refresh_limits_drv, s);
+    }
+
     memset(&bs->bl, 0, sizeof(bs->bl));
 
     if (!drv) {
@@ -156,7 +183,7 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
     QLIST_FOREACH(c, &bs->children, next) {
         if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
         {
-            bdrv_refresh_limits(c->bs, errp);
+            bdrv_refresh_limits(c->bs, tran, errp);
             if (*errp) {
                 return;
             }
-- 
2.30.2


