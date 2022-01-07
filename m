Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC300487685
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:31:18 +0100 (CET)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nSo-0000AH-2o
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:31:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2C-0007Kh-2K
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2A-0001p2-8L
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5QxedhqdIVW/4TN1ei0pMq/CHa5wdqs2AGGdB1TxsBA=;
 b=JyEqQ8ylzDNdyqv7O/Rc/qKoUcRYG13hrVk9iCigCAp+8xZT0Kz9D/T694auC1nHim8AOB
 /nopnp/F9lzj4at6cVInxiuYz8J6SLO6BII1LeVujQuyrjqEu5MRdccERCFYOAOywUOdc9
 h7t4whsS3oC47OmuUUpTgtB+hdrQEpY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-WB3QuuhQNN2F6IPRgTgV-w-1; Fri, 07 Jan 2022 06:03:44 -0500
X-MC-Unique: WB3QuuhQNN2F6IPRgTgV-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso308866wme.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5QxedhqdIVW/4TN1ei0pMq/CHa5wdqs2AGGdB1TxsBA=;
 b=FLuf4PWM+wEtbW25lZzYG8UtwHcOPjZVKbF+zDBdCYOn4hkpKT+Gvz0kDDYj3l+H3d
 E2FUnxHXFUHTd9Xkqm9hFACMY5lXB9uqA0nkEoUwkE1mzKR5RzBm17X1x8yM/bu1CYFB
 0BWgTaiNfKBSZJzCV2iEkYvEAAxFEXx3MR+QoywvyJm/zgvSfJMaXH4u5BGLRkyru6rl
 OUS1wlMDkpBAkgnAShrAdy3OEnsA6Ri/r+QYhfMUtnzeWJS4ZnAttBLSNK6a1jba2MLG
 H2p/+x8joSQkVjd/g+LveIGeeLGfZ5TmT+clqHcsjU7yo22nsbS0f54yz+ZDMCU6ZWcm
 spIA==
X-Gm-Message-State: AOAM532uWpqoGUcKFhOUpcCG5oCbFCG33CQvcQQf1F+QTIG6Z0BSkOq1
 6gz4F2KrMuKh7uj0j8+VsQ4EBiX7Kti/z2OUdrOd8QjRclB7yhlzXzzhrUx3ffm7qa7qY9yjuDV
 9OoxXqowGmer6y1znLIiCqHam/9zf2X3f6ZpgAczQ+7wbbrnwHf7tYNAA+RDB
X-Received: by 2002:a5d:6691:: with SMTP id l17mr54777537wru.482.1641553423158; 
 Fri, 07 Jan 2022 03:03:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6M6B39FNNBug59OCeyDDhX2EvLD6hdRr/gq9MqzFEglCoPvsucRasla1yblrPZWPth+WaIA==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr54777520wru.482.1641553422840; 
 Fri, 07 Jan 2022 03:03:42 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id i6sm5075244wrf.79.2022.01.07.03.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:42 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/55] virtio-pci: add support for configure interrupt
Message-ID: <20220107102526.39238-13-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

Add support for configure interrupt, The process is used kvm_irqfd_assign
to set the gsi to kernel. When the configure notifier was signal by
host, qemu will inject a msix interrupt to guest

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-11-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.h |  4 +-
 hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++++------
 2 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 2446dcd9ae..b704acc5a8 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -251,5 +251,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
  * @fixed_queues.
  */
 unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
-
+void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
+                                              int n, bool assign,
+                                              bool with_irqfd);
 #endif
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7201cf3dc1..98fb5493ae 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -727,7 +727,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     VirtQueue *vq;
 
     if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
-        return -1;
+        *n = virtio_config_get_guest_notifier(vdev);
+        *vector = vdev->config_vector;
     } else {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             return -1;
@@ -802,6 +803,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
     return ret;
 }
 
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
+}
 
 static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
                                               int queue_no)
@@ -839,6 +844,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
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
@@ -920,9 +930,17 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
         }
         vq = virtio_vector_next_queue(vq);
     }
-
+    /* unmask config intr */
+    n = virtio_config_get_guest_notifier(vdev);
+    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
+                                       msg, n);
+    if (ret < 0) {
+        goto undo_config;
+    }
     return 0;
-
+undo_config:
+    n = virtio_config_get_guest_notifier(vdev);
+    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
 undo:
     vq = virtio_vector_first_queue(vdev, vector);
     while (vq && unmasked >= 0) {
@@ -956,6 +974,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
         }
         vq = virtio_vector_next_queue(vq);
     }
+    n = virtio_config_get_guest_notifier(vdev);
+    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
 }
 
 static void virtio_pci_vector_poll(PCIDevice *dev,
@@ -987,6 +1007,34 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
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
@@ -995,17 +1043,25 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
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
 
@@ -1047,6 +1103,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
         msix_unset_vector_notifiers(&proxy->pci_dev);
         if (proxy->vector_irqfd) {
             kvm_virtio_pci_vector_release(proxy, nvqs);
+            kvm_virtio_pci_vector_config_release(proxy);
             g_free(proxy->vector_irqfd);
             proxy->vector_irqfd = NULL;
         }
@@ -1062,7 +1119,11 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
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
     if ((with_irqfd || k->guest_notifier_mask) && assign) {
         if (with_irqfd) {
@@ -1071,11 +1132,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
                           msix_nr_vectors_allocated(&proxy->pci_dev));
             r = kvm_virtio_pci_vector_use(proxy, nvqs);
             if (r < 0) {
-                goto assign_error;
+                goto config_assign_error;
             }
         }
-        r = msix_set_vector_notifiers(&proxy->pci_dev,
-                                      virtio_pci_vector_unmask,
+        r = kvm_virtio_pci_vector_config_use(proxy);
+        if (r < 0) {
+            goto config_error;
+        }
+        r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
                                       virtio_pci_vector_poll);
         if (r < 0) {
@@ -1090,7 +1154,11 @@ notifiers_error:
         assert(assign);
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
-
+config_error:
+    kvm_virtio_pci_vector_config_release(proxy);
+config_assign_error:
+    virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
+                                  with_irqfd);
 assign_error:
     /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
     assert(assign);
-- 
MST


