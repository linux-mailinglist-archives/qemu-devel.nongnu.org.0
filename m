Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558DB4D91D2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 01:54:43 +0100 (CET)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTvST-0003sq-Vc
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 20:54:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ4-0007uU-7g; Mon, 14 Mar 2022 17:32:46 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:43448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ1-00066D-Si; Mon, 14 Mar 2022 17:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XbUyGh1L27utyDj4AvrtD7ZAgrTUYE/ih93DMlRqpxo=; 
 t=1647293563;x=1647898963; 
 b=YN29uq6aeWWT7DfMWGQ+PTseV7Q+jaxceQKb5RHOJ9R0DvUtkAdCbVysurwBWTP56JDsgQvDbNTb8TseXgDsW54RPNF/wSohGYVktD78skcfZKnS+CO1q+6Yo6hXVmpb2hq9vZhQ+10+A5Nx3HC0lPSg9Jt8z15Lnv/HkhQGxxxdOa3QmQ43fcNH8BMzEzw3Em5cL+vpp6cll2eRRdhpB8K7jlXfwBtQBGpmtpQrx/cPj0N5luwWTxjKhnj5+rsm+iSR3v2l7KkQC1qSFy8/C9829YAtr3X1FpHlnFty+Gy+oZeUaK3oLToXsir8u/CqhyCnczaovmkbxn1RSV4DKg==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nTsIx-0004pZ-L0; Tue, 15 Mar 2022 00:32:40 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, v.sementsov-og@ya.ru,
 v.sementsov-og@mail.ru, eblake@redhat.com, yuriy.vasiliev@virtuozzo.com
Subject: [PATCH v2 2/3] qapi: nbd-export: allow select bitmaps by node/name
 pair
Date: Tue, 15 Mar 2022 00:32:25 +0300
Message-Id: <20220314213226.362217-3-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314213226.362217-1-v.sementsov-og@mail.ru>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D1A86FCEE7E90544709577A47801E79BC182A05F538085040721926008E38858707E5A9FCB0CFA1332DBE5359C53A64FB3847A4440D360A94
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72407438AC6002944EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C8D8BCCD49BBA39A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8506FCBF05CA46B41AC20FE45090B9D5A6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063783E00425F71A4181389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637522BF2A1F12CC7CFD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7D45CAE3749AE80D7EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3281D9C1DFF1F1E7335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CD97CDA27012969F6941BCF6B1439514364425A176C70DC729C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFCE66FDB1904541E0699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C02783DDD5A45DEF9C24BC961553539F85F05AE2C2D22744B09D525720CFF60E002AC4A16B9C88FC1D7E09C32AA3244CF0F468CA293307CF297973255CFE6A67B038C9161EF167A1ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbhzdNy/MvgiPWfLi/cXkQ==
X-Mailru-Sender: 6C3E74F07C41AE94C4973423E83F3A159D968AF17CAB6850FD1DB80C50194AB8672B1FA5F7FA4D7CE6462B2528CDCABCB7EB570DD03A1E57B847871DB86736497E5CFB87F3DDD4B722B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 20:52:36 -0400
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

From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>

Hi all! Current logic of relying on search through backing chain is not
safe neither convenient.

Sometimes it leads to necessity of extra bitmap copying. Also, we are
going to add "snapshot-access" driver, to access some snapshot state
through NBD. And this driver is not formally a filter, and of course
it's not a COW format driver. So, searching through backing chain will
not work. Instead of widening the workaround of bitmap searching, let's
extend the interface so that user can select bitmap precisely.

Note, that checking for bitmap active status is not copied to the new
API, I don't see a reason for it, user should understand the risks. And
anyway, bitmap from other node is unrelated to this export being
read-only or read-write.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
---
 blockdev-nbd.c         |  8 +++++-
 nbd/server.c           | 63 +++++++++++++++++++++++++++---------------
 qapi/block-export.json |  5 +++-
 qemu-nbd.c             | 11 ++++++--
 4 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 9840d25a82..7f6531cba0 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -211,8 +211,14 @@ void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
     QAPI_CLONE_MEMBERS(BlockExportOptionsNbdBase, &export_opts->u.nbd,
                        qapi_NbdServerAddOptions_base(arg));
     if (arg->has_bitmap) {
+        BlockDirtyBitmapOrStr *el = g_new(BlockDirtyBitmapOrStr, 1);
+
+        *el = (BlockDirtyBitmapOrStr) {
+            .type = QTYPE_QSTRING,
+            .u.local = g_strdup(arg->bitmap),
+        };
         export_opts->u.nbd.has_bitmaps = true;
-        QAPI_LIST_PREPEND(export_opts->u.nbd.bitmaps, g_strdup(arg->bitmap));
+        QAPI_LIST_PREPEND(export_opts->u.nbd.bitmaps, el);
     }
 
     /*
diff --git a/nbd/server.c b/nbd/server.c
index 5da884c2fc..3956602c0a 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1643,7 +1643,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     uint64_t perm, shared_perm;
     bool readonly = !exp_args->writable;
     bool shared = !exp_args->writable;
-    strList *bitmaps;
+    BlockDirtyBitmapOrStrList *bitmaps;
     size_t i;
     int ret;
 
@@ -1709,37 +1709,56 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     }
     exp->export_bitmaps = g_new0(BdrvDirtyBitmap *, exp->nr_export_bitmaps);
     for (i = 0, bitmaps = arg->bitmaps; bitmaps;
-         i++, bitmaps = bitmaps->next) {
-        const char *bitmap = bitmaps->value;
+         i++, bitmaps = bitmaps->next)
+    {
+        const char *bitmap;
         BlockDriverState *bs = blk_bs(blk);
         BdrvDirtyBitmap *bm = NULL;
 
-        while (bs) {
-            bm = bdrv_find_dirty_bitmap(bs, bitmap);
-            if (bm != NULL) {
-                break;
+        switch (bitmaps->value->type) {
+        case QTYPE_QSTRING:
+            bitmap = bitmaps->value->u.local;
+            while (bs) {
+                bm = bdrv_find_dirty_bitmap(bs, bitmap);
+                if (bm != NULL) {
+                    break;
+                }
+
+                bs = bdrv_filter_or_cow_bs(bs);
             }
 
-            bs = bdrv_filter_or_cow_bs(bs);
-        }
+            if (bm == NULL) {
+                ret = -ENOENT;
+                error_setg(errp, "Bitmap '%s' is not found",
+                           bitmaps->value->u.local);
+                goto fail;
+            }
 
-        if (bm == NULL) {
-            ret = -ENOENT;
-            error_setg(errp, "Bitmap '%s' is not found", bitmap);
-            goto fail;
+            if (readonly && bdrv_is_writable(bs) &&
+                bdrv_dirty_bitmap_enabled(bm)) {
+                ret = -EINVAL;
+                error_setg(errp, "Enabled bitmap '%s' incompatible with "
+                           "readonly export", bitmap);
+                goto fail;
+            }
+            break;
+        case QTYPE_QDICT:
+            bitmap = bitmaps->value->u.external.name;
+            bm = block_dirty_bitmap_lookup(bitmaps->value->u.external.node,
+                                           bitmap, NULL, errp);
+            if (!bm) {
+                ret = -ENOENT;
+                goto fail;
+            }
+            break;
+        default:
+            abort();
         }
 
-        if (bdrv_dirty_bitmap_check(bm, BDRV_BITMAP_ALLOW_RO, errp)) {
-            ret = -EINVAL;
-            goto fail;
-        }
+        assert(bm);
 
-        if (readonly && bdrv_is_writable(bs) &&
-            bdrv_dirty_bitmap_enabled(bm)) {
+        if (bdrv_dirty_bitmap_check(bm, BDRV_BITMAP_ALLOW_RO, errp)) {
             ret = -EINVAL;
-            error_setg(errp,
-                       "Enabled bitmap '%s' incompatible with readonly export",
-                       bitmap);
             goto fail;
         }
 
diff --git a/qapi/block-export.json b/qapi/block-export.json
index f183522d0d..6afed472ff 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -6,6 +6,7 @@
 ##
 
 { 'include': 'sockets.json' }
+{ 'include': 'block-core.json' }
 
 ##
 # @NbdServerOptions:
@@ -89,6 +90,7 @@
 #           @device, so the NBD client can use NBD_OPT_SET_META_CONTEXT with
 #           the metadata context name "qemu:dirty-bitmap:BITMAP" to inspect
 #           each bitmap.
+#           Since 7.1 bitmap may be specified by node/name pair.
 #
 # @allocation-depth: Also export the allocation depth map for @device, so
 #                    the NBD client can use NBD_OPT_SET_META_CONTEXT with
@@ -99,7 +101,8 @@
 ##
 { 'struct': 'BlockExportOptionsNbd',
   'base': 'BlockExportOptionsNbdBase',
-  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
+  'data': { '*bitmaps': ['BlockDirtyBitmapOrStr'],
+            '*allocation-depth': 'bool' } }
 
 ##
 # @BlockExportOptionsVhostUserBlk:
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 713e7557a9..72138f703e 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -567,7 +567,7 @@ int main(int argc, char **argv)
     QDict *options = NULL;
     const char *export_name = NULL; /* defaults to "" later for server mode */
     const char *export_description = NULL;
-    strList *bitmaps = NULL;
+    BlockDirtyBitmapOrStrList *bitmaps = NULL;
     bool alloc_depth = false;
     const char *tlscredsid = NULL;
     const char *tlshostname = NULL;
@@ -687,7 +687,14 @@ int main(int argc, char **argv)
             alloc_depth = true;
             break;
         case 'B':
-            QAPI_LIST_PREPEND(bitmaps, g_strdup(optarg));
+            {
+                BlockDirtyBitmapOrStr *el = g_new(BlockDirtyBitmapOrStr, 1);
+                *el = (BlockDirtyBitmapOrStr) {
+                    .type = QTYPE_QSTRING,
+                    .u.local = g_strdup(optarg),
+                };
+                QAPI_LIST_PREPEND(bitmaps, el);
+            }
             break;
         case 'k':
             sockpath = optarg;
-- 
2.35.1


