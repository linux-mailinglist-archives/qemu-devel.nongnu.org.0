Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1466FDDA3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:22:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipS-0002J2-Rh; Wed, 10 May 2023 08:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipJ-00028m-0s
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipD-0007do-RF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNE3CJeOLQVWGF1AGDrraNJimEbx96RxU0HYWENLISw=;
 b=dOpu3J+aGmcRUtgT3UcFkqQFL1Pv8+CXJIl665Hydy0GN2m+Jjdm2axTEKb6GVjZbG2BdN
 DGMaxLGSW5ZQ2Ww+tYEVmQSZ+PsmQ4X/M5pvUzqZz6jWfddNs22Ts3dfGXROAxwrrnuKHE
 /4GBguWVVzrdFP6caIIZ6mFUjCaxZO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-xKwbkq9cNEqsgamw35O5qQ-1; Wed, 10 May 2023 08:21:39 -0400
X-MC-Unique: xKwbkq9cNEqsgamw35O5qQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 817C0100F651;
 Wed, 10 May 2023 12:21:39 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C555518EC1;
 Wed, 10 May 2023 12:21:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/28] aio-wait: avoid AioContext lock in aio_wait_bh_oneshot()
Date: Wed, 10 May 2023 14:20:46 +0200
Message-Id: <20230510122111.46566-4-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

There is no need for the AioContext lock in aio_wait_bh_oneshot().
It's easy to remove the lock from existing callers and then switch from
AIO_WAIT_WHILE() to AIO_WAIT_WHILE_UNLOCKED() in aio_wait_bh_oneshot().

Document that the AioContext lock should not be held across
aio_wait_bh_oneshot(). Holding a lock across aio_poll() can cause
deadlock so we don't want callers to do that.

This is a step towards getting rid of the AioContext lock.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230404153307.458883-1-stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/aio-wait.h        | 2 +-
 hw/block/dataplane/virtio-blk.c | 3 ++-
 hw/scsi/virtio-scsi-dataplane.c | 2 --
 util/aio-wait.c                 | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index 6e43e3b7bb..5449b6d742 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -131,7 +131,7 @@ void aio_wait_kick(void);
  *
  * Run a BH in @ctx and wait for it to complete.
  *
- * Must be called from the main loop thread with @ctx acquired exactly once.
+ * Must be called from the main loop thread without @ctx acquired.
  * Note that main loop event processing may occur.
  */
 void aio_wait_bh_oneshot(AioContext *ctx, QEMUBHFunc *cb, void *opaque);
diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index a6202997ee..af1c24c40c 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -315,9 +315,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     s->stopping = true;
     trace_virtio_blk_data_plane_stop(s);
 
-    aio_context_acquire(s->ctx);
     aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
 
+    aio_context_acquire(s->ctx);
+
     /* Wait for virtio_blk_dma_restart_bh() and in flight I/O to complete */
     blk_drain(s->conf->conf.blk);
 
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 20bb91766e..f3214e1c57 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -197,9 +197,7 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
     }
     s->dataplane_stopping = true;
 
-    aio_context_acquire(s->ctx);
     aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
-    aio_context_release(s->ctx);
 
     blk_drain_all(); /* ensure there are no in-flight requests */
 
diff --git a/util/aio-wait.c b/util/aio-wait.c
index 98c5accd29..b5336cf5fd 100644
--- a/util/aio-wait.c
+++ b/util/aio-wait.c
@@ -82,5 +82,5 @@ void aio_wait_bh_oneshot(AioContext *ctx, QEMUBHFunc *cb, void *opaque)
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
 
     aio_bh_schedule_oneshot(ctx, aio_wait_bh, &data);
-    AIO_WAIT_WHILE(ctx, !data.done);
+    AIO_WAIT_WHILE_UNLOCKED(NULL, !data.done);
 }
-- 
2.40.1


