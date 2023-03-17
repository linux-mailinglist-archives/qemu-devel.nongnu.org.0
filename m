Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203D6BDDB1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 01:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcy2X-00031g-J0; Thu, 16 Mar 2023 20:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>)
 id 1pcy2V-00031M-QZ; Thu, 16 Mar 2023 20:33:47 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>)
 id 1pcy2U-0003aZ-2w; Thu, 16 Mar 2023 20:33:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B1A921866;
 Fri, 17 Mar 2023 00:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679013222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zhXW6aaqjrMS4mVaw0Pewr+CcVLOlwEE+qT5F52AQdc=;
 b=WfS1l+0pmDI7LjCzQHDabVtJblpWgVzpzLtokEWgKMR+FWKwx/8q94qKYdF8anJwYurC3F
 FbsIJaMe1ONihuFGgys+Gr94nZYEpDuqaj8FZ8Ckk0upZAxu9Q7kARB1rk6LlTDTrM9C+4
 qbG2IrRc+LSYDC0g+3R06jTi0/947iA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679013222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zhXW6aaqjrMS4mVaw0Pewr+CcVLOlwEE+qT5F52AQdc=;
 b=Q/yn4M05qUdplvzuEziYUOh1mM2TKEv2VjdCcYfFNCgd1c/I4T9ub8eNLaF1uH3FQ2j+NN
 QOd0t+5WKBsFRmBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C08AD133E0;
 Fri, 17 Mar 2023 00:33:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VwleKmW1E2R5dwAAMHmgww
 (envelope-from <clopez@suse.de>); Fri, 17 Mar 2023 00:33:41 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:virtio-ccw)
Subject: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
Date: Fri, 17 Mar 2023 01:27:51 +0100
Message-Id: <20230317002749.27379-1-clopez@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=clopez@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
---
v2: use virtio_init_region_cache() instead of
virtio_queue_update_rings() in the path for modern devices.

 hw/s390x/virtio-ccw.c      | 1 +
 hw/virtio/virtio-mmio.c    | 1 +
 hw/virtio/virtio-pci.c     | 1 +
 hw/virtio/virtio.c         | 2 +-
 include/hw/virtio/virtio.h | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

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
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 77c6c55929..fed5fff049 100644
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
-- 
2.35.3


