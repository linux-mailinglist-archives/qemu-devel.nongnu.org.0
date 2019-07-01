Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA844E905
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 15:26:26 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heJYf-0000eA-7y
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 09:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1heJW4-0006Fg-9R
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1heJW1-0004RG-7T
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:23:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44810)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1heJVu-0004Jy-7R; Fri, 21 Jun 2019 09:23:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E63B308623C;
 Fri, 21 Jun 2019 13:23:32 +0000 (UTC)
Received: from localhost (ovpn-204-30.brq.redhat.com [10.40.204.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08BE6608A7;
 Fri, 21 Jun 2019 13:23:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 21 Jun 2019 15:23:18 +0200
Message-Id: <20190621132324.2165-3-mreitz@redhat.com>
In-Reply-To: <20190621132324.2165-1-mreitz@redhat.com>
References: <20190621132324.2165-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 21 Jun 2019 13:23:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/8] blockdev: enable non-root nodes for
 transaction drive-backup source
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We forget to enable it for transaction .prepare, while it is already
enabled in do_drive_backup since commit a2d665c1bc362
    "blockdev: loosen restrictions on drive-backup source node"

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190618140804.59214-1-vsementsov@virtuozzo.com
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 5d6a13dea9..4d141e9a1f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1774,7 +1774,7 @@ static void drive_backup_prepare(BlkActionState *co=
mmon, Error **errp)
     assert(common->action->type =3D=3D TRANSACTION_ACTION_KIND_DRIVE_BAC=
KUP);
     backup =3D common->action->u.drive_backup.data;
=20
-    bs =3D qmp_get_root_bs(backup->device, errp);
+    bs =3D bdrv_lookup_bs(backup->device, backup->device, errp);
     if (!bs) {
         return;
     }
--=20
2.21.0


