Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25806949F7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 18:33:19 +0200 (CEST)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzkas-0004Ty-8t
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 12:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzkMF-0003Mc-10
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:18:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzkMD-0006Xv-8L
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 12:18:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56448)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzkMA-0006U8-Kn; Mon, 19 Aug 2019 12:18:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D2F2A2893B;
 Mon, 19 Aug 2019 16:18:03 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECCE21CB;
 Mon, 19 Aug 2019 16:18:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 18:17:20 +0200
Message-Id: <20190819161723.7746-15-mreitz@redhat.com>
In-Reply-To: <20190819161723.7746-1-mreitz@redhat.com>
References: <20190819161723.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Mon, 19 Aug 2019 16:18:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/17] vmdk: Make block_status recurse for flat
 extents
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

Fixes: 69f47505ee66afaa513305de0c1895a224e52c45
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190725155512.9827-3-mreitz@redhat.com
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vmdk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/vmdk.c b/block/vmdk.c
index bd36ece125..fd78fd0ccf 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1692,6 +1692,9 @@ static int coroutine_fn vmdk_co_block_status(BlockD=
riverState *bs,
         if (!extent->compressed) {
             ret |=3D BDRV_BLOCK_OFFSET_VALID;
             *map =3D cluster_offset + index_in_cluster;
+            if (extent->flat) {
+                ret |=3D BDRV_BLOCK_RECURSE;
+            }
         }
         *file =3D extent->file->bs;
         break;
--=20
2.21.0


