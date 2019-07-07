Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD660C5A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 22:27:38 +0200 (CEST)
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjUnx-0007g4-UR
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 16:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32993)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hjUeJ-0005fF-Ie
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hjUeI-0007LA-Bv
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:17:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hjUeF-0007Dg-5F; Fri, 05 Jul 2019 16:17:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A1A2308218D;
 Fri,  5 Jul 2019 20:17:30 +0000 (UTC)
Received: from probe.redhat.com (ovpn-122-149.rdu2.redhat.com [10.10.122.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9030E867E6;
 Fri,  5 Jul 2019 20:17:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri,  5 Jul 2019 16:16:25 -0400
Message-Id: <20190705201631.26266-13-jsnow@redhat.com>
In-Reply-To: <20190705201631.26266-1-jsnow@redhat.com>
References: <20190705201631.26266-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 05 Jul 2019 20:17:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 12/18] block/backup: add 'always' bitmap
 sync policy
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds an "always" policy for bitmap synchronization. Regardless of if
the job succeeds or fails, the bitmap is *always* synchronized. This mean=
s
that for backups that fail part-way through, the bitmap retains a record =
of
which sectors need to be copied out to accomplish a new backup using the
old, partial result.

In effect, this allows us to "resume" a failed backup; however the new ba=
ckup
will be from the new point in time, so it isn't a "resume" as much as it =
is
an "incremental retry." This can be useful in the case of extremely large
backups that fail considerably through the operation and we'd like to not=
 waste
the work that was already performed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/backup.c       | 27 +++++++++++++++++++--------
 qapi/block-core.json |  5 ++++-
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 3c08d057cc..b25e6179cf 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -268,18 +268,29 @@ static void backup_cleanup_sync_bitmap(BackupBlockJ=
ob *job, int ret)
 {
     BdrvDirtyBitmap *bm;
     BlockDriverState *bs =3D blk_bs(job->common.blk);
+    bool sync =3D (((ret =3D=3D 0) || (job->bitmap_mode =3D=3D BITMAP_SY=
NC_MODE_ALWAYS)) \
+                 && (job->bitmap_mode !=3D BITMAP_SYNC_MODE_NEVER));
=20
-    if (ret < 0 || job->bitmap_mode =3D=3D BITMAP_SYNC_MODE_NEVER) {
+    if (sync) {
         /*
-         * Failure, or we don't want to synchronize the bitmap.
-         * Merge the successor back into the parent, delete nothing.
+         * We succeeded, or we always intended to sync the bitmap.
+         * Delete this bitmap and install the child.
          */
-        bm =3D bdrv_reclaim_dirty_bitmap(bs, job->sync_bitmap, NULL);
-        assert(bm);
-    } else {
-        /* Everything is fine, delete this bitmap and install the backup=
. */
         bm =3D bdrv_dirty_bitmap_abdicate(bs, job->sync_bitmap, NULL);
-        assert(bm);
+    } else {
+        /*
+         * We failed, or we never intended to sync the bitmap anyway.
+         * Merge the successor back into the parent, keeping all data.
+         */
+        bm =3D bdrv_reclaim_dirty_bitmap(bs, job->sync_bitmap, NULL);
+    }
+
+    assert(bm);
+
+    if (ret < 0 && job->bitmap_mode =3D=3D BITMAP_SYNC_MODE_ALWAYS) {
+        /* If we failed and synced, merge in the bits we didn't copy: */
+        bdrv_dirty_bitmap_merge_internal(bm, job->copy_bitmap,
+                                         NULL, true);
     }
 }
=20
diff --git a/qapi/block-core.json b/qapi/block-core.json
index b1aaaaa98e..5a578806c5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1149,10 +1149,13 @@
 # @never: The bitmap is never synchronized with the operation, and is
 #         treated solely as a read-only manifest of blocks to copy.
 #
+# @always: The bitmap is always synchronized with the operation,
+#          regardless of whether or not the operation was successful.
+#
 # Since: 4.2
 ##
 { 'enum': 'BitmapSyncMode',
-  'data': ['on-success', 'never'] }
+  'data': ['on-success', 'never', 'always'] }
=20
 ##
 # @MirrorCopyMode:
--=20
2.21.0


