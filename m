Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90839162466
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:18:55 +0100 (CET)
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3zxu-0008I8-MQ
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zv7-0002y0-SB
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zv6-0007tU-Kv
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:01 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:22125)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1j3zv3-0007qL-97; Tue, 18 Feb 2020 05:15:57 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 7513D40B57;
 Tue, 18 Feb 2020 11:08:07 +0100 (CET)
From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu 2/6] drive-mirror: add support for conditional and always
 bitmap sync modes
Date: Tue, 18 Feb 2020 11:07:36 +0100
Message-Id: <20200218100740.2228521-3-f.gruenbichler@proxmox.com>
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
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Teach mirror two new tricks for using bitmaps:

Always: no matter what, we synchronize the copy_bitmap back to the
sync_bitmap. In effect, this allows us resume a failed mirror at a later
date.

Conditional: On success only, we sync the bitmap. This is akin to
incremental backup modes; we can use this bitmap to later refresh a
successfully created mirror.
---
Note: original commit by John Snow <jsnow@redhat.com>, but missing SOB -
please ACK/reply and I'll add it.

This is also broken without patch #4, since it's fairly straight-forward
we might even squash all three into a single commit?

 block/mirror.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index fd7f574365..40d174a625 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -645,8 +645,6 @@ static int mirror_exit_common(Job *job)
         bdrv_unfreeze_backing_chain(mirror_top_bs, target_bs);
     }
=20
-    bdrv_release_dirty_bitmap(s->dirty_bitmap);
-
     /* Make sure that the source BDS doesn't go away during bdrv_replace=
_node,
      * before we can call bdrv_drained_end */
     bdrv_ref(src);
@@ -731,6 +729,18 @@ static int mirror_exit_common(Job *job)
     blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
     blk_insert_bs(bjob->blk, mirror_top_bs, &error_abort);
=20
+    if (s->sync_bitmap) {
+        if (s->bitmap_mode =3D=3D BITMAP_SYNC_MODE_ALWAYS ||
+            (s->bitmap_mode =3D=3D BITMAP_SYNC_MODE_ON_SUCCESS &&
+             job->ret =3D=3D 0 && ret =3D=3D 0)) {
+            /* Success; synchronize copy back to sync. */
+            bdrv_clear_dirty_bitmap(s->sync_bitmap, NULL);
+            bdrv_merge_dirty_bitmap(s->sync_bitmap, s->dirty_bitmap,
+                                    NULL, &error_abort);
+        }
+    }
+    bdrv_release_dirty_bitmap(s->dirty_bitmap);
+
     bs_opaque->job =3D NULL;
=20
     bdrv_drained_end(src);
@@ -1562,10 +1572,6 @@ static BlockJob *mirror_start_job(
                        " sync mode",
                        MirrorSyncMode_str(sync_mode));
             return NULL;
-        } else if (bitmap_mode !=3D BITMAP_SYNC_MODE_NEVER) {
-            error_setg(errp,
-                       "Bitmap Sync Mode '%s' is not supported by Mirror=
",
-                       BitmapSyncMode_str(bitmap_mode));
         }
     } else if (bitmap) {
         error_setg(errp,
@@ -1582,6 +1588,12 @@ static BlockJob *mirror_start_job(
             return NULL;
         }
         granularity =3D bdrv_dirty_bitmap_granularity(bitmap);
+
+        if (bitmap_mode !=3D BITMAP_SYNC_MODE_NEVER) {
+            if (bdrv_dirty_bitmap_check(bitmap, BDRV_BITMAP_DEFAULT, err=
p)) {
+                return NULL;
+            }
+        }
     } else if (granularity =3D=3D 0) {
         granularity =3D bdrv_get_default_bitmap_granularity(target);
     }
--=20
2.20.1



