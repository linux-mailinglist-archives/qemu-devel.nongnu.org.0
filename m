Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E41F6AC7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 17:19:32 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjOzL-0000yT-OU
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 11:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjOsk-0004iK-T5
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 11:12:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34430
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjOsg-0003U2-Tr
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 11:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591888356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EG9/EteMQ7YFZhz4LAPnTuvoSkpBzI4tpCBXknkBiuI=;
 b=bbrHs7OkvvONHiizZJXBRYL19GsCC44FRSCAnXgqvftWNQEukDYcct9uv828cNPEmdYJb0
 iYPRQ21jcTkgeyjPfdrEgplA31yT9090R1C2fwrrYxGmK2OR5/qhI9YlMWtcLO+tBMD0EO
 QadicBGpZBb8eeJONVxI8kGKJOnAYSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-WKoxITT1MFO-IuEYh2XM6Q-1; Thu, 11 Jun 2020 11:12:30 -0400
X-MC-Unique: WKoxITT1MFO-IuEYh2XM6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D9FC461;
 Thu, 11 Jun 2020 15:12:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE91F8FF61;
 Thu, 11 Jun 2020 15:12:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v3 2/5] virtio-iommu: Implement RESV_MEM probe request
Date: Thu, 11 Jun 2020 17:12:06 +0200
Message-Id: <20200611151209.22547-3-eric.auger@redhat.com>
In-Reply-To: <20200611151209.22547-1-eric.auger@redhat.com>
References: <20200611151209.22547-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the PROBE request. At the moment,
only THE RESV_MEM property is handled. The first goal is
to report iommu wide reserved regions such as the MSI regions
set by the machine code. On x86 this will be the IOAPIC MSI
region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
doorbell.

In the future we may introduce per device reserved regions.
This will be useful when protecting host assigned devices
which may expose their own reserved regions

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- on probe, do not fill the reminder of the buffer with zeroes
  as the buffer was already zero initialized (Bharat)

v1 -> v2:
- move the unlock back to the same place
- remove the push label and factorize the code after the out label
- fix a bunch of cpu_to_leX according to the latest spec revision
- do not remove sizeof(last) from free space
- check the ep exists
---
 include/hw/virtio/virtio-iommu.h |  2 +
 hw/virtio/virtio-iommu.c         | 91 ++++++++++++++++++++++++++++++--
 hw/virtio/trace-events           |  1 +
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index e653004d7c..49eb105cd8 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -53,6 +53,8 @@ typedef struct VirtIOIOMMU {
     GHashTable *as_by_busptr;
     IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
     PCIBus *primary_bus;
+    ReservedRegion *reserved_regions;
+    uint32_t nb_reserved_regions;
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 483883ec1d..be1527c1d6 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -38,6 +38,7 @@
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
+#define VIOMMU_PROBE_SIZE 512
 
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
@@ -378,6 +379,62 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return ret;
 }
 
+static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
+                                               uint8_t *buf, size_t free)
+{
+    struct virtio_iommu_probe_resv_mem prop = {};
+    size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
+    int i;
+
+    total = size * s->nb_reserved_regions;
+
+    if (total > free) {
+        return -ENOSPC;
+    }
+
+    for (i = 0; i < s->nb_reserved_regions; i++) {
+        prop.head.type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM);
+        prop.head.length = cpu_to_le16(length);
+        prop.subtype = s->reserved_regions[i].type;
+        prop.start = cpu_to_le64(s->reserved_regions[i].low);
+        prop.end = cpu_to_le64(s->reserved_regions[i].high);
+
+        memcpy(buf, &prop, size);
+
+        trace_virtio_iommu_fill_resv_property(ep, prop.subtype,
+                                              prop.start, prop.end);
+        buf += size;
+    }
+    return total;
+}
+
+/**
+ * virtio_iommu_probe - Fill the probe request buffer with
+ * the properties the device is able to return and add a NONE
+ * property at the end.
+ */
+static int virtio_iommu_probe(VirtIOIOMMU *s,
+                              struct virtio_iommu_req_probe *req,
+                              uint8_t *buf)
+{
+    uint32_t ep_id = le32_to_cpu(req->endpoint);
+    size_t free = VIOMMU_PROBE_SIZE;
+    ssize_t count;
+
+    if (!virtio_iommu_mr(s, ep_id)) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
+    if (count < 0) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    buf += count;
+    free -= count;
+
+    return VIRTIO_IOMMU_S_OK;
+}
+
 static int virtio_iommu_iov_to_req(struct iovec *iov,
                                    unsigned int iov_cnt,
                                    void *req, size_t req_sz)
@@ -407,15 +464,27 @@ virtio_iommu_handle_req(detach)
 virtio_iommu_handle_req(map)
 virtio_iommu_handle_req(unmap)
 
+static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
+                                     struct iovec *iov,
+                                     unsigned int iov_cnt,
+                                     uint8_t *buf)
+{
+    struct virtio_iommu_req_probe req;
+    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
+
+    return ret ? ret : virtio_iommu_probe(s, &req, buf);
+}
+
 static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
     struct virtio_iommu_req_head head;
     struct virtio_iommu_req_tail tail = {};
+    size_t output_size = sizeof(tail), sz;
     VirtQueueElement *elem;
     unsigned int iov_cnt;
     struct iovec *iov;
-    size_t sz;
+    void *buf = NULL;
 
     for (;;) {
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
@@ -452,6 +521,17 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
         case VIRTIO_IOMMU_T_UNMAP:
             tail.status = virtio_iommu_handle_unmap(s, iov, iov_cnt);
             break;
+        case VIRTIO_IOMMU_T_PROBE:
+        {
+            struct virtio_iommu_req_tail *ptail;
+
+            output_size = s->config.probe_size + sizeof(tail);
+            buf = g_malloc0(output_size);
+
+            ptail = (struct virtio_iommu_req_tail *)
+                        (buf + s->config.probe_size);
+            ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
+        }
         default:
             tail.status = VIRTIO_IOMMU_S_UNSUPP;
         }
@@ -459,12 +539,13 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
 
 out:
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
-                          &tail, sizeof(tail));
-        assert(sz == sizeof(tail));
+                          buf ? buf : &tail, output_size);
+        assert(sz == output_size);
 
-        virtqueue_push(vq, elem, sizeof(tail));
+        virtqueue_push(vq, elem, sz);
         virtio_notify(vdev, vq);
         g_free(elem);
+        g_free(buf);
     }
 }
 
@@ -667,6 +748,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
     s->config.domain_range.end = 32;
+    s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
     virtio_add_feature(&s->features, VIRTIO_RING_F_INDIRECT_DESC);
@@ -676,6 +758,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
+    virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
 
     qemu_mutex_init(&s->mutex);
 
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 6427a0047d..23109f69bb 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -74,3 +74,4 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
 virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
+virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start, uint64_t end) "dev= %d, type=%d start=0x%"PRIx64" end=0x%"PRIx64
-- 
2.20.1


