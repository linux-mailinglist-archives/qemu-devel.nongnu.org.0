Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA99443272
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:13:34 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwPl-0002nJ-4U
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIb-0007lM-Ve
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIW-0004K0-CD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JciCBD3DZLZ3Q+V7JsXT0AugNYkoRXJL+ENH06WOXvc=;
 b=QmU+V1HP5LzLVvgKKbc8UVEruWdquTtkr7YXp5MmCBcCZozY/v3xCtp6OjQQBacbPFNKBl
 4MqIJTZMHF+xvqVFsmlvivH7nU04viRwp6y746TsBHpqEE+JwAtZTv2aByDijwDHq/yxU+
 F5N3ai2i+x+OprRoKJVeXC/0NLF2jZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-I3qmccdnMemmKzDX1G_d0w-1; Tue, 02 Nov 2021 12:06:00 -0400
X-MC-Unique: I3qmccdnMemmKzDX1G_d0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4590C9F92B;
 Tue,  2 Nov 2021 16:05:59 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 501415D9D3;
 Tue,  2 Nov 2021 16:05:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/12] block/nvme: Display CQ/SQ pointer in
 nvme_free_queue_pair()
Date: Tue,  2 Nov 2021 17:05:27 +0100
Message-Id: <20211102160528.206766-12-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For debugging purpose it is helpful to know the CQ/SQ pointers.
We already have a trace event in nvme_free_queue_pair(), extend
it to report these pointer addresses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211006164931.172349-3-philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c       | 2 +-
 block/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index fefcc04abe..0c94799a54 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -185,7 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
 
 static void nvme_free_queue_pair(NVMeQueuePair *q)
 {
-    trace_nvme_free_queue_pair(q->index, q);
+    trace_nvme_free_queue_pair(q->index, q, &q->cq, &q->sq);
     if (q->completion_bh) {
         qemu_bh_delete(q->completion_bh);
     }
diff --git a/block/trace-events b/block/trace-events
index ab56edacb4..549090d453 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -157,7 +157,7 @@ nvme_dsm_done(void *s, int64_t offset, int64_t bytes, int ret) "s %p offset 0x%"
 nvme_dma_map_flush(void *s) "s %p"
 nvme_free_req_queue_wait(void *s, unsigned q_index) "s %p q #%u"
 nvme_create_queue_pair(unsigned q_index, void *q, size_t size, void *aio_context, int fd) "index %u q %p size %zu aioctx %p fd %d"
-nvme_free_queue_pair(unsigned q_index, void *q) "index %u q %p"
+nvme_free_queue_pair(unsigned q_index, void *q, void *cq, void *sq) "index %u q %p cq %p sq %p"
 nvme_cmd_map_qiov(void *s, void *cmd, void *req, void *qiov, int entries) "s %p cmd %p req %p qiov %p entries %d"
 nvme_cmd_map_qiov_pages(void *s, int i, uint64_t page) "s %p page[%d] 0x%"PRIx64
 nvme_cmd_map_qiov_iov(void *s, int i, void *page, int pages) "s %p iov[%d] %p pages %d"
-- 
2.31.1


