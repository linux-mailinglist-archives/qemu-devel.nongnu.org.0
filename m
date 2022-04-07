Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC44F809C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:32:22 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSFJ-0001Pi-Hv
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAp-00076N-IZ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:44 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:45965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAm-0007tI-9T
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:43 -0400
Received: by mail-lf1-x135.google.com with SMTP id p10so9556156lfa.12
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eBIYvBeSQAOyY9p/R11O/+RGM89VtsJ7MakdsLaa1Q=;
 b=M6ELBj/QIMxlI1YqjonYKwZCK1cWjbpJDPXv+zvXEOvDbIEd9aiwICHTcOrt8EQVLj
 BaZCgVgNd3zNSHutqgUCLF6/efM8aneKTib/U6Js5Dn7g/oEHtQaGBbxK6PxyGzQ3iaI
 AAHDw+UlDQOmsIawdqxpGtF9+FB0895coU3iXLfWRZZz6GBF53O8/XuXMgeQIYU+83tg
 f02PPKxqaTJsSdpq/G867nsGd4bRmPuQr1K/8kl/vRzZglnIQYNWOvDMjg8NGPRbn3Qa
 V6RTZ/2xnPMvaVzyFZmLmAxud5kEP/dLphX0YL2PFVV8xI/VhD9psZXdJoxab7GHmE0I
 aQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eBIYvBeSQAOyY9p/R11O/+RGM89VtsJ7MakdsLaa1Q=;
 b=0hHFTzQOlt1kuOmfoduTjxg3oeYxs/g0K7jbx3NkFR1KFGCGPgkDU8QaXod/x+xsaL
 sotBiLTjVhwjayV8HIEu2pPps+Tthdc5v+0FQFIpATswM1F8aUkS6rmU7Z+cjrej0s7u
 kTx9HWaFQBs6KlnkxYC26GheqWJ2g54MSd6eRATWuagAigCmJbIu8iffKo10vvfFcqjs
 RniCYEGhEy1pj3d8M/RLKqu7a9Aj+nfll8e+VuguiDwev8n3xS091rC/D9j8lKXl4p8Q
 aMdx02c9TYBV/hNmmveJuOKIFNOoUHK7N/DmvB2wWQ8vIxyHUdzyCRt5VjcRuj+/Lr6v
 8Kxw==
X-Gm-Message-State: AOAM5333+a8pUdhQAZIRtGcSN/m165n8I79cDr+m8crKEtIHsfdWhc9E
 v5ymyVgHlvLVVOO+Yfkj4oZNmg==
X-Google-Smtp-Source: ABdhPJybc4lLoMCeAmM0VVnEiKbmlLQD87yggN3j6YYy4kjkZWd9xW3jeucP/glPXhjgWOIPJMQPmA==
X-Received: by 2002:a05:6512:2601:b0:464:f8ca:979a with SMTP id
 bt1-20020a056512260100b00464f8ca979amr1182465lfb.84.1649338058349; 
 Thu, 07 Apr 2022 06:27:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:37 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 1/7] block/copy-before-write: refactor option parsing
Date: Thu,  7 Apr 2022 16:27:20 +0300
Message-Id: <20220407132726.85114-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to add one more option of enum type. Let's refactor option
parsing so that we can simply work with BlockdevOptionsCbw object.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
2.35.1


