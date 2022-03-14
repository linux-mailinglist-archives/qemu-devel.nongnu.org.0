Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5614D85E0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:27:43 +0100 (CET)
Received: from localhost ([::1]:42942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkje-0000X1-BE
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:27:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbQ-0001KU-Mi
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbN-0006Yb-NO
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwA26UkG2+owWpWiI3GVGo6wBUh4XDA2BdTeqN1ous8=;
 b=TZpUAVOUDhwsY9YsQDUccb77UgcYhSudrjT16zPXJpLKgYcRcoIeDdYu5/ZhF/GGa7Z5Gr
 TM4GVuOYXdYAHSuoTZqnk85QKD3zEmedmaUHXa9qBCaFgxVQEf/e+SWxWL4t4mBBbitsr0
 R6nBKzHcAlR8syfgs8P1KaBFo+LIR/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-zmIC4VtjOq-gW49lpS37mg-1; Mon, 14 Mar 2022 09:19:06 -0400
X-MC-Unique: zmIC4VtjOq-gW49lpS37mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF2A9811E75;
 Mon, 14 Mar 2022 13:19:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D0FC2EF83;
 Mon, 14 Mar 2022 13:19:05 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 05/10] block.c: bdrv_replace_child_noperm: first call
 ->attach(), and then add child
Date: Mon, 14 Mar 2022 09:18:49 -0400
Message-Id: <20220314131854.2202651-6-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doing the opposite can make adding the child node to a non-drained node,
as apply_subtree_drain is only done in ->attach() and thus make
assert_bdrv_graph_writable fail.

This can happen for example during a transaction rollback (test 245,
test_io_with_graph_changes):
1. a node is removed from the graph, thus it is undrained
2. then something happens, and we need to roll back the transactions
   through tran_abort()
3. at this point, the current code would first attach the undrained node
   to the graph via QLIST_INSERT_HEAD, and then call ->attach() that
   will take care of restoring the drain with apply_subtree_drain(),
   leaving the node undrained between the two operations.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index d870ba5393..c6a550f9c6 100644
--- a/block.c
+++ b/block.c
@@ -1434,6 +1434,11 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
     *child_flags = flags;
 }
 
+/*
+ * Add the child node to child->opaque->children list,
+ * and then apply the drain to the whole child subtree,
+ * so that the drain count matches with the parent.
+ */
 static void bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
@@ -2889,8 +2894,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (new_bs) {
-        assert_bdrv_graph_writable(new_bs);
-        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
          * Detaching the old node may have led to the new node's
@@ -2901,12 +2904,19 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         assert(new_bs->quiesce_counter <= new_bs_quiesce_counter);
         drain_saldo += new_bs->quiesce_counter - new_bs_quiesce_counter;
 
-        /* Attach only after starting new drained sections, so that recursive
-         * drain sections coming from @child don't get an extra .drained_begin
-         * callback. */
+        /*
+         * First call ->attach() cb.
+         * In child_of_bds case, add child to the parent
+         * (child->opaque) ->children list and if
+         * necessary add missing drains in the child subtree.
+         */
         if (child->klass->attach) {
             child->klass->attach(child);
         }
+
+        /* Then add child to new_bs->parents list */
+        assert_bdrv_graph_writable(new_bs);
+        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
     }
 
     /*
-- 
2.31.1


