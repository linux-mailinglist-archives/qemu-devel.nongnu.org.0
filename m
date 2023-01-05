Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E26765E803
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLT-00025j-GB; Thu, 05 Jan 2023 04:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLI-00023s-07
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLG-00072v-7S
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Yz1VejxA6ihgawm49ftmHrbes/XNuA7XNkefEH+3v8=;
 b=P+vSnRII64qfOdGedkg86Koc1hFWEPNMmXiMHdyaRBdLtLa9PU7Dpe4GO8i8uRCO7Uk63u
 xupYgwV4o72QlR09fTcomowYxsmxStAh2jGmDed3cUoYIIyipdApbZOrIjkc2+Sj5NgSSu
 cHF4pSgAOpnY7pFvgzS6HlITo25orGg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-EgEUyPQnP52c829DVa-M3g-1; Thu, 05 Jan 2023 04:15:16 -0500
X-MC-Unique: EgEUyPQnP52c829DVa-M3g-1
Received: by mail-wr1-f69.google.com with SMTP id
 g18-20020adfa492000000b0027174820fdbso4531013wrb.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Yz1VejxA6ihgawm49ftmHrbes/XNuA7XNkefEH+3v8=;
 b=6XRv6iBIYx35+LeviA1VLAtQnkh1X16mCDqs7zG2Mb1baNUCk3Gi5pSn5xwffFZtEQ
 k/6qz02vpXjIqIdqixWW2hmPF7ogaCavDxw0JNhEtlkCIB6Luov9Qa6bl0+nRZK8b9ZI
 VIIljcDV38n/kSgbBOB8LH1UqFXI2izRVMOT/fwRd6Jk48bmqjDuaKGpI0kGGqnv7y4V
 MHXKQMXt26ZyTxDydm8unTtJdHWO6JoUounZCOxE/QoWU97Wll4d/mMx2tt9VRicYSzP
 GMM51c1EPzmbu//I3Z/x8uvOpfIjG2YSgK8xnw4Qjt8fh4GC18ib0w9ZJE30a8MK8VZD
 oWXw==
X-Gm-Message-State: AFqh2kpkmxjkvtfZfyakixARRy54S44Ip0mh51Z6ookec1ryAuu2iSTE
 nQNubS58l4gN8Oq266fD4ZiXzd29EzlrWS6NIqdIOkZs7VlIkW5yWX0J4J4znwdg/uj7AKoId32
 fLnQf6FaiS0EEBsBwVw0mxkC5f5pkX2la/MPQjy4e+JTZuZklkjBKupdPhbnV
X-Received: by 2002:a05:600c:22c4:b0:3cf:8ed7:712d with SMTP id
 4-20020a05600c22c400b003cf8ed7712dmr39783470wmg.14.1672910114873; 
 Thu, 05 Jan 2023 01:15:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwc7VlhQSaf7Dq/FSJyvQVcC2kD0EdI4xHR5R2Hxv6GHhQQ1BTEzCqkzfQBIK/UpRWZLGfcw==
X-Received: by 2002:a05:600c:22c4:b0:3cf:8ed7:712d with SMTP id
 4-20020a05600c22c400b003cf8ed7712dmr39783452wmg.14.1672910114587; 
 Thu, 05 Jan 2023 01:15:14 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003d995a704fdsm1827514wmq.33.2023.01.05.01.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:14 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 17/51] virtio-pci: decouple the single vector from the
 interrupt process
Message-ID: <20230105091310.263867-18-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Cindy Lu <lulu@redhat.com>

To reuse the interrupt process in configure interrupt
Need to decouple the single vector from the interrupt process.
We add new function kvm_virtio_pci_vector_use_one and _release_one.
These functions are used for the single vector, the whole process will
finish in the loop with vq number.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-4-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 131 +++++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 58 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 68d04928db..d7e29b1cdc 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -784,7 +784,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -849,87 +848,103 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     return 0;
 }
 
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
 {
+    unsigned int vector;
+    int ret;
+    EventNotifier *n;
     PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    unsigned int vector;
-    int ret, queue_no;
-    EventNotifier *n;
-    for (queue_no = 0; queue_no < nvqs; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
-            break;
-        }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
+
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return ret;
+    }
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return 0;
+    }
+    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    /*
+     * If guest supports masking, set up irqfd now.
+     * Otherwise, delay until unmasked in the frontend.
+     */
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
         if (ret < 0) {
+            kvm_virtio_pci_vq_vector_release(proxy, vector);
             goto undo;
         }
-        /* If guest supports masking, set up irqfd now.
-         * Otherwise, delay until unmasked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
-            if (ret < 0) {
-                kvm_virtio_pci_vq_vector_release(proxy, vector);
-                goto undo;
-            }
-        }
     }
-    return 0;
 
+    return 0;
 undo:
-    while (--queue_no >= 0) {
-        vector = virtio_queue_vector(vdev, queue_no);
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
+
+    vector = virtio_queue_vector(vdev, queue_no);
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return ret;
+    }
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            return ret;
         }
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-            if (ret < 0) {
-                break;
-            }
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    return ret;
+}
+static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    int ret = 0;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
+    for (queue_no = 0; queue_no < nvqs; queue_no++) {
+        if (!virtio_queue_get_num(vdev, queue_no)) {
+            return -1;
         }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
     }
     return ret;
 }
 
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+
+static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
+                                              int queue_no)
 {
-    PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     unsigned int vector;
-    int queue_no;
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     EventNotifier *n;
-    int ret ;
+    int ret;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    PCIDevice *dev = &proxy->pci_dev;
+
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return;
+    }
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return;
+    }
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    kvm_virtio_pci_vq_vector_release(proxy, vector);
+}
+
+static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        /* If guest supports masking, clean up irqfd now.
-         * Otherwise, it was cleaned when masked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
-        }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        kvm_virtio_pci_vector_release_one(proxy, queue_no);
     }
 }
 
-- 
MST


