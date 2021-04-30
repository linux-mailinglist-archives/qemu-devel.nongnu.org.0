Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F736F999
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:50:35 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRfG-0003qp-BS
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlz-0005G3-Q3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlr-0002xe-Cr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0jEBM3UZPH4m/JZa3GBtkZlLans7Hy0JUN7g5q0V24=;
 b=Mw+2w2uPWVUefNedABnm4VlY6MDRNvcaQ09EnDP2KUyeQlxHRUqQ1JQFbgi3sziESdVJpj
 Lnn/PfBFCoHea4RKM0kjpk7Fy1c+XnXfMPSQx1MEg5YNlK3nFwQc8Yzluxlsm9oLtEB12s
 a8vEpNsOqoUkUSUPnvGWIw8aG0zb6xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-Sc3D3erNOnKgB4LXjQs3XA-1; Fri, 30 Apr 2021 06:53:16 -0400
X-MC-Unique: Sc3D3erNOnKgB4LXjQs3XA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 230CF1009637;
 Fri, 30 Apr 2021 10:53:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328D05F707;
 Fri, 30 Apr 2021 10:53:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/39] block: make bdrv_unset_inherits_from to be a transaction
 action
Date: Fri, 30 Apr 2021 12:51:34 +0200
Message-Id: <20210430105147.125840-27-kwolf@redhat.com>
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

To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-27-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 46 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 46af5852ab..1dc14908ac 100644
--- a/block.c
+++ b/block.c
@@ -3205,11 +3205,49 @@ void bdrv_root_unref_child(BdrvChild *child)
     bdrv_unref(child_bs);
 }
 
+typedef struct BdrvSetInheritsFrom {
+    BlockDriverState *bs;
+    BlockDriverState *old_inherits_from;
+} BdrvSetInheritsFrom;
+
+static void bdrv_set_inherits_from_abort(void *opaque)
+{
+    BdrvSetInheritsFrom *s = opaque;
+
+    s->bs->inherits_from = s->old_inherits_from;
+}
+
+static TransactionActionDrv bdrv_set_inherits_from_drv = {
+    .abort = bdrv_set_inherits_from_abort,
+    .clean = g_free,
+};
+
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static void bdrv_set_inherits_from(BlockDriverState *bs,
+                                   BlockDriverState *new_inherits_from,
+                                   Transaction *tran)
+{
+    if (tran) {
+        BdrvSetInheritsFrom *s = g_new(BdrvSetInheritsFrom, 1);
+
+        *s = (BdrvSetInheritsFrom) {
+            .bs = bs,
+            .old_inherits_from = bs->inherits_from,
+        };
+
+        tran_add(tran, &bdrv_set_inherits_from_drv, s);
+    }
+
+    bs->inherits_from = new_inherits_from;
+}
+
 /**
  * Clear all inherits_from pointers from children and grandchildren of
  * @root that point to @root, where necessary.
+ * @tran is allowed to be NULL. In this case no rollback is possible
  */
-static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
+static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
+                                     Transaction *tran)
 {
     BdrvChild *c;
 
@@ -3224,12 +3262,12 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
             }
         }
         if (c == NULL) {
-            child->bs->inherits_from = NULL;
+            bdrv_set_inherits_from(child->bs, NULL, tran);
         }
     }
 
     QLIST_FOREACH(c, &child->bs->children, next) {
-        bdrv_unset_inherits_from(root, c);
+        bdrv_unset_inherits_from(root, c, tran);
     }
 }
 
@@ -3240,7 +3278,7 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
         return;
     }
 
-    bdrv_unset_inherits_from(parent, child);
+    bdrv_unset_inherits_from(parent, child, NULL);
     bdrv_root_unref_child(child);
 }
 
-- 
2.30.2


