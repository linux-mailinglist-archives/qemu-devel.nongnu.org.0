Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A4151F2C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 18:19:16 +0100 (CET)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz1r1-0002Yb-3a
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 12:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iz1hY-0003Bx-SN
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:09:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iz1hV-0002fz-Pt
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:09:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iz1hV-0002bl-JU
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580836164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIZsHvk5ee72FG8H+m0W3CLFZ9Wu03OlLulQiRGCCoY=;
 b=ZwvYCBjdch+rghXmkD2E9Kr630e/gwOZSLwRjpe5eLzdX0HuiSHA4pipEQYcL3JJvI7Mut
 9l37VaPxpn6ovyAFiPUOKWzcxqf8A1dcrj8Q797KlomB/NlPcoum9YEoSbNxozWvNon3C9
 2zWqK2D8udMZg2KqXwZsZvDg0cQwWEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-jb8OQJLrPBKy3k2TLnfY1Q-1; Tue, 04 Feb 2020 12:09:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65DF1DBAC;
 Tue,  4 Feb 2020 17:09:03 +0000 (UTC)
Received: from localhost (ovpn-117-98.ams2.redhat.com [10.36.117.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 867FC384;
 Tue,  4 Feb 2020 17:09:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 04/33] block: Add BdrvChildRole to BdrvChild
Date: Tue,  4 Feb 2020 18:08:19 +0100
Message-Id: <20200204170848.614480-5-mreitz@redhat.com>
In-Reply-To: <20200204170848.614480-1-mreitz@redhat.com>
References: <20200204170848.614480-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jb8OQJLrPBKy3k2TLnfY1Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now, it is always set to 0.  Later patches in this series will
ensure that all callers pass an appropriate combination of flags.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c                     | 11 ++++++++---
 block/backup-top.c          |  3 ++-
 block/blkdebug.c            |  2 +-
 block/blklogwrites.c        |  6 +++---
 block/blkreplay.c           |  2 +-
 block/blkverify.c           |  4 ++--
 block/block-backend.c       |  4 ++--
 block/bochs.c               |  2 +-
 block/cloop.c               |  2 +-
 block/copy-on-read.c        |  2 +-
 block/crypto.c              |  2 +-
 block/dmg.c                 |  2 +-
 block/filter-compress.c     |  2 +-
 block/parallels.c           |  2 +-
 block/qcow.c                |  2 +-
 block/qcow2.c               |  6 +++---
 block/qed.c                 |  2 +-
 block/quorum.c              |  4 ++--
 block/raw-format.c          |  2 +-
 block/replication.c         |  2 +-
 block/throttle.c            |  2 +-
 block/vdi.c                 |  2 +-
 block/vhdx.c                |  2 +-
 block/vmdk.c                |  4 ++--
 block/vpc.c                 |  2 +-
 block/vvfat.c               |  2 +-
 blockjob.c                  |  5 +++--
 include/block/block.h       |  2 ++
 include/block/block_int.h   |  2 ++
 tests/test-bdrv-drain.c     | 20 +++++++++++---------
 tests/test-bdrv-graph-mod.c |  4 ++--
 31 files changed, 62 insertions(+), 49 deletions(-)

diff --git a/block.c b/block.c
index 5835161172..c576377650 100644
--- a/block.c
+++ b/block.c
@@ -2381,6 +2381,7 @@ static void bdrv_replace_child(BdrvChild *child, Bloc=
kDriverState *new_bs)
 BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
                                   AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp)
@@ -2402,6 +2403,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *c=
hild_bs,
         .bs             =3D NULL,
         .name           =3D g_strdup(child_name),
         .klass          =3D child_class,
+        .role           =3D child_role,
         .perm           =3D perm,
         .shared_perm    =3D shared_perm,
         .opaque         =3D opaque,
@@ -2453,6 +2455,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent=
_bs,
                              BlockDriverState *child_bs,
                              const char *child_name,
                              const BdrvChildClass *child_class,
+                             BdrvChildRole child_role,
                              Error **errp)
 {
     BdrvChild *child;
@@ -2465,7 +2468,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent=
_bs,
                     perm, shared_perm, &perm, &shared_perm);
=20
     child =3D bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   bdrv_get_aio_context(parent_bs),
+                                   child_role, bdrv_get_aio_context(parent=
_bs),
                                    perm, shared_perm, parent_bs, errp);
     if (child =3D=3D NULL) {
         return NULL;
@@ -2586,7 +2589,7 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockD=
riverState *backing_hd,
     }
=20
     bs->backing =3D bdrv_attach_child(bs, backing_hd, "backing", &child_ba=
cking,
-                                    errp);
+                                    0, errp);
     /* If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL). */
@@ -2777,6 +2780,7 @@ BdrvChild *bdrv_open_child(const char *filename,
                            QDict *options, const char *bdref_key,
                            BlockDriverState *parent,
                            const BdrvChildClass *child_class,
+                           BdrvChildRole child_role,
                            bool allow_none, Error **errp)
 {
     BlockDriverState *bs;
@@ -2787,7 +2791,8 @@ BdrvChild *bdrv_open_child(const char *filename,
         return NULL;
     }
=20
-    return bdrv_attach_child(parent, bs, bdref_key, child_class, errp);
+    return bdrv_attach_child(parent, bs, bdref_key, child_class, child_rol=
e,
+                             errp);
 }
=20
 /*
diff --git a/block/backup-top.c b/block/backup-top.c
index 21a75f1422..3c812358ce 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -200,7 +200,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverSta=
te *source,
     state =3D top->opaque;
=20
     bdrv_ref(target);
-    state->target =3D bdrv_attach_child(top, target, "target", &child_file=
, errp);
+    state->target =3D bdrv_attach_child(top, target, "target", &child_file=
, 0,
+                                      errp);
     if (!state->target) {
         bdrv_unref(target);
         bdrv_unref(top);
diff --git a/block/blkdebug.c b/block/blkdebug.c
index f369d54ee4..c91e78d5c8 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -497,7 +497,7 @@ static int blkdebug_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
=20
     /* Open the image file */
     bs->file =3D bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "=
image",
-                               bs, &child_file, false, &local_err);
+                               bs, &child_file, 0, false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f3b3259d8d..739db6dcf6 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -157,7 +157,7 @@ static int blk_log_writes_open(BlockDriverState *bs, QD=
ict *options, int flags,
     }
=20
     /* Open the file */
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, f=
alse,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
, false,
                                &local_err);
     if (local_err) {
         ret =3D -EINVAL;
@@ -166,8 +166,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QD=
ict *options, int flags,
     }
=20
     /* Open the log file */
-    s->log_file =3D bdrv_open_child(NULL, options, "log", bs, &child_file,=
 false,
-                                  &local_err);
+    s->log_file =3D bdrv_open_child(NULL, options, "log", bs, &child_file,=
 0,
+                                  false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index c96ac8f4bc..f97493f45a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -28,7 +28,7 @@ static int blkreplay_open(BlockDriverState *bs, QDict *op=
tions, int flags,
=20
     /* Open the image file */
     bs->file =3D bdrv_open_child(NULL, options, "image",
-                               bs, &child_file, false, &local_err);
+                               bs, &child_file, 0, false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blkverify.c b/block/blkverify.c
index ba6b1853ae..ba4f6d7b7c 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -125,7 +125,7 @@ static int blkverify_open(BlockDriverState *bs, QDict *=
options, int flags,
=20
     /* Open the raw file */
     bs->file =3D bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "ra=
w",
-                               bs, &child_file, false, &local_err);
+                               bs, &child_file, 0, false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
@@ -134,7 +134,7 @@ static int blkverify_open(BlockDriverState *bs, QDict *=
options, int flags,
=20
     /* Open the test file */
     s->test_file =3D bdrv_open_child(qemu_opt_get(opts, "x-image"), option=
s,
-                                   "test", bs, &child_format, false,
+                                   "test", bs, &child_format, 0, false,
                                    &local_err);
     if (local_err) {
         ret =3D -EINVAL;
diff --git a/block/block-backend.c b/block/block-backend.c
index 3d7e96e0d4..4b79b2abb1 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -400,7 +400,7 @@ BlockBackend *blk_new_open(const char *filename, const =
char *reference,
         return NULL;
     }
=20
-    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root, blk->ctx=
,
+    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root, 0, blk->=
ctx,
                                        perm, BLK_PERM_ALL, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
@@ -811,7 +811,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *=
bs, Error **errp)
 {
     ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
     bdrv_ref(bs);
-    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root, blk->ctx=
,
+    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root, 0, blk->=
ctx,
                                        blk->perm, blk->shared_perm, blk, e=
rrp);
     if (blk->root =3D=3D NULL) {
         return -EPERM;
diff --git a/block/bochs.c b/block/bochs.c
index e7bbeaa1c4..b013e73063 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -110,7 +110,7 @@ static int bochs_open(BlockDriverState *bs, QDict *opti=
ons, int flags,
         return ret;
     }
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/cloop.c b/block/cloop.c
index f90f1a4b4c..3ed9fa63cc 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -71,7 +71,7 @@ static int cloop_open(BlockDriverState *bs, QDict *option=
s, int flags,
         return ret;
     }
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 7504ca6ffc..a2c4e6dc58 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -28,7 +28,7 @@
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, f=
alse,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
, false,
                                errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/crypto.c b/block/crypto.c
index b81f673a51..4da74a7737 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -200,7 +200,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat=
 format,
     unsigned int cflags =3D 0;
     QDict *cryptoopts =3D NULL;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/dmg.c b/block/dmg.c
index ef3c6e771d..af8188638c 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -439,7 +439,7 @@ static int dmg_open(BlockDriverState *bs, QDict *option=
s, int flags,
         return ret;
     }
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 82c315b298..4dc5f9fb8c 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -30,7 +30,7 @@
 static int compress_open(BlockDriverState *bs, QDict *options, int flags,
                          Error **errp)
 {
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, f=
alse,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
, false,
                                errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/parallels.c b/block/parallels.c
index 30eda982bd..3d5b3b7c63 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -728,7 +728,7 @@ static int parallels_open(BlockDriverState *bs, QDict *=
options, int flags,
     Error *local_err =3D NULL;
     char *buf;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/qcow.c b/block/qcow.c
index 0e4f09934c..2bf8e8eb36 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -130,7 +130,7 @@ static int qcow_open(BlockDriverState *bs, QDict *optio=
ns, int flags,
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
     encryptfmt =3D qdict_get_try_str(encryptopts, "format");
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         ret =3D -EINVAL;
diff --git a/block/qcow2.c b/block/qcow2.c
index 8e057556eb..94e394d608 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1535,7 +1535,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverStat=
e *bs, QDict *options,
=20
     /* Open external data file */
     s->data_file =3D bdrv_open_child(NULL, options, "data-file", bs, &chil=
d_file,
-                                   true, &local_err);
+                                   0, true, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         ret =3D -EINVAL;
@@ -1545,7 +1545,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverStat=
e *bs, QDict *options,
     if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
         if (!s->data_file && s->image_data_file) {
             s->data_file =3D bdrv_open_child(s->image_data_file, options,
-                                           "data-file", bs, &child_file,
+                                           "data-file", bs, &child_file, 0=
,
                                            false, errp);
             if (!s->data_file) {
                 ret =3D -EINVAL;
@@ -1805,7 +1805,7 @@ static int qcow2_open(BlockDriverState *bs, QDict *op=
tions, int flags,
         .ret =3D -EINPROGRESS
     };
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/qed.c b/block/qed.c
index eb6139acbc..d15ba11959 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -547,7 +547,7 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
         .ret =3D -EINPROGRESS
     };
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/quorum.c b/block/quorum.c
index f354d9bf69..e53d02bbcd 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -992,7 +992,7 @@ static int quorum_open(BlockDriverState *bs, QDict *opt=
ions, int flags,
         assert(ret < 32);
=20
         s->children[i].child =3D bdrv_open_child(NULL, options, indexstr, =
bs,
-                                               &child_format, false,
+                                               &child_format, 0, false,
                                                &local_err);
         if (local_err) {
             ret =3D -EINVAL;
@@ -1069,7 +1069,7 @@ static void quorum_add_child(BlockDriverState *bs, Bl=
ockDriverState *child_bs,
     /* We can safely add the child now */
     bdrv_ref(child_bs);
=20
-    child =3D bdrv_attach_child(bs, child_bs, indexstr, &child_format, err=
p);
+    child =3D bdrv_attach_child(bs, child_bs, indexstr, &child_format, 0, =
errp);
     if (child =3D=3D NULL) {
         s->next_child_index--;
         goto out;
diff --git a/block/raw-format.c b/block/raw-format.c
index 2429ff0d23..b600dae209 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -431,7 +431,7 @@ static int raw_open(BlockDriverState *bs, QDict *option=
s, int flags,
     BDRVRawState *s =3D bs->opaque;
     int ret;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/replication.c b/block/replication.c
index e268a6e5c5..c05df1bc16 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -90,7 +90,7 @@ static int replication_open(BlockDriverState *bs, QDict *=
options,
     const char *mode;
     const char *top_id;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/throttle.c b/block/throttle.c
index 71f4bb0ad1..2dea913be7 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -82,7 +82,7 @@ static int throttle_open(BlockDriverState *bs, QDict *opt=
ions,
     int ret;
=20
     bs->file =3D bdrv_open_child(NULL, options, "file", bs,
-                               &child_file, false, errp);
+                               &child_file, 0, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/vdi.c b/block/vdi.c
index 7e87b205b5..987e2ed592 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -378,7 +378,7 @@ static int vdi_open(BlockDriverState *bs, QDict *option=
s, int flags,
     Error *local_err =3D NULL;
     QemuUUID uuid_link, uuid_parent;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/vhdx.c b/block/vhdx.c
index d3c1619026..be23290ac8 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -997,7 +997,7 @@ static int vhdx_open(BlockDriverState *bs, QDict *optio=
ns, int flags,
     uint64_t signature;
     Error *local_err =3D NULL;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/vmdk.c b/block/vmdk.c
index 631fcd15ab..84f99d881f 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1152,7 +1152,7 @@ static int vmdk_parse_extents(const char *desc, Block=
DriverState *bs,
         assert(ret < 32);
=20
         extent_file =3D bdrv_open_child(extent_path, options, extent_opt_p=
refix,
-                                      bs, &child_file, false, &local_err);
+                                      bs, &child_file, 0, false, &local_er=
r);
         g_free(extent_path);
         if (local_err) {
             error_propagate(errp, local_err);
@@ -1257,7 +1257,7 @@ static int vmdk_open(BlockDriverState *bs, QDict *opt=
ions, int flags,
     uint32_t magic;
     Error *local_err =3D NULL;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/vpc.c b/block/vpc.c
index 7cf0f87a16..5378e32d1d 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -228,7 +228,7 @@ static int vpc_open(BlockDriverState *bs, QDict *option=
s, int flags,
     int ret;
     int64_t bs_size;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/vvfat.c b/block/vvfat.c
index 70f6985fbb..0c0b224947 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3192,7 +3192,7 @@ static int enable_write_target(BlockDriverState *bs, =
Error **errp)
     options =3D qdict_new();
     qdict_put_str(options, "write-target.driver", "qcow");
     s->qcow =3D bdrv_open_child(s->qcow_filename, options, "write-target",=
 bs,
-                              &child_vvfat_qcow, false, errp);
+                              &child_vvfat_qcow, 0, false, errp);
     qobject_unref(options);
     if (!s->qcow) {
         ret =3D -EINVAL;
diff --git a/blockjob.c b/blockjob.c
index 79f303822b..533ef0af30 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -217,8 +217,9 @@ int block_job_add_bdrv(BlockJob *job, const char *name,=
 BlockDriverState *bs,
     if (job->job.aio_context !=3D qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
-    c =3D bdrv_root_attach_child(bs, name, &child_job, job->job.aio_contex=
t,
-                               perm, shared_perm, job, errp);
+    c =3D bdrv_root_attach_child(bs, name, &child_job, 0,
+                               job->job.aio_context, perm, shared_perm, jo=
b,
+                               errp);
     if (job->job.aio_context !=3D qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
     }
diff --git a/include/block/block.h b/include/block/block.h
index 0f7e8caa5b..7ad819f045 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -333,6 +333,7 @@ BdrvChild *bdrv_open_child(const char *filename,
                            QDict *options, const char *bdref_key,
                            BlockDriverState* parent,
                            const BdrvChildClass *child_class,
+                           BdrvChildRole child_role,
                            bool allow_none, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
 void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_h=
d,
@@ -576,6 +577,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_b=
s,
                              BlockDriverState *child_bs,
                              const char *child_name,
                              const BdrvChildClass *child_class,
+                             BdrvChildRole child_role,
                              Error **errp);
=20
 bool bdrv_op_is_blocked(BlockDriverState *bs, BlockOpType op, Error **errp=
);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index bbd933d782..4817c2d38c 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -746,6 +746,7 @@ struct BdrvChild {
     BlockDriverState *bs;
     char *name;
     const BdrvChildClass *klass;
+    BdrvChildRole role;
     void *opaque;
=20
     /**
@@ -1228,6 +1229,7 @@ void hmp_drive_add_node(Monitor *mon, const char *opt=
str);
 BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
                                   AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp);
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 9d683a6c11..c03705ea37 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -1202,7 +1202,7 @@ static void do_test_delete_by_drain(bool detach_inste=
ad_of_delete,
=20
     null_bs =3D bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_P=
ROTOCOL,
                         &error_abort);
-    bdrv_attach_child(bs, null_bs, "null-child", &child_file, &error_abort=
);
+    bdrv_attach_child(bs, null_bs, "null-child", &child_file, 0, &error_ab=
ort);
=20
     /* This child will be the one to pass to requests through to, and
      * it will stall until a drain occurs */
@@ -1211,13 +1211,13 @@ static void do_test_delete_by_drain(bool detach_ins=
tead_of_delete,
     child_bs->total_sectors =3D 65536 >> BDRV_SECTOR_BITS;
     /* Takes our reference to child_bs */
     tts->wait_child =3D bdrv_attach_child(bs, child_bs, "wait-child", &chi=
ld_file,
-                                        &error_abort);
+                                        0, &error_abort);
=20
     /* This child is just there to be deleted
      * (for detach_instead_of_delete =3D=3D true) */
     null_bs =3D bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_P=
ROTOCOL,
                         &error_abort);
-    bdrv_attach_child(bs, null_bs, "null-child", &child_file, &error_abort=
);
+    bdrv_attach_child(bs, null_bs, "null-child", &child_file, 0, &error_ab=
ort);
=20
     blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
     blk_insert_bs(blk, bs, &error_abort);
@@ -1314,7 +1314,7 @@ static void detach_indirect_bh(void *opaque)
=20
     bdrv_ref(data->c);
     data->child_c =3D bdrv_attach_child(data->parent_b, data->c, "PB-C",
-                                      &child_file, &error_abort);
+                                      &child_file, 0, &error_abort);
 }
=20
 static void detach_by_parent_aio_cb(void *opaque, int ret)
@@ -1396,13 +1396,15 @@ static void test_detach_indirect(bool by_parent_cb)
     /* Set child relationships */
     bdrv_ref(b);
     bdrv_ref(a);
-    child_b =3D bdrv_attach_child(parent_b, b, "PB-B", &child_file, &error=
_abort);
-    child_a =3D bdrv_attach_child(parent_b, a, "PB-A", &child_backing, &er=
ror_abort);
+    child_b =3D bdrv_attach_child(parent_b, b, "PB-B", &child_file, 0,
+                                &error_abort);
+    child_a =3D bdrv_attach_child(parent_b, a, "PB-A", &child_backing, 0,
+                                &error_abort);
=20
     bdrv_ref(a);
     bdrv_attach_child(parent_a, a, "PA-A",
                       by_parent_cb ? &child_file : &detach_by_driver_cb_cl=
ass,
-                      &error_abort);
+                      0, &error_abort);
=20
     g_assert_cmpint(parent_a->refcnt, =3D=3D, 1);
     g_assert_cmpint(parent_b->refcnt, =3D=3D, 1);
@@ -1813,7 +1815,7 @@ static void test_drop_intermediate_poll(void)
             /* Takes the reference to chain[i - 1] */
             chain[i]->backing =3D bdrv_attach_child(chain[i], chain[i - 1]=
,
                                                   "chain", &chain_child_cl=
ass,
-                                                  &error_abort);
+                                                  0, &error_abort);
         }
     }
=20
@@ -2031,7 +2033,7 @@ static void do_test_replace_child_mid_drain(int old_d=
rain_count,
=20
     bdrv_ref(old_child_bs);
     parent_bs->backing =3D bdrv_attach_child(parent_bs, old_child_bs, "chi=
ld",
-                                           &child_backing, &error_abort);
+                                           &child_backing, 0, &error_abort=
);
=20
     for (i =3D 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index fef42cb294..8b8c186c9f 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -111,7 +111,7 @@ static void test_update_perm_tree(void)
=20
     blk_insert_bs(root, bs, &error_abort);
=20
-    bdrv_attach_child(filter, bs, "child", &child_file, &error_abort);
+    bdrv_attach_child(filter, bs, "child", &child_file, 0, &error_abort);
=20
     bdrv_append(filter, bs, &local_err);
=20
@@ -177,7 +177,7 @@ static void test_should_update_child(void)
     bdrv_set_backing_hd(target, bs, &error_abort);
=20
     g_assert(target->backing->bs =3D=3D bs);
-    bdrv_attach_child(filter, target, "target", &child_file, &error_abort)=
;
+    bdrv_attach_child(filter, target, "target", &child_file, 0, &error_abo=
rt);
     bdrv_append(filter, bs, &error_abort);
     g_assert(target->backing->bs =3D=3D bs);
=20
--=20
2.24.1


