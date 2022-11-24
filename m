Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9D637D68
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEcl-0002MG-49; Thu, 24 Nov 2022 10:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oyEci-0002Lc-QA
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:58:48 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oyEch-0005FI-AD
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:58:48 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-PIs4i3LhMtWl0DfxrfcYNg-1; Thu, 24 Nov 2022 10:58:42 -0500
X-MC-Unique: PIs4i3LhMtWl0DfxrfcYNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8B19811E67;
 Thu, 24 Nov 2022 15:58:41 +0000 (UTC)
Received: from [192.168.122.1] (unknown [10.39.194.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0003F492B04;
 Thu, 24 Nov 2022 15:58:40 +0000 (UTC)
Subject: [PATCH] 9pfs: Fix some return statements in the synth backend
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>, Markus Armbruster <armbru@redhat.com>
Date: Thu, 24 Nov 2022 16:58:38 +0100
Message-ID: <166930551818.827792.10663674346122681963.stgit@bahia>
User-Agent: StGit/1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

The qemu_v9fs_synth_mkdir() and qemu_v9fs_synth_add_file() functions
currently return a positive errno value on failure. This causes
checkpatch.pl to spit several errors like the one below:

ERROR: return of an errno should typically be -ve (return -EAGAIN)
#79: FILE: hw/9pfs/9p-synth.c:79:
+        return EAGAIN;

Simply change the sign. This has no consequence since callers
assert() the returned value to be equal to 0.

While here also get rid of the uneeded ret variables as suggested
by return_directly.cocci.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p-synth.c |   22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 1c5813e4ddc6..f62c40b639fc 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -72,14 +72,13 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *parent, int mode,
 int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
                           const char *name, V9fsSynthNode **result)
 {
-    int ret;
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
@@ -87,8 +86,7 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
     QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
-            ret = EEXIST;
-            return ret;
+            return -EEXIST;
         }
     }
     /* Add the name */
@@ -98,22 +96,20 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
     v9fs_add_dir_node(node, node->attr->mode, ".",
                       node->attr, node->attr->inode);
     *result = node;
-    ret = 0;
-    return ret;
+    return 0;
 }
 
 int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
                              const char *name, v9fs_synth_read read,
                              v9fs_synth_write write, void *arg)
 {
-    int ret;
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
@@ -122,8 +118,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     QEMU_LOCK_GUARD(&synth_mutex);
     QLIST_FOREACH(tmp, &parent->child, sibling) {
         if (!strcmp(tmp->name, name)) {
-            ret = EEXIST;
-            return ret;
+            return -EEXIST;
         }
     }
     /* Add file type and remove write bits */
@@ -138,8 +133,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     node->private      = arg;
     pstrcpy(node->name, sizeof(node->name), name);
     QLIST_INSERT_HEAD_RCU(&parent->child, node, sibling);
-    ret = 0;
-    return ret;
+    return 0;
 }
 
 static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)



