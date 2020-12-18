Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB7F2DE650
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:16:04 +0100 (CET)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHUB-0003Xl-3M
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRH-0001My-SU
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRG-0005Ez-0S
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ls2wWdlZPujsIJlCnhMtMhIKyomgLyG4yXk9iQumZlA=;
 b=hqqLMpqwKjqsSh5AxGpD64DbnUNHYdUQlDT4qGoYBw+hRA21DiiKjqtAxrs8CGQMROKJzw
 o/U4U9wM54sW8hZaxtq2D54qc+72j/XYQ+LvlhfemRxhe+xn23SiWAnUZ48U6FXIfAxnQ9
 1tuLclGr3ECItx9wLX5Ek33FLxei/Gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-V4_NUJhkNQWze4S-ZViTXQ-1; Fri, 18 Dec 2020 10:12:56 -0500
X-MC-Unique: V4_NUJhkNQWze4S-ZViTXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EEC0190B2B3;
 Fri, 18 Dec 2020 15:12:55 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 310605D769;
 Fri, 18 Dec 2020 15:12:55 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/30] block: bdrv_set_perm() drop redundant parameters.
Date: Fri, 18 Dec 2020 16:12:21 +0100
Message-Id: <20201218151249.715731-3-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We should never set permissions other than cumulative permissions of
parents. During bdrv_reopen_multiple() we _check_ for synthetic
permissions but when we do _set_ the graph is already updated.
Add an assertion to bdrv_reopen_multiple(), other cases are more
obvious.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201106124241.16950-6-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 3a07693608..66ab6caa7d 100644
--- a/block.c
+++ b/block.c
@@ -2112,9 +2112,9 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs, uint64_t cumulative_perms,
-                          uint64_t cumulative_shared_perms)
+static void bdrv_set_perm(BlockDriverState *bs)
 {
+    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2122,6 +2122,8 @@ static void bdrv_set_perm(BlockDriverState *bs, uint64_t cumulative_perms,
         return;
     }
 
+    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
+
     /* Update this node */
     if (drv->bdrv_set_perm) {
         drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
@@ -2304,16 +2306,12 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
 
 static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared)
 {
-    uint64_t cumulative_perms, cumulative_shared_perms;
-
     c->has_backup_perm = false;
 
     c->perm = perm;
     c->shared_perm = shared;
 
-    bdrv_get_cumulative_perm(c->bs, &cumulative_perms,
-                             &cumulative_shared_perms);
-    bdrv_set_perm(c->bs, cumulative_perms, cumulative_shared_perms);
+    bdrv_set_perm(c->bs);
 }
 
 static void bdrv_child_abort_perm_update(BdrvChild *c)
@@ -2340,7 +2338,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, bool *tighten_restrictions,
         bdrv_abort_perm_update(bs);
         return ret;
     }
-    bdrv_set_perm(bs, perm, shared_perm);
+    bdrv_set_perm(bs);
 
     return 0;
 }
@@ -2641,7 +2639,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
 static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
 {
     BlockDriverState *old_bs = child->bs;
-    uint64_t perm, shared_perm;
 
     /* Asserts that child->frozen == false */
     bdrv_replace_child_noperm(child, new_bs);
@@ -2655,8 +2652,7 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
      * restrictions.
      */
     if (new_bs) {
-        bdrv_get_cumulative_perm(new_bs, &perm, &shared_perm);
-        bdrv_set_perm(new_bs, perm, shared_perm);
+        bdrv_set_perm(new_bs);
     }
 
     if (old_bs) {
@@ -3874,7 +3870,13 @@ cleanup_perm:
         }
 
         if (ret == 0) {
-            bdrv_set_perm(state->bs, state->perm, state->shared_perm);
+            uint64_t perm, shared;
+
+            bdrv_get_cumulative_perm(state->bs, &perm, &shared);
+            assert(perm == state->perm);
+            assert(shared == state->shared_perm);
+
+            bdrv_set_perm(state->bs);
         } else {
             bdrv_abort_perm_update(state->bs);
             if (state->replace_backing_bs && state->new_backing_bs) {
@@ -4644,8 +4646,7 @@ static void bdrv_replace_node_common(BlockDriverState *from,
         bdrv_unref(from);
     }
 
-    bdrv_get_cumulative_perm(to, &perm, &shared);
-    bdrv_set_perm(to, perm, shared);
+    bdrv_set_perm(to);
 
 out:
     g_slist_free(list);
-- 
2.29.2


