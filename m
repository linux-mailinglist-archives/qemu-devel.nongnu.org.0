Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFB4EB558
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:34:11 +0200 (CEST)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJTe-00053d-M8
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:34:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIh5-0006kW-Vd; Tue, 29 Mar 2022 16:44:01 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIh4-0006xo-AL; Tue, 29 Mar 2022 16:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=t0SlWvE3e1X0mODJ7UgSFvDcT0ujNclvBE8KqXRCY5c=; 
 t=1648586638;x=1649192038; 
 b=mYTvQWAjjnGOL2n8tWrRsSF3XaLhkv0N0KEegWQneRWXNuMEQSaLKGMOOEAeMgxGARORyubNs2SNWL3NUPVsIEZvvJQq2jDSIY+B6pz5gasmaSqHxsZypaXygpim+fD0EX2vlzBuUAmswUFmwwUc3dKPsxtYHlBCGFpa2RUd5Va6708TW4SfDfQbdFYQekTtUqUWXba4QibQuj1hNqv+taF4Z82cnlIaRK7cvdU1Ax73SzgwOysh9yTKeEazeI7I65+05pV9HvCsyv9pkEOCVo15bF+6TLV/eUgPUurzuIJNgJFHv92Bek2O9pscBLX51gA/iudSi4lQE3ajaAIa8g==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIh2-000374-5Y; Tue, 29 Mar 2022 23:43:56 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 36/45] block: bdrv_replace_child_bs(): move to external
 transaction
Date: Tue, 29 Mar 2022 23:40:58 +0300
Message-Id: <20220329204107.411011-37-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61AD608933592879E20A8B16C77A2AB91B00894C459B0CD1B947A1254523FFB5982FF4D021002A446BC206EF2094F4D73495102AAA86CA9C0B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AD2F2D6F6013FF7FC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7A179494B5629353BEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA61F881CD0306DBB2DC64ADC8C3B576E7C20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07734D68A6916D8318941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8EDCF5861DED71B2F389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637057A2EA9A5A8FCA9D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7F416E633B12B5334EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C38E7B408EF846B9DA35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5FB7EF9660DB1F2E2B4C6E27D628442B29C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349A401E2B4D763A4AC841D52A974BB70D9BFC7DD5E699266076EBFA5E67E63F30330E6F52FCB8FB201D7E09C32AA3244C1E282BBD93F057185CF4608A552B4E2E9CA7333006C390A083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGY7Lu7XHCq5VA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE65960E19525D0BDF61F383886C57A7AA2ACD851868E9BE06E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

We'll need this functionality as part of external transaction, so make
the whole function to be transaction action. For this we need to
introduce a transaction action helper: bdrv_drained(), which calls
bdrv_drained_begin() and postpone bdrv_drained_end() to .clean() phase.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c               | 42 +++++++++++++++++++++++++++---------------
 block/block-backend.c |  8 +++++++-
 include/block/block.h |  2 +-
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 605eabc589..5717115523 100644
--- a/block.c
+++ b/block.c
@@ -5193,30 +5193,42 @@ out:
     return ret;
 }
 
+static void bdrv_drained_clean(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    bdrv_drained_end(bs);
+    bdrv_unref(bs);
+}
+
+TransactionActionDrv bdrv_drained_drv = {
+    .clean = bdrv_drained_clean,
+};
+
+/*
+ * Start drained section on @bs, and finish it in .clean action.
+ * Reference to @bs is kept, so @bs can't be removed during transaction.
+ */
+static void bdrv_drained(BlockDriverState *bs, Transaction *tran)
+{
+    bdrv_ref(bs);
+    bdrv_drained_begin(bs);
+    tran_add(tran, &bdrv_drained_drv, bs);
+}
+
 /* Not for empty child */
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
-                          Error **errp)
+                          Transaction *tran, Error **errp)
 {
-    int ret;
-    Transaction *tran = tran_new();
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
-    bdrv_ref(old_bs);
-    bdrv_drained_begin(old_bs);
-    bdrv_drained_begin(new_bs);
+    bdrv_drained(old_bs, tran);
+    bdrv_drained(new_bs, tran);
 
     bdrv_replace_child_tran(child, new_bs, &refresh_list, tran);
 
-    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
-
-    tran_finalize(tran, ret);
-
-    bdrv_drained_end(old_bs);
-    bdrv_drained_end(new_bs);
-    bdrv_unref(old_bs);
-
-    return ret;
+    return bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/block-backend.c b/block/block-backend.c
index 97913acfcd..dbbbc56b2c 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -892,7 +892,13 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
  */
 int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
 {
-    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+    int ret;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_replace_child_bs(blk->root, new_bs, tran, errp);
+    tran_finalize(tran, ret);
+
+    return ret;
 }
 
 /*
diff --git a/include/block/block.h b/include/block/block.h
index 017bf9b7c0..182e87ce77 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -405,7 +405,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
-                          Error **errp);
+                          Transaction *tran, Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
-- 
2.35.1


