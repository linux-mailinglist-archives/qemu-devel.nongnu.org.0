Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787401CFB91
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 19:04:42 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYYKf-0002Z0-GZ
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 13:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7l-0005QQ-Jt; Tue, 12 May 2020 12:51:21 -0400
Received: from relay.sw.ru ([185.231.240.75]:50560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7j-0001RF-4S; Tue, 12 May 2020 12:51:21 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYY7D-0004nT-1o; Tue, 12 May 2020 19:50:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 08/15] block: Use CAFs when working with backing chains
Date: Tue, 12 May 2020 19:50:38 +0300
Message-Id: <1589302245-893269-9-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589302245-893269-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1589302245-893269-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 10:53:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Use child access functions when iterating through backing chains so
filters do not break the chain.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 459412e..69e9152 100644
--- a/block.c
+++ b/block.c
@@ -4593,7 +4593,8 @@ int bdrv_change_backing_file(BlockDriverState *bs,
 }
 
 /*
- * Finds the image layer in the chain that has 'bs' as its backing file.
+ * Finds the image layer in the chain that has 'bs' (or a filter on
+ * top of it) as its backing file.
  *
  * active is the current topmost image.
  *
@@ -4605,11 +4606,18 @@ int bdrv_change_backing_file(BlockDriverState *bs,
 BlockDriverState *bdrv_find_overlay(BlockDriverState *active,
                                     BlockDriverState *bs)
 {
-    while (active && bs != backing_bs(active)) {
-        active = backing_bs(active);
+    bs = bdrv_skip_rw_filters(bs);
+    active = bdrv_skip_rw_filters(active);
+
+    while (active) {
+        BlockDriverState *next = bdrv_backing_chain_next(active);
+        if (bs == next) {
+            return active;
+        }
+        active = next;
     }
 
-    return active;
+    return NULL;
 }
 
 /* Given a BDS, searches for the base layer. */
@@ -4761,9 +4769,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
      * other intermediate nodes have been dropped.
      * If 'top' is an implicit node (e.g. "commit_top") we should skip
      * it because no one inherits from it. We use explicit_top for that. */
-    while (explicit_top && explicit_top->implicit) {
-        explicit_top = backing_bs(explicit_top);
-    }
+    explicit_top = bdrv_skip_implicit_filters(explicit_top);
     update_inherits_from = bdrv_inherits_from_recursive(base, explicit_top);
 
     /* success - we can delete the intermediate states, and link top->base */
@@ -5205,7 +5211,7 @@ BlockDriverState *bdrv_lookup_bs(const char *device,
 bool bdrv_chain_contains(BlockDriverState *top, BlockDriverState *base)
 {
     while (top && top != base) {
-        top = backing_bs(top);
+        top = bdrv_filtered_bs(top);
     }
 
     return top != NULL;
@@ -5466,7 +5472,17 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
 
     is_protocol = path_has_protocol(backing_file);
 
-    for (curr_bs = bs; curr_bs->backing; curr_bs = curr_bs->backing->bs) {
+    /*
+     * Being largely a legacy function, skip any filters here
+     * (because filters do not have normal filenames, so they cannot
+     * match anyway; and allowing json:{} filenames is a bit out of
+     * scope).
+     */
+    for (curr_bs = bdrv_skip_rw_filters(bs);
+         bdrv_filtered_cow_child(curr_bs) != NULL;
+         curr_bs = bdrv_backing_chain_next(curr_bs))
+    {
+        BlockDriverState *bs_below = bdrv_backing_chain_next(curr_bs);
 
         /* If either of the filename paths is actually a protocol, then
          * compare unmodified paths; otherwise make paths relative */
@@ -5474,7 +5490,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
             char *backing_file_full_ret;
 
             if (strcmp(backing_file, curr_bs->backing_file) == 0) {
-                retval = curr_bs->backing->bs;
+                retval = bs_below;
                 break;
             }
             /* Also check against the full backing filename for the image */
@@ -5484,7 +5500,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
                 bool equal = strcmp(backing_file, backing_file_full_ret) == 0;
                 g_free(backing_file_full_ret);
                 if (equal) {
-                    retval = curr_bs->backing->bs;
+                    retval = bs_below;
                     break;
                 }
             }
@@ -5510,7 +5526,7 @@ BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
             g_free(filename_tmp);
 
             if (strcmp(backing_file_full, filename_full) == 0) {
-                retval = curr_bs->backing->bs;
+                retval = bs_below;
                 break;
             }
         }
-- 
1.8.3.1


