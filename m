Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E391525F915
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:11:39 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFF3i-0004H0-UO
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2A-00026M-47
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41404
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF27-0007tX-PY
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599476999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+14JoWNtBaxhfOpoEnDB11TLZjZj+7qSIWGgBuwgPs=;
 b=IWD/Bspy5NX43unIBUv4mnt3up92w6q8+WW0wxVxVCWUHuFgY5bciCL4dIuDC8ZieYY6gW
 HY/Ebp20/7R4qH9LXK79WNNZjBTM1Ca5Sdja/QLRfPtiNp0VLpXM4bDCpv8100uq5ObqGY
 svOdTOcznmsj1gnMusml15StK4vygG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-3D3hgmuEPLCZV42rn0YU0A-1; Mon, 07 Sep 2020 07:09:56 -0400
X-MC-Unique: 3D3hgmuEPLCZV42rn0YU0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5BD1007470;
 Mon,  7 Sep 2020 11:09:55 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8FD67E43C;
 Mon,  7 Sep 2020 11:09:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/64] block/nvme: Replace qemu_try_blockalign(bs) by
 qemu_try_memalign(pg_sz)
Date: Mon,  7 Sep 2020 13:08:43 +0200
Message-Id: <20200907110936.261684-12-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

qemu_try_blockalign() is a generic API that call back to the
block driver to return its page alignment. As we call from
within the very same driver, we already know to page alignment
stored in our state. Remove indirections and use the value from
BDRVNVMeState.
This change is required to later remove the BlockDriverState
argument, to make nvme_init_queue() per hardware, and not per
block driver.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200821195359.1285345-11-philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 60e39b69a2..0c8ad1d60b 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -174,7 +174,7 @@ static void nvme_init_queue(BlockDriverState *bs, NVMeQueue *q,
 
     bytes = ROUND_UP(nentries * entry_bytes, s->page_size);
     q->head = q->tail = 0;
-    q->queue = qemu_try_blockalign(bs, bytes);
+    q->queue = qemu_try_memalign(s->page_size, bytes);
     if (!q->queue) {
         error_setg(errp, "Cannot allocate queue");
         return;
@@ -223,7 +223,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BlockDriverState *bs,
     if (!q) {
         return NULL;
     }
-    q->prp_list_pages = qemu_try_blockalign(bs,
+    q->prp_list_pages = qemu_try_memalign(s->page_size,
                                           s->page_size * NVME_NUM_REQS);
     if (!q->prp_list_pages) {
         goto fail;
@@ -522,7 +522,7 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
         .cdw10 = cpu_to_le32(0x1),
     };
 
-    id = qemu_try_blockalign(bs, sizeof(*id));
+    id = qemu_try_memalign(s->page_size, sizeof(*id));
     if (!id) {
         error_setg(errp, "Cannot allocate buffer for identify response");
         goto out;
@@ -1141,7 +1141,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         return nvme_co_prw_aligned(bs, offset, bytes, qiov, is_write, flags);
     }
     trace_nvme_prw_buffered(s, offset, bytes, qiov->niov, is_write);
-    buf = qemu_try_blockalign(bs, bytes);
+    buf = qemu_try_memalign(s->page_size, bytes);
 
     if (!buf) {
         return -ENOMEM;
@@ -1285,7 +1285,7 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
 
     assert(s->nr_queues > 1);
 
-    buf = qemu_try_blockalign(bs, s->page_size);
+    buf = qemu_try_memalign(s->page_size, s->page_size);
     if (!buf) {
         return -ENOMEM;
     }
-- 
2.25.4


