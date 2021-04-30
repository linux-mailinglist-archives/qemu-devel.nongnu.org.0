Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A0136F968
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:36:54 +0200 (CEST)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRS1-0007vv-E8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlw-00058U-3a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0002wW-FT
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T189Q0QUh9XV6UADbeyqKX32ROea417kcSxPzNhzp14=;
 b=GDkN4yady1g+8FGEx405j0IY82/5IMm6hynZ3A4ledA473Q88KS/09Qh0d8leBxED9+hHY
 3RsYNUYU5pR/BIN7UoLoz7iEd8otKzH9O//hU/4WywJO7mPqZpQAwdb7EAWAwSUDrjNVtE
 3BF5dZbYm6PPFWBV5gEhZnAHBPxOPlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-wsN3adTrPDKult5W5lhD2g-1; Fri, 30 Apr 2021 06:53:10 -0400
X-MC-Unique: wsN3adTrPDKult5W5lhD2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A360F1014C04;
 Fri, 30 Apr 2021 10:53:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACBB16787F;
 Fri, 30 Apr 2021 10:53:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/39] block/backup-top: drop .active
Date: Fri, 30 Apr 2021 12:51:32 +0200
Message-Id: <20210430105147.125840-25-kwolf@redhat.com>
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

We don't need this workaround anymore: bdrv_append is already smart
enough and we can use new bdrv_drop_filter().

This commit efficiently reverts also recent 705dde27c6c53b73, which
checked .active on io path. Still it said that the problem should be
theoretical. And the logic of filter removement is changed anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-25-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/backup-top.c         | 47 +-------------------------------------
 tests/qemu-iotests/283.out |  2 +-
 2 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 62d09f213e..425e3778be 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -37,7 +37,6 @@
 typedef struct BDRVBackupTopState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    bool active;
     int64_t cluster_size;
 } BDRVBackupTopState;
 
@@ -45,12 +44,6 @@ static coroutine_fn int backup_top_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        return -EIO;
-    }
-
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
@@ -60,10 +53,6 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     BDRVBackupTopState *s = bs->opaque;
     uint64_t off, end;
 
-    if (!s->active) {
-        return -EIO;
-    }
-
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
         return 0;
     }
@@ -137,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
                                   uint64_t perm, uint64_t shared,
                                   uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * The filter node may be in process of bdrv_append(), which firstly do
-         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
-         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
-         * let's require nothing during bdrv_append() and refresh permissions
-         * after it (see bdrv_backup_top_append()).
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
@@ -241,17 +215,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     }
     appended = true;
 
-    /*
-     * bdrv_append() finished successfully, now we can require permissions
-     * we want.
-     */
-    state->active = true;
-    ret = bdrv_child_refresh_perms(top, top->backing, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot set permissions for backup-top filter: ");
-        goto fail;
-    }
-
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
@@ -268,7 +231,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        state->active = false;
         bdrv_backup_top_drop(top);
     } else {
         bdrv_unref(top);
@@ -283,16 +245,9 @@ void bdrv_backup_top_drop(BlockDriverState *bs)
 {
     BDRVBackupTopState *s = bs->opaque;
 
-    bdrv_drained_begin(bs);
+    bdrv_drop_filter(bs, &error_abort);
 
     block_copy_state_free(s->bcs);
 
-    s->active = false;
-    bdrv_child_refresh_perms(bs, bs->backing, &error_abort);
-    bdrv_replace_node(bs, bs->backing->bs, &error_abort);
-    bdrv_set_backing_hd(bs, NULL, &error_abort);
-
-    bdrv_drained_end(bs);
-
     bdrv_unref(bs);
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 73eb75102f..97e62a4c94 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.30.2


