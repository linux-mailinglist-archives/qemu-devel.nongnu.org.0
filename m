Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922C62C00F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImv-0000jx-RS; Wed, 16 Nov 2022 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImo-0000e5-GP
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-0007zb-2l
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YSqZKWu6ML3JWAFCUXYj1V3Azhvoz41m0uIXXFHM7E=;
 b=HffZGAcZL3guGBeSkZ0NM6lu/r5JJjsPzJWjG8fCCZqgjESbLRRG0IvXSe81BQXC8gWXCj
 1FIFm2LLIAE8DjMRzhUVKr/AYhmlkSGyiS4mvqIgZ12WRB5rO5u6uqAs1dM4xsS1GzLI1C
 n9dsXPZYzDMDMtqdNdeOHyx4JnG25oE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-xSR2lpHGOCa-u0h8MXEfow-1; Wed, 16 Nov 2022 08:48:54 -0500
X-MC-Unique: xSR2lpHGOCa-u0h8MXEfow-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 420D11C09B6F;
 Wed, 16 Nov 2022 13:48:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E91F44A9254;
 Wed, 16 Nov 2022 13:48:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 06/20] block: assert that graph read and writes are performed
 correctly
Date: Wed, 16 Nov 2022 08:48:36 -0500
Message-Id: <20221116134850.3051419-7-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Remove the old assert_bdrv_graph_writable, and replace it with
the new version using graph-lock API.
See the function documentation for more information.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                                |  4 ++--
 block/graph-lock.c                     | 11 +++++++++++
 include/block/block_int-global-state.h | 17 -----------------
 include/block/graph-lock.h             | 15 +++++++++++++++
 4 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index afab74d4da..1c870d85e6 100644
--- a/block.c
+++ b/block.c
@@ -1414,7 +1414,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
-    assert_bdrv_graph_writable(bs);
+    assert_bdrv_graph_writable();
     QLIST_INSERT_HEAD(&bs->children, child, next);
 
     if (bs->drv->is_filter || (child->role & BDRV_CHILD_FILTERED)) {
@@ -1461,7 +1461,7 @@ static void bdrv_child_cb_detach(BdrvChild *child)
         bdrv_backing_detach(child);
     }
 
-    assert_bdrv_graph_writable(bs);
+    assert_bdrv_graph_writable();
     QLIST_REMOVE(child, next);
     if (child == bs->backing) {
         assert(child != bs->file);
diff --git a/block/graph-lock.c b/block/graph-lock.c
index c3c6eeedad..07476fd7c8 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -242,3 +242,14 @@ void coroutine_fn bdrv_graph_co_rdunlock(void)
         aio_wait_kick();
     }
 }
+
+void assert_bdrv_graph_readable(void)
+{
+    assert(qemu_in_main_thread() || reader_count());
+}
+
+void assert_bdrv_graph_writable(void)
+{
+    assert(qemu_in_main_thread());
+    assert(qatomic_read(&has_writer));
+}
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index b49f4eb35b..2f0993f6e9 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -310,21 +310,4 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
  */
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
 
-/**
- * Make sure that the function is running under both drain and BQL.
- * The latter protects from concurrent writings
- * from the GS API, while the former prevents concurrent reads
- * from I/O.
- */
-static inline void assert_bdrv_graph_writable(BlockDriverState *bs)
-{
-    /*
-     * TODO: this function is incomplete. Because the users of this
-     * assert lack the necessary drains, check only for BQL.
-     * Once the necessary drains are added,
-     * assert also for qatomic_read(&bs->quiesce_counter) > 0
-     */
-    assert(qemu_in_main_thread());
-}
-
 #endif /* BLOCK_INT_GLOBAL_STATE_H */
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index fc806aefa3..9430707dca 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -126,5 +126,20 @@ void coroutine_fn bdrv_graph_co_rdlock(void);
  */
 void coroutine_fn bdrv_graph_co_rdunlock(void);
 
+/*
+ * assert_bdrv_graph_readable:
+ * Make sure that the reader is either the main loop,
+ * or there is at least a reader helding the rdlock.
+ * In this way an incoming writer is aware of the read and waits.
+ */
+void assert_bdrv_graph_readable(void);
+
+/*
+ * assert_bdrv_graph_writable:
+ * Make sure that the writer is the main loop and has set @has_writer,
+ * so that incoming readers will pause.
+ */
+void assert_bdrv_graph_writable(void);
+
 #endif /* GRAPH_LOCK_H */
 
-- 
2.31.1


