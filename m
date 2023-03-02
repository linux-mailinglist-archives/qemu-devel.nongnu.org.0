Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CE6A7FC4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfy9-0007Oy-HG; Thu, 02 Mar 2023 05:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>)
 id 1pXfy6-0007OI-QB; Thu, 02 Mar 2023 05:15:22 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>)
 id 1pXfy3-0000L1-4S; Thu, 02 Mar 2023 05:15:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B5D001FE6E;
 Thu,  2 Mar 2023 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677752115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0dFeqs925nKU+EpW5o+gz7IWAukCerMgqLwKq9Ul/ps=;
 b=ShWVbpdXzIk7+DPdLOoO39MmyonUAu1T9faEVo84Xwexb91nB7i4dNM8Qn3zKBTQEdOTgQ
 XVpqpgyb3nknWGdn64cLPjQ5stwbQ3n19BLJ4YWfSzrYjLd4VtN43LU7kx+PuPGQWFtdyy
 23y7Tg+lomVOZ1Z1bMcr5TEvsQyCo3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677752115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0dFeqs925nKU+EpW5o+gz7IWAukCerMgqLwKq9Ul/ps=;
 b=mdIURL9a6o//Y2J5UrgXp8NfZ7MCeW9/mO2k6HFGTYyOpgii4d79CpoH8DFvIhBZ0ocHh2
 M4AGmyOncGoKR2BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E38D313349;
 Thu,  2 Mar 2023 10:15:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ma9vNDJ3AGRbVAAAMHmgww
 (envelope-from <clopez@suse.de>); Thu, 02 Mar 2023 10:15:14 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org (open list:virtio-ccw)
Subject: [PATCH] virtio: refresh vring region cache after updating a virtqueue
 size
Date: Thu,  2 Mar 2023 11:14:47 +0100
Message-Id: <20230302101447.4499-1-clopez@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=clopez@suse.de;
 helo=smtp-out2.suse.de
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

Fix this by calling virtio_queue_update_rings() after
virtio_queue_set_num() if we are not already calling
virtio_queue_set_rings().

Signed-off-by: Carlos López <clopez@suse.de>
---
 hw/s390x/virtio-ccw.c   | 1 +
 hw/virtio/virtio-mmio.c | 5 ++---
 hw/virtio/virtio-pci.c  | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index e33e5207ab..89891ac58a 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
                 return -EINVAL;
             }
             virtio_queue_set_num(vdev, index, num);
+            virtio_queue_update_rings(vdev, index);
         } else if (virtio_queue_get_num(vdev, index) > num) {
             /* Fail if we don't have a big enough queue. */
             return -EINVAL;
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 23ba625eb6..c74822308f 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -350,10 +350,9 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
     case VIRTIO_MMIO_QUEUE_NUM:
         trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
         virtio_queue_set_num(vdev, vdev->queue_sel, value);
+        virtio_queue_update_rings(vdev, vdev->queue_sel);
 
-        if (proxy->legacy) {
-            virtio_queue_update_rings(vdev, vdev->queue_sel);
-        } else {
+        if (!proxy->legacy) {
             proxy->vqs[vdev->queue_sel].num = value;
         }
         break;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 247325c193..a0a2f2c965 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         proxy->vqs[vdev->queue_sel].num = val;
         virtio_queue_set_num(vdev, vdev->queue_sel,
                              proxy->vqs[vdev->queue_sel].num);
+        virtio_queue_update_rings(vdev, vdev->queue_sel);
         break;
     case VIRTIO_PCI_COMMON_Q_MSIX:
         vector = virtio_queue_vector(vdev, vdev->queue_sel);
-- 
2.35.3


