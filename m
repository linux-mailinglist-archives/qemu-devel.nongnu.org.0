Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E065F36F958
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:29:35 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRKr-0002ie-LG
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0004zx-NF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQld-0002sc-4j
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBDT2E8Wyu5aG0s7RRaIF1dB0zYW8RJDXDd7WI8hMiU=;
 b=JRjMXbxfP12zMUwBKoMlOU3iZR71C8o/M1YqNq3KywOIiA3gVIXlYMDC3OXODHjKL1DKCh
 BGg9sDqYVlWPLJTbJgq5ot7qTR5h8g2bafKri5P5TevhxBeAUMzWsAZoLghjLlcKFVCxOB
 MCrPsiha22mJwo/uF4SiAkaNLm9Tw9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-DxvywT-hO2CtC3iaqu7zdw-1; Fri, 30 Apr 2021 06:53:01 -0400
X-MC-Unique: DxvywT-hO2CtC3iaqu7zdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF876DD2C;
 Fri, 30 Apr 2021 10:53:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B93E3761F5;
 Fri, 30 Apr 2021 10:52:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/39] block: fix bdrv_replace_node_common
Date: Fri, 30 Apr 2021 12:51:25 +0200
Message-Id: <20210430105147.125840-18-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

inore_children thing doesn't help to track all propagated permissions
of children we want to ignore. The simplest way to correctly update
permissions is update graph first and then do permission update. In
this case we just referesh permissions for the whole subgraph (in
topological-sort defined order) and everything is correctly calculated
automatically without any ignore_children.

So, refactor bdrv_replace_node_common to first do graph update and then
refresh the permissions.

Test test_parallel_exclusive_write() now pass, so move it out of
debugging "if".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-18-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 43 +++++++++++++-------------------
 tests/unit/test-bdrv-graph-mod.c |  4 +--
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index a5305662dc..6040b9dea0 100644
--- a/block.c
+++ b/block.c
@@ -2273,7 +2273,6 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  */
-__attribute__((unused))
 static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
@@ -4877,8 +4876,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     bool auto_skip, Error **errp)
 {
     BdrvChild *c, *next;
-    GSList *list = NULL, *p;
-    uint64_t perm = 0, shared = BLK_PERM_ALL;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
     int ret;
 
     /* Make sure that @from doesn't go away until we have successfully attached
@@ -4889,7 +4889,12 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
     bdrv_drained_begin(from);
 
-    /* Put all parents into @list and calculate their cumulative permissions */
+    /*
+     * Do the replacement without permission update.
+     * Replacement may influence the permissions, we should calculate new
+     * permissions based on new graph. If we fail, we'll roll-back the
+     * replacement.
+     */
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
@@ -4907,36 +4912,24 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                        c->name, from->node_name);
             goto out;
         }
-        list = g_slist_prepend(list, c);
-        perm |= c->perm;
-        shared &= c->shared_perm;
+        bdrv_replace_child_safe(c, to, tran);
     }
 
-    /* Check whether the required permissions can be granted on @to, ignoring
-     * all BdrvChild in @list so that they can't block themselves. */
-    ret = bdrv_check_update_perm(to, NULL, perm, shared, list, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(to);
-        goto out;
-    }
+    found = g_hash_table_new(NULL, NULL);
 
-    /* Now actually perform the change. We performed the permission check for
-     * all elements of @list at once, so set the permissions all at once at the
-     * very end. */
-    for (p = list; p != NULL; p = p->next) {
-        c = p->data;
+    refresh_list = bdrv_topological_dfs(refresh_list, found, to);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, from);
 
-        bdrv_ref(to);
-        bdrv_replace_child_noperm(c, to);
-        bdrv_unref(from);
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    bdrv_set_perm(to);
-
     ret = 0;
 
 out:
-    g_slist_free(list);
+    tran_finalize(tran, ret);
+
     bdrv_drained_end(from);
     bdrv_unref(from);
 
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index e64e81a07c..7b3c8b437a 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -408,10 +408,10 @@ int main(int argc, char *argv[])
                     test_should_update_child);
     g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
                     test_parallel_perm_update);
+    g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
+                    test_parallel_exclusive_write);
 
     if (debug) {
-        g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
-                        test_parallel_exclusive_write);
         g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
                         test_append_greedy_filter);
     }
-- 
2.30.2


