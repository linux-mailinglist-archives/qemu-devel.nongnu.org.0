Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F661DC6D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:28:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqB-0000PR-5v; Sat, 05 Nov 2022 13:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnQ-00073g-WC
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnK-0007Sm-Et
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=RvkvNBatyDLBB6emHVyXwuBQBNd7Z4XfkilAA6WgsJUh3puIU3YilnvIjmX/cbYJeQtUTw
 UA1pqvzo7j9jc9D0072d743REztAxMKQBE0wLdmJakMQ+exhvUN5/YiXNyKgGU3QeFVxoD
 bQnZnZtI8lXiwu2Y8tECRle3gZSzXhY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-iuRQl0Q-PY-8jzf8ZYxdOA-1; Sat, 05 Nov 2022 13:17:20 -0400
X-MC-Unique: iuRQl0Q-PY-8jzf8ZYxdOA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so1297775wmb.8
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=ni4QK3jeTUqjWGxNCV8s+mOe9LylwJA56rMExShQryXBVPZrRgozG439quvMT5SVeX
 0xEDwzWQG6G6Nfd35AqkPuvQTngorjUTIT8qjLmvQHX4zWjKIJxC0qyun2M6n+CY31C3
 NvWzsLi//LT+tsOIJqa0M5CqhlyErvIHUoEF/crZwh3XjvMctUg+CpqUIEZGSeRxgH1R
 bdBQJbeHQ2kMWU4FNmSn48x5nKu5uMNkApEYdju0E6NRd5+Aan8SEiq+vjxhbD6aIsvt
 GFHX0iirFbZcN3i0peqqUJghXnuz0FvOrL18VH8jicSacJD4XiBlzNjVoegv6O71ZCWO
 vIHA==
X-Gm-Message-State: ACrzQf15ziO47ix3k33ayrWHKZWtCZDywqhblMpQkrT4n/mc60APV6j7
 41acgoUZFq9EEPb8/+0/pCr7aHwUuNA2Uznyg9s8wIjJQ+V3ImmgPEENBx+VhdUydd0QeSBWgKM
 KtkCGijWITWkpYJiCXFQZvqeJ2pN/dHytMTQQ2XEin0xrqAmL5GtvzhQkglvD
X-Received: by 2002:a1c:f002:0:b0:3b4:dda4:b58f with SMTP id
 a2-20020a1cf002000000b003b4dda4b58fmr36840228wmb.184.1667668639146; 
 Sat, 05 Nov 2022 10:17:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6WALWJr5IoJ49w80S9C5GazLgXRp6iL8RPiHyR5IBhfUUytaRIBmGhmku+kq+dsuovADcoKA==
X-Received: by 2002:a1c:f002:0:b0:3b4:dda4:b58f with SMTP id
 a2-20020a1cf002000000b003b4dda4b58fmr36840216wmb.184.1667668638924; 
 Sat, 05 Nov 2022 10:17:18 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0023691d62cffsm2612019wrx.70.2022.11.05.10.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:18 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 37/81] virtio-pci: support queue enable
Message-ID: <20221105171116.432921-38-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

PCI devices support device specific vq enable.

Based on this function, the driver can re-enable the virtqueue after the
virtqueue is reset.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-7-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d4f2ffe986..855718d586 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1342,6 +1342,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
             proxy->vqs[vdev->queue_sel].reset = 0;
+            virtio_queue_enable(vdev, vdev->queue_sel);
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
-- 
MST


