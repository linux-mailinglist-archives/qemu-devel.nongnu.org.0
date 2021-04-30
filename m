Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73236F924
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:21:04 +0200 (CEST)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRCh-0000M3-QD
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQks-00044T-3t
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkq-0002TG-5s
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uoRWK4MyXfGS3EFiUCGGfSc6uKeT2Myhj9U3spS+1w=;
 b=i8vFAlB5JjSfio37ejhg/C0wB37triEdMOLrj/URcwGSkW4KXdIImEa5WEGJZznRndjwCU
 crO8CBoHvGLlAkMOBwY6TluSIdF+RcUPbb6yqyQpHUv7NNNAyPC63m3SSd6G9SAKkucQ5E
 ERziO23udB2cOTr5PVYkF5OrBhE9TzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-XAefmCtdNiGcRE61iFApew-1; Fri, 30 Apr 2021 06:52:11 -0400
X-MC-Unique: XAefmCtdNiGcRE61iFApew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65FEC107ACC7;
 Fri, 30 Apr 2021 10:52:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71F1E17177;
 Fri, 30 Apr 2021 10:52:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/39] block: refactor bdrv_child* permission functions
Date: Fri, 30 Apr 2021 12:51:18 +0200
Message-Id: <20210430105147.125840-11-kwolf@redhat.com>
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

Split out non-recursive parts, and refactor as block graph transaction
action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-11-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index fd621f0403..0ee0c2f29a 100644
--- a/block.c
+++ b/block.c
@@ -49,6 +49,7 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -2093,6 +2094,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+static void bdrv_child_set_perm_commit(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    c->has_backup_perm = false;
+}
+
+static void bdrv_child_set_perm_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    /*
+     * We may have child->has_backup_perm unset at this point, as in case of
+     * _check_ stage of permission update failure we may _check_ not the whole
+     * subtree.  Still, _abort_ is called on the whole subtree anyway.
+     */
+    if (c->has_backup_perm) {
+        c->perm = c->backup_perm;
+        c->shared_perm = c->backup_shared_perm;
+        c->has_backup_perm = false;
+    }
+}
+
+static TransactionActionDrv bdrv_child_set_pem_drv = {
+    .abort = bdrv_child_set_perm_abort,
+    .commit = bdrv_child_set_perm_commit,
+};
+
+/*
+ * With tran=NULL needs to be followed by direct call to either
+ * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
+ *
+ * With non-NULL tran needs to be followed by tran_abort() or tran_commit()
+ * instead.
+ */
+static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
+                                     uint64_t shared, Transaction *tran)
+{
+    if (!c->has_backup_perm) {
+        c->has_backup_perm = true;
+        c->backup_perm = c->perm;
+        c->backup_shared_perm = c->shared_perm;
+    }
+    /*
+     * Note: it's OK if c->has_backup_perm was already set, as we can find the
+     * same c twice during check_perm procedure
+     */
+
+    c->perm = perm;
+    c->shared_perm = shared;
+
+    if (tran) {
+        tran_add(tran, &bdrv_child_set_pem_drv, c);
+    }
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2358,37 +2414,20 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
         return ret;
     }
 
-    if (!c->has_backup_perm) {
-        c->has_backup_perm = true;
-        c->backup_perm = c->perm;
-        c->backup_shared_perm = c->shared_perm;
-    }
-    /*
-     * Note: it's OK if c->has_backup_perm was already set, as we can find the
-     * same child twice during check_perm procedure
-     */
-
-    c->perm = perm;
-    c->shared_perm = shared;
+    bdrv_child_set_perm_safe(c, perm, shared, NULL);
 
     return 0;
 }
 
 static void bdrv_child_set_perm(BdrvChild *c)
 {
-    c->has_backup_perm = false;
-
+    bdrv_child_set_perm_commit(c);
     bdrv_set_perm(c->bs);
 }
 
 static void bdrv_child_abort_perm_update(BdrvChild *c)
 {
-    if (c->has_backup_perm) {
-        c->perm = c->backup_perm;
-        c->shared_perm = c->backup_shared_perm;
-        c->has_backup_perm = false;
-    }
-
+    bdrv_child_set_perm_abort(c);
     bdrv_abort_perm_update(c->bs);
 }
 
-- 
2.30.2


