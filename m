Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C3181CD4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:49:21 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3bk-0004NU-LC
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VF-0002lz-N3
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VE-0002gD-Ee
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49538
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VE-0002dV-9Q
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9q4xxw9kvinCE4RZV1+LP35j8HfhlfEZQlRQGgKSxo=;
 b=jBxFEyN/hyGmj2OlZdTq5xLS7t20gWK73Jih17GV3KTCPNIrXPNfkUwWX2vSmSWYaDUJSH
 CS6Jp2qQ/LDBliyHMNDBeEeWKujrTkqbcKWX67P6CuHdSHDw5G8SEXLnNZrLBrNQ8MMeEL
 PsSxEc55pzwAzGSnNOSuK/Sqfntfx9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-TXPDf_YnO9GeTslbn73kpA-1; Wed, 11 Mar 2020 11:42:33 -0400
X-MC-Unique: TXPDf_YnO9GeTslbn73kpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B040E18A550D;
 Wed, 11 Mar 2020 15:42:32 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98DBB92D2C;
 Wed, 11 Mar 2020 15:42:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/13] block: Fix cross-AioContext blockdev-snapshot
Date: Wed, 11 Mar 2020 16:42:11 +0100
Message-Id: <20200311154218.15532-7-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

external_snapshot_prepare() tries to move the overlay to the AioContext
of the backing file (the snapshotted node). However, it's possible that
this doesn't work, but the backing file can instead be moved to the
overlay's AioContext (e.g. opening the backing chain for a mirror
target).

bdrv_append() already indirectly uses bdrv_attach_node(), which takes
care to move nodes to make sure they use the same AioContext and which
tries both directions.

So the problem has a simple fix: Just delete the unnecessary extra
bdrv_try_set_aio_context() call in external_snapshot_prepare() and
instead assert in bdrv_append() that both nodes were indeed moved to the
same AioContext.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200310113831.27293-6-kwolf@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c    |  1 +
 blockdev.c | 16 ----------------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/block.c b/block.c
index 79a5a2770f..8fc7b56937 100644
--- a/block.c
+++ b/block.c
@@ -4365,6 +4365,7 @@ void bdrv_replace_node(BlockDriverState *from, BlockD=
riverState *to,
     bdrv_ref(from);
=20
     assert(qemu_get_current_aio_context() =3D=3D qemu_get_aio_context());
+    assert(bdrv_get_aio_context(from) =3D=3D bdrv_get_aio_context(to));
     bdrv_drained_begin(from);
=20
     /* Put all parents into @list and calculate their cumulative permissio=
ns */
diff --git a/blockdev.c b/blockdev.c
index ea89896f27..fa8630cb41 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1470,9 +1470,7 @@ static void external_snapshot_prepare(BlkActionState =
*common,
                              DO_UPCAST(ExternalSnapshotState, common, comm=
on);
     TransactionAction *action =3D common->action;
     AioContext *aio_context;
-    AioContext *old_context;
     uint64_t perm, shared;
-    int ret;
=20
     /* 'blockdev-snapshot' and 'blockdev-snapshot-sync' have similar
      * purpose but a different set of parameters */
@@ -1608,20 +1606,6 @@ static void external_snapshot_prepare(BlkActionState=
 *common,
         goto out;
     }
=20
-    /* Honor bdrv_try_set_aio_context() context acquisition requirements. =
*/
-    old_context =3D bdrv_get_aio_context(state->new_bs);
-    aio_context_release(aio_context);
-    aio_context_acquire(old_context);
-
-    ret =3D bdrv_try_set_aio_context(state->new_bs, aio_context, errp);
-
-    aio_context_release(old_context);
-    aio_context_acquire(aio_context);
-
-    if (ret < 0) {
-        goto out;
-    }
-
     /* This removes our old bs and adds the new bs. This is an operation t=
hat
      * can fail, so we need to do it in .prepare; undoing it for abort is
      * always possible. */
--=20
2.20.1


