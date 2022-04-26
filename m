Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC150F697
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:58:57 +0200 (CEST)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njH28-0007Iw-7r
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvK-0007Hh-Mp
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvI-0000gX-SH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+kdbW/UoUeuWtfuRNw/Xekk3y7L37wznJv37tJ3hKA=;
 b=PIqTR1gFx2nqgZQWyPWTh3M3hqhyNFYxUyu7MIfzJv0Swgiy6PXAQnuoNMcWmv/hMjj1hL
 ZCM6rhYYSiwP5CVjfibv/wQw1z8/SglmXdBtTFt3oG76/RBYE0JY7CdoeuudVdO38ua+Yf
 QbaiYVMJnfcAsUTU8KQ5qEgFC+sNJEQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-MHwtUeaGMrO_eQDlWi8j7g-1; Tue, 26 Apr 2022 04:51:46 -0400
X-MC-Unique: MHwtUeaGMrO_eQDlWi8j7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28A9C3C10AC6;
 Tue, 26 Apr 2022 08:51:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71717404D2C2;
 Tue, 26 Apr 2022 08:51:22 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 6/8] block: assert that graph read and writes are
 performed correctly
Date: Tue, 26 Apr 2022 04:51:12 -0400
Message-Id: <20220426085114.199647-7-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the old assert_bdrv_graph_writable, and replace it with
the new version using graph-lock API.
See the function documentation for more information.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                                |  8 ++++----
 block/graph-lock.c                     | 11 +++++++++++
 include/block/block_int-global-state.h | 17 -----------------
 include/block/graph-lock.h             | 15 +++++++++++++++
 4 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/block.c b/block.c
index 6cd87e8dd3..b427d632e1 100644
--- a/block.c
+++ b/block.c
@@ -1438,7 +1438,7 @@ static bool bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
-    assert_bdrv_graph_writable(bs);
+    assert_bdrv_graph_writable();
     QLIST_INSERT_HEAD(&bs->children, child, next);
 
     /* Paired with bdrv_graph_wrlock() in bdrv_replace_child_noperm */
@@ -1466,7 +1466,7 @@ static bool bdrv_child_cb_detach(BdrvChild *child)
     /* Paired with bdrv_graph_wrunlock() in bdrv_replace_child_noperm */
     bdrv_graph_wrlock();
 
-    assert_bdrv_graph_writable(bs);
+    assert_bdrv_graph_writable();
     QLIST_REMOVE(child, next);
 
     return true;
@@ -2885,7 +2885,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
             bdrv_graph_wrlock();
         }
         locked = true;
-        assert_bdrv_graph_writable(old_bs);
+        assert_bdrv_graph_writable();
         QLIST_REMOVE(child, next_parent);
     }
 
@@ -2899,7 +2899,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
             bdrv_graph_wrlock();
             locked = true;
         }
-        assert_bdrv_graph_writable(new_bs);
+        assert_bdrv_graph_writable();
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
diff --git a/block/graph-lock.c b/block/graph-lock.c
index a2904ff6d8..0edae31545 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -214,3 +214,14 @@ void coroutine_fn bdrv_graph_co_rdunlock(void)
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
index 0f21b0570b..5078d6a6ea 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -309,21 +309,4 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
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
 #endif /* BLOCK_INT_GLOBAL_STATE */
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index f171ba0527..2211d41286 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -52,5 +52,20 @@ void coroutine_fn bdrv_graph_co_rdlock(void);
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
 #endif /* BLOCK_LOCK_H */
 
-- 
2.31.1


