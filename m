Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA84EEABA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:49:22 +0200 (CEST)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDuD-0006sK-0q
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:49:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRW-0000Gf-NM
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:44 -0400
Received: from [2a00:1450:4864:20::22e] (port=43859
 helo=mail-lj1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRU-0006se-Uq
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:42 -0400
Received: by mail-lj1-x22e.google.com with SMTP id b43so3057382ljr.10
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63KOcHkFUD4WLCydVmQXmoksEDdiR3xCGd3+SRNPvy4=;
 b=YC5zoMu5N14vxV6JFMDQSRZRKYC2L7P9k/hMWjgr8IJ5dfoWvtSRwXCeXl5e9QNhxJ
 p/Yh4zgFf02ASAxslGB25Dicxnk2Xe3nD73CPqn1+u2WWFkMtIgrMHcu9degneL/Iw8R
 DV56K//pdnSJeA4+T2FA6nmFqqQRjJ3kPAZCbwz3XLVfmqnIxVkZ1DLdkXV9BqxsEw/A
 z2xKF9yzu3dbnLDCzfS17d3youLUe+KTgQFTRf9TUmGf2aLDeQaIB/b/xNnKKn98bsRx
 YhWkmJys94Mgl6Mrhsy3KM3yiD2UvJRqNYbaKl3qjnXxcSKEl5u5aQkCapEae+Xup2w0
 0fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63KOcHkFUD4WLCydVmQXmoksEDdiR3xCGd3+SRNPvy4=;
 b=iTMBTsUxuNgaA4Wt+QWloaaEbOpiGe2LvbX2kNeJKj59y78ZT1oVYApCzXw5nJYAZG
 FrfE/9kktbSkupeRtiffm5PFqKJUWcnUQ9z3MIeYY1TtyyJN63054BQ5vDBYKR03GANd
 A2xRkElC+yx+EDKrwdMFoGeurauFycA/dRUT7CzsGgzyE1zr3qgozspiZnL3WZ/RPaD/
 4GcqGOlRPqbidc7zdLWmeeYTUbI+sUgffD52I8gkZTxfbrt/MET5aJNujDOv6SVuyTY8
 yFeAgXS3ZSBvc2RfdoJ8oyt7hfEoxhFYoTfFpIl1B4CrbT98+CB4HOHSX44PCLdAyaO9
 PgNQ==
X-Gm-Message-State: AOAM531Ahgo8WYFJDcjUckfAun16Vhs3cdpvrizAW5ysCJ/mKJS/hSo9
 QZ4TVCbK57gC/EKNSOdsJIVDhw==
X-Google-Smtp-Source: ABdhPJyJZNrKghyQU8lIbJVCUUIVWnsMPoIPCmfxIvK6o/1OjJDGuyk4pHFxwbK0y1hZKDBb3G9Hxw==
X-Received: by 2002:a2e:2e16:0:b0:24a:f25e:41e with SMTP id
 u22-20020a2e2e16000000b0024af25e041emr6422545lju.45.1648804774864; 
 Fri, 01 Apr 2022 02:19:34 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:34 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/7] block/copy-before-write: refactor option parsing
Date: Fri,  1 Apr 2022 12:19:14 +0300
Message-Id: <20220401091920.287612-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 block/copy-before-write.c | 68 +++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a8a06fdc09..394e73b094 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/qmp/qjson.h"
 
 #include "sysemu/block-backend.h"
 #include "qemu/cutils.h"
@@ -328,46 +329,49 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
-                                    Error **errp)
+static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
 {
-    QDict *bitmap_qdict = NULL;
-    BlockDirtyBitmap *bmp_param = NULL;
+    QDict *cbw_qdict = NULL;
+    BlockdevOptionsCbw *opts = NULL;
     Visitor *v = NULL;
-    bool ret = false;
 
-    *bitmap = NULL;
+    cbw_qdict = qdict_clone_shallow(options);
 
-    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
-    if (!qdict_size(bitmap_qdict)) {
-        ret = true;
-        goto out;
-    }
-
-    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    /*
+     * Delete BlockdevOptions base fields, that are not part of
+     * BlockdevOptionsCbw.
+     */
+    qdict_del(cbw_qdict, "driver");
+    qdict_del(cbw_qdict, "node-name");
+    qdict_del(cbw_qdict, "discard");
+    qdict_del(cbw_qdict, "cache");
+    qdict_extract_subqdict(cbw_qdict, NULL, "cache.");
+    qdict_del(cbw_qdict, "read-only");
+    qdict_del(cbw_qdict, "auto-read-only");
+    qdict_del(cbw_qdict, "force-share");
+    qdict_del(cbw_qdict, "detect-zeroes");
+
+    v = qobject_input_visitor_new_flat_confused(cbw_qdict, errp);
     if (!v) {
         goto out;
     }
 
-    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
-    if (!bmp_param) {
-        goto out;
-    }
-
-    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
-                                        errp);
-    if (!*bitmap) {
+    visit_type_BlockdevOptionsCbw(v, NULL, &opts, errp);
+    if (!opts) {
         goto out;
     }
 
-    ret = true;
+    /*
+     * Delete options which we are going to parse through BlockdevOptionsCbw
+     * object for original options.
+     */
+    qdict_extract_subqdict(options, NULL, "bitmap");
 
 out:
-    qapi_free_BlockDirtyBitmap(bmp_param);
     visit_free(v);
-    qobject_unref(bitmap_qdict);
+    qobject_unref(cbw_qdict);
 
-    return ret;
+    return opts;
 }
 
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
@@ -376,6 +380,12 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
     int64_t cluster_size;
+    g_autoptr(BlockdevOptionsCbw) opts = NULL;
+
+    opts = cbw_parse_options(options, errp);
+    if (!opts) {
+        return -EINVAL;
+    }
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -390,8 +400,12 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
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


