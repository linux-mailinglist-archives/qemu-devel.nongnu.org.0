Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E53398B07
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:50:10 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRG5-0000jY-Ul
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRC4-0000Cu-TY
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRC2-00074V-OH
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sxgy2f9jgRD2Mv1VSBDcwJ7Rk3aRVaGUNQXV4vp1aI=;
 b=eeDaB93RrZMwkRZh7Xbu4bdp4ATKGcFhA0haYWrE4sVkeb7Bg2Zhlk7EomKlCDo7xNPkiF
 iojNucCEM3YeHQXhzzMLj1WaDN8C9mRgIeF6x0GyWxwPp2I19Oh5AH4IiQms4BPZRvysVU
 Xg0SGpsOsFWsAUoiYVPp8r1emNc7Lj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-BFvowecZNGGDWyI70FnGsA-1; Wed, 02 Jun 2021 09:45:55 -0400
X-MC-Unique: BFvowecZNGGDWyI70FnGsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 271E7CC62D;
 Wed,  2 Jun 2021 13:45:41 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 378E060BD9;
 Wed,  2 Jun 2021 13:45:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/20] block: consistently use bdrv_is_read_only()
Date: Wed,  2 Jun 2021 15:45:14 +0200
Message-Id: <20210602134529.231756-6-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

It's better to use accessor function instead of bs->read_only directly.
In some places use bdrv_is_writable() instead of
checking both BDRV_O_RDWR set and BDRV_O_INACTIVE not set.

In bdrv_open_common() it's a bit strange to add one more variable, but
we are going to drop bs->read_only in the next patch, so new ro local
variable substitutes it here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210527154056.70294-2-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                | 11 +++++++----
 block/block-backend.c  |  2 +-
 block/commit.c         |  2 +-
 block/io.c             |  4 ++--
 block/qapi.c           |  2 +-
 block/qcow2-snapshot.c |  2 +-
 block/qcow2.c          |  5 ++---
 block/snapshot.c       |  2 +-
 block/vhdx-log.c       |  2 +-
 9 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index ef13076c4c..33e99d0c9e 100644
--- a/block.c
+++ b/block.c
@@ -1720,6 +1720,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     QemuOpts *opts;
     BlockDriver *drv;
     Error *local_err = NULL;
+    bool ro;
 
     assert(bs->file == NULL);
     assert(options != NULL && bs->options != options);
@@ -1772,15 +1773,17 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
 
     bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
 
-    if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, bs->read_only)) {
-        if (!bs->read_only && bdrv_is_whitelisted(drv, true)) {
+    ro = bdrv_is_read_only(bs);
+
+    if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, ro)) {
+        if (!ro && bdrv_is_whitelisted(drv, true)) {
             ret = bdrv_apply_auto_read_only(bs, NULL, NULL);
         } else {
             ret = -ENOTSUP;
         }
         if (ret < 0) {
             error_setg(errp,
-                       !bs->read_only && bdrv_is_whitelisted(drv, true)
+                       !ro && bdrv_is_whitelisted(drv, true)
                        ? "Driver '%s' can only be used for read-only devices"
                        : "Driver '%s' is not whitelisted",
                        drv->format_name);
@@ -1792,7 +1795,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     assert(qatomic_read(&bs->copy_on_read) == 0);
 
     if (bs->open_flags & BDRV_O_COPY_ON_READ) {
-        if (!bs->read_only) {
+        if (!ro) {
             bdrv_enable_copy_on_read(bs);
         } else {
             error_setg(errp, "Can't use copy-on-read on read-only device");
diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..21b834e9df 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2269,7 +2269,7 @@ void blk_update_root_state(BlockBackend *blk)
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
-    blk->root_state.read_only     = blk->root->bs->read_only;
+    blk->root_state.read_only     = bdrv_is_read_only(blk->root->bs);
     blk->root_state.detect_zeroes = blk->root->bs->detect_zeroes;
 }
 
diff --git a/block/commit.c b/block/commit.c
index b89bb20b75..b7f0c7c061 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -453,7 +453,7 @@ int bdrv_commit(BlockDriverState *bs)
         return -EBUSY;
     }
 
-    ro = backing_file_bs->read_only;
+    ro = bdrv_is_read_only(backing_file_bs);
 
     if (ro) {
         if (bdrv_reopen_set_read_only(backing_file_bs, false, NULL)) {
diff --git a/block/io.c b/block/io.c
index 1e826ba9e8..323854d063 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1973,7 +1973,7 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
 
     bdrv_check_request(offset, bytes, &error_abort);
 
-    if (bs->read_only) {
+    if (bdrv_is_read_only(bs)) {
         return -EPERM;
     }
 
@@ -3406,7 +3406,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes) {
         bdrv_make_request_serialising(&req, 1);
     }
-    if (bs->read_only) {
+    if (bdrv_is_read_only(bs)) {
         error_setg(errp, "Image is read-only");
         ret = -EACCES;
         goto out;
diff --git a/block/qapi.c b/block/qapi.c
index 943e7b15ad..dc69341bfe 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -59,7 +59,7 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
 
     info = g_malloc0(sizeof(*info));
     info->file                   = g_strdup(bs->filename);
-    info->ro                     = bs->read_only;
+    info->ro                     = bdrv_is_read_only(bs);
     info->drv                    = g_strdup(bs->drv->format_name);
     info->encrypted              = bs->encrypted;
 
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 2e98c7f4b6..71ddb08c21 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -1026,7 +1026,7 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
     int new_l1_bytes;
     int ret;
 
-    assert(bs->read_only);
+    assert(bdrv_is_read_only(bs));
 
     /* Search the snapshot */
     snapshot_index = find_snapshot_by_id_and_name(bs, snapshot_id, name);
diff --git a/block/qcow2.c b/block/qcow2.c
index 39b91ef940..ee4530cdbd 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1723,8 +1723,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     /* Clear unknown autoclear feature bits */
     update_header |= s->autoclear_features & ~QCOW2_AUTOCLEAR_MASK;
-    update_header =
-        update_header && !bs->read_only && !(flags & BDRV_O_INACTIVE);
+    update_header = update_header && bdrv_is_writable(bs);
     if (update_header) {
         s->autoclear_features &= QCOW2_AUTOCLEAR_MASK;
     }
@@ -1811,7 +1810,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
     /* Repair image if dirty */
-    if (!(flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) && !bs->read_only &&
+    if (!(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
         (s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
         BdrvCheckResult result = {0};
 
diff --git a/block/snapshot.c b/block/snapshot.c
index e8ae9a28c1..6702c75e42 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -415,7 +415,7 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
         error_setg(errp, "snapshot_id and name are both NULL");
         return -EINVAL;
     }
-    if (!bs->read_only) {
+    if (!bdrv_is_read_only(bs)) {
         error_setg(errp, "Device is not readonly");
         return -EINVAL;
     }
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 404fb5f3cb..7672161d95 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -801,7 +801,7 @@ int vhdx_parse_log(BlockDriverState *bs, BDRVVHDXState *s, bool *flushed,
     }
 
     if (logs.valid) {
-        if (bs->read_only) {
+        if (bdrv_is_read_only(bs)) {
             bdrv_refresh_filename(bs);
             ret = -EPERM;
             error_setg(errp,
-- 
2.30.2


