Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDAC42A08E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:05:08 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDid-0004d6-BT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDU1-0005rk-5A
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDTx-0002au-Od
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be7TcUiYqqu2cMC9kDjcjKYjHA2773D2gysXspe1eYA=;
 b=RJGLnThmQ6d+fXfF8sN0z/oOB6O8JFB0MLz7aL8aPzCiNO/NEf9AlSbRwsziPWUpi5MurI
 8t8mUj0ofstDAu7jeT7SVI8WDst8wUwMA2wocjUkl8FoS+eIErli89AcNPMrcpfhqnKWnV
 X+LiNLu77/F/Gox9HraT7R1XWI/2lGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-IndhoVN9P1ia_XxhqM4Ntg-1; Tue, 12 Oct 2021 04:49:54 -0400
X-MC-Unique: IndhoVN9P1ia_XxhqM4Ntg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F100018125CC;
 Tue, 12 Oct 2021 08:49:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0140717C8;
 Tue, 12 Oct 2021 08:49:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 08/25] block: introduce assert_bdrv_graph_writable
Date: Tue, 12 Oct 2021 04:48:49 -0400
Message-Id: <20211012084906.2060507-9-eesposit@redhat.com>
In-Reply-To: <20211012084906.2060507-1-eesposit@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be sure that the functions that write the child and
parent list of a bs are under BQL and drain.

BQL prevents from concurrent writings from the GS API, while
drains protect from I/O.

TODO: drains are missing in some functions using this assert.
Therefore a proper assertion will fail. Because adding drains
requires additional discussions, they will be added in future
series.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                                |  5 +++++
 block/io.c                             | 11 +++++++++++
 include/block/block_int-global-state.h | 10 +++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 41c5883c5c..94bff5c757 100644
--- a/block.c
+++ b/block.c
@@ -2734,12 +2734,14 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         if (child->klass->detach) {
             child->klass->detach(child);
         }
+        assert_bdrv_graph_writable(old_bs);
         QLIST_REMOVE(child, next_parent);
     }
 
     child->bs = new_bs;
 
     if (new_bs) {
+        assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
@@ -2940,6 +2942,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
         return ret;
     }
 
+    assert_bdrv_graph_writable(parent_bs);
     QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
     /*
      * child is removed in bdrv_attach_child_common_abort(), so don't care to
@@ -3140,6 +3143,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
     assert(qemu_in_main_thread());
+    assert_bdrv_graph_writable(parent);
     if (child == NULL) {
         return;
     }
@@ -4903,6 +4907,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     BdrvRemoveFilterOrCowChild *s = opaque;
     BlockDriverState *parent_bs = s->child->opaque;
 
+    assert_bdrv_graph_writable(parent_bs);
     QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
     if (s->is_backing) {
         parent_bs->backing = s->child;
diff --git a/block/io.c b/block/io.c
index f271ab3684..1c71e354d6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -740,6 +740,17 @@ void bdrv_drain_all(void)
     bdrv_drain_all_end();
 }
 
+void assert_bdrv_graph_writable(BlockDriverState *bs)
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
 /**
  * Remove an active request from the tracked requests list
  *
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index d08e80222c..6bd7746409 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -316,4 +316,12 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
  */
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
 
-#endif /* BLOCK_INT_GLOBAL_STATE*/
+/**
+ * Make sure that the function is either running under
+ * drain and BQL. The latter protects from concurrent writings
+ * from the GS API, while the former prevents concurrent reads
+ * from I/O.
+ */
+void assert_bdrv_graph_writable(BlockDriverState *bs);
+
+#endif /* BLOCK_INT_GLOBAL_STATE */
-- 
2.27.0


