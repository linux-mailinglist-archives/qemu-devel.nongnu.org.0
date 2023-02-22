Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D769FB92
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuIA-0006PU-2S; Wed, 22 Feb 2023 13:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUuI6-0006NG-Hl; Wed, 22 Feb 2023 13:56:34 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUuI4-0005AJ-U8; Wed, 22 Feb 2023 13:56:34 -0500
Received: from mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:2905:0:640:e5fe:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 430445FEC6;
 Wed, 22 Feb 2023 21:56:23 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a528::1:22])
 by mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id BuTfTE0KlSw0-5tRr5JXE; Wed, 22 Feb 2023 21:56:22 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-83.vla.yp-c.yandex.net;
 dkim=pass
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@yandex-team.ru, alexander.ivanov@virtuozzo.com
Subject: [PATCH v6 3/7] block: make bdrv_find_child() function public
Date: Wed, 22 Feb 2023 21:55:48 +0300
Message-Id: <20230222185552.913733-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222185552.913733-1-vsementsov@yandex-team.ru>
References: <20230222185552.913733-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To be reused soon for blockdev-replace functionality.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/block/block_int-io.h |  1 +
 block.c                      | 13 +++++++++++++
 blockdev.c                   | 14 --------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 4430bf4c4a..8f76a33c96 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -127,6 +127,7 @@ int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
 int co_wrapper_mixed
 bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name);
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs);
diff --git a/block.c b/block.c
index 0c807d15cd..c78de4d280 100644
--- a/block.c
+++ b/block.c
@@ -8005,6 +8005,19 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     return 0;
 }
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name)
+{
+    BdrvChild *child;
+
+    QLIST_FOREACH(child, &parent_bs->children, next) {
+        if (strcmp(child->name, child_name) == 0) {
+            return child;
+        }
+    }
+
+    return NULL;
+}
+
 /*
  * Return the child that @bs acts as an overlay for, and from which data may be
  * copied in COW or COR operations.  Usually this is the backing file.
diff --git a/blockdev.c b/blockdev.c
index d7b5c18f0a..461657edda 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3617,20 +3617,6 @@ out:
     aio_context_release(aio_context);
 }
 
-static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
-                                  const char *child_name)
-{
-    BdrvChild *child;
-
-    QLIST_FOREACH(child, &parent_bs->children, next) {
-        if (strcmp(child->name, child_name) == 0) {
-            return child;
-        }
-    }
-
-    return NULL;
-}
-
 void qmp_x_blockdev_change(const char *parent, const char *child,
                            const char *node, Error **errp)
 {
-- 
2.34.1


