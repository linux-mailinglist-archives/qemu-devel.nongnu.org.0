Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF54EBE92
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:20:22 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVR4-0006uB-U6
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:20:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJb-0002PD-Lx; Wed, 30 Mar 2022 06:12:35 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:52872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJX-0007zB-Eu; Wed, 30 Mar 2022 06:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=trc5BJnQsNM0oBenTzVK2SeUIEF3+qJ8gC27Id5T5jQ=; 
 t=1648635151;x=1649240551; 
 b=OcF0M+uKTnL4EyQGbsF4XhCpCsRV+P6UTJNyHzQAr+xx7JlqClDZVWXvGii2986/dGXYgqnqnqOKLl9sCp1WCbGCnQuaOktXIpijufvlQ+YZiEmragReBB7lVEqiIC1Gs9XIkgg2PCtLdSLqbYlZUiAsoiY3y5SuSMtUbg+xyExTrP7ouSN7AZHix1csIKFZv1MJRkam82Ac6Llbifx7YJq1KmdnYz2uJZeswZ/Aq6Tdpsxk65aUpNDW3Yf1IpfQeTwS3q2eYlNqXoIEMGQQJhFvddCqkOBBJFaLK9JsgHaFua+b7guhru1SsP1W6rEJNd8Sm8UvXiGuDJpUyVqtww==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZVJV-00048P-2o; Wed, 30 Mar 2022 13:12:29 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 44/45] block: bdrv_open_inherit: create BlockBackend only
 when necessary
Date: Wed, 30 Mar 2022 13:12:16 +0300
Message-Id: <20220330101217.4229-6-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE6427D5C075F9E61C41307589F8F117601A182A05F5380850404C228DA9ACA6FE279BCE27C99EC324761FB82467246A2453831D4B70C8A897616BD6A1C75F5C71EB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76ABD3380F320B62CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063750DEB490C003C9A78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D802800E4E7E63A138A6F348382DD2CED96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE73B0385442E67878B9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC5028BACDD2F522FB3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637425E60B8FADAE700D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F249797B4B1AC1449262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C4C7A0BC55FA0FE5FCB91EFAE5A2C4071BAF2C6889BB167446ED1157CEA6F447A5B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F1257DC9690AEBA11AD653053C68C242C89BC46383D2217ABAEA8DA662A5DEBC17ECFAE0E79315871D7E09C32AA3244C18BA610EBF3C0CEFE27D105675F74204C3B3ADDA61883BB583B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+WfSYpcpHPxxg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEF59FC8FC90DF38691E8D08ABE052BD57C255BFBEEFE9B2B4E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We need this blk only for probing - let's create it only when we are
going to probe.

That's significant for further changes: we'll need to avoid permission
update during open() when possible (to refresh them later of course).
But blk_unref() leads to permission update. Instead of implementing
extra logic to avoid permission update during blk_unref when we want
it, let's just drop blk_unref() from normal code path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index 57c8b0d727..97e30c1aef 100644
--- a/block.c
+++ b/block.c
@@ -1761,7 +1761,7 @@ QemuOptsList bdrv_create_opts_simple = {
  *
  * Removes all processed options from *options.
  */
-static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
+static int bdrv_open_common(BlockDriverState *bs, BlockDriverState *file,
                             QDict *options, Error **errp)
 {
     int ret, open_flags;
@@ -1800,8 +1800,8 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     }
 
     if (file != NULL) {
-        bdrv_refresh_filename(blk_bs(file));
-        filename = blk_bs(file)->filename;
+        bdrv_refresh_filename(file);
+        filename = file->filename;
     } else {
         /*
          * Caution: while qdict_get_try_str() is fine, getting
@@ -3765,7 +3765,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            Error **errp)
 {
     int ret;
-    BlockBackend *file = NULL;
+    BlockDriverState *file_bs = NULL;
     BlockDriverState *bs;
     BlockDriver *drv = NULL;
     BdrvChild *child;
@@ -3897,8 +3897,6 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
      * probing, the block drivers will do their own bdrv_open_child() for the
      * same BDS, which is why we put the node name back into options. */
     if ((flags & BDRV_O_PROTOCOL) == 0) {
-        BlockDriverState *file_bs;
-
         file_bs = bdrv_open_child_bs(filename, options, "file", bs,
                                      &child_of_bds, BDRV_CHILD_IMAGE,
                                      true, &local_err);
@@ -3906,24 +3904,28 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
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
@@ -3949,17 +3951,17 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
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
@@ -4023,7 +4025,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     return bs;
 
 fail:
-    blk_unref(file);
+    bdrv_unref(file_bs);
     qobject_unref(snapshot_options);
     qobject_unref(bs->explicit_options);
     qobject_unref(bs->options);
-- 
2.35.1


