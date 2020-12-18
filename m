Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DF42DE64E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:16:00 +0100 (CET)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHU7-0003Yx-HS
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRH-0001Lv-4b
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRC-0005Db-3e
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igkvQViNUbm07x9rI3jrUrfsKmNw2U3xx27aMs6S8Xo=;
 b=aQZoB6ozK+TUA9yRIg4x7clsD/cJ2Uc4uNdxHuo94aXt0iN9kEqBLlHAmkt81Y5gqTNM5t
 Q+QVWqzo5z25Q+wzqu6ZdVQWvwogegrRmsXaX6KQmSdwOqYt1xbj2pQioj7orHktacTiLV
 SFVfrUfWvu2MYCUVQxrHaL8Wc+qrSsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-ZgmCsDH9Muy1Q6nhaSmVQw-1; Fri, 18 Dec 2020 10:12:54 -0500
X-MC-Unique: ZgmCsDH9Muy1Q6nhaSmVQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6992E801817;
 Fri, 18 Dec 2020 15:12:53 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079AB2C161;
 Fri, 18 Dec 2020 15:12:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/30] block: add bdrv_refresh_perms() helper
Date: Fri, 18 Dec 2020 16:12:20 +0100
Message-Id: <20201218151249.715731-2-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Make separate function for common pattern.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201106124241.16950-5-vsementsov@virtuozzo.com>
[mreitz: Squashed in
https://lists.nongnu.org/archive/html/qemu-block/2020-11/msg00299.html]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 61 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/block.c b/block.c
index 8f177504d4..3a07693608 100644
--- a/block.c
+++ b/block.c
@@ -2327,6 +2327,24 @@ static void bdrv_child_abort_perm_update(BdrvChild *c)
     bdrv_abort_perm_update(c->bs);
 }
 
+static int bdrv_refresh_perms(BlockDriverState *bs, bool *tighten_restrictions,
+                              Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
+    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL,
+                          tighten_restrictions, errp);
+    if (ret < 0) {
+        bdrv_abort_perm_update(bs);
+        return ret;
+    }
+    bdrv_set_perm(bs, perm, shared_perm);
+
+    return 0;
+}
+
 int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
                             Error **errp)
 {
@@ -2642,22 +2660,15 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 
     if (old_bs) {
-        /* Update permissions for old node. This is guaranteed to succeed
-         * because we're just taking a parent away, so we're loosening
-         * restrictions. */
         bool tighten_restrictions;
-        int ret;
 
-        bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
-        ret = bdrv_check_perm(old_bs, NULL, perm, shared_perm, NULL,
-                              &tighten_restrictions, NULL);
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(old_bs, &tighten_restrictions, NULL);
         assert(tighten_restrictions == false);
-        if (ret < 0) {
-            /* We only tried to loosen restrictions, so errors are not fatal */
-            bdrv_abort_perm_update(old_bs);
-        } else {
-            bdrv_set_perm(old_bs, perm, shared_perm);
-        }
 
         /* When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext */
@@ -5781,7 +5792,6 @@ void bdrv_init_with_whitelist(void)
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *child, *parent;
-    uint64_t perm, shared_perm;
     Error *local_err = NULL;
     int ret;
     BdrvDirtyBitmap *bm;
@@ -5813,14 +5823,11 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-        ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, NULL, errp);
+        ret = bdrv_refresh_perms(bs, NULL, errp);
         if (ret < 0) {
-            bdrv_abort_perm_update(bs);
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
         }
-        bdrv_set_perm(bs, perm, shared_perm);
 
         if (bs->drv->bdrv_co_invalidate_cache) {
             bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
@@ -5896,7 +5903,6 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
     bool tighten_restrictions;
-    uint64_t perm, shared_perm;
     int ret;
 
     if (!bs->drv) {
@@ -5930,18 +5936,13 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
 
     bs->open_flags |= BDRV_O_INACTIVE;
 
-    /* Update permissions, they may differ for inactive nodes */
-    bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
-    ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL,
-                          &tighten_restrictions, NULL);
+    /*
+     * Update permissions, they may differ for inactive nodes.
+     * We only tried to loosen restrictions, so errors are not fatal, ignore
+     * them.
+     */
+    bdrv_refresh_perms(bs, &tighten_restrictions, NULL);
     assert(tighten_restrictions == false);
-    if (ret < 0) {
-        /* We only tried to loosen restrictions, so errors are not fatal */
-        bdrv_abort_perm_update(bs);
-    } else {
-        bdrv_set_perm(bs, perm, shared_perm);
-    }
-
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.29.2


