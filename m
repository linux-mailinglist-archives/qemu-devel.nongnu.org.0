Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71832F176
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:39:05 +0100 (CET)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEPo-0000N0-Qg
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkW-0007Kd-I8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007Fm-93
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtOzG4OBuh8aPBUp14RhhEBM/wVmtgVX2RBvuZFqbWM=;
 b=byJicvBpYvmCh7y4QLAXEK5ve28L+CAwyguX56eQ9xjkqnawByxv5Ann3hr/D567LBE5cd
 Zj357DwWUPg9LQgOa0H7PxRt4B5wvrkjzCRhrXJmOjRfuz3Hygr35Q0Zel4V5NW2ZxCDv+
 OCwipUdwN94kwgRBlTQ4AQht7RMXbsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-ZYG-7JsYPwS2h2y8akBamA-1; Fri, 05 Mar 2021 11:55:57 -0500
X-MC-Unique: ZYG-7JsYPwS2h2y8akBamA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5EE518C0285;
 Fri,  5 Mar 2021 16:55:44 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8C0360BF3;
 Fri,  5 Mar 2021 16:55:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/31] parallels: support bitmap extension for read-only mode
Date: Fri,  5 Mar 2021 17:54:50 +0100
Message-Id: <20210305165454.356840-28-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210224104707.88430-5-vsementsov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/parallels.h     |   6 +-
 block/parallels-ext.c | 300 ++++++++++++++++++++++++++++++++++++++++++
 block/parallels.c     |  18 +++
 block/meson.build     |   3 +-
 4 files changed, 325 insertions(+), 2 deletions(-)
 create mode 100644 block/parallels-ext.c

diff --git a/block/parallels.h b/block/parallels.h
index 9a9209e320..f22f43f988 100644
--- a/block/parallels.h
+++ b/block/parallels.h
@@ -48,7 +48,8 @@ typedef struct ParallelsHeader {
     uint64_t nb_sectors;
     uint32_t inuse;
     uint32_t data_off;
-    char padding[12];
+    uint32_t flags;
+    uint64_t ext_off;
 } QEMU_PACKED ParallelsHeader;
 
 typedef enum ParallelsPreallocMode {
@@ -85,4 +86,7 @@ typedef struct BDRVParallelsState {
     Error *migration_blocker;
 } BDRVParallelsState;
 
+int parallels_read_format_extension(BlockDriverState *bs,
+                                    int64_t ext_off, Error **errp);
+
 #endif
diff --git a/block/parallels-ext.c b/block/parallels-ext.c
new file mode 100644
index 0000000000..e0dd0975c6
--- /dev/null
+++ b/block/parallels-ext.c
@@ -0,0 +1,300 @@
+/*
+ * Support of Parallels Format Extension. It's a part of Parallels format
+ * driver.
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "block/block_int.h"
+#include "parallels.h"
+#include "crypto/hash.h"
+#include "qemu/uuid.h"
+
+#define PARALLELS_FORMAT_EXTENSION_MAGIC 0xAB234CEF23DCEA87ULL
+
+#define PARALLELS_END_OF_FEATURES_MAGIC 0x0ULL
+#define PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC 0x20385FAE252CB34AULL
+
+typedef struct ParallelsFormatExtensionHeader {
+    uint64_t magic; /* PARALLELS_FORMAT_EXTENSION_MAGIC */
+    uint8_t check_sum[16];
+} QEMU_PACKED ParallelsFormatExtensionHeader;
+
+typedef struct ParallelsFeatureHeader {
+    uint64_t magic;
+    uint64_t flags;
+    uint32_t data_size;
+    uint32_t _unused;
+} QEMU_PACKED ParallelsFeatureHeader;
+
+typedef struct ParallelsDirtyBitmapFeature {
+    uint64_t size;
+    uint8_t id[16];
+    uint32_t granularity;
+    uint32_t l1_size;
+    /* L1 table follows */
+} QEMU_PACKED ParallelsDirtyBitmapFeature;
+
+/* Given L1 table read bitmap data from the image and populate @bitmap */
+static int parallels_load_bitmap_data(BlockDriverState *bs,
+                                      const uint64_t *l1_table,
+                                      uint32_t l1_size,
+                                      BdrvDirtyBitmap *bitmap,
+                                      Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret = 0;
+    uint64_t offset, limit;
+    uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
+    uint8_t *buf = NULL;
+    uint64_t i, tab_size =
+        DIV_ROUND_UP(bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size),
+                     s->cluster_size);
+
+    if (tab_size != l1_size) {
+        error_setg(errp, "Bitmap table size %" PRIu32 " does not correspond "
+                   "to bitmap size and cluster size. Expected %" PRIu64,
+                   l1_size, tab_size);
+        return -EINVAL;
+    }
+
+    buf = qemu_blockalign(bs, s->cluster_size);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
+    for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
+        uint64_t count = MIN(bm_size - offset, limit);
+        uint64_t entry = l1_table[i];
+
+        if (entry == 0) {
+            /* No need to deserialize zeros because @bitmap is cleared. */
+            continue;
+        }
+
+        if (entry == 1) {
+            bdrv_dirty_bitmap_deserialize_ones(bitmap, offset, count, false);
+        } else {
+            ret = bdrv_pread(bs->file, entry << BDRV_SECTOR_BITS, buf,
+                             s->cluster_size);
+            if (ret < 0) {
+                error_setg_errno(errp, -ret,
+                                 "Failed to read bitmap data cluster");
+                goto finish;
+            }
+            bdrv_dirty_bitmap_deserialize_part(bitmap, buf, offset, count,
+                                               false);
+        }
+    }
+    ret = 0;
+
+    bdrv_dirty_bitmap_deserialize_finish(bitmap);
+
+finish:
+    qemu_vfree(buf);
+
+    return ret;
+}
+
+/*
+ * @data buffer (of @data_size size) is the Dirty bitmaps feature which
+ * consists of ParallelsDirtyBitmapFeature followed by L1 table.
+ */
+static BdrvDirtyBitmap *parallels_load_bitmap(BlockDriverState *bs,
+                                              uint8_t *data,
+                                              size_t data_size,
+                                              Error **errp)
+{
+    int ret;
+    ParallelsDirtyBitmapFeature bf;
+    g_autofree uint64_t *l1_table = NULL;
+    BdrvDirtyBitmap *bitmap;
+    QemuUUID uuid;
+    char uuidstr[UUID_FMT_LEN + 1];
+    int i;
+
+    if (data_size < sizeof(bf)) {
+        error_setg(errp, "Too small Bitmap Feature area in Parallels Format "
+                   "Extension: %zu bytes, expected at least %zu bytes",
+                   data_size, sizeof(bf));
+        return NULL;
+    }
+    memcpy(&bf, data, sizeof(bf));
+    bf.size = le64_to_cpu(bf.size);
+    bf.granularity = le32_to_cpu(bf.granularity) << BDRV_SECTOR_BITS;
+    bf.l1_size = le32_to_cpu(bf.l1_size);
+    data += sizeof(bf);
+    data_size -= sizeof(bf);
+
+    if (bf.size != bs->total_sectors) {
+        error_setg(errp, "Bitmap size (in sectors) %" PRId64 " differs from "
+                   "disk size in sectors %" PRId64, bf.size, bs->total_sectors);
+        return NULL;
+    }
+
+    if (bf.l1_size * sizeof(uint64_t) > data_size) {
+        error_setg(errp, "Bitmaps feature corrupted: l1 table exceeds "
+                   "extension data_size");
+        return NULL;
+    }
+
+    memcpy(&uuid, bf.id, sizeof(uuid));
+    qemu_uuid_unparse(&uuid, uuidstr);
+    bitmap = bdrv_create_dirty_bitmap(bs, bf.granularity, uuidstr, errp);
+    if (!bitmap) {
+        return NULL;
+    }
+
+    l1_table = g_new(uint64_t, bf.l1_size);
+    for (i = 0; i < bf.l1_size; i++, data += sizeof(uint64_t)) {
+        l1_table[i] = ldq_le_p(data);
+    }
+
+    ret = parallels_load_bitmap_data(bs, l1_table, bf.l1_size, bitmap, errp);
+    if (ret < 0) {
+        bdrv_release_dirty_bitmap(bitmap);
+        return NULL;
+    }
+
+    /* We support format extension only for RO parallels images. */
+    assert(!(bs->open_flags & BDRV_O_RDWR));
+    bdrv_dirty_bitmap_set_readonly(bitmap, true);
+
+    return bitmap;
+}
+
+static int parallels_parse_format_extension(BlockDriverState *bs,
+                                            uint8_t *ext_cluster, Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+    int remaining = s->cluster_size;
+    uint8_t *pos = ext_cluster;
+    ParallelsFormatExtensionHeader eh;
+    g_autofree uint8_t *hash = NULL;
+    size_t hash_len = 0;
+    GSList *bitmaps = NULL, *el;
+
+    memcpy(&eh, pos, sizeof(eh));
+    eh.magic = le64_to_cpu(eh.magic);
+    pos += sizeof(eh);
+    remaining -= sizeof(eh);
+
+    if (eh.magic != PARALLELS_FORMAT_EXTENSION_MAGIC) {
+        error_setg(errp, "Wrong parallels Format Extension magic: 0x%" PRIx64
+                   ", expected: 0x%llx", eh.magic,
+                   PARALLELS_FORMAT_EXTENSION_MAGIC);
+        goto fail;
+    }
+
+    ret = qcrypto_hash_bytes(QCRYPTO_HASH_ALG_MD5, (char *)pos, remaining,
+                             &hash, &hash_len, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    if (hash_len != sizeof(eh.check_sum) ||
+        memcmp(hash, eh.check_sum, sizeof(eh.check_sum)) != 0) {
+        error_setg(errp, "Wrong checksum in Format Extension header. Format "
+                   "extension is corrupted.");
+        goto fail;
+    }
+
+    while (true) {
+        ParallelsFeatureHeader fh;
+        BdrvDirtyBitmap *bitmap;
+
+        if (remaining < sizeof(fh)) {
+            error_setg(errp, "Can not read feature header, as remaining bytes "
+                       "(%d) in Format Extension is less than Feature header "
+                       "size (%zu)", remaining, sizeof(fh));
+            goto fail;
+        }
+
+        memcpy(&fh, pos, sizeof(fh));
+        pos += sizeof(fh);
+        remaining -= sizeof(fh);
+
+        fh.magic = le64_to_cpu(fh.magic);
+        fh.flags = le64_to_cpu(fh.flags);
+        fh.data_size = le32_to_cpu(fh.data_size);
+
+        if (fh.flags) {
+            error_setg(errp, "Flags for extension feature are unsupported");
+            goto fail;
+        }
+
+        if (fh.data_size > remaining) {
+            error_setg(errp, "Feature data_size exceedes Format Extension "
+                       "cluster");
+            goto fail;
+        }
+
+        switch (fh.magic) {
+        case PARALLELS_END_OF_FEATURES_MAGIC:
+            return 0;
+
+        case PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC:
+            bitmap = parallels_load_bitmap(bs, pos, fh.data_size, errp);
+            if (!bitmap) {
+                goto fail;
+            }
+            bitmaps = g_slist_append(bitmaps, bitmap);
+            break;
+
+        default:
+            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
+            goto fail;
+        }
+
+        pos = ext_cluster + QEMU_ALIGN_UP(pos + fh.data_size - ext_cluster, 8);
+    }
+
+fail:
+    for (el = bitmaps; el; el = el->next) {
+        bdrv_release_dirty_bitmap(el->data);
+    }
+    g_slist_free(bitmaps);
+
+    return -EINVAL;
+}
+
+int parallels_read_format_extension(BlockDriverState *bs,
+                                    int64_t ext_off, Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+    uint8_t *ext_cluster = qemu_blockalign(bs, s->cluster_size);
+
+    assert(ext_off > 0);
+
+    ret = bdrv_pread(bs->file, ext_off, ext_cluster, s->cluster_size);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Failed to read Format Extension cluster");
+        goto out;
+    }
+
+    ret = parallels_parse_format_extension(bs, ext_cluster, errp);
+
+out:
+    qemu_vfree(ext_cluster);
+
+    return ret;
+}
diff --git a/block/parallels.c b/block/parallels.c
index 9594d84978..6ebad2a2bb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -843,6 +844,23 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail_options;
     }
 
+    if (ph.ext_off) {
+        if (flags & BDRV_O_RDWR) {
+            /*
+             * It's unsafe to open image RW if there is an extension (as we
+             * don't support it). But parallels driver in QEMU historically
+             * ignores the extension, so print warning and don't care.
+             */
+            warn_report("Format Extension ignored in RW mode");
+        } else {
+            ret = parallels_read_format_extension(
+                    bs, le64_to_cpu(ph.ext_off) << BDRV_SECTOR_BITS, errp);
+            if (ret < 0) {
+                goto fail;
+            }
+        }
+    }
+
     if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_INACTIVE)) {
         s->header->inuse = cpu_to_le32(HEADER_INUSE_MAGIC);
         ret = parallels_update_header(bs);
diff --git a/block/meson.build b/block/meson.build
index eeaefe5809..d21990ec95 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -57,7 +57,8 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
   'qed-table.c',
   'qed.c',
 ))
-block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true: files('parallels.c'))
+block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'],
+             if_true: files('parallels.c', 'parallels-ext.c'))
 block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
-- 
2.29.2


