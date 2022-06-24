Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B0C55A38E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:33:21 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qvY-00049D-JS
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qru-0008Sf-RS; Fri, 24 Jun 2022 17:29:34 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:41044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrq-0004Q5-Up; Fri, 24 Jun 2022 17:29:34 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 381CA2E3068;
 Sat, 25 Jun 2022 00:29:22 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 CUtgNtsa4u-TKKO8Hvk; Sat, 25 Jun 2022 00:29:22 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106162; bh=IGGxq7ihyAZ3Ymvw/EUpg178n2XzwIujGvZbgGcU0Co=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=UvFkVzjhgn4sS06NgwRV+kKMljX/nn9Mefhp2flAfLKWguDeOeh9gTGKZiG5h8V3v
 kkz2d7P0/XEch+H2QDny/5y9l8a/Y08vnhgZtuApPcWubH427rPlKzc8gO3x++yXDb
 682W4z4cGOMjxr9MgzDAkCsoZ6Glo63l+wXSE7so=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TKMS5GSn; Sat, 25 Jun 2022 00:29:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v6 02/15] block: introduce bdrv_open_file_child() helper
Date: Sat, 25 Jun 2022 00:28:17 +0300
Message-Id: <20220624212830.316919-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
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
 include/block/block-global-state.h |  3 +++
 24 files changed, 95 insertions(+), 101 deletions(-)

diff --git a/block.c b/block.c
index 2c00dddd80..883b1bb242 100644
--- a/block.c
+++ b/block.c
@@ -3666,6 +3666,27 @@ BdrvChild *bdrv_open_child(const char *filename,
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
index f7a251e91f..f66a617eb3 100644
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
index e4a37af3b2..e4d40a63aa 100644
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
index 4d68658087..b2dc06bbfd 100644
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
 
     ret = bdrv_pread(bs->file, 0, &bochs, sizeof(bochs));
diff --git a/block/cloop.c b/block/cloop.c
index b8c6d0eccd..bee87da173 100644
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
index a8a06fdc09..4fad564691 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -376,12 +376,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
     int64_t cluster_size;
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
index 1ba82984ef..e165447a5b 100644
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
index c626587f9c..f91c5d3980 100644
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
index 8879b7027a..952ef86514 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -736,10 +736,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
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
 
     ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
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
index 4fba1b9e36..b4033c0db9 100644
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
index 4f5e6440fb..90df4c4dd1 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1895,11 +1895,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
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
index f34d9a3ac1..1ff024f16d 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -559,11 +559,11 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
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
index 55c8f894aa..2f17397764 100644
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
index 6e8d52fa24..4fb5798c27 100644
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
index cca3a3a356..a539081138 100644
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
index 410c6f9610..994f8b91cc 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -997,10 +997,9 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
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
index 38e5ab3806..7f23d5d86b 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1315,10 +1315,9 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
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
index 4d8f16e199..cd82eb7f92 100644
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
-- 
2.25.1


