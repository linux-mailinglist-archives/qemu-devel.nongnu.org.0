Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF064876B0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:44:20 +0100 (CET)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nfP-0006LO-Ot
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n41-0001Vt-SS
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3y-00020e-7h
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bYEz3aJ2ZVHIKx33NW8o1kl0YJwc2D4eOCg251Ckdk=;
 b=huEsxj6YjeXui86SRucB8k6jR5wleGhaOx0xLx83B83/mcXAA6cnE9NTH6G9PJmJJflPhH
 BTCQwlmiPGvzng9+vh4FpXSw8sFh4Dczku9WSzksNki6uFJOxi18v9MNyMIjnLgjy3IjjQ
 FYhadA5K7hpdRCXuvj58FdDzIVO+k3g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-noVLQ__UOWyU9CWObJzoeA-1; Fri, 07 Jan 2022 06:05:00 -0500
X-MC-Unique: noVLQ__UOWyU9CWObJzoeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfa4da000000b001a652d52d8eso135134wrb.16
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1bYEz3aJ2ZVHIKx33NW8o1kl0YJwc2D4eOCg251Ckdk=;
 b=p9PPqfnPEMDN7r3pSh9qh2En+HZaAk92y1F6vwH9ueI0/SpL2CxqBOf4OS3ClnWS0G
 Mu5WRO0AJ1gbNP3GSDZPA1UlwnZ3ajl9HiaBQxHIQ89BJXSiG4QaQNOGWCb/IuJl+geZ
 KfkFKJFgu4na7A33VlnffK7/TdXoXkLCkD4NW3HKk+mda9ZhW1K4gWrWJ/XsBPYjJHk/
 HKKgFeV0FRBESPCDXMF4c/msBuDCyfWqPewN+x7ABT8otz6dwcEoShnxpSjgON+rDi+B
 q64YzgPWiGnhd8pXQSujal+US3Nz/naX0couNfMK0MdXfm39t1kyHpWLotOPd9QA81TQ
 e6MQ==
X-Gm-Message-State: AOAM532uT3ZPv7UD/Cfx/Fj1N3/Vy0O4EcIoJb45hQrq/F++uL5gVyKE
 q1No+nn97Vh+ihyAndivellSYMeapftO74Vv6bTrpDC4fh334CRwOH7G+s4MOMGbJHpvrc5GIi/
 xIRb7qLrtRxK8zeHO4XF7fYCxtLo0ATSSpFQhSQ1TNhNW8RyQ96y2PUU+296V
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr10557834wmg.24.1641553498175; 
 Fri, 07 Jan 2022 03:04:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyabaXJmYSlhs0P5o02ebeHmjAcdRwzJNN8U1eMRQenXPx2u/h7J6Drwde4onzitCH2AJnETg==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr10557817wmg.24.1641553497978; 
 Fri, 07 Jan 2022 03:04:57 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id n14sm4748307wrf.107.2022.01.07.03.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:57 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 37/55] virtio: signal after wrapping packed used_idx
Message-ID: <20220107102526.39238-38-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

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
Message-Id: <20211130134510.267382-1-stefanha@redhat.com>
Fixes: 86044b24e865fb9596ed77a4d0f3af8b90a088a1 ("virtio: basic packed virtqueue support")
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 36edb1dad5..971e59a663 100644
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
MST


