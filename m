Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD9431BE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:44:19 +0200 (CEST)
Received: from localhost ([::1]:35644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbByd-0005cj-3U
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSt-0008U0-EG
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSs-0008D2-HS
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSm-00086h-EH; Wed, 12 Jun 2019 18:11:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F17D4223873;
 Wed, 12 Jun 2019 22:11:21 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D0719C67;
 Wed, 12 Jun 2019 22:11:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:51 +0200
Message-Id: <20190612221004.2317-30-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 12 Jun 2019 22:11:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 29/42] nbd: Use CAF when looking for dirty
 bitmap
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

When looking for a dirty bitmap to share, we should handle filters by
just including them in the search (so they do not break backing chains).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 nbd/server.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index aeca3893fe..0d51d46b81 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1508,13 +1508,13 @@ NBDExport *nbd_export_new(BlockDriverState *bs, u=
int64_t dev_offset,
     if (bitmap) {
         BdrvDirtyBitmap *bm =3D NULL;
=20
-        while (true) {
+        while (bs) {
             bm =3D bdrv_find_dirty_bitmap(bs, bitmap);
-            if (bm !=3D NULL || bs->backing =3D=3D NULL) {
+            if (bm !=3D NULL) {
                 break;
             }
=20
-            bs =3D bs->backing->bs;
+            bs =3D bdrv_filtered_bs(bs);
         }
=20
         if (bm =3D=3D NULL) {
--=20
2.21.0


