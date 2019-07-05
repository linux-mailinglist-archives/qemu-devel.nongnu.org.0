Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE25F8F3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 15:15:05 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj1Zo-0001J2-Gh
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 09:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46102)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hj1V8-0004Y2-OJ
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 09:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hj1V3-0008Lu-QA
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 09:10:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:54566)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hj1Uv-0008GT-Sv; Thu, 04 Jul 2019 09:10:02 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hj1Uq-000226-04; Thu, 04 Jul 2019 16:09:56 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: kwolf@redhat.com, mreitz@redhat.com, eblake@redhat.com, armbru@redhat.com
Date: Thu,  4 Jul 2019 16:09:47 +0300
Message-Id: <20190704130949.14017-2-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
References: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 1/3] qcow2: introduce compression type
 feature
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
Cc: vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch adds some preparation parts for incompatible compression type
feature to QCOW2 header that indicates that *all* compressed clusters
must be (de)compressed using a certain compression type.

It is implied that the compression type is set on the image creation and
can be changed only later by image conversion, thus compression type
defines the only compression algorithm used for the image.

The goal of the feature is to add support of other compression algorithms
to qcow2. For example, ZSTD which is more effective on compression than ZLIB.
It works roughly 2x faster than ZLIB providing a comparable compression ratio
and therefore provide a performance advantage in backup scenarios.

The default compression is ZLIB. Images created with ZLIB compression type
are backward compatible with older qemu versions.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 block/qcow2.c             | 95 +++++++++++++++++++++++++++++++++++++++
 block/qcow2.h             | 26 ++++++++---
 docs/interop/qcow2.txt    | 21 ++++++++-
 include/block/block_int.h |  1 +
 qapi/block-core.json      | 22 ++++++++-
 5 files changed, 155 insertions(+), 10 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3ace3b2209..8fa932a349 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1202,6 +1202,32 @@ static int qcow2_update_options(BlockDriverState *bs, QDict *options,
     return ret;
 }
 
+static int check_compression_type(BDRVQcow2State *s, Error **errp)
+{
+    switch (s->compression_type) {
+    case QCOW2_COMPRESSION_TYPE_ZLIB:
+        break;
+
+    default:
+        error_setg(errp, "qcow2: unknown compression type: %u",
+                   s->compression_type);
+        return -ENOTSUP;
+    }
+
+    /*
+     * if the compression type differs from QCOW2_COMPRESSION_TYPE_ZLIB
+     * the incompatible feature flag must be set
+     */
+
+    if (s->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB &&
+        !(s->incompatible_features & QCOW2_INCOMPAT_COMPRESSION_TYPE)) {
+            error_setg(errp, "qcow2: Invalid compression type setting");
+            return -EINVAL;
+    }
+
+    return 0;
+}
+
 /* Called with s->lock held.  */
 static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
                                       int flags, Error **errp)
@@ -1318,6 +1344,35 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     s->compatible_features      = header.compatible_features;
     s->autoclear_features       = header.autoclear_features;
 
+    /*
+     * Handle compression type
+     * Older qcow2 images don't contain the compression type header.
+     * Distinguish them by the header length and use
+     * the only valid (default) compression type in that case
+     */
+    if (header.header_length > offsetof(QCowHeader, compression_type)) {
+        /* sanity check that we can read a compression type */
+        size_t min_len = offsetof(QCowHeader, compression_type) +
+                         sizeof(header.compression_type);
+        if (header.header_length < min_len) {
+            error_setg(errp,
+                       "Could not read compression type."
+                       "qcow2 header is too short");
+           ret = -EINVAL;
+           goto fail;
+        }
+
+        header.compression_type = be32_to_cpu(header.compression_type);
+        s->compression_type = header.compression_type;
+    } else {
+        s->compression_type = QCOW2_COMPRESSION_TYPE_ZLIB;
+    }
+
+    ret = check_compression_type(s, errp);
+    if (ret) {
+        goto fail;
+    }
+
     if (s->incompatible_features & ~QCOW2_INCOMPAT_MASK) {
         void *feature_table = NULL;
         qcow2_read_extensions(bs, header.header_length, ext_end,
@@ -2434,6 +2489,13 @@ int qcow2_update_header(BlockDriverState *bs)
     total_size = bs->total_sectors * BDRV_SECTOR_SIZE;
     refcount_table_clusters = s->refcount_table_size >> (s->cluster_bits - 3);
 
+    ret = check_compression_type(s, NULL);
+
+    if (ret) {
+        goto fail;
+    }
+
+
     *header = (QCowHeader) {
         /* Version 2 fields */
         .magic                  = cpu_to_be32(QCOW_MAGIC),
@@ -2456,6 +2518,7 @@ int qcow2_update_header(BlockDriverState *bs)
         .autoclear_features     = cpu_to_be64(s->autoclear_features),
         .refcount_order         = cpu_to_be32(s->refcount_order),
         .header_length          = cpu_to_be32(header_length),
+        .compression_type       = cpu_to_be32(s->compression_type),
     };
 
     /* For older versions, write a shorter header */
@@ -2553,6 +2616,11 @@ int qcow2_update_header(BlockDriverState *bs)
                 .bit  = QCOW2_COMPAT_LAZY_REFCOUNTS_BITNR,
                 .name = "lazy refcounts",
             },
+            {
+                .type = QCOW2_FEAT_TYPE_INCOMPATIBLE,
+                .bit  = QCOW2_INCOMPAT_COMPRESSION_TYPE_BITNR,
+                .name = "compression type",
+            },
         };
 
         ret = header_ext_add(buf, QCOW2_EXT_MAGIC_FEATURE_TABLE,
@@ -3107,6 +3175,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         .refcount_table_offset      = cpu_to_be64(cluster_size),
         .refcount_table_clusters    = cpu_to_be32(1),
         .refcount_order             = cpu_to_be32(refcount_order),
+        .compression_type           = cpu_to_be32(QCOW2_COMPRESSION_TYPE_ZLIB),
         .header_length              = cpu_to_be32(sizeof(*header)),
     };
 
@@ -3126,6 +3195,24 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             cpu_to_be64(QCOW2_AUTOCLEAR_DATA_FILE_RAW);
     }
 
+    if (qcow2_opts->has_compression_type &&
+        qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
+
+        switch(qcow2_opts->compression_type) {
+        case QCOW2_COMPRESSION_TYPE_ZLIB:
+            break;
+
+        default:
+            error_setg_errno(errp, -EINVAL, "Unknown compression type");
+            goto out;
+        }
+
+        header->compression_type = cpu_to_be32(qcow2_opts->compression_type);
+
+        header->incompatible_features |=
+            cpu_to_be64(QCOW2_INCOMPAT_COMPRESSION_TYPE);
+    }
+
     ret = blk_pwrite(blk, 0, header, cluster_size, 0);
     g_free(header);
     if (ret < 0) {
@@ -3307,6 +3394,7 @@ static int coroutine_fn qcow2_co_create_opts(const char *filename, QemuOpts *opt
         { BLOCK_OPT_ENCRYPT,            BLOCK_OPT_ENCRYPT_FORMAT },
         { BLOCK_OPT_COMPAT_LEVEL,       "version" },
         { BLOCK_OPT_DATA_FILE_RAW,      "data-file-raw" },
+        { BLOCK_OPT_COMPRESSION_TYPE,   "compression-type" },
         { NULL, NULL },
     };
 
@@ -4675,6 +4763,7 @@ static ImageInfoSpecific *qcow2_get_specific_info(BlockDriverState *bs,
             .data_file          = g_strdup(s->image_data_file),
             .has_data_file_raw  = has_data_file(bs),
             .data_file_raw      = data_file_is_raw(bs),
+            .compression_type   = s->compression_type,
         };
     } else {
         /* if this assertion fails, this probably means a new version was
@@ -5239,6 +5328,12 @@ static QemuOptsList qcow2_create_opts = {
             .help = "Width of a reference count entry in bits",
             .def_value_str = "16"
         },
+        {
+            .name = BLOCK_OPT_COMPRESSION_TYPE,
+            .type = QEMU_OPT_STRING,
+            .help = "Compression method used for image clusters compression",
+            .def_value_str = "zlib"
+        },
         { /* end of list */ }
     }
 };
diff --git a/block/qcow2.h b/block/qcow2.h
index fdee297f33..b44344c78e 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -135,6 +135,7 @@ typedef struct QCowHeader {
 
     uint32_t refcount_order;
     uint32_t header_length;
+    uint32_t compression_type;
 } QEMU_PACKED QCowHeader;
 
 typedef struct QEMU_PACKED QCowSnapshotHeader {
@@ -198,16 +199,20 @@ enum {
 
 /* Incompatible feature bits */
 enum {
-    QCOW2_INCOMPAT_DIRTY_BITNR      = 0,
-    QCOW2_INCOMPAT_CORRUPT_BITNR    = 1,
-    QCOW2_INCOMPAT_DATA_FILE_BITNR  = 2,
-    QCOW2_INCOMPAT_DIRTY            = 1 << QCOW2_INCOMPAT_DIRTY_BITNR,
-    QCOW2_INCOMPAT_CORRUPT          = 1 << QCOW2_INCOMPAT_CORRUPT_BITNR,
-    QCOW2_INCOMPAT_DATA_FILE        = 1 << QCOW2_INCOMPAT_DATA_FILE_BITNR,
+    QCOW2_INCOMPAT_DIRTY_BITNR            = 0,
+    QCOW2_INCOMPAT_CORRUPT_BITNR          = 1,
+    QCOW2_INCOMPAT_DATA_FILE_BITNR        = 2,
+    QCOW2_INCOMPAT_COMPRESSION_TYPE_BITNR = 3,
+    QCOW2_INCOMPAT_DIRTY                  = 1 << QCOW2_INCOMPAT_DIRTY_BITNR,
+    QCOW2_INCOMPAT_CORRUPT                = 1 << QCOW2_INCOMPAT_CORRUPT_BITNR,
+    QCOW2_INCOMPAT_DATA_FILE              = 1 << QCOW2_INCOMPAT_DATA_FILE_BITNR,
+    QCOW2_INCOMPAT_COMPRESSION_TYPE       =
+        1 << QCOW2_INCOMPAT_COMPRESSION_TYPE_BITNR,
 
     QCOW2_INCOMPAT_MASK             = QCOW2_INCOMPAT_DIRTY
                                     | QCOW2_INCOMPAT_CORRUPT
-                                    | QCOW2_INCOMPAT_DATA_FILE,
+                                    | QCOW2_INCOMPAT_DATA_FILE
+                                    | QCOW2_INCOMPAT_COMPRESSION_TYPE,
 };
 
 /* Compatible feature bits */
@@ -350,6 +355,13 @@ typedef struct BDRVQcow2State {
     int nb_compress_threads;
 
     BdrvChild *data_file;
+    /*
+     * Compression type used for the image. Default: 0 - ZLIB
+     * The image compression type is set on image creation.
+     * The only way to change the compression type is to convert the image
+     * with the desired compression type set
+     */
+    uint32_t compression_type;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index af5711e533..7cf068f814 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -109,7 +109,12 @@ in the description of a field.
                                 An External Data File Name header extension may
                                 be present if this bit is set.
 
-                    Bits 3-63:  Reserved (set to 0)
+                    Bit 3:      Compression type bit. The bit must be set if
+                                the compression type differs from default: zlib.
+                                If the compression type is default the bit must
+                                be unset.
+
+                    Bits 4-63:  Reserved (set to 0)
 
          80 -  87:  compatible_features
                     Bitmask of compatible features. An implementation can
@@ -165,6 +170,20 @@ in the description of a field.
                     Length of the header structure in bytes. For version 2
                     images, the length is always assumed to be 72 bytes.
 
+        104 - 107:  compression_type
+                    Defines the compression method used for compressed clusters.
+                    A single compression type is applied to all compressed image
+                    clusters.
+                    The compression type is set on image creation only.
+                    The default compression type is zlib (value: 0).
+                    When the compression type differs from the default
+                    the compression type bit (incompatible feature bit 3)
+                    must be set.
+                    Qemu versions older than 4.1 can use images created with
+                    the default compression type without any additional
+                    preparations and cannot use images created with any other
+                    compression type.
+
 Directly after the image header, optional sections called header extensions can
 be stored. Each extension has a structure like the following:
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 01e855a066..814917baec 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -58,6 +58,7 @@
 #define BLOCK_OPT_REFCOUNT_BITS     "refcount_bits"
 #define BLOCK_OPT_DATA_FILE         "data_file"
 #define BLOCK_OPT_DATA_FILE_RAW     "data_file_raw"
+#define BLOCK_OPT_COMPRESSION_TYPE  "compression_type"
 
 #define BLOCK_PROBE_BUF_SIZE        512
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 7ccbfff9d0..835dd3c37f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -78,6 +78,8 @@
 #
 # @bitmaps: A list of qcow2 bitmap details (since 4.0)
 #
+# @compression-type: the image cluster compression method (since 4.1)
+#
 # Since: 1.7
 ##
 { 'struct': 'ImageInfoSpecificQCow2',
@@ -89,7 +91,8 @@
       '*corrupt': 'bool',
       'refcount-bits': 'int',
       '*encrypt': 'ImageInfoSpecificQCow2Encryption',
-      '*bitmaps': ['Qcow2BitmapInfo']
+      '*bitmaps': ['Qcow2BitmapInfo'],
+      'compression-type': 'Qcow2CompressionType'
   } }
 
 ##
@@ -4206,6 +4209,18 @@
   'data': [ 'v2', 'v3' ] }
 
 
+##
+# @Qcow2CompressionType:
+#
+# Compression type used in qcow2 image file
+#
+# @zlib:  zlib compression, see <http://zlib.net/>
+#
+# Since: 4.1
+##
+{ 'enum': 'Qcow2CompressionType',
+  'data': [ 'zlib' ] }
+
 ##
 # @BlockdevCreateOptionsQcow2:
 #
@@ -4228,6 +4243,8 @@
 # @preallocation    Preallocation mode for the new image (default: off)
 # @lazy-refcounts   True if refcounts may be updated lazily (default: off)
 # @refcount-bits    Width of reference counts in bits (default: 16)
+# @compression-type The image cluster compression method
+#                   (default: zlib, since 4.1)
 #
 # Since: 2.12
 ##
@@ -4243,7 +4260,8 @@
             '*cluster-size':    'size',
             '*preallocation':   'PreallocMode',
             '*lazy-refcounts':  'bool',
-            '*refcount-bits':   'int' } }
+            '*refcount-bits':   'int',
+            '*compression-type': 'Qcow2CompressionType' } }
 
 ##
 # @BlockdevCreateOptionsQed:
-- 
2.17.0


