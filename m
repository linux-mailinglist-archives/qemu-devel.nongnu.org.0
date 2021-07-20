Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA483CFD4B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:19:20 +0200 (CEST)
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rWh-0000eg-HU
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPM-0003ms-Nr
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPJ-0001Ep-PY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWY+RF9EkwmX9Q2KkJswkXq2dhfFbv2ZETeYn1O3dDA=;
 b=XAARkFcbot2B3LmVLaT2yzbphsVi+5NEckdbmHCKA24kBDd9GyrgxKWIqAQ9Q6UgKt8uaR
 NqwZxThhZMMoNZTMc3Vhq0zFmGvw1JVaYdfriyI5a1OEoI3Ql/cqoEvcg9tJLKnjTlABdP
 Zd9XcD0pQu5WgIqMi69MgUUwBzl/oUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-3aw4-QcnPpW9xuDM5pFZ3A-1; Tue, 20 Jul 2021 11:11:37 -0400
X-MC-Unique: 3aw4-QcnPpW9xuDM5pFZ3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4686D804162;
 Tue, 20 Jul 2021 15:11:13 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5142C60843;
 Tue, 20 Jul 2021 15:11:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/11] block/vvfat: fix: drop backing
Date: Tue, 20 Jul 2021 17:10:51 +0200
Message-Id: <20210720151053.226144-10-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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

Most probably this fake backing child doesn't work anyway (see notes
about it in a8a4d15c1c34d).

Still, since 25f78d9e2de528473d52 drivers are required to set
.supports_backing if they want to call bdrv_set_backing_hd, so now
vvfat just doesn't work because of this check.

Let's finally drop this fake backing file.

Fixes: 25f78d9e2de528473d52acfcf7acdfb64e3453d4
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210715124853.13335-1-vsementsov@virtuozzo.com>
Tested-by: John Arbuckle <programmingkidx@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 43 ++++---------------------------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index ae9d387da7..34bf1e3a86 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3098,26 +3098,6 @@ static int coroutine_fn vvfat_co_block_status(BlockDriverState *bs,
     return BDRV_BLOCK_DATA;
 }
 
-static int coroutine_fn
-write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                    QEMUIOVector *qiov, int flags)
-{
-    int ret;
-
-    BDRVVVFATState* s = *((BDRVVVFATState**) bs->opaque);
-    qemu_co_mutex_lock(&s->lock);
-    ret = try_commit(s);
-    qemu_co_mutex_unlock(&s->lock);
-
-    return ret;
-}
-
-static BlockDriver vvfat_write_target = {
-    .format_name        = "vvfat_write_target",
-    .instance_size      = sizeof(void*),
-    .bdrv_co_pwritev    = write_target_commit,
-};
-
 static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
                                int *child_flags, QDict *child_options,
                                int parent_flags, QDict *parent_options)
@@ -3133,7 +3113,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
 {
     BDRVVVFATState *s = bs->opaque;
     BlockDriver *bdrv_qcow = NULL;
-    BlockDriverState *backing;
     QemuOpts *opts = NULL;
     int ret;
     int size = sector2cluster(s, s->sector_count);
@@ -3184,13 +3163,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     unlink(s->qcow_filename);
 #endif
 
-    backing = bdrv_new_open_driver(&vvfat_write_target, NULL, BDRV_O_ALLOW_RDWR,
-                                   &error_abort);
-    *(void**) backing->opaque = s;
-
-    bdrv_set_backing_hd(s->bs, backing, &error_abort);
-    bdrv_unref(backing);
-
     return 0;
 
 err:
@@ -3205,17 +3177,10 @@ static void vvfat_child_perm(BlockDriverState *bs, BdrvChild *c,
                              uint64_t perm, uint64_t shared,
                              uint64_t *nperm, uint64_t *nshared)
 {
-    if (role & BDRV_CHILD_DATA) {
-        /* This is a private node, nobody should try to attach to it */
-        *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
-        *nshared = BLK_PERM_WRITE_UNCHANGED;
-    } else {
-        assert(role & BDRV_CHILD_COW);
-        /* The backing file is there so 'commit' can use it. vvfat doesn't
-         * access it in any way. */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-    }
+    assert(role & BDRV_CHILD_DATA);
+    /* This is a private node, nobody should try to attach to it */
+    *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    *nshared = BLK_PERM_WRITE_UNCHANGED;
 }
 
 static void vvfat_close(BlockDriverState *bs)
-- 
2.31.1


