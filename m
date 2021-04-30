Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13936F9A2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:53:01 +0200 (CEST)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRhc-000731-3K
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlz-0005Eh-9V
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0002wK-Gy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sObu263yR4hrbwC7Q7j21O5diFB5L39GzjRcM/OI+A=;
 b=LqF56gJ83wYrQpOZMGTUcaccwj2lOiuw5k2AiM90WKMbaRJ1ixINwql/BHGbTquGFrVyKW
 5NehQev5kyvV1s2xAC/i9qGyeUAz0IGMpKkgeSMKWLn2GjpR/TOS6XjB8GwxEzc0KUgnPG
 rMaAsmP3bAYE15pSdDMk9tHSBCYltPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-gb7UzWLyOSeCHBUKmappcg-1; Fri, 30 Apr 2021 06:53:08 -0400
X-MC-Unique: gb7UzWLyOSeCHBUKmappcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED75108BD08;
 Fri, 30 Apr 2021 10:53:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FAFF6787F;
 Fri, 30 Apr 2021 10:53:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/39] block: add bdrv_remove_filter_or_cow transaction action
Date: Fri, 30 Apr 2021 12:51:30 +0200
Message-Id: <20210430105147.125840-23-kwolf@redhat.com>
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-23-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5bb6a2bef9..2ea9cc110d 100644
--- a/block.c
+++ b/block.c
@@ -2963,12 +2963,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 }
 
+static void bdrv_child_free(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    g_free(c->name);
+    g_free(c);
+}
+
 static void bdrv_remove_empty_child(BdrvChild *child)
 {
     assert(!child->bs);
     QLIST_SAFE_REMOVE(child, next);
-    g_free(child->name);
-    g_free(child);
+    bdrv_child_free(child);
 }
 
 typedef struct BdrvAttachChildCommonState {
@@ -4991,6 +4998,79 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+typedef struct BdrvRemoveFilterOrCowChild {
+    BdrvChild *child;
+    bool is_backing;
+} BdrvRemoveFilterOrCowChild;
+
+static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
+{
+    BdrvRemoveFilterOrCowChild *s = opaque;
+    BlockDriverState *parent_bs = s->child->opaque;
+
+    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
+    if (s->is_backing) {
+        parent_bs->backing = s->child;
+    } else {
+        parent_bs->file = s->child;
+    }
+
+    /*
+     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * because that function is transactionable and it registered own completion
+     * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
+     * called automatically.
+     */
+}
+
+static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
+{
+    BdrvRemoveFilterOrCowChild *s = opaque;
+
+    bdrv_child_free(s->child);
+}
+
+static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
+    .abort = bdrv_remove_filter_or_cow_child_abort,
+    .commit = bdrv_remove_filter_or_cow_child_commit,
+    .clean = g_free,
+};
+
+/*
+ * A function to remove backing-chain child of @bs if exists: cow child for
+ * format nodes (always .backing) and filter child for filters (may be .file or
+ * .backing)
+ */
+__attribute__((unused))
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran)
+{
+    BdrvRemoveFilterOrCowChild *s;
+    BdrvChild *child = bdrv_filter_or_cow_child(bs);
+
+    if (!child) {
+        return;
+    }
+
+    if (child->bs) {
+        bdrv_replace_child_safe(child, NULL, tran);
+    }
+
+    s = g_new(BdrvRemoveFilterOrCowChild, 1);
+    *s = (BdrvRemoveFilterOrCowChild) {
+        .child = child,
+        .is_backing = (child == bs->backing),
+    };
+    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    QLIST_SAFE_REMOVE(child, next);
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
+}
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
-- 
2.30.2


