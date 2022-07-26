Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53489581B0C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:28:11 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRA2-0001me-CA
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQuk-0001Jt-4f; Tue, 26 Jul 2022 16:12:23 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:47792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQui-0001Hh-1Z; Tue, 26 Jul 2022 16:12:21 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3CE1B2E1C6A;
 Tue, 26 Jul 2022 23:12:11 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-CAO0JcVS; Tue, 26 Jul 2022 23:12:10 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866330; bh=sPtLArjWYB88od/2JdIUzS/SuNMzIlHO8CijWViWhOE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=Ix4syYO3KK+qnVJ9u6lvoZJ1ZxNNoa8xjRINZCkEnJYL60VZjLZn/JjvRk7GcJN3l
 0UeGNhVhO8MZXCNU8OP2aDMpowZwO6ldyEcTBsgQUcThNvNixNKIVIYcgxOO2sf0ZX
 0MACpX1+r0dfeaoKOmHNiZD1voUH2Pd8M9BU77tk=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 14/15] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Date: Tue, 26 Jul 2022 23:11:33 +0300
Message-Id: <20220726201134.924743-15-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Now the indirection is not actually used, we can safely reduce it to
simple pointer. For consistency do a bit of refactoring to get rid of
_ptr suffixes that become meaningless.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/snapshot.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index f3971ac2bd..e22ac3eac6 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -151,34 +151,29 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 }
 
 /**
- * Return a pointer to the child BDS pointer to which we can fall
+ * Return a pointer to child of given BDS to which we can fall
  * back if the given BDS does not support snapshots.
  * Return NULL if there is no BDS to (safely) fall back to.
- *
- * We need to return an indirect pointer because bdrv_snapshot_goto()
- * has to modify the BdrvChild pointer.
  */
-static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
+static BdrvChild *bdrv_snapshot_fallback_child(BlockDriverState *bs)
 {
-    BdrvChild **fallback;
-    BdrvChild *child = bdrv_primary_child(bs);
+    BdrvChild *fallback = bdrv_primary_child(bs);
+    BdrvChild *child;
 
     /* We allow fallback only to primary child */
-    if (!child) {
+    if (!fallback) {
         return NULL;
     }
-    fallback = (child == bs->file ? &bs->file : &bs->backing);
-    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
      * snapshotted.  If there are, it is not safe to fall back to
-     * *fallback.
+     * fallback.
      */
     QLIST_FOREACH(child, &bs->children, next) {
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED) &&
-            child != *fallback)
+            child != fallback)
         {
             return NULL;
         }
@@ -189,8 +184,7 @@ static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 
 static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
 {
-    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);
-    return child_ptr ? (*child_ptr)->bs : NULL;
+    return child_bs(bdrv_snapshot_fallback_child(bs));
 }
 
 int bdrv_can_snapshot(BlockDriverState *bs)
@@ -237,7 +231,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
                        Error **errp)
 {
     BlockDriver *drv = bs->drv;
-    BdrvChild **fallback_ptr;
+    BdrvChild *fallback;
     int ret, open_ret;
 
     GLOBAL_STATE_CODE();
@@ -260,13 +254,13 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         return ret;
     }
 
-    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
-    if (fallback_ptr) {
+    fallback = bdrv_snapshot_fallback_child(bs);
+    if (fallback) {
         QDict *options;
         QDict *file_options;
         Error *local_err = NULL;
-        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
-        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
+        BlockDriverState *fallback_bs = fallback->bs;
+        char *subqdict_prefix = g_strdup_printf("%s.", fallback->name);
 
         options = qdict_clone_shallow(bs->options);
 
@@ -277,8 +271,8 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         qobject_unref(file_options);
         g_free(subqdict_prefix);
 
-        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
-        qdict_put_str(options, (*fallback_ptr)->name,
+        /* Force .bdrv_open() below to re-attach fallback_bs on fallback */
+        qdict_put_str(options, fallback->name,
                       bdrv_get_node_name(fallback_bs));
 
         /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
@@ -287,7 +281,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /* .bdrv_open() will re-attach it */
-        bdrv_unref_child(bs, *fallback_ptr);
+        bdrv_unref_child(bs, fallback);
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
-- 
2.25.1


