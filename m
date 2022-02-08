Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD974ADE71
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:38:15 +0100 (CET)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTVP-0001Ix-02
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:38:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYR-0000Iz-8s
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHSYE-0002cj-9E
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644334622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmVFxJrqQC59K0UGKZi9lS9YAYryefRrUsV+fmHbpv0=;
 b=HrIqVYx7TomDFBphq1svS+ApQ5LF+37TG+U09GzY6xyIm09ITv9lkpgpXehjbwGWuuIVmK
 e9yOvCOoc9GRURHHnjNkXnBhutCJQFtvM6KJBEyhXYaDnCi4qsyuLnNWwCHeZ6tCTr4c8k
 TP8OYALcwQ0rYuRQrx24/CkPfvj1o/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-gzbsZAtXNmKJtEQXxQAcxA-1; Tue, 08 Feb 2022 10:37:01 -0500
X-MC-Unique: gzbsZAtXNmKJtEQXxQAcxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 884BA189829C;
 Tue,  8 Feb 2022 15:37:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C56AB7D4AF;
 Tue,  8 Feb 2022 15:36:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/6] block.c: bdrv_replace_child_noperm: first remove the
 child, and then call ->detach()
Date: Tue,  8 Feb 2022 10:36:51 -0500
Message-Id: <20220208153655.1251658-3-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Doing the opposite can make ->detach() (more precisely
bdrv_unapply_subtree_drain() in bdrv_child_cb_detach) undo the subtree_drain
just performed to protect the removal of the child from the graph,
thus making the fully-enabled assert_bdrv_graph_writable fail.

Note that assert_bdrv_graph_writable is not yet fully enabled.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 4551eba2aa..ec346a7e2e 100644
--- a/block.c
+++ b/block.c
@@ -2854,14 +2854,16 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (old_bs) {
-        /* Detach first so that the recursive drain sections coming from @child
+        assert_bdrv_graph_writable(old_bs);
+        QLIST_REMOVE(child, next_parent);
+        /*
+         * Detach first so that the recursive drain sections coming from @child
          * are already gone and we only end the drain sections that came from
-         * elsewhere. */
+         * elsewhere.
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


