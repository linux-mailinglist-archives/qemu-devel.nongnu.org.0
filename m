Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3AC36F95B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:31:37 +0200 (CEST)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRMu-00040d-FE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlu-00052w-61
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQli-0002tz-04
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1rdy0YM1fr/ROGHqRzBFFlsSnzuebrJ1GB4O5AKe6g=;
 b=gsUfYhAlvc+dLss4znUe7YY7BkvVLvCGfQqi2taPLGdMKYh/SIFIl9MsVeqbOXgG0nR9hS
 PUyBunyhFCv30J/q7qqooHbCE6zKwrXWBrxbKIRoKyJ1RbhIG4jfdAam+Jr7p6ADp4+HrC
 IVixZjvmnSdjP60Fy+SwEghbpKIEDms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-yzVI7mrlOG-BCY0K1iuv7g-1; Fri, 30 Apr 2021 06:53:06 -0400
X-MC-Unique: yzVI7mrlOG-BCY0K1iuv7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8CEB801AD9;
 Fri, 30 Apr 2021 10:53:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D93396788A;
 Fri, 30 Apr 2021 10:53:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/39] block: adapt bdrv_append() for inserting filters
Date: Fri, 30 Apr 2021 12:51:29 +0200
Message-Id: <20210430105147.125840-22-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bdrv_append is not very good for inserting filters: it does extra
permission update as part of bdrv_set_backing_hd(). During this update
filter may conflict with other parents of top_bs.

Instead, let's first do all graph modifications and after it update
permissions.

append-greedy-filter test-case in test-bdrv-graph-mod is now works, so
move it out of debug option.

Note: bdrv_append() is still only works for backing-child based
filters. It's something to improve later.

Note2: we use the fact that bdrv_append() is used to append new nodes,
without backing child, so we don't need frozen check and inherits_from
logic from bdrv_set_backing_hd().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-22-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 27 ++++++++++++++++++++-------
 tests/unit/test-bdrv-graph-mod.c | 17 ++---------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index 9283c8d97b..5bb6a2bef9 100644
--- a/block.c
+++ b/block.c
@@ -5088,25 +5088,38 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * This will modify the BlockDriverState fields, and swap contents
  * between bs_new and bs_top. Both bs_new and bs_top are modified.
  *
- * bs_new must not be attached to a BlockBackend.
+ * bs_new must not be attached to a BlockBackend and must not have backing
+ * child.
  *
  * This function does not create any image files.
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
-    int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
+    int ret;
+    Transaction *tran = tran_new();
+
+    assert(!bs_new->backing);
+
+    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs_new),
+                                   &bs_new->backing, tran, errp);
     if (ret < 0) {
-        return ret;
+        goto out;
     }
 
-    ret = bdrv_replace_node(bs_top, bs_new, errp);
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
     if (ret < 0) {
-        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        return ret;
+        goto out;
     }
 
-    return 0;
+    ret = bdrv_refresh_perms(bs_new, errp);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_refresh_limits(bs_top, NULL);
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 7b3c8b437a..88f25c0cdb 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -388,16 +388,6 @@ static void test_append_greedy_filter(void)
 
 int main(int argc, char *argv[])
 {
-    int i;
-    bool debug = false;
-
-    for (i = 1; i < argc; i++) {
-        if (!strcmp(argv[i], "-d")) {
-            debug = true;
-            break;
-        }
-    }
-
     bdrv_init();
     qemu_init_main_loop(&error_abort);
 
@@ -410,11 +400,8 @@ int main(int argc, char *argv[])
                     test_parallel_perm_update);
     g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                     test_parallel_exclusive_write);
-
-    if (debug) {
-        g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
-                        test_append_greedy_filter);
-    }
+    g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
+                    test_append_greedy_filter);
 
     return g_test_run();
 }
-- 
2.30.2


