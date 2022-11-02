Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D0616735
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJz-0007gq-Ob; Wed, 02 Nov 2022 12:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJt-0007GL-6V
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJm-0002wp-3l
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=b0fGpvIcDhmVx2HKOfgzLxdJnq2Vlc/+KEetVkoyNqP9lJz1c/kJnFG9xEsfot2nbUm/Gb
 8fJ9L8CXMP3iD66UGj3oTL8zgNDCqGWjY30uIoPqP66ehZTdLcKXlyNwY6fW00JmH84ZXq
 2RSqWm9eHI41RVlXcL8VPGVmQuxw3NI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-NnpIe_w8N_Gp6itc60SHBw-1; Wed, 02 Nov 2022 12:10:15 -0400
X-MC-Unique: NnpIe_w8N_Gp6itc60SHBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso8098370wme.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=I2TG+PzB0rU6Z0o1yfQPvmnKn6LclgALYSZyyXm1bvwPog1BHw7sUDgFQJVWfeux51
 kDj3sqSQXid8xvECbt6Kv7mrz3znO/DgHHceLBXR3Dmcc0OnqxDftbatgM9+eJl76Yxj
 lzc9vNvH/rEqAePBujGedx1EOZF1hJ448Tsk6H2KMTaJ8JYGwU4+SpiMQuz7l8b6vvYJ
 U8h3HOVxiS4tnzwyqM1yAwBUrwUYoB1TWE1ZECN0yVsnbzbtJxRjvbL8KaX3a/8+0esq
 Ugrv3UnVw55FuSTxG1AIXUIJsH/rr2odova8CYrFs3ql7l5eiXxYmaWbLLySG5lC3WqF
 DB5w==
X-Gm-Message-State: ACrzQf2mnlFYoKKZJPAnECD87eHYrsuSKoOD+yfoYiEoyKIUjikz7jRo
 AZxLPgAAmjYzh0+6YKJdaf6q2V6oZl4AXoXZFzcnmU42mQWeneBd6Gi6o+m1587eJax3BwC7bbt
 EmYyj++ly9jQmeUEfqfKubMTh/xqaaDGjv6QcZDBCj6h4/RT+SuXycOn7Pazd
X-Received: by 2002:adf:df03:0:b0:236:78cb:b6e5 with SMTP id
 y3-20020adfdf03000000b0023678cbb6e5mr15438098wrl.269.1667405412911; 
 Wed, 02 Nov 2022 09:10:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6f0vx1ghgWuuUwfSTBXS+ud+uy1FYtUgwEqckXNr9FM7oPAQioiJVLOXTYvADGkD+eX4mBVw==
X-Received: by 2002:adf:df03:0:b0:236:78cb:b6e5 with SMTP id
 y3-20020adfdf03000000b0023678cbb6e5mr15438064wrl.269.1667405412572; 
 Wed, 02 Nov 2022 09:10:12 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 u20-20020a7bc054000000b003b476cabf1csm2290278wmc.26.2022.11.02.09.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:12 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 39/82] virtio-pci: support queue reset
Message-ID: <20221102160336.616599-40-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

PCI devices support vq reset.

Based on this function, the driver can adjust the size of the ring, and
quickly recycle the buffer in the ring.

The migration of the virtio devices will not happen during a reset
operation. This is becuase the global iothread lock is held. Migration
thread also needs the lock. As a result, when migration of virtio
devices starts, the 'reset' status of VirtIOPCIQueue will always be 0.
Thus, we do not need to add it in vmstate_virtio_pci_modern_queue_state.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-6-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-pci.h |  5 +++++
 hw/virtio/virtio-pci.c         | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 2446dcd9ae..938799e8f6 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -117,6 +117,11 @@ typedef struct VirtIOPCIRegion {
 typedef struct VirtIOPCIQueue {
   uint16_t num;
   bool enabled;
+  /*
+   * No need to migrate the reset status, because it is always 0
+   * when the migration starts.
+   */
+  bool reset;
   uint32_t desc[2];
   uint32_t avail[2];
   uint32_t used[2];
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 34db51e241..d4f2ffe986 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1251,6 +1251,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         val = proxy->vqs[vdev->queue_sel].used[1];
         break;
+    case VIRTIO_PCI_COMMON_Q_RESET:
+        val = proxy->vqs[vdev->queue_sel].reset;
+        break;
     default:
         val = 0;
     }
@@ -1338,6 +1341,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
+            proxy->vqs[vdev->queue_sel].reset = 0;
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
@@ -1360,6 +1364,16 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
     case VIRTIO_PCI_COMMON_Q_USEDHI:
         proxy->vqs[vdev->queue_sel].used[1] = val;
         break;
+    case VIRTIO_PCI_COMMON_Q_RESET:
+        if (val == 1) {
+            proxy->vqs[vdev->queue_sel].reset = 1;
+
+            virtio_queue_reset(vdev, vdev->queue_sel);
+
+            proxy->vqs[vdev->queue_sel].reset = 0;
+            proxy->vqs[vdev->queue_sel].enabled = 0;
+        }
+        break;
     default:
         break;
     }
@@ -1954,6 +1968,7 @@ static void virtio_pci_reset(DeviceState *qdev)
 
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
         proxy->vqs[i].enabled = 0;
+        proxy->vqs[i].reset = 0;
         proxy->vqs[i].num = 0;
         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
-- 
MST


