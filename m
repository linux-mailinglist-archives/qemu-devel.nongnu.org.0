Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D136F92A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:22:25 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRE0-0002w8-UR
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkl-0003wt-Ix
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkj-0002OS-F3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ey0vxEPbJWYKxUzGTmic02lmDkRbAq0NsR2cuTHk8ys=;
 b=CibBc/Q7l4L+/1eNufJqM+WU1h/GAkZWstk8fegVJYMWqbsvVDzh7kqP+pSHw+63Dw+Z/r
 MrKGpz8foA4heVmobzQPFTAKIL5oduFcdvKPrFzNE2jG4FHtYSjPUn41g+EuCjU8Dnk7dl
 0HtMB+LffReegKa2zUmN9fqdMow8cjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-8ifkA9VuNu6YR4FLfAT39Q-1; Fri, 30 Apr 2021 06:52:05 -0400
X-MC-Unique: 8ifkA9VuNu6YR4FLfAT39Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780201898296;
 Fri, 30 Apr 2021 10:52:04 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 850B56787F;
 Fri, 30 Apr 2021 10:52:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/39] block: make bdrv_reopen_{prepare,commit,abort} private
Date: Fri, 30 Apr 2021 12:51:15 +0200
Message-Id: <20210430105147.125840-8-kwolf@redhat.com>
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

These functions are called only from bdrv_reopen_multiple() in block.c.
No reason to publish them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-8-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  4 ----
 block.c               | 13 +++++++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 54279baa95..16e496a5c4 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -387,10 +387,6 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
-int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                        BlockReopenQueue *queue, Error **errp);
-void bdrv_reopen_commit(BDRVReopenState *reopen_state);
-void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
                        int64_t bytes, BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
diff --git a/block.c b/block.c
index 54436c951e..34c728d7e4 100644
--- a/block.c
+++ b/block.c
@@ -82,6 +82,11 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
+                               *queue, Error **errp);
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -4153,8 +4158,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  * commit() for any other BDS that have been left in a prepare() state
  *
  */
-int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue *queue,
-                        Error **errp)
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
+                               BlockReopenQueue *queue, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4369,7 +4374,7 @@ error:
  * makes them final by swapping the staging BlockDriverState contents into
  * the active BlockDriverState contents.
  */
-void bdrv_reopen_commit(BDRVReopenState *reopen_state)
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
     BlockDriverState *bs;
@@ -4429,7 +4434,7 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
  * Abort the reopen, and delete and free the staged changes in
  * reopen_state
  */
-void bdrv_reopen_abort(BDRVReopenState *reopen_state)
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
 
-- 
2.30.2


