Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2F6EDCF5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDM9-00063N-Ng; Tue, 25 Apr 2023 03:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDM7-000634-At
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDM5-0006Ov-ON
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+z9Tw3dIc5g4KFljaVdyXYNPXxeEiGC7ErcCHnIjeRk=;
 b=Jxtm+2Eti2N58twL5/XqyKrMdpMrnTae0qRTJb3ntq8Bm7C3E/OYoahNySC1+D//paoZ1u
 a2lrQiolt9rO0ozDVxRdf7ZxuGvidWXsL81Ll0M/ZQc3FzXDrPWFjekZosrCNDPKqXBdKH
 +tO7D+d1Si9cuYh7/yaeaWrdS0DAvr0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-shX2rB6SP4ymR98-KZyRQg-1; Tue, 25 Apr 2023 03:44:51 -0400
X-MC-Unique: shX2rB6SP4ymR98-KZyRQg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f18c2b2110so18678665e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408689; x=1685000689;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+z9Tw3dIc5g4KFljaVdyXYNPXxeEiGC7ErcCHnIjeRk=;
 b=ZhW68cJ2w8XTd7pc+3QtwTRn1pyJmjXNI96S9E/m4cU5J70bCDmEqTvjfrtkB1Mzs3
 dGPW6egih81+enEMvg4RT2hbPWv9HMJJPsRYTlUNuqAUUDgrWxtxiKIHwwVEK1ZYVE57
 RTy/G9Tn2Z4OjQV2z3QcYjS2yxOGMAfU6hUMzUjnVtde7c56S3tQsEAdWFWkihFOdzXp
 0bfNihKJ8jSTFiqOoLlhjJKfYUernV1mUAB1seQhdvnd0/eWQP3zYWAUHiierSnLZyu2
 sgH7FxnGAh99ZrUclfhK3DjEZM14ui3Cr7hcHs1S99beO8ZXr70942S0UiF8z0fMBQNL
 332g==
X-Gm-Message-State: AAQBX9fdQ4gFa84TYL77dG6jrpSierSNdnPwCDn+JIyqcTPoldn5Lm6t
 h//yeKC8U1Nuj1mWS/Wh82muso02vF+Y/eBqEwpXMRaFX4dh4b8g8PRlS0Rm52+W3bYDzAoFfv1
 JuyElKjaCIhg73niFFNRpLiMFMW24C2BI3o1RrffwkY6AlyEiaRKp6If2ib8VkE1D6RG4
X-Received: by 2002:a7b:ce15:0:b0:3f1:7278:66e0 with SMTP id
 m21-20020a7bce15000000b003f1727866e0mr9427496wmc.30.1682408689104; 
 Tue, 25 Apr 2023 00:44:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aNmo8ZiUVf51jkPyfp6pI8P+IUL/jDoj9V6L0mujsQD9rU9ZWUiiPLqG4Ix1eSI/R5uWLaLw==
X-Received: by 2002:a7b:ce15:0:b0:3f1:7278:66e0 with SMTP id
 m21-20020a7bce15000000b003f1727866e0mr9427465wmc.30.1682408688733; 
 Tue, 25 Apr 2023 00:44:48 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 eo9-20020a05600c82c900b003f0ad8d1c69sm11164816wmb.25.2023.04.25.00.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:44:47 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:44:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Subject: [PULL 01/31] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <f0d634ea1964ccce317818c44fe299e71007e64d.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Carlos López <clopez@suse.de>

When a virtqueue size is changed by the guest via
virtio_queue_set_num(), its region cache is not automatically updated.
If the size was increased, this could lead to accessing the cache out
of bounds. For example, in vring_get_used_event():

    static inline uint16_t vring_get_used_event(VirtQueue *vq)
    {
        return vring_avail_ring(vq, vq->vring.num);
    }

    static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
    {
        VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
        hwaddr pa = offsetof(VRingAvail, ring[i]);

        if (!caches) {
            return 0;
        }

        return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
    }

vq->vring.num will be greater than caches->avail.len, which will
trigger a failed assertion down the call path of
virtio_lduw_phys_cached().

Fix this by calling virtio_init_region_cache() after
virtio_queue_set_num() if we are not already calling
virtio_queue_set_rings(). In the legacy path this is already done by
virtio_queue_update_rings().

Signed-off-by: Carlos López <clopez@suse.de>
Message-Id: <20230317002749.27379-1-clopez@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 1 +
 hw/s390x/virtio-ccw.c      | 1 +
 hw/virtio/virtio-mmio.c    | 1 +
 hw/virtio/virtio-pci.c     | 1 +
 hw/virtio/virtio.c         | 2 +-
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f236e94ca6..f6b38f7e9c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -309,6 +309,7 @@ int virtio_get_num_queues(VirtIODevice *vdev);
 void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
                             hwaddr avail, hwaddr used);
 void virtio_queue_update_rings(VirtIODevice *vdev, int n);
+void virtio_init_region_cache(VirtIODevice *vdev, int n);
 void virtio_queue_set_align(VirtIODevice *vdev, int n, int align);
 void virtio_queue_notify(VirtIODevice *vdev, int n);
 uint16_t virtio_queue_vector(VirtIODevice *vdev, int n);
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index e33e5207ab..f44de1a8c1 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
                 return -EINVAL;
             }
             virtio_queue_set_num(vdev, index, num);
+            virtio_init_region_cache(vdev, index);
         } else if (virtio_queue_get_num(vdev, index) > num) {
             /* Fail if we don't have a big enough queue. */
             return -EINVAL;
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 23ba625eb6..c2c6d85475 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -354,6 +354,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
         if (proxy->legacy) {
             virtio_queue_update_rings(vdev, vdev->queue_sel);
         } else {
+            virtio_init_region_cache(vdev, vdev->queue_sel);
             proxy->vqs[vdev->queue_sel].num = value;
         }
         break;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 247325c193..02fb84a8fa 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         proxy->vqs[vdev->queue_sel].num = val;
         virtio_queue_set_num(vdev, vdev->queue_sel,
                              proxy->vqs[vdev->queue_sel].num);
+        virtio_init_region_cache(vdev, vdev->queue_sel);
         break;
     case VIRTIO_PCI_COMMON_Q_MSIX:
         vector = virtio_queue_vector(vdev, vdev->queue_sel);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 98c4819fcc..272d930721 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -226,7 +226,7 @@ static void virtio_virtqueue_reset_region_cache(struct VirtQueue *vq)
     }
 }
 
-static void virtio_init_region_cache(VirtIODevice *vdev, int n)
+void virtio_init_region_cache(VirtIODevice *vdev, int n)
 {
     VirtQueue *vq = &vdev->vq[n];
     VRingMemoryRegionCaches *old = vq->vring.caches;
-- 
MST


