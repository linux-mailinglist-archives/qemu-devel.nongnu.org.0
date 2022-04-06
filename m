Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF514F689B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:13:06 +0200 (CEST)
Received: from localhost ([::1]:41844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA9R-0008AM-5L
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5A-0000NP-Io
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:40 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:33763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA57-0001vX-Ic
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:40 -0400
Received: by mail-lf1-x12a.google.com with SMTP id bu29so5582740lfb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6hsA0EO/gNahUQKgd3/p5EZyNb6Mi/jxzXRr5F796I=;
 b=74bCCBpxFxxZ5KJ4k1PByOIiK1YRGg2wLLqDoWKG4b7udeTfIxLNIcVFEe7q6rSKWf
 b4OC4ze9MMP4fPbGKOa0AycjD78DwsGJL18H6/H0UAM1TOPCawfWRLxH7/Hh7FbDb4Co
 3yWeb5dHwszLq62NdF9jzDKrHn8lCY72VIlp6rApVRJfis3sMkwD1PexmClwVSd2HIL0
 3JGRRkD4KgiZ064OOWckfq6O1eqRQMzO8EvmB6FZATwPnbaoT9B5J+rZqWKvtvvls6LX
 CyeW7cVBCOxwlRuQDweL9+/W6KWiTw2kqEBolM8/f1zT8Ti6qrd4ZvboxVELULvuHH/J
 mzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6hsA0EO/gNahUQKgd3/p5EZyNb6Mi/jxzXRr5F796I=;
 b=FAbIqZ2ABZCVurKT39A9zjNmWnzxm3/80QuSILuq3nTNlNEIDxFdvbtqGmiwzQ8rw7
 /BKpUckgUFqGK58pW0ym7FwDn4z1iMSIq4k3Be5EjAYhoyiYKd8w8ljvaUr2D4OV36In
 g9nRKW0BKvaiasGyO/urlpWk6Ym6t8BO16DtqNrCpLdozAu2klHdRS3hDEzp7LV4V+eh
 s6owpVeuJa/fJ4TWaOK/mWYixj3XtXWVWu2oJvtXd4VL9y/BGgthzltSjc9/oZvKN2s+
 rpM5YMQs9/P37w8ZiJFW6qWQefi+8hD00H39PlIDjDwXwMaE5srN4hSZl5NqrXM6gV5M
 Sbqw==
X-Gm-Message-State: AOAM533g8QrBHZCE7u0exi//1PFNeylI22Xosz7KiEffX8JhjUsGWmqA
 /5Qw8fZyaMfkTOCRqosdBxyWVQ==
X-Google-Smtp-Source: ABdhPJzoyCFZgJgPI7wT2WHn0jqtdj12CW9fwZkC2cqY4pbm4FdO3MDKGM9selFo+WBSROAqR9KYVQ==
X-Received: by 2002:a05:6512:39cf:b0:44a:2453:d2fd with SMTP id
 k15-20020a05651239cf00b0044a2453d2fdmr6816688lfu.507.1649268515407; 
 Wed, 06 Apr 2022 11:08:35 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:35 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/7] block/copy-before-write: refactor option parsing
Date: Wed,  6 Apr 2022 21:07:55 +0300
Message-Id: <20220406180801.374844-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to add one more option of enum type. Let's refactor option
parsing so that we can simply work with BlockdevOptionsCbw object.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/copy-before-write.c | 55 ++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a8a06fdc09..6877ff893a 100644
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
@@ -376,6 +365,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
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
+    opts = &full_opts->u.copy_before_write;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -390,8 +387,12 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
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
2.35.1


