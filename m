Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E61626DB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:10:37 +0100 (CET)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42e4-0007ap-6r
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42Eq-0007HK-OY
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42Ep-0001w8-OI
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39774
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42Ep-0001vu-KJ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEuTkgk8Im2JBBDdfMyL3Qhb/Rte2TyVItcIYV3lz8A=;
 b=bzy3yl2K/e6tf/m5lGC2cWchV7ZrAv3UtZDfNUuegPW3PBoYwItvMQ9JwyX7jKVMA56pCP
 Dfx4eTA4JmF41RccSsq6VT8mMkoOCx4g1/+HHXWOw+Raf8XexW9YNZbvRWXhT7ILdD1wV5
 PaWvmAJIYVu+QzqpoA8zgYbSAHXWNB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-iceRAwNAPnC2FbrhpTzGdQ-1; Tue, 18 Feb 2020 07:44:29 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4674713E4;
 Tue, 18 Feb 2020 12:44:28 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B689760C80;
 Tue, 18 Feb 2020 12:44:27 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 32/33] block: Pass BdrvChildRole in remaining cases
Date: Tue, 18 Feb 2020 13:42:41 +0100
Message-Id: <20200218124242.584644-33-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: iceRAwNAPnC2FbrhpTzGdQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These calls have no real use for the child role yet, but it will not
harm to give one.

Notably, the bdrv_root_attach_child() call in blockjob.c is left
unmodified because there is not much the generic BlockJob object wants
from its children.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/block-backend.c | 11 +++++++----
 block/vvfat.c         |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 9e0078bfb5..e655e15675 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -401,8 +401,9 @@ BlockBackend *blk_new_open(const char *filename, const =
char *reference,
         return NULL;
     }
=20
-    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root, 0, blk->=
ctx,
-                                       perm, BLK_PERM_ALL, blk, errp);
+    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root,
+                                       BDRV_CHILD_FILTERED | BDRV_CHILD_PR=
IMARY,
+                                       blk->ctx, perm, BLK_PERM_ALL, blk, =
errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
@@ -812,8 +813,10 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState =
*bs, Error **errp)
 {
     ThrottleGroupMember *tgm =3D &blk->public.throttle_group_member;
     bdrv_ref(bs);
-    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root, 0, blk->=
ctx,
-                                       blk->perm, blk->shared_perm, blk, e=
rrp);
+    blk->root =3D bdrv_root_attach_child(bs, "root", &child_root,
+                                       BDRV_CHILD_FILTERED | BDRV_CHILD_PR=
IMARY,
+                                       blk->ctx, blk->perm, blk->shared_pe=
rm,
+                                       blk, errp);
     if (blk->root =3D=3D NULL) {
         return -EPERM;
     }
diff --git a/block/vvfat.c b/block/vvfat.c
index 8f4ff5a97e..d4f4218924 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3186,7 +3186,7 @@ static int enable_write_target(BlockDriverState *bs, =
Error **errp)
     options =3D qdict_new();
     qdict_put_str(options, "write-target.driver", "qcow");
     s->qcow =3D bdrv_open_child(s->qcow_filename, options, "write-target",=
 bs,
-                              &child_vvfat_qcow, 0, false, errp);
+                              &child_vvfat_qcow, BDRV_CHILD_DATA, false, e=
rrp);
     qobject_unref(options);
     if (!s->qcow) {
         ret =3D -EINVAL;
--=20
2.24.1


