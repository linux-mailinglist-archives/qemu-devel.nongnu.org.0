Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01FB65E7F2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:37:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLn-0002Xf-UY; Thu, 05 Jan 2023 04:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLi-0002UA-95
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLg-0007BH-94
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/S4TuIzJ/MKxBFVR2orv4UpJ7fiW7dgwfl0+WMjr3gw=;
 b=X0Y23E/6Y4vVWqJYFhrQxkaJ7Bs7SkuRgT1FJOvxsci480j83gDijN2IovQdISgAj+pEJk
 XneZ2mzMi8EFKNGRrRYhK6fvDUeZWYyhkn5GI3j+BQUe/5mzCX9vbkldQCELOkQOlzSSMM
 OjOzqe0EH4VutAbhMRj6e5xrYOoi0iQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-KzVL1gr8Pu-vaE2hJqCbEA-1; Thu, 05 Jan 2023 04:15:37 -0500
X-MC-Unique: KzVL1gr8Pu-vaE2hJqCbEA-1
Received: by mail-wr1-f70.google.com with SMTP id
 i26-20020adfaada000000b0027c76c49445so3497637wrc.13
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/S4TuIzJ/MKxBFVR2orv4UpJ7fiW7dgwfl0+WMjr3gw=;
 b=AyAi+FZ+qTu5pZcX5JNAqA6VJmNRmX4oXEepqBHegKAgi1p8100h3L/DOEuzTZQ6Ed
 qBU32nGEtEuXtz3sYxDWlghjgxWWkhPeOrvIo/BsLAO54oEfslN5sM23fq90Rcmp3FHJ
 dsncbS5c3257E+LyHrV0D7/Vthbtlyr1sswTnygQTif4z3LeXbMC634mlaPJQN4cis7w
 cu7BKewrd+hNDnjYO7CaBhS9qQcKV833MiqHyUtkcPEJNeTfYcp6qPXF/OMG1NmKB4Nj
 E6om/t+lln7+Mif/jdzEzLxe5VSOjntldEK2tf2YZKISuPnsLrOpb0nZHcVKlE8pXRwy
 aYyQ==
X-Gm-Message-State: AFqh2kqP5n3niVOeZGl38gtdZTrNeEPZ8loxidQni1vgGTffkPeNt/uo
 ASKoR7V/9pauLdBPr7eM9Gl6W91A3N2IrymrqaFu6gejwQvgEqeQAlfbKkzL0OE2hg7L+pzqrfG
 j+ROngPG30zIsPqca7XTihwgUCKpf4QoyIpOnFP7oTBSleSOrB0oXhjiDpVOU
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr39013739wmq.32.1672910135412; 
 Thu, 05 Jan 2023 01:15:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJdPA1qnYjsFivGVnItjVNrjcJorC78eqawMMXyvUBpWU+mVg70bjyOWCZqZ2Vs0s565GvuQ==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr39013719wmq.32.1672910135087; 
 Thu, 05 Jan 2023 01:15:35 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003d978f8f255sm2371521wmq.27.2023.01.05.01.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:34 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 24/51] virtio-pci: add support for configure interrupt
Message-ID: <20230105091310.263867-25-mst@redhat.com>
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

Add process to handle the configure interrupt, The function's
logic is the same with vq interrupt.Add extra process to check
the configure interrupt

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-11-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-pci.h |   4 +-
 hw/virtio/virtio-pci.c         | 118 +++++++++++++++++++++++++++------
 2 files changed, 102 insertions(+), 20 deletions(-)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 24fba1604b..ab2051b64b 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -261,5 +261,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  * @fixed_queues.
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
-
+void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
+                                              int n, bool assign,
+                                              bool with_irqfd);
 #endif
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d7e29b1cdc..7bc60fcf94 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -836,7 +836,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     VirtQueue *vq;
 
     if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
-        return -1;
+        *n = virtio_config_get_guest_notifier(vdev);
+        *vector = vdev->config_vector;
     } else {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             return -1;
@@ -896,7 +897,7 @@ undo:
     }
     return ret;
 }
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+static int kvm_virtio_pci_vector_vq_use(VirtIOPCIProxy *proxy, int nvqs)
 {
     int queue_no;
     int ret = 0;
@@ -911,6 +912,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     return ret;
 }
 
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
 
 static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
                                               int queue_no)
@@ -935,7 +940,7 @@ static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
     kvm_virtio_pci_vq_vector_release(proxy, vector);
 }
 
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+static void kvm_virtio_pci_vector_vq_release(VirtIOPCIProxy *proxy, int nvqs)
 {
     int queue_no;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
@@ -948,6 +953,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
     }
 }
 
+static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
+{
+    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
+
 static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
                                        unsigned int queue_no,
                                        unsigned int vector,
@@ -1029,9 +1039,19 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
         }
         vq = virtio_vector_next_queue(vq);
     }
-
+    /* unmask config intr */
+    if (vector == vdev->config_vector) {
+        n = virtio_config_get_guest_notifier(vdev);
+        ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
+                                           msg, n);
+        if (ret < 0) {
+            goto undo_config;
+        }
+    }
     return 0;
-
+undo_config:
+    n = virtio_config_get_guest_notifier(vdev);
+    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
 undo:
     vq = virtio_vector_first_queue(vdev, vector);
     while (vq && unmasked >= 0) {
@@ -1065,6 +1085,11 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
         }
         vq = virtio_vector_next_queue(vq);
     }
+
+    if (vector == vdev->config_vector) {
+        n = virtio_config_get_guest_notifier(vdev);
+        virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
+    }
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -1096,6 +1121,34 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
             msix_set_pending(dev, vector);
         }
     }
+    /* poll the config intr */
+    ret = virtio_pci_get_notifier(proxy, VIRTIO_CONFIG_IRQ_IDX, &notifier,
+                                  &vector);
+    if (ret < 0) {
+        return;
+    }
+    if (vector < vector_start || vector >= vector_end ||
+        !msix_is_masked(dev, vector)) {
+        return;
+    }
+    if (k->guest_notifier_pending) {
+        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
+            msix_set_pending(dev, vector);
+        }
+    } else if (event_notifier_test_and_clear(notifier)) {
+        msix_set_pending(dev, vector);
+    }
+}
+
+void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
+                                              int n, bool assign,
+                                              bool with_irqfd)
+{
+    if (n == VIRTIO_CONFIG_IRQ_IDX) {
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+    } else {
+        virtio_queue_set_guest_notifier_fd_handler(vq, assign, with_irqfd);
+    }
 }
 
 static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
@@ -1104,17 +1157,25 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
-    VirtQueue *vq = virtio_get_queue(vdev, n);
-    EventNotifier *notifier = virtio_queue_get_guest_notifier(vq);
+    VirtQueue *vq = NULL;
+    EventNotifier *notifier = NULL;
+
+    if (n == VIRTIO_CONFIG_IRQ_IDX) {
+        notifier = virtio_config_get_guest_notifier(vdev);
+    } else {
+        vq = virtio_get_queue(vdev, n);
+        notifier = virtio_queue_get_guest_notifier(vq);
+    }
 
     if (assign) {
         int r = event_notifier_init(notifier, 0);
         if (r < 0) {
             return r;
         }
-        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
+        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, true, with_irqfd);
     } else {
-        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
+        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, false,
+                                                 with_irqfd);
         event_notifier_cleanup(notifier);
     }
 
@@ -1157,10 +1218,13 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
     proxy->nvqs_with_notifiers = nvqs;
 
     /* Must unset vector notifier while guest notifier is still assigned */
-    if ((proxy->vector_irqfd || k->guest_notifier_mask) && !assign) {
+    if ((proxy->vector_irqfd ||
+         (vdev->use_guest_notifier_mask && k->guest_notifier_mask)) &&
+        !assign) {
         msix_unset_vector_notifiers(&proxy->pci_dev);
         if (proxy->vector_irqfd) {
-            kvm_virtio_pci_vector_release(proxy, nvqs);
+            kvm_virtio_pci_vector_vq_release(proxy, nvqs);
+            kvm_virtio_pci_vector_config_release(proxy);
             g_free(proxy->vector_irqfd);
             proxy->vector_irqfd = NULL;
         }
@@ -1176,20 +1240,30 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             goto assign_error;
         }
     }
-
+    r = virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, assign,
+                                      with_irqfd);
+    if (r < 0) {
+        goto config_assign_error;
+    }
     /* Must set vector notifier after guest notifier has been assigned */
-    if ((with_irqfd || k->guest_notifier_mask) && assign) {
+    if ((with_irqfd ||
+         (vdev->use_guest_notifier_mask && k->guest_notifier_mask)) &&
+        assign) {
         if (with_irqfd) {
             proxy->vector_irqfd =
                 g_malloc0(sizeof(*proxy->vector_irqfd) *
                           msix_nr_vectors_allocated(&proxy->pci_dev));
-            r = kvm_virtio_pci_vector_use(proxy, nvqs);
+            r = kvm_virtio_pci_vector_vq_use(proxy, nvqs);
             if (r < 0) {
-                goto assign_error;
+                goto config_assign_error;
+            }
+            r = kvm_virtio_pci_vector_config_use(proxy);
+            if (r < 0) {
+                goto config_error;
             }
         }
-        r = msix_set_vector_notifiers(&proxy->pci_dev,
-                                      virtio_pci_vector_unmask,
+
+        r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
                                       virtio_pci_vector_poll);
         if (r < 0) {
@@ -1202,9 +1276,15 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 notifiers_error:
     if (with_irqfd) {
         assert(assign);
-        kvm_virtio_pci_vector_release(proxy, nvqs);
+        kvm_virtio_pci_vector_vq_release(proxy, nvqs);
     }
-
+config_error:
+    if (with_irqfd) {
+        kvm_virtio_pci_vector_config_release(proxy);
+    }
+config_assign_error:
+    virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
+                                  with_irqfd);
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
-- 
MST


