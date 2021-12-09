Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF046EB11
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:23:25 +0100 (CET)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLGW-0006tw-LK
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:23:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvLEx-0005KP-Gx
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvLEr-0000O3-RP
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639063301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NleFn46vLgnZVZBBV75dK3g+gTfMwS93mNu5jXTZBsI=;
 b=S8qgBj3HRr2TlXAqNHwb364XFqiNvC3vur6gkVHGywx43CV1qNkUg1QL2HgILJk71wzqtF
 z+XiG56rhoXH2MbnRzmP90Y83HzsLzH4D6t6M81ncs6XWKAf/PArk1pOAK3v4TMaA1u148
 +6wntdTJzfsBnLa3bc4EUwuy8CWoeGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-rTIw1VkYM52ENzn5ahjCjA-1; Thu, 09 Dec 2021 10:21:38 -0500
X-MC-Unique: rTIw1VkYM52ENzn5ahjCjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 185D485EE60;
 Thu,  9 Dec 2021 15:21:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCE1119C59;
 Thu,  9 Dec 2021 15:21:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] block/nvme: fix infinite loop in nvme_free_req_queue_cb()
Date: Thu,  9 Dec 2021 15:21:17 +0000
Message-Id: <20211209152117.383832-2-stefanha@redhat.com>
In-Reply-To: <20211209152117.383832-1-stefanha@redhat.com>
References: <20211209152117.383832-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the request free list is exhausted the coroutine waits on
q->free_req_queue for the next free request. Whenever a request is
completed a BH is scheduled to invoke nvme_free_req_queue_cb() and wake
up waiting coroutines.

1. nvme_get_free_req() waits for a free request:

    while (q->free_req_head == -1) {
        ...
            trace_nvme_free_req_queue_wait(q->s, q->index);
            qemu_co_queue_wait(&q->free_req_queue, &q->lock);
        ...
    }

2. nvme_free_req_queue_cb() wakes up the coroutine:

    while (qemu_co_enter_next(&q->free_req_queue, &q->lock)) {
       ^--- infinite loop when free_req_head == -1
    }

nvme_free_req_queue_cb() and the coroutine form an infinite loop when
q->free_req_head == -1. Fix this by checking q->free_req_head in
nvme_free_req_queue_cb(). If the free request list is exhausted, don't
wake waiting coroutines. Eventually an in-flight request will complete
and the BH will be scheduled again, guaranteeing forward progress.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20211208152246.244585-1-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nvme.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index e4f336d79c..fa360b9b3c 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -206,8 +206,9 @@ static void nvme_free_req_queue_cb(void *opaque)
     NVMeQueuePair *q = opaque;
 
     qemu_mutex_lock(&q->lock);
-    while (qemu_co_enter_next(&q->free_req_queue, &q->lock)) {
-        /* Retry all pending requests */
+    while (q->free_req_head != -1 &&
+           qemu_co_enter_next(&q->free_req_queue, &q->lock)) {
+        /* Retry waiting requests */
     }
     qemu_mutex_unlock(&q->lock);
 }
-- 
2.33.1


