Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017DF46364C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 15:15:03 +0100 (CET)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms3uP-0004bo-Hv
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 09:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ms3Sg-0000yN-C3
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ms3SN-0003OG-UU
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638279963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NNMhrC17Nc4UiLsjmwAwkFTZ+u+tqHjg0AYCS9rxQQs=;
 b=Cp372UxtX9y+VJaF7hgeXU18dnnATl+xy3yRICIoXYH7XRvr34iWtbVrYkBF34eV9ISnfJ
 O/KAf+vKbolv28PezOn03CVB8BG0JjxUEqQMe4bCEFkqoo/YclIHZ+HKFtV7ozgFtTjNI9
 nfGxjZgHak0EKbJyAL7MEaz+95HiD+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Q1tfJCT_OtGghvl6daiXag-1; Tue, 30 Nov 2021 08:46:01 -0500
X-MC-Unique: Q1tfJCT_OtGghvl6daiXag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C73D61B2C993;
 Tue, 30 Nov 2021 13:46:00 +0000 (UTC)
Received: from localhost (unknown [10.39.195.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D252210016FE;
 Tue, 30 Nov 2021 13:45:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio: signal after wrapping packed used_idx
Date: Tue, 30 Nov 2021 13:45:10 +0000
Message-Id: <20211130134510.267382-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Tiwei Bie <tiwei.bie@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Packed Virtqueues wrap used_idx instead of letting it run freely like
Split Virtqueues do. If the used ring wraps more than once there is no
way to compare vq->signalled_used and vq->used_idx in
virtio_packed_should_notify() since they are modulo vq->vring.num.

This causes the device to stop sending used buffer notifications when
when virtio_packed_should_notify() is called less than once each time
around the used ring.

It is possible to trigger this with virtio-blk's dataplane
notify_guest_bh() irq coalescing optimization. The call to
virtio_notify_irqfd() (and virtio_packed_should_notify()) is deferred to
a BH. If the guest driver is polling it can complete and submit more
requests before the BH executes, causing the used ring to wrap more than
once. The result is that the virtio-blk device ceases to raise
interrupts and I/O hangs.

Cc: Tiwei Bie <tiwei.bie@intel.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
Smarter solutions welcome, but I think notifying once per vq->vring.num
is acceptable.
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ea7c079fb0..f7851c2750 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -885,6 +885,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
     if (vq->used_idx >= vq->vring.num) {
         vq->used_idx -= vq->vring.num;
         vq->used_wrap_counter ^= 1;
+        vq->signalled_used_valid = false;
     }
 }
 
-- 
2.33.1


