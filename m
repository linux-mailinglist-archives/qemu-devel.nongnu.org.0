Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB16EA979
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:42:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppp91-0006pf-Nz; Fri, 21 Apr 2023 07:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8t-0006jx-0z; Fri, 21 Apr 2023 07:41:31 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppp8p-0001FF-Fu; Fri, 21 Apr 2023 07:41:30 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 8B31161968;
 Fri, 21 Apr 2023 14:41:19 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 3fdrVT1OnCg0-QHk5X2C9; Fri, 21 Apr 2023 14:41:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682077278; bh=BZSFW4d7itr58ixETZgsDpAM1CwhQD8/BSwlpj19vGc=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=BdiOV3PburGvlRcAKl/sje69iVmQL2cVrfNjT/V+LqcN2TDgzdweNeQkeWdBnn62m
 hcQT62jhOEJYvHCr6JpRlC7ta3mANgOP4R8aEoM1Huz6bVYsfZcqmkipCNf+FuTqIN
 dYfanEJSw1f9W1vU/pQdAdmyKO6dOLXHlAJdlihE=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 alexander.ivanov@virtuozzo.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v7 3/7] block: make bdrv_find_child() function public
Date: Fri, 21 Apr 2023 14:40:58 +0300
Message-Id: <20230421114102.884457-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421114102.884457-1-vsementsov@yandex-team.ru>
References: <20230421114102.884457-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 block.c                      | 13 +++++++++++++
 blockdev.c                   | 14 --------------
 include/block/block_int-io.h |  1 +
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index d79a52ca74..e2cc686074 100644
--- a/block.c
+++ b/block.c
@@ -8027,6 +8027,19 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
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
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index eb0da7232e..aecf7f0929 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -130,6 +130,7 @@ bdrv_co_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 int co_wrapper_mixed_bdrv_rdlock
 bdrv_refresh_total_sectors(BlockDriverState *bs, int64_t hint);
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name);
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs);
-- 
2.34.1


