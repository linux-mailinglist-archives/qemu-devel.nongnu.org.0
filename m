Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19B527F93
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:24:55 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqW29-0001RT-AW
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqVzO-0007sH-MJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqVzM-0000iF-Sh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652689320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8oBMAtSyM8us4xKRUT0p/YjRF50OZ7pZHObvGa7E2xk=;
 b=MEyjLfHMxrKj/yMBRn9KplugpaTUcFY8f/EJzJkkSLlHLe2+1+UvoH0jDQZ1MUr9LQEih6
 +X1SfTZfpLZVsrOv0PHSdSFZxmUkD+7rBoZqZX2cp3c3JR8nQUni4NunjAeU5zpgE584kY
 5WUoMmJCx9RilcBV7Uji2iHUV2826Fg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-nh_GHk_vMuWmO2SYHOErOQ-1; Mon, 16 May 2022 04:21:58 -0400
X-MC-Unique: nh_GHk_vMuWmO2SYHOErOQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 o10-20020aa7c7ca000000b0042a4f08405fso5600077eds.22
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 01:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8oBMAtSyM8us4xKRUT0p/YjRF50OZ7pZHObvGa7E2xk=;
 b=LL36vCXMkXoIdGE8SHbtrh1bJhEtAgQVRc2NI6Sz3j5uhjjDsGnaeVWp9SjUe8YxAL
 aGKchaUrjAzQ9qhkoFKh/5Kb6m3brWrGZun7ki9MrxpEeRHKA44OcwIPZzO5DT9sKc2G
 xjz2yfiAnVQ5GkpdgYibUvhImm4BQvfIJQ34/JEUY/PpvrHCjmgiaJxETWViWmsKVehZ
 MWKNuxNvy98FpMeM2CIL6bFIDUpNoI96x0WF7BQTnsKkfLsETrA8Z1QnTyNS9oTh0NvB
 /ZBQjE5NnEEyVFoFD4vqkMATVH8Pb5hrG43cjiouVquwanLpBipBZmksAocf/O+rsQeP
 LOIA==
X-Gm-Message-State: AOAM531H7ew9zU3aymDuPs0Du5qVosZtKdADIkVdxfIRfh5kRwvgyfgE
 QEtr90O1hKtgjM/xrbZp7Kr2/aUkuLjtYZE74uTgOZXomjARq03asZsymRXDwG0V1rEDmNRMW56
 q/3U6ljD6np36Bg9TL5Q2rdk3cZTYwgpp5+j8gSQHbz6qtQfEJ7QB5n7eqEkrFbUbZ8Q=
X-Received: by 2002:aa7:cdcd:0:b0:42a:ada8:a03f with SMTP id
 h13-20020aa7cdcd000000b0042aada8a03fmr5327923edw.322.1652689317364; 
 Mon, 16 May 2022 01:21:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSvWZeym6jXPhGwIwLdbE13fhvSjSSU3F4hKl6rqaejmqabcAgre6caW1iNzX4NjY8M2KuNg==
X-Received: by 2002:aa7:cdcd:0:b0:42a:ada8:a03f with SMTP id
 h13-20020aa7cdcd000000b0042aada8a03fmr5327894edw.322.1652689316992; 
 Mon, 16 May 2022 01:21:56 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 zd21-20020a17090698d500b006f3ef214dd0sm3424814ejb.54.2022.05.16.01.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 01:21:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Alberto Faria <afaria@redhat.com>
Subject: [PATCH v2] block/nvme: separate nvme_get_free_req cases for
 coroutine/non-coroutine context
Date: Mon, 16 May 2022 10:21:55 +0200
Message-Id: <20220516082155.1192164-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_get_free_req has very difference semantics when called in
coroutine context (when it waits) and in non-coroutine context
(when it doesn't).  Split the two cases to make it clear what
is being requested.

Cc: qemu-block@nongnu.org
Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nvme.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 01fb28aa63..3e6abef1ce 100644
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
+       trace_nvme_free_req_queue_wait(q->s, q->index);
+       qemu_co_queue_wait(&q->free_req_queue, &q->lock);
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
2.36.0


