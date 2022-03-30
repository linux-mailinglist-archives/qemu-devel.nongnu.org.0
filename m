Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E0F4ED07A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:59:15 +0200 (CEST)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiDa-0007N4-Dj
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:59:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftE-0008MN-9f
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:08 -0400
Received: from [2a00:1450:4864:20::236] (port=42573
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftA-0003ST-I4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:03 -0400
Received: by mail-lj1-x236.google.com with SMTP id c15so29438280ljr.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aap1cPui4gDoxiLF3KY3ER5LW4mUdD5tRWMA6CpKuAM=;
 b=2CiQ8hY5UhFOQkZSndg+1JeTh3Dvd9TjYdt3qDLPJ0CTvX0xhjHceoLXRc5BidaQvJ
 NnPIOiLsZwEDskNtWinZAZaBBTcpit8ZY/O0fllkRj+3+g9uuCGUhTfL3vOoNFAgzirw
 /F0uZdzW4CXCFXb/Wwed6Pdltd4PIcJR5NkaxIgc0cW3knuEyAJkxQWA96+ryCXOVxny
 a0GyKtYFKqYCprwn4PLflFhf3+eDQVQtwdusOOxYoFC2ALM7CR9ReIATqvZIecbTZ15q
 oAfhY7ZINrkEd8vWlCtpNkLDl66uay8LDcKvRPA/CS4qx5UidQTrVXysNf8LVfmtDSNE
 WOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aap1cPui4gDoxiLF3KY3ER5LW4mUdD5tRWMA6CpKuAM=;
 b=4Rc5Cw1qQRFcdtKh0xqgMJ52uxTJ6kdBtUd5H3WRpN0qC7ZgjTTxp7JBuvUZJbVDHr
 iS+R00yRb+g5dUSThcEcIw1JwT60tnD8SVHlWT8TTuhjtUMCSA4515E1kxs7qu1yzPqG
 aeo0uW1/cF9/SsJCq8CJq3pPOcM2uBiUvlNbeErGBCdJtxrjMwgTcE6TbUxvuipnILAA
 bKU0RxUc2M4oS1M8a3AyUgaG+d0F5YvFnvyEaIfBQ9/cocDSYoTQ8jWM6Fj/sdH78ykY
 stvZ2FgJLfTkuI8QBseiVIYUS1JtOreftgv/7EiPgdQCkwbMWG8pf8AL+XN3YuYt+m+Q
 gVWw==
X-Gm-Message-State: AOAM5323QFkXdWc465SA+UDcaDjGF1FPSlSxLFC3tCfURH0+PCymMmj/
 i3p4SCf8s8zJ8Hd8QmigA21YNw==
X-Google-Smtp-Source: ABdhPJyktXfv0MHuSHwSiQAa6Qum7Y0ovCDuxSMAyEK9LPwW3Zxwa8Vy5d0xwOvJpVRJkBf+dMjgUw==
X-Received: by 2002:a2e:bc1e:0:b0:249:896f:6dbf with SMTP id
 b30-20020a2ebc1e000000b00249896f6dbfmr8421487ljf.180.1648675798891; 
 Wed, 30 Mar 2022 14:29:58 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:58 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 44/45] block: bdrv_open_inherit: create BlockBackend only
 when necessary
Date: Thu, 31 Mar 2022 00:29:01 +0300
Message-Id: <20220330212902.590099-45-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x236.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need this blk only for probing - let's create it only when we are
going to probe.

That's significant for further changes: we'll need to avoid permission
update during open() when possible (to refresh them later of course).
But blk_unref() leads to permission update. Instead of implementing
extra logic to avoid permission update during blk_unref when we want
it, let's just drop blk_unref() from normal code path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index 40f54fe121..5a4b59eb6c 100644
--- a/block.c
+++ b/block.c
@@ -1821,7 +1821,7 @@ QemuOptsList bdrv_create_opts_simple = {
  *
  * Removes all processed options from *options.
  */
-static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
+static int bdrv_open_common(BlockDriverState *bs, BlockDriverState *file,
                             QDict *options, Error **errp)
 {
     int ret, open_flags;
@@ -1861,8 +1861,8 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     }
 
     if (file != NULL) {
-        bdrv_refresh_filename(blk_bs(file));
-        filename = blk_bs(file)->filename;
+        bdrv_refresh_filename(file);
+        filename = file->filename;
     } else {
         /*
          * Caution: while qdict_get_try_str() is fine, getting
@@ -3883,7 +3883,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            Error **errp)
 {
     int ret;
-    BlockBackend *file = NULL;
+    BlockDriverState *file_bs = NULL;
     BlockDriverState *bs;
     BlockDriver *drv = NULL;
     BdrvChild *child;
@@ -4016,8 +4016,6 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
      * probing, the block drivers will do their own bdrv_open_child() for the
      * same BDS, which is why we put the node name back into options. */
     if ((flags & BDRV_O_PROTOCOL) == 0) {
-        BlockDriverState *file_bs;
-
         file_bs = bdrv_open_child_bs(filename, options, "file", bs,
                                      &child_of_bds, BDRV_CHILD_IMAGE,
                                      true, &local_err);
@@ -4025,24 +4023,28 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
             goto fail;
         }
         if (file_bs != NULL) {
-            /* Not requesting BLK_PERM_CONSISTENT_READ because we're only
-             * looking at the header to guess the image format. This works even
-             * in cases where a guest would not see a consistent state. */
-            file = blk_new(bdrv_get_aio_context(file_bs), 0, BLK_PERM_ALL);
-            blk_insert_bs(file, file_bs, &local_err);
-            bdrv_unref(file_bs);
-            if (local_err) {
-                goto fail;
-            }
-
             qdict_put_str(options, "file", bdrv_get_node_name(file_bs));
         }
     }
 
     /* Image format probing */
     bs->probed = !drv;
-    if (!drv && file) {
+    if (!drv && file_bs) {
+        /*
+         * Not requesting BLK_PERM_CONSISTENT_READ because we're only
+         * looking at the header to guess the image format. This works even
+         * in cases where a guest would not see a consistent state.
+         */
+        BlockBackend *file = blk_new(bdrv_get_aio_context(file_bs), 0,
+                                     BLK_PERM_ALL);
+        blk_insert_bs(file, file_bs, &local_err);
+        if (local_err) {
+            blk_unref(file);
+            goto fail;
+        }
+
         ret = find_image_format(file, filename, &drv, &local_err);
+        blk_unref(file);
         if (ret < 0) {
             goto fail;
         }
@@ -4068,17 +4070,17 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     assert(!!(flags & BDRV_O_PROTOCOL) == !!drv->bdrv_file_open);
     /* file must be NULL if a protocol BDS is about to be created
      * (the inverse results in an error message from bdrv_open_common()) */
-    assert(!(flags & BDRV_O_PROTOCOL) || !file);
+    assert(!(flags & BDRV_O_PROTOCOL) || !file_bs);
 
     /* Open the image */
-    ret = bdrv_open_common(bs, file, options, &local_err);
+    ret = bdrv_open_common(bs, file_bs, options, &local_err);
     if (ret < 0) {
         goto fail;
     }
 
-    if (file) {
-        blk_unref(file);
-        file = NULL;
+    if (file_bs) {
+        bdrv_unref(file_bs);
+        file_bs = NULL;
     }
 
     /* If there is a backing file, use it */
@@ -4142,7 +4144,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     return bs;
 
 fail:
-    blk_unref(file);
+    bdrv_unref(file_bs);
     qobject_unref(snapshot_options);
     qobject_unref(bs->explicit_options);
     qobject_unref(bs->options);
-- 
2.35.1


