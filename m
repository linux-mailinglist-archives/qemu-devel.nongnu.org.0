Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F97FBB1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 16:04:23 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htYAQ-0007UW-Em
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 10:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1htY9U-0006mY-Cz
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 10:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1htY9T-0007SM-FF
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 10:03:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1htY9Q-0007PH-Nn; Fri, 02 Aug 2019 10:03:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B41403142530;
 Fri,  2 Aug 2019 14:03:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-107.ams2.redhat.com
 [10.36.117.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A972E60A97;
 Fri,  2 Aug 2019 14:03:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri,  2 Aug 2019 16:03:14 +0200
Message-Id: <20190802140314.19001-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 02 Aug 2019 14:03:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] block: Simplify bdrv_filter_default_perms()
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same change as commit 2b23f28639 ('block/copy-on-read: Fix
permissions for inactive node') made for the copy-on-read driver can be
made for bdrv_filter_default_perms(): Retaining the old permissions from
the BdrvChild if it is given complicates things unnecessary when in the
end this only means that the options set in the c =3D=3D NULL case (i.e.
during child creation) are retained.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index cbd8da5f3b..6db8ecd62b 100644
--- a/block.c
+++ b/block.c
@@ -2168,16 +2168,8 @@ void bdrv_filter_default_perms(BlockDriverState *b=
s, BdrvChild *c,
                                uint64_t perm, uint64_t shared,
                                uint64_t *nperm, uint64_t *nshared)
 {
-    if (c =3D=3D NULL) {
-        *nperm =3D perm & DEFAULT_PERM_PASSTHROUGH;
-        *nshared =3D (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_=
UNCHANGED;
-        return;
-    }
-
-    *nperm =3D (perm & DEFAULT_PERM_PASSTHROUGH) |
-             (c->perm & DEFAULT_PERM_UNCHANGED);
-    *nshared =3D (shared & DEFAULT_PERM_PASSTHROUGH) |
-               (c->shared_perm & DEFAULT_PERM_UNCHANGED);
+    *nperm =3D perm & DEFAULT_PERM_PASSTHROUGH;
+    *nshared =3D (shared & DEFAULT_PERM_PASSTHROUGH) | DEFAULT_PERM_UNCH=
ANGED;
 }
=20
 void bdrv_format_default_perms(BlockDriverState *bs, BdrvChild *c,
--=20
2.20.1


