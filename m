Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84DD2969
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:23:44 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXTr-0001ke-57
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIWrH-0006sk-EG
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIWrG-0008J4-Bx
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37998)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIWrD-0008HR-Vn; Thu, 10 Oct 2019 07:43:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3599918C4262;
 Thu, 10 Oct 2019 11:43:47 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB89460A9F;
 Thu, 10 Oct 2019 11:43:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/36] ide: account UNMAP (TRIM) operations
Date: Thu, 10 Oct 2019 13:42:44 +0200
Message-Id: <20191010114300.7746-21-mreitz@redhat.com>
In-Reply-To: <20191010114300.7746-1-mreitz@redhat.com>
References: <20191010114300.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 10 Oct 2019 11:43:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

From: Anton Nefedov <anton.nefedov@virtuozzo.com>

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190923121737.83281-5-anton.nefedov@virtuozzo.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 hw/ide/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index e6e54c6c9a..754ff4dc34 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -442,6 +442,14 @@ static void ide_issue_trim_cb(void *opaque, int ret)
     TrimAIOCB *iocb =3D opaque;
     IDEState *s =3D iocb->s;
=20
+    if (iocb->i >=3D 0) {
+        if (ret >=3D 0) {
+            block_acct_done(blk_get_stats(s->blk), &s->acct);
+        } else {
+            block_acct_failed(blk_get_stats(s->blk), &s->acct);
+        }
+    }
+
     if (ret >=3D 0) {
         while (iocb->j < iocb->qiov->niov) {
             int j =3D iocb->j;
@@ -459,10 +467,14 @@ static void ide_issue_trim_cb(void *opaque, int ret=
)
                 }
=20
                 if (!ide_sect_range_ok(s, sector, count)) {
+                    block_acct_invalid(blk_get_stats(s->blk), BLOCK_ACCT=
_UNMAP);
                     iocb->ret =3D -EINVAL;
                     goto done;
                 }
=20
+                block_acct_start(blk_get_stats(s->blk), &s->acct,
+                                 count << BDRV_SECTOR_BITS, BLOCK_ACCT_U=
NMAP);
+
                 /* Got an entry! Submit and exit.  */
                 iocb->aiocb =3D blk_aio_pdiscard(s->blk,
                                                sector << BDRV_SECTOR_BIT=
S,
--=20
2.21.0


