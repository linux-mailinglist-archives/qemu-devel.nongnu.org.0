Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40531627E8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:16:45 +0100 (CET)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43g4-0008PG-TN
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43Y1-0007kA-VG
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43Y0-0001bq-Sk
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25907
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43Y0-0001bQ-Op
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uf7rfk0MLqR1ql2RsMxh6if3s0VOgZ7kTLIxxQYU7YA=;
 b=KDPVrWYqfLFYaeeO+fxQmBqZOfFvfc3oS6FDloWk9trkbn4y5NG/yjE1o9uSqDBYk7CKiT
 LMtZVD+HyK15r9DGscCqTLLQ6MpqeaGyUcAVltJ4Vi5+Zdkm6u82n4oAE42ArHrowJ95xf
 X3d9+3PpszjSKAa9m8wK8GFEDxl69aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-4lUhQgy4MKSAVkG0WxY1Cg-1; Tue, 18 Feb 2020 09:08:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED06107ACC5;
 Tue, 18 Feb 2020 14:08:21 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2707F8B549;
 Tue, 18 Feb 2020 14:08:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/36] quorum: Fix child permissions
Date: Tue, 18 Feb 2020 15:07:08 +0100
Message-Id: <20200218140722.23876-23-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4lUhQgy4MKSAVkG0WxY1Cg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

From: Max Reitz <mreitz@redhat.com>

Quorum cannot share WRITE or RESIZE on its children.  Presumably, it
only does so because as a filter, it seemed intuitively correct to point
its .bdrv_child_perm to bdrv_filter_default_perm().

However, it is not really a filter, and bdrv_filter_default_perm() does
not work for it, so we have to provide a custom .bdrv_child_perm
implementation.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200218103454.296704-6-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.20.1


