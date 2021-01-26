Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A0304026
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:23:48 +0100 (CET)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PFz-0001vI-5S
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PD8-000834-GL
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PD2-0005u3-Bj
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KSv+t6mWbRgJUaI085CiY6NM0m0poggbOSsBtkUmpE=;
 b=RS7bqfVSv2hbkgEzcPBnJ2Dp4reDm476yqwd+Mf/t8Vv0ZrRiN29KVXVLMirXacLzm7s9s
 01Z4esFgJPhCvXqyUjJuYyP+vXTRVbPfo79xfLpeOgUu08NxbPSFowHfdZHTBwbzw1vefG
 O1hJi4Qrf2ZJ1qyEyrRHWfwpJ1WxAms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-SvepPAtYN0eZVsaqsGqIjg-1; Tue, 26 Jan 2021 09:20:41 -0500
X-MC-Unique: SvepPAtYN0eZVsaqsGqIjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9F919611A8;
 Tue, 26 Jan 2021 14:20:27 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9C260C62;
 Tue, 26 Jan 2021 14:20:27 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/53] copy-on-read: add filter drop function
Date: Tue, 26 Jan 2021 15:19:27 +0100
Message-Id: <20210126142016.806073-5-mreitz@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide API for the COR-filter removal. Also, drop the filter child
permissions for an inactive state when the filter node is being
removed.
To insert the filter, the block generic layer function
bdrv_insert_node() can be used.
The new function bdrv_cor_filter_drop() may be considered as an
intermediate solution before the QEMU permission update system has
overhauled. Then we are able to implement the API function
bdrv_remove_node() on the block generic layer.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201216061703.70908-4-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-on-read.h | 32 +++++++++++++++++++++++++
 block/copy-on-read.c | 56 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 block/copy-on-read.h

diff --git a/block/copy-on-read.h b/block/copy-on-read.h
new file mode 100644
index 0000000000..7bf405dccd
--- /dev/null
+++ b/block/copy-on-read.h
@@ -0,0 +1,32 @@
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
+#ifndef BLOCK_COPY_ON_READ
+#define BLOCK_COPY_ON_READ
+
+#include "block/block_int.h"
+
+void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs);
+
+#endif /* BLOCK_COPY_ON_READ */
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index cb03e0f2d3..618c4c4f43 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -23,11 +23,20 @@
 #include "qemu/osdep.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
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
@@ -42,6 +51,13 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
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
 
@@ -57,6 +73,17 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
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
 
@@ -135,6 +162,7 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
+    .instance_size                      = sizeof(BDRVStateCOR),
 
     .bdrv_open                          = cor_open,
     .bdrv_child_perm                    = cor_child_perm,
@@ -154,6 +182,34 @@ static BlockDriver bdrv_copy_on_read = {
     .is_filter                          = true,
 };
 
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
 static void bdrv_copy_on_read_init(void)
 {
     bdrv_register(&bdrv_copy_on_read);
-- 
2.29.2


