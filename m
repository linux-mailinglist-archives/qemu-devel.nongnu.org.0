Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5D16269B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:00:35 +0100 (CET)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42UM-0000aS-9t
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42ES-0006Ng-FA
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42ER-0001hh-78
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50647
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42ER-0001h4-3x
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pqzr3KjSg9kvgeJy97iBRGIjIf4d6H7/OgxaNFvIJQg=;
 b=XJRStY6bWPwioMoKhudelD10RcA0Af5iKGveta2rlstFzDDAtxMMJ+7QaXhd7/wh2rmpqE
 z9O4Ii4IvYk10XfLF6V2P6ACchclPTEBG2Mrx+pwuqBul4DgMnn/S+cqsOqjxjfHpJPiTN
 EURZHcrRR6DBulVQ/9gyRhSJJq/fdvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-YnGcoavaO_6M-vaVNwJ0AQ-1; Tue, 18 Feb 2020 07:44:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEE5118A550B;
 Tue, 18 Feb 2020 12:43:59 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 295638B565;
 Tue, 18 Feb 2020 12:43:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 23/33] block: Drop child_backing
Date: Tue, 18 Feb 2020 13:42:32 +0100
Message-Id: <20200218124242.584644-24-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: YnGcoavaO_6M-vaVNwJ0AQ-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block.c                   | 62 +++------------------------------------
 include/block/block_int.h |  1 -
 2 files changed, 4 insertions(+), 59 deletions(-)

diff --git a/block.c b/block.c
index 31affcb4ee..1f573f3815 100644
--- a/block.c
+++ b/block.c
@@ -1191,15 +1191,6 @@ static void bdrv_backing_attach(BdrvChild *c)
                     parent->backing_blocker);
 }
=20
-/* XXX: Will be removed along with child_backing */
-static void bdrv_child_cb_attach_backing(BdrvChild *c)
-{
-    if (!(c->role & BDRV_CHILD_COW)) {
-        bdrv_backing_attach(c);
-    }
-    bdrv_child_cb_attach(c);
-}
-
 static void bdrv_backing_detach(BdrvChild *c)
 {
     BlockDriverState *parent =3D c->opaque;
@@ -1210,28 +1201,6 @@ static void bdrv_backing_detach(BdrvChild *c)
     parent->backing_blocker =3D NULL;
 }
=20
-/* XXX: Will be removed along with child_backing */
-static void bdrv_child_cb_detach_backing(BdrvChild *c)
-{
-    if (!(c->role & BDRV_CHILD_COW)) {
-        bdrv_backing_detach(c);
-    }
-    bdrv_child_cb_detach(c);
-}
-
-/*
- * Returns the options and flags that bs->backing should get, based on the
- * given options and flags for the parent BDS
- */
-static void bdrv_backing_options(BdrvChildRole role, bool parent_is_format=
,
-                                 int *child_flags, QDict *child_options,
-                                 int parent_flags, QDict *parent_options)
-{
-    bdrv_inherited_options(BDRV_CHILD_COW, true,
-                           child_flags, child_options,
-                           parent_flags, parent_options);
-}
-
 static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *ba=
se,
                                         const char *filename, Error **errp=
)
 {
@@ -1259,21 +1228,6 @@ static int bdrv_backing_update_filename(BdrvChild *c=
, BlockDriverState *base,
     return ret;
 }
=20
-const BdrvChildClass child_backing =3D {
-    .parent_is_bds   =3D true,
-    .get_parent_desc =3D bdrv_child_get_parent_desc,
-    .attach          =3D bdrv_child_cb_attach_backing,
-    .detach          =3D bdrv_child_cb_detach_backing,
-    .inherit_options =3D bdrv_backing_options,
-    .drained_begin   =3D bdrv_child_cb_drained_begin,
-    .drained_poll    =3D bdrv_child_cb_drained_poll,
-    .drained_end     =3D bdrv_child_cb_drained_end,
-    .inactivate      =3D bdrv_child_cb_inactivate,
-    .update_filename =3D bdrv_backing_update_filename,
-    .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
-    .set_aio_ctx     =3D bdrv_child_cb_set_aio_ctx,
-};
-
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags =3D flags;
@@ -2280,8 +2234,7 @@ static void bdrv_default_perms_for_backing(BlockDrive=
rState *bs, BdrvChild *c,
                                            uint64_t perm, uint64_t shared,
                                            uint64_t *nperm, uint64_t *nsha=
red)
 {
-    assert(child_class =3D=3D &child_backing ||
-           (child_class =3D=3D &child_of_bds && (role & BDRV_CHILD_COW)));
+    assert(child_class =3D=3D &child_of_bds && (role & BDRV_CHILD_COW));
=20
     /*
      * We want consistent read from backing files if the parent needs it.
@@ -2393,23 +2346,16 @@ void bdrv_format_default_perms(BlockDriverState *bs=
, BdrvChild *c,
                                uint64_t perm, uint64_t shared,
                                uint64_t *nperm, uint64_t *nshared)
 {
-    bool backing =3D (child_class =3D=3D &child_backing);
-
     if (child_class =3D=3D &child_of_bds) {
         bdrv_default_perms(bs, c, child_class, role, reopen_queue,
                            perm, shared, nperm, nshared);
         return;
     }
=20
-    assert(child_class =3D=3D &child_backing || child_class =3D=3D &child_=
file);
+    assert(child_class =3D=3D &child_file);
=20
-    if (!backing) {
-        bdrv_default_perms_for_metadata(bs, c, child_class, role, reopen_q=
ueue,
-                                        perm, shared, nperm, nshared);
-    } else {
-        bdrv_default_perms_for_backing(bs, c, child_class, role, reopen_qu=
eue,
-                                       perm, shared, nperm, nshared);
-    }
+    bdrv_default_perms_for_metadata(bs, c, child_class, role, reopen_queue=
,
+                                    perm, shared, nperm, nshared);
 }
=20
 void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 75139a95ae..ab64a5ccea 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -742,7 +742,6 @@ struct BdrvChildClass {
=20
 extern const BdrvChildClass child_of_bds;
 extern const BdrvChildClass child_file;
-extern const BdrvChildClass child_backing;
=20
 struct BdrvChild {
     BlockDriverState *bs;
--=20
2.24.1


