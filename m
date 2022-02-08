Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD44AE0BB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:26:58 +0100 (CET)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVCb-0006Ln-6g
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYe-0000Tx-Vd
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYE-0002eN-Py
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3/bM+4lQ/kO8LqzI5XVk+qD+YU+/kn83G35vECh8vc=;
 b=IGxeC9XLLIGscyPH0WKYCMfasnYj9UWe02I6S0sR+vpADm3tHFnOTG+gYQxufHw7R8ENmZ
 vUFD0Aws81tsGg7orAPteapZwhA1dvjvWZP1yWoe3U+etotBvKecoLXKdIF8MnMEEODMgk
 Hqn9RPCeMTLKWlF7X2q0UyDfDNjNLm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-ppz_WKFLNY2TlK3DmFm3Tg-1; Tue, 08 Feb 2022 10:37:03 -0500
X-MC-Unique: ppz_WKFLNY2TlK3DmFm3Tg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66956363A6;
 Tue,  8 Feb 2022 15:37:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2DF07D473;
 Tue,  8 Feb 2022 15:37:00 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/6] block.c: bdrv_replace_child_noperm: first call ->attach(),
 and then add child
Date: Tue,  8 Feb 2022 10:36:52 -0500
Message-Id: <20220208153655.1251658-4-eesposit@redhat.com>
In-Reply-To: <20220208153655.1251658-1-eesposit@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 block.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index ec346a7e2e..08a6e3a4ef 100644
--- a/block.c
+++ b/block.c
@@ -2872,8 +2872,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (new_bs) {
-        assert_bdrv_graph_writable(new_bs);
-        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
          * Detaching the old node may have led to the new node's
@@ -2890,6 +2888,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         if (child->klass->attach) {
             child->klass->attach(child);
         }
+
+        assert_bdrv_graph_writable(new_bs);
+        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
+
     }
 
     /*
-- 
2.31.1


