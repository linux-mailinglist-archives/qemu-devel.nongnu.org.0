Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74E45FA5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 15:54:28 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbmey-0000Qx-0A
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 09:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbmSU-00020v-Ty
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbmSO-0006NV-BL
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:41:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38706)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbmS3-0006Ag-AD; Fri, 14 Jun 2019 09:41:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 483335D5E6;
 Fri, 14 Jun 2019 13:41:04 +0000 (UTC)
Received: from localhost (unknown [10.40.205.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2B652C8;
 Fri, 14 Jun 2019 13:41:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 14 Jun 2019 15:40:16 +0200
Message-Id: <20190614134021.32486-16-mreitz@redhat.com>
In-Reply-To: <20190614134021.32486-1-mreitz@redhat.com>
References: <20190614134021.32486-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 14 Jun 2019 13:41:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/20] qemu-img: Add salvaging mode to convert
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a salvaging mode (--salvage) to qemu-img convert which ignores
read errors and treats the respective areas as containing only zeroes.
This can be used for instance to at least partially recover the data
from terminally corrupted qcow2 images.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190507203508.18026-3-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qemu-img.c       | 90 +++++++++++++++++++++++++++++++++++++-----------
 qemu-img-cmds.hx |  4 +--
 qemu-img.texi    |  4 +++
 3 files changed, 75 insertions(+), 23 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index e15e617256..158b3a505f 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -69,6 +69,7 @@ enum {
     OPTION_SIZE =3D 264,
     OPTION_PREALLOCATION =3D 265,
     OPTION_SHRINK =3D 266,
+    OPTION_SALVAGE =3D 267,
 };
=20
 typedef enum OutputFormat {
@@ -1581,6 +1582,7 @@ typedef struct ImgConvertState {
     int64_t target_backing_sectors; /* negative if unknown */
     bool wr_in_order;
     bool copy_range;
+    bool salvage;
     bool quiet;
     int min_sparse;
     int alignment;
@@ -1628,25 +1630,44 @@ static int convert_iteration_sectors(ImgConvertSt=
ate *s, int64_t sector_num)
     }
=20
     if (s->sector_next_status <=3D sector_num) {
-        int64_t count =3D n * BDRV_SECTOR_SIZE;
+        uint64_t offset =3D (sector_num - src_cur_offset) * BDRV_SECTOR_=
SIZE;
+        int64_t count;
=20
-        if (s->target_has_backing) {
+        do {
+            count =3D n * BDRV_SECTOR_SIZE;
+
+            if (s->target_has_backing) {
+                ret =3D bdrv_block_status(blk_bs(s->src[src_cur]), offse=
t,
+                                        count, &count, NULL, NULL);
+            } else {
+                ret =3D bdrv_block_status_above(blk_bs(s->src[src_cur]),=
 NULL,
+                                              offset, count, &count, NUL=
L,
+                                              NULL);
+            }
+
+            if (ret < 0) {
+                if (s->salvage) {
+                    if (n =3D=3D 1) {
+                        if (!s->quiet) {
+                            warn_report("error while reading block statu=
s at "
+                                        "offset %" PRIu64 ": %s", offset=
,
+                                        strerror(-ret));
+                        }
+                        /* Just try to read the data, then */
+                        ret =3D BDRV_BLOCK_DATA;
+                        count =3D BDRV_SECTOR_SIZE;
+                    } else {
+                        /* Retry on a shorter range */
+                        n =3D DIV_ROUND_UP(n, 4);
+                    }
+                } else {
+                    error_report("error while reading block status at of=
fset "
+                                 "%" PRIu64 ": %s", offset, strerror(-re=
t));
+                    return ret;
+                }
+            }
+        } while (ret < 0);
=20
-            ret =3D bdrv_block_status(blk_bs(s->src[src_cur]),
-                                    (sector_num - src_cur_offset) *
-                                    BDRV_SECTOR_SIZE,
-                                    count, &count, NULL, NULL);
-        } else {
-            ret =3D bdrv_block_status_above(blk_bs(s->src[src_cur]), NUL=
L,
-                                          (sector_num - src_cur_offset) =
*
-                                          BDRV_SECTOR_SIZE,
-                                          count, &count, NULL, NULL);
-        }
-        if (ret < 0) {
-            error_report("error while reading block status of sector %" =
PRId64
-                         ": %s", sector_num, strerror(-ret));
-            return ret;
-        }
         n =3D DIV_ROUND_UP(count, BDRV_SECTOR_SIZE);
=20
         if (ret & BDRV_BLOCK_ZERO) {
@@ -1683,6 +1704,7 @@ static int convert_iteration_sectors(ImgConvertStat=
e *s, int64_t sector_num)
 static int coroutine_fn convert_co_read(ImgConvertState *s, int64_t sect=
or_num,
                                         int nb_sectors, uint8_t *buf)
 {
+    uint64_t single_read_until =3D 0;
     int n, ret;
=20
     assert(nb_sectors <=3D s->buf_sectors);
@@ -1690,6 +1712,7 @@ static int coroutine_fn convert_co_read(ImgConvertS=
tate *s, int64_t sector_num,
         BlockBackend *blk;
         int src_cur;
         int64_t bs_sectors, src_cur_offset;
+        uint64_t offset;
=20
         /* In the case of compression with multiple source files, we can=
 get a
          * nb_sectors that spreads into the next part. So we must be abl=
e to
@@ -1698,13 +1721,29 @@ static int coroutine_fn convert_co_read(ImgConver=
tState *s, int64_t sector_num,
         blk =3D s->src[src_cur];
         bs_sectors =3D s->src_sectors[src_cur];
=20
+        offset =3D (sector_num - src_cur_offset) << BDRV_SECTOR_BITS;
+
         n =3D MIN(nb_sectors, bs_sectors - (sector_num - src_cur_offset)=
);
+        if (single_read_until > offset) {
+            n =3D 1;
+        }
=20
-        ret =3D blk_co_pread(
-                blk, (sector_num - src_cur_offset) << BDRV_SECTOR_BITS,
-                n << BDRV_SECTOR_BITS, buf, 0);
+        ret =3D blk_co_pread(blk, offset, n << BDRV_SECTOR_BITS, buf, 0)=
;
         if (ret < 0) {
-            return ret;
+            if (s->salvage) {
+                if (n > 1) {
+                    single_read_until =3D offset + (n << BDRV_SECTOR_BIT=
S);
+                    continue;
+                } else {
+                    if (!s->quiet) {
+                        warn_report("error while reading offset %" PRIu6=
4
+                                    ": %s", offset, strerror(-ret));
+                    }
+                    memset(buf, 0, BDRV_SECTOR_SIZE);
+                }
+            } else {
+                return ret;
+            }
         }
=20
         sector_num +=3D n;
@@ -2035,6 +2074,7 @@ static int img_convert(int argc, char **argv)
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {"force-share", no_argument, 0, 'U'},
             {"target-image-opts", no_argument, 0, OPTION_TARGET_IMAGE_OP=
TS},
+            {"salvage", no_argument, 0, OPTION_SALVAGE},
             {0, 0, 0, 0}
         };
         c =3D getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WU",
@@ -2152,6 +2192,9 @@ static int img_convert(int argc, char **argv)
         case OPTION_IMAGE_OPTS:
             image_opts =3D true;
             break;
+        case OPTION_SALVAGE:
+            s.salvage =3D true;
+            break;
         case OPTION_TARGET_IMAGE_OPTS:
             tgt_image_opts =3D true;
             break;
@@ -2178,6 +2221,11 @@ static int img_convert(int argc, char **argv)
         goto fail_getopt;
     }
=20
+    if (s.copy_range && s.salvage) {
+        error_report("Cannot use copy offloading in salvaging mode");
+        goto fail_getopt;
+    }
+
     if (tgt_image_opts && !skip_create) {
         error_report("--target-image-opts requires use of -n flag");
         goto fail_getopt;
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 4b47f7495d..1c93e6d185 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -44,9 +44,9 @@ STEXI
 ETEXI
=20
 DEF("convert", img_convert,
-    "convert [--object objectdef] [--image-opts] [--target-image-opts] [=
-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O outpu=
t_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size=
] [-m num_coroutines] [-W] filename [filename2 [...]] output_filename")
+    "convert [--object objectdef] [--image-opts] [--target-image-opts] [=
-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O outpu=
t_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size=
] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_=
filename")
 STEXI
-@item convert [--object @var{objectdef}] [--image-opts] [--target-image-=
opts] [-U] [-C] [-c] [-p] [-q] [-n] [-f @var{fmt}] [-t @var{cache}] [-T @=
var{src_cache}] [-O @var{output_fmt}] [-B @var{backing_file}] [-o @var{op=
tions}] [-l @var{snapshot_param}] [-S @var{sparse_size}] [-m @var{num_cor=
outines}] [-W] @var{filename} [@var{filename2} [...]] @var{output_filenam=
e}
+@item convert [--object @var{objectdef}] [--image-opts] [--target-image-=
opts] [-U] [-C] [-c] [-p] [-q] [-n] [-f @var{fmt}] [-t @var{cache}] [-T @=
var{src_cache}] [-O @var{output_fmt}] [-B @var{backing_file}] [-o @var{op=
tions}] [-l @var{snapshot_param}] [-S @var{sparse_size}] [-m @var{num_cor=
outines}] [-W] [--salvage] @var{filename} [@var{filename2} [...]] @var{ou=
tput_filename}
 ETEXI
=20
 DEF("create", img_create,
diff --git a/qemu-img.texi b/qemu-img.texi
index e8bc0fd7a2..c8e9bba515 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -175,6 +175,10 @@ improve performance if the data is remote, such as w=
ith NFS or iSCSI backends,
 but will not automatically sparsify zero sectors, and may result in a fu=
lly
 allocated target image depending on the host support for getting allocat=
ion
 information.
+@item --salvage
+Try to ignore I/O errors when reading.  Unless in quiet mode (@code{-q})=
, errors
+will still be printed.  Areas that cannot be read from the source will b=
e
+treated as containing only zeroes.
 @end table
=20
 Parameters to dd subcommand:
--=20
2.21.0


