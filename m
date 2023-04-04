Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87526D676B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:34:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjiex-0004gN-8p; Tue, 04 Apr 2023 11:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjieq-0004fN-Dk
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjieo-0006IC-KP
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680622392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bjyPDZXwnHGoW4spyOT0eqr5W8m5uF3NL8ShpQytmSo=;
 b=cCznBGXJm7hQgGtPcdkxqH0GlZ8GYSqY6vIzar7uUJzmhnK68ANzK0muC5+HRb807LWtqn
 h3JeEzFmDjyn7CkWzvpE7AGP999vY12sZFM+/bUaXq46hPOTov34yjRoot5Y0oeh2Hitb7
 XToShmAn0hdmzit8uN8FQxqAxmzY4g4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-1ZwQuTbrPtKfrAgv_AnkDQ-1; Tue, 04 Apr 2023 11:33:11 -0400
X-MC-Unique: 1ZwQuTbrPtKfrAgv_AnkDQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 635688996F4;
 Tue,  4 Apr 2023 15:33:10 +0000 (UTC)
Received: from localhost (unknown [10.39.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9016C492C13;
 Tue,  4 Apr 2023 15:33:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, eesposit@redhat.com
Subject: [PATCH] aio-wait: avoid AioContext lock in aio_wait_bh_oneshot()
Date: Tue,  4 Apr 2023 11:33:07 -0400
Message-Id: <20230404153307.458883-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no need for the AioContext lock in aio_wait_bh_oneshot().
It's easy to remove the lock from existing callers and then switch from
AIO_WAIT_WHILE() to AIO_WAIT_WHILE_UNLOCKED() in aio_wait_bh_oneshot().

Document that the AioContext lock should not be held across
aio_wait_bh_oneshot(). Holding a lock across aio_poll() can cause
deadlock so we don't want callers to do that.

This is a step towards getting rid of the AioContext lock.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/aio-wait.h        | 2 +-
 hw/block/dataplane/virtio-blk.c | 3 ++-
 hw/scsi/virtio-scsi-dataplane.c | 2 --
 util/aio-wait.c                 | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index da13357bb8..fdd14294ec 100644
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
index b28d81737e..e0111efd6d 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -314,9 +314,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
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
2.39.2


