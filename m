Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D371304027
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:23:54 +0100 (CET)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PG5-0002DA-Dp
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDV-0008MZ-8n
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDN-00065u-Ml
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crr3zMwPgSwv55694tC4yIDkG8VCuusJQce3gpYXzy0=;
 b=XorsjLfzpk5wgn8Ld6P0g4hG1j9Jl1qJlPwFpj4kywPmOMCeVQCKjUaCcYCIdUSEQeTLy5
 UEdQPZBIoYvlw2PzBJVEFV48y7eXOM+aKZhMiQCiUB2nI8DK/OZpsDoRuehEkki7qCzrKf
 O6OqB+ro6y8jcSR9BCmEMn8LSKpSWrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-cDcyV4VaOlWEwN1GSIv4NQ-1; Tue, 26 Jan 2021 09:21:02 -0500
X-MC-Unique: cDcyV4VaOlWEwN1GSIv4NQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE55425EF;
 Tue, 26 Jan 2021 14:20:43 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A1B60C47;
 Tue, 26 Jan 2021 14:20:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/53] qapi: block-stream: add "bottom" argument
Date: Tue, 26 Jan 2021 15:19:34 +0100
Message-Id: <20210126142016.806073-12-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The code already don't freeze base node and we try to make it prepared
for the situation when base node is changed during the operation. In
other words, block-stream doesn't own base node.

Let's introduce a new interface which should replace the current one,
which will in better relations with the code. Specifying bottom node
instead of base, and requiring it to be non-filter gives us the
following benefits:

 - drop difference between above_base and base_overlay, which will be
   renamed to just bottom, when old interface dropped

 - clean way to work with parallel streams/commits on the same backing
   chain, which otherwise become a problem when we introduce a filter
   for stream job

 - cleaner interface. Nobody will surprised the fact that base node may
   disappear during block-stream, when there is no word about "base" in
   the interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201216061703.70908-11-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json           | 12 ++++---
 include/block/block_int.h      |  1 +
 block/monitor/block-hmp-cmds.c |  3 +-
 block/stream.c                 | 50 +++++++++++++++++++---------
 blockdev.c                     | 59 ++++++++++++++++++++++++++++------
 5 files changed, 94 insertions(+), 31 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 65167ebf56..1d9dcd7d30 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2517,10 +2517,14 @@
 # @device: the device or node name of the top image
 #
 # @base: the common backing file name.
-#        It cannot be set if @base-node is also set.
+#        It cannot be set if @base-node or @bottom is also set.
 #
 # @base-node: the node name of the backing file.
-#             It cannot be set if @base is also set. (Since 2.8)
+#             It cannot be set if @base or @bottom is also set. (Since 2.8)
+#
+# @bottom: the last node in the chain that should be streamed into
+#          top. It cannot be set if @base or @base-node is also set.
+#          It cannot be filter node. (Since 6.0)
 #
 # @backing-file: The backing file string to write into the top
 #                image. This filename is not validated.
@@ -2576,8 +2580,8 @@
 ##
 { 'command': 'block-stream',
   'data': { '*job-id': 'str', 'device': 'str', '*base': 'str',
-            '*base-node': 'str', '*backing-file': 'str', '*speed': 'int',
-            '*on-error': 'BlockdevOnError',
+            '*base-node': 'str', '*backing-file': 'str', '*bottom': 'str',
+            '*speed': 'int', '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 92d3754ead..f4b844f310 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1161,6 +1161,7 @@ int is_windows_drive(const char *filename);
  */
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
+                  BlockDriverState *bottom,
                   int creation_flags, int64_t speed,
                   BlockdevOnError on_error,
                   const char *filter_node_name,
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index e8a58f326e..afd75ab628 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -507,7 +507,8 @@ void hmp_block_stream(Monitor *mon, const QDict *qdict)
     int64_t speed = qdict_get_try_int(qdict, "speed", 0);
 
     qmp_block_stream(true, device, device, base != NULL, base, false, NULL,
-                     false, NULL, qdict_haskey(qdict, "speed"), speed, true,
+                     false, NULL, false, NULL,
+                     qdict_haskey(qdict, "speed"), speed, true,
                      BLOCKDEV_ON_ERROR_REPORT, false, NULL, false, false, false,
                      false, &error);
 
diff --git a/block/stream.c b/block/stream.c
index 6a525a5edf..045d6bc76b 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -221,6 +221,7 @@ static const BlockJobDriver stream_job_driver = {
 
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
+                  BlockDriverState *bottom,
                   int creation_flags, int64_t speed,
                   BlockdevOnError on_error,
                   const char *filter_node_name,
@@ -230,25 +231,42 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     BlockDriverState *iter;
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
-    BlockDriverState *base_overlay = bdrv_find_overlay(bs, base);
+    BlockDriverState *base_overlay;
     BlockDriverState *above_base;
 
-    if (!base_overlay) {
-        error_setg(errp, "'%s' is not in the backing chain of '%s'",
-                   base->node_name, bs->node_name);
-        return;
-    }
+    assert(!(base && bottom));
+    assert(!(backing_file_str && bottom));
+
+    if (bottom) {
+        /*
+         * New simple interface. The code is written in terms of old interface
+         * with @base parameter (still, it doesn't freeze link to base, so in
+         * this mean old code is correct for new interface). So, for now, just
+         * emulate base_overlay and above_base. Still, when old interface
+         * finally removed, we should refactor code to use only "bottom", but
+         * not "*base*" things.
+         */
+        assert(!bottom->drv->is_filter);
+        base_overlay = above_base = bottom;
+    } else {
+        base_overlay = bdrv_find_overlay(bs, base);
+        if (!base_overlay) {
+            error_setg(errp, "'%s' is not in the backing chain of '%s'",
+                       base->node_name, bs->node_name);
+            return;
+        }
 
-    /*
-     * Find the node directly above @base.  @base_overlay is a COW overlay, so
-     * it must have a bdrv_cow_child(), but it is the immediate overlay of
-     * @base, so between the two there can only be filters.
-     */
-    above_base = base_overlay;
-    if (bdrv_cow_bs(above_base) != base) {
-        above_base = bdrv_cow_bs(above_base);
-        while (bdrv_filter_bs(above_base) != base) {
-            above_base = bdrv_filter_bs(above_base);
+        /*
+         * Find the node directly above @base.  @base_overlay is a COW overlay,
+         * so it must have a bdrv_cow_child(), but it is the immediate overlay
+         * of @base, so between the two there can only be filters.
+         */
+        above_base = base_overlay;
+        if (bdrv_cow_bs(above_base) != base) {
+            above_base = bdrv_cow_bs(above_base);
+            while (bdrv_filter_bs(above_base) != base) {
+                above_base = bdrv_filter_bs(above_base);
+            }
         }
     }
 
diff --git a/blockdev.c b/blockdev.c
index 8c03de582c..0540c621da 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2500,6 +2500,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_base, const char *base,
                       bool has_base_node, const char *base_node,
                       bool has_backing_file, const char *backing_file,
+                      bool has_bottom, const char *bottom,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
                       bool has_filter_node_name, const char *filter_node_name,
@@ -2507,12 +2508,31 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
 {
-    BlockDriverState *bs, *iter;
+    BlockDriverState *bs, *iter, *iter_end;
     BlockDriverState *base_bs = NULL;
+    BlockDriverState *bottom_bs = NULL;
     AioContext *aio_context;
     Error *local_err = NULL;
     int job_flags = JOB_DEFAULT;
 
+    if (has_base && has_base_node) {
+        error_setg(errp, "'base' and 'base-node' cannot be specified "
+                   "at the same time");
+        return;
+    }
+
+    if (has_base && has_bottom) {
+        error_setg(errp, "'base' and 'bottom' cannot be specified "
+                   "at the same time");
+        return;
+    }
+
+    if (has_bottom && has_base_node) {
+        error_setg(errp, "'bottom' and 'base-node' cannot be specified "
+                   "at the same time");
+        return;
+    }
+
     if (!has_on_error) {
         on_error = BLOCKDEV_ON_ERROR_REPORT;
     }
@@ -2525,12 +2545,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
 
-    if (has_base && has_base_node) {
-        error_setg(errp, "'base' and 'base-node' cannot be specified "
-                   "at the same time");
-        goto out;
-    }
-
     if (has_base) {
         base_bs = bdrv_find_backing_image(bs, base);
         if (base_bs == NULL) {
@@ -2554,8 +2568,33 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         bdrv_refresh_filename(base_bs);
     }
 
-    /* Check for op blockers in the whole chain between bs and base */
-    for (iter = bs; iter && iter != base_bs;
+    if (has_bottom) {
+        bottom_bs = bdrv_lookup_bs(NULL, bottom, errp);
+        if (!bottom_bs) {
+            goto out;
+        }
+        if (!bottom_bs->drv) {
+            error_setg(errp, "Node '%s' is not open", bottom);
+            goto out;
+        }
+        if (bottom_bs->drv->is_filter) {
+            error_setg(errp, "Node '%s' is a filter, use a non-filter node "
+                       "as 'bottom'", bottom);
+            goto out;
+        }
+        if (!bdrv_chain_contains(bs, bottom_bs)) {
+            error_setg(errp, "Node '%s' is not in a chain starting from '%s'",
+                       bottom, device);
+            goto out;
+        }
+        assert(bdrv_get_aio_context(bottom_bs) == aio_context);
+    }
+
+    /*
+     * Check for op blockers in the whole chain between bs and base (or bottom)
+     */
+    iter_end = has_bottom ? bdrv_filter_or_cow_bs(bottom_bs) : base_bs;
+    for (iter = bs; iter && iter != iter_end;
          iter = bdrv_filter_or_cow_bs(iter))
     {
         if (bdrv_op_is_blocked(iter, BLOCK_OP_TYPE_STREAM, errp)) {
@@ -2579,7 +2618,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     }
 
     stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
-                 job_flags, has_speed ? speed : 0, on_error,
+                 bottom_bs, job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.29.2


