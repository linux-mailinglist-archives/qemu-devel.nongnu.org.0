Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969023A1C7C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:05:43 +0200 (CEST)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2aE-0004Gl-Km
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr2WP-0006X6-Rw
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr2WM-0005aw-Qh
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623261701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29C1FG2Mg93TAb+S9rBsmrYiZxvVYojD0nlfhapD/5U=;
 b=FXlKUrOVXOJu3jPJhKF8HoosnGWBr6ro7Cxz8w2qY1SNvJJNgyERg028uJXJ3VevwY0eRz
 Vv0EXGBsssOswCgXlekymRjeQLiw0LwJyQOigg57MRv+Jj/r6UvTvd+bQBSFM2U8sxDIwK
 NSWVeCXV18Lk63DB5ejByrk5/lt13kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-NpAFGgnLO0CSs3zI7raitQ-1; Wed, 09 Jun 2021 14:01:38 -0400
X-MC-Unique: NpAFGgnLO0CSs3zI7raitQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9DE101C8B9;
 Wed,  9 Jun 2021 18:01:26 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C3C610B0;
 Wed,  9 Jun 2021 18:01:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
Date: Wed,  9 Jun 2021 13:01:18 -0500
Message-Id: <20210609180118.1003774-3-eblake@redhat.com>
In-Reply-To: <20210609180118.1003774-1-eblake@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, nsoffer@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When trying to reconstruct a qcow2 chain using information provided
over NBD, ovirt had been relying on an unsafe assumption that any
portion of the qcow2 file advertised as sparse would defer to the
backing image; this worked with what qemu 5.2 reports for a qcow2 BSD
loaded with "backing":null.  However, in 6.0, commit 0da9856851 (nbd:
server: Report holes for raw images) also had a side-effect of
reporting unallocated zero clusters in qcow2 files as sparse.  This
change is correct from the NBD spec perspective (advertising bits has
always been optional based on how much information the server has
available, and should only be used to optimize behavior when a bit is
set, while not assuming semantics merely because a bit is clear), but
means that a qcow2 file that uses an unallocated zero cluster to
override a backing file now shows up as sparse over NBD, and causes
ovirt to fail to reproduce that cluster (ie. ovirt was assuming it
only had to write clusters where the bit was clear, and the 6.0
behavior change shows the flaw in that assumption).

The correct fix is for ovirt to additionally use the
qemu:allocation-depth metadata context added in 5.2: after all, the
actual determination for what is needed to recreate a qcow2 file is
not whether a cluster is sparse, but whether the allocation-depth
shows the cluster to be local.  But reproducing an image is more
efficient when handling known-zero clusters, which means that ovirt
has to track both base:allocation and qemu:allocation-depth metadata
contexts simultaneously.  While NBD_CMD_BLOCK_STATUS is just fine
sending back information for two contexts in parallel, it comes with
some bookkeeping overhead at the client side: the two contexts need
not report the same length of replies, and it involves more network
traffic.

So, as a convenience, we can provide yet another metadata context,
"qemu:joint-allocation", which provides the bulk of the same
information already available from using "base:allocation" and
"qemu:allocation-depth" in parallel; the only difference is that an
allocation depth larger than one is collapsed to a single bit, rather
than remaining an integer representing actual depth.  By connecting to
just this context, a client has less work to perform while still
getting at all pieces of information needed to recreate a qcow2
backing chain.

With regards to exposing this new feature from qemu as NBD server, it
is sufficient to reuse the existing 'qemu-nbd -A': since that already
exposes allocation depth, it does not hurt to advertise two separate
qemu:XXX metadata contexts at once for two different views of
allocation depth.  And just because the server supports multiple
contexts does not mean a client will want or need to connect to
everything available.  On the other hand, the existing hack of using
the qemu NBD client option of x-dirty-bitmap to select an alternative
context from the client does NOT make it possible to read the extra
information exposed by the new metadata context.  For now, you MUST
use something like libnbd's 'nbdinfo --map=qemu:joint-allocation' in
order to properly see all four bits in action:

    # Create a qcow2 image with a raw backing file:
    $ qemu-img create base.raw $((4*64*1024))
    $ qemu-img create -f qcow2 -b base.raw -F raw top.qcow2

    # Write to first 3 clusters of base:
    $ qemu-io -f raw -c "w -P 65 0 64k" -c "w -P 66 64k 64k" \
      -c "w -P 67 128k 64k" base.raw

    # Write to second and third clusters of top, hiding base:
    $ qemu-io -f qcow2 -c "w -P 69 64k 64k" -c "w -z 128k 64k" top.qcow2

    # Expose top.qcow2 without backing file over NBD
    $ ./qemu-nbd -r -t -f qcow2 -A 'json:{"driver":"qcow2", "backing":null, \
      "file":{"driver":"file", "filename":"top.qcow2"}}'
    $ nbdinfo --map=qemu:joint-allocation nbd://localhost
         0       65536    3
     65536       65536    4
    131072       65536    7
    196608       65536    3

[This was output from nbdinfo 1.8.0; a later version will also add a
column to decode the bits into human-readable strings]

Additionally, later qemu patches may try to improve qemu-img to
automatically take advantage of additional NBD context information,
without having to use x-dirty-bitmap.

Reported-by: Nir Soffer <nsoffer@redhat.com>
Resolves: https://bugzilla.redhat.com/1968693
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/interop/nbd.txt                          | 31 ++++++-
 docs/tools/qemu-nbd.rst                       |  4 +-
 qapi/block-export.json                        |  4 +-
 include/block/nbd.h                           | 10 ++-
 nbd/server.c                                  | 87 +++++++++++++++++--
 .../tests/nbd-qemu-allocation.out             |  3 +-
 6 files changed, 125 insertions(+), 14 deletions(-)

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index 10ce098a29bf..cc8ce2d5389f 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -17,7 +17,7 @@ namespace "qemu".

 == "qemu" namespace ==

-The "qemu" namespace currently contains two available metadata context
+The "qemu" namespace currently contains three available metadata context
 types.  The first is related to exposing the contents of a dirty
 bitmap alongside the associated disk contents.  That metadata context
 is named with the following form:
@@ -39,8 +39,32 @@ depth of which layer in a thin-provisioned backing chain provided the
 data (0 for unallocated, 1 for the active layer, 2 for the first
 backing layer, and so forth).

-For NBD_OPT_LIST_META_CONTEXT the following queries are supported
-in addition to the specific "qemu:allocation-depth" and
+The third is for convenience in querying the results of
+base:allocation and qemu:allocation-depth in one go, under the
+metadata context named
+
+    qemu:joint-allocation
+
+In this context, bits 0 and 1 reflect the same information as
+base:allocation, and bits 2 and 3 provide a summary of
+qemu:allocation-depth (although this context is not able to convey
+how deep in the backing chain data comes from).
+
+    bit 0: NBD_STATE_HOLE, set when the extent is sparse
+    bit 1: NBD_STATE_ZERO, set when the extent reads as zero
+    bit 2: NBD_STATE_LOCAL, set when the extent contents come from the
+           local layer
+    bit 3: NBD_STATE_BACKING, set when the extent contents come from a
+           backing layer of unspecified depth
+
+This context does not provide any unique information, but does make it
+easier to reconstruct backing chains without having to piece together
+what might other be disparate-length returns of two separate metadata
+contexts.
+
+For NBD_OPT_LIST_META_CONTEXT the following queries are supported in
+addition to the specific "qemu:allocation-depth",
+"qemu:joint-allocation", and
 "qemu:dirty-bitmap:<dirty-bitmap-export-name>":

 * "qemu:" - returns list of all available metadata contexts in the
@@ -68,3 +92,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
+* 6.1: NBD_CMD_BLOCK_STATUS for "qemu:joint-allocation"
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index ee862fa0bc02..975ef5cedd14 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -75,8 +75,8 @@ driver options if ``--image-opts`` is specified.
 .. option:: -A, --allocation-depth

   Expose allocation depth information via the
-  ``qemu:allocation-depth`` metadata context accessible through
-  NBD_OPT_SET_META_CONTEXT.
+  ``qemu:allocation-depth`` and ``qemu:joint-allocation`` metadata
+  contexts accessible through NBD_OPT_SET_META_CONTEXT.

 .. option:: -B, --bitmap=NAME

diff --git a/qapi/block-export.json b/qapi/block-export.json
index e819e70cac0d..1bd315b7958d 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -92,8 +92,8 @@
 #
 # @allocation-depth: Also export the allocation depth map for @device, so
 #                    the NBD client can use NBD_OPT_SET_META_CONTEXT with
-#                    the metadata context name "qemu:allocation-depth" to
-#                    inspect allocation details. (since 5.2)
+#                    the metadata context name "qemu:allocation-depth" or
+#                    "qemu:joint-allocation" to inspect allocation details.
 #
 # Since: 5.2
 ##
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f34d23bb037..7f411dc59e57 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2020 Red Hat, Inc.
+ *  Copyright (C) 2016-2021 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device
@@ -261,6 +261,14 @@ enum {

 /* No flags needed for qemu:allocation-depth in NBD_REPLY_TYPE_BLOCK_STATUS */

+/*
+ * Extent flags for qemu:joint-allocation in NBD_REPLY_TYPE_BLOCK_STATUS,
+ * reusing the two flags already in base:allocation, and compressing the
+ * results of qemu:allocation-depth into two bits
+ */
+#define NBD_STATE_LOCAL    (1 << 2)
+#define NBD_STATE_BACKING  (1 << 3)
+
 static inline bool nbd_reply_type_is_error(int type)
 {
     return type & (1 << 15);
diff --git a/nbd/server.c b/nbd/server.c
index b60ebc3ab6ac..8b825ccaf2ac 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -28,8 +28,9 @@

 #define NBD_META_ID_BASE_ALLOCATION 0
 #define NBD_META_ID_ALLOCATION_DEPTH 1
+#define NBD_META_ID_JOINT_ALLOCATION 2
 /* Dirty bitmaps use 'NBD_META_ID_DIRTY_BITMAP + i', so keep this id last. */
-#define NBD_META_ID_DIRTY_BITMAP 2
+#define NBD_META_ID_DIRTY_BITMAP 3

 /*
  * NBD_MAX_BLOCK_STATUS_EXTENTS: 1 MiB of extents data. An empirical
@@ -97,6 +98,7 @@ struct NBDExport {
     Notifier eject_notifier;

     bool allocation_depth;
+    bool joint_allocation;
     BdrvDirtyBitmap **export_bitmaps;
     size_t nr_export_bitmaps;
 };
@@ -111,6 +113,7 @@ typedef struct NBDExportMetaContexts {
     size_t count; /* number of negotiated contexts */
     bool base_allocation; /* export base:allocation context (block status) */
     bool allocation_depth; /* export qemu:allocation-depth */
+    bool joint_allocation; /* export qemu:joint-allocation */
     bool *bitmaps; /*
                     * export qemu:dirty-bitmap:<export bitmap name>,
                     * sized by exp->nr_export_bitmaps
@@ -862,9 +865,9 @@ static bool nbd_meta_base_query(NBDClient *client, NBDExportMetaContexts *meta,

 /* nbd_meta_qemu_query
  *
- * Handle queries to 'qemu' namespace. For now, only the qemu:dirty-bitmap:
- * and qemu:allocation-depth contexts are available.  Return true if @query
- * has been handled.
+ * Handle queries to 'qemu' namespace. For now, only the qemu:dirty-bitmap:,
+ * qemu:joint-allocation, and qemu:allocation-depth contexts are available.
+ * Return true if @query has been handled.
  */
 static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
                                 const char *query)
@@ -891,6 +894,12 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
         return true;
     }

+    if (strcmp(query, "joint-allocation") == 0) {
+        trace_nbd_negotiate_meta_query_parse("joint-allocation");
+        meta->joint_allocation = meta->exp->joint_allocation;
+        return true;
+    }
+
     if (nbd_strshift(&query, "dirty-bitmap:")) {
         trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
         if (!*query) {
@@ -1023,6 +1032,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         /* enable all known contexts */
         meta->base_allocation = true;
         meta->allocation_depth = meta->exp->allocation_depth;
+        meta->joint_allocation = meta->exp->joint_allocation;
         memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
     } else {
         for (i = 0; i < nb_queries; ++i) {
@@ -1053,6 +1063,16 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         count++;
     }

+    if (meta->joint_allocation) {
+        ret = nbd_negotiate_send_meta_context(client, "qemu:joint-allocation",
+                                              NBD_META_ID_JOINT_ALLOCATION,
+                                              errp);
+        if (ret < 0) {
+            return ret;
+        }
+        count++;
+    }
+
     for (i = 0; i < meta->exp->nr_export_bitmaps; i++) {
         const char *bm_name;
         g_autofree char *context = NULL;
@@ -1743,7 +1763,8 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         bdrv_dirty_bitmap_set_busy(exp->export_bitmaps[i], true);
     }

-    exp->allocation_depth = arg->allocation_depth;
+    /* QMP allocation_depth flag controls export of both metadata contexts. */
+    exp->allocation_depth = exp->joint_allocation = arg->allocation_depth;

     /*
      * We need to inhibit request queuing in the block layer to ensure we can
@@ -2164,6 +2185,47 @@ static int blockalloc_to_extents(BlockDriverState *bs, uint64_t offset,
     return 0;
 }

+static int blockjoint_to_extents(BlockDriverState *bs, uint64_t offset,
+                                 uint64_t bytes, NBDExtentArray *ea)
+{
+    while (bytes) {
+        uint32_t flags = 0;
+        int64_t num, num1, num2;
+        int ret1 = bdrv_block_status_above(bs, NULL, offset, bytes, &num1,
+                                           NULL, NULL);
+        int ret2 = bdrv_is_allocated_above(bs, NULL, false, offset, bytes,
+                                           &num2);
+
+        if (ret1 < 0) {
+            return ret1;
+        }
+        if (ret2 < 0) {
+            return ret2;
+        }
+        num = MIN(num1, num2);
+
+        if (!(ret1 & BDRV_BLOCK_DATA)) {
+            flags |= NBD_STATE_HOLE;
+        }
+        if (ret1 & BDRV_BLOCK_ZERO) {
+            flags |= NBD_STATE_ZERO;
+        }
+        if (ret2 == 1) {
+            flags |= NBD_STATE_LOCAL;
+        } else if (ret2 > 1) {
+            flags |= NBD_STATE_BACKING;
+        }
+        if (nbd_extent_array_add(ea, num, flags) < 0) {
+            return 0;
+        }
+
+        offset += num;
+        bytes -= num;
+    }
+
+    return 0;
+}
+
 /*
  * nbd_co_send_extents
  *
@@ -2205,6 +2267,8 @@ static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,

     if (context_id == NBD_META_ID_BASE_ALLOCATION) {
         ret = blockstatus_to_extents(bs, offset, length, ea);
+    } else if (context_id == NBD_META_ID_JOINT_ALLOCATION) {
+        ret = blockjoint_to_extents(bs, offset, length, ea);
     } else {
         ret = blockalloc_to_extents(bs, offset, length, ea);
     }
@@ -2574,6 +2638,19 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                 }
             }

+            if (client->export_meta.joint_allocation) {
+                ret = nbd_co_send_block_status(client, request->handle,
+                                               blk_bs(exp->common.blk),
+                                               request->from, request->len,
+                                               dont_fragment,
+                                               !--contexts_remaining,
+                                               NBD_META_ID_JOINT_ALLOCATION,
+                                               errp);
+                if (ret < 0) {
+                    return ret;
+                }
+            }
+
             for (i = 0; i < client->exp->nr_export_bitmaps; i++) {
                 if (!client->export_meta.bitmaps[i]) {
                     continue;
diff --git a/tests/qemu-iotests/tests/nbd-qemu-allocation.out b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
index c51022b2a38d..b9e469efc58e 100644
--- a/tests/qemu-iotests/tests/nbd-qemu-allocation.out
+++ b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
@@ -21,9 +21,10 @@ exports available: 1
   min block: 1
   opt block: 4096
   max block: 33554432
-  available meta contexts: 2
+  available meta contexts: 3
    base:allocation
    qemu:allocation-depth
+   qemu:joint-allocation
 [{ "start": 0, "length": 3145728, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 3145728, "length": 1048576, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 [{ "start": 0, "length": 1048576, "depth": 0, "zero": true, "data": true, "offset": OFFSET},
-- 
2.31.1


