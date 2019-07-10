Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E9B63E69
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 01:39:37 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkzhw-0005oX-JK
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 19:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48779)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hkzVG-0007GI-6G
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 19:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hkzVD-00033F-RH
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 19:26:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43974)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hkzV9-0002da-B8; Tue, 09 Jul 2019 19:26:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13B2E8831C;
 Tue,  9 Jul 2019 23:26:06 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5465B810;
 Tue,  9 Jul 2019 23:26:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 19:25:38 -0400
Message-Id: <20190709232550.10724-7-jsnow@redhat.com>
In-Reply-To: <20190709232550.10724-1-jsnow@redhat.com>
References: <20190709232550.10724-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 09 Jul 2019 23:26:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 06/18] block/backup: add 'never' policy to
 bitmap sync mode
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a "never" policy for bitmap synchronization. Regardless of if
the job succeeds or fails, we never update the bitmap. This can be used
to perform differential backups, or simply to avoid the job modifying a
bitmap.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c       | 7 +++++--
 qapi/block-core.json | 5 ++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 996941fa61..efd0dcd2e7 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -265,8 +265,11 @@ static void backup_cleanup_sync_bitmap(BackupBlockJo=
b *job, int ret)
     BdrvDirtyBitmap *bm;
     BlockDriverState *bs =3D blk_bs(job->common.blk);
=20
-    if (ret < 0) {
-        /* Merge the successor back into the parent, delete nothing. */
+    if (ret < 0 || job->bitmap_mode =3D=3D BITMAP_SYNC_MODE_NEVER) {
+        /*
+         * Failure, or we don't want to synchronize the bitmap.
+         * Merge the successor back into the parent, delete nothing.
+         */
         bm =3D bdrv_reclaim_dirty_bitmap(bs, job->sync_bitmap, NULL);
         assert(bm);
     } else {
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 99dcd5f099..b1aaaaa98e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1146,10 +1146,13 @@
 # @on-success: The bitmap is only synced when the operation is successfu=
l.
 #              This is the behavior always used for 'INCREMENTAL' backup=
s.
 #
+# @never: The bitmap is never synchronized with the operation, and is
+#         treated solely as a read-only manifest of blocks to copy.
+#
 # Since: 4.2
 ##
 { 'enum': 'BitmapSyncMode',
-  'data': ['on-success'] }
+  'data': ['on-success', 'never'] }
=20
 ##
 # @MirrorCopyMode:
--=20
2.21.0


