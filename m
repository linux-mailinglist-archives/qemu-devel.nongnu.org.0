Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDEB62C0A1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ5A-0001Ue-LC; Wed, 16 Nov 2022 09:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ52-00013y-Ua
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4w-0006CZ-2e
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUOwUQCGpk0pB0B8trhGgXXbW++AvBNYGEwyBZaC+hw=;
 b=fK0ptFscfQwMq51K2Xh1yX1m7jDiEeWZ1QWMjifSCAxpUWG1XOsiPVhhtaSK8fcWq2t4aw
 QYgT7DMOWKgIVbjYvJLAEZjjAnadnP4VtDcCwOgKJwt/ytZf88xRR5BNB6lBuFHQo9fHJI
 vwsxCcJZKd+5Orh1O4vs3TT4AA55hkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-JNd5ZdPBN1i2rOgmBFmLOg-1; Wed, 16 Nov 2022 09:07:45 -0500
X-MC-Unique: JNd5ZdPBN1i2rOgmBFmLOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D3F186F12E;
 Wed, 16 Nov 2022 14:07:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6195DC2C8C5;
 Wed, 16 Nov 2022 14:07:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 15/15] block: rename newly converted BlockDriver IO coroutine
 functions
Date: Wed, 16 Nov 2022 09:07:30 -0500
Message-Id: <20221116140730.3056048-16-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Since these functions alwayas run in coroutine context, adjust
their name to include "_co_", just like all other BlockDriver callbacks.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          | 32 ++++++++++-----------
 block/blkdebug.c                 |  4 +--
 block/blkio.c                    |  6 ++--
 block/blklogwrites.c             |  2 +-
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  2 +-
 block/copy-on-read.c             |  6 ++--
 block/crypto.c                   |  4 +--
 block/curl.c                     |  8 +++---
 block/file-posix.c               | 48 ++++++++++++++++----------------
 block/file-win32.c               |  8 +++---
 block/filter-compress.c          |  6 ++--
 block/gluster.c                  | 16 +++++------
 block/io.c                       | 16 +++++------
 block/iscsi.c                    |  8 +++---
 block/nbd.c                      |  6 ++--
 block/nfs.c                      |  2 +-
 block/null.c                     |  8 +++---
 block/nvme.c                     |  6 ++--
 block/preallocate.c              |  2 +-
 block/qcow.c                     |  2 +-
 block/qcow2.c                    |  6 ++--
 block/qed.c                      |  4 +--
 block/quorum.c                   |  2 +-
 block/raw-format.c               |  8 +++---
 block/rbd.c                      |  4 +--
 block/replication.c              |  2 +-
 block/ssh.c                      |  2 +-
 block/throttle.c                 |  2 +-
 block/vdi.c                      |  2 +-
 block/vhdx.c                     |  2 +-
 block/vmdk.c                     |  4 +--
 block/vpc.c                      |  2 +-
 include/block/block_int-common.h | 27 +++++++++---------
 34 files changed, 131 insertions(+), 130 deletions(-)

diff --git a/block.c b/block.c
index a2e3550d5c..78b3e7fcd6 100644
--- a/block.c
+++ b/block.c
@@ -1055,13 +1055,13 @@ int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
         return -ENOMEDIUM;
     }
 
-    /* Do not attempt drv->bdrv_getlength() on scsi-generic devices */
+    /* Do not attempt drv->bdrv_co_getlength() on scsi-generic devices */
     if (bdrv_is_sg(bs))
         return 0;
 
     /* query actual device if possible, otherwise just trust the hint */
-    if (drv->bdrv_getlength) {
-        int64_t length = drv->bdrv_getlength(bs);
+    if (drv->bdrv_co_getlength) {
+        int64_t length = drv->bdrv_co_getlength(bs);
         if (length < 0) {
             return length;
         }
@@ -5695,7 +5695,7 @@ exit:
 }
 
 /**
- * Implementation of BlockDriver.bdrv_get_allocated_file_size() that
+ * Implementation of BlockDriver.bdrv_co_get_allocated_file_size() that
  * sums the size of all data-bearing children.  (This excludes backing
  * children.)
  */
@@ -5732,8 +5732,8 @@ int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
     if (!drv) {
         return -ENOMEDIUM;
     }
-    if (drv->bdrv_get_allocated_file_size) {
-        return drv->bdrv_get_allocated_file_size(bs);
+    if (drv->bdrv_co_get_allocated_file_size) {
+        return drv->bdrv_co_get_allocated_file_size(bs);
     }
 
     if (drv->bdrv_file_open) {
@@ -6290,7 +6290,7 @@ int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     if (!drv) {
         return -ENOMEDIUM;
     }
-    if (!drv->bdrv_get_info) {
+    if (!drv->bdrv_co_get_info) {
         BlockDriverState *filtered = bdrv_filter_bs(bs);
         if (filtered) {
             return bdrv_co_get_info(filtered, bdi);
@@ -6298,7 +6298,7 @@ int coroutine_fn bdrv_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
         return -ENOTSUP;
     }
     memset(bdi, 0, sizeof(*bdi));
-    ret = drv->bdrv_get_info(bs, bdi);
+    ret = drv->bdrv_co_get_info(bs, bdi);
     if (ret < 0) {
         return ret;
     }
@@ -6336,11 +6336,11 @@ void coroutine_fn bdrv_co_debug_event(BlockDriverState *bs, BlkdebugEvent event)
     IO_CODE();
     assert_bdrv_graph_readable();
 
-    if (!bs || !bs->drv || !bs->drv->bdrv_debug_event) {
+    if (!bs || !bs->drv || !bs->drv->bdrv_co_debug_event) {
         return;
     }
 
-    bs->drv->bdrv_debug_event(bs, event);
+    bs->drv->bdrv_co_debug_event(bs, event);
 }
 
 static BlockDriverState *bdrv_find_debug_node(BlockDriverState *bs)
@@ -6790,8 +6790,8 @@ bool coroutine_fn bdrv_co_is_inserted(BlockDriverState *bs)
     if (!drv) {
         return false;
     }
-    if (drv->bdrv_is_inserted) {
-        return drv->bdrv_is_inserted(bs);
+    if (drv->bdrv_co_is_inserted) {
+        return drv->bdrv_co_is_inserted(bs);
     }
     QLIST_FOREACH(child, &bs->children, next) {
         if (!bdrv_co_is_inserted(child->bs)) {
@@ -6810,8 +6810,8 @@ void coroutine_fn bdrv_co_eject(BlockDriverState *bs, bool eject_flag)
     IO_CODE();
     assert_bdrv_graph_readable();
 
-    if (drv && drv->bdrv_eject) {
-        drv->bdrv_eject(bs, eject_flag);
+    if (drv && drv->bdrv_co_eject) {
+        drv->bdrv_co_eject(bs, eject_flag);
     }
 }
 
@@ -6826,8 +6826,8 @@ void coroutine_fn bdrv_co_lock_medium(BlockDriverState *bs, bool locked)
     assert_bdrv_graph_readable();
     trace_bdrv_lock_medium(bs, locked);
 
-    if (drv && drv->bdrv_lock_medium) {
-        drv->bdrv_lock_medium(bs, locked);
+    if (drv && drv->bdrv_co_lock_medium) {
+        drv->bdrv_co_lock_medium(bs, locked);
     }
 }
 
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 4265ca125e..1b85e84b7a 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -1076,7 +1076,7 @@ static BlockDriver bdrv_blkdebug = {
     .bdrv_reopen_prepare    = blkdebug_reopen_prepare,
     .bdrv_child_perm        = blkdebug_child_perm,
 
-    .bdrv_getlength         = blkdebug_getlength,
+    .bdrv_co_getlength         = blkdebug_getlength,
     .bdrv_refresh_filename  = blkdebug_refresh_filename,
     .bdrv_refresh_limits    = blkdebug_refresh_limits,
 
@@ -1087,7 +1087,7 @@ static BlockDriver bdrv_blkdebug = {
     .bdrv_co_pdiscard       = blkdebug_co_pdiscard,
     .bdrv_co_block_status   = blkdebug_co_block_status,
 
-    .bdrv_debug_event           = blkdebug_debug_event,
+    .bdrv_co_debug_event           = blkdebug_debug_event,
     .bdrv_debug_breakpoint      = blkdebug_debug_breakpoint,
     .bdrv_debug_remove_breakpoint
                                 = blkdebug_debug_remove_breakpoint,
diff --git a/block/blkio.c b/block/blkio.c
index 5eae3adfaf..669b940ce6 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -996,9 +996,9 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .instance_size           = sizeof(BDRVBlkioState), \
         .bdrv_file_open          = blkio_file_open, \
         .bdrv_close              = blkio_close, \
-        .bdrv_getlength          = blkio_getlength, \
+        .bdrv_co_getlength          = blkio_getlength, \
         .bdrv_co_truncate        = blkio_truncate, \
-        .bdrv_get_info           = blkio_get_info, \
+        .bdrv_co_get_info           = blkio_get_info, \
         .bdrv_attach_aio_context = blkio_attach_aio_context, \
         .bdrv_detach_aio_context = blkio_detach_aio_context, \
         .bdrv_co_pdiscard        = blkio_co_pdiscard, \
@@ -1006,7 +1006,7 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
         .bdrv_co_pwritev         = blkio_co_pwritev, \
         .bdrv_co_flush_to_disk   = blkio_co_flush, \
         .bdrv_co_pwrite_zeroes   = blkio_co_pwrite_zeroes, \
-        .bdrv_io_unplug          = blkio_io_unplug, \
+        .bdrv_co_io_unplug          = blkio_io_unplug, \
         .bdrv_refresh_limits     = blkio_refresh_limits, \
         .bdrv_register_buf       = blkio_register_buf, \
         .bdrv_unregister_buf     = blkio_unregister_buf, \
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index cef9efe55d..72ff8fb6a8 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -497,7 +497,7 @@ static BlockDriver bdrv_blk_log_writes = {
 
     .bdrv_open              = blk_log_writes_open,
     .bdrv_close             = blk_log_writes_close,
-    .bdrv_getlength         = blk_log_writes_getlength,
+    .bdrv_co_getlength         = blk_log_writes_getlength,
     .bdrv_child_perm        = blk_log_writes_child_perm,
     .bdrv_refresh_limits    = blk_log_writes_refresh_limits,
 
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 76a0b8d12a..3c82af100a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -135,7 +135,7 @@ static BlockDriver bdrv_blkreplay = {
 
     .bdrv_open              = blkreplay_open,
     .bdrv_child_perm        = bdrv_default_perms,
-    .bdrv_getlength         = blkreplay_getlength,
+    .bdrv_co_getlength         = blkreplay_getlength,
 
     .bdrv_co_preadv         = blkreplay_co_preadv,
     .bdrv_co_pwritev        = blkreplay_co_pwritev,
diff --git a/block/blkverify.c b/block/blkverify.c
index c60a2dc624..1a4bd68864 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -313,7 +313,7 @@ static BlockDriver bdrv_blkverify = {
     .bdrv_file_open                   = blkverify_open,
     .bdrv_close                       = blkverify_close,
     .bdrv_child_perm                  = bdrv_default_perms,
-    .bdrv_getlength                   = blkverify_getlength,
+    .bdrv_co_getlength                   = blkverify_getlength,
     .bdrv_refresh_filename            = blkverify_refresh_filename,
     .bdrv_dirname                     = blkverify_dirname,
 
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index ccc767f37b..ba76a1b3ec 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -249,7 +249,7 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_close                         = cor_close,
     .bdrv_child_perm                    = cor_child_perm,
 
-    .bdrv_getlength                     = cor_getlength,
+    .bdrv_co_getlength                     = cor_getlength,
 
     .bdrv_co_preadv_part                = cor_co_preadv_part,
     .bdrv_co_pwritev_part               = cor_co_pwritev_part,
@@ -257,8 +257,8 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_co_pdiscard                   = cor_co_pdiscard,
     .bdrv_co_pwritev_compressed         = cor_co_pwritev_compressed,
 
-    .bdrv_eject                         = cor_eject,
-    .bdrv_lock_medium                   = cor_lock_medium,
+    .bdrv_co_eject                         = cor_eject,
+    .bdrv_co_lock_medium                   = cor_lock_medium,
 
     .has_variable_length                = true,
     .is_filter                          = true,
diff --git a/block/crypto.c b/block/crypto.c
index 12a84dd1cd..0df4fee46d 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -953,9 +953,9 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_refresh_limits = block_crypto_refresh_limits,
     .bdrv_co_preadv     = block_crypto_co_preadv,
     .bdrv_co_pwritev    = block_crypto_co_pwritev,
-    .bdrv_getlength     = block_crypto_getlength,
+    .bdrv_co_getlength     = block_crypto_getlength,
     .bdrv_measure       = block_crypto_measure,
-    .bdrv_get_info      = block_crypto_get_info_luks,
+    .bdrv_co_get_info      = block_crypto_get_info_luks,
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
     .bdrv_amend_options = block_crypto_amend_options_luks,
     .bdrv_co_amend      = block_crypto_co_amend_luks,
diff --git a/block/curl.c b/block/curl.c
index cba4c4cac7..79735dfdc4 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -1001,7 +1001,7 @@ static BlockDriver bdrv_http = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength             = curl_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
@@ -1020,7 +1020,7 @@ static BlockDriver bdrv_https = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength             = curl_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
@@ -1039,7 +1039,7 @@ static BlockDriver bdrv_ftp = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength             = curl_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
@@ -1058,7 +1058,7 @@ static BlockDriver bdrv_ftps = {
     .bdrv_parse_filename        = curl_parse_filename,
     .bdrv_file_open             = curl_open,
     .bdrv_close                 = curl_close,
-    .bdrv_getlength             = curl_getlength,
+    .bdrv_co_getlength             = curl_getlength,
 
     .bdrv_co_preadv             = curl_co_preadv,
 
diff --git a/block/file-posix.c b/block/file-posix.c
index b9647c5ffc..09f2615cbe 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3321,14 +3321,14 @@ BlockDriver bdrv_file = {
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_plug = raw_aio_plug,
+    .bdrv_co_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate = raw_co_truncate,
-    .bdrv_getlength = raw_getlength,
-    .bdrv_get_info = raw_get_info,
-    .bdrv_get_allocated_file_size
+    .bdrv_co_getlength = raw_getlength,
+    .bdrv_co_get_info = raw_get_info,
+    .bdrv_co_get_allocated_file_size
                         = raw_get_allocated_file_size,
     .bdrv_get_specific_stats = raw_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
@@ -3693,14 +3693,14 @@ static BlockDriver bdrv_host_device = {
     .bdrv_co_copy_range_from = raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = raw_co_copy_range_to,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_plug = raw_aio_plug,
+    .bdrv_co_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate       = raw_co_truncate,
-    .bdrv_getlength	= raw_getlength,
-    .bdrv_get_info = raw_get_info,
-    .bdrv_get_allocated_file_size
+    .bdrv_co_getlength = raw_getlength,
+    .bdrv_co_get_info = raw_get_info,
+    .bdrv_co_get_allocated_file_size
                         = raw_get_allocated_file_size,
     .bdrv_get_specific_stats = hdev_get_specific_stats,
     .bdrv_check_perm = raw_check_perm,
@@ -3817,20 +3817,20 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_plug = raw_aio_plug,
+    .bdrv_co_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate    = raw_co_truncate,
-    .bdrv_getlength      = raw_getlength,
+    .bdrv_co_getlength      = raw_getlength,
     .has_variable_length = true,
-    .bdrv_get_allocated_file_size
+    .bdrv_co_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
     /* removable device support */
-    .bdrv_is_inserted   = cdrom_is_inserted,
-    .bdrv_eject         = cdrom_eject,
-    .bdrv_lock_medium   = cdrom_lock_medium,
+    .bdrv_co_is_inserted   = cdrom_is_inserted,
+    .bdrv_co_eject         = cdrom_eject,
+    .bdrv_co_lock_medium   = cdrom_lock_medium,
 
     /* generic scsi device */
     .bdrv_co_ioctl      = hdev_co_ioctl,
@@ -3947,20 +3947,20 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
     .bdrv_refresh_limits = raw_refresh_limits,
-    .bdrv_io_plug = raw_aio_plug,
-    .bdrv_io_unplug = raw_aio_unplug,
+    .bdrv_co_io_plug = raw_aio_plug,
+    .bdrv_co_io_unplug = raw_aio_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate    = raw_co_truncate,
-    .bdrv_getlength      = raw_getlength,
+    .bdrv_co_getlength      = raw_getlength,
     .has_variable_length = true,
-    .bdrv_get_allocated_file_size
+    .bdrv_co_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
     /* removable device support */
-    .bdrv_is_inserted   = cdrom_is_inserted,
-    .bdrv_eject         = cdrom_eject,
-    .bdrv_lock_medium   = cdrom_lock_medium,
+    .bdrv_co_is_inserted   = cdrom_is_inserted,
+    .bdrv_co_eject         = cdrom_eject,
+    .bdrv_co_lock_medium   = cdrom_lock_medium,
 };
 #endif /* __FreeBSD__ */
 
diff --git a/block/file-win32.c b/block/file-win32.c
index ec9d64d0e4..f611931631 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -763,8 +763,8 @@ BlockDriver bdrv_file = {
     .bdrv_aio_flush     = raw_aio_flush,
 
     .bdrv_co_truncate   = raw_co_truncate,
-    .bdrv_getlength	= raw_getlength,
-    .bdrv_get_allocated_file_size
+    .bdrv_co_getlength  = raw_getlength,
+    .bdrv_co_get_allocated_file_size
                         = raw_get_allocated_file_size,
 
     .create_opts        = &raw_create_opts,
@@ -932,10 +932,10 @@ static BlockDriver bdrv_host_device = {
     .bdrv_detach_aio_context = raw_detach_aio_context,
     .bdrv_attach_aio_context = raw_attach_aio_context,
 
-    .bdrv_getlength      = raw_getlength,
+    .bdrv_co_getlength      = raw_getlength,
     .has_variable_length = true,
 
-    .bdrv_get_allocated_file_size
+    .bdrv_co_get_allocated_file_size
                         = raw_get_allocated_file_size,
 };
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index e10312c225..7b3fa2fd82 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -134,7 +134,7 @@ static BlockDriver bdrv_compress = {
     .bdrv_open                          = compress_open,
     .bdrv_child_perm                    = bdrv_default_perms,
 
-    .bdrv_getlength                     = compress_getlength,
+    .bdrv_co_getlength                     = compress_getlength,
 
     .bdrv_co_preadv_part                = compress_co_preadv_part,
     .bdrv_co_pwritev_part               = compress_co_pwritev_part,
@@ -142,8 +142,8 @@ static BlockDriver bdrv_compress = {
     .bdrv_co_pdiscard                   = compress_co_pdiscard,
     .bdrv_refresh_limits                = compress_refresh_limits,
 
-    .bdrv_eject                         = compress_eject,
-    .bdrv_lock_medium                   = compress_lock_medium,
+    .bdrv_co_eject                         = compress_eject,
+    .bdrv_co_lock_medium                   = compress_lock_medium,
 
     .has_variable_length                = true,
     .is_filter                          = true,
diff --git a/block/gluster.c b/block/gluster.c
index 7c90f7ba4b..f15b522670 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1561,8 +1561,8 @@ static BlockDriver bdrv_gluster = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_getlength               = qemu_gluster_getlength,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
@@ -1590,8 +1590,8 @@ static BlockDriver bdrv_gluster_tcp = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_getlength               = qemu_gluster_getlength,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
@@ -1619,8 +1619,8 @@ static BlockDriver bdrv_gluster_unix = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_getlength               = qemu_gluster_getlength,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
@@ -1654,8 +1654,8 @@ static BlockDriver bdrv_gluster_rdma = {
     .bdrv_close                   = qemu_gluster_close,
     .bdrv_co_create               = qemu_gluster_co_create,
     .bdrv_co_create_opts          = qemu_gluster_co_create_opts,
-    .bdrv_getlength               = qemu_gluster_getlength,
-    .bdrv_get_allocated_file_size = qemu_gluster_allocated_file_size,
+    .bdrv_co_getlength               = qemu_gluster_getlength,
+    .bdrv_co_get_allocated_file_size = qemu_gluster_allocated_file_size,
     .bdrv_co_truncate             = qemu_gluster_co_truncate,
     .bdrv_co_readv                = qemu_gluster_co_readv,
     .bdrv_co_writev               = qemu_gluster_co_writev,
diff --git a/block/io.c b/block/io.c
index 48a94dd384..0ebe91ad04 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2648,8 +2648,8 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 
     bdrv_inc_in_flight(bs);
 
-    if (drv->bdrv_load_vmstate) {
-        ret = drv->bdrv_load_vmstate(bs, qiov, pos);
+    if (drv->bdrv_co_load_vmstate) {
+        ret = drv->bdrv_co_load_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_readv_vmstate(child_bs, qiov, pos);
     } else {
@@ -2681,8 +2681,8 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 
     bdrv_inc_in_flight(bs);
 
-    if (drv->bdrv_save_vmstate) {
-        ret = drv->bdrv_save_vmstate(bs, qiov, pos);
+    if (drv->bdrv_co_save_vmstate) {
+        ret = drv->bdrv_co_save_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_writev_vmstate(child_bs, qiov, pos);
     } else {
@@ -3080,8 +3080,8 @@ void coroutine_fn bdrv_co_io_plug(BlockDriverState *bs)
 
     if (qatomic_fetch_inc(&bs->io_plugged) == 0) {
         BlockDriver *drv = bs->drv;
-        if (drv && drv->bdrv_io_plug) {
-            drv->bdrv_io_plug(bs);
+        if (drv && drv->bdrv_co_io_plug) {
+            drv->bdrv_co_io_plug(bs);
         }
     }
 }
@@ -3095,8 +3095,8 @@ void coroutine_fn bdrv_co_io_unplug(BlockDriverState *bs)
     assert(bs->io_plugged);
     if (qatomic_fetch_dec(&bs->io_plugged) == 1) {
         BlockDriver *drv = bs->drv;
-        if (drv && drv->bdrv_io_unplug) {
-            drv->bdrv_io_unplug(bs);
+        if (drv && drv->bdrv_co_io_unplug) {
+            drv->bdrv_co_io_unplug(bs);
         }
     }
 
diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d96..a5e54150fa 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2433,8 +2433,8 @@ static BlockDriver bdrv_iscsi = {
     .bdrv_reopen_commit     = iscsi_reopen_commit,
     .bdrv_co_invalidate_cache = iscsi_co_invalidate_cache,
 
-    .bdrv_getlength  = iscsi_getlength,
-    .bdrv_get_info   = iscsi_get_info,
+    .bdrv_co_getlength  = iscsi_getlength,
+    .bdrv_co_get_info   = iscsi_get_info,
     .bdrv_co_truncate    = iscsi_co_truncate,
     .bdrv_refresh_limits = iscsi_refresh_limits,
 
@@ -2472,8 +2472,8 @@ static BlockDriver bdrv_iser = {
     .bdrv_reopen_commit     = iscsi_reopen_commit,
     .bdrv_co_invalidate_cache  = iscsi_co_invalidate_cache,
 
-    .bdrv_getlength  = iscsi_getlength,
-    .bdrv_get_info   = iscsi_get_info,
+    .bdrv_co_getlength  = iscsi_getlength,
+    .bdrv_co_get_info   = iscsi_get_info,
     .bdrv_co_truncate    = iscsi_co_truncate,
     .bdrv_refresh_limits = iscsi_refresh_limits,
 
diff --git a/block/nbd.c b/block/nbd.c
index 5cad58aaf6..015875a392 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2125,7 +2125,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-    .bdrv_getlength             = nbd_getlength,
+    .bdrv_co_getlength             = nbd_getlength,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2153,7 +2153,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-    .bdrv_getlength             = nbd_getlength,
+    .bdrv_co_getlength             = nbd_getlength,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2181,7 +2181,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-    .bdrv_getlength             = nbd_getlength,
+    .bdrv_co_getlength             = nbd_getlength,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
diff --git a/block/nfs.c b/block/nfs.c
index ece22353ac..afecb582b2 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -884,7 +884,7 @@ static BlockDriver bdrv_nfs = {
     .bdrv_has_zero_init             = nfs_has_zero_init,
 /* libnfs does not provide the allocated filesize of a file on win32. */
 #if !defined(_WIN32)
-    .bdrv_get_allocated_file_size   = nfs_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size   = nfs_get_allocated_file_size,
 #endif
     .bdrv_co_truncate               = nfs_file_co_truncate,
 
diff --git a/block/null.c b/block/null.c
index 75f7d0db40..a2f52e112b 100644
--- a/block/null.c
+++ b/block/null.c
@@ -283,8 +283,8 @@ static BlockDriver bdrv_null_co = {
 
     .bdrv_file_open         = null_file_open,
     .bdrv_parse_filename    = null_co_parse_filename,
-    .bdrv_getlength         = null_getlength,
-    .bdrv_get_allocated_file_size = null_allocated_file_size,
+    .bdrv_co_getlength         = null_getlength,
+    .bdrv_co_get_allocated_file_size = null_allocated_file_size,
 
     .bdrv_co_preadv         = null_co_preadv,
     .bdrv_co_pwritev        = null_co_pwritev,
@@ -304,8 +304,8 @@ static BlockDriver bdrv_null_aio = {
 
     .bdrv_file_open         = null_file_open,
     .bdrv_parse_filename    = null_aio_parse_filename,
-    .bdrv_getlength         = null_getlength,
-    .bdrv_get_allocated_file_size = null_allocated_file_size,
+    .bdrv_co_getlength         = null_getlength,
+    .bdrv_co_get_allocated_file_size = null_allocated_file_size,
 
     .bdrv_aio_preadv        = null_aio_preadv,
     .bdrv_aio_pwritev       = null_aio_pwritev,
diff --git a/block/nvme.c b/block/nvme.c
index 656624c585..9be9722029 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1642,7 +1642,7 @@ static BlockDriver bdrv_nvme = {
     .bdrv_parse_filename      = nvme_parse_filename,
     .bdrv_file_open           = nvme_file_open,
     .bdrv_close               = nvme_close,
-    .bdrv_getlength           = nvme_getlength,
+    .bdrv_co_getlength           = nvme_getlength,
     .bdrv_probe_blocksizes    = nvme_probe_blocksizes,
     .bdrv_co_truncate         = nvme_co_truncate,
 
@@ -1663,8 +1663,8 @@ static BlockDriver bdrv_nvme = {
     .bdrv_detach_aio_context  = nvme_detach_aio_context,
     .bdrv_attach_aio_context  = nvme_attach_aio_context,
 
-    .bdrv_io_plug             = nvme_aio_plug,
-    .bdrv_io_unplug           = nvme_aio_unplug,
+    .bdrv_co_io_plug             = nvme_aio_plug,
+    .bdrv_co_io_unplug           = nvme_aio_unplug,
 
     .bdrv_register_buf        = nvme_register_buf,
     .bdrv_unregister_buf      = nvme_unregister_buf,
diff --git a/block/preallocate.c b/block/preallocate.c
index d50ee7f49b..584a8b5912 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -536,7 +536,7 @@ BlockDriver bdrv_preallocate_filter = {
     .format_name = "preallocate",
     .instance_size = sizeof(BDRVPreallocateState),
 
-    .bdrv_getlength = preallocate_getlength,
+    .bdrv_co_getlength = preallocate_getlength,
     .bdrv_open = preallocate_open,
     .bdrv_close = preallocate_close,
 
diff --git a/block/qcow.c b/block/qcow.c
index daa38839ab..167c135dbe 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1198,7 +1198,7 @@ static BlockDriver bdrv_qcow = {
 
     .bdrv_make_empty        = qcow_make_empty,
     .bdrv_co_pwritev_compressed = qcow_co_pwritev_compressed,
-    .bdrv_get_info          = qcow_get_info,
+    .bdrv_co_get_info          = qcow_get_info,
 
     .create_opts            = &qcow_create_opts,
     .strong_runtime_opts    = qcow_strong_runtime_opts,
diff --git a/block/qcow2.c b/block/qcow2.c
index 4d6666d3ff..7bdb310db3 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -6078,11 +6078,11 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_snapshot_list     = qcow2_snapshot_list,
     .bdrv_snapshot_load_tmp = qcow2_snapshot_load_tmp,
     .bdrv_measure           = qcow2_measure,
-    .bdrv_get_info          = qcow2_get_info,
+    .bdrv_co_get_info          = qcow2_get_info,
     .bdrv_get_specific_info = qcow2_get_specific_info,
 
-    .bdrv_save_vmstate    = qcow2_save_vmstate,
-    .bdrv_load_vmstate    = qcow2_load_vmstate,
+    .bdrv_co_save_vmstate    = qcow2_save_vmstate,
+    .bdrv_co_load_vmstate    = qcow2_load_vmstate,
 
     .is_format                  = true,
     .supports_backing           = true,
diff --git a/block/qed.c b/block/qed.c
index 778b23d0f6..f83fcbd4c8 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1656,8 +1656,8 @@ static BlockDriver bdrv_qed = {
     .bdrv_co_writev           = bdrv_qed_co_writev,
     .bdrv_co_pwrite_zeroes    = bdrv_qed_co_pwrite_zeroes,
     .bdrv_co_truncate         = bdrv_qed_co_truncate,
-    .bdrv_getlength           = bdrv_qed_getlength,
-    .bdrv_get_info            = bdrv_qed_get_info,
+    .bdrv_co_getlength           = bdrv_qed_getlength,
+    .bdrv_co_get_info            = bdrv_qed_get_info,
     .bdrv_refresh_limits      = bdrv_qed_refresh_limits,
     .bdrv_change_backing_file = bdrv_qed_change_backing_file,
     .bdrv_co_invalidate_cache = bdrv_qed_co_invalidate_cache,
diff --git a/block/quorum.c b/block/quorum.c
index f9e6539ceb..ce5090d31a 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1283,7 +1283,7 @@ static BlockDriver bdrv_quorum = {
 
     .bdrv_co_flush                      = quorum_co_flush,
 
-    .bdrv_getlength                     = quorum_getlength,
+    .bdrv_co_getlength                     = quorum_getlength,
 
     .bdrv_co_preadv                     = quorum_co_preadv,
     .bdrv_co_pwritev                    = quorum_co_pwritev,
diff --git a/block/raw-format.c b/block/raw-format.c
index 96a9b33384..87d997d640 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -621,16 +621,16 @@ BlockDriver bdrv_raw = {
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
     .bdrv_co_truncate     = &raw_co_truncate,
-    .bdrv_getlength       = &raw_getlength,
+    .bdrv_co_getlength       = &raw_getlength,
     .is_format            = true,
     .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
-    .bdrv_get_info        = &raw_get_info,
+    .bdrv_co_get_info        = &raw_get_info,
     .bdrv_refresh_limits  = &raw_refresh_limits,
     .bdrv_probe_blocksizes = &raw_probe_blocksizes,
     .bdrv_probe_geometry  = &raw_probe_geometry,
-    .bdrv_eject           = &raw_eject,
-    .bdrv_lock_medium     = &raw_lock_medium,
+    .bdrv_co_eject           = &raw_eject,
+    .bdrv_co_lock_medium     = &raw_lock_medium,
     .bdrv_co_ioctl        = &raw_co_ioctl,
     .create_opts          = &raw_create_opts,
     .bdrv_has_zero_init   = &raw_has_zero_init,
diff --git a/block/rbd.c b/block/rbd.c
index f826410f40..a0317d470a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1655,10 +1655,10 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_create         = qemu_rbd_co_create,
     .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
     .bdrv_has_zero_init     = bdrv_has_zero_init_1,
-    .bdrv_get_info          = qemu_rbd_getinfo,
+    .bdrv_co_get_info          = qemu_rbd_getinfo,
     .bdrv_get_specific_info = qemu_rbd_get_specific_info,
     .create_opts            = &qemu_rbd_create_opts,
-    .bdrv_getlength         = qemu_rbd_getlength,
+    .bdrv_co_getlength         = qemu_rbd_getlength,
     .bdrv_co_truncate       = qemu_rbd_co_truncate,
     .protocol_name          = "rbd",
 
diff --git a/block/replication.c b/block/replication.c
index c62f48a874..321db05465 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -758,7 +758,7 @@ static BlockDriver bdrv_replication = {
     .bdrv_close                 = replication_close,
     .bdrv_child_perm            = replication_child_perm,
 
-    .bdrv_getlength             = replication_getlength,
+    .bdrv_co_getlength             = replication_getlength,
     .bdrv_co_readv              = replication_co_readv,
     .bdrv_co_writev             = replication_co_writev,
 
diff --git a/block/ssh.c b/block/ssh.c
index 04726d4ecb..c70db1e4e2 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -1363,7 +1363,7 @@ static BlockDriver bdrv_ssh = {
     .bdrv_has_zero_init           = ssh_has_zero_init,
     .bdrv_co_readv                = ssh_co_readv,
     .bdrv_co_writev               = ssh_co_writev,
-    .bdrv_getlength               = ssh_getlength,
+    .bdrv_co_getlength               = ssh_getlength,
     .bdrv_co_truncate             = ssh_co_truncate,
     .bdrv_co_flush_to_disk        = ssh_co_flush,
     .bdrv_refresh_filename        = ssh_refresh_filename,
diff --git a/block/throttle.c b/block/throttle.c
index 88851c84f4..260ffeace2 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -245,7 +245,7 @@ static BlockDriver bdrv_throttle = {
 
     .bdrv_child_perm                    =   bdrv_default_perms,
 
-    .bdrv_getlength                     =   throttle_getlength,
+    .bdrv_co_getlength                     =   throttle_getlength,
 
     .bdrv_co_preadv                     =   throttle_co_preadv,
     .bdrv_co_pwritev                    =   throttle_co_pwritev,
diff --git a/block/vdi.c b/block/vdi.c
index c0c111c4b9..6e4bf24e8c 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -1049,7 +1049,7 @@ static BlockDriver bdrv_vdi = {
     .bdrv_co_pwritev    = vdi_co_pwritev,
 #endif
 
-    .bdrv_get_info = vdi_get_info,
+    .bdrv_co_get_info = vdi_get_info,
 
     .is_format = true,
     .create_opts = &vdi_create_opts,
diff --git a/block/vhdx.c b/block/vhdx.c
index bad9ca691b..85c6f8b68e 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2245,7 +2245,7 @@ static BlockDriver bdrv_vhdx = {
     .bdrv_co_writev         = vhdx_co_writev,
     .bdrv_co_create         = vhdx_co_create,
     .bdrv_co_create_opts    = vhdx_co_create_opts,
-    .bdrv_get_info          = vhdx_get_info,
+    .bdrv_co_get_info          = vhdx_get_info,
     .bdrv_co_check          = vhdx_co_check,
     .bdrv_has_zero_init     = vhdx_has_zero_init,
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 0c32bf2e83..768ce89a08 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -3130,11 +3130,11 @@ static BlockDriver bdrv_vmdk = {
     .bdrv_co_create_opts          = vmdk_co_create_opts,
     .bdrv_co_create               = vmdk_co_create,
     .bdrv_co_block_status         = vmdk_co_block_status,
-    .bdrv_get_allocated_file_size = vmdk_get_allocated_file_size,
+    .bdrv_co_get_allocated_file_size = vmdk_get_allocated_file_size,
     .bdrv_has_zero_init           = vmdk_has_zero_init,
     .bdrv_get_specific_info       = vmdk_get_specific_info,
     .bdrv_refresh_limits          = vmdk_refresh_limits,
-    .bdrv_get_info                = vmdk_get_info,
+    .bdrv_co_get_info                = vmdk_get_info,
     .bdrv_gather_child_options    = vmdk_gather_child_options,
 
     .is_format                    = true,
diff --git a/block/vpc.c b/block/vpc.c
index 95841f259a..96c25975a0 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1240,7 +1240,7 @@ static BlockDriver bdrv_vpc = {
     .bdrv_co_pwritev            = vpc_co_pwritev,
     .bdrv_co_block_status       = vpc_co_block_status,
 
-    .bdrv_get_info          = vpc_get_info,
+    .bdrv_co_get_info          = vpc_get_info,
 
     .is_format              = true,
     .create_opts            = &vpc_create_opts,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 3ab3fa45a2..0bc180a585 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -724,9 +724,10 @@ struct BlockDriver {
                                          bool exact, PreallocMode prealloc,
                                          BdrvRequestFlags flags, Error **errp);
     /* Called with graph rdlock held. */
-    int64_t coroutine_fn (*bdrv_getlength)(BlockDriverState *bs);
+    int64_t coroutine_fn (*bdrv_co_getlength)(BlockDriverState *bs);
     /* Called with graph rdlock held. */
-    int64_t coroutine_fn (*bdrv_get_allocated_file_size)(BlockDriverState *bs);
+    int64_t coroutine_fn (*bdrv_co_get_allocated_file_size)
+                                                        (BlockDriverState *bs);
 
     /* Does not need graph rdlock, since it does not traverse the graph */
     BlockMeasureInfo *(*bdrv_measure)(QemuOpts *opts, BlockDriverState *in_bs,
@@ -741,7 +742,7 @@ struct BlockDriver {
         size_t qiov_offset);
 
     /* Called with graph rdlock held. */
-    int coroutine_fn (*bdrv_get_info)(BlockDriverState *bs,
+    int coroutine_fn (*bdrv_co_get_info)(BlockDriverState *bs,
                                       BlockDriverInfo *bdi);
 
     /* Does not need graph rdlock, since it does not traverse the graph */
@@ -751,18 +752,18 @@ struct BlockDriver {
     BlockStatsSpecific *(*bdrv_get_specific_stats)(BlockDriverState *bs);
 
     /* Called with graph rdlock held. */
-    int coroutine_fn (*bdrv_save_vmstate)(BlockDriverState *bs,
-                                          QEMUIOVector *qiov,
-                                          int64_t pos);
+    int coroutine_fn (*bdrv_co_save_vmstate)(BlockDriverState *bs,
+                                             QEMUIOVector *qiov,
+                                             int64_t pos);
     /* Called with graph rdlock held. */
-    int coroutine_fn (*bdrv_load_vmstate)(BlockDriverState *bs,
+    int coroutine_fn (*bdrv_co_load_vmstate)(BlockDriverState *bs,
                                           QEMUIOVector *qiov,
                                           int64_t pos);
 
     /* removable device specific. Called with graph rdlock held. */
-    bool coroutine_fn (*bdrv_is_inserted)(BlockDriverState *bs);
-    void coroutine_fn (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
-    void coroutine_fn (*bdrv_lock_medium)(BlockDriverState *bs, bool locked);
+    bool coroutine_fn (*bdrv_co_is_inserted)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_co_eject)(BlockDriverState *bs, bool eject_flag);
+    void coroutine_fn (*bdrv_co_lock_medium)(BlockDriverState *bs, bool locked);
 
     /* to control generic scsi devices. Called with graph rdlock taken. */
     BlockAIOCB *coroutine_fn (*bdrv_aio_ioctl)(BlockDriverState *bs,
@@ -782,12 +783,12 @@ struct BlockDriver {
                                       BdrvCheckMode fix);
 
     /* Called with graph rdlock taken. */
-    void coroutine_fn (*bdrv_debug_event)(BlockDriverState *bs,
+    void coroutine_fn (*bdrv_co_debug_event)(BlockDriverState *bs,
                                           BlkdebugEvent event);
 
     /* io queue for linux-aio. Called with graph rdlock taken. */
-    void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
-    void coroutine_fn (*bdrv_io_unplug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_co_io_plug)(BlockDriverState *bs);
+    void coroutine_fn (*bdrv_co_io_unplug)(BlockDriverState *bs);
 
     /**
      * bdrv_drain_begin is called if implemented in the beginning of a
-- 
2.31.1


