Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C570890B65
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:26:14 +0200 (CEST)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylbp-0005P8-Ga
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylPk-0006Vi-3w
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPi-0005wg-R2
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:13:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPe-0005s8-VN; Fri, 16 Aug 2019 19:13:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0FA8F800DE0;
 Fri, 16 Aug 2019 23:13:38 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B83119C6A;
 Fri, 16 Aug 2019 23:13:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:13:00 -0400
Message-Id: <20190816231318.8650-19-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 16 Aug 2019 23:13:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 18/36] block/backup: loosen restriction on
 readonly bitmaps
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

With the "never" sync policy, we actually can utilize readonly bitmaps
now. Loosen the check at the QMP level, and tighten it based on
provided arguments down at the job creation level instead.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190709232550.10724-19-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/backup.c | 6 ++++++
 blockdev.c     | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/backup.c b/block/backup.c
index 2be570c0bfd..f8309be01b3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -617,6 +617,12 @@ BlockJob *backup_job_create(const char *job_id, Bloc=
kDriverState *bs,
             return NULL;
         }
=20
+        /* If we need to write to this bitmap, check that we can: */
+        if (bitmap_mode !=3D BITMAP_SYNC_MODE_NEVER &&
+            bdrv_dirty_bitmap_check(sync_bitmap, BDRV_BITMAP_DEFAULT, er=
rp)) {
+            return NULL;
+        }
+
         /* Create a new bitmap, and freeze/disable this one. */
         if (bdrv_dirty_bitmap_create_successor(bs, sync_bitmap, errp) < =
0) {
             return NULL;
diff --git a/blockdev.c b/blockdev.c
index 985b6cd75c0..a44ab1f709e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3491,7 +3491,7 @@ static BlockJob *do_backup_common(BackupCommon *bac=
kup,
                        "when providing a bitmap");
             return NULL;
         }
-        if (bdrv_dirty_bitmap_check(bmap, BDRV_BITMAP_DEFAULT, errp)) {
+        if (bdrv_dirty_bitmap_check(bmap, BDRV_BITMAP_ALLOW_RO, errp)) {
             return NULL;
         }
     }
--=20
2.21.0


