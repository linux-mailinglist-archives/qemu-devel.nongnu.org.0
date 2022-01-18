Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCB492BDA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:05:55 +0100 (CET)
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rvc-00052a-L1
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rVL-00075S-S0
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rVK-00065B-2f
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mN4YprAtPYLW25ybvOA6+PmPtLEmh4URozvfVnbu10=;
 b=ERGBlA7kVU3JU4hzMc1Jkjdw82qFHiEoFQ6CVqsA7gBfszG/aFj9yoOkE6uVSs8dUpD9dt
 mrN9feqD4FgsjpqpHPV21emwav0Fwsgc6YzvDkKnkNxrRWiJoyJGlplRQvVJnNQ4NrozdA
 X7z5DLaTlDD1tvd6qxtUUfPHykO6gFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-oRJkJsH1PKuYVcqVOBXReA-1; Tue, 18 Jan 2022 11:38:39 -0500
X-MC-Unique: oRJkJsH1PKuYVcqVOBXReA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA3AC10C44BB;
 Tue, 18 Jan 2022 16:28:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CEF034D3F;
 Tue, 18 Jan 2022 16:28:21 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 04/12] block.c: bdrv_replace_child_noperm: first call
 ->attach(), and then add child
Date: Tue, 18 Jan 2022 11:27:30 -0500
Message-Id: <20220118162738.1366281-5-eesposit@redhat.com>
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
index 29de2b62b5..fb5bc3077a 100644
--- a/block.c
+++ b/block.c
@@ -2879,8 +2879,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (new_bs) {
-        assert_bdrv_graph_writable(new_bs);
-        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
         /*
          * Detaching the old node may have led to the new node's
@@ -2897,6 +2895,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
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


