Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8149492BB8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:57:32 +0100 (CET)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rnX-0005WY-TM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:57:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUr-0006Ig-J4
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUo-00061L-OG
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGKVVxmZwVjsknZwXqGVwij7wFLBfaxRdt9+qmwKoJU=;
 b=JerFrF9FCrIoV27JZFCI5F1U53oh+1tIqy1aL+BnQT8/60VeJepVgQ2TNVhY4TAn69c6Je
 S0dfTRvnlAeGBqpBqOZacP4n+Xy0Z5y5EYHIfnS+uY3ce6o7T2er/SHV4wrCimxvN2JLlV
 xU6NfM9TGOQ5xtlpOdN1UGiTVUE5oYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-GrrHE2WKNq6yR45vEVzsKA-1; Tue, 18 Jan 2022 11:37:55 -0500
X-MC-Unique: GrrHE2WKNq6yR45vEVzsKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13FCA12CD92;
 Tue, 18 Jan 2022 16:28:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B63E348F8;
 Tue, 18 Jan 2022 16:28:20 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 03/12] block.c: bdrv_replace_child_noperm: first remove the
 child, and then call ->detach()
Date: Tue, 18 Jan 2022 11:27:29 -0500
Message-Id: <20220118162738.1366281-4-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 08fde585f4..29de2b62b5 100644
--- a/block.c
+++ b/block.c
@@ -2861,14 +2861,16 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
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


