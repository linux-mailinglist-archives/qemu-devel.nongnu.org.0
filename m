Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFF65DFD4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBuq-0001io-RI; Wed, 04 Jan 2023 17:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuF-0001gv-FF
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuD-0006Hm-M0
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672870001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryUcQzn7G+fFA92ZvAcmDgJCaRRZJzx8a6/DZd99lrg=;
 b=bL++uNQXRfgcGtMne20+DeO2VATfwyzlPxr2lX+cVS0rz4PsBim3iTijP2BmA5qqN3aBBg
 /vAoPlKZvla2lDWXxnoQuRnZLhuoCXbtaRCPPzeChWuQ5QN0xLAY9sSNNObrrDBxS6sS6f
 E1NtQpBnjBW0xB3ehVs5P0p7fR8fZ50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-P634D3NbNZes5Amu3k-QlQ-1; Wed, 04 Jan 2023 17:06:38 -0500
X-MC-Unique: P634D3NbNZes5Amu3k-QlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF7CF181E3EE;
 Wed,  4 Jan 2023 22:06:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EC562166B31;
 Wed,  4 Jan 2023 22:06:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/3] block-backend: add graph change notifier API
Date: Wed,  4 Jan 2023 17:06:30 -0500
Message-Id: <20230104220631.110321-3-stefanha@redhat.com>
In-Reply-To: <20230104220631.110321-1-stefanha@redhat.com>
References: <20230104220631.110321-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

The existing blk_add_insert_bs_notifier() and
blk_add_remove_bs_notifier() APIs only monitor changes to the
BlockBackend's root node. There is no way to find out if other nodes are
inserted or removed.

Add an API to monitor changes to the full graph. The next commit will
use this to reset blk_ram_registrar so that
blk_register_buf()/blk_unregister_buf() is called as nodes are
inserted/removed anywhere in the graph.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/sysemu/block-backend-global-state.h | 10 +++
 block/block-backend.c                       | 79 +++++++++++++++++++++
 block/trace-events                          |  2 +
 3 files changed, 91 insertions(+)

diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 6858e39cb6..736df34bf0 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -89,6 +89,16 @@ void blk_remove_aio_context_notifier(BlockBackend *blk,
                                      void *opaque);
 void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify);
 void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify);
+void blk_add_graph_change_notifier(BlockBackend *blk,
+                                   void (*pre_detach)(BlockBackend *, void *),
+                                   void (*post_attach)(BlockBackend *, void *),
+                                   void *opaque);
+void blk_remove_graph_change_notifier(BlockBackend *blk,
+                                      void (*pre_detach)(BlockBackend *,
+                                                         void *),
+                                      void (*post_attach)(BlockBackend *,
+                                                          void *),
+                                      void *opaque);
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk);
 void blk_update_root_state(BlockBackend *blk);
 bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index ba7bf1d6bc..40d958ffad 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -42,6 +42,13 @@ typedef struct BlockBackendAioNotifier {
     QLIST_ENTRY(BlockBackendAioNotifier) list;
 } BlockBackendAioNotifier;
 
+typedef struct BlockBackendGraphChangeNotifier {
+    void (*pre_detach)(BlockBackend *blk, void *opaque);
+    void (*post_attach)(BlockBackend *blk, void *opaque);
+    void *opaque;
+    QLIST_ENTRY(BlockBackendGraphChangeNotifier) list;
+} BlockBackendGraphChangeNotifier;
+
 struct BlockBackend {
     char *name;
     int refcnt;
@@ -79,6 +86,7 @@ struct BlockBackend {
     /* Protected by BQL */
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
+    QLIST_HEAD(, BlockBackendGraphChangeNotifier) graph_change_notifiers;
 
     int quiesce_counter;
     CoQueue queued_requests;
@@ -308,6 +316,36 @@ static void blk_root_detach(BdrvChild *child)
     }
 }
 
+static void blk_root_pre_detach(BdrvChild *child, BdrvChild *to_detach)
+{
+    BlockBackend *blk = child->opaque;
+    BlockBackendGraphChangeNotifier *notifier;
+    BlockBackendGraphChangeNotifier *next;
+
+    trace_blk_root_pre_detach(child, blk, to_detach, to_detach->bs);
+
+    QLIST_FOREACH_SAFE(notifier, &blk->graph_change_notifiers, list, next) {
+        if (notifier->pre_detach) {
+            notifier->pre_detach(blk, notifier->opaque);
+        }
+    }
+}
+
+static void blk_root_post_attach(BdrvChild *child, BdrvChild *attached)
+{
+    BlockBackend *blk = child->opaque;
+    BlockBackendGraphChangeNotifier *notifier;
+    BlockBackendGraphChangeNotifier *next;
+
+    trace_blk_root_post_attach(child, blk, attached, attached->bs);
+
+    QLIST_FOREACH_SAFE(notifier, &blk->graph_change_notifiers, list, next) {
+        if (notifier->post_attach) {
+            notifier->post_attach(blk, notifier->opaque);
+        }
+    }
+}
+
 static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
 {
     BlockBackend *blk = c->opaque;
@@ -334,6 +372,9 @@ static const BdrvChildClass child_root = {
     .attach             = blk_root_attach,
     .detach             = blk_root_detach,
 
+    .pre_detach         = blk_root_pre_detach,
+    .post_attach        = blk_root_post_attach,
+
     .change_aio_ctx     = blk_root_change_aio_ctx,
 
     .get_parent_aio_context = blk_root_get_parent_aio_context,
@@ -372,6 +413,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
     notifier_list_init(&blk->remove_bs_notifiers);
     notifier_list_init(&blk->insert_bs_notifiers);
     QLIST_INIT(&blk->aio_notifiers);
+    QLIST_INIT(&blk->graph_change_notifiers);
 
     QTAILQ_INSERT_TAIL(&block_backends, blk, link);
     return blk;
@@ -485,6 +527,7 @@ static void blk_delete(BlockBackend *blk)
     assert(QLIST_EMPTY(&blk->remove_bs_notifiers.notifiers));
     assert(QLIST_EMPTY(&blk->insert_bs_notifiers.notifiers));
     assert(QLIST_EMPTY(&blk->aio_notifiers));
+    assert(QLIST_EMPTY(&blk->graph_change_notifiers));
     QTAILQ_REMOVE(&block_backends, blk, link);
     drive_info_del(blk->legacy_dinfo);
     block_acct_cleanup(&blk->stats);
@@ -2315,6 +2358,42 @@ void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
     notifier_list_add(&blk->insert_bs_notifiers, notify);
 }
 
+void blk_add_graph_change_notifier(BlockBackend *blk,
+        void (*pre_detach)(BlockBackend *blk, void *),
+        void (*post_attach)(BlockBackend *blk, void *),
+        void *opaque)
+{
+    BlockBackendGraphChangeNotifier *notifier;
+    GLOBAL_STATE_CODE();
+
+    notifier = g_new(BlockBackendGraphChangeNotifier, 1);
+    notifier->pre_detach = pre_detach;
+    notifier->post_attach = post_attach;
+    notifier->opaque = opaque;
+    QLIST_INSERT_HEAD(&blk->graph_change_notifiers, notifier, list);
+}
+
+void blk_remove_graph_change_notifier(BlockBackend *blk,
+        void (*pre_detach)(BlockBackend *blk, void *),
+        void (*post_attach)(BlockBackend *blk, void *),
+        void *opaque)
+{
+    BlockBackendGraphChangeNotifier *notifier;
+    GLOBAL_STATE_CODE();
+
+    QLIST_FOREACH(notifier, &blk->graph_change_notifiers, list) {
+        if (notifier->pre_detach == pre_detach &&
+            notifier->post_attach == post_attach &&
+            notifier->opaque == opaque) {
+            QLIST_REMOVE(notifier, list);
+            g_free(notifier);
+            return;
+        }
+    }
+
+    abort();
+}
+
 void blk_io_plug(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/trace-events b/block/trace-events
index 48dbf10c66..74f05b50b9 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -9,6 +9,8 @@ blk_co_preadv(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "bl
 blk_co_pwritev(void *blk, void *bs, int64_t offset, int64_t bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %" PRId64 " flags 0x%x"
 blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
+blk_root_pre_detach(void *child, void *blk, void *to_detach, void *to_detach_bs) "child %p blk %p to_detach %p to_detach_bs %p"
+blk_root_post_attach(void *child, void *blk, void *attached, void *attached_bs) "child %p blk %p attached %p attached_bs %p"
 
 # io.c
 bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
-- 
2.39.0


