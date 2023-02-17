Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC969AF38
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Nb-0004vt-PM; Fri, 17 Feb 2023 10:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NW-0004qo-2f
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NS-0007UE-Nf
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSDkLkKQVdvjcnfHIpzzjA1h3QTnl6s0oXq+cCOf2/U=;
 b=Mim6CCjLK/sg7/qY35u7ctIPY+B+YSKcj38P2VHckBJmYApFRlMcT9CXnXW38gybd5bFwK
 Ke8lepW1SO129JatzYnGEsnf69R/V+1xQoSY7OSbNXyvqHKiw7ryru0A3mv2nQVz0oMANb
 IpzfdWShaBzTrhzYziHV6sKSaGchuqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-Tgwlz7tUNRurP_73mKKTRg-1; Fri, 17 Feb 2023 10:10:20 -0500
X-MC-Unique: Tgwlz7tUNRurP_73mKKTRg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4900800B23;
 Fri, 17 Feb 2023 15:10:19 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14CC8492C14;
 Fri, 17 Feb 2023 15:10:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 19/22] block: temporarily hold the new AioContext of bs_top in
 bdrv_append()
Date: Fri, 17 Feb 2023 16:09:51 +0100
Message-Id: <20230217150954.283920-19-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Stefano Garzarella <sgarzare@redhat.com>

bdrv_append() is called with bs_top AioContext held, but
bdrv_attach_child_noperm() could change the AioContext of bs_top.

bdrv_replace_node_noperm() calls bdrv_drained_begin() starting from
commit 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()").
bdrv_drained_begin() can call BDRV_POLL_WHILE that assumes the new lock
is taken, so let's temporarily hold the new AioContext to prevent QEMU
from failing in BDRV_POLL_WHILE when it tries to release the wrong
AioContext.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2168209
Reported-by: Aihua Liang <aliang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20230214171621.11574-1-sgarzare@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/block.c b/block.c
index 122aa9a9ac..0c807d15cd 100644
--- a/block.c
+++ b/block.c
@@ -5265,6 +5265,8 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
  * child.
  *
  * This function does not create any image files.
+ *
+ * The caller must hold the AioContext lock for @bs_top.
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
@@ -5272,11 +5274,14 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     int ret;
     BdrvChild *child;
     Transaction *tran = tran_new();
+    AioContext *old_context, *new_context = NULL;
 
     GLOBAL_STATE_CODE();
 
     assert(!bs_new->backing);
 
+    old_context = bdrv_get_aio_context(bs_top);
+
     child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                      &child_of_bds, bdrv_backing_role(bs_new),
                                      tran, errp);
@@ -5285,6 +5290,19 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
+    /*
+     * bdrv_attach_child_noperm could change the AioContext of bs_top.
+     * bdrv_replace_node_noperm calls bdrv_drained_begin, so let's temporarily
+     * hold the new AioContext, since bdrv_drained_begin calls BDRV_POLL_WHILE
+     * that assumes the new lock is taken.
+     */
+    new_context = bdrv_get_aio_context(bs_top);
+
+    if (old_context != new_context) {
+        aio_context_release(old_context);
+        aio_context_acquire(new_context);
+    }
+
     ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
     if (ret < 0) {
         goto out;
@@ -5296,6 +5314,11 @@ out:
 
     bdrv_refresh_limits(bs_top, NULL, NULL);
 
+    if (new_context && old_context != new_context) {
+        aio_context_release(new_context);
+        aio_context_acquire(old_context);
+    }
+
     return ret;
 }
 
-- 
2.39.2


