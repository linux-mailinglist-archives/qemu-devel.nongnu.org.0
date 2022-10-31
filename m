Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E76613737
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIC-0000e6-2i; Mon, 31 Oct 2022 08:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHZ-0005WO-Hx
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHX-0002qX-N4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=fB0TUHY9R28VHMfhPdm0iZRMVCcYX54qFNd1Hfw5hTq9oiImP8kujq4E4ClSOtuFCCAKEH
 ueWPOMQSLJuCgJxJGfBOHwUxyqCoYnLxI5ImhRdidjL6HXOt2NWg6gTRQQKkrx8zstkrz5
 B7aS8j6V/uZ646jAVBNvBoFk+a1vh5w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-_FMmRHI3OxeYKSlxt5_tZQ-1; Mon, 31 Oct 2022 08:52:45 -0400
X-MC-Unique: _FMmRHI3OxeYKSlxt5_tZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so361524wmb.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53cDP1F6gXOJDB503L4H7aDBSnQaypNNt0vv+nFB0O0=;
 b=2GZPKCs28jTeIGhuCXwuNR5qvAp23floRjEqzv9pqhU2M972PdPg/yRzQpt+pImwkn
 52mh6DopKZgaiabeeiHR57aucQSJuH7qoKZMSu7ObaJ/uSIwXosx/683vzozwWjsTc8g
 3zY+y358xJHNxsRoQ6Tk4QUOQESxktunWfZPstA/opmxvDiBuHBjwMYXn0qF71sPlz7p
 dodUspjwDJErR0nwwQ86BySdJhKOEMmZRxZJqgnzWmlxbDacswfVitH7xcA+NfgpCA1w
 bvT9I/wb0/ck9qh89bWNm4ZOismfBfkxNT9Hhu5wy7rnMwpOiMo4Zrni3wYhym3p3bQy
 sgSA==
X-Gm-Message-State: ACrzQf3tXZXcAmd1+okUMj2o04h7og3iSMYcRzTKxla61wlfQTaivcyA
 b6HtJkHAOsx7MEQWmQ8po034P+6axoyAaJOFbdBdL7Hk68gvyQWeHzE8i3KpvYNwQOcsmG9Y8oE
 uQv3EHWAq84bPsWeoEClbVvtUUfKsgiMTcSm0ULtkk5qVmWzZdT2jHRZeevwh
X-Received: by 2002:a1c:f202:0:b0:3c2:10de:4016 with SMTP id
 s2-20020a1cf202000000b003c210de4016mr17963170wmc.158.1667220764378; 
 Mon, 31 Oct 2022 05:52:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FjfoJ5ax6iv+rOufapDypB9ELVWwgvZKdVPaqoTQqguBG2+2V1Rtcdr/S8bt/k8XECGIzkw==
X-Received: by 2002:a1c:f202:0:b0:3c2:10de:4016 with SMTP id
 s2-20020a1cf202000000b003c210de4016mr17963145wmc.158.1667220764113; 
 Mon, 31 Oct 2022 05:52:44 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h3-20020a5d6e03000000b002365730eae8sm6973958wrz.55.2022.10.31.05.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:43 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 41/86] virtio-pci: support queue reset
Message-ID: <20221031124928.128475-42-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


