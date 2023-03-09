Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544456B1E89
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBto-0000NX-KT; Thu, 09 Mar 2023 03:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtm-0000MN-Ak
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBti-0000FA-O2
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/DdPD1vC2WnPMDOn3ShBOi1jN3amrU83BUcKpcp7WWI=;
 b=GZlRUgEe5rpQHqCjuQGYiDzIsLqO6Pi92rl2aId5VTzEICHKeoSdPcAUIhj4JqZJU/zC62
 WoP74OZ9MP6QzA8szWJmNNJZx22nL40tNYRGnUtl5JmEdH5hSBWfacjclYKDQdSqjQE7GJ
 0340KygbIEYw0swieylCRqU4ozYd53Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-kCRZohQeMsyHVFtucBUgQQ-1; Thu, 09 Mar 2023 03:45:11 -0500
X-MC-Unique: kCRZohQeMsyHVFtucBUgQQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso1902476edb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/DdPD1vC2WnPMDOn3ShBOi1jN3amrU83BUcKpcp7WWI=;
 b=j32cvjoCKyMegAtLENTfox48pNCzKDXYgZiyvebqT0ukMMjuPJsq90Cb3fj2J3INpS
 4il4GH5ipswUYUSyEtfqsxbwdega5Nu4ocsE9moF12ecbcAmdQRfgd6tUS9hY1GRnvLL
 +sEH//utnVIKN35iVVHNaQVeqhTT/r7zRKKQQZPk5pu8JwK18VpOaQCBnjO76jU5ViOU
 m7PJ0xW5SdetbE7jxE9wEF+jtqAYwu9zbkKA8/kCIT9rpgQdve4B5Dofu/MCx1tSg19C
 YV/PjL0JQSYpEWAFdTooLtxzbbehalPDj9rAVkm/vgGmy3pABwS7cDus7vjlb4xMWKhg
 3bOQ==
X-Gm-Message-State: AO0yUKV0k3YN7fA6o6rAWbgS8uriansHW+WERe7mfTOpsovT6eCQy4Tx
 HAk9OxVq3QmgEshiSDILEQb6ySorRrglhWoZ68vIOIMSQJfQc9P83vJcF8ZWmyV5h7IKYbClX0M
 EfJK7mxOnwzpT/Vg1Nebo8sS+3dET5ujmi5M8DbBi2+pWXKUJjZJethXtIsTMLaUWUrn/TXWXXP
 U=
X-Received: by 2002:a05:6402:31fb:b0:4ac:c3c0:24d7 with SMTP id
 dy27-20020a05640231fb00b004acc3c024d7mr20985010edb.42.1678351510437; 
 Thu, 09 Mar 2023 00:45:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/rYrNtLbS0wIR1Bw8vUQ9Ha4T7iPWPSVfV5P3t/1FPukwU396HXObXg8OD+6fRfSsQw8Dabg==
X-Received: by 2002:a05:6402:31fb:b0:4ac:c3c0:24d7 with SMTP id
 dy27-20020a05640231fb00b004acc3c024d7mr20984996edb.42.1678351510059; 
 Thu, 09 Mar 2023 00:45:10 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 ca5-20020a170906a3c500b008bc2c2134c5sm8548635ejb.216.2023.03.09.00.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:45:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 8/9] qcow2: mark various functions as coroutine_fn and
 GRAPH_RDLOCK
Date: Thu,  9 Mar 2023 09:44:55 +0100
Message-Id: <20230309084456.304669-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309084456.304669-1-pbonzini@redhat.com>
References: <20230309084456.304669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Functions that can do I/O (including calling bdrv_is_allocated
and bdrv_block_status functions) are prime candidates for being
coroutine_fns.  Make the change for those that are themselves called
only from coroutine_fns.  Also annotate that they are called with the
graph rdlock taken, thus allowing them to call bdrv_co_*() functions
for I/O.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qcow2-bitmap.c   |  2 +-
 block/qcow2-cluster.c  | 20 ++++++++++++--------
 block/qcow2-refcount.c |  8 ++++----
 block/qcow2-snapshot.c | 25 +++++++++++++------------
 block/qcow2.c          | 26 +++++++++++++-------------
 block/qcow2.h          | 15 ++++++++-------
 6 files changed, 51 insertions(+), 45 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 5f456a2785c6..a952fd58d85e 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1221,7 +1221,7 @@ out:
 }
 
 /* Checks to see if it's safe to resize bitmaps */
-int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp)
+int coroutine_fn qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index a9e6622fe300..92526dea504c 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1126,7 +1126,7 @@ err:
  * Frees the allocated clusters because the request failed and they won't
  * actually be linked.
  */
-void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
+void coroutine_fn qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s = bs->opaque;
     if (!has_data_file(bs) && !m->keep_old_clusters) {
@@ -1156,9 +1156,11 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
  *
  * Returns 0 on success, -errno on failure.
  */
-static int calculate_l2_meta(BlockDriverState *bs, uint64_t host_cluster_offset,
-                             uint64_t guest_offset, unsigned bytes,
-                             uint64_t *l2_slice, QCowL2Meta **m, bool keep_old)
+static int coroutine_fn calculate_l2_meta(BlockDriverState *bs,
+					  uint64_t host_cluster_offset,
+                                          uint64_t guest_offset, unsigned bytes,
+                                          uint64_t *l2_slice, QCowL2Meta **m,
+					  bool keep_old)
 {
     BDRVQcow2State *s = bs->opaque;
     int sc_index, l2_index = offset_to_l2_slice_index(s, guest_offset);
@@ -1599,8 +1601,10 @@ out:
  * function has been waiting for another request and the allocation must be
  * restarted, but the whole request should not be failed.
  */
-static int do_alloc_cluster_offset(BlockDriverState *bs, uint64_t guest_offset,
-                                   uint64_t *host_offset, uint64_t *nb_clusters)
+static int coroutine_fn do_alloc_cluster_offset(BlockDriverState *bs,
+						uint64_t guest_offset,
+                                                uint64_t *host_offset,
+						uint64_t *nb_clusters)
 {
     BDRVQcow2State *s = bs->opaque;
 
@@ -2065,8 +2069,8 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     return nb_clusters;
 }
 
-static int zero_l2_subclusters(BlockDriverState *bs, uint64_t offset,
-                               unsigned nb_subclusters)
+static int coroutine_fn zero_l2_subclusters(BlockDriverState *bs, uint64_t offset,
+                                            unsigned nb_subclusters)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t *l2_slice;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b092f89da98b..b2a81ff707ab 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1030,8 +1030,8 @@ int64_t qcow2_alloc_clusters(BlockDriverState *bs, uint64_t size)
     return offset;
 }
 
-int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
-                                int64_t nb_clusters)
+int64_t coroutine_fn qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
+                                             int64_t nb_clusters)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t cluster_index, refcount;
@@ -1069,7 +1069,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
 
 /* only used to allocate compressed sectors. We try to allocate
    contiguous sectors. size must be <= cluster_size */
-int64_t qcow2_alloc_bytes(BlockDriverState *bs, int size)
+int64_t coroutine_fn qcow2_alloc_bytes(BlockDriverState *bs, int size)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t offset;
@@ -3685,7 +3685,7 @@ out:
     return ret;
 }
 
-int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size)
+int64_t coroutine_fn qcow2_get_last_cluster(BlockDriverState *bs, int64_t size)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t i;
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 62e8a0335d44..90fac35920b6 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -77,10 +77,11 @@ void qcow2_free_snapshots(BlockDriverState *bs)
  *   qcow2_check_refcounts() does not do anything with snapshots'
  *   extra data.)
  */
-static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
-                                   int *nb_clusters_reduced,
-                                   int *extra_data_dropped,
-                                   Error **errp)
+static coroutine_fn GRAPH_RDLOCK
+int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
+                            int *nb_clusters_reduced,
+                            int *extra_data_dropped,
+                            Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowSnapshotHeader h;
@@ -108,7 +109,7 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
 
         /* Read statically sized part of the snapshot header */
         offset = ROUND_UP(offset, 8);
-        ret = bdrv_pread(bs->file, offset, sizeof(h), &h, 0);
+        ret = bdrv_co_pread(bs->file, offset, sizeof(h), &h, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -146,8 +147,8 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
         }
 
         /* Read known extra data */
-        ret = bdrv_pread(bs->file, offset,
-                         MIN(sizeof(extra), sn->extra_data_size), &extra, 0);
+        ret = bdrv_co_pread(bs->file, offset,
+                            MIN(sizeof(extra), sn->extra_data_size), &extra, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -184,8 +185,8 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
             /* Store unknown extra data */
             unknown_extra_data_size = sn->extra_data_size - sizeof(extra);
             sn->unknown_extra_data = g_malloc(unknown_extra_data_size);
-            ret = bdrv_pread(bs->file, offset, unknown_extra_data_size,
-                             sn->unknown_extra_data, 0);
+            ret = bdrv_co_pread(bs->file, offset, unknown_extra_data_size,
+                                sn->unknown_extra_data, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "Failed to read snapshot table");
@@ -196,7 +197,7 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
 
         /* Read snapshot ID */
         sn->id_str = g_malloc(id_str_size + 1);
-        ret = bdrv_pread(bs->file, offset, id_str_size, sn->id_str, 0);
+        ret = bdrv_co_pread(bs->file, offset, id_str_size, sn->id_str, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -206,7 +207,7 @@ static int qcow2_do_read_snapshots(BlockDriverState *bs, bool repair,
 
         /* Read snapshot name */
         sn->name = g_malloc(name_size + 1);
-        ret = bdrv_pread(bs->file, offset, name_size, sn->name, 0);
+        ret = bdrv_co_pread(bs->file, offset, name_size, sn->name, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "Failed to read snapshot table");
             goto fail;
@@ -261,7 +262,7 @@ fail:
     return ret;
 }
 
-int qcow2_read_snapshots(BlockDriverState *bs, Error **errp)
+int coroutine_fn GRAPH_RDLOCK qcow2_read_snapshots(BlockDriverState *bs, Error **errp)
 {
     return qcow2_do_read_snapshots(bs, false, NULL, NULL, errp);
 }
diff --git a/block/qcow2.c b/block/qcow2.c
index 30fd53fa64bc..258bf11394ab 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -199,10 +199,10 @@ qcow2_extract_crypto_opts(QemuOpts *opts, const char *fmt, Error **errp)
  * unknown magic is skipped (future extension this version knows nothing about)
  * return 0 upon success, non-0 otherwise
  */
-static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
-                                 uint64_t end_offset, void **p_feature_table,
-                                 int flags, bool *need_update_header,
-                                 Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
+                      uint64_t end_offset, void **p_feature_table,
+                      int flags, bool *need_update_header, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     QCowExtension ext;
@@ -228,7 +228,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         printf("attempting to read extended header in offset %lu\n", offset);
 #endif
 
-        ret = bdrv_pread(bs->file, offset, sizeof(ext), &ext, 0);
+        ret = bdrv_co_pread(bs->file, offset, sizeof(ext), &ext, 0);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "qcow2_read_extension: ERROR: "
                              "pread fail from offset %" PRIu64, offset);
@@ -256,7 +256,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                            sizeof(bs->backing_format));
                 return 2;
             }
-            ret = bdrv_pread(bs->file, offset, ext.len, bs->backing_format, 0);
+            ret = bdrv_co_pread(bs->file, offset, ext.len, bs->backing_format, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "ERROR: ext_backing_format: "
                                  "Could not read format name");
@@ -272,7 +272,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         case QCOW2_EXT_MAGIC_FEATURE_TABLE:
             if (p_feature_table != NULL) {
                 void *feature_table = g_malloc0(ext.len + 2 * sizeof(Qcow2Feature));
-                ret = bdrv_pread(bs->file, offset, ext.len, feature_table, 0);
+                ret = bdrv_co_pread(bs->file, offset, ext.len, feature_table, 0);
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: ext_feature_table: "
                                      "Could not read table");
@@ -298,7 +298,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 return -EINVAL;
             }
 
-            ret = bdrv_pread(bs->file, offset, ext.len, &s->crypto_header, 0);
+            ret = bdrv_co_pread(bs->file, offset, ext.len, &s->crypto_header, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "Unable to read CRYPTO header extension");
@@ -354,7 +354,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 break;
             }
 
-            ret = bdrv_pread(bs->file, offset, ext.len, &bitmaps_ext, 0);
+            ret = bdrv_co_pread(bs->file, offset, ext.len, &bitmaps_ext, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "bitmaps_ext: "
                                  "Could not read ext header");
@@ -418,7 +418,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
         case QCOW2_EXT_MAGIC_DATA_FILE:
         {
             s->image_data_file = g_malloc0(ext.len + 1);
-            ret = bdrv_pread(bs->file, offset, ext.len, s->image_data_file, 0);
+            ret = bdrv_co_pread(bs->file, offset, ext.len, s->image_data_file, 0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret,
                                  "ERROR: Could not read data file name");
@@ -442,7 +442,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 uext->len = ext.len;
                 QLIST_INSERT_HEAD(&s->unknown_header_ext, uext, next);
 
-                ret = bdrv_pread(bs->file, offset, uext->len, uext->data, 0);
+                ret = bdrv_co_pread(bs->file, offset, uext->len, uext->data, 0);
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: unknown extension: "
                                      "Could not read data");
@@ -1241,8 +1241,8 @@ static void qcow2_update_options_abort(BlockDriverState *bs,
     qapi_free_QCryptoBlockOpenOptions(r->crypto_opts);
 }
 
-static int qcow2_update_options(BlockDriverState *bs, QDict *options,
-                                int flags, Error **errp)
+static int coroutine_fn qcow2_update_options(BlockDriverState *bs, QDict *options,
+                                             int flags, Error **errp)
 {
     Qcow2ReopenState r = {};
     int ret;
diff --git a/block/qcow2.h b/block/qcow2.h
index c59e33c01cc9..c75decc38ad1 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -862,9 +862,9 @@ int64_t qcow2_refcount_area(BlockDriverState *bs, uint64_t offset,
                             uint64_t new_refblock_offset);
 
 int64_t qcow2_alloc_clusters(BlockDriverState *bs, uint64_t size);
-int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
-                                int64_t nb_clusters);
-int64_t qcow2_alloc_bytes(BlockDriverState *bs, int size);
+int64_t coroutine_fn qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
+                                             int64_t nb_clusters);
+int64_t coroutine_fn qcow2_alloc_bytes(BlockDriverState *bs, int size);
 void qcow2_free_clusters(BlockDriverState *bs,
                           int64_t offset, int64_t size,
                           enum qcow2_discard_type type);
@@ -894,7 +894,7 @@ int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 BlockDriverAmendStatusCB *status_cb,
                                 void *cb_opaque, Error **errp);
 int coroutine_fn GRAPH_RDLOCK qcow2_shrink_reftable(BlockDriverState *bs);
-int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
+int64_t coroutine_fn qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
@@ -924,7 +924,7 @@ void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
 int coroutine_fn GRAPH_RDLOCK
 qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 
-void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
+void coroutine_fn qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
                           bool full_discard);
@@ -951,7 +951,8 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
                             Error **errp);
 
 void qcow2_free_snapshots(BlockDriverState *bs);
-int qcow2_read_snapshots(BlockDriverState *bs, Error **errp);
+int coroutine_fn GRAPH_RDLOCK
+qcow2_read_snapshots(BlockDriverState *bs, Error **errp);
 int qcow2_write_snapshots(BlockDriverState *bs);
 
 int coroutine_fn GRAPH_RDLOCK
@@ -994,7 +995,7 @@ bool coroutine_fn qcow2_load_dirty_bitmaps(BlockDriverState *bs,
 bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
-int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
+int coroutine_fn qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
 bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
-- 
2.39.2


