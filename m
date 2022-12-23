Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A24654F85
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fzP-0007dv-RD; Fri, 23 Dec 2022 06:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ab04d2c5579f706893aa014b04296249a0ae8587@lizzy.crudebyte.com>)
 id 1p8fzO-0007dm-5k
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:22 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ab04d2c5579f706893aa014b04296249a0ae8587@lizzy.crudebyte.com>)
 id 1p8fzM-0007bP-N1
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=xwV+HN3oQ1EntEdzFNX0YcAZFhmVP4Q4CcsGo2vF6Fk=; b=JIIfQ
 DkcCWNPkVAIAqS9GBH+YmxjgAPug58XFwuQ7OyKWfZHnCQL1LKAXC9hmdLKZgr6kLTaZCnTCJeCTd
 5BOhORyRTcIQlKOUPnwpXA+ecB/gbQLDiBRDaALWpFFsbR2RGwOawV8l3rEHAH8lgLi8qLpnL2n1E
 9GKWgK19DVPr5MaBybBT3LpA0yz2iWL9+dWnffgTaAds2AH9YwHft2A8NKLLQkQQ8rEKi+6AI1lav
 IvcCk1ok3Xy5Cv+kFvJXeSsfj/05aTLhUjUvwvf/h8xjUd/wfSqpXuR/zybs9IsU7zgqj8cAViezv
 hfok4YKuCvVjiIa4iiDSb7zds4ryg==;
Message-Id: <ab04d2c5579f706893aa014b04296249a0ae8587.1671793476.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1671793476.git.qemu_oss@crudebyte.com>
References: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Dec 2022 12:04:36 +0100
Subject: [PULL 1/5] 9pfs: Fix some return statements in the synth backend
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Markus Armbruster <armbru@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=ab04d2c5579f706893aa014b04296249a0ae8587@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Greg Kurz <groug@kaod.org>

The qemu_v9fs_synth_mkdir() and qemu_v9fs_synth_add_file() functions
currently return a positive errno value on failure. This causes
checkpatch.pl to spit several errors like the one below:

ERROR: return of an errno should typically be -ve (return -EAGAIN)
+        return EAGAIN;

Simply change the sign. This has no consequence since callers
assert() the returned value to be equal to 0.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <166930551818.827792.10663674346122681963.stgit@bahia>
[C.S.: - Resolve conflict with 66997c42e02c. ]
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 38d787f494..f62c40b639 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -75,10 +75,10 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
     V9fsSynthNode *node, *tmp;
 
     if (!synth_fs) {
-        return EAGAIN;
+        return -EAGAIN;
     }
     if (!name || (strlen(name) >= NAME_MAX)) {
-        return EINVAL;
+        return -EINVAL;
     }
     if (!parent) {
         parent = &synth_root;
@@ -86,7 +86,7 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
     QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
-            return EEXIST;
+            return -EEXIST;
         }
     }
     /* Add the name */
@@ -106,10 +106,10 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     V9fsSynthNode *node, *tmp;
 
     if (!synth_fs) {
-        return EAGAIN;
+        return -EAGAIN;
     }
     if (!name || (strlen(name) >= NAME_MAX)) {
-        return EINVAL;
+        return -EINVAL;
     }
     if (!parent) {
         parent = &synth_root;
@@ -118,7 +118,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
-            return EEXIST;
+            return -EEXIST;
         }
     }
     /* Add file type and remove write bits */
-- 
2.30.2


