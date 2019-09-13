Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51AB2367
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 17:31:53 +0200 (CEST)
Received: from localhost ([::1]:45321 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8nY8-0003zx-DE
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 11:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i8nSN-0006my-C6
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i8nSM-0003T3-Ai
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:25:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>)
 id 1i8nSK-0003QD-DI; Fri, 13 Sep 2019 11:25:52 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A67F3898102;
 Fri, 13 Sep 2019 15:25:51 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D021001959;
 Fri, 13 Sep 2019 15:25:49 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 13 Sep 2019 17:25:07 +0200
Message-Id: <20190913152507.56197-2-slp@redhat.com>
In-Reply-To: <20190913152507.56197-1-slp@redhat.com>
References: <20190913152507.56197-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 13 Sep 2019 15:25:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/2] blockdev: release the AioContext at
 drive_backup_prepare
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

do_drive_backup() already acquires the AioContext, so release it
before the call.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 blockdev.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index fbef6845c8..3927fdab80 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1783,20 +1783,16 @@ static void drive_backup_prepare(BlkActionState *=
common, Error **errp)
=20
     aio_context =3D bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
-
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
+    aio_context_release(aio_context);
=20
     state->bs =3D bs;
=20
     state->job =3D do_drive_backup(backup, common->block_job_txn, &local=
_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
     }
-
-out:
-    aio_context_release(aio_context);
 }
=20
 static void drive_backup_commit(BlkActionState *common)
--=20
2.21.0


