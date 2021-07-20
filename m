Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80B3CFD6E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:24:17 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rbU-00042Z-CQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPP-0003o1-Pn
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPL-0001GB-NT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCdaNgtKwLDnuNL/MjcDckZ6iudIziK4XrLTtHzJ65w=;
 b=Ngf1Q7sSmoiSFTXbGC+zX9ySQCvgxOYXB+UDLwZajUuf2Net/QDXoN4xIFm1tzQs2iJ6qb
 a3+VsiBWyfjANyYgsEpCzBMqa8OI3tMrfKDtwjfRrQafgZoO4UDzMC6D2Efb1wzeJ2J41s
 RGxya8wfxeAfI27IomFFB43Ik/v5r1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-r_pIGYQRPW2_wWA8TWttfA-1; Tue, 20 Jul 2021 11:11:41 -0400
X-MC-Unique: r_pIGYQRPW2_wWA8TWttfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782558C4171;
 Tue, 20 Jul 2021 15:11:09 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D4960843;
 Tue, 20 Jul 2021 15:11:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/11] replication: Reduce usage of s->hidden_disk and
 s->secondary_disk
Date: Tue, 20 Jul 2021 17:10:48 +0200
Message-Id: <20210720151053.226144-7-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

In preparation for the next patch, initialize s->hidden_disk and
s->secondary_disk later and replace access to them with local variables
in the places where they aren't initialized yet.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <1eb9dc179267207d9c7eccaeb30761758e32e9ab.1626619393.git.lukasstraub2@web.de>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 45 ++++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 9ad2dfdc69..25bbdf5d4b 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -366,27 +366,35 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
                                 Error **errp)
 {
     BDRVReplicationState *s = bs->opaque;
+    BdrvChild *hidden_disk, *secondary_disk;
     BlockReopenQueue *reopen_queue = NULL;
 
+    /*
+     * s->hidden_disk and s->secondary_disk may not be set yet, as they will
+     * only be set after the children are writable.
+     */
+    hidden_disk = bs->file->bs->backing;
+    secondary_disk = hidden_disk->bs->backing;
+
     if (writable) {
-        s->orig_hidden_read_only = bdrv_is_read_only(s->hidden_disk->bs);
-        s->orig_secondary_read_only = bdrv_is_read_only(s->secondary_disk->bs);
+        s->orig_hidden_read_only = bdrv_is_read_only(hidden_disk->bs);
+        s->orig_secondary_read_only = bdrv_is_read_only(secondary_disk->bs);
     }
 
-    bdrv_subtree_drained_begin(s->hidden_disk->bs);
-    bdrv_subtree_drained_begin(s->secondary_disk->bs);
+    bdrv_subtree_drained_begin(hidden_disk->bs);
+    bdrv_subtree_drained_begin(secondary_disk->bs);
 
     if (s->orig_hidden_read_only) {
         QDict *opts = qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue = bdrv_reopen_queue(reopen_queue, s->hidden_disk->bs,
+        reopen_queue = bdrv_reopen_queue(reopen_queue, hidden_disk->bs,
                                          opts, true);
     }
 
     if (s->orig_secondary_read_only) {
         QDict *opts = qdict_new();
         qdict_put_bool(opts, BDRV_OPT_READ_ONLY, !writable);
-        reopen_queue = bdrv_reopen_queue(reopen_queue, s->secondary_disk->bs,
+        reopen_queue = bdrv_reopen_queue(reopen_queue, secondary_disk->bs,
                                          opts, true);
     }
 
@@ -401,8 +409,8 @@ static void reopen_backing_file(BlockDriverState *bs, bool writable,
         }
     }
 
-    bdrv_subtree_drained_end(s->hidden_disk->bs);
-    bdrv_subtree_drained_end(s->secondary_disk->bs);
+    bdrv_subtree_drained_end(hidden_disk->bs);
+    bdrv_subtree_drained_end(secondary_disk->bs);
 }
 
 static void backup_job_cleanup(BlockDriverState *bs)
@@ -459,7 +467,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     BlockDriverState *bs = rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
-    BdrvChild *active_disk;
+    BdrvChild *active_disk, *hidden_disk, *secondary_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err = NULL;
@@ -504,15 +512,15 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             return;
         }
 
-        s->hidden_disk = active_disk->bs->backing;
-        if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
+        hidden_disk = active_disk->bs->backing;
+        if (!hidden_disk->bs || !hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }
 
-        s->secondary_disk = s->hidden_disk->bs->backing;
-        if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)) {
+        secondary_disk = hidden_disk->bs->backing;
+        if (!secondary_disk->bs || !bdrv_has_blk(secondary_disk->bs)) {
             error_setg(errp, "The secondary disk doesn't have block backend");
             aio_context_release(aio_context);
             return;
@@ -520,8 +528,8 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
 
         /* verify the length */
         active_length = bdrv_getlength(active_disk->bs);
-        hidden_length = bdrv_getlength(s->hidden_disk->bs);
-        disk_length = bdrv_getlength(s->secondary_disk->bs);
+        hidden_length = bdrv_getlength(hidden_disk->bs);
+        disk_length = bdrv_getlength(secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
             active_length != hidden_length || hidden_length != disk_length) {
             error_setg(errp, "Active disk, hidden disk, secondary disk's length"
@@ -531,10 +539,10 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         }
 
         /* Must be true, or the bdrv_getlength() calls would have failed */
-        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
+        assert(active_disk->bs->drv && hidden_disk->bs->drv);
 
         if (!active_disk->bs->drv->bdrv_make_empty ||
-            !s->hidden_disk->bs->drv->bdrv_make_empty) {
+            !hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_empty");
             aio_context_release(aio_context);
@@ -549,6 +557,9 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             return;
         }
 
+        s->hidden_disk = hidden_disk;
+        s->secondary_disk = secondary_disk;
+
         /* start backup job now */
         error_setg(&s->blocker,
                    "Block device is in use by internal backup job");
-- 
2.31.1


