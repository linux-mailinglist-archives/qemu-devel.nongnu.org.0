Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8881123BAF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 01:37:51 +0100 (CET)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihNLa-0004aV-RP
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 19:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46637)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <3ece7b359059bc882879d46eb8afe07466ae67ea@lizzy.crudebyte.com>)
 id 1ihNIN-0002nn-5K
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:34:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <3ece7b359059bc882879d46eb8afe07466ae67ea@lizzy.crudebyte.com>)
 id 1ihNIM-0002tA-3F
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:34:31 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:50165)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <3ece7b359059bc882879d46eb8afe07466ae67ea@lizzy.crudebyte.com>)
 id 1ihNIL-0001df-Sw
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Subject:Date:Cc:To:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=uy5WfovVqaMKSoia8+lCPvhLlHffgTGEIc4twNM9E+g=; b=Tx5Sy
 +y0LtrUST8804Xp20p2feZY/ctHH37qojLDCyn0+GigXZx347cQ4CvVOLIWIXol98VsIXTzVSuyLz
 FVNNXTF9RqJzIsnNH076YYE9EvosVrFp2sms1+u94hNtzGuiNjaqz6ZmYUO3uwiiGqwADQ9kNkdbN
 CggZs3pHjvE36Fk6zG7DZO+n01jifwE+qvrWtkVHoppaH1sEJR6NmKIaM4tzwfyhUHMwy1ZSTzBjU
 FjHUXi7J76TvHW5umafI8dsDaWNC9ooFdngvxxH4SF8pTLQIqK5tFM13eyE9sgC6rq6eCbSXw7vIm
 twephKd8hteK9v/8GXRTsYpBMmZ9w==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Tue, 17 Dec 2019 22:25:19 +0100
Subject: [PATCH 7/9] hw/9pfs/9p-synth: avoid n-square issue in synth_readdir()
Message-Id: <E1ihMvK-00078S-A1@lizzy.crudebyte.com>
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

synth driver's readdir() implementation has a severe n-square
performance problem. This patch is a quick and dirty hack to
prevent that performance problem from tainting the readdir()
benchmark results.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 7eb210ffa8..1743f5409f 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -225,7 +225,7 @@ static void synth_direntry(V9fsSynthNode *node,
 }
 
 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
-                                            struct dirent *entry, off_t off)
+                                            struct dirent *entry, off_t off, V9fsSynthNode **hack)
 {
     int i = 0;
     V9fsSynthNode *node;
@@ -243,16 +243,37 @@ static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
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
+    static struct V9fsSynthNode *cachedNode = NULL;
+
+    if (!cachedNode) {
+        entry = synth_get_dentry(node, &synth_open->dent, synth_open->offset, &cachedNode);
+    } else {
+        cachedNode = cachedNode->sibling.le_next;
+        if (cachedNode) {
+            entry = &synth_open->dent;
+            synth_direntry(cachedNode, entry, synth_open->offset+1);
+        }
+    }
     if (entry) {
         synth_open->offset++;
     }
-- 
2.20.1


