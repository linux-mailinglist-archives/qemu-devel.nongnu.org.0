Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A34891B6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:41:24 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pIv-0006Mx-L3
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouu-0007fZ-KN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ous-0001pd-SC
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3mR3mqj9Y549agL9uOKKwNa4Nrh6w+hyJQcYaYC4zg=;
 b=GYy0hYPzytmLHHYIXIZKuFF0vjr1LnoXwhXdlc2nDzoEmozJAaXQfrrP5QZCZvwqMaLY6N
 Pg73MYnuCVemLSnsU4wH1rdgs+L5XxhQ4Pcr++zbV4lav7EWTOKtH1/ocB/KKMpnqgU3Oc
 0OWBq/17RiYjTRsOXJMEs7s4V2riZZw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-osls-9TjOJuYn6FFHZvIRg-1; Mon, 10 Jan 2022 02:16:29 -0500
X-MC-Unique: osls-9TjOJuYn6FFHZvIRg-1
Received: by mail-wm1-f71.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so7394967wmb.9
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+3mR3mqj9Y549agL9uOKKwNa4Nrh6w+hyJQcYaYC4zg=;
 b=fzgea40Ux4tI9k+BZOzgI0ObwPTF/ven5Z1ZAEoegOH03qkzc/BR5Hd9zIU+y/6FYW
 kY69lQ6xK6ltlCgwObbmK75GXYK90C7XHuTddN5o96oRD6ph591ejdC6h9mOLNAC6VkJ
 R4iIV7CLn/LTFVq33stcbKIOb/MWSIbXXhLlUqCik+ZnMDvCKTDOivXl7mMyidD6b77k
 1Dl7focfy95FBF6MZUfYFMP0uz9xHbsWmsFRJmqAjXIFUUwp0BQwv2HQ/iveWUhAmSIO
 y2vuuH0n4Yb/oC6BZnRSJgFPtchZj/U1T1Z3u/C6883kEXQyMsT7cSazveG/MSdWdQRN
 DwVw==
X-Gm-Message-State: AOAM530LSgIyXV4jY5Z2N3nKJN7ycaypOa9I/WCl899lxzkbkzeisOoN
 yHC1rwmDxs7e/8w/zODoAo7WmUur89IHS1cwaqql5vN/NGqKRFNlL9pRFOcmGsbONwO2/N4cZcI
 m3B1Zhdbhz9LcQBBsiF8sEY0yA3M7M6WHuZFo6wvtDbyYXksFYLChTy6RquKI
X-Received: by 2002:a05:600c:2113:: with SMTP id
 u19mr5915458wml.16.1641798987441; 
 Sun, 09 Jan 2022 23:16:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHRPqGnrSMtWEEhR6NLQI+Uz15FVE4L404DixnjQ/gAHvknTSzHTvu+jib/aBLHzYKEMgh/A==
X-Received: by 2002:a05:600c:2113:: with SMTP id
 u19mr5915437wml.16.1641798987136; 
 Sun, 09 Jan 2022 23:16:27 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id x22sm682789wmi.13.2022.01.09.23.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:26 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] Revert "virtio-pci: decouple the single vector from the
 interrupt process"
Message-ID: <20220110071547.195669-9-mst@redhat.com>
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

This reverts commit 316011b8a74e777eb3ba03171cd701a291c28867.
---
 hw/virtio/virtio-pci.c | 163 +++++++++++++++++++----------------------
 1 file changed, 74 insertions(+), 89 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 7201cf3dc1..4bdb6e5694 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -677,6 +677,7 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
+                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -739,103 +740,87 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     return 0;
 }
 
-static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
-{
-    unsigned int vector;
-    int ret;
-    EventNotifier *n;
-    PCIDevice *dev = &proxy->pci_dev;
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-
-    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-    if (ret < 0) {
-        return ret;
-    }
-    if (vector >= msix_nr_vectors_allocated(dev)) {
-        return 0;
-    }
-    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
-    if (ret < 0) {
-        goto undo;
-    }
-    /*
-     * If guest supports masking, set up irqfd now.
-     * Otherwise, delay until unmasked in the frontend.
-     */
-    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
-        if (ret < 0) {
-            kvm_virtio_pci_vq_vector_release(proxy, vector);
-            goto undo;
-        }
-    }
-
-    return 0;
-undo:
-
-    vector = virtio_queue_vector(vdev, queue_no);
-    if (vector >= msix_nr_vectors_allocated(dev)) {
-        return ret;
-    }
-    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            return ret;
-        }
-        kvm_virtio_pci_irqfd_release(proxy, n, vector);
-    }
-    return ret;
-}
 static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
 {
-    int queue_no;
-    int ret = 0;
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-
-    for (queue_no = 0; queue_no < nvqs; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
-            return -1;
-        }
-        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
-    }
-    return ret;
-}
-
-
-static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
-                                              int queue_no)
-{
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    unsigned int vector;
-    EventNotifier *n;
-    int ret;
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     PCIDevice *dev = &proxy->pci_dev;
-
-    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-    if (ret < 0) {
-        return;
-    }
-    if (vector >= msix_nr_vectors_allocated(dev)) {
-        return;
-    }
-    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-        kvm_virtio_pci_irqfd_release(proxy, n, vector);
-    }
-    kvm_virtio_pci_vq_vector_release(proxy, vector);
-}
-
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
-{
-    int queue_no;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    unsigned int vector;
+    int ret, queue_no;
+    EventNotifier *n;
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        kvm_virtio_pci_vector_release_one(proxy, queue_no);
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            break;
+        }
+        if (vector >= msix_nr_vectors_allocated(dev)) {
+            continue;
+        }
+        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
+        if (ret < 0) {
+            goto undo;
+        }
+        /* If guest supports masking, set up irqfd now.
+         * Otherwise, delay until unmasked in the frontend.
+         */
+        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
+            if (ret < 0) {
+                kvm_virtio_pci_vq_vector_release(proxy, vector);
+                goto undo;
+            }
+        }
+    }
+    return 0;
+
+undo:
+    while (--queue_no >= 0) {
+        vector = virtio_queue_vector(vdev, queue_no);
+        if (vector >= msix_nr_vectors_allocated(dev)) {
+            continue;
+        }
+        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+            if (ret < 0) {
+                break;
+            }
+            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+        }
+        kvm_virtio_pci_vq_vector_release(proxy, vector);
+    }
+    return ret;
+}
+
+static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+{
+    PCIDevice *dev = &proxy->pci_dev;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    unsigned int vector;
+    int queue_no;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    EventNotifier *n;
+    int ret ;
+    for (queue_no = 0; queue_no < nvqs; queue_no++) {
+        if (!virtio_queue_get_num(vdev, queue_no)) {
+            break;
+        }
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            break;
+        }
+        if (vector >= msix_nr_vectors_allocated(dev)) {
+            continue;
+        }
+        /* If guest supports masking, clean up irqfd now.
+         * Otherwise, it was cleaned when masked in the frontend.
+         */
+        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+        }
+        kvm_virtio_pci_vq_vector_release(proxy, vector);
     }
 }
 
-- 
MST


