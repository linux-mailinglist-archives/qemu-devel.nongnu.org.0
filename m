Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07E151F30
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 18:20:07 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz1rq-0004CY-BF
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 12:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iz1iL-0004e5-1N
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iz1iI-0004zh-NP
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:16 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35768
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iz1iI-0004yT-K7
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580836214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XItEAHyZ46qYwqjUKpQVgP394mLVQi66Zl0cnHXNNHo=;
 b=jKv29kszkcJSKZ6QTizZMzdCjL1k4tlk9StrWt/Oc6EPE1DLCa6Yg/pEGBMosLsoI2o2hc
 75FpAb7N2Tpm5EAZodOMLThr8CW5qriM18clQtg01/mbYX1HOD5Kcq8mH025y45ciep6r4
 faaqp03EplygS0KYt+0RfldvWFCjf1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-r5pvPTxaMluqcO9vcuN9OA-1; Tue, 04 Feb 2020 12:10:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5737C1882CD1;
 Tue,  4 Feb 2020 17:10:09 +0000 (UTC)
Received: from localhost (ovpn-117-98.ams2.redhat.com [10.36.117.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B937D1A7E3;
 Tue,  4 Feb 2020 17:10:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 26/33] block: Use child_of_bds in remaining places
Date: Tue,  4 Feb 2020 18:08:41 +0100
Message-Id: <20200204170848.614480-27-mreitz@redhat.com>
In-Reply-To: <20200204170848.614480-1-mreitz@redhat.com>
References: <20200204170848.614480-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: r5pvPTxaMluqcO9vcuN9OA-1
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace child_file by child_of_bds in all remaining places (excluding
tests).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c              |  3 ++-
 block/backup-top.c   |  4 ++--
 block/blklogwrites.c |  4 ++--
 block/blkreplay.c    |  5 +++--
 block/raw-format.c   | 15 +++++++++++++--
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index e245b5d8d9..747a2973f5 100644
--- a/block.c
+++ b/block.c
@@ -3220,7 +3220,8 @@ static BlockDriverState *bdrv_open_inherit(const char=
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
index 8ac7009852..d641ccc491 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -201,8 +201,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverSta=
te *source,
     state =3D top->opaque;
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


