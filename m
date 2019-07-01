Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77357431B3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:38:50 +0200 (CEST)
Received: from localhost ([::1]:35568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBtH-00063h-Rr
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45977)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSc-00087A-UL
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSa-00080o-Tx
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSV-0007uI-PS; Wed, 12 Jun 2019 18:11:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A0F7B307D93E;
 Wed, 12 Jun 2019 22:11:03 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32ECF1001B17;
 Wed, 12 Jun 2019 22:11:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:44 +0200
Message-Id: <20190612221004.2317-23-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 12 Jun 2019 22:11:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 22/42] block: Use CAFs in
 bdrv_get_allocated_file_size()
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
 block.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 11b7ba8cf6..856d9b58be 100644
--- a/block.c
+++ b/block.c
@@ -4511,15 +4511,37 @@ exit:
 int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
 {
     BlockDriver *drv =3D bs->drv;
+    BlockDriverState *storage_bs, *metadata_bs;
+
     if (!drv) {
         return -ENOMEDIUM;
     }
+
     if (drv->bdrv_get_allocated_file_size) {
         return drv->bdrv_get_allocated_file_size(bs);
     }
-    if (bs->file) {
-        return bdrv_get_allocated_file_size(bs->file->bs);
+
+    storage_bs =3D bdrv_storage_bs(bs);
+    metadata_bs =3D bdrv_metadata_bs(bs);
+
+    if (storage_bs) {
+        int64_t data_size, metadata_size =3D 0;
+
+        data_size =3D bdrv_get_allocated_file_size(storage_bs);
+        if (data_size < 0) {
+            return data_size;
+        }
+
+        if (storage_bs !=3D metadata_bs) {
+            metadata_size =3D bdrv_get_allocated_file_size(metadata_bs);
+            if (metadata_size < 0) {
+                return metadata_size;
+            }
+        }
+
+        return data_size + metadata_size;
     }
+
     return -ENOTSUP;
 }
=20
--=20
2.21.0


