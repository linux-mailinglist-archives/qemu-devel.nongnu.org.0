Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE474ED066
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:49:31 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi4A-0002FX-G8
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:49:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft7-0008H6-1O
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:58 -0400
Received: from [2a00:1450:4864:20::135] (port=33460
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft1-0003LI-7i
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:55 -0400
Received: by mail-lf1-x135.google.com with SMTP id bu29so38190759lfb.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dT//zpD4OQYcrz77bj65eT/9EO5/UoXOs9WdzVqQr9U=;
 b=px0jlK1Zp5Gn3Bl5r8B1k8dmwIGZs6F+SoHKlF2Quuu1JCpyzjl5ezUv8Lo0rAsqQr
 DptXJXFLiVfMVD2U/mANBO0g916aOK98AI0ZO90/zLSQD3UEawoZfJBg+ltk4hGfAEYc
 byCxtNLnR0JrxEKQISZr3MumGLm8Y4rVKVWNXVVONQ2YVBiRd2ikgNNhl5FZ8omgsrDf
 Dc57qRyTgx2SU7ULvrtatks+EyG5Ha5KHf6th5D/LhH//2bvNXY28qm2/xKxh0ZLOV+D
 M9JFubsfBZNwQe+BESEPr2f/mmeJkFJWh9703seGnkJNX3b3Idybkgge7n7UMWL3MuQy
 yKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dT//zpD4OQYcrz77bj65eT/9EO5/UoXOs9WdzVqQr9U=;
 b=oc1S6WRHUvhWxbLM/VbMqnzb45VwqGIkWn/ApkNam+B6Ph9W70KibkYlrDVy282Ren
 iW0fjWRy7K00Ng9a/8fO+Rq+dZa09G3Cj063VDWYf9butY8Irv/B0uTUdzCELBJAVuDY
 TQ85titzssOETmZZhtcYS917vtWSEz8b5OSjPEKwB2TYurHCRUdL4/Eebw95/60/EVbs
 QD1dmoV5xnjezupND3Cm2oNfeB22A9yDhEz7/uKAhb/VPSCu77eAehUliDO/Z67d66GM
 PrZ+w8GIDmN5vEchZ5W67O48Z7vJCCBiDt15Cf1HLM6Y7mGiyeg8gYrtOJBVFcjGBc+P
 LZMg==
X-Gm-Message-State: AOAM533532Xwe7OPHrwJoUM2QHhHPNJRcRO2BPdw8ZDbZAlJb0rjjcOW
 5kQr0qmvliNRsiHbS/uKKAplPw==
X-Google-Smtp-Source: ABdhPJzQdQHLNM7vvXUflVnKHxKVbGMhIz7I7EkV40WWh40hCHcNUA6AsQ6xKL0ahuYodxTYZd+TRw==
X-Received: by 2002:a05:6512:1051:b0:44a:5dcb:3a74 with SMTP id
 c17-20020a056512105100b0044a5dcb3a74mr8344192lfb.51.1648675789571; 
 Wed, 30 Mar 2022 14:29:49 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:49 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 29/45] block: introduce BDRV_O_NOPERM flag
Date: Thu, 31 Mar 2022 00:28:46 +0300
Message-Id: <20220330212902.590099-30-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                                | 82 +++++++++++++++++++-------
 block/monitor/block-hmp-cmds.c         |  2 +-
 blockdev.c                             | 13 ++--
 include/block/block-common.h           |  3 +
 include/block/block-global-state.h     | 11 ++++
 include/block/block_int-global-state.h |  3 +-
 6 files changed, 83 insertions(+), 31 deletions(-)

diff --git a/block.c b/block.c
index a7020d3cd8..ca0b629bec 100644
--- a/block.c
+++ b/block.c
@@ -3166,12 +3166,13 @@ out:
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
@@ -3185,9 +3186,11 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
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
@@ -3198,6 +3201,17 @@ out:
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
@@ -3668,12 +3682,13 @@ done:
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
 
@@ -3685,16 +3700,29 @@ BdrvChild *bdrv_open_child(const char *filename,
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
 
@@ -3703,8 +3731,9 @@ int bdrv_open_file_child(const char *filename,
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
@@ -3712,6 +3741,15 @@ int bdrv_open_file_child(const char *filename,
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
index 1cd95f4f02..16a9b98afc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -643,12 +643,11 @@ err_no_opts:
 }
 
 /* Takes the ownership of bs_opts */
-BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
+BlockDriverState *bds_tree_init(QDict *bs_opts, BdrvRequestFlags flags,
+                                Error **errp)
 {
-    int bdrv_flags = 0;
-
     GLOBAL_STATE_CODE();
-    /* bdrv_open() defaults to the values in bdrv_flags (for compatibility
+    /* bdrv_open() defaults to the values in flags (for compatibility
      * with other callers) rather than what we want as the real defaults.
      * Apply the defaults here instead. */
     qdict_set_default_str(bs_opts, BDRV_OPT_CACHE_DIRECT, "off");
@@ -656,10 +655,10 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
     qdict_set_default_str(bs_opts, BDRV_OPT_READ_ONLY, "off");
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
-        bdrv_flags |= BDRV_O_INACTIVE;
+        flags |= BDRV_O_INACTIVE;
     }
 
-    return bdrv_open(NULL, NULL, bs_opts, bdrv_flags, errp);
+    return bdrv_open(NULL, NULL, bs_opts, flags, errp);
 }
 
 void blockdev_close_all_bdrv_states(void)
@@ -3473,7 +3472,7 @@ void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
         goto fail;
     }
 
-    bs = bds_tree_init(qdict, errp);
+    bs = bds_tree_init(qdict, 0, errp);
     if (!bs) {
         goto fail;
     }
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 2f247dd607..face2d62d0 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -145,6 +145,9 @@ typedef enum {
                                       read-write fails */
 #define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the thread pool */
 
+#define BDRV_O_NOPERM      0x80000 /* Don't update permissions if possible,
+                                      open() caller will do that. */
+
 #define BDRV_O_CACHE_MASK  (BDRV_O_NOCACHE | BDRV_O_NO_FLUSH)
 
 
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index f3ec72810e..8527bcad28 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -76,6 +76,17 @@ BdrvChild *bdrv_open_child(const char *filename,
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
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 0f21b0570b..aed62a45d9 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -245,7 +245,8 @@ void bdrv_set_monitor_owned(BlockDriverState *bs);
 
 void blockdev_close_all_bdrv_states(void);
 
-BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp);
+BlockDriverState *bds_tree_init(QDict *bs_opts, BdrvRequestFlags flags,
+                                Error **errp);
 
 /**
  * Simple implementation of bdrv_co_create_opts for protocol drivers
-- 
2.35.1


