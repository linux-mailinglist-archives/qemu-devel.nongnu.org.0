Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADB261004A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:34:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7gF-0001Ux-Fk; Thu, 27 Oct 2022 14:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gD-0001PQ-58
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g6-0002R2-71
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awiRcd0IeiOoVx7HjLmZzN9WM5Mf+MZr9m53BmKl7hQ=;
 b=MzTwzrTAQx40OKq2HyQ9Xw9rqKkz5PI+xU29Fp2JqZr+fSsxvQ0yKV0ZwX13NspB/mALgn
 BrGrD6gStrZR5aeKj64M8g8iMtSvdA9Hs4xAqqpgH/92aTRVWJc6Ho1K1p6pXsLaJyw/zZ
 hJm9Ew9WWC/GEph6Yh2LU7oocUDQ3FU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-A9xfqKRTNu-gZCQ0a7sppQ-1; Thu, 27 Oct 2022 14:32:27 -0400
X-MC-Unique: A9xfqKRTNu-gZCQ0a7sppQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B861101E14C;
 Thu, 27 Oct 2022 18:32:27 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17EAF112C06D;
 Thu, 27 Oct 2022 18:32:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 09/58] block: introduce bdrv_open_file_child() helper
Date: Thu, 27 Oct 2022 20:30:57 +0200
Message-Id: <20221027183146.463129-10-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Almost all drivers call bdrv_open_child() similarly. Let's create a
helper for this.

The only not updated drivers that call bdrv_open_child() to set
bs->file are raw-format and snapshot-access:
    raw-format sometimes want to have filtered child but
        don't set drv->is_filter to true.
    snapshot-access wants only DATA | PRIMARY

Possibly we should implement drv->is_filter_func() handler, to consider
raw-format as filter when it works as filter.. But it's another story.

Note also, that we decrease assignments to bs->file in code: it helps
us restrict modifying this field in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-3-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h |  3 +++
 block.c                            | 21 +++++++++++++++++++++
 block/blkdebug.c                   |  9 +++------
 block/blklogwrites.c               |  7 ++-----
 block/blkreplay.c                  |  7 ++-----
 block/blkverify.c                  |  9 +++------
 block/bochs.c                      |  7 +++----
 block/cloop.c                      |  7 +++----
 block/copy-before-write.c          |  9 ++++-----
 block/copy-on-read.c               |  9 ++++-----
 block/crypto.c                     | 11 ++++++-----
 block/dmg.c                        |  7 +++----
 block/filter-compress.c            |  8 +++-----
 block/parallels.c                  |  7 +++----
 block/preallocate.c                |  9 ++++-----
 block/qcow.c                       |  6 ++----
 block/qcow2.c                      |  8 ++++----
 block/qed.c                        |  8 ++++----
 block/replication.c                |  8 +++-----
 block/throttle.c                   |  8 +++-----
 block/vdi.c                        |  7 +++----
 block/vhdx.c                       |  7 +++----
 block/vmdk.c                       |  7 +++----
 block/vpc.c                        |  7 +++----
 24 files changed, 95 insertions(+), 101 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 21265e3966..29a38d7e18 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -76,6 +76,9 @@ BdrvChild *bdrv_open_child(const char *filename,
                            const BdrvChildClass *child_class,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp);
diff --git a/block.c b/block.c
index c8374dac4f..25a596a612 100644
--- a/block.c
+++ b/block.c
@@ -3673,6 +3673,27 @@ BdrvChild *bdrv_open_child(const char *filename,
                              errp);
 }
 
+/*
+ * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
+ */
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent, Error **errp)
+{
+    BdrvChildRole role;
+
+    /* commit_top and mirror_top don't use this function */
+    assert(!parent->drv->filtered_child_is_backing);
+
+    role = parent->drv->is_filter ?
+        (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
+
+    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
+                                   &child_of_bds, role, false, errp);
+
+    return parent->file ? 0 : -EINVAL;
+}
+
 /*
  * TODO Future callers may need to specify parent/child_class in order for
  * option inheritance to work. Existing callers use it for the root node.
diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..5fcfc8ac6f 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -503,12 +503,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the image file */
-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "image",
-                               bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-image"), options, "image",
+                               bs, errp);
+    if (ret < 0) {
         goto out;
     }
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index e3c6c4039c..12b4c3c8cf 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -155,11 +155,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the file */
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, false,
-                               errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/blkreplay.c b/block/blkreplay.c
index dcbe780ddb..76a0b8d12a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -26,11 +26,8 @@ static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
 
     /* Open the image file */
-    bs->file = bdrv_open_child(NULL, options, "image", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "image", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/blkverify.c b/block/blkverify.c
index 020b1ae7b6..43a2d94f7b 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -122,12 +122,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the raw file */
-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "raw",
-                               bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-raw"), options, "raw",
+                               bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/bochs.c b/block/bochs.c
index b76f34fe03..e30e3908d9 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -110,10 +110,9 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = bdrv_pread(bs->file, 0, sizeof(bochs), &bochs, 0);
diff --git a/block/cloop.c b/block/cloop.c
index 40b146e714..3ff975a94d 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -71,10 +71,9 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* read header */
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index afbdd04489..4abaa7339e 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -412,6 +412,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     int64_t cluster_size;
     g_autoptr(BlockdevOptions) full_opts = NULL;
     BlockdevOptionsCbw *opts;
+    int ret;
 
     full_opts = cbw_parse_options(options, errp);
     if (!full_opts) {
@@ -420,11 +421,9 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     assert(full_opts->driver == BLOCKDEV_DRIVER_COPY_BEFORE_WRITE);
     opts = &full_opts->u.copy_before_write;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 1fc7fb3333..815ac1d835 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -41,12 +41,11 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVStateCOR *state = bs->opaque;
     /* Find a bottom node name, if any */
     const char *bottom_node = qdict_get_try_str(options, "bottom");
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bs->supported_read_flags = BDRV_REQ_PREFETCH;
diff --git a/block/crypto.c b/block/crypto.c
index 7a57774b76..396e529bb2 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -261,15 +261,14 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 {
     BlockCrypto *crypto = bs->opaque;
     QemuOpts *opts = NULL;
-    int ret = -EINVAL;
+    int ret;
     QCryptoBlockOpenOptions *open_opts = NULL;
     unsigned int cflags = 0;
     QDict *cryptoopts = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bs->supported_write_flags = BDRV_REQ_FUA &
@@ -277,6 +276,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     opts = qemu_opts_create(opts_spec, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
@@ -285,6 +285,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     open_opts = block_crypto_open_opts_init(cryptoopts, errp);
     if (!open_opts) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
diff --git a/block/dmg.c b/block/dmg.c
index 98db18d82a..422136276a 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -440,10 +440,9 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     block_module_load_one("dmg-bz2");
diff --git a/block/filter-compress.c b/block/filter-compress.c
index d5be538619..305716c86c 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -30,11 +30,9 @@
 static int compress_open(BlockDriverState *bs, QDict *options, int flags,
                          Error **errp)
 {
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    int ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     if (!bs->file->bs->drv || !block_driver_can_compress(bs->file->bs->drv)) {
diff --git a/block/parallels.c b/block/parallels.c
index c1523e7dab..27c81cee40 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -737,10 +737,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     Error *local_err = NULL;
     char *buf;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
diff --git a/block/preallocate.c b/block/preallocate.c
index e15cb8c74a..d50ee7f49b 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -134,6 +134,7 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
                             Error **errp)
 {
     BDRVPreallocateState *s = bs->opaque;
+    int ret;
 
     /*
      * s->data_end and friends should be initialized on permission update.
@@ -141,11 +142,9 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
      */
     s->file_end = s->zero_start = s->data_end = -EINVAL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     if (!preallocate_absorb_opts(&s->opts, options, bs->file->bs, errp)) {
diff --git a/block/qcow.c b/block/qcow.c
index 311aaa8705..72ed4c3321 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -121,10 +121,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
     encryptfmt = qdict_get_try_str(encryptopts, "format");
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index b57f7cc8ee..b47016cf61 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1905,11 +1905,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
         .errp = errp,
         .ret = -EINPROGRESS
     };
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Initialise locks */
diff --git a/block/qed.c b/block/qed.c
index bda00e6257..4627169348 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -561,11 +561,11 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
         .errp = errp,
         .ret = -EINPROGRESS
     };
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bdrv_qed_init_state(bs);
diff --git a/block/replication.c b/block/replication.c
index c67f931f37..ee33dc4598 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -88,11 +88,9 @@ static int replication_open(BlockDriverState *bs, QDict *options,
     const char *mode;
     const char *top_id;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = -EINVAL;
diff --git a/block/throttle.c b/block/throttle.c
index ddd450593a..131eba3ab4 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -78,11 +78,9 @@ static int throttle_open(BlockDriverState *bs, QDict *options,
     char *group;
     int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
     bs->supported_write_flags = bs->file->bs->supported_write_flags |
                                 BDRV_REQ_WRITE_UNCHANGED;
diff --git a/block/vdi.c b/block/vdi.c
index e942325455..a9bafb5a9e 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -377,10 +377,9 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     QemuUUID uuid_link, uuid_parent;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     logout("\n");
diff --git a/block/vhdx.c b/block/vhdx.c
index e10e78ebfd..ce1e75f5ec 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1001,10 +1001,9 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     uint64_t signature;
     Error *local_err = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     s->bat = NULL;
diff --git a/block/vmdk.c b/block/vmdk.c
index f7d8856dfb..d75a87cb85 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1308,10 +1308,9 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVVmdkState *s = bs->opaque;
     uint32_t magic;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     buf = vmdk_read_desc(bs->file, 0, errp);
diff --git a/block/vpc.c b/block/vpc.c
index 4f49ef207f..95841f259a 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -233,10 +233,9 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     int64_t bs_size;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     opts = qemu_opts_create(&vpc_runtime_opts, NULL, 0, &error_abort);
-- 
2.37.3


