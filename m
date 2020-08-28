Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD8255F39
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 18:55:44 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBhfD-0004az-4h
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 12:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kBhdo-0002Kt-Kp; Fri, 28 Aug 2020 12:54:16 -0400
Received: from relay.sw.ru ([185.231.240.75]:37742 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kBhdm-0001OR-NZ; Fri, 28 Aug 2020 12:54:16 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kBhdH-001XPR-RR; Fri, 28 Aug 2020 19:53:43 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 armbru@redhat.com, jsnow@redhat.com, eblake@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v8 2/7] copy-on-read: add filter append/drop functions
Date: Fri, 28 Aug 2020 19:52:54 +0300
Message-Id: <1598633579-221780-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598633579-221780-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1598633579-221780-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 12:53:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

Provide API for the COR-filter insertion/removal.
Also, drop the filter child permissions for an inactive state when the
filter node is being removed.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 104 +++++++++++++++++++++++++++++++++++++++++++++++++++
 block/copy-on-read.h |  35 +++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 block/copy-on-read.h

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index cb03e0f..0ede7aa 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -23,11 +23,21 @@
 #include "qemu/osdep.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "block/copy-on-read.h"
+
+
+typedef struct BDRVStateCOR {
+    bool active;
+} BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BDRVStateCOR *state = bs->opaque;
+
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                                false, errp);
@@ -42,6 +52,13 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    state->active = true;
+
+    /*
+     * We don't need to call bdrv_child_refresh_perms() now as the permissions
+     * will be updated later when the filter node gets its parent.
+     */
+
     return 0;
 }
 
@@ -57,6 +74,17 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
+    BDRVStateCOR *s = bs->opaque;
+
+    if (!s->active) {
+        /*
+         * While the filter is being removed
+         */
+        *nperm = 0;
+        *nshared = BLK_PERM_ALL;
+        return;
+    }
+
     *nperm = perm & PERM_PASSTHROUGH;
     *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
 
@@ -135,6 +163,7 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
+    .instance_size                      = sizeof(BDRVStateCOR),
 
     .bdrv_open                          = cor_open,
     .bdrv_child_perm                    = cor_child_perm,
@@ -159,4 +188,79 @@ static void bdrv_copy_on_read_init(void)
     bdrv_register(&bdrv_copy_on_read);
 }
 
+
+static BlockDriverState *create_filter_node(BlockDriverState *bs,
+                                            const char *filter_node_name,
+                                            Error **errp)
+{
+    QDict *opts = qdict_new();
+
+    qdict_put_str(opts, "driver", "copy-on-read");
+    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
+
+    return bdrv_open(NULL, NULL, opts, BDRV_O_RDWR, errp);
+}
+
+
+BlockDriverState *bdrv_cor_filter_append(BlockDriverState *bs,
+                                         const char *filter_node_name,
+                                         Error **errp)
+{
+    BlockDriverState *cor_filter_bs;
+    Error *local_err = NULL;
+
+    cor_filter_bs = create_filter_node(bs, filter_node_name, errp);
+    if (cor_filter_bs == NULL) {
+        error_prepend(errp, "Could not create filter node: ");
+        return NULL;
+    }
+
+    if (!filter_node_name) {
+        cor_filter_bs->implicit = true;
+    }
+
+    bdrv_drained_begin(bs);
+    bdrv_replace_node(bs, cor_filter_bs, &local_err);
+    bdrv_drained_end(bs);
+
+    if (local_err) {
+        bdrv_unref(cor_filter_bs);
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    return cor_filter_bs;
+}
+
+
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
+{
+    BdrvChild *child;
+    BlockDriverState *bs;
+    BDRVStateCOR *s = cor_filter_bs->opaque;
+
+    child = bdrv_filter_child(cor_filter_bs);
+    if (!child) {
+        return;
+    }
+    bs = child->bs;
+
+    /* Retain the BDS until we complete the graph change. */
+    bdrv_ref(bs);
+    /* Hold a guest back from writing while permissions are being reset. */
+    bdrv_drained_begin(bs);
+    /* Drop permissions before the graph change. */
+    s->active = false;
+    bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
+    bdrv_replace_node(cor_filter_bs, bs, &error_abort);
+
+    bdrv_drained_end(bs);
+    bdrv_unref(bs);
+    bdrv_unref(cor_filter_bs);
+}
+
+
 block_init(bdrv_copy_on_read_init);
diff --git a/block/copy-on-read.h b/block/copy-on-read.h
new file mode 100644
index 0000000..1686e4e
--- /dev/null
+++ b/block/copy-on-read.h
@@ -0,0 +1,35 @@
+/*
+ * Copy-on-read filter block driver
+ *
+ * The filter driver performs Copy-On-Read (COR) operations
+ *
+ * Copyright (c) 2018-2020 Virtuozzo International GmbH.
+ *
+ * Author:
+ *   Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef COPY_ON_READ_FILTER
+#define COPY_ON_READ_FILTER
+
+#include "block/block_int.h"
+
+BlockDriverState *bdrv_cor_filter_append(BlockDriverState *bs,
+                                         const char *filter_node_name,
+                                         Error **errp);
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs);
+
+#endif /* COPY_ON_READ_FILTER */
-- 
1.8.3.1


