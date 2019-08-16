Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9A90B70
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:31:32 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylgx-00039W-DS
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPr-0006k6-TO
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPq-00069f-NA
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPo-00065o-8E; Fri, 16 Aug 2019 19:13:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E7A12A41;
 Fri, 16 Aug 2019 23:13:46 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA8A719C6A;
 Fri, 16 Aug 2019 23:13:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:13:07 -0400
Message-Id: <20190816231318.8650-26-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 16 Aug 2019 23:13:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 25/36] block/backup: hoist bitmap check into QMP
 interface
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is nicer to do in the unified QMP interface that we have now,
because it lets us use the right terminology back at the user.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190716000117.25219-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/backup.c | 13 ++++---------
 blockdev.c     | 10 ++++++++++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index f8309be01b3..f704c83a98f 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -576,6 +576,10 @@ BlockJob *backup_job_create(const char *job_id, Bloc=
kDriverState *bs,
     assert(bs);
     assert(target);
=20
+    /* QMP interface protects us from these cases */
+    assert(sync_mode !=3D MIRROR_SYNC_MODE_INCREMENTAL);
+    assert(sync_bitmap || sync_mode !=3D MIRROR_SYNC_MODE_BITMAP);
+
     if (bs =3D=3D target) {
         error_setg(errp, "Source and target cannot be the same");
         return NULL;
@@ -607,16 +611,7 @@ BlockJob *backup_job_create(const char *job_id, Bloc=
kDriverState *bs,
         return NULL;
     }
=20
-    /* QMP interface should have handled translating this to bitmap mode=
 */
-    assert(sync_mode !=3D MIRROR_SYNC_MODE_INCREMENTAL);
-
     if (sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP) {
-        if (!sync_bitmap) {
-            error_setg(errp, "must provide a valid bitmap name for "
-                       "'%s' sync mode", MirrorSyncMode_str(sync_mode));
-            return NULL;
-        }
-
         /* If we need to write to this bitmap, check that we can: */
         if (bitmap_mode !=3D BITMAP_SYNC_MODE_NEVER &&
             bdrv_dirty_bitmap_check(sync_bitmap, BDRV_BITMAP_DEFAULT, er=
rp)) {
diff --git a/blockdev.c b/blockdev.c
index 210226d8290..f889da0b427 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3529,6 +3529,16 @@ static BlockJob *do_backup_common(BackupCommon *ba=
ckup,
         return NULL;
     }
=20
+    if ((backup->sync =3D=3D MIRROR_SYNC_MODE_BITMAP) ||
+        (backup->sync =3D=3D MIRROR_SYNC_MODE_INCREMENTAL)) {
+        /* done before desugaring 'incremental' to print the right messa=
ge */
+        if (!backup->has_bitmap) {
+            error_setg(errp, "must provide a valid bitmap name for "
+                       "'%s' sync mode", MirrorSyncMode_str(backup->sync=
));
+            return NULL;
+        }
+    }
+
     if (backup->sync =3D=3D MIRROR_SYNC_MODE_INCREMENTAL) {
         if (backup->has_bitmap_mode &&
             backup->bitmap_mode !=3D BITMAP_SYNC_MODE_ON_SUCCESS) {
--=20
2.21.0


