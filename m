Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699471624CE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:44:07 +0100 (CET)
Received: from localhost ([::1]:60718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40MI-0001iu-Ed
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j40Dm-0001FH-GK
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j40Dl-0007NN-9y
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:18 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53002
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j40Dl-0007NA-5v
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqWjZxjtWIp3MWC4LNtMxsi6Ek69Xqn/5MO9nTKp1ok=;
 b=AJG2OSHEwiSG4otYOP+pxrjsktbY+DEPsUmuGAHfo8O7Ne6qSMFOtc00Sw+zuWonGXOMem
 8GO/JwGpEu5MZYTX4rIh1DuoOvprYrynoQiCE33hM9hd484t6tsPamObr8X7mvh5Pt1p2W
 33RGZCLkdj7DbDEH8KlROD3jP8WeLOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-M_u9Cak6PNmGTPls4H-zuw-1; Tue, 18 Feb 2020 05:35:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02056800D55;
 Tue, 18 Feb 2020 10:35:12 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F2C81001925;
 Tue, 18 Feb 2020 10:35:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 05/19] quorum: Fix child permissions
Date: Tue, 18 Feb 2020 11:34:40 +0100
Message-Id: <20200218103454.296704-6-mreitz@redhat.com>
In-Reply-To: <20200218103454.296704-1-mreitz@redhat.com>
References: <20200218103454.296704-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: M_u9Cak6PNmGTPls4H-zuw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

Quorum cannot share WRITE or RESIZE on its children.  Presumably, it
only does so because as a filter, it seemed intuitively correct to point
its .bdrv_child_perm to bdrv_filter_default_perm().

However, it is not really a filter, and bdrv_filter_default_perm() does
not work for it, so we have to provide a custom .bdrv_child_perm
implementation.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/quorum.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/block/quorum.c b/block/quorum.c
index df68adcfaa..17b439056f 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1114,6 +1114,23 @@ static char *quorum_dirname(BlockDriverState *bs, Er=
ror **errp)
     return NULL;
 }
=20
+static void quorum_child_perm(BlockDriverState *bs, BdrvChild *c,
+                              const BdrvChildRole *role,
+                              BlockReopenQueue *reopen_queue,
+                              uint64_t perm, uint64_t shared,
+                              uint64_t *nperm, uint64_t *nshared)
+{
+    *nperm =3D perm & DEFAULT_PERM_PASSTHROUGH;
+
+    /*
+     * We cannot share RESIZE or WRITE, as this would make the
+     * children differ from each other.
+     */
+    *nshared =3D (shared & (BLK_PERM_CONSISTENT_READ |
+                          BLK_PERM_WRITE_UNCHANGED))
+             | DEFAULT_PERM_UNCHANGED;
+}
+
 static const char *const quorum_strong_runtime_opts[] =3D {
     QUORUM_OPT_VOTE_THRESHOLD,
     QUORUM_OPT_BLKVERIFY,
@@ -1143,7 +1160,7 @@ static BlockDriver bdrv_quorum =3D {
     .bdrv_add_child                     =3D quorum_add_child,
     .bdrv_del_child                     =3D quorum_del_child,
=20
-    .bdrv_child_perm                    =3D bdrv_filter_default_perms,
+    .bdrv_child_perm                    =3D quorum_child_perm,
=20
     .is_filter                          =3D true,
     .bdrv_recurse_is_first_non_filter   =3D quorum_recurse_is_first_non_fi=
lter,
--=20
2.24.1


