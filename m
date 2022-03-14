Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA94D85FC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:33:33 +0100 (CET)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkpI-0007s9-CN
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:33:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbS-0001LX-Vx
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbP-0006ZR-Jq
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzStFwdvLrDQ5LppXBc0Qr/kvfpfQchE3OdsAkM8lKA=;
 b=VQAbBor2pG/seIBWb35CrmsEQ5jMC67g9OblSOl/0HyuHEaZ6VYRrQSeRwp0z3Py6sSUST
 1u6S0LUuuo2eJZWyPyB14ZnwBvgubSBw6lX+C4fKFxZpPphFs4w5r2vUDKsnC9IpB/28HX
 i790bKsO71LVKzTMg3ztrG28uQYbuio=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-8_tQy9sAPB2xq-dFU673yw-1; Mon, 14 Mar 2022 09:19:05 -0400
X-MC-Unique: 8_tQy9sAPB2xq-dFU673yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 663F5833965;
 Mon, 14 Mar 2022 13:19:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221E62EF83;
 Mon, 14 Mar 2022 13:19:05 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 04/10] block.c: bdrv_replace_child_noperm: first remove the
 child, and then call ->detach()
Date: Mon, 14 Mar 2022 09:18:48 -0400
Message-Id: <20220314131854.2202651-5-eesposit@redhat.com>
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

Doing the opposite can make ->detach() (more precisely
bdrv_unapply_subtree_drain() in bdrv_child_cb_detach) undo the subtree_drain
just performed to protect the removal of the child from the graph,
thus making the fully-enabled assert_bdrv_graph_writable fail.

Note that assert_bdrv_graph_writable is not yet fully enabled.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 372f16f4a0..d870ba5393 100644
--- a/block.c
+++ b/block.c
@@ -1448,6 +1448,11 @@ static void bdrv_child_cb_attach(BdrvChild *child)
     bdrv_apply_subtree_drain(child, bs);
 }
 
+/*
+ * Unapply the drain in the whole child subtree, as
+ * it has been already detached, and then remove from
+ * child->opaque->children.
+ */
 static void bdrv_child_cb_detach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
@@ -2864,14 +2869,18 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (old_bs) {
-        /* Detach first so that the recursive drain sections coming from @child
-         * are already gone and we only end the drain sections that came from
-         * elsewhere. */
+        /* First remove child from child->bs->parents list */
+        assert_bdrv_graph_writable(old_bs);
+        QLIST_REMOVE(child, next_parent);
+        /*
+         * Then call ->detach() cb.
+         * In child_of_bds case, update the child parent
+         * (child->opaque) ->children list and
+         * remove any drain left in the child subtree.
+         */
         if (child->klass->detach) {
             child->klass->detach(child);
         }
-        assert_bdrv_graph_writable(old_bs);
-        QLIST_REMOVE(child, next_parent);
     }
 
     child->bs = new_bs;
-- 
2.31.1


