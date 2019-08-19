Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55672949D0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:27:07 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkUr-00053p-Lq
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzkMF-0003MY-0P
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzkMD-0006Xo-2E
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:18:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65337)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzkMA-0006Uy-LG; Mon, 19 Aug 2019 12:18:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C73D30860C6;
 Mon, 19 Aug 2019 16:18:05 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3770110016EA;
 Mon, 19 Aug 2019 16:18:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 18:17:21 +0200
Message-Id: <20190819161723.7746-16-mreitz@redhat.com>
In-Reply-To: <20190819161723.7746-1-mreitz@redhat.com>
References: <20190819161723.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 19 Aug 2019 16:18:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/17] vpc: Do not return RAW from block_status
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

vpc is not really a passthrough driver, even when using the fixed
subformat (where host and guest offsets are equal).  It should handle
preallocation like all other drivers do, namely by returning
DATA | RECURSE instead of RAW.

There is no tangible difference but the fact that bdrv_is_allocated() no
longer falls through to the protocol layer.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190725155512.9827-4-mreitz@redhat.com
Reviewed-by: John Snow <jsnow@redhat.com>
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


