Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1E2CC545
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:35:36 +0100 (CET)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWyV-0006oA-NB
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuH-0001cs-Mu; Wed, 02 Dec 2020 13:31:13 -0500
Received: from relay.sw.ru ([185.231.240.75]:49918 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuB-0000zz-52; Wed, 02 Dec 2020 13:31:13 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWtu-00BTPZ-Ct; Wed, 02 Dec 2020 21:30:50 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v13 05/10] qapi: create BlockdevOptionsCor structure for COR
 driver
Date: Wed,  2 Dec 2020 21:30:56 +0300
Message-Id: <1606933861-297777-6-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

Create the BlockdevOptionsCor structure for COR driver specific options
splitting it off form the BlockdevOptionsGenericFormat. The only option
'bottom' node in the structure denotes an image file that limits the
COR operations in the backing chain.
We are going to use the COR-filter for a block-stream job and will pass
a bottom node name to the COR driver. The bottom node is the first
non-filter overlay of the base. It was introduced because the base node
itself may change due to possible concurrent jobs.

Suggested-by: Max Reitz <mreitz@redhat.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 qapi/block-core.json | 21 ++++++++++++++++++-
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 618c4c4..2cddc96 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -24,18 +24,23 @@
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "block/copy-on-read.h"
 
 
 typedef struct BDRVStateCOR {
     bool active;
+    BlockDriverState *bottom_bs;
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
@@ -51,7 +56,17 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    if (bottom_node) {
+        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
+        if (!bottom_bs) {
+            error_setg(errp, "Bottom node '%s' not found", bottom_node);
+            qdict_del(options, "bottom");
+            return -EINVAL;
+        }
+        qdict_del(options, "bottom");
+    }
     state->active = true;
+    state->bottom_bs = bottom_bs;
 
     /*
      * We don't need to call bdrv_child_refresh_perms() now as the permissions
@@ -107,8 +122,46 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
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
+            if (ret == 1 || ret < 0) {
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
 
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 8ef3df6..04055ef 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3942,6 +3942,25 @@
   'data': { 'throttle-group': 'str',
             'file' : 'BlockdevRef'
              } }
+
+##
+# @BlockdevOptionsCor:
+#
+# Driver specific block device options for the copy-on-read driver.
+#
+# @bottom: the name of a non-filter node (allocation-bearing layer) that limits
+#          the COR operations in the backing chain (inclusive).
+#          For the block-stream job, it will be the first non-filter overlay of
+#          the base node. We do not involve the base node into the COR
+#          operations because the base may change due to a concurrent
+#          block-commit job on the same backing chain.
+#
+# Since: 5.2
+##
+{ 'struct': 'BlockdevOptionsCor',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { '*bottom': 'str' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -3994,7 +4013,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
-      'copy-on-read':'BlockdevOptionsGenericFormat',
+      'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
       'ftp':        'BlockdevOptionsCurlFtp',
-- 
1.8.3.1


