Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CB3B86F1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:17:26 +0200 (CEST)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyctx-0003Ap-D9
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfj-0002vT-R7
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfV-00073E-AJ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MsrqUz9pWC7EX6rdkWNpOOzj3UDDlO0RZ2Ve9nuG+KM=;
 b=EdUV4H/EeG1eyXt9kvUC2n4mgJwvzN3PcEdLj/tTNFZcLPRO0uiK0BRZm7ffNuzecuumO9
 W2nKhJDBtFID01ecIHdT2Vc5CEE47VYqy2rFOHt6Emgue3xJpQidPshoCrNbk9Iawz166X
 M5lstAblViv5ZK+KcfYcZwwnXyt5BJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-7pWkFsIjMR2_Q_liranYtg-1; Wed, 30 Jun 2021 12:02:26 -0400
X-MC-Unique: 7pWkFsIjMR2_Q_liranYtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3531AA40CB;
 Wed, 30 Jun 2021 16:02:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30468189C7;
 Wed, 30 Jun 2021 16:02:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/24] block: move supports_backing check to
 bdrv_set_file_or_backing_noperm()
Date: Wed, 30 Jun 2021 18:01:53 +0200
Message-Id: <20210630160206.276439-12-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

Move supports_backing check of bdrv_reopen_parse_backing to called
(through bdrv_set_backing_noperm()) bdrv_set_file_or_backing_noperm()
function. The check applies to general case, so it's appropriate for
bdrv_set_file_or_backing_noperm().

We have to declare backing support for two test drivers, otherwise new
check fails.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-7-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 29 +++++++++++++++--------------
 tests/unit/test-bdrv-drain.c     |  1 +
 tests/unit/test-bdrv-graph-mod.c |  1 +
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index d047cae43c..0a73335380 100644
--- a/block.c
+++ b/block.c
@@ -3152,6 +3152,14 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
         return -EPERM;
     }
 
+    if (is_backing && !parent_bs->drv->is_filter &&
+        !parent_bs->drv->supports_backing)
+    {
+        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
+                   "files", parent_bs->drv->format_name, parent_bs->node_name);
+        return -EINVAL;
+    }
+
     if (parent_bs->drv->is_filter) {
         role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
     } else if (is_backing) {
@@ -4278,20 +4286,13 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         }
     }
 
-    /*
-     * Ensure that @bs can really handle backing files, because we are
-     * about to give it one (or swap the existing one)
-     */
-    if (bs->drv->is_filter) {
-        /* Filters always have a file or a backing child */
-        if (!bs->backing) {
-            error_setg(errp, "'%s' is a %s filter node that does not support a "
-                       "backing child", bs->node_name, bs->drv->format_name);
-            return -EINVAL;
-        }
-    } else if (!bs->drv->supports_backing) {
-        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
-                   "files", bs->drv->format_name, bs->node_name);
+    if (bs->drv->is_filter && !bs->backing) {
+        /*
+         * Filters always have a file or a backing child, so we are trying to
+         * change wrong child
+         */
+        error_setg(errp, "'%s' is a %s filter node that does not support a "
+                   "backing child", bs->node_name, bs->drv->format_name);
         return -EINVAL;
     }
 
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 892f7f47d8..ce071b5fc5 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -95,6 +95,7 @@ static int bdrv_test_change_backing_file(BlockDriverState *bs,
 static BlockDriver bdrv_test = {
     .format_name            = "test",
     .instance_size          = sizeof(BDRVTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_test_close,
     .bdrv_co_preadv         = bdrv_test_co_preadv,
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 88f25c0cdb..a6e3bb79be 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -41,6 +41,7 @@ static void no_perm_default_perms(BlockDriverState *bs, BdrvChild *c,
 
 static BlockDriver bdrv_no_perm = {
     .format_name = "no-perm",
+    .supports_backing = true,
     .bdrv_child_perm = no_perm_default_perms,
 };
 
-- 
2.31.1


