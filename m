Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737181626C7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:06:48 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42aN-0001RM-CI
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39597)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42Ei-00073X-QX
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42Ef-0001oq-ER
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39699
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42Ef-0001ob-9h
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qA/7qS4JP1GxbM4FFcuj6PVmhReNCrhh+IXMxb/ir20=;
 b=LyhC/znNEQwp9kxCPL9WqJbvEYFdjpSQVzZyVbtSUk+mLJgWXooxJpQxeKgcjVYW+njYl+
 E48hw1mGRI2F0oQPas7pMyltm8irSVlTCkM79vTE0pBVEG0Pwfxpi8RaUCoOxUJQEN8JRh
 /JjI92t5PfyMs8we4jvWKBTRav5WfKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-zvn9Kk1NORSLFbxk8BflSw-1; Tue, 18 Feb 2020 07:44:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C24A1005513;
 Tue, 18 Feb 2020 12:44:16 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B0CF1BC6D;
 Tue, 18 Feb 2020 12:44:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 28/33] block: Use bdrv_default_perms()
Date: Tue, 18 Feb 2020 13:42:37 +0100
Message-Id: <20200218124242.584644-29-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: zvn9Kk1NORSLFbxk8BflSw-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_default_perms() can decide which permission profile to use based on
the BdrvChildRole, so block drivers do not need to select it explicitly.

The blkverify driver now no longer shares the WRITE permission for the
image to verify.  We thus have to adjust two places in
test-block-iothread not to take it.  (Note that in theory, blkverify
should behave like quorum in this regard and share neither WRITE nor
RESIZE for both of its children.  In practice, it does not really
matter, because blkverify is used only for debugging, so we might as
well keep its permissions rather liberal.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/backup-top.c          |  4 ++--
 block/blkdebug.c            |  4 ++--
 block/blklogwrites.c        |  9 ++-------
 block/blkreplay.c           |  2 +-
 block/blkverify.c           |  2 +-
 block/bochs.c               |  2 +-
 block/cloop.c               |  2 +-
 block/crypto.c              |  2 +-
 block/dmg.c                 |  2 +-
 block/filter-compress.c     |  2 +-
 block/parallels.c           |  2 +-
 block/qcow.c                |  2 +-
 block/qcow2.c               |  2 +-
 block/qed.c                 |  2 +-
 block/raw-format.c          |  2 +-
 block/throttle.c            |  2 +-
 block/vdi.c                 |  2 +-
 block/vhdx.c                |  2 +-
 block/vmdk.c                |  2 +-
 block/vpc.c                 |  2 +-
 tests/test-bdrv-drain.c     | 10 +++++-----
 tests/test-bdrv-graph-mod.c |  2 +-
 tests/test-block-iothread.c | 17 ++++++++++++++---
 23 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 3d6f6530a2..00dbad44b5 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -153,8 +153,8 @@ static void backup_top_child_perm(BlockDriverState *bs,=
 BdrvChild *c,
         *nperm =3D BLK_PERM_WRITE;
     } else {
         /* Source child */
-        bdrv_filter_default_perms(bs, c, child_class, role, reopen_queue,
-                                  perm, shared, nperm, nshared);
+        bdrv_default_perms(bs, c, child_class, role, reopen_queue,
+                           perm, shared, nperm, nshared);
=20
         if (perm & BLK_PERM_WRITE) {
             *nperm =3D *nperm | BLK_PERM_CONSISTENT_READ;
diff --git a/block/blkdebug.c b/block/blkdebug.c
index b31fa40b0e..a925d8295e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -1003,8 +1003,8 @@ static void blkdebug_child_perm(BlockDriverState *bs,=
 BdrvChild *c,
 {
     BDRVBlkdebugState *s =3D bs->opaque;
=20
-    bdrv_filter_default_perms(bs, c, child_class, role, reopen_queue,
-                              perm, shared, nperm, nshared);
+    bdrv_default_perms(bs, c, child_class, role, reopen_queue,
+                       perm, shared, nperm, nshared);
=20
     *nperm |=3D s->take_child_perms;
     *nshared &=3D ~s->unshare_child_perms;
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 3a57b273fc..8684fb1c74 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -295,13 +295,8 @@ static void blk_log_writes_child_perm(BlockDriverState=
 *bs, BdrvChild *c,
         return;
     }
=20
-    if (!strcmp(c->name, "log")) {
-        bdrv_format_default_perms(bs, c, child_class, role, ro_q, perm, sh=
rd,
-                                  nperm, nshrd);
-    } else {
-        bdrv_filter_default_perms(bs, c, child_class, role, ro_q, perm, sh=
rd,
-                                  nperm, nshrd);
-    }
+    bdrv_default_perms(bs, c, child_class, role, ro_q, perm, shrd,
+                       nperm, nshrd);
 }
=20
 static void blk_log_writes_refresh_limits(BlockDriverState *bs, Error **er=
rp)
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 71628f4d56..be8cdb6b60 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -138,7 +138,7 @@ static BlockDriver bdrv_blkreplay =3D {
     .instance_size          =3D 0,
=20
     .bdrv_open              =3D blkreplay_open,
-    .bdrv_child_perm        =3D bdrv_filter_default_perms,
+    .bdrv_child_perm        =3D bdrv_default_perms,
     .bdrv_getlength         =3D blkreplay_getlength,
=20
     .bdrv_co_preadv         =3D blkreplay_co_preadv,
diff --git a/block/blkverify.c b/block/blkverify.c
index 5c3b29244a..2f261de24b 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -319,7 +319,7 @@ static BlockDriver bdrv_blkverify =3D {
     .bdrv_parse_filename              =3D blkverify_parse_filename,
     .bdrv_file_open                   =3D blkverify_open,
     .bdrv_close                       =3D blkverify_close,
-    .bdrv_child_perm                  =3D bdrv_filter_default_perms,
+    .bdrv_child_perm                  =3D bdrv_default_perms,
     .bdrv_getlength                   =3D blkverify_getlength,
     .bdrv_refresh_filename            =3D blkverify_refresh_filename,
     .bdrv_dirname                     =3D blkverify_dirname,
diff --git a/block/bochs.c b/block/bochs.c
index 62c3f42548..2f010ab40a 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -297,7 +297,7 @@ static BlockDriver bdrv_bochs =3D {
     .instance_size=09=3D sizeof(BDRVBochsState),
     .bdrv_probe=09=09=3D bochs_probe,
     .bdrv_open=09=09=3D bochs_open,
-    .bdrv_child_perm     =3D bdrv_format_default_perms,
+    .bdrv_child_perm     =3D bdrv_default_perms,
     .bdrv_refresh_limits =3D bochs_refresh_limits,
     .bdrv_co_preadv =3D bochs_co_preadv,
     .bdrv_close=09=09=3D bochs_close,
diff --git a/block/cloop.c b/block/cloop.c
index d374a8427d..c99192a57f 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -293,7 +293,7 @@ static BlockDriver bdrv_cloop =3D {
     .instance_size  =3D sizeof(BDRVCloopState),
     .bdrv_probe     =3D cloop_probe,
     .bdrv_open      =3D cloop_open,
-    .bdrv_child_perm     =3D bdrv_format_default_perms,
+    .bdrv_child_perm     =3D bdrv_default_perms,
     .bdrv_refresh_limits =3D cloop_refresh_limits,
     .bdrv_co_preadv =3D cloop_co_preadv,
     .bdrv_close     =3D cloop_close,
diff --git a/block/crypto.c b/block/crypto.c
index 2d85d9e70a..474f44b5db 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -659,7 +659,7 @@ static BlockDriver bdrv_crypto_luks =3D {
     .bdrv_close         =3D block_crypto_close,
     /* This driver doesn't modify LUKS metadata except when creating image=
.
      * Allow share-rw=3Don as a special case. */
-    .bdrv_child_perm    =3D bdrv_filter_default_perms,
+    .bdrv_child_perm    =3D bdrv_default_perms,
     .bdrv_co_create     =3D block_crypto_co_create_luks,
     .bdrv_co_create_opts =3D block_crypto_co_create_opts_luks,
     .bdrv_co_truncate   =3D block_crypto_co_truncate,
diff --git a/block/dmg.c b/block/dmg.c
index bc64194577..0d6c317296 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -750,7 +750,7 @@ static BlockDriver bdrv_dmg =3D {
     .bdrv_probe     =3D dmg_probe,
     .bdrv_open      =3D dmg_open,
     .bdrv_refresh_limits =3D dmg_refresh_limits,
-    .bdrv_child_perm     =3D bdrv_format_default_perms,
+    .bdrv_child_perm     =3D bdrv_default_perms,
     .bdrv_co_preadv =3D dmg_co_preadv,
     .bdrv_close     =3D dmg_close,
     .is_format      =3D true,
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 9edd937645..8ec1991c1f 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -133,7 +133,7 @@ static BlockDriver bdrv_compress =3D {
     .format_name                        =3D "compress",
=20
     .bdrv_open                          =3D compress_open,
-    .bdrv_child_perm                    =3D bdrv_filter_default_perms,
+    .bdrv_child_perm                    =3D bdrv_default_perms,
=20
     .bdrv_getlength                     =3D compress_getlength,
=20
diff --git a/block/parallels.c b/block/parallels.c
index 7dc9a1fa76..452d6dbfab 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -904,7 +904,7 @@ static BlockDriver bdrv_parallels =3D {
     .bdrv_probe=09=09=3D parallels_probe,
     .bdrv_open=09=09=3D parallels_open,
     .bdrv_close=09=09=3D parallels_close,
-    .bdrv_child_perm          =3D bdrv_format_default_perms,
+    .bdrv_child_perm          =3D bdrv_default_perms,
     .bdrv_co_block_status     =3D parallels_co_block_status,
     .bdrv_has_zero_init       =3D bdrv_has_zero_init_1,
     .bdrv_co_flush_to_os      =3D parallels_co_flush_to_os,
diff --git a/block/qcow.c b/block/qcow.c
index bc7f7c1054..f4219d9d56 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1179,7 +1179,7 @@ static BlockDriver bdrv_qcow =3D {
     .bdrv_probe=09=09=3D qcow_probe,
     .bdrv_open=09=09=3D qcow_open,
     .bdrv_close=09=09=3D qcow_close,
-    .bdrv_child_perm        =3D bdrv_format_default_perms,
+    .bdrv_child_perm        =3D bdrv_default_perms,
     .bdrv_reopen_prepare    =3D qcow_reopen_prepare,
     .bdrv_co_create         =3D qcow_co_create,
     .bdrv_co_create_opts    =3D qcow_co_create_opts,
diff --git a/block/qcow2.c b/block/qcow2.c
index 7e1532cc5e..cdcd544837 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5543,7 +5543,7 @@ BlockDriver bdrv_qcow2 =3D {
     .bdrv_reopen_commit   =3D qcow2_reopen_commit,
     .bdrv_reopen_abort    =3D qcow2_reopen_abort,
     .bdrv_join_options    =3D qcow2_join_options,
-    .bdrv_child_perm      =3D bdrv_format_default_perms,
+    .bdrv_child_perm      =3D bdrv_default_perms,
     .bdrv_co_create_opts  =3D qcow2_co_create_opts,
     .bdrv_co_create       =3D qcow2_co_create,
     .bdrv_has_zero_init   =3D qcow2_has_zero_init,
diff --git a/block/qed.c b/block/qed.c
index d6222798c2..08c63f1378 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1670,7 +1670,7 @@ static BlockDriver bdrv_qed =3D {
     .bdrv_open                =3D bdrv_qed_open,
     .bdrv_close               =3D bdrv_qed_close,
     .bdrv_reopen_prepare      =3D bdrv_qed_reopen_prepare,
-    .bdrv_child_perm          =3D bdrv_format_default_perms,
+    .bdrv_child_perm          =3D bdrv_default_perms,
     .bdrv_co_create           =3D bdrv_qed_co_create,
     .bdrv_co_create_opts      =3D bdrv_qed_co_create_opts,
     .bdrv_has_zero_init       =3D bdrv_has_zero_init_1,
diff --git a/block/raw-format.c b/block/raw-format.c
index c6470e4622..87a6e3303d 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -587,7 +587,7 @@ BlockDriver bdrv_raw =3D {
     .bdrv_reopen_commit   =3D &raw_reopen_commit,
     .bdrv_reopen_abort    =3D &raw_reopen_abort,
     .bdrv_open            =3D &raw_open,
-    .bdrv_child_perm      =3D bdrv_filter_default_perms,
+    .bdrv_child_perm      =3D bdrv_default_perms,
     .bdrv_co_create_opts  =3D &raw_co_create_opts,
     .bdrv_co_preadv       =3D &raw_co_preadv,
     .bdrv_co_pwritev      =3D &raw_co_pwritev,
diff --git a/block/throttle.c b/block/throttle.c
index 47b0a3522d..0ebbad0743 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -237,7 +237,7 @@ static BlockDriver bdrv_throttle =3D {
     .bdrv_close                         =3D   throttle_close,
     .bdrv_co_flush                      =3D   throttle_co_flush,
=20
-    .bdrv_child_perm                    =3D   bdrv_filter_default_perms,
+    .bdrv_child_perm                    =3D   bdrv_default_perms,
=20
     .bdrv_getlength                     =3D   throttle_getlength,
=20
diff --git a/block/vdi.c b/block/vdi.c
index 1736d02eee..4df7f0fc60 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -1037,7 +1037,7 @@ static BlockDriver bdrv_vdi =3D {
     .bdrv_open =3D vdi_open,
     .bdrv_close =3D vdi_close,
     .bdrv_reopen_prepare =3D vdi_reopen_prepare,
-    .bdrv_child_perm          =3D bdrv_format_default_perms,
+    .bdrv_child_perm          =3D bdrv_default_perms,
     .bdrv_co_create      =3D vdi_co_create,
     .bdrv_co_create_opts =3D vdi_co_create_opts,
     .bdrv_has_zero_init  =3D vdi_has_zero_init,
diff --git a/block/vhdx.c b/block/vhdx.c
index d8a315015d..18c1f2768a 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2232,7 +2232,7 @@ static BlockDriver bdrv_vhdx =3D {
     .bdrv_open              =3D vhdx_open,
     .bdrv_close             =3D vhdx_close,
     .bdrv_reopen_prepare    =3D vhdx_reopen_prepare,
-    .bdrv_child_perm        =3D bdrv_format_default_perms,
+    .bdrv_child_perm        =3D bdrv_default_perms,
     .bdrv_co_readv          =3D vhdx_co_readv,
     .bdrv_co_writev         =3D vhdx_co_writev,
     .bdrv_co_create         =3D vhdx_co_create,
diff --git a/block/vmdk.c b/block/vmdk.c
index 497414e5f2..79f6666a11 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -3055,7 +3055,7 @@ static BlockDriver bdrv_vmdk =3D {
     .bdrv_open                    =3D vmdk_open,
     .bdrv_co_check                =3D vmdk_co_check,
     .bdrv_reopen_prepare          =3D vmdk_reopen_prepare,
-    .bdrv_child_perm              =3D bdrv_format_default_perms,
+    .bdrv_child_perm              =3D bdrv_default_perms,
     .bdrv_co_preadv               =3D vmdk_co_preadv,
     .bdrv_co_pwritev              =3D vmdk_co_pwritev,
     .bdrv_co_pwritev_compressed   =3D vmdk_co_pwritev_compressed,
diff --git a/block/vpc.c b/block/vpc.c
index 9acd6edac9..955c58aa2b 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1238,7 +1238,7 @@ static BlockDriver bdrv_vpc =3D {
     .bdrv_open              =3D vpc_open,
     .bdrv_close             =3D vpc_close,
     .bdrv_reopen_prepare    =3D vpc_reopen_prepare,
-    .bdrv_child_perm        =3D bdrv_format_default_perms,
+    .bdrv_child_perm        =3D bdrv_default_perms,
     .bdrv_co_create         =3D vpc_co_create,
     .bdrv_co_create_opts    =3D vpc_co_create_opts,
=20
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 91567ca97d..0da5a3a6a1 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -93,15 +93,15 @@ static void bdrv_test_child_perm(BlockDriverState *bs, =
BdrvChild *c,
                                  uint64_t *nperm, uint64_t *nshared)
 {
     /*
-     * bdrv_format_default_perms() accepts only these two, so disguise
+     * bdrv_default_perms() accepts only these two, so disguise
      * detach_by_driver_cb_parent as one of them.
      */
     if (child_class !=3D &child_file && child_class !=3D &child_of_bds) {
         child_class =3D &child_of_bds;
     }
=20
-    bdrv_format_default_perms(bs, c, child_class, role, reopen_queue,
-                              perm, shared, nperm, nshared);
+    bdrv_default_perms(bs, c, child_class, role, reopen_queue,
+                       perm, shared, nperm, nshared);
 }
=20
 static int bdrv_test_change_backing_file(BlockDriverState *bs,
@@ -1137,7 +1137,7 @@ static BlockDriver bdrv_test_top_driver =3D {
     .bdrv_close             =3D bdrv_test_top_close,
     .bdrv_co_preadv         =3D bdrv_test_top_co_preadv,
=20
-    .bdrv_child_perm        =3D bdrv_format_default_perms,
+    .bdrv_child_perm        =3D bdrv_default_perms,
 };
=20
 typedef struct TestCoDeleteByDrainData {
@@ -1966,7 +1966,7 @@ static BlockDriver bdrv_replace_test =3D {
     .bdrv_co_drain_begin    =3D bdrv_replace_test_co_drain_begin,
     .bdrv_co_drain_end      =3D bdrv_replace_test_co_drain_end,
=20
-    .bdrv_child_perm        =3D bdrv_format_default_perms,
+    .bdrv_child_perm        =3D bdrv_default_perms,
 };
=20
 static void coroutine_fn test_replace_child_mid_drain_read_co(void *opaque=
)
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 6ae91ff171..a2d0318b16 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -26,7 +26,7 @@
=20
 static BlockDriver bdrv_pass_through =3D {
     .format_name =3D "pass-through",
-    .bdrv_child_perm =3D bdrv_filter_default_perms,
+    .bdrv_child_perm =3D bdrv_default_perms,
 };
=20
 static void no_perm_default_perms(BlockDriverState *bs, BdrvChild *c,
diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index 0c861809f0..d928d2c6d9 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -481,8 +481,13 @@ static void test_propagate_basic(void)
     BlockDriverState *bs_a, *bs_b, *bs_verify;
     QDict *options;
=20
-    /* Create bs_a and its BlockBackend */
-    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    /*
+     * Create bs_a and its BlockBackend.  We cannot take the RESIZE
+     * permission because blkverify will not share it on the test
+     * image.
+     */
+    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL & ~BLK_PERM_RESIZ=
E,
+                  BLK_PERM_ALL);
     bs_a =3D bdrv_new_open_driver(&bdrv_test, "bs_a", BDRV_O_RDWR, &error_=
abort);
     blk_insert_bs(blk, bs_a, &error_abort);
=20
@@ -565,7 +570,13 @@ static void test_propagate_diamond(void)
     qdict_put_str(options, "raw", "bs_c");
=20
     bs_verify =3D bdrv_open(NULL, NULL, options, BDRV_O_RDWR, &error_abort=
);
-    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    /*
+     * Do not take the RESIZE permission: This would require the same
+     * from bs_c and thus from bs_a; however, blkverify will not share
+     * it on bs_b, and thus it will not be available for bs_a.
+     */
+    blk =3D blk_new(qemu_get_aio_context(), BLK_PERM_ALL & ~BLK_PERM_RESIZ=
E,
+                  BLK_PERM_ALL);
     blk_insert_bs(blk, bs_verify, &error_abort);
=20
     /* Switch the AioContext */
--=20
2.24.1


