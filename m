Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10E65DFB0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBuG-0001h2-Gw; Wed, 04 Jan 2023 17:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuD-0001bm-W0
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pDBuC-0006Cj-4V
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672869999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIZIt4G1FMzjSRThlfCgoXrC+ua/8mdsvSyxDF/ESn0=;
 b=ahYZ0DXWhsIt1G0RNZvB1GMqtQ0VAmhP0iV8V/g6yIr8McPB/7bbOH9MZg6edDnU/3SBpJ
 S4MYHLSpGCcTJeov92WCzJTOeNBDsJwu15Vi4y71JWcaeoVebqEpjUzXQ8ZuJItr0Ptc+2
 uoJWP5iYkYiYbFOkpCJ8pY2WL0b6RD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-5Il1ltHzMVWPIeRAB2S3Lg-1; Wed, 04 Jan 2023 17:06:35 -0500
X-MC-Unique: 5Il1ltHzMVWPIeRAB2S3Lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ABEE2999B2E;
 Wed,  4 Jan 2023 22:06:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D60152026D4B;
 Wed,  4 Jan 2023 22:06:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/3] block: add BdrvChildClass->pre_detach() and
 ->post_attach()
Date: Wed,  4 Jan 2023 17:06:29 -0500
Message-Id: <20230104220631.110321-2-stefanha@redhat.com>
In-Reply-To: <20230104220631.110321-1-stefanha@redhat.com>
References: <20230104220631.110321-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

Add callbacks for graph changes and propagate them to the root via
child_of_bds. The purpose is to respond to graph changes.

This commit doesn't do anything on its own since the callbacks aren't
used by BlockBackend's child_root yet. That will be done in the next
commit.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block_int-common.h |  8 ++++++++
 block.c                          | 34 ++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c34c525fa6..6cefde5d23 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -899,6 +899,14 @@ struct BdrvChildClass {
     void GRAPH_WRLOCK_PTR (*attach)(BdrvChild *child);
     void GRAPH_WRLOCK_PTR (*detach)(BdrvChild *child);
 
+    /*
+     * Notifies the parent that an immediate child or deeper descendant is
+     * about to be detached or has been attached. Use this to monitor graph
+     * changes. to_detach->bs and attached->bs can be NULL.
+     */
+    void (*pre_detach)(BdrvChild *child, BdrvChild *to_detach);
+    void (*post_attach)(BdrvChild *child, BdrvChild *attached);
+
     /*
      * Notifies the parent that the filename of its child has changed (e.g.
      * because the direct child was removed from the backing chain), so that it
diff --git a/block.c b/block.c
index 9c2ac757e4..e472a4b105 100644
--- a/block.c
+++ b/block.c
@@ -1402,6 +1402,30 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
     *child_flags = flags;
 }
 
+static void bdrv_child_cb_pre_detach(BdrvChild *child, BdrvChild *to_detach)
+{
+    BlockDriverState *parent_bs = child->opaque;
+    BdrvChild *grandparent;
+
+    QLIST_FOREACH(grandparent, &parent_bs->parents, next_parent) {
+        if (grandparent->klass->pre_detach) {
+            grandparent->klass->pre_detach(grandparent, to_detach);
+        }
+    }
+}
+
+static void bdrv_child_cb_post_attach(BdrvChild *child, BdrvChild *attached)
+{
+    BlockDriverState *parent_bs = child->opaque;
+    BdrvChild *grandparent;
+
+    QLIST_FOREACH(grandparent, &parent_bs->parents, next_parent) {
+        if (grandparent->klass->post_attach) {
+            grandparent->klass->post_attach(grandparent, attached);
+        }
+    }
+}
+
 static void GRAPH_WRLOCK bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
@@ -1488,6 +1512,8 @@ const BdrvChildClass child_of_bds = {
     .drained_end     = bdrv_child_cb_drained_end,
     .attach          = bdrv_child_cb_attach,
     .detach          = bdrv_child_cb_detach,
+    .pre_detach      = bdrv_child_cb_pre_detach,
+    .post_attach     = bdrv_child_cb_post_attach,
     .inactivate      = bdrv_child_cb_inactivate,
     .change_aio_ctx  = bdrv_child_cb_change_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
@@ -2873,6 +2899,10 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
+    if (child->klass->pre_detach) {
+        child->klass->pre_detach(child, child);
+    }
+
     /* TODO Pull this up into the callers to avoid polling here */
     bdrv_graph_wrlock();
     if (old_bs) {
@@ -2892,6 +2922,10 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
     bdrv_graph_wrunlock();
 
+    if (child->klass->post_attach) {
+        child->klass->post_attach(child, child);
+    }
+
     /*
      * If the parent was drained through this BdrvChild previously, but new_bs
      * is not drained, allow requests to come in only after the new node has
-- 
2.39.0


