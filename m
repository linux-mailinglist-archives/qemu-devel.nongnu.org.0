Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D033D2FC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 12:27:32 +0100 (CET)
Received: from localhost ([::1]:56096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7rH-0002u4-EF
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 07:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e4fd889f51094a8e76274ca1e9e0ed70375166f0@lizzy.crudebyte.com>)
 id 1lM7pe-0002B3-4b
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:25:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e4fd889f51094a8e76274ca1e9e0ed70375166f0@lizzy.crudebyte.com>)
 id 1lM7pc-0005Hh-BZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=7CsDD69PwbqI+ESS67+lxfdSPQTaohMwtsnDvh737Vo=; b=WxqJe
 R/E9qwq4iBK0tmdBbY2KfMFByQftkCtAE0g66gYRy5r3hRwg56MJoUypQd1u8rWrRpUW6wsj4OCu+
 rC856knouFoYlPx9JxgYqQ7HP/oJIuZ3kvGUqv5uvtQf7+qU+JVNdZmDDm+rd1ULqf5pR/EQwQVXU
 Y8DzZqp3JRIdlGXMfmO+Guu4A8fwYtvwJw7ASFL0qK+uwzA6/PFhIj+97C8grkOAT19U9WGXIeVSp
 Zs8JuBXcUi+xjwUu+dt5aIJwCy9CQf/cczHbsEkI8m1z+M9TKDLK0CVr1T6aQ4D9etc4oPhbUr8c6
 lWiRFzEku8ycs04NNRTJpJtSJ4rsg==;
Message-Id: <e4fd889f51094a8e76274ca1e9e0ed70375166f0.1615891769.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1615891769.git.qemu_oss@crudebyte.com>
References: <cover.1615891769.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 16 Mar 2021 11:49:29 +0100
Subject: [PULL 1/1] hw/9pfs/9p-synth: Replaced qemu_mutex_lock with
 QEMU_LOCK_GUARD
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Mahmoud Mandour <ma.mandourr@gmail.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e4fd889f51094a8e76274ca1e9e0ed70375166f0@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Replaced a call to qemu_mutex_lock and its respective call to
qemu_mutex_unlock and used QEMU_LOCK_GUARD macro in their place.
This simplifies the code by removing the call required to unlock
and also eliminates goto paths.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Acked-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210311031538.5325-9-ma.mandourr@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 7eb210ffa8..473ef914b0 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -79,11 +79,11 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
     if (!parent) {
         parent = &synth_root;
     }
-    qemu_mutex_lock(&synth_mutex);
+    QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
             ret = EEXIST;
-            goto err_out;
+            return ret;
         }
     }
     /* Add the name */
@@ -94,8 +94,6 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
                       node->attr, node->attr->inode);
     *result = node;
     ret = 0;
-err_out:
-    qemu_mutex_unlock(&synth_mutex);
     return ret;
 }
 
@@ -116,11 +114,11 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
         parent = &synth_root;
     }
 
-    qemu_mutex_lock(&synth_mutex);
+    QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
             ret = EEXIST;
-            goto err_out;
+            return ret;
         }
     }
     /* Add file type and remove write bits */
@@ -136,8 +134,6 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     pstrcpy(node->name, sizeof(node->name), name);
     QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
     ret = 0;
-err_out:
-    qemu_mutex_unlock(&synth_mutex);
     return ret;
 }
 
-- 
2.20.1


