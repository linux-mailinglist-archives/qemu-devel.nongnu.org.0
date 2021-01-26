Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A0304058
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:33:22 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PPF-000652-7x
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDZ-000076-SV
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDQ-00068a-TG
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/lN7PVX1EPmNE99v4jjgkzf3PASdskwXBHFKqZVScA=;
 b=N6TMJclrxD8ihY9c8B4h19JzsWC7zstRS3Zit/ff+wizdah2HV19LQk1UyIhFviuumDKJ0
 glPivUXg1Wp1Vp6IRVP2XqVoh3SXwvyKerE+FQ0JlIPGc4VVpJOYBAM5Gd4mvVmxR5H0Nv
 TNZyzjqU2tFos0JVXxcr1qRNnVzSM5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-nxORQpwjPd6KGOhG9xCL6g-1; Tue, 26 Jan 2021 09:21:03 -0500
X-MC-Unique: nxORQpwjPd6KGOhG9xCL6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 650971005CAF;
 Tue, 26 Jan 2021 14:20:48 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E87245D9C2;
 Tue, 26 Jan 2021 14:20:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/53] block/stream: add s->target_bs
Date: Tue, 26 Jan 2021 15:19:36 +0100
Message-Id: <20210126142016.806073-14-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add a direct link to target bs for convenience and to simplify
following commit which will insert COR filter above target bs.

This is a part of original commit written by Andrey.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201216061703.70908-13-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/stream.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 045d6bc76b..626dfa2b22 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -33,6 +33,7 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
+    BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
     bool bs_read_only;
@@ -53,23 +54,20 @@ static void stream_abort(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
 
     if (s->chain_frozen) {
-        BlockJob *bjob = &s->common;
-        bdrv_unfreeze_backing_chain(blk_bs(bjob->blk), s->above_base);
+        bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
     }
 }
 
 static int stream_prepare(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
     BlockDriverState *unfiltered_base = bdrv_skip_filters(base);
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(bs, s->above_base);
+    bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
     s->chain_frozen = false;
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -95,13 +93,12 @@ static void stream_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
 
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
         blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-        bdrv_reopen_set_read_only(bs, true, NULL);
+        bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
     g_free(s->backing_file_str);
@@ -111,8 +108,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
-    BlockDriverState *bs = blk_bs(blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     bool enable_cor = !bdrv_cow_child(s->base_overlay);
     int64_t len;
     int64_t offset = 0;
@@ -125,7 +121,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         return 0;
     }
 
-    len = bdrv_getlength(bs);
+    len = bdrv_getlength(s->target_bs);
     if (len < 0) {
         return len;
     }
@@ -137,7 +133,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
      * account.
      */
     if (enable_cor) {
-        bdrv_enable_copy_on_read(bs);
+        bdrv_enable_copy_on_read(s->target_bs);
     }
 
     for ( ; offset < len; offset += n) {
@@ -199,7 +195,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
 
     if (enable_cor) {
-        bdrv_disable_copy_on_read(bs);
+        bdrv_disable_copy_on_read(s->target_bs);
     }
 
     /* Do not remove the backing file if an error was there but ignored. */
@@ -314,6 +310,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     s->base_overlay = base_overlay;
     s->above_base = above_base;
     s->backing_file_str = g_strdup(backing_file_str);
+    s->target_bs = bs;
     s->bs_read_only = bs_read_only;
     s->chain_frozen = true;
 
-- 
2.29.2


