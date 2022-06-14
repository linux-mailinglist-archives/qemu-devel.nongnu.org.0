Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F152454AE76
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:37:26 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13vJ-0004fC-DM
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nm-0001E5-KU; Tue, 14 Jun 2022 06:29:38 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:57570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nf-0000kG-0j; Tue, 14 Jun 2022 06:29:38 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id F03AA2E1A95;
 Tue, 14 Jun 2022 13:29:19 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Laao1vUIuq-TJJSSZe9; Tue, 14 Jun 2022 13:29:19 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202559; bh=R9dXA4ELgeiEDcwtM2G/dcJ4f7RwrhTVkAo1g2RPYSc=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=d4wP5oOfbOonl73Df0s7/9/xUNOIDrupkj5I9Dr+SDPYm23hyVcT5NlMo9mCOToHO
 uczBFttSgow1lT6IfpJ5imWRyxbzN+QJ4Jq4vYNUc0MeWnAiUbM8JHGoln0Pv2qgHl
 DNuVpPD6YeHiY2nh5OedwLQeCHPD0BA8G/b1DTMA=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TIMmIZCB; Tue, 14 Jun 2022 13:29:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 01/10] block/copy-before-write: refactor option parsing
Date: Tue, 14 Jun 2022 13:29:01 +0300
Message-Id: <20220614102910.1431380-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

We are going to add one more option of enum type. Let's refactor option
parsing so that we can simply work with BlockdevOptionsCbw object.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/copy-before-write.c | 56 ++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a8a06fdc09..e29c46cd7a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/qmp/qjson.h"
 
 #include "sysemu/block-backend.h"
 #include "qemu/cutils.h"
@@ -328,46 +329,34 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
-                                    Error **errp)
+static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
 {
-    QDict *bitmap_qdict = NULL;
-    BlockDirtyBitmap *bmp_param = NULL;
+    BlockdevOptions *opts = NULL;
     Visitor *v = NULL;
-    bool ret = false;
 
-    *bitmap = NULL;
+    qdict_put_str(options, "driver", "copy-before-write");
 
-    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
-    if (!qdict_size(bitmap_qdict)) {
-        ret = true;
-        goto out;
-    }
-
-    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    v = qobject_input_visitor_new_flat_confused(options, errp);
     if (!v) {
         goto out;
     }
 
-    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
-    if (!bmp_param) {
+    visit_type_BlockdevOptions(v, NULL, &opts, errp);
+    if (!opts) {
         goto out;
     }
 
-    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
-                                        errp);
-    if (!*bitmap) {
-        goto out;
-    }
-
-    ret = true;
+    /*
+     * Delete options which we are going to parse through BlockdevOptions
+     * object for original options.
+     */
+    qdict_extract_subqdict(options, NULL, "bitmap");
 
 out:
-    qapi_free_BlockDirtyBitmap(bmp_param);
     visit_free(v);
-    qobject_unref(bitmap_qdict);
+    qdict_del(options, "driver");
 
-    return ret;
+    return opts;
 }
 
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
@@ -376,6 +365,15 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
     int64_t cluster_size;
+    g_autoptr(BlockdevOptions) full_opts = NULL;
+    BlockdevOptionsCbw *opts;
+
+    full_opts = cbw_parse_options(options, errp);
+    if (!full_opts) {
+        return -EINVAL;
+    }
+    assert(full_opts->driver == BLOCKDEV_DRIVER_COPY_BEFORE_WRITE);
+    opts = &full_opts->u.copy_before_write;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -390,8 +388,12 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
-        return -EINVAL;
+    if (opts->has_bitmap) {
+        bitmap = block_dirty_bitmap_lookup(opts->bitmap->node,
+                                           opts->bitmap->name, NULL, errp);
+        if (!bitmap) {
+            return -EINVAL;
+        }
     }
 
     bs->total_sectors = bs->file->bs->total_sectors;
-- 
2.25.1


