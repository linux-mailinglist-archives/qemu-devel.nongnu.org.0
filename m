Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B66FE536
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 22:38:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqYL-0005KD-Mu; Wed, 10 May 2023 16:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqY8-0005EV-MF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwqY5-0003MV-B7
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683750992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3xsJyxmeHSomo74+D4aggMuwldNR5lEhLMTiDrQpX4=;
 b=EBcm4dcsSg3vSqOMqzlo8yCldJEMlEbaVm4awm5gHcNKNCCFgcnvxCQ9nPa/m728wj4rFC
 OLINC4lIr+ldUb/wNdblpoYUuDzzUd/YtGHBoDbvNDbdxkuNljfagg4L3d2t5DStvKpxwS
 P5L/GE3Xy++WUXsvbdEdLCeixz+P1Cs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-peVt73ibMGu9AjjBKAg3bw-1; Wed, 10 May 2023 16:36:29 -0400
X-MC-Unique: peVt73ibMGu9AjjBKAg3bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27556381D1E4;
 Wed, 10 May 2023 20:36:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8A741121314;
 Wed, 10 May 2023 20:36:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: [PATCH 5/8] test-bdrv-drain: Take graph lock more selectively
Date: Wed, 10 May 2023 22:35:58 +0200
Message-Id: <20230510203601.418015-6-kwolf@redhat.com>
In-Reply-To: <20230510203601.418015-1-kwolf@redhat.com>
References: <20230510203601.418015-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If we take a reader lock, we can't call any functions that take a writer
lock internally without causing deadlocks once the reader lock is
actually enforced in the main thread, too. Take the reader lock only
where it is actually needed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 9a4c5e59d6..ae4299ccfa 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1004,8 +1004,6 @@ static void coroutine_fn test_co_delete_by_drain(void *opaque)
     void *buffer = g_malloc(65536);
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buffer, 65536);
 
-    GRAPH_RDLOCK_GUARD();
-
     /* Pretend some internal write operation from parent to child.
      * Important: We have to read from the child, not from the parent!
      * Draining works by first propagating it all up the tree to the
@@ -1014,7 +1012,9 @@ static void coroutine_fn test_co_delete_by_drain(void *opaque)
      * everything will be drained before we go back down the tree, but
      * we do not want that.  We want to be in the middle of draining
      * when this following requests returns. */
+    bdrv_graph_co_rdlock();
     bdrv_co_preadv(tts->wait_child, 0, 65536, &qiov, 0);
+    bdrv_graph_co_rdunlock();
 
     g_assert_cmpint(bs->refcnt, ==, 1);
 
-- 
2.40.1


