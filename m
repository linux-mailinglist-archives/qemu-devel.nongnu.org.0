Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B73124AC5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 16:10:53 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihayR-0005DW-SI
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 10:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ad8564b204d39740fa1e8b1067389a006959ee6a@lizzy.crudebyte.com>)
 id 1ihaxE-0004Np-KN
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:09:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ad8564b204d39740fa1e8b1067389a006959ee6a@lizzy.crudebyte.com>)
 id 1ihaxD-0001i2-EW
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:09:36 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:51709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <ad8564b204d39740fa1e8b1067389a006959ee6a@lizzy.crudebyte.com>)
 id 1ihaxD-0003Tt-4t
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Subject:Date:Cc:To:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=PrslkhuesGKKMdjjO00pl3IBF8eqlXsPArsnSI4/mCw=; b=mDM26
 sRXzAy2xvhAaMbMUM5gV8ceKbIdRhCoHD0MH6QkSudJr9BERfZ2B775BFDHrFY17jiju3uGmfzSLr
 rq0r2jSogCql06HU2VMGxD7usjf63pLjWbB2iVp9E4V6h+HqcrBKpOYfH93orGlPe/z8Ejs6yVgaU
 YcFEFYEJfGAUW3vV+y5I1aV6AE9sKdkgBSJ8wsEPFyQfIpcP2Q2BUXlPu4f2zjslOXECT1HvpbzdR
 qZcmXfed3ZVTM1UVRlFTa1gUNhrM62FA3p57RmjlO5PnBpg2SV0v1itadMoK2jGx3896xkPCFTyMG
 0xXJDU+evbJ7E/H2tJW1lOtmDu6xw==;
Message-Id: <ad8564b204d39740fa1e8b1067389a006959ee6a.1576678644.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1576678644.git.qemu_oss@crudebyte.com>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Wed, 18 Dec 2019 14:52:03 +0100
Subject: [PATCH v2 7/9] hw/9pfs/9p-synth: avoid n-square issue in
 synth_readdir()
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
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

This patch is just a temporary benchmark hack, not intended
to be merged!

9pfs synth driver's readdir() implementation has a severe
n-square performance problem. This patch is a quick and dirty
hack to prevent that performance problem from tainting the
readdir() benchmark results. In its current form, this patch
is not useful for anything else than for an isolated readdir
benchmark.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 7eb210ffa8..54dc30f37b 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -225,7 +225,8 @@ static void synth_direntry(V9fsSynthNode *node,
 }
 
 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
-                                            struct dirent *entry, off_t off)
+                                       struct dirent *entry, off_t off,
+                                       V9fsSynthNode **hack)
 {
     int i = 0;
     V9fsSynthNode *node;
@@ -243,16 +244,38 @@ static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
         /* end of directory */
         return NULL;
     }
+    *hack = node;
     synth_direntry(node, entry, off);
     return entry;
 }
 
 static struct dirent *synth_readdir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    struct dirent *entry;
+    struct dirent *entry = NULL;
     V9fsSynthOpenState *synth_open = fs->private;
     V9fsSynthNode *node = synth_open->node;
-    entry = synth_get_dentry(node, &synth_open->dent, synth_open->offset);
+
+    /*
+     * HACK: This is just intended for benchmark, to avoid severe n-square
+     * performance problem of synth driver's readdir implementation here which
+     * would otherwise unncessarily taint the benchmark results. By simply
+     * caching (globally) the previous node (of the previous synth_readdir()
+     * call) we can simply proceed to next node in chained list efficiently.
+     *
+     * not a good idea for any production code ;-)
+     */
+    static struct V9fsSynthNode *cachedNode;
+
+    if (!cachedNode) {
+        entry = synth_get_dentry(node, &synth_open->dent, synth_open->offset,
+                                 &cachedNode);
+    } else {
+        cachedNode = cachedNode->sibling.le_next;
+        if (cachedNode) {
+            entry = &synth_open->dent;
+            synth_direntry(cachedNode, entry, synth_open->offset + 1);
+        }
+    }
     if (entry) {
         synth_open->offset++;
     }
-- 
2.20.1


