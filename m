Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9083443288
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:16:51 +0100 (CET)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwSw-0000Em-T5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIc-0007mo-8a
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIW-0004Jy-TZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zK7zuw8wAudx6DwwiC1Zt7C0jsjLXQq4wFP+92nthzM=;
 b=MozNVkQtU9Er1pORCzRrj+uqmTt26IZOq8YmCTnbQaafkGtzEvcXrrK1n86O5AFB1I3t3a
 Wfez2x72CfmXceZX6maRoSDGfzy53WEqZnISRDCYFznPeQFpU7J7b5QUW7kiXsBY2rf2nd
 nrrlIH0HKB/yRFXw4Du2FUX1sg1V8Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-ff7HFMi5NLawBS3GdJrFNg-1; Tue, 02 Nov 2021 12:06:01 -0400
X-MC-Unique: ff7HFMi5NLawBS3GdJrFNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 836F28066F4;
 Tue,  2 Nov 2021 16:06:00 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DB6B5D9D3;
 Tue,  2 Nov 2021 16:05:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/12] block/nvme: Extract nvme_free_queue() from
 nvme_free_queue_pair()
Date: Tue,  2 Nov 2021 17:05:28 +0100
Message-Id: <20211102160528.206766-13-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Instead of duplicating code, extract the common helper to free
a single queue.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211006164931.172349-4-philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 0c94799a54..e4f336d79c 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -183,15 +183,20 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
     return r == 0;
 }
 
+static void nvme_free_queue(NVMeQueue *q)
+{
+    qemu_vfree(q->queue);
+}
+
 static void nvme_free_queue_pair(NVMeQueuePair *q)
 {
     trace_nvme_free_queue_pair(q->index, q, &q->cq, &q->sq);
     if (q->completion_bh) {
         qemu_bh_delete(q->completion_bh);
     }
+    nvme_free_queue(&q->sq);
+    nvme_free_queue(&q->cq);
     qemu_vfree(q->prp_list_pages);
-    qemu_vfree(q->sq.queue);
-    qemu_vfree(q->cq.queue);
     qemu_mutex_destroy(&q->lock);
     g_free(q);
 }
-- 
2.31.1


