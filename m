Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066D4B2C54
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:03:59 +0100 (CET)
Received: from localhost ([::1]:58486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIaGz-0006Af-Vr
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIaCQ-0003Ke-D5
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:59:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIaCN-0006iY-7q
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 12:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644602350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SC0MXzNV7/lfbUou57ztb9IDPIkw/4VrP4cuaPBM/kY=;
 b=Tey8t7aeY+6fVsKh4RLUCpRGqUi97G5QNrQFFYaoDoPitbQObXDCoZK4Fo5GezZQZS506a
 8Ml5ReuqvAdfA0ZxHrFrhDZV2eN4A37DPpgVXzDCfi1T6TyJ+xLs+M5kQQ4kGG+MHfPD5c
 GGgrM2sHNExKHuJh3B7kN0PnmKf3OiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-Rjq6OqB2PkuIep8FddJRgQ-1; Fri, 11 Feb 2022 12:59:07 -0500
X-MC-Unique: Rjq6OqB2PkuIep8FddJRgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 479FE84DA41;
 Fri, 11 Feb 2022 17:59:06 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BF1B78ABA;
 Fri, 11 Feb 2022 17:59:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/3] block: Lock AioContext for drain_end in blockdev-reopen
Date: Fri, 11 Feb 2022 18:58:52 +0100
Message-Id: <20220211175854.153798-2-kwolf@redhat.com>
In-Reply-To: <20220211175854.153798-1-kwolf@redhat.com>
References: <20220211175854.153798-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_subtree_drained_end() requires the caller to hold the AioContext
lock for the drained node. Not doing this for nodes outside of the main
AioContext leads to crashes when AIO_WAIT_WHILE() needs to wait and
tries to temporarily release the lock.

Fixes: 3908b7a8994fa5ef7a89aa58cd5a02fc58141592
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2046659
Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220203140534.36522-2-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 8197165bb5..42e098b458 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3530,6 +3530,7 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 {
     BlockReopenQueue *queue = NULL;
     GSList *drained = NULL;
+    GSList *p;
 
     /* Add each one of the BDS that we want to reopen to the queue */
     for (; reopen_list != NULL; reopen_list = reopen_list->next) {
@@ -3579,7 +3580,15 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
 
 fail:
     bdrv_reopen_queue_free(queue);
-    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
+    for (p = drained; p; p = p->next) {
+        BlockDriverState *bs = p->data;
+        AioContext *ctx = bdrv_get_aio_context(bs);
+
+        aio_context_acquire(ctx);
+        bdrv_subtree_drained_end(bs);
+        aio_context_release(ctx);
+    }
+    g_slist_free(drained);
 }
 
 void qmp_blockdev_del(const char *node_name, Error **errp)
-- 
2.34.1


