Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA181DC1C0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 00:03:59 +0200 (CEST)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbWog-0000aP-PT
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 18:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jbWmH-000521-W8
 for qemu-devel@nongnu.org; Wed, 20 May 2020 18:01:30 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24481
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jbWmF-0005iw-9X
 for qemu-devel@nongnu.org; Wed, 20 May 2020 18:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590012086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmdy/NNhStwXr8t2VRCx7vWf2DxDdTACLP6hjJPMxfI=;
 b=WXtNfggPtWU1HqcJYTNlR9OPbXuEq0jXdZ2BunzLgT7pbTWlzidVr3iungRrl8tcmMin6m
 KOWFIPSUJRCxIf8lnC7Bo5PgW2/C5wHn+g1QeX4ILakR3u6U9pfuEzLM/GVdQKloZUPvUn
 wUelG1OV61Qi9/hZh0H5dCanCC64IOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-pGVeIsqwP2iDEeq-lXGdfg-1; Wed, 20 May 2020 18:01:24 -0400
X-MC-Unique: pGVeIsqwP2iDEeq-lXGdfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03D6B107ACCA;
 Wed, 20 May 2020 22:01:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 502126AD00;
 Wed, 20 May 2020 22:01:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/5] qcow2: Expose bitmaps' size during measure
Date: Wed, 20 May 2020 17:01:15 -0500
Message-Id: <20200520220118.1037094-3-eblake@redhat.com>
In-Reply-To: <20200520220118.1037094-1-eblake@redhat.com>
References: <20200520220118.1037094-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 18:01:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com, nsoffer@redhat.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's useful to know how much space can be occupied by qcow2 persistent
bitmaps, even though such metadata is unrelated to the guest-visible
data.  Report this value as an additional QMP field, present when
measuring an existing image and output format that both support
bitmaps.  Update iotest 178 and 190 to updated output, as well as new
coverage in 190 demonstrating non-zero values made possible with the
recently-added qemu-img bitmap command.

On the command-line side, 'qemu-img measure' gains a new --bitmaps
flag.  When present, the bitmap size is rolled into the two existing
measures (or errors if either the source image or destination format
lacks bitmaps); when absent, there is never an error (for
back-compat), but the output will instead include a new line item for
bitmaps (which you would have to manually add), with that line being
omitted in the same cases where passing --bitmaps would error.

The behavior chosen here is symmetrical with the upcoming 'qemu-img
convert --bitmaps' being added in the next patch: that is, either both
commands will succeed (your qemu-img was new enough to do bitmap
manipulations, AND you correctly measured and copied the bitmaps, even
if that measurement was 0 because there was nothing to copy) or both
fail (either your qemu-img is too old to understand --bitmaps, or it
understands it but your choice of images do not support seamless
transition of bitmaps because either source, destination, or both lack
bitmap support).

The addition of a new field demonstrates why we should always
zero-initialize qapi C structs; while the qcow2 driver still fully
populates all fields, the raw and crypto drivers had to be tweaked to
avoid uninitialized data.

See also: https://bugzilla.redhat.com/1779904

Reported-by: Nir Soffer <nsoffer@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/tools/qemu-img.rst          | 12 ++++++-
 qapi/block-core.json             | 15 ++++++---
 block/qcow2.h                    |  2 ++
 block/crypto.c                   |  2 +-
 block/qcow2-bitmap.c             | 36 ++++++++++++++++++++
 block/qcow2.c                    | 14 ++++++--
 block/raw-format.c               |  2 +-
 qemu-img.c                       | 25 ++++++++++++++
 qemu-img-cmds.hx                 |  4 +--
 tests/qemu-iotests/178.out.qcow2 | 16 +++++++++
 tests/qemu-iotests/190           | 58 ++++++++++++++++++++++++++++++--
 tests/qemu-iotests/190.out       | 35 ++++++++++++++++++-
 12 files changed, 205 insertions(+), 16 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 38d464ea3f23..9a8112fc9f58 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -593,7 +593,7 @@ Command description:
   For more information, consult ``include/block/block.h`` in QEMU's
   source code.

-.. option:: measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS] [--size N | [--object OBJECTDEF] [--image-opts] [-f FMT] [-l SNAPSHOT_PARAM] FILENAME]
+.. option:: measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS] [--size N | [--object OBJECTDEF] [--image-opts] [-f FMT] [--bitmaps] [-l SNAPSHOT_PARAM] FILENAME]

   Calculate the file size required for a new image.  This information
   can be used to size logical volumes or SAN LUNs appropriately for
@@ -616,6 +616,7 @@ Command description:

     required size: 524288
     fully allocated size: 1074069504
+    bitmaps size: 0

   The ``required size`` is the file size of the new image.  It may be smaller
   than the virtual disk size if the image format supports compact representation.
@@ -625,6 +626,15 @@ Command description:
   occupy with the exception of internal snapshots, dirty bitmaps, vmstate data,
   and other advanced image format features.

+  The ``bitmaps size`` is the additional size required in order to
+  copy bitmaps from a source image in addition to the guest-visible
+  data; the line is omitted if either source or destination lacks
+  bitmap support, or 0 if bitmaps are supported but there is nothing
+  to copy.  If the ``--bitmaps`` option is in use, the bitmap size is
+  instead folded into the required and fully-allocated size for
+  convenience, rather than being a separate line item; using the
+  option will raise an error if bitmaps are not supported.
+
 .. option:: snapshot [--object OBJECTDEF] [--image-opts] [-U] [-q] [-l | -a SNAPSHOT | -c SNAPSHOT | -d SNAPSHOT] FILENAME

   List, apply, create or delete snapshots in image *FILENAME*.
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6fbacddab2cc..d5049c309380 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -636,18 +636,23 @@
 # efficiently so file size may be smaller than virtual disk size.
 #
 # The values are upper bounds that are guaranteed to fit the new image file.
-# Subsequent modification, such as internal snapshot or bitmap creation, may
-# require additional space and is not covered here.
+# Subsequent modification, such as internal snapshot or further bitmap
+# creation, may require additional space and is not covered here.
 #
-# @required: Size required for a new image file, in bytes.
+# @required: Size required for a new image file, in bytes, when copying just
+#            allocated guest-visible contents.
 #
 # @fully-allocated: Image file size, in bytes, once data has been written
-#                   to all sectors.
+#                   to all sectors, when copying just guest-visible contents.
+#
+# @bitmaps: Additional size required if all the top-level bitmap metadata in
+#           the source image were to be copied to the destination, present
+#           when the destination supports persistent bitmaps. (since 5.1)
 #
 # Since: 2.10
 ##
 { 'struct': 'BlockMeasureInfo',
-  'data': {'required': 'int', 'fully-allocated': 'int'} }
+  'data': {'required': 'int', 'fully-allocated': 'int', '*bitmaps': 'int'} }

 ##
 # @query-block:
diff --git a/block/qcow2.h b/block/qcow2.h
index 402e8acb1cb7..7ce2c23bdb7a 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -783,6 +783,8 @@ int qcow2_co_remove_persistent_dirty_bitmap(BlockDriverState *bs,
                                             const char *name,
                                             Error **errp);
 bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs);
+uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
+                                                uint32_t cluster_size);

 ssize_t coroutine_fn
 qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
diff --git a/block/crypto.c b/block/crypto.c
index b216e12c3154..973b57b3eb74 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -552,7 +552,7 @@ static BlockMeasureInfo *block_crypto_measure(QemuOpts *opts,
      * Unallocated blocks are still encrypted so allocation status makes no
      * difference to the file size.
      */
-    info = g_new(BlockMeasureInfo, 1);
+    info = g_new0(BlockMeasureInfo, 1);
     info->fully_allocated = luks_payload_size + size;
     info->required = luks_payload_size + size;
     return info;
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 1cf6d2ab77a3..7bf12502da8c 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1755,3 +1755,39 @@ bool qcow2_supports_persistent_dirty_bitmap(BlockDriverState *bs)

     return s->qcow_version >= 3;
 }
+
+/*
+ * Compute the space required for bitmaps in @bs.
+ *
+ * The computation is based as if copying to a new image with the
+ * given @cluster_size, which may differ from the cluster size in @bs.
+ */
+uint64_t qcow2_get_persistent_dirty_bitmap_size(BlockDriverState *bs,
+                                                uint32_t cluster_size)
+{
+    uint64_t bitmaps_size = 0;
+    BdrvDirtyBitmap *bm;
+    size_t bitmap_dir_size = 0;
+
+    FOR_EACH_DIRTY_BITMAP(bs, bm) {
+        if (bdrv_dirty_bitmap_get_persistence(bm)) {
+            const char *name = bdrv_dirty_bitmap_name(bm);
+            uint32_t granularity = bdrv_dirty_bitmap_granularity(bm);
+            uint64_t bmbytes =
+                get_bitmap_bytes_needed(bdrv_dirty_bitmap_size(bm),
+                                        granularity);
+            uint64_t bmclusters = DIV_ROUND_UP(bmbytes, cluster_size);
+
+            /* Assume the entire bitmap is allocated */
+            bitmaps_size += bmclusters * cluster_size;
+            /* Also reserve space for the bitmap table entries */
+            bitmaps_size += ROUND_UP(bmclusters * sizeof(uint64_t),
+                                     cluster_size);
+            /* And space for contribution to bitmap directory size */
+            bitmap_dir_size += calc_dir_entry_size(strlen(name), 0);
+        }
+    }
+    bitmaps_size += ROUND_UP(bitmap_dir_size, cluster_size);
+
+    return bitmaps_size;
+}
diff --git a/block/qcow2.c b/block/qcow2.c
index dfab8d2f6cd8..0cd2e6757e8c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4953,16 +4953,24 @@ static BlockMeasureInfo *qcow2_measure(QemuOpts *opts, BlockDriverState *in_bs,
         required = virtual_size;
     }

-    info = g_new(BlockMeasureInfo, 1);
+    info = g_new0(BlockMeasureInfo, 1);
     info->fully_allocated =
         qcow2_calc_prealloc_size(virtual_size, cluster_size,
                                  ctz32(refcount_bits)) + luks_payload_size;

-    /* Remove data clusters that are not required.  This overestimates the
+    /*
+     * Remove data clusters that are not required.  This overestimates the
      * required size because metadata needed for the fully allocated file is
-     * still counted.
+     * still counted.  Show bitmaps only if both source and destination
+     * would support them.
      */
     info->required = info->fully_allocated - virtual_size + required;
+    info->has_bitmaps = version >= 3 && in_bs &&
+        bdrv_supports_persistent_dirty_bitmap(in_bs);
+    if (info->has_bitmaps) {
+        info->bitmaps = qcow2_get_persistent_dirty_bitmap_size(in_bs,
+                                                               cluster_size);
+    }
     return info;

 err:
diff --git a/block/raw-format.c b/block/raw-format.c
index 018441bddf27..233d019ca338 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -359,7 +359,7 @@ static BlockMeasureInfo *raw_measure(QemuOpts *opts, BlockDriverState *in_bs,
                             BDRV_SECTOR_SIZE);
     }

-    info = g_new(BlockMeasureInfo, 1);
+    info = g_new0(BlockMeasureInfo, 1);
     info->required = required;

     /* Unallocated sectors count towards the file size in raw images */
diff --git a/qemu-img.c b/qemu-img.c
index 2d30682f129f..d719b9d35468 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -78,6 +78,7 @@ enum {
     OPTION_ENABLE = 272,
     OPTION_DISABLE = 273,
     OPTION_MERGE = 274,
+    OPTION_BITMAPS = 275,
 };

 typedef enum OutputFormat {
@@ -5128,6 +5129,7 @@ static int img_measure(int argc, char **argv)
         {"output", required_argument, 0, OPTION_OUTPUT},
         {"size", required_argument, 0, OPTION_SIZE},
         {"force-share", no_argument, 0, 'U'},
+        {"bitmaps", no_argument, 0, OPTION_BITMAPS},
         {0, 0, 0, 0}
     };
     OutputFormat output_format = OFORMAT_HUMAN;
@@ -5144,6 +5146,7 @@ static int img_measure(int argc, char **argv)
     QemuOpts *sn_opts = NULL;
     QemuOptsList *create_opts = NULL;
     bool image_opts = false;
+    bool bitmaps = false;
     uint64_t img_size = UINT64_MAX;
     BlockMeasureInfo *info = NULL;
     Error *local_err = NULL;
@@ -5216,6 +5219,9 @@ static int img_measure(int argc, char **argv)
             img_size = (uint64_t)sval;
         }
         break;
+        case OPTION_BITMAPS:
+            bitmaps = true;
+            break;
         }
     }

@@ -5244,6 +5250,10 @@ static int img_measure(int argc, char **argv)
         error_report("Either --size N or one filename must be specified.");
         goto out;
     }
+    if (!filename && bitmaps) {
+        error_report("--bitmaps is only supported with a filename.");
+        goto out;
+    }

     if (filename) {
         in_blk = img_open(image_opts, filename, fmt, 0,
@@ -5299,9 +5309,24 @@ static int img_measure(int argc, char **argv)
         goto out;
     }

+    if (bitmaps) {
+        if (!info->has_bitmaps) {
+            error_report("no bitmaps measured, either source or destination "
+                         "format lacks bitmap support");
+            goto out;
+        } else {
+            info->required += info->bitmaps;
+            info->fully_allocated += info->bitmaps;
+            info->has_bitmaps = false;
+        }
+    }
+
     if (output_format == OFORMAT_HUMAN) {
         printf("required size: %" PRIu64 "\n", info->required);
         printf("fully allocated size: %" PRIu64 "\n", info->fully_allocated);
+        if (info->has_bitmaps) {
+            printf("bitmaps size: %" PRIu64 "\n", info->bitmaps);
+        }
     } else {
         dump_json_block_measure_info(info);
     }
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index a87d3cb264ce..235cc5fffadc 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -76,9 +76,9 @@ SRST
 ERST

 DEF("measure", img_measure,
-"measure [--output=ofmt] [-O output_fmt] [-o options] [--size N | [--object objectdef] [--image-opts] [-f fmt] [-l snapshot_param] filename]")
+"measure [--output=ofmt] [-O output_fmt] [-o options] [--size N | [--object objectdef] [--image-opts] [-f fmt] [--bitmaps] [-l snapshot_param] filename]")
 SRST
-.. option:: measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS] [--size N | [--object OBJECTDEF] [--image-opts] [-f FMT] [-l SNAPSHOT_PARAM] FILENAME]
+.. option:: measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS] [--size N | [--object OBJECTDEF] [--image-opts] [-f FMT] [--bitmaps] [-l SNAPSHOT_PARAM] FILENAME]
 ERST

 DEF("snapshot", img_snapshot,
diff --git a/tests/qemu-iotests/178.out.qcow2 b/tests/qemu-iotests/178.out.qcow2
index 4b69524c80ee..c7997760fd6f 100644
--- a/tests/qemu-iotests/178.out.qcow2
+++ b/tests/qemu-iotests/178.out.qcow2
@@ -37,6 +37,7 @@ qemu-img: The image size is too large (try using a larger cluster size)
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
 required size: 196608
 fully allocated size: 196608
+bitmaps size: 0

 converted image file size in bytes: 196608

@@ -45,6 +46,7 @@ converted image file size in bytes: 196608
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 required size: 393216
 fully allocated size: 1074135040
+bitmaps size: 0
 wrote 512/512 bytes at offset 512
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 65536
@@ -53,6 +55,7 @@ wrote 64512/64512 bytes at offset 134217728
 63 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 required size: 589824
 fully allocated size: 1074135040
+bitmaps size: 0

 converted image file size in bytes: 524288

@@ -60,6 +63,7 @@ converted image file size in bytes: 524288

 required size: 524288
 fully allocated size: 1074135040
+bitmaps size: 0

 converted image file size in bytes: 458752

@@ -67,16 +71,19 @@ converted image file size in bytes: 458752

 required size: 1074135040
 fully allocated size: 1074135040
+bitmaps size: 0

 == qcow2 input image and LUKS encryption ==

 required size: 2686976
 fully allocated size: 1076232192
+bitmaps size: 0

 == qcow2 input image and preallocation (human) ==

 required size: 1074135040
 fully allocated size: 1074135040
+bitmaps size: 0

 converted image file size in bytes: 1074135040

@@ -87,6 +94,7 @@ wrote 8388608/8388608 bytes at offset 0
 8 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 required size: 8716288
 fully allocated size: 8716288
+bitmaps size: 0

 converted image file size in bytes: 8716288

@@ -173,6 +181,7 @@ qemu-img: The image size is too large (try using a larger cluster size)

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
 {
+    "bitmaps": 0,
     "required": 196608,
     "fully-allocated": 196608
 }
@@ -183,6 +192,7 @@ converted image file size in bytes: 196608

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 {
+    "bitmaps": 0,
     "required": 393216,
     "fully-allocated": 1074135040
 }
@@ -193,6 +203,7 @@ wrote 65536/65536 bytes at offset 65536
 wrote 64512/64512 bytes at offset 134217728
 63 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 {
+    "bitmaps": 0,
     "required": 589824,
     "fully-allocated": 1074135040
 }
@@ -202,6 +213,7 @@ converted image file size in bytes: 524288
 == qcow2 input image with internal snapshot (json) ==

 {
+    "bitmaps": 0,
     "required": 524288,
     "fully-allocated": 1074135040
 }
@@ -211,6 +223,7 @@ converted image file size in bytes: 458752
 == qcow2 input image and a backing file (json) ==

 {
+    "bitmaps": 0,
     "required": 1074135040,
     "fully-allocated": 1074135040
 }
@@ -218,6 +231,7 @@ converted image file size in bytes: 458752
 == qcow2 input image and LUKS encryption ==

 {
+    "bitmaps": 0,
     "required": 2686976,
     "fully-allocated": 1076232192
 }
@@ -225,6 +239,7 @@ converted image file size in bytes: 458752
 == qcow2 input image and preallocation (json) ==

 {
+    "bitmaps": 0,
     "required": 1074135040,
     "fully-allocated": 1074135040
 }
@@ -237,6 +252,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=8388608
 wrote 8388608/8388608 bytes at offset 0
 8 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 {
+    "bitmaps": 0,
     "required": 8716288,
     "fully-allocated": 8716288
 }
diff --git a/tests/qemu-iotests/190 b/tests/qemu-iotests/190
index 6d41650438e1..acb23ebae44b 100755
--- a/tests/qemu-iotests/190
+++ b/tests/qemu-iotests/190
@@ -2,7 +2,7 @@
 #
 # qemu-img measure sub-command tests on huge qcow2 files
 #
-# Copyright (C) 2017 Red Hat, Inc.
+# Copyright (C) 2017-2020 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -42,7 +42,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file

-echo "== Huge file =="
+echo "== Huge file without bitmaps =="
 echo

 _make_test_img -o 'cluster_size=2M' 2T
@@ -51,6 +51,60 @@ $QEMU_IMG measure -O raw -f qcow2 "$TEST_IMG"
 $QEMU_IMG measure -O qcow2 -o cluster_size=64k -f qcow2 "$TEST_IMG"
 $QEMU_IMG measure -O qcow2 -o cluster_size=2M -f qcow2 "$TEST_IMG"

+echo
+echo "== Huge file with bitmaps =="
+echo
+
+$QEMU_IMG bitmap --add --granularity 512 -f qcow2 "$TEST_IMG" b1
+$QEMU_IMG bitmap --add -g 2M -f qcow2 "$TEST_IMG" b2
+
+# No bitmap without a source
+$QEMU_IMG measure --bitmaps -O qcow2 --size 10M &&
+    echo "unexpected success"
+# No bitmap output, since raw does not support it
+$QEMU_IMG measure -O raw -f qcow2 "$TEST_IMG" ||
+    echo "unexpected failure"
+$QEMU_IMG measure --bitmaps -O raw -f qcow2 "$TEST_IMG" &&
+    echo "unexpected success"
+# No bitmap output, since no bitmaps on raw source
+$QEMU_IMG measure -O qcow2 -f raw "$TEST_IMG" ||
+    echo "unexpected failure"
+$QEMU_IMG measure --bitmaps -O qcow2 -f raw "$TEST_IMG" &&
+    echo "unexpected success"
+# No bitmap output, since v2 does not support it
+$QEMU_IMG measure -O qcow2 -o compat=0.10 -f qcow2 "$TEST_IMG" ||
+    echo "unexpected failure"
+$QEMU_IMG measure --bitmaps -O qcow2 -o compat=0.10 -f qcow2 "$TEST_IMG" &&
+    echo "unexpected success"
+
+# Compute expected output: bitmap clusters + bitmap tables + bitmaps directory
+echo
+val2T=$((2*1024*1024*1024*1024))
+cluster=$((64*1024))
+b1clusters=$(( (val2T/512/8 + cluster - 1) / cluster ))
+b2clusters=$(( (val2T/2/1024/1024/8 + cluster - 1) / cluster ))
+echo expected bitmap $((b1clusters * cluster +
+                        (b1clusters * 8 + cluster - 1) / cluster * cluster +
+                        b2clusters * cluster +
+                        (b2clusters * 8 + cluster - 1) / cluster * cluster +
+                        cluster))
+$QEMU_IMG measure -O qcow2 -o cluster_size=64k -f qcow2 "$TEST_IMG"
+$QEMU_IMG measure --bitmaps -O qcow2 -o cluster_size=64k -f qcow2 "$TEST_IMG"
+
+# Compute expected output: bitmap clusters + bitmap tables + bitmaps directory
+echo
+cluster=$((2*1024*1024))
+b1clusters=$(( (val2T/512/8 + cluster - 1) / cluster ))
+b2clusters=$(( (val2T/2/1024/1024/8 + cluster - 1) / cluster ))
+echo expected bitmap $((b1clusters * cluster +
+                        (b1clusters * 8 + cluster - 1) / cluster * cluster +
+                        b2clusters * cluster +
+                        (b2clusters * 8 + cluster - 1) / cluster * cluster +
+                        cluster))
+$QEMU_IMG measure --output=json -O qcow2 -o cluster_size=2M -f qcow2 "$TEST_IMG"
+$QEMU_IMG measure --output=json --bitmaps -O qcow2 -o cluster_size=2M \
+     -f qcow2 "$TEST_IMG"
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/190.out b/tests/qemu-iotests/190.out
index d001942002db..5c35f9268068 100644
--- a/tests/qemu-iotests/190.out
+++ b/tests/qemu-iotests/190.out
@@ -1,11 +1,44 @@
 QA output created by 190
-== Huge file ==
+== Huge file without bitmaps ==

 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=2199023255552
 required size: 2199023255552
 fully allocated size: 2199023255552
 required size: 335806464
 fully allocated size: 2199359062016
+bitmaps size: 0
 required size: 18874368
 fully allocated size: 2199042129920
+bitmaps size: 0
+
+== Huge file with bitmaps ==
+
+qemu-img: --bitmaps is only supported with a filename.
+required size: 2199023255552
+fully allocated size: 2199023255552
+qemu-img: no bitmaps measured, either source or destination format lacks bitmap support
+required size: 7012352
+fully allocated size: 17170432
+qemu-img: no bitmaps measured, either source or destination format lacks bitmap support
+required size: 335806464
+fully allocated size: 2199359062016
+qemu-img: no bitmaps measured, either source or destination format lacks bitmap support
+
+expected bitmap 537198592
+required size: 335806464
+fully allocated size: 2199359062016
+bitmaps size: 537198592
+required size: 873005056
+fully allocated size: 2199896260608
+
+expected bitmap 545259520
+{
+    "bitmaps": 545259520,
+    "required": 18874368,
+    "fully-allocated": 2199042129920
+}
+{
+    "required": 564133888,
+    "fully-allocated": 2199587389440
+}
 *** done
-- 
2.26.2


