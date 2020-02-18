Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F5162467
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:19:00 +0100 (CET)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3zxz-0008Ph-RI
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zv7-0002xx-KW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zv6-0007tZ-Kk
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:01 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:25357)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1j3zv3-0007qM-98; Tue, 18 Feb 2020 05:15:57 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 486FA41CAA;
 Tue, 18 Feb 2020 11:08:09 +0100 (CET)
From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu 4/6] mirror: switch to bdrv_dirty_bitmap_merge_internal
Date: Tue, 18 Feb 2020 11:07:38 +0100
Message-Id: <20200218100740.2228521-5-f.gruenbichler@proxmox.com>
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

since sync_bitmap is busy at the point of merging, and we checked access
beforehand.

Signed-off-by: Fabian Gr=C3=BCnbichler <f.gruenbichler@proxmox.com>
---
 block/mirror.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 40d174a625..d6aca2874e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -735,8 +735,8 @@ static int mirror_exit_common(Job *job)
              job->ret =3D=3D 0 && ret =3D=3D 0)) {
             /* Success; synchronize copy back to sync. */
             bdrv_clear_dirty_bitmap(s->sync_bitmap, NULL);
-            bdrv_merge_dirty_bitmap(s->sync_bitmap, s->dirty_bitmap,
-                                    NULL, &error_abort);
+            bdrv_dirty_bitmap_merge_internal(s->sync_bitmap, s->dirty_bi=
tmap,
+                                             NULL, true);
         }
     }
     bdrv_release_dirty_bitmap(s->dirty_bitmap);
@@ -1727,8 +1727,8 @@ static BlockJob *mirror_start_job(
     }
=20
     if (s->sync_mode =3D=3D MIRROR_SYNC_MODE_BITMAP) {
-        bdrv_merge_dirty_bitmap(s->dirty_bitmap, s->sync_bitmap,
-                                NULL, &local_err);
+        bdrv_dirty_bitmap_merge_internal(s->dirty_bitmap, s->sync_bitmap=
,
+                                         NULL, true);
         if (local_err) {
             goto fail;
         }
--=20
2.20.1



