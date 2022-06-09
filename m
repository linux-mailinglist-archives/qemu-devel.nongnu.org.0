Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D02A54517F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:04:13 +0200 (CEST)
Received: from localhost ([::1]:54304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKdo-0002mf-8I
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI3-0002LN-G0
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzJI1-00071F-06
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVc7XR7kpnny0nqauPvV9154qT6oVpDZKpDaKGgGkLg=;
 b=TAZtHYKUI4EEbjgxlazb83t1iMbzUsTkn94MgKEr6vq5xqG79emyOJofX3EgWoDdozBzcU
 RlhyyB9nvTRl+mSd6cTjUGzgG6hEP0gmoovZzg5EZJfAJB2hWe0Jm1ZtEQqzmtqkh6K5d2
 IEZPB0eeFtAwmm4EoJFqFNEsrhe9Bwk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-UgBpQm4YO2etoaiLXJuXFQ-1; Thu, 09 Jun 2022 10:37:33 -0400
X-MC-Unique: UgBpQm4YO2etoaiLXJuXFQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16CC538005C8;
 Thu,  9 Jun 2022 14:37:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAC4C492C3B;
 Thu,  9 Jun 2022 14:37:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 3/8] virtio_blk_process_queued_requests: always run in a bh
Date: Thu,  9 Jun 2022 10:37:22 -0400
Message-Id: <20220609143727.1151816-4-eesposit@redhat.com>
In-Reply-To: <20220609143727.1151816-1-eesposit@redhat.com>
References: <20220609143727.1151816-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function in virtio_blk_data_plane_start is directly
invoked, accessing the queued requests from the main loop,
while the device has already switched to the iothread context.

The only place where calling virtio_blk_process_queued_requests
from the main loop is allowed is when blk_set_aio_context fails,
and we still need to process the requests.

Since the logic of the bh is exactly the same as
virtio_blk_dma_restart, so rename the function and make it public
so that we can utilize it here too.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 10 +++++++++-
 hw/block/virtio-blk.c           |  4 ++--
 include/hw/virtio/virtio-blk.h  |  1 +
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index f9224f23d2..03e10a36a4 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -234,8 +234,16 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_aio_context;
     }
 
+    blk_inc_in_flight(s->conf->conf.blk);
+    /*
+     * vblk->bh is only set in virtio_blk_dma_restart_cb, which
+     * is called only on vcpu start or stop.
+     * Therefore it must be null.
+     */
+    assert(vblk->bh == NULL);
     /* Process queued requests before the ones in vring */
-    virtio_blk_process_queued_requests(vblk, false);
+    vblk->bh = aio_bh_new(blk_get_aio_context(s->conf->conf.blk),
+                          virtio_blk_restart_bh, vblk);
 
     /* Kick right away to begin processing requests already in vring */
     for (i = 0; i < nvqs; i++) {
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 191f75ce25..29a9c53ebc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -855,7 +855,7 @@ void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh)
     aio_context_release(blk_get_aio_context(s->conf.conf.blk));
 }
 
-static void virtio_blk_dma_restart_bh(void *opaque)
+void virtio_blk_restart_bh(void *opaque)
 {
     VirtIOBlock *s = opaque;
 
@@ -882,7 +882,7 @@ static void virtio_blk_dma_restart_cb(void *opaque, bool running,
      */
     if (!s->bh && !virtio_bus_ioeventfd_enabled(bus)) {
         s->bh = aio_bh_new(blk_get_aio_context(s->conf.conf.blk),
-                           virtio_blk_dma_restart_bh, s);
+                           virtio_blk_restart_bh, s);
         blk_inc_in_flight(s->conf.conf.blk);
         qemu_bh_schedule(s->bh);
     }
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index d311c57cca..c334353b5a 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -92,5 +92,6 @@ typedef struct MultiReqBuffer {
 
 void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
 void virtio_blk_process_queued_requests(VirtIOBlock *s, bool is_bh);
+void virtio_blk_restart_bh(void *opaque);
 
 #endif
-- 
2.31.1


