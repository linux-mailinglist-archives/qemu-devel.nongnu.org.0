Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E85166AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 17:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO1zy-0006uJ-Nk
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 11:27:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hO1rb-0007xj-VQ
	for qemu-devel@nongnu.org; Tue, 07 May 2019 11:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hO1rb-0003zX-4o
	for qemu-devel@nongnu.org; Tue, 07 May 2019 11:18:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hO1rY-0003xT-Vc; Tue, 07 May 2019 11:18:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50C30C057F32;
	Tue,  7 May 2019 15:18:36 +0000 (UTC)
Received: from localhost (unknown [10.40.205.217])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC32761B85;
	Tue,  7 May 2019 15:18:35 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue,  7 May 2019 17:18:14 +0200
Message-Id: <20190507151819.17401-7-mreitz@redhat.com>
In-Reply-To: <20190507151819.17401-1-mreitz@redhat.com>
References: <20190507151819.17401-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 15:18:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/11] qcow2: discard bitmap when removed
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Bitmap data may take a lot of disk space, so it's better to discard it
always.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-id: 1551346019-293202-1-git-send-email-andrey.shinkevich@virtuozz=
o.com
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
[mreitz: Use the commit message proposed by Vladimir]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index e53a1609d7..8a75366c92 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -202,7 +202,7 @@ static void clear_bitmap_table(BlockDriverState *bs, =
uint64_t *bitmap_table,
             continue;
         }
=20
-        qcow2_free_clusters(bs, addr, s->cluster_size, QCOW2_DISCARD_OTH=
ER);
+        qcow2_free_clusters(bs, addr, s->cluster_size, QCOW2_DISCARD_ALW=
AYS);
         bitmap_table[i] =3D 0;
     }
 }
--=20
2.20.1


