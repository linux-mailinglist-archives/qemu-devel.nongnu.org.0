Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E227165E012
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:35:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBur-0001uO-6d; Wed, 04 Jan 2023 17:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuG-0001ht-CK
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuE-0006IS-Ox
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672870002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iakRaPjlZHRAhoFV1mLNcawbsCOENmNXEShIiIe3GoI=;
 b=KZHvSkpLanZv7HnlhZXLIiHcjW2OuyIm0cFjkm+K8V/42XElGLJJ3ciy53d18BP9xN7lOd
 WuX4DmYTWrNNREcjXyhmbyl1NhPXKMhV5ECzDzdwjruRL/9xs9PCLMGRRqpSzyB4RplCMv
 lReabBGZRItt4ajeZspfwSZjVpjBDFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-PlNzUGmTMkKPnwiocxq8Ow-1; Wed, 04 Jan 2023 17:06:40 -0500
X-MC-Unique: PlNzUGmTMkKPnwiocxq8Ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21E0E885620;
 Wed,  4 Jan 2023 22:06:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DFD62166B30;
 Wed,  4 Jan 2023 22:06:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/3] block-ram-registrar: reset when the graph changes
Date: Wed,  4 Jan 2023 17:06:31 -0500
Message-Id: <20230104220631.110321-4-stefanha@redhat.com>
In-Reply-To: <20230104220631.110321-1-stefanha@redhat.com>
References: <20230104220631.110321-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

The BDRV_REQ_REGISTERED_BUF flag can be set on I/O requests to indicate
that I/O buffers were previously registered using bdrv_register_buf().
block-ram-registrar automatically registers guest RAM so that emulated
storage controllers can set BDRV_REQ_REGISTERED_BUF without having to
worry about registering buffers themselves.

Kevin Wolf <kwolf@redhat.com> pointed out that block-ram-registrar does
not handle graph changes. This means buffers aren't unregistered when a
node is removed from the graph and buffer registrations aren't replayed
when a new node is inserted in the graph. Therefore
BDRV_REQ_REGISTERED_BUF may be set but the buffer wasn't previously
registered with the new node.

Fix this by monitoring graph changes and replaying buffer registration.
Note that the ram_block_notifier_add() API enumerates all RAM blocks so
we don't need to manually replay them.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-ram-registrar.c | 40 ++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/block/block-ram-registrar.c b/block/block-ram-registrar.c
index 25dbafa789..1a111ac124 100644
--- a/block/block-ram-registrar.c
+++ b/block/block-ram-registrar.c
@@ -33,6 +33,35 @@ static void ram_block_removed(RAMBlockNotifier *n, void *host, size_t size,
     blk_unregister_buf(r->blk, host, max_size);
 }
 
+static void remove_ram_block_notifier(BlockRAMRegistrar *r)
+{
+    if (r->ok) {
+        ram_block_notifier_remove(&r->notifier);
+    }
+}
+
+static void add_ram_block_notifier(BlockRAMRegistrar *r)
+{
+    r->ok = true; /* reset flag in case it was false */
+    ram_block_notifier_add(&r->notifier);
+}
+
+static void graph_change_pre_detach(BlockBackend *blk, void *opaque)
+{
+    BlockRAMRegistrar *r = opaque;
+
+    /* Unregisters all buffers from all BDSes */
+    remove_ram_block_notifier(r);
+}
+
+static void graph_change_post_attach(BlockBackend *blk, void *opaque)
+{
+    BlockRAMRegistrar *r = opaque;
+
+    /* Re-registers all buffers with all BDSes */
+    add_ram_block_notifier(r);
+}
+
 void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk)
 {
     r->blk = blk;
@@ -45,14 +74,15 @@ void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk)
          * value that does not change across resize.
          */
     };
-    r->ok = true;
 
-    ram_block_notifier_add(&r->notifier);
+    blk_add_graph_change_notifier(blk, graph_change_pre_detach,
+                                  graph_change_post_attach, r);
+    add_ram_block_notifier(r);
 }
 
 void blk_ram_registrar_destroy(BlockRAMRegistrar *r)
 {
-    if (r->ok) {
-        ram_block_notifier_remove(&r->notifier);
-    }
+    remove_ram_block_notifier(r);
+    blk_remove_graph_change_notifier(r->blk, graph_change_pre_detach,
+                                     graph_change_post_attach, r);
 }
-- 
2.39.0


