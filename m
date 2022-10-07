Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA45F773B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:14:39 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglJO-0000cN-Jl
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkts-0005PK-6h
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktp-00036F-0I
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPGLStqfSRWeoJcwTxaRu0W43qQhKFRZOxVoH3u8sXw=;
 b=ORiw7a5zIcqnSzWsNbnEp2wdpRJfCA+wQoQADaOlN0qe92O3dMOMMZ8MfYkM/f8PQ9rO74
 5o/6seHPpGreDIP7uUjhHjCjf4s+zTr1gfVa+29QtFOrf2uPD0Yl+ghprgCEkbMZsVmotP
 Pw3X4rK20YtFnLoqsxZFv6s3CXeyZT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-pmoya3qrMnm-JjGpgQOGTA-1; Fri, 07 Oct 2022 06:48:04 -0400
X-MC-Unique: pmoya3qrMnm-JjGpgQOGTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0889811E87;
 Fri,  7 Oct 2022 10:48:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD7122024CBB;
 Fri,  7 Oct 2022 10:48:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/50] block/nvme: separate nvme_get_free_req cases for
 coroutine/non-coroutine context
Date: Fri,  7 Oct 2022 12:47:05 +0200
Message-Id: <20221007104752.141361-4-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

nvme_get_free_req has very difference semantics when called in
coroutine context (where it waits) and in non-coroutine context
(where it doesn't).  Split the two cases to make it clear what
is being requested.

Cc: qemu-block@nongnu.org
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-2-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nvme.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 01fb28aa63..0870f87bc6 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -293,34 +293,42 @@ static void nvme_kick(NVMeQueuePair *q)
     q->need_kick = 0;
 }
 
-/* Find a free request element if any, otherwise:
- * a) if in coroutine context, try to wait for one to become available;
- * b) if not in coroutine, return NULL;
- */
-static NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
+static NVMeRequest *nvme_get_free_req_nofail_locked(NVMeQueuePair *q)
 {
     NVMeRequest *req;
 
-    qemu_mutex_lock(&q->lock);
-
-    while (q->free_req_head == -1) {
-        if (qemu_in_coroutine()) {
-            trace_nvme_free_req_queue_wait(q->s, q->index);
-            qemu_co_queue_wait(&q->free_req_queue, &q->lock);
-        } else {
-            qemu_mutex_unlock(&q->lock);
-            return NULL;
-        }
-    }
-
     req = &q->reqs[q->free_req_head];
     q->free_req_head = req->free_req_next;
     req->free_req_next = -1;
-
-    qemu_mutex_unlock(&q->lock);
     return req;
 }
 
+/* Return a free request element if any, otherwise return NULL.  */
+static NVMeRequest *nvme_get_free_req_nowait(NVMeQueuePair *q)
+{
+    QEMU_LOCK_GUARD(&q->lock);
+    if (q->free_req_head == -1) {
+        return NULL;
+    }
+    return nvme_get_free_req_nofail_locked(q);
+}
+
+/*
+ * Wait for a free request to become available if necessary, then
+ * return it.
+ */
+static coroutine_fn NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
+{
+    QEMU_LOCK_GUARD(&q->lock);
+
+    while (q->free_req_head == -1) {
+        trace_nvme_free_req_queue_wait(q->s, q->index);
+        qemu_co_queue_wait(&q->free_req_queue, &q->lock);
+    }
+
+    return nvme_get_free_req_nofail_locked(q);
+}
+
 /* With q->lock */
 static void nvme_put_free_req_locked(NVMeQueuePair *q, NVMeRequest *req)
 {
@@ -506,7 +514,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
     AioContext *aio_context = bdrv_get_aio_context(bs);
     NVMeRequest *req;
     int ret = -EINPROGRESS;
-    req = nvme_get_free_req(q);
+    req = nvme_get_free_req_nowait(q);
     if (!req) {
         return -EBUSY;
     }
-- 
2.37.3


