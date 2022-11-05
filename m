Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ADF61DCB0
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:51:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpV-00084z-57; Sat, 05 Nov 2022 13:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnI-0006zX-Tq
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnH-0007SZ-FJ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=foKo/KHfa4IHHVYKiiIcgu+/b6YX9DHtL9vzQXCcP+9G7QuUc5GVEI95NRJS0yfHy2kUe4
 0GbVH3Y91VdC7jx7KOUN0BdKPMCYPBsQdBIn3cCtFJfiRrSrUQdeEsM0so2BRnb4mHO9K2
 c9oPbh1BYF8wdUuHTq6e58CcBwF4J2E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-Ze05AzWSOiS5bTauGJSgyQ-1; Sat, 05 Nov 2022 13:17:17 -0400
X-MC-Unique: Ze05AzWSOiS5bTauGJSgyQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so3849441wmh.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=Y1o6VpVUTai8IH1nMA+PzFUTEVqLclFSf0bqkKzsBNDbPEtnlC5QKU5P8X18rx7VCk
 Ysgkf1pjLi6rbZWM+eNkm87mFj3HKAXtlS6oL/Bbs17p/7qcngIQSE9ZpwzKsvCE1BlA
 Y8B44XItSEhDB7txOdHMLhLKvlTtyohGRTJu8FUe7x/3cocf8RIbMbTsiKR3IIZChNjF
 miyTbVFkxSQHW5IX3YOasVEop0SPPNxspOT78bRuIlRxq6pSe0MtohxYhoZ2YPOMwdOQ
 3CKKE2qOaq6lR63sJRB2w65TXLwuEXpFc5b4UvM8NJVZrm9aE/R8XwfX9Z4KRBZA2sBn
 AXkw==
X-Gm-Message-State: ACrzQf1jEU/0pjMDJF5aGcKWBiOGSn+sL/nDTEW99ruH79tlZ0sUDNBA
 +y5gokPuyK2jpWnJMmbZ1xTlrLP39GRTHmaPRj2iHOIfreXDAZlN3O0YHcJuNQinrckpcUYcLhT
 ikYjEgvTLDYtxy/6vnAMbuYtZ5uAqsyVPOcQy4GUTZTQiWHoQMlCf/+DYTHnf
X-Received: by 2002:a05:6000:12d1:b0:236:9d32:b99f with SMTP id
 l17-20020a05600012d100b002369d32b99fmr26487000wrx.567.1667668636380; 
 Sat, 05 Nov 2022 10:17:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ON9JAqGCCtmwLdwL6rcpoY1Yz3jAAbFQyI2mZwD2pWsBaxDYCJeFwY5xc+gSHwww57OvlWw==
X-Received: by 2002:a05:6000:12d1:b0:236:9d32:b99f with SMTP id
 l17-20020a05600012d100b002369d32b99fmr26486987wrx.567.1667668636102; 
 Sat, 05 Nov 2022 10:17:16 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003cf4eac8e80sm3665885wmb.23.2022.11.05.10.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:14 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 36/81] virtio-pci: support queue reset
Message-ID: <20221105171116.432921-37-mst@redhat.com>
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


