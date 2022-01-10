Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B35489123
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:30:25 +0100 (CET)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6p8J-0007gc-4G
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:30:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oub-00078Y-2f
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouZ-0001hp-4W
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AKB1wcqs7P6pnfvGipeaJG3zqEFmm838XGwBbdRPsng=;
 b=QSiswA0x2XXdZ4qAAPosdkw/YfNnClWaR86OlRPivf5VbtPzZxNlCQsq1azMeUBApBBCG2
 Vxbcp0HoBN5UYg2gH9xwpcxMWrciyvmZLsYccybJdIgzYylq6P2Ai+C3XuxpZmw2ief10m
 koKgPLPyvIXUB3udHGosAHhzzxQSiZ4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-QJYPP1PoMKy0lQXViY0Oyg-1; Mon, 10 Jan 2022 02:16:09 -0500
X-MC-Unique: QJYPP1PoMKy0lQXViY0Oyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso3484209wme.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AKB1wcqs7P6pnfvGipeaJG3zqEFmm838XGwBbdRPsng=;
 b=w2Up3+lzkKAn3NmlpLoOtMWqSJ1obCFxY7ktE6PkQxsfUTZYk2fls4edLMJV5uhMbq
 l3MF4Av+hXmfiryzO7PhyaPH9oZxDz9ZSfHWq0o6A7sv2/j1IMuji8bFSSTO79ZZUGQ0
 kUhPdjZbTYnUr9ElvqGLa5HZUkAXYTP5CLP9tVZLOZQSAo5p5oT0zFG/AjCRo4FFGFfS
 92ZxiIKSyIKltfMEmiLL3SrsXK51Pm/k+6Wy4NG9eJVJBfTpOOX4meEoMrhqhzVIedJw
 GV7b6InbHz/87Y95UDDgalfwc5uxTHT0c9vxPuXgF+j5NoQihJYUnHGGdTuOT6PptdFC
 E2JA==
X-Gm-Message-State: AOAM532939tLh27FEORveyysC7WJKSRallel6dMmOIktDt5NMaDM6fbY
 K6DyCxw1kdYDkLX+xfruM7BUEKUMmXWq+5mUm0uasS5tY0JigQkZaYKsPJ+6TGQ4Dnn1E7HQ6Zd
 xfTBlKoUKPOHFPNMXW8rDLM/anE2rLq5xMONUICZI9bCGuKWLy/vVH948XBXj
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr61788800wri.711.1641798967848; 
 Sun, 09 Jan 2022 23:16:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYK7zcQCBh1HeFykdchqLSmY6jVeNsb3xcTvWFSFIR07X1tZyLmDO4HJrLgf0Cr5sNZzGSOg==
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr61788781wri.711.1641798967529; 
 Sun, 09 Jan 2022 23:16:07 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id j13sm6243039wmq.11.2022.01.09.23.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:07 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] Revert "virtio-pci: add support for configure interrupt"
Message-ID: <20220110071547.195669-2-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit d5d24d859c3957ea1674d0e102f96439cdbfe93a.
---
 hw/virtio/virtio-pci.h |  4 +-
 hw/virtio/virtio-pci.c | 92 ++++++------------------------------------
 2 files changed, 13 insertions(+), 83 deletions(-)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index b704acc5a8..2446dcd9ae 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -251,7 +251,5 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  * @fixed_queues.
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
-void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
-                                              int n, bool assign,
-                                              bool with_irqfd);
+
 #endif
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 98fb5493ae..7201cf3dc1 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -727,8 +727,7 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     VirtQueue *vq;
 
     if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
-        *n = virtio_config_get_guest_notifier(vdev);
-        *vector = vdev->config_vector;
+        return -1;
     } else {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             return -1;
@@ -803,10 +802,6 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     return ret;
 }
 
-static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
-{
-    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
-}
 
 static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
                                               int queue_no)
@@ -844,11 +839,6 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     }
 }
 
-static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
-{
-    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
-}
-
 static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
@@ -930,17 +920,9 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
         }
         vq = virtio_vector_next_queue(vq);
     }
-    /* unmask config intr */
-    n = virtio_config_get_guest_notifier(vdev);
-    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
-                                       msg, n);
-    if (ret < 0) {
-        goto undo_config;
-    }
+
     return 0;
-undo_config:
-    n = virtio_config_get_guest_notifier(vdev);
-    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
+
 undo:
     vq = virtio_vector_first_queue(vdev, vector);
     while (vq && unmasked >= 0) {
@@ -974,8 +956,6 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
         }
         vq = virtio_vector_next_queue(vq);
     }
-    n = virtio_config_get_guest_notifier(vdev);
-    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -1007,34 +987,6 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
             msix_set_pending(dev, vector);
         }
     }
-    /* poll the config intr */
-    ret = virtio_pci_get_notifier(proxy, VIRTIO_CONFIG_IRQ_IDX, &notifier,
-                                  &vector);
-    if (ret < 0) {
-        return;
-    }
-    if (vector < vector_start || vector >= vector_end ||
-        !msix_is_masked(dev, vector)) {
-        return;
-    }
-    if (k->guest_notifier_pending) {
-        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
-            msix_set_pending(dev, vector);
-        }
-    } else if (event_notifier_test_and_clear(notifier)) {
-        msix_set_pending(dev, vector);
-    }
-}
-
-void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
-                                              int n, bool assign,
-                                              bool with_irqfd)
-{
-    if (n == VIRTIO_CONFIG_IRQ_IDX) {
-        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
-    } else {
-        virtio_queue_set_guest_notifier_fd_handler(vq, assign, with_irqfd);
-    }
 }
 
 static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
@@ -1043,25 +995,17 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq = NULL;
-    EventNotifier *notifier = NULL;
-
-    if (n == VIRTIO_CONFIG_IRQ_IDX) {
-        notifier = virtio_config_get_guest_notifier(vdev);
-    } else {
-        vq = virtio_get_queue(vdev, n);
-        notifier = virtio_queue_get_guest_notifier(vq);
-    }
+    VirtQueue *vq = virtio_get_queue(vdev, n);
+    EventNotifier *notifier = virtio_queue_get_guest_notifier(vq);
 
     if (assign) {
         int r = event_notifier_init(notifier, 0);
         if (r < 0) {
             return r;
         }
-        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, true, with_irqfd);
+        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
     } else {
-        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, false,
-                                                 with_irqfd);
+        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
         event_notifier_cleanup(notifier);
     }
 
@@ -1103,7 +1047,6 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
         msix_unset_vector_notifiers(&proxy->pci_dev);
         if (proxy->vector_irqfd) {
             kvm_virtio_pci_vector_release(proxy, nvqs);
-            kvm_virtio_pci_vector_config_release(proxy);
             g_free(proxy->vector_irqfd);
             proxy->vector_irqfd = NULL;
         }
@@ -1119,11 +1062,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             goto assign_error;
         }
     }
-    r = virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, assign,
-                                      with_irqfd);
-    if (r < 0) {
-        goto config_assign_error;
-    }
+
     /* Must set vector notifier after guest notifier has been assigned */
     if ((with_irqfd || k->guest_notifier_mask) && assign) {
         if (with_irqfd) {
@@ -1132,14 +1071,11 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
                           msix_nr_vectors_allocated(&proxy->pci_dev));
             r = kvm_virtio_pci_vector_use(proxy, nvqs);
             if (r < 0) {
-                goto config_assign_error;
+                goto assign_error;
             }
         }
-        r = kvm_virtio_pci_vector_config_use(proxy);
-        if (r < 0) {
-            goto config_error;
-        }
-        r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
+        r = msix_set_vector_notifiers(&proxy->pci_dev,
+                                      virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
                                       virtio_pci_vector_poll);
         if (r < 0) {
@@ -1154,11 +1090,7 @@ notifiers_error:
         assert(assign);
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
-config_error:
-    kvm_virtio_pci_vector_config_release(proxy);
-config_assign_error:
-    virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
-                                  with_irqfd);
+
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
-- 
MST


