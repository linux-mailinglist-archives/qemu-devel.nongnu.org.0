Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E614736F960
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:35:34 +0200 (CEST)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRQj-0006xz-Ss
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlv-00056t-Jt
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0002wA-F8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3BfhRUGaeUqjYHmuwKHYaFF4r2Dvt4KtI5uujqsW4U=;
 b=fRTgmrpQb3PWvsPOofYmVjYa+JS/P9njXdulrp4dROhIQEO5qlb+9F+g110kbqPeK8+erX
 SzIqhMt/Vr5FRHALj4WBF7XFCrdHIlYL24FzEzgCxfYFiyz/B9+nmets7zkH9XZzzWptgO
 9yHwh0dq3o2f1O0PYZmUHacqiEBY8SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-hm0Bz893PpeL4293SgF6dA-1; Fri, 30 Apr 2021 06:53:09 -0400
X-MC-Unique: hm0Bz893PpeL4293SgF6dA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6661318BA283;
 Fri, 30 Apr 2021 10:53:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 763905F707;
 Fri, 30 Apr 2021 10:53:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/39] block: introduce bdrv_drop_filter()
Date: Fri, 30 Apr 2021 12:51:31 +0200
Message-Id: <20210430105147.125840-24-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Using bdrv_replace_node() for removing filter is not good enough: it
keeps child reference of the filter, which may conflict with original
top node during permission update.

Instead let's create new interface, which will do all graph
modifications first and then update permissions.

Let's modify bdrv_replace_node_common(), allowing it additionally drop
backing chain child link pointing to new node. This is quite
appropriate for bdrv_drop_intermediate() and makes possible to add
new bdrv_drop_filter() as a simple wrapper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-24-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 43 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 16e496a5c4..85481a05c6 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -362,6 +362,7 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 2ea9cc110d..68dfd822dd 100644
--- a/block.c
+++ b/block.c
@@ -5041,7 +5041,6 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
  */
-__attribute__((unused))
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
@@ -5105,16 +5104,32 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
+ *
+ * With @detach_subchain=true @to must be in a backing chain of @from. In this
+ * case backing link of the cow-parent of @to is removed.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Error **errp)
+                                    bool auto_skip, bool detach_subchain,
+                                    Error **errp)
 {
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *to_cow_parent;
     int ret;
 
+    if (detach_subchain) {
+        assert(bdrv_chain_contains(from, to));
+        assert(from != to);
+        for (to_cow_parent = from;
+             bdrv_filter_or_cow_bs(to_cow_parent) != to;
+             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
+        {
+            ;
+        }
+    }
+
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
     bdrv_ref(from);
@@ -5134,6 +5149,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         goto out;
     }
 
+    if (detach_subchain) {
+        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+    }
+
     found = g_hash_table_new(NULL, NULL);
 
     refresh_list = bdrv_topological_dfs(refresh_list, found, to);
@@ -5158,7 +5177,13 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
-    return bdrv_replace_node_common(from, to, true, errp);
+    return bdrv_replace_node_common(from, to, true, false, errp);
+}
+
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
+                                    errp);
 }
 
 /*
@@ -5493,7 +5518,17 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         updated_children = g_slist_prepend(updated_children, c);
     }
 
-    bdrv_replace_node_common(top, base, false, &local_err);
+    /*
+     * It seems correct to pass detach_subchain=true here, but it triggers
+     * one more yet not fixed bug, when due to nested aio_poll loop we switch to
+     * another drained section, which modify the graph (for example, removing
+     * the child, which we keep in updated_children list). So, it's a TODO.
+     *
+     * Note, bug triggered if pass detach_subchain=true here and run
+     * test-bdrv-drain. test_drop_intermediate_poll() test-case will crash.
+     * That's a FIXME.
+     */
+    bdrv_replace_node_common(top, base, false, false, &local_err);
     if (local_err) {
         error_report_err(local_err);
         goto exit;
-- 
2.30.2


