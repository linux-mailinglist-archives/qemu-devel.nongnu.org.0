Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FA231C47
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 11:47:59 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0igo-0000s9-Rb
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 05:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3668ebc7d5b929a0e4f1357457060d96f50f76f4@lizzy.crudebyte.com>)
 id 1k0ig6-0000SN-7q
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:47:14 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3668ebc7d5b929a0e4f1357457060d96f50f76f4@lizzy.crudebyte.com>)
 id 1k0ig4-0004fF-Dq
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=pDF58CzzyVkxh+s3PWVUovZOObDqLn6VfIrB7HCsOew=; b=CUqnO
 LRUhkWQymNUW8VSb/901f3JO8nGI3NWAtfnHlfDqCSwxvURds4uwnAMvsSEyU8lBxqkUttKqNy1dj
 Squ4K6iKN+ap/CDy4uk+tkvVjTr3K7d0RSAaT70F4tYK9uA18NJpp2YtLVmW/ZtWVrtGX8JXCNccY
 G+hHmzY/KrhMM8yTUZjk928MGvR2Jk1L6Alh/mUz0KLShOrsS1rNNQW5daHAZKjB6v5v1WBwILpdo
 KUr3E4tFZpN++x5WqNQOgsWIqa4IPyKxvLPoI+BKMQ1jamhGPT6JlHv8KVn5uYix8pDlHjNNudSv7
 XMtSZFellsa+Vbej+rLCav5jr/Q3g==;
Message-Id: <3668ebc7d5b929a0e4f1357457060d96f50f76f4.1596012787.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1596012787.git.qemu_oss@crudebyte.com>
References: <cover.1596012787.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 29 Jul 2020 10:11:15 +0200
Subject: [PATCH v8 2/7] 9pfs: make v9fs_readdir_response_size() public
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3668ebc7d5b929a0e4f1357457060d96f50f76f4@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 05:20:03
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Rename function v9fs_readdir_data_size() -> v9fs_readdir_response_size()
and make it callable from other units. So far this function is only
used by 9p.c, however subsequent patches require the function to be
callable from another 9pfs unit. And as we're at it; also make it clear
for what this function is used for.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 10 ++++++++--
 hw/9pfs/9p.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2ffd96ade9..7a228c4828 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2313,7 +2313,13 @@ out_nofid:
     pdu_complete(pdu, err);
 }
 
-static size_t v9fs_readdir_data_size(V9fsString *name)
+/**
+ * Returns size required in Rreaddir response for the passed dirent @p name.
+ *
+ * @param name - directory entry's name (i.e. file name, directory name)
+ * @returns required size in bytes
+ */
+size_t v9fs_readdir_response_size(V9fsString *name)
 {
     /*
      * Size of each dirent on the wire: size of qid (13) + size of offset (8)
@@ -2348,7 +2354,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
         }
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
-        if ((count + v9fs_readdir_data_size(&name)) > max_count) {
+        if ((count + v9fs_readdir_response_size(&name)) > max_count) {
             v9fs_readdir_unlock(&fidp->fs.dir);
 
             /* Ran out of buffer. Set dir back to old position and return */
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index ee2271663c..561774e843 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -419,6 +419,7 @@ void v9fs_path_init(V9fsPath *path);
 void v9fs_path_free(V9fsPath *path);
 void v9fs_path_sprintf(V9fsPath *path, const char *fmt, ...);
 void v9fs_path_copy(V9fsPath *dst, const V9fsPath *src);
+size_t v9fs_readdir_response_size(V9fsString *name);
 int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,
                       const char *name, V9fsPath *path);
 int v9fs_device_realize_common(V9fsState *s, const V9fsTransport *t,
-- 
2.20.1


