Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7F64CC8D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:44:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S57-0004hT-5q; Wed, 14 Dec 2022 08:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4W-00047i-9A
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4U-0003NN-15
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HTGMCUkifMzId+bnjWe4otTTWM/w+J3jrUCbqvOpco=;
 b=LPvgkB3isJ/aHDoegvHjGCawrxTAiqHvEVIlc64tKOimP/OKN0z7MlKGMcP0WFB/UOesRx
 l9+JYtrmPx52VaPK/Px9GeNwncQZOdw1ZoSLSd/XY9wl8mC11AmTcCgfIfiPMYgBjJxZL6
 You3Bx3rFYuHprBBXW8jvV23qqaWhCA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-FR5JE9MQMJaSBqGhYk4aeA-1; Wed, 14 Dec 2022 08:45:09 -0500
X-MC-Unique: FR5JE9MQMJaSBqGhYk4aeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 919451C09B67;
 Wed, 14 Dec 2022 13:45:09 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDE8114171BE;
 Wed, 14 Dec 2022 13:45:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/51] block: Inline bdrv_detach_child()
Date: Wed, 14 Dec 2022 14:44:03 +0100
Message-Id: <20221214134453.31665-2-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

The only caller is bdrv_root_unref_child(), let's just do the logic
directly in it. It simplifies further conversion of
bdrv_root_unref_child() to transaction actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221107163558.618889-2-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 46 +++++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index a18f052374..c0c1b3df91 100644
--- a/block.c
+++ b/block.c
@@ -3070,30 +3070,6 @@ static BdrvChild *bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     tran, errp);
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /*
-         * When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext
-         */
-        bdrv_try_change_aio_context(old_bs, qemu_get_aio_context(), NULL, NULL);
-    }
-}
-
 /*
  * This function steals the reference to child_bs from the caller.
  * That reference is later dropped by bdrv_root_unref_child().
@@ -3182,12 +3158,28 @@ out:
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-    BlockDriverState *child_bs;
+    BlockDriverState *child_bs = child->bs;
 
     GLOBAL_STATE_CODE();
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
+
+    if (child_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(child_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_change_aio_context(child_bs, qemu_get_aio_context(), NULL,
+                                    NULL);
+    }
 
-    child_bs = child->bs;
-    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.38.1


