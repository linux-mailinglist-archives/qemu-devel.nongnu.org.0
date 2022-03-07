Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35C4CFDE8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:13:35 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCF4-0005TJ-M2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjB-0005Be-IZ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAj9-0008Hd-1t
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QS01oMDdYrH7pJ3AslrMOcxuynrztMuIQ2EFPjIhJx0=;
 b=hDL3qiX+e2FtMjc9+G8Aj3hi9F8u8Nv5pEAx9GgZFeJa0GiL7GwgPelgZ6WbeZGPjuFuMo
 k3QxTomj5qLdsdPpuOOM+faTacyZ0VVPq8UT2lnftyFBw8825Rk08kMZjHQ3XOgCBrnaV8
 k7OythCvy4y0O/tho7jZk7jf/94KTSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-Yr3VPTbRPSmdYLp4HJVGIg-1; Mon, 07 Mar 2022 05:36:27 -0500
X-MC-Unique: Yr3VPTbRPSmdYLp4HJVGIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FB6D835DE4;
 Mon,  7 Mar 2022 10:36:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFE7276C20;
 Mon,  7 Mar 2022 10:36:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/23] block/copy-before-write: add bitmap open parameter
Date: Mon,  7 Mar 2022 11:35:37 +0100
Message-Id: <20220307103549.808809-12-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This brings "incremental" mode to copy-before-write filter: user can
specify bitmap so that filter will copy only "dirty" areas.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303194349.2304213-5-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json      | 10 +++++++-
 block/copy-before-write.c | 51 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..ffb7aea2a5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4171,11 +4171,19 @@
 #
 # @target: The target for copy-before-write operations.
 #
+# @bitmap: If specified, copy-before-write filter will do
+#          copy-before-write operations only for dirty regions of the
+#          bitmap. Bitmap size must be equal to length of file and
+#          target child of the filter. Note also, that bitmap is used
+#          only to initialize internal bitmap of the process, so further
+#          modifications (or removing) of specified bitmap doesn't
+#          influence the filter. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1af0c7e5c0..c83c9c7c46 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -34,6 +34,8 @@
 
 #include "block/copy-before-write.h"
 
+#include "qapi/qapi-visit-block-core.h"
+
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
@@ -145,10 +147,53 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
+                                    Error **errp)
+{
+    QDict *bitmap_qdict = NULL;
+    BlockDirtyBitmap *bmp_param = NULL;
+    Visitor *v = NULL;
+    bool ret = false;
+
+    *bitmap = NULL;
+
+    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
+    if (!qdict_size(bitmap_qdict)) {
+        ret = true;
+        goto out;
+    }
+
+    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    if (!v) {
+        goto out;
+    }
+
+    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
+    if (!bmp_param) {
+        goto out;
+    }
+
+    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
+                                        errp);
+    if (!*bitmap) {
+        goto out;
+    }
+
+    ret = true;
+
+out:
+    qapi_free_BlockDirtyBitmap(bmp_param);
+    visit_free(v);
+    qobject_unref(bitmap_qdict);
+
+    return ret;
+}
+
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -163,6 +208,10 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
+        return -EINVAL;
+    }
+
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
@@ -170,7 +219,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.34.1


