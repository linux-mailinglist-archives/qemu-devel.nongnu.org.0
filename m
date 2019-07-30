Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2C7A91F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 15:01:55 +0200 (CEST)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsRlL-0005RG-4G
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 09:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hsRio-0002zA-P5
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:59:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hsRin-0000rO-NI
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:59:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hsRil-0000pI-Av; Tue, 30 Jul 2019 08:59:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91C49307154D;
 Tue, 30 Jul 2019 12:59:14 +0000 (UTC)
Received: from localhost (ovpn-116-164.ams2.redhat.com [10.36.116.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3335B5D6A7;
 Tue, 30 Jul 2019 12:59:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 14:59:10 +0200
Message-Id: <20190730125910.32060-2-mreitz@redhat.com>
In-Reply-To: <20190730125910.32060-1-mreitz@redhat.com>
References: <20190730125910.32060-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 30 Jul 2019 12:59:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/1] nvme: Limit blkshift to 12 (for 4 kB blocks)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux does not support blocks greater than 4 kB anyway, so we might as
well limit blkshift to 12 and thus save us from some potential trouble.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190730114812.10493-1-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Coverity: CID 1403771
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/nvme.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index c28755cc31..2c85713519 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -105,7 +105,7 @@ typedef struct {
=20
     uint64_t nsze; /* Namespace size reported by identify command */
     int nsid;      /* The namespace id to read/write data. */
-    size_t blkshift;
+    int blkshift;
=20
     uint64_t max_transfer;
     bool plugged;
@@ -420,7 +420,7 @@ static void nvme_identify(BlockDriverState *bs, int n=
amespace, Error **errp)
     NvmeIdNs *idns;
     NvmeLBAF *lbaf;
     uint8_t *resp;
-    int r, hwsect_size;
+    int r;
     uint64_t iova;
     NvmeCmd cmd =3D {
         .opcode =3D NVME_ADM_CMD_IDENTIFY,
@@ -474,11 +474,11 @@ static void nvme_identify(BlockDriverState *bs, int=
 namespace, Error **errp)
         goto out;
     }
=20
-    hwsect_size =3D 1 << lbaf->ds;
-
-    if (hwsect_size < BDRV_SECTOR_SIZE || hwsect_size > s->page_size) {
-        error_setg(errp, "Namespace has unsupported block size (%d)",
-                hwsect_size);
+    if (lbaf->ds < BDRV_SECTOR_BITS || lbaf->ds > 12 ||
+        (1 << lbaf->ds) > s->page_size)
+    {
+        error_setg(errp, "Namespace has unsupported block size (2^%d)",
+                   lbaf->ds);
         goto out;
     }
=20
@@ -804,16 +804,16 @@ static int64_t nvme_getlength(BlockDriverState *bs)
     return s->nsze << s->blkshift;
 }
=20
-static int64_t nvme_get_blocksize(BlockDriverState *bs)
+static uint32_t nvme_get_blocksize(BlockDriverState *bs)
 {
     BDRVNVMeState *s =3D bs->opaque;
-    assert(s->blkshift >=3D BDRV_SECTOR_BITS);
-    return 1 << s->blkshift;
+    assert(s->blkshift >=3D BDRV_SECTOR_BITS && s->blkshift <=3D 12);
+    return UINT32_C(1) << s->blkshift;
 }
=20
 static int nvme_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz)
 {
-    int64_t blocksize =3D nvme_get_blocksize(bs);
+    uint32_t blocksize =3D nvme_get_blocksize(bs);
     bsz->phys =3D blocksize;
     bsz->log =3D blocksize;
     return 0;
--=20
2.21.0


