Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA41151F31
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 18:20:07 +0100 (CET)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz1rq-0004EW-SL
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 12:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53775)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iz1iE-0004Qm-Cl
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iz1iD-0004da-5F
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:10 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26729
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iz1iD-0004cI-1C
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580836208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0WGNNGV3Rhc22i1Q1fZEI354IsKSbZejEm8O0xbxH0=;
 b=Q2ED5xuOY93cFmBbQhrExa6FqnpQyzBWVZ8JGuRIbNBSGnwSqNiw2+TOCMs0uvFIXxJGwO
 bGk/xZ/LaXwi+nYa79co31Ykcavhja5DK3nPyj1vl8a4tUYAIVe6IzRVSJ3ViN2r7gSwlL
 m+IpPuFWS9MEQKRHegaiKQJITZL2B5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-paDuvPpoMceHB39FvtQeRw-1; Tue, 04 Feb 2020 12:10:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6ABC1085927;
 Tue,  4 Feb 2020 17:10:05 +0000 (UTC)
Received: from localhost (ovpn-117-98.ams2.redhat.com [10.36.117.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08ACA8680B;
 Tue,  4 Feb 2020 17:10:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 25/33] block: Make filter drivers use child_of_bds
Date: Tue,  4 Feb 2020 18:08:40 +0100
Message-Id: <20200204170848.614480-26-mreitz@redhat.com>
In-Reply-To: <20200204170848.614480-1-mreitz@redhat.com>
References: <20200204170848.614480-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: paDuvPpoMceHB39FvtQeRw-1
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

Note that some filters have secondary children, namely blkverify (the
image to be verified) and blklogwrites (the log).  This patch does not
touch those children.

Note that for blkverify, the filtered child should not be format-probed.
While there is nothing enforcing this here, in practice, it will not be:
blkverify implements .bdrv_file_open.  The block layer ensures (and in
fact, asserts) that BDRV_O_PROTOCOL is set for every BDS whose driver
implements .bdrv_file_open.  This flag will then be bequeathed to
blkverify's children, and they will thus (by default) not be probed
either.

("By default" refers to the fact that blkverify's other child (the
non-filtered one) will have BDRV_O_PROTOCOL force-unset, because that is
what happens for all non-filtered children of non-format drivers.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/blkdebug.c        | 4 +++-
 block/blklogwrites.c    | 3 ++-
 block/blkverify.c       | 4 +++-
 block/copy-on-read.c    | 5 +++--
 block/filter-compress.c | 5 +++--
 block/replication.c     | 3 ++-
 block/throttle.c        | 5 +++--
 7 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8dd8ed6055..b31fa40b0e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -497,7 +497,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
=20
     /* Open the image file */
     bs->file =3D bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "=
image",
-                               bs, &child_file, 0, false, &local_err);
+                               bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 4faf912ef1..78b0c49460 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -157,7 +157,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QD=
ict *options, int flags,
     }
=20
     /* Open the file */
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
, false,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, f=
alse,
                                &local_err);
     if (local_err) {
         ret =3D -EINVAL;
diff --git a/block/blkverify.c b/block/blkverify.c
index 1684b7aa2e..5c3b29244a 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -125,7 +125,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *=
options, int flags,
=20
     /* Open the raw file */
     bs->file =3D bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "ra=
w",
-                               bs, &child_file, 0, false, &local_err);
+                               bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index a2d92ac394..c857ea0da7 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -28,8 +28,9 @@
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
, false,
-                               errp);
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 4dc5f9fb8c..9edd937645 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -30,8 +30,9 @@
 static int compress_open(BlockDriverState *bs, QDict *options, int flags,
                          Error **errp)
 {
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
, false,
-                               errp);
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/replication.c b/block/replication.c
index 9ca5c9368e..ec512ae1c3 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -90,7 +90,8 @@ static int replication_open(BlockDriverState *bs, QDict *=
options,
     const char *mode;
     const char *top_id;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/throttle.c b/block/throttle.c
index 2dea913be7..47b0a3522d 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -81,8 +81,9 @@ static int throttle_open(BlockDriverState *bs, QDict *opt=
ions,
     char *group;
     int ret;
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs,
-                               &child_file, 0, false, errp);
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
--=20
2.24.1


