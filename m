Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7875345
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 17:56:16 +0200 (CEST)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqg6J-00018Y-Lx
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 11:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54115)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hqg5Y-0006zB-K1
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hqg5X-0005Be-KA
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:55:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38686)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hqg5V-0005Ag-KY; Thu, 25 Jul 2019 11:55:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E775E46672;
 Thu, 25 Jul 2019 15:55:24 +0000 (UTC)
Received: from localhost (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 898051001B12;
 Thu, 25 Jul 2019 15:55:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 17:55:12 +0200
Message-Id: <20190725155512.9827-4-mreitz@redhat.com>
In-Reply-To: <20190725155512.9827-1-mreitz@redhat.com>
References: <20190725155512.9827-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 25 Jul 2019 15:55:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] vpc: Do not return RAW from block_status
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

vpc is not really a passthrough driver, even when using the fixed
subformat (where host and guest offsets are equal).  It should handle
preallocation like all other drivers do, namely by returning
DATA | RECURSE instead of RAW.

There is no tangible difference but the fact that bdrv_is_allocated() no
longer falls through to the protocol layer.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vpc.c b/block/vpc.c
index d4776ee8a5..b25aab0425 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -737,7 +737,7 @@ static int coroutine_fn vpc_co_block_status(BlockDriv=
erState *bs,
         *pnum =3D bytes;
         *map =3D offset;
         *file =3D bs->file->bs;
-        return BDRV_BLOCK_RAW | BDRV_BLOCK_OFFSET_VALID;
+        return BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID | BDRV_BLOCK_RE=
CURSE;
     }
=20
     qemu_co_mutex_lock(&s->lock);
--=20
2.21.0


