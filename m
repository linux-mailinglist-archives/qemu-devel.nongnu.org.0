Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2736F984
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:42:31 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRXS-0004cP-JJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQly-0005B9-LR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0002tt-GO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBKCnfKvo0CVABKe+q3X/ZQJ8tRBESUAWwj1nRU28F0=;
 b=VuvRfU8EwAeBA0g66QM3ZGxp3T1HA4TYVo5EX94Gd3+9SRansq+Y+KaoZO+2dtFuj7RBvT
 dPq7MYwh3Dglys5WVoNGm6lA0RlRUFxYniODHKaN0m/h85ydW8zDnzWOSXL+CWGrMVwg/D
 hRH7bTtO604f5PV0lH0Z7g/F80a4YHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-cgDtcAM1NNaOUdSULDDTiQ-1; Fri, 30 Apr 2021 06:53:04 -0400
X-MC-Unique: cgDtcAM1NNaOUdSULDDTiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 833BF18B9EEB;
 Fri, 30 Apr 2021 10:53:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 569D47B122;
 Fri, 30 Apr 2021 10:53:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/39] block: add bdrv_attach_child_noperm() transaction action
Date: Fri, 30 Apr 2021 12:51:27 +0200
Message-Id: <20210430105147.125840-20-kwolf@redhat.com>
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

Split no-perm part of bdrv_attach_child as separate transaction action.
It will be used in later commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-20-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index 4d5c60f2ae..c74e6e7cc1 100644
--- a/block.c
+++ b/block.c
@@ -85,6 +85,14 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    Transaction *tran,
+                                    Error **errp);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3079,6 +3087,40 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    Transaction *tran,
+                                    Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    assert(parent_bs->drv);
+
+    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
+                    perm, shared_perm, &perm, &shared_perm);
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, parent_bs,
+                                   child, tran, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
+    /*
+     * child is removed in bdrv_attach_child_common_abort(), so don't care to
+     * abort this change separately.
+     */
+
+    return 0;
+}
+
 static void bdrv_detach_child(BdrvChild *child)
 {
     bdrv_replace_child(child, NULL);
@@ -3139,23 +3181,26 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BdrvChildRole child_role,
                              Error **errp)
 {
-    BdrvChild *child;
-    uint64_t perm, shared_perm;
-
-    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    int ret;
+    BdrvChild *child = NULL;
+    Transaction *tran = tran_new();
 
-    assert(parent_bs->drv);
-    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
-                    perm, shared_perm, &perm, &shared_perm);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
+                                   child_role, &child, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
 
-    child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, perm, shared_perm, parent_bs,
-                                   errp);
-    if (child == NULL) {
-        return NULL;
+    ret = bdrv_refresh_perms(parent_bs, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    QLIST_INSERT_HEAD(&parent_bs->children, child, next);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
+
     return child;
 }
 
-- 
2.30.2


