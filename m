Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EEF6FDDAC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:23:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipw-0002z3-Vg; Wed, 10 May 2023 08:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipd-0002X7-A9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipX-0007nV-T9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRzL0DuvSjk1HCOV34CFAeCiOZ0kSGxxwLKlRcp+mv8=;
 b=WUSFwUEYJvRQGZngAIbnsyxn6tmSBIZSHRAeSC7Xx3XLBI13W3GvQL5BTOYL1BC5KZ7JYQ
 xvvam5Cu7RVp+Be8UzEszL0hIDa3UYe1KPjkcssWFx7Y4evBsqhkxPu8ELm7pBigYG3UT7
 g/4mZ9Vieo/xxjCvFeBOXrvtNKNZsHA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-5qPzyfnVME22PtebgvEZ2g-1; Wed, 10 May 2023 08:21:59 -0400
X-MC-Unique: 5qPzyfnVME22PtebgvEZ2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 695DC281295A;
 Wed, 10 May 2023 12:21:59 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACE5863F87;
 Wed, 10 May 2023 12:21:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 23/28] block: Mark BlockDriver callbacks for amend job
 GRAPH_RDLOCK
Date: Wed, 10 May 2023 14:21:06 +0200
Message-Id: <20230510122111.46566-24-kwolf@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of amend
callbacks in BlockDriver need to hold a reader lock for the graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230504115750.54437-17-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h | 12 ++++++------
 block/amend.c                    |  8 +++++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 88ce7f9d9e..37d094796e 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -204,12 +204,13 @@ struct BlockDriver {
      * to allow driver-specific initialization code that requires
      * the BQL, like setting up specific permission flags.
      */
-    int (*bdrv_amend_pre_run)(BlockDriverState *bs, Error **errp);
+    int GRAPH_RDLOCK_PTR (*bdrv_amend_pre_run)(
+        BlockDriverState *bs, Error **errp);
     /*
      * This function is invoked under BQL after .bdrv_co_amend()
      * to allow cleaning up what was done in .bdrv_amend_pre_run().
      */
-    void (*bdrv_amend_clean)(BlockDriverState *bs);
+    void GRAPH_RDLOCK_PTR (*bdrv_amend_clean)(BlockDriverState *bs);
 
     /*
      * Return true if @to_replace can be replaced by a BDS with the
@@ -463,10 +464,9 @@ struct BlockDriver {
 
     int (*bdrv_probe)(const uint8_t *buf, int buf_size, const char *filename);
 
-    int coroutine_fn (*bdrv_co_amend)(BlockDriverState *bs,
-                                      BlockdevAmendOptions *opts,
-                                      bool force,
-                                      Error **errp);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_amend)(
+        BlockDriverState *bs, BlockdevAmendOptions *opts, bool force,
+        Error **errp);
 
     /* aio */
     BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_preadv)(BlockDriverState *bs,
diff --git a/block/amend.c b/block/amend.c
index bc4bb7b416..53a410247c 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -46,6 +46,7 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
 {
     BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
     int ret;
+    GRAPH_RDLOCK_GUARD();
 
     job_progress_set_remaining(&s->common, 1);
     ret = s->bs->drv->bdrv_co_amend(s->bs, s->opts, s->force, errp);
@@ -54,7 +55,8 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
     return ret;
 }
 
-static int blockdev_amend_pre_run(BlockdevAmendJob *s, Error **errp)
+static int GRAPH_RDLOCK
+blockdev_amend_pre_run(BlockdevAmendJob *s, Error **errp)
 {
     if (s->bs->drv->bdrv_amend_pre_run) {
         return s->bs->drv->bdrv_amend_pre_run(s->bs, errp);
@@ -67,9 +69,11 @@ static void blockdev_amend_free(Job *job)
 {
     BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
 
+    bdrv_graph_rdlock_main_loop();
     if (s->bs->drv->bdrv_amend_clean) {
         s->bs->drv->bdrv_amend_clean(s->bs);
     }
+    bdrv_graph_rdunlock_main_loop();
 
     bdrv_unref(s->bs);
 }
@@ -93,6 +97,8 @@ void qmp_x_blockdev_amend(const char *job_id,
     BlockDriver *drv = bdrv_find_format(fmt);
     BlockDriverState *bs;
 
+    GRAPH_RDLOCK_GUARD_MAINLOOP();
+
     bs = bdrv_lookup_bs(NULL, node_name, errp);
     if (!bs) {
         return;
-- 
2.40.1


