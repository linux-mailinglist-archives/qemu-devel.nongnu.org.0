Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0C162695
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 13:58:26 +0100 (CET)
Received: from localhost ([::1]:34153 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42SH-0005F0-O3
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 07:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42EY-0006bv-5U
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42EW-0001kq-PU
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44358
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42EW-0001kd-LR
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mme04VKWjkqGlQi0dEDqTcpaqBw2ccPp0V4B4+kS2mU=;
 b=WQ848UcYDFXvhpjqhwYNNhYkDxO5la4KmeGEqlqzus82bcFv86yCaZxOxfCdr9F6axEh8/
 11Ai/78oFo2Ju+OWgLqeu94HBZ96ZgCMzaOTALwX4lbLZe4uScL69AfGx6keDIp/Y8zLW0
 /wmZ9LHhCyD7GVDVFZdCYrNpLsNl+wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-viTWG9wMOa-5t_rKf5FPyg-1; Tue, 18 Feb 2020 07:44:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34E10107ACC9;
 Tue, 18 Feb 2020 12:44:09 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A886517DC8;
 Tue, 18 Feb 2020 12:44:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 26/33] block: Use child_of_bds in remaining places
Date: Tue, 18 Feb 2020 13:42:35 +0100
Message-Id: <20200218124242.584644-27-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: viTWG9wMOa-5t_rKf5FPyg-1
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

Replace child_file by child_of_bds in all remaining places (excluding
tests).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block.c              |  3 ++-
 block/backup-top.c   |  4 ++--
 block/blklogwrites.c |  4 ++--
 block/blkreplay.c    |  5 +++--
 block/raw-format.c   | 15 +++++++++++++--
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 1f573f3815..d3beed1819 100644
--- a/block.c
+++ b/block.c
@@ -3242,7 +3242,8 @@ static BlockDriverState *bdrv_open_inherit(const char=
 *filename,
         BlockDriverState *file_bs;
=20
         file_bs =3D bdrv_open_child_bs(filename, options, "file", bs,
-                                     &child_file, 0, true, &local_err);
+                                     &child_of_bds, BDRV_CHILD_IMAGE,
+                                     true, &local_err);
         if (local_err) {
             goto fail;
         }
diff --git a/block/backup-top.c b/block/backup-top.c
index c173e61250..3d6f6530a2 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -210,8 +210,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverSta=
te *source,
              source->supported_zero_flags);
=20
     bdrv_ref(target);
-    state->target =3D bdrv_attach_child(top, target, "target", &child_file=
, 0,
-                                      errp);
+    state->target =3D bdrv_attach_child(top, target, "target", &child_of_b=
ds,
+                                      BDRV_CHILD_DATA, errp);
     if (!state->target) {
         bdrv_unref(target);
         bdrv_unref(top);
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 78b0c49460..3a57b273fc 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -167,8 +167,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QD=
ict *options, int flags,
     }
=20
     /* Open the log file */
-    s->log_file =3D bdrv_open_child(NULL, options, "log", bs, &child_file,=
 0,
-                                  false, &local_err);
+    s->log_file =3D bdrv_open_child(NULL, options, "log", bs, &child_of_bd=
s,
+                                  BDRV_CHILD_METADATA, false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index f97493f45a..71628f4d56 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -27,8 +27,9 @@ static int blkreplay_open(BlockDriverState *bs, QDict *op=
tions, int flags,
     int ret;
=20
     /* Open the image file */
-    bs->file =3D bdrv_open_child(NULL, options, "image",
-                               bs, &child_file, 0, false, &local_err);
+    bs->file =3D bdrv_open_child(NULL, options, "image", bs, &child_of_bds=
,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, &local_err);
     if (local_err) {
         ret =3D -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/raw-format.c b/block/raw-format.c
index 33f5942474..c6470e4622 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -444,6 +444,7 @@ static int raw_open(BlockDriverState *bs, QDict *option=
s, int flags,
     BDRVRawState *s =3D bs->opaque;
     bool has_size;
     uint64_t offset, size;
+    BdrvChildRole file_role;
     int ret;
=20
     ret =3D raw_read_options(options, &offset, &has_size, &size, errp);
@@ -451,8 +452,18 @@ static int raw_open(BlockDriverState *bs, QDict *optio=
ns, int flags,
         return ret;
     }
=20
-    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_file, 0=
,
-                               false, errp);
+    /*
+     * Without offset and a size limit, this driver behaves very much
+     * like a filter.  With any such limit, it does not.
+     */
+    if (offset || has_size) {
+        file_role =3D BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY;
+    } else {
+        file_role =3D BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
+    }
+
+    bs->file =3D bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               file_role, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
--=20
2.24.1


