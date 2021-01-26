Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3E304048
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:28:55 +0100 (CET)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PKw-0000hH-B5
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDM-0008HX-Vh
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDI-00060W-6H
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBEBtLeHp83kk5gB0lxbmwWRQcdOD4CCjamab2MELmM=;
 b=CySIzoi8+WYh7zPT9QNkgpFNOo97UNVwv+/cSdol6fPqwwUg1VcTjlHB129ht+COTeA8Y9
 ziy+NcRq0QS0K784NvwpFwRgPSUD8oMcjzADQDahk7fVOM7V5BZLLhmm6hHJLuJrg1pqju
 9urZp8Bw2e87b/ZgD5Ng9b14aXZe2a0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-cN7VqF4hMfOsgHxsjxY15A-1; Tue, 26 Jan 2021 09:20:52 -0500
X-MC-Unique: cN7VqF4hMfOsgHxsjxY15A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2521016D1F;
 Tue, 26 Jan 2021 14:20:32 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21DC660C47;
 Tue, 26 Jan 2021 14:20:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/53] qapi: copy-on-read filter: add 'bottom' option
Date: Tue, 26 Jan 2021 15:19:29 +0100
Message-Id: <20210126142016.806073-7-mreitz@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add an option to limit copy-on-read operations to specified sub-chain
of backing-chain, to make copy-on-read filter useful for block-stream
job.

Suggested-by: Max Reitz <mreitz@redhat.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: change subject, modified to freeze the chain,
   do some fixes]
Message-Id: <20201216061703.70908-6-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 20 ++++++++-
 block/copy-on-read.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index b55732d802..65167ebf56 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3959,6 +3959,24 @@
   'data': { 'throttle-group': 'str',
             'file' : 'BlockdevRef'
              } }
+
+##
+# @BlockdevOptionsCor:
+#
+# Driver specific block device options for the copy-on-read driver.
+#
+# @bottom: The name of a non-filter node (allocation-bearing layer) that
+#          limits the COR operations in the backing chain (inclusive), so
+#          that no data below this node will be copied by this filter.
+#          If option is absent, the limit is not applied, so that data
+#          from all backing layers may be copied.
+#
+# Since: 6.0
+##
+{ 'struct': 'BlockdevOptionsCor',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { '*bottom': 'str' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -4011,7 +4029,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
-      'copy-on-read':'BlockdevOptionsGenericFormat',
+      'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
       'ftp':        'BlockdevOptionsCurlFtp',
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 618c4c4f43..71560984f6 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -24,18 +24,24 @@
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "block/copy-on-read.h"
 
 
 typedef struct BDRVStateCOR {
     bool active;
+    BlockDriverState *bottom_bs;
+    bool chain_frozen;
 } BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BlockDriverState *bottom_bs = NULL;
     BDRVStateCOR *state = bs->opaque;
+    /* Find a bottom node name, if any */
+    const char *bottom_node = qdict_get_try_str(options, "bottom");
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -51,7 +57,38 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    if (bottom_node) {
+        bottom_bs = bdrv_find_node(bottom_node);
+        if (!bottom_bs) {
+            error_setg(errp, "Bottom node '%s' not found", bottom_node);
+            qdict_del(options, "bottom");
+            return -EINVAL;
+        }
+        qdict_del(options, "bottom");
+
+        if (!bottom_bs->drv) {
+            error_setg(errp, "Bottom node '%s' not opened", bottom_node);
+            return -EINVAL;
+        }
+
+        if (bottom_bs->drv->is_filter) {
+            error_setg(errp, "Bottom node '%s' is a filter", bottom_node);
+            return -EINVAL;
+        }
+
+        if (bdrv_freeze_backing_chain(bs, bottom_bs, errp) < 0) {
+            return -EINVAL;
+        }
+        state->chain_frozen = true;
+
+        /*
+         * We do freeze the chain, so it shouldn't be removed. Still, storing a
+         * pointer worth bdrv_ref().
+         */
+        bdrv_ref(bottom_bs);
+    }
     state->active = true;
+    state->bottom_bs = bottom_bs;
 
     /*
      * We don't need to call bdrv_child_refresh_perms() now as the permissions
@@ -107,8 +144,46 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
                                            size_t qiov_offset,
                                            int flags)
 {
-    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
-                               flags | BDRV_REQ_COPY_ON_READ);
+    int64_t n;
+    int local_flags;
+    int ret;
+    BDRVStateCOR *state = bs->opaque;
+
+    if (!state->bottom_bs) {
+        return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                   flags | BDRV_REQ_COPY_ON_READ);
+    }
+
+    while (bytes) {
+        local_flags = flags;
+
+        /* In case of failure, try to copy-on-read anyway */
+        ret = bdrv_is_allocated(bs->file->bs, offset, bytes, &n);
+        if (ret <= 0) {
+            ret = bdrv_is_allocated_above(bdrv_backing_chain_next(bs->file->bs),
+                                          state->bottom_bs, true, offset,
+                                          n, &n);
+            if (ret > 0 || ret < 0) {
+                local_flags |= BDRV_REQ_COPY_ON_READ;
+            }
+            /* Finish earlier if the end of a backing file has been reached */
+            if (n == 0) {
+                break;
+            }
+        }
+
+        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                  local_flags);
+        if (ret < 0) {
+            return ret;
+        }
+
+        offset += n;
+        qiov_offset += n;
+        bytes -= n;
+    }
+
+    return 0;
 }
 
 
@@ -160,11 +235,25 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 }
 
 
+static void cor_close(BlockDriverState *bs)
+{
+    BDRVStateCOR *s = bs->opaque;
+
+    if (s->chain_frozen) {
+        s->chain_frozen = false;
+        bdrv_unfreeze_backing_chain(bs, s->bottom_bs);
+    }
+
+    bdrv_unref(s->bottom_bs);
+}
+
+
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
     .instance_size                      = sizeof(BDRVStateCOR),
 
     .bdrv_open                          = cor_open,
+    .bdrv_close                         = cor_close,
     .bdrv_child_perm                    = cor_child_perm,
 
     .bdrv_getlength                     = cor_getlength,
@@ -201,6 +290,11 @@ void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
     bdrv_drained_begin(bs);
     /* Drop permissions before the graph change. */
     s->active = false;
+    /* unfreeze, as otherwise bdrv_replace_node() will fail */
+    if (s->chain_frozen) {
+        s->chain_frozen = false;
+        bdrv_unfreeze_backing_chain(cor_filter_bs, s->bottom_bs);
+    }
     bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
     bdrv_replace_node(cor_filter_bs, bs, &error_abort);
 
-- 
2.29.2


