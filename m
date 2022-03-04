Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CE4CDA50
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:25:12 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBfz-00061A-Rh
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:25:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB65-0005e5-0x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB60-0007UQ-Fl
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwdYSln28P0cgho2n9dOjg1ckh7jWGmPCv0bJAJkjRs=;
 b=QjEUI4wxVp8KybbHMcg3/l+CJJqNIR/g+wg8L43grd3p0YXSuDgvkURQFmbQka+mem56UQ
 0kEWb8yrt3XFpvcTvE7XyDUl5st5WPrDSf0vzSoP/G/UDxYH4fr+xASKxIJxs5A/762MH0
 yok72DIW3VotEAkYM4krXj2zApq2lws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-oJ8kLsqfOQWy6cGFvKG5LA-1; Fri, 04 Mar 2022 11:47:54 -0500
X-MC-Unique: oJ8kLsqfOQWy6cGFvKG5LA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B22FA180FD72;
 Fri,  4 Mar 2022 16:47:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5F4383BF9;
 Fri,  4 Mar 2022 16:47:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 27/50] block: introduce assert_bdrv_graph_writable
Date: Fri,  4 Mar 2022 17:46:48 +0100
Message-Id: <20220304164711.474713-28-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

We want to be sure that the functions that write the child and
parent list of a bs are under BQL and drain.

BQL prevents from concurrent writings from the GS API, while
drains protect from I/O.

TODO: drains are missing in some functions using this assert.
Therefore a proper assertion will fail. Because adding drains
requires additional discussions, they will be added in future
series.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-15-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-global-state.h | 17 +++++++++++++++++
 block.c                                |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index 5078d6a6ea..0f21b0570b 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -309,4 +309,21 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
  */
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
 
+/**
+ * Make sure that the function is running under both drain and BQL.
+ * The latter protects from concurrent writings
+ * from the GS API, while the former prevents concurrent reads
+ * from I/O.
+ */
+static inline void assert_bdrv_graph_writable(BlockDriverState *bs)
+{
+    /*
+     * TODO: this function is incomplete. Because the users of this
+     * assert lack the necessary drains, check only for BQL.
+     * Once the necessary drains are added,
+     * assert also for qatomic_read(&bs->quiesce_counter) > 0
+     */
+    assert(qemu_in_main_thread());
+}
+
 #endif /* BLOCK_INT_GLOBAL_STATE */
diff --git a/block.c b/block.c
index f2a7350548..fe05df471a 100644
--- a/block.c
+++ b/block.c
@@ -1420,6 +1420,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
+    assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
 
     if (child->role & BDRV_CHILD_COW) {
@@ -1439,6 +1440,7 @@ static void bdrv_child_cb_detach(BdrvChild *child)
 
     bdrv_unapply_subtree_drain(child, bs);
 
+    assert_bdrv_graph_writable(bs);
     QLIST_REMOVE(child, next);
 }
 
@@ -2829,6 +2831,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         if (child->klass->detach) {
             child->klass->detach(child);
         }
+        assert_bdrv_graph_writable(old_bs);
         QLIST_REMOVE(child, next_parent);
     }
 
@@ -2838,6 +2841,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (new_bs) {
+        assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
-- 
2.35.1


