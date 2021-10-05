Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0F422B73
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:48:01 +0200 (CEST)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXljX-0001e0-33
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlX3-0003Gi-IX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlX0-0004g8-Kk
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ME81RfnCl/3WTd5GL32ef7DJwA2zOrVaUa7UEoJ5j9A=;
 b=b/Q4/EDKUcaEJEjRz/Nw96DunNTfHK7rzaRDOKNwk5zxzs3R19IfPfROr386vLYJCajqgt
 a1tK4MVgGIO2rMAiDq3QYipdjXAjDWvmG7uwq8cDMHgmK7v1voL6/UN3fk1Bk1cX4mrepM
 uOkuHIFsJPCuk7lbi24LCLiS9j2qeO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-P8dUiySyNTe-hIOnVyn2-g-1; Tue, 05 Oct 2021 10:34:57 -0400
X-MC-Unique: P8dUiySyNTe-hIOnVyn2-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB58D802935;
 Tue,  5 Oct 2021 14:34:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 979801002391;
 Tue,  5 Oct 2021 14:34:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 08/25] block: introduce assert_bdrv_graph_writable
Date: Tue,  5 Oct 2021 10:31:58 -0400
Message-Id: <20211005143215.29500-9-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
parent list of a bs are either under BQL or drain.
If this guarantee holds, then we can read the list also in the I/O APIs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                                | 5 +++++
 block/io.c                             | 5 +++++
 include/block/block_int-global-state.h | 8 +++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index b912f517a4..7d1eb847a4 100644
--- a/block.c
+++ b/block.c
@@ -2711,12 +2711,14 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
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
@@ -2917,6 +2919,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
         return ret;
     }
 
+    assert_bdrv_graph_writable(parent_bs);
     QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
     /*
      * child is removed in bdrv_attach_child_common_abort(), so don't care to
@@ -3117,6 +3120,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
     g_assert(qemu_in_main_thread());
+    assert_bdrv_graph_writable(parent);
     if (child == NULL) {
         return;
     }
@@ -4878,6 +4882,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     BdrvRemoveFilterOrCowChild *s = opaque;
     BlockDriverState *parent_bs = s->child->opaque;
 
+    assert_bdrv_graph_writable(parent_bs);
     QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
     if (s->is_backing) {
         parent_bs->backing = s->child;
diff --git a/block/io.c b/block/io.c
index 21dcc5d962..d184183b07 100644
--- a/block/io.c
+++ b/block/io.c
@@ -739,6 +739,11 @@ void bdrv_drain_all(void)
     bdrv_drain_all_end();
 }
 
+void assert_bdrv_graph_writable(BlockDriverState *bs)
+{
+    g_assert(qatomic_read(&bs->quiesce_counter) > 0 || qemu_in_main_thread());
+}
+
 /**
  * Remove an active request from the tracked requests list
  *
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index aad549cb85..a53ab146fc 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -343,4 +343,10 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
  */
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
 
-#endif /* BLOCK_INT_GLOBAL_STATE*/
+/**
+ * Make sure that the function is either running under
+ * drain, or under BQL.
+ */
+void assert_bdrv_graph_writable(BlockDriverState *bs);
+
+#endif /* BLOCK_INT_GLOBAL_STATE */
-- 
2.27.0


