Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75068431AC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:32:11 +0200 (CEST)
Received: from localhost ([::1]:35532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBms-0001E4-EP
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBRx-0007Ir-7w
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBRu-0007WR-EN
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBRo-0007Ru-JT; Wed, 12 Jun 2019 18:10:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8785930BBE84;
 Wed, 12 Jun 2019 22:10:22 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17A7460192;
 Wed, 12 Jun 2019 22:10:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:28 +0200
Message-Id: <20190612221004.2317-7-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 12 Jun 2019 22:10:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 06/42] qcow2: Implement .bdrv_storage_child()
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 9396d490d5..57675c9416 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5085,6 +5085,13 @@ void qcow2_signal_corruption(BlockDriverState *bs,=
 bool fatal, int64_t offset,
     s->signaled_corruption =3D true;
 }
=20
+static BdrvChild *qcow2_storage_child(BlockDriverState *bs)
+{
+    BDRVQcow2State *s =3D bs->opaque;
+
+    return s->data_file;
+}
+
 static QemuOptsList qcow2_create_opts =3D {
     .name =3D "qcow2-create-opts",
     .head =3D QTAILQ_HEAD_INITIALIZER(qcow2_create_opts.head),
@@ -5231,6 +5238,8 @@ BlockDriver bdrv_qcow2 =3D {
     .bdrv_reopen_bitmaps_rw =3D qcow2_reopen_bitmaps_rw,
     .bdrv_can_store_new_dirty_bitmap =3D qcow2_can_store_new_dirty_bitma=
p,
     .bdrv_remove_persistent_dirty_bitmap =3D qcow2_remove_persistent_dir=
ty_bitmap,
+
+    .bdrv_storage_child =3D qcow2_storage_child,
 };
=20
 static void bdrv_qcow2_init(void)
--=20
2.21.0


