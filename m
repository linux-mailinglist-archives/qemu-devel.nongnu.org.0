Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24994EB511
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:12:45 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ8u-0005Bl-My
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:12:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgY-0006Pm-Lw; Tue, 29 Mar 2022 16:43:28 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:52650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgV-0006sh-Rd; Tue, 29 Mar 2022 16:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ESEaNcxytDLZVQHAFaWxZhf+o7u9z3IFsM6tenQ79DI=; 
 t=1648586603;x=1649192003; 
 b=Sy5fpTqsl86OXLBsb2f3r9Z8g4aCWofwQIeNNJSBvfAXRq5TmjeELQvuJMLij2LjFoMYYXybx6ljozA1stPJQiH1ichi4qAcRwGUkHW/UUDvKv8xXv2hppw/TmewIqR/COuMFWUK+uJGnwxF+7pril20KWBFV9GsWuidRcxqb5EA0mMZr2IVmeZcn5VbWeJJnLjDgnFsOtVCGeTWE5gS4aHWZRWZnOER2/woQ7Ldw+l12S6XIWaczvUpk6PHsqZ5HxczFWwB5ahiHIm96ECRCWCvM+Hxjre8cu0YfRpowvPw7xcGOqDmPOCcrmQXZaXSAV3Hfn/mCOjrEriA3E84eA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIg9-000374-Kz; Tue, 29 Mar 2022 23:43:02 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 29/45] block: introduce BDRV_O_NOPERM flag
Date: Tue, 29 Mar 2022 23:40:51 +0300
Message-Id: <20220329204107.411011-30-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E1FB8704E9CBF83467E8A25B5576996E00894C459B0CD1B94B6901CC6BB6874B130D35E636CA0121C206EF2094F4D7344C4DA9DF1BAA9670
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B264C8851FD8E810EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A164EE347039141E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88B967364EAE3E69EB841CED4F09CFE8D6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC041BD12FB6B479933AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063705D250BA6C9D3354EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C328505141BAE32B3435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-B7AD71C0: 1B70FBA5C9BEEE72C9761FC34675ADEB871C96603B655635EE9D5CB6078CC77C9E00ECEA5EC58584EE319BF62A11F40A
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF003E05DD6FC679E84EC3A80B2A606EF86B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3441661D6226BE8C316F75A0442A35AF09521DCF413C9C883D290E4C810225CB77ED378BAD504FDCDF1D7E09C32AA3244C609BFD890B12D6CF9E8B5A2E110FB2A885803964308724808D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGb45ktudZikjQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE336C705384C87316A803D7067C248FB67DAF9310E7C83EE3E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Now copy-before-write filter has weak permission model: when it has no
parents, it share write permission on source. Otherwise we just can't
blockdev-add it, when existing user of source has write permission.

The situation is bad, it means that copy-before-write filter doesn't
guarantee that all write goes through it. And a lot better is unshare
write always. But how to insert the filter in this case?

The solution is to do blockdev-add and blockdev-replace in one
transaction, and more, update permissions only after both command.

For now, let's create a possibility to not update permission on file
child of copy-before-write filter at time of open.

New interfaces are:

- bds_tree_init() with flags argument, so that caller may pass
  additional flags, for example the new BDRV_O_NOPERM.

- bdrv_open_file_child_common() with boolean refresh_perms arguments.
  Drivers may use this function with refresh_perms = true, if they want
  to satisfy BDRV_O_NOPERM. No one such driver for now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c                        | 84 ++++++++++++++++++++++++----------
 block/monitor/block-hmp-cmds.c |  2 +-
 blockdev.c                     | 13 +++---
 include/block/block.h          | 14 ++++++
 include/block/block_int.h      |  5 +-
 5 files changed, 85 insertions(+), 33 deletions(-)

diff --git a/block.c b/block.c
index 7c22b31259..a3bc28cf32 100644
--- a/block.c
+++ b/block.c
@@ -3065,12 +3065,13 @@ out:
  * If @parent_bs and @child_bs are in different AioContexts, the caller must
  * hold the AioContext lock for @child_bs, but not for @parent_bs.
  */
-BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
-                             BlockDriverState *child_bs,
-                             const char *child_name,
-                             const BdrvChildClass *child_class,
-                             BdrvChildRole child_role,
-                             Error **errp)
+static BdrvChild *bdrv_do_attach_child(BlockDriverState *parent_bs,
+                                       BlockDriverState *child_bs,
+                                       const char *child_name,
+                                       const BdrvChildClass *child_class,
+                                       BdrvChildRole child_role,
+                                       bool refresh_perms,
+                                       Error **errp)
 {
     int ret;
     BdrvChild *child;
@@ -3082,9 +3083,11 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(parent_bs, tran, errp);
-    if (ret < 0) {
-        goto out;
+    if (refresh_perms) {
+        ret = bdrv_refresh_perms(parent_bs, tran, errp);
+        if (ret < 0) {
+            goto out;
+        }
     }
 
 out:
@@ -3095,6 +3098,17 @@ out:
     return ret < 0 ? NULL : child;
 }
 
+BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
+                             BlockDriverState *child_bs,
+                             const char *child_name,
+                             const BdrvChildClass *child_class,
+                             BdrvChildRole child_role,
+                             Error **errp)
+{
+    return bdrv_do_attach_child(parent_bs, child_bs, child_name, child_class,
+                                child_role, true, errp);
+}
+
 /* Caller is responsible to refresh permissions in @refresh_list */
 static void bdrv_root_unref_child_tran(BdrvChild *child, GSList **refresh_list,
                                        Transaction *tran)
@@ -3556,12 +3570,13 @@ done:
  *
  * The BlockdevRef will be removed from the options QDict.
  */
-BdrvChild *bdrv_open_child(const char *filename,
-                           QDict *options, const char *bdref_key,
-                           BlockDriverState *parent,
-                           const BdrvChildClass *child_class,
-                           BdrvChildRole child_role,
-                           bool allow_none, Error **errp)
+BdrvChild *bdrv_open_child_common(const char *filename,
+                                  QDict *options, const char *bdref_key,
+                                  BlockDriverState *parent,
+                                  const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
+                                  bool allow_none, bool refresh_perms,
+                                  Error **errp)
 {
     BlockDriverState *bs;
 
@@ -3571,16 +3586,29 @@ BdrvChild *bdrv_open_child(const char *filename,
         return NULL;
     }
 
-    return bdrv_attach_child(parent, bs, bdref_key, child_class, child_role,
-                             errp);
+    return bdrv_do_attach_child(parent, bs, bdref_key, child_class, child_role,
+                                refresh_perms, errp);
+}
+
+BdrvChild *bdrv_open_child(const char *filename,
+                           QDict *options, const char *bdref_key,
+                           BlockDriverState *parent,
+                           const BdrvChildClass *child_class,
+                           BdrvChildRole child_role,
+                           bool allow_none, Error **errp)
+{
+    return bdrv_open_child_common(filename, options, bdref_key, parent,
+                                  child_class, child_role, allow_none, true,
+                                  errp);
 }
 
 /*
  * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
  */
-int bdrv_open_file_child(const char *filename,
-                         QDict *options, const char *bdref_key,
-                         BlockDriverState *parent, Error **errp)
+int bdrv_open_file_child_common(const char *filename,
+                                QDict *options, const char *bdref_key,
+                                BlockDriverState *parent, bool refresh_perms,
+                                Error **errp)
 {
     BdrvChildRole role;
 
@@ -3589,8 +3617,9 @@ int bdrv_open_file_child(const char *filename,
     role = parent->drv->is_filter ?
         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
 
-    if (!bdrv_open_child(filename, options, bdref_key, parent,
-                         &child_of_bds, role, false, errp))
+    if (!bdrv_open_child_common(filename, options, bdref_key, parent,
+                                &child_of_bds, role, false, refresh_perms,
+                                errp))
     {
         return -EINVAL;
     }
@@ -3598,6 +3627,15 @@ int bdrv_open_file_child(const char *filename,
     return 0;
 }
 
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent,
+                         Error **errp)
+{
+    return bdrv_open_file_child_common(filename, options, bdref_key, parent,
+                                       true, errp);
+}
+
 /*
  * TODO Future callers may need to specify parent/child_class in order for
  * option inheritance to work. Existing callers use it for the root node.
@@ -6647,7 +6685,7 @@ void bdrv_unref_tran(BlockDriverState *bs, GSList **refresh_list,
 
     tran_add(tran, &bdrv_unref_drv, bs);
 
-    if (bs->drv && (!bs->drv->bdrv_close || bs->drv->indepenent_close) &&
+    if (bs->drv && (!bs->drv->bdrv_close || bs->drv->independent_close) &&
         refresh_list && bs->refcnt == 0)
     {
         QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index bfb3c043a0..9145ccfc46 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -76,7 +76,7 @@ static void hmp_drive_add_node(Monitor *mon, const char *optstr)
         goto out;
     }
 
-    BlockDriverState *bs = bds_tree_init(qdict, &local_err);
+    BlockDriverState *bs = bds_tree_init(qdict, 0, &local_err);
     if (!bs) {
         error_report_err(local_err);
         goto out;
diff --git a/blockdev.c b/blockdev.c
index 517be48399..3569b0e6ee 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -624,11 +624,10 @@ err_no_opts:
 }
 
 /* Takes the ownership of bs_opts */
-BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
+BlockDriverState *bds_tree_init(QDict *bs_opts, BdrvRequestFlags flags,
+                                Error **errp)
 {
-    int bdrv_flags = 0;
-
-    /* bdrv_open() defaults to the values in bdrv_flags (for compatibility
+    /* bdrv_open() defaults to the values in flags (for compatibility
      * with other callers) rather than what we want as the real defaults.
      * Apply the defaults here instead. */
     qdict_set_default_str(bs_opts, BDRV_OPT_CACHE_DIRECT, "off");
@@ -636,10 +635,10 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
     qdict_set_default_str(bs_opts, BDRV_OPT_READ_ONLY, "off");
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
-        bdrv_flags |= BDRV_O_INACTIVE;
+        flags |= BDRV_O_INACTIVE;
     }
 
-    return bdrv_open(NULL, NULL, bs_opts, bdrv_flags, errp);
+    return bdrv_open(NULL, NULL, bs_opts, flags, errp);
 }
 
 void blockdev_close_all_bdrv_states(void)
@@ -3449,7 +3448,7 @@ void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
         goto fail;
     }
 
-    bs = bds_tree_init(qdict, errp);
+    bs = bds_tree_init(qdict, 0, errp);
     if (!bs) {
         goto fail;
     }
diff --git a/include/block/block.h b/include/block/block.h
index 92fe31bd13..017bf9b7c0 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -123,6 +123,9 @@ typedef struct HDGeometry {
 #define BDRV_O_AUTO_RDONLY 0x20000 /* degrade to read-only if opening read-write fails */
 #define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the thread pool */
 
+#define BDRV_O_NOPERM      0x80000 /* Don't update permissions if possible,
+                                      open() caller will do that. */
+
 #define BDRV_O_CACHE_MASK  (BDRV_O_NOCACHE | BDRV_O_NO_FLUSH)
 
 
@@ -416,6 +419,17 @@ BdrvChild *bdrv_open_child(const char *filename,
                            const BdrvChildClass *child_class,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
+BdrvChild *bdrv_open_child_common(const char *filename,
+                                  QDict *options, const char *bdref_key,
+                                  BlockDriverState *parent,
+                                  const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
+                                  bool allow_none, bool refresh_perms,
+                                  Error **errp);
+int bdrv_open_file_child_common(const char *filename,
+                                QDict *options, const char *bdref_key,
+                                BlockDriverState *parent, bool refresh_perms,
+                                Error **errp);
 int bdrv_open_file_child(const char *filename,
                          QDict *options, const char *bdref_key,
                          BlockDriverState *parent, Error **errp);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index e2bb936451..f6deb89f23 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -178,7 +178,7 @@ struct BlockDriver {
      * and is safe to be called in commit phase of block-graph modifying
      * transaction.
      */
-    bool indepenent_close;
+    bool independent_close;
 
     /* For handling image reopen for split or non-split files */
     int (*bdrv_reopen_prepare)(BDRVReopenState *reopen_state,
@@ -1436,7 +1436,8 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
 int refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
 void bdrv_set_monitor_owned(BlockDriverState *bs);
-BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp);
+BlockDriverState *bds_tree_init(QDict *bs_opts, BdrvRequestFlags flags,
+                                Error **errp);
 
 /**
  * Simple implementation of bdrv_co_create_opts for protocol drivers
-- 
2.35.1


