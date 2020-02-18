Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E0162469
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:20:11 +0100 (CET)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3zz8-0001qv-Hs
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zvD-000372-Bx
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zvA-0007vH-Vq
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:07 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:9013)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1j3zv4-0007re-Gk; Tue, 18 Feb 2020 05:15:58 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id DBD3E41AA3;
 Tue, 18 Feb 2020 11:08:06 +0100 (CET)
From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu 1/6] drive-mirror: add support for sync=bitmap mode=never
Date: Tue, 18 Feb 2020 11:07:35 +0100
Message-Id: <20200218100740.2228521-2-f.gruenbichler@proxmox.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218100740.2228521-1-f.gruenbichler@proxmox.com>
References: <20200218100740.2228521-1-f.gruenbichler@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Ma Haocong <mahaocong@didichuxing.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This patch adds support for the "BITMAP" sync mode to drive-mirror and
blockdev-mirror. It adds support only for the BitmapSyncMode "never,"
because it's the simplest mode.

This mode simply uses a user-provided bitmap as an initial copy
manifest, and then does not clear any bits in the bitmap at the
conclusion of the operation.

Any new writes dirtied during the operation are copied out, in contrast
to backup. Note that whether these writes are reflected in the bitmap
at the conclusion of the operation depends on whether that bitmap is
actually recording!

This patch was originally based on one by Ma Haocong, but it has since
been modified pretty heavily.

Suggested-by: Ma Haocong <mahaocong@didichuxing.com>
Signed-off-by: Ma Haocong <mahaocong@didichuxing.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Signed-off-by: Fabian Gr=C3=BCnbichler <f.gruenbichler@proxmox.com>
---
Note: this is just rebased, and broken - see patch #4

I intentionally kept those separate as initial RFC, they will be
squashed in the next iteration!

 include/block/block_int.h   |  4 +-
 block/mirror.c              | 98 ++++++++++++++++++++++++++++++-------
 blockdev.c                  | 39 +++++++++++++--
 tests/test-block-iothread.c |  4 +-
 qapi/block-core.json        | 29 +++++++++--
 5 files changed, 145 insertions(+), 29 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 640fb82c78..f0b747b09b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1175,7 +1175,9 @@ void mirror_start(const char *job_id, BlockDriverSt=
ate *bs,
                   BlockDriverState *target, const char *replaces,
                   int creation_flags, int64_t speed,
                   uint32_t granularity, int64_t buf_size,
-                  MirrorSyncMode mode, BlockMirrorBackingMode backing_mo=
de,
+                  MirrorSyncMode mode, BdrvDirtyBitmap *bitmap,
+                  BitmapSyncMode bitmap_mode,
+                  BlockMirrorBackingMode backing_mode,
                   bool zero_target,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
diff --git a/block/mirror.c b/block/mirror.c
index f0f2d9dff1..fd7f574365 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -49,7 +49,7 @@ typedef struct MirrorBlockJob {
     BlockDriverState *to_replace;
     /* Used to block operations on the drive-mirror-replace target */
     Error *replace_blocker;
-    bool is_none_mode;
+    MirrorSyncMode sync_mode;
     BlockMirrorBackingMode backing_mode;
     /* Whether the target image requires explicit zero-initialization */
     bool zero_target;
@@ -64,6 +64,8 @@ typedef struct MirrorBlockJob {
     size_t buf_size;
     int64_t bdev_length;
     unsigned long *cow_bitmap;
+    BdrvDirtyBitmap *sync_bitmap;
+    BitmapSyncMode bitmap_mode;
     BdrvDirtyBitmap *dirty_bitmap;
     BdrvDirtyBitmapIter *dbi;
     uint8_t *buf;
@@ -668,7 +670,8 @@ static int mirror_exit_common(Job *job)
     bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
                              &error_abort);
     if (!abort && s->backing_mode =3D=3D MIRROR_SOURCE_BACKING_CHAIN) {
-        BlockDriverState *backing =3D s->is_none_mode ? src : s->base;
+        BlockDriverState *backing;
+        backing =3D s->sync_mode =3D=3D MIRROR_SYNC_MODE_NONE ? src : s-=
>base;
         if (backing_bs(target_bs) !=3D backing) {
             bdrv_set_backing_hd(target_bs, backing, &local_err);
             if (local_err) {
@@ -750,6 +753,16 @@ static void mirror_abort(Job *job)
     assert(ret =3D=3D 0);
 }
=20
+/* Always called after commit/abort. */
+static void mirror_clean(Job *job)
+{
+    MirrorBlockJob *s =3D container_of(job, MirrorBlockJob, common.job);
+
+    if (s->sync_bitmap) {
+        bdrv_dirty_bitmap_set_busy(s->sync_bitmap, false);
+    }
+}
+
 static void coroutine_fn mirror_throttle(MirrorBlockJob *s)
 {
     int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -928,7 +941,8 @@ static int coroutine_fn mirror_run(Job *job, Error **=
errp)
     mirror_free_init(s);
=20
     s->last_pause_ns =3D qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
-    if (!s->is_none_mode) {
+    if ((s->sync_mode =3D=3D MIRROR_SYNC_MODE_TOP) ||
+        (s->sync_mode =3D=3D MIRROR_SYNC_MODE_FULL)) {
         ret =3D mirror_dirty_init(s);
         if (ret < 0 || job_is_cancelled(&s->common.job)) {
             goto immediate_exit;
@@ -1160,6 +1174,7 @@ static const BlockJobDriver mirror_job_driver =3D {
         .run                    =3D mirror_run,
         .prepare                =3D mirror_prepare,
         .abort                  =3D mirror_abort,
+        .clean                  =3D mirror_clean,
         .pause                  =3D mirror_pause,
         .complete               =3D mirror_complete,
     },
@@ -1175,6 +1190,7 @@ static const BlockJobDriver commit_active_job_drive=
r =3D {
         .run                    =3D mirror_run,
         .prepare                =3D mirror_prepare,
         .abort                  =3D mirror_abort,
+        .clean                  =3D mirror_clean,
         .pause                  =3D mirror_pause,
         .complete               =3D mirror_complete,
     },
@@ -1520,7 +1536,10 @@ static BlockJob *mirror_start_job(
                              BlockCompletionFunc *cb,
                              void *opaque,
                              const BlockJobDriver *driver,
-                             bool is_none_mode, BlockDriverState *base,
+                             MirrorSyncMode sync_mode,
+                             BdrvDirtyBitmap *bitmap,
+                             BitmapSyncMode bitmap_mode,
+                             BlockDriverState *base,
                              bool auto_complete, const char *filter_node=
_name,
                              bool is_mirror, MirrorCopyMode copy_mode,
                              Error **errp)
@@ -1533,10 +1552,39 @@ static BlockJob *mirror_start_job(
     Error *local_err =3D NULL;
     int ret;
=20
-    if (granularity =3D=3D 0) {
-        granularity =3D bdrv_get_default_bitmap_granularity(target);
+    if (sync_mode =3D=3D MIRROR_SYNC_MODE_INCREMENTAL) {
+        error_setg(errp, "Sync mode '%s' not supported",
+                   MirrorSyncMode_str(sync_mode));
+        return NULL;
+    } else if (sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP) {
+        if (!bitmap) {
+            error_setg(errp, "Must provide a valid bitmap name for '%s'"
+                       " sync mode",
+                       MirrorSyncMode_str(sync_mode));
+            return NULL;
+        } else if (bitmap_mode !=3D BITMAP_SYNC_MODE_NEVER) {
+            error_setg(errp,
+                       "Bitmap Sync Mode '%s' is not supported by Mirror=
",
+                       BitmapSyncMode_str(bitmap_mode));
+        }
+    } else if (bitmap) {
+        error_setg(errp,
+                   "sync mode '%s' is not compatible with bitmaps",
+                   MirrorSyncMode_str(sync_mode));
+        return NULL;
     }
=20
+    if (bitmap) {
+        if (granularity) {
+            error_setg(errp, "granularity (%d)"
+                       "cannot be specified when a bitmap is provided",
+                       granularity);
+            return NULL;
+        }
+        granularity =3D bdrv_dirty_bitmap_granularity(bitmap);
+    } else if (granularity =3D=3D 0) {
+        granularity =3D bdrv_get_default_bitmap_granularity(target);
+    }
     assert(is_power_of_2(granularity));
=20
     if (buf_size < 0) {
@@ -1640,7 +1688,9 @@ static BlockJob *mirror_start_job(
     s->replaces =3D g_strdup(replaces);
     s->on_source_error =3D on_source_error;
     s->on_target_error =3D on_target_error;
-    s->is_none_mode =3D is_none_mode;
+    s->sync_mode =3D sync_mode;
+    s->sync_bitmap =3D bitmap;
+    s->bitmap_mode =3D bitmap_mode;
     s->backing_mode =3D backing_mode;
     s->zero_target =3D zero_target;
     s->copy_mode =3D copy_mode;
@@ -1660,6 +1710,18 @@ static BlockJob *mirror_start_job(
         bdrv_disable_dirty_bitmap(s->dirty_bitmap);
     }
=20
+    if (s->sync_bitmap) {
+        bdrv_dirty_bitmap_set_busy(s->sync_bitmap, true);
+    }
+
+    if (s->sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP) {
+        bdrv_merge_dirty_bitmap(s->dirty_bitmap, s->sync_bitmap,
+                                NULL, &local_err);
+        if (local_err) {
+            goto fail;
+        }
+    }
+
     ret =3D block_job_add_bdrv(&s->common, "source", bs, 0,
                              BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRITE |
                              BLK_PERM_CONSISTENT_READ,
@@ -1713,6 +1775,9 @@ fail:
         if (s->dirty_bitmap) {
             bdrv_release_dirty_bitmap(s->dirty_bitmap);
         }
+        if (s->sync_bitmap) {
+            bdrv_dirty_bitmap_set_busy(s->sync_bitmap, false);
+        }
         job_early_fail(&s->common.job);
     }
=20
@@ -1730,29 +1795,23 @@ void mirror_start(const char *job_id, BlockDriver=
State *bs,
                   BlockDriverState *target, const char *replaces,
                   int creation_flags, int64_t speed,
                   uint32_t granularity, int64_t buf_size,
-                  MirrorSyncMode mode, BlockMirrorBackingMode backing_mo=
de,
+                  MirrorSyncMode mode, BdrvDirtyBitmap *bitmap,
+                  BitmapSyncMode bitmap_mode,
+                  BlockMirrorBackingMode backing_mode,
                   bool zero_target,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
                   bool unmap, const char *filter_node_name,
                   MirrorCopyMode copy_mode, Error **errp)
 {
-    bool is_none_mode;
     BlockDriverState *base;
=20
-    if ((mode =3D=3D MIRROR_SYNC_MODE_INCREMENTAL) ||
-        (mode =3D=3D MIRROR_SYNC_MODE_BITMAP)) {
-        error_setg(errp, "Sync mode '%s' not supported",
-                   MirrorSyncMode_str(mode));
-        return;
-    }
-    is_none_mode =3D mode =3D=3D MIRROR_SYNC_MODE_NONE;
     base =3D mode =3D=3D MIRROR_SYNC_MODE_TOP ? backing_bs(bs) : NULL;
     mirror_start_job(job_id, bs, creation_flags, target, replaces,
                      speed, granularity, buf_size, backing_mode, zero_ta=
rget,
                      on_source_error, on_target_error, unmap, NULL, NULL=
,
-                     &mirror_job_driver, is_none_mode, base, false,
-                     filter_node_name, true, copy_mode, errp);
+                     &mirror_job_driver, mode, bitmap, bitmap_mode, base=
,
+                     false, filter_node_name, true, copy_mode, errp);
 }
=20
 BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
@@ -1778,7 +1837,8 @@ BlockJob *commit_active_start(const char *job_id, B=
lockDriverState *bs,
                      job_id, bs, creation_flags, base, NULL, speed, 0, 0=
,
                      MIRROR_LEAVE_BACKING_CHAIN, false,
                      on_error, on_error, true, cb, opaque,
-                     &commit_active_job_driver, false, base, auto_comple=
te,
+                     &commit_active_job_driver, MIRROR_SYNC_MODE_FULL,
+                     NULL, 0, base, auto_complete,
                      filter_node_name, false, MIRROR_COPY_MODE_BACKGROUN=
D,
                      &local_err);
     if (local_err) {
diff --git a/blockdev.c b/blockdev.c
index c6a727cca9..8f7b7ba5eb 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3770,6 +3770,10 @@ static void blockdev_mirror_common(const char *job=
_id, BlockDriverState *bs,
                                    BlockDriverState *target,
                                    bool has_replaces, const char *replac=
es,
                                    enum MirrorSyncMode sync,
+                                   bool has_bitmap,
+                                   const char *bitmap_name,
+                                   bool has_bitmap_mode,
+                                   BitmapSyncMode bitmap_mode,
                                    BlockMirrorBackingMode backing_mode,
                                    bool zero_target,
                                    bool has_speed, int64_t speed,
@@ -3788,6 +3792,7 @@ static void blockdev_mirror_common(const char *job_=
id, BlockDriverState *bs,
                                    Error **errp)
 {
     int job_flags =3D JOB_DEFAULT;
+    BdrvDirtyBitmap *bitmap =3D NULL;
=20
     if (!has_speed) {
         speed =3D 0;
@@ -3842,6 +3847,29 @@ static void blockdev_mirror_common(const char *job=
_id, BlockDriverState *bs,
         sync =3D MIRROR_SYNC_MODE_FULL;
     }
=20
+    if (has_bitmap) {
+        if (granularity) {
+            error_setg(errp, "Granularity and bitmap cannot both be set"=
);
+            return;
+        }
+
+        if (!has_bitmap_mode) {
+            error_setg(errp, "bitmap-mode must be specified if"
+                       " a bitmap is provided");
+            return;
+        }
+
+        bitmap =3D bdrv_find_dirty_bitmap(bs, bitmap_name);
+        if (!bitmap) {
+            error_setg(errp, "Dirty bitmap '%s' not found", bitmap_name)=
;
+            return;
+        }
+
+        if (bdrv_dirty_bitmap_check(bitmap, BDRV_BITMAP_ALLOW_RO, errp))=
 {
+            return;
+        }
+    }
+
     if (has_replaces) {
         BlockDriverState *to_replace_bs;
         AioContext *replace_aio_context;
@@ -3879,8 +3907,8 @@ static void blockdev_mirror_common(const char *job_=
id, BlockDriverState *bs,
      * and will allow to check whether the node still exist at mirror co=
mpletion
      */
     mirror_start(job_id, bs, target,
-                 has_replaces ? replaces : NULL, job_flags,
-                 speed, granularity, buf_size, sync, backing_mode, zero_=
target,
+                 has_replaces ? replaces : NULL, job_flags, speed, granu=
larity,
+                 buf_size, sync, bitmap, bitmap_mode, backing_mode, zero=
_target,
                  on_source_error, on_target_error, unmap, filter_node_na=
me,
                  copy_mode, errp);
 }
@@ -4021,6 +4049,8 @@ void qmp_drive_mirror(DriveMirror *arg, Error **err=
p)
=20
     blockdev_mirror_common(arg->has_job_id ? arg->job_id : NULL, bs, tar=
get_bs,
                            arg->has_replaces, arg->replaces, arg->sync,
+                           arg->has_bitmap, arg->bitmap,
+                           arg->has_bitmap_mode, arg->bitmap_mode,
                            backing_mode, zero_target,
                            arg->has_speed, arg->speed,
                            arg->has_granularity, arg->granularity,
@@ -4043,6 +4073,8 @@ void qmp_blockdev_mirror(bool has_job_id, const cha=
r *job_id,
                          const char *device, const char *target,
                          bool has_replaces, const char *replaces,
                          MirrorSyncMode sync,
+                         bool has_bitmap, const char *bitmap,
+                         bool has_bitmap_mode, BitmapSyncMode bitmap_mod=
e,
                          bool has_speed, int64_t speed,
                          bool has_granularity, uint32_t granularity,
                          bool has_buf_size, int64_t buf_size,
@@ -4093,7 +4125,8 @@ void qmp_blockdev_mirror(bool has_job_id, const cha=
r *job_id,
     }
=20
     blockdev_mirror_common(has_job_id ? job_id : NULL, bs, target_bs,
-                           has_replaces, replaces, sync, backing_mode,
+                           has_replaces, replaces, sync, has_bitmap,
+                           bitmap, has_bitmap_mode, bitmap_mode, backing=
_mode,
                            zero_target, has_speed, speed,
                            has_granularity, granularity,
                            has_buf_size, buf_size,
diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index 0c861809f0..da87a67a57 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -611,8 +611,8 @@ static void test_propagate_mirror(void)
=20
     /* Start a mirror job */
     mirror_start("job0", src, target, NULL, JOB_DEFAULT, 0, 0, 0,
-                 MIRROR_SYNC_MODE_NONE, MIRROR_OPEN_BACKING_CHAIN, false=
,
-                 BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPORT,
+                 MIRROR_SYNC_MODE_NONE, NULL, 0, MIRROR_OPEN_BACKING_CHA=
IN,
+                 false, BLOCKDEV_ON_ERROR_REPORT, BLOCKDEV_ON_ERROR_REPO=
RT,
                  false, "filter_node", MIRROR_COPY_MODE_BACKGROUND,
                  &error_abort);
     job =3D job_get("job0");
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 13dad62f44..c63708e830 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1976,10 +1976,19 @@
 #        (all the disk, only the sectors allocated in the topmost image,=
 or
 #        only new I/O).
 #
+# @bitmap: The name of a bitmap to use for sync=3Dbitmap mode. This argu=
ment must
+#          be present for bitmap mode and absent otherwise. The bitmap's
+#          granularity is used instead of @granularity (since 4.1).
+#
+# @bitmap-mode: Specifies the type of data the bitmap should contain aft=
er
+#               the operation concludes. Must be present if sync is "bit=
map".
+#               Must NOT be present otherwise. (Since 4.1)
+#
 # @granularity: granularity of the dirty bitmap, default is 64K
 #               if the image format doesn't have clusters, 4K if the clu=
sters
 #               are smaller than that, else the cluster size.  Must be a
-#               power of 2 between 512 and 64M (since 1.4).
+#               power of 2 between 512 and 64M. Must not be specified if
+#               @bitmap is present (since 1.4).
 #
 # @buf-size: maximum amount of data in flight from source to
 #            target (since 1.4).
@@ -2017,7 +2026,9 @@
 { 'struct': 'DriveMirror',
   'data': { '*job-id': 'str', 'device': 'str', 'target': 'str',
             '*format': 'str', '*node-name': 'str', '*replaces': 'str',
-            'sync': 'MirrorSyncMode', '*mode': 'NewImageMode',
+            'sync': 'MirrorSyncMode', '*bitmap': 'str',
+            '*bitmap-mode': 'BitmapSyncMode',
+            '*mode': 'NewImageMode',
             '*speed': 'int', '*granularity': 'uint32',
             '*buf-size': 'int', '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
@@ -2284,10 +2295,19 @@
 #        (all the disk, only the sectors allocated in the topmost image,=
 or
 #        only new I/O).
 #
+# @bitmap: The name of a bitmap to use for sync=3Dbitmap mode. This argu=
ment must
+#          be present for bitmap mode and absent otherwise. The bitmap's
+#          granularity is used instead of @granularity (since 4.1).
+#
+# @bitmap-mode: Specifies the type of data the bitmap should contain aft=
er
+#               the operation concludes. Must be present if sync is "bit=
map".
+#               Must NOT be present otherwise. (Since 4.1)
+#
 # @granularity: granularity of the dirty bitmap, default is 64K
 #               if the image format doesn't have clusters, 4K if the clu=
sters
 #               are smaller than that, else the cluster size.  Must be a
-#               power of 2 between 512 and 64M
+#               power of 2 between 512 and 64M . Must not be specified i=
f
+#               @bitmap is present.
 #
 # @buf-size: maximum amount of data in flight from source to
 #            target
@@ -2336,7 +2356,8 @@
 { 'command': 'blockdev-mirror',
   'data': { '*job-id': 'str', 'device': 'str', 'target': 'str',
             '*replaces': 'str',
-            'sync': 'MirrorSyncMode',
+            'sync': 'MirrorSyncMode', '*bitmap': 'str',
+            '*bitmap-mode': 'BitmapSyncMode',
             '*speed': 'int', '*granularity': 'uint32',
             '*buf-size': 'int', '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
--=20
2.20.1



