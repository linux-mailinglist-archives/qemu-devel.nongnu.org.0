Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94471496DE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jan 2020 18:27:21 +0100 (CET)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivPDM-0007Uz-R5
	for lists+qemu-devel@lfdr.de; Sat, 25 Jan 2020 12:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38025)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ivP7X-0008B4-Ej
 for qemu-devel@nongnu.org; Sat, 25 Jan 2020 12:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ivP7W-0005Vt-5c
 for qemu-devel@nongnu.org; Sat, 25 Jan 2020 12:21:19 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42333
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ivP7W-0005TE-2N
 for qemu-devel@nongnu.org; Sat, 25 Jan 2020 12:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579972877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GScJxhoP1KAh/cSlqCskAZCEHSKhDIGhDLPViiiMCQs=;
 b=LlO8NNRH9sSl07t9p1pFfQfRytrU8zvqCZidGGPDW1FlSpqbxsrhIhs+7TL3p469grCXXQ
 FBPcNURgWCSDtMgVqbxasSSQa4CjCNtPUgfBMG2HYiXsXBhQZDTrTJz5zGUETz2SWVfRmh
 kZzgg3EtjhntEkWnz8E5nX6j8ox5KJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-jqlEi0EROeSiE03YR-lzKA-1; Sat, 25 Jan 2020 12:21:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69CE1477;
 Sat, 25 Jan 2020 17:21:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96BC686E1F;
 Sat, 25 Jan 2020 17:21:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v13 06/10] virtio-iommu: Implement fault reporting
Date: Sat, 25 Jan 2020 18:19:51 +0100
Message-Id: <20200125171955.12825-7-eric.auger@redhat.com>
In-Reply-To: <20200125171955.12825-1-eric.auger@redhat.com>
References: <20200125171955.12825-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: jqlEi0EROeSiE03YR-lzKA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The event queue allows to report asynchronous errors.
The translate function now injects faults when relevant.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v12 -> v13:
- return on virtio_error()

v11 -> v12:
- reporting the addr associated with the fault and set the
  VIRTIO_IOMMU_FAULT_F_ADDRESS flag.
- added cpu_to_le<n>

v10 -> v11:
- change a virtio_error into an error_report_once
  (no buffer available for output faults)
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 73 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 095aa8b509..e83500bee9 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -72,3 +72,4 @@ virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=
=3D%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
 virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_=
t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
+virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoin=
t, uint64_t addr) "FAULT reason=3D%d flags=3D%d endpoint=3D%d address =3D0x=
%"PRIx64
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index cc0715284f..ec8f42e167 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -472,6 +472,51 @@ out:
     }
 }
=20
+static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reason,
+                                      int flags, uint32_t endpoint,
+                                      uint64_t address)
+{
+    VirtIODevice *vdev =3D &viommu->parent_obj;
+    VirtQueue *vq =3D viommu->event_vq;
+    struct virtio_iommu_fault fault;
+    VirtQueueElement *elem;
+    size_t sz;
+
+    memset(&fault, 0, sizeof(fault));
+    fault.reason =3D reason;
+    fault.flags =3D cpu_to_le32(flags);
+    fault.endpoint =3D cpu_to_le32(endpoint);
+    fault.address =3D cpu_to_le64(address);
+
+    for (;;) {
+        elem =3D virtqueue_pop(vq, sizeof(VirtQueueElement));
+
+        if (!elem) {
+            error_report_once(
+                "no buffer available in event queue to report event");
+            return;
+        }
+
+        if (iov_size(elem->in_sg, elem->in_num) < sizeof(fault)) {
+            virtio_error(vdev, "error buffer of wrong size");
+            virtqueue_detach_element(vq, elem, 0);
+            g_free(elem);
+            return;
+        }
+        break;
+    }
+    /* we have a buffer to fill in */
+    sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
+                      &fault, sizeof(fault));
+    assert(sz =3D=3D sizeof(fault));
+
+    trace_virtio_iommu_report_fault(reason, flags, endpoint, address);
+    virtqueue_push(vq, elem, sz);
+    virtio_notify(vdev, vq);
+    g_free(elem);
+
+}
+
 static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr =
addr,
                                             IOMMUAccessFlags flag,
                                             int iommu_idx)
@@ -480,9 +525,10 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemor=
yRegion *mr, hwaddr addr,
     VirtIOIOMMUInterval interval, *mapping_key;
     VirtIOIOMMUMapping *mapping_value;
     VirtIOIOMMU *s =3D sdev->viommu;
+    bool read_fault, write_fault;
     VirtIOIOMMUEndpoint *ep;
+    uint32_t sid, flags;
     bool bypass_allowed;
-    uint32_t sid;
     bool found;
=20
     interval.low =3D addr;
@@ -508,6 +554,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemory=
Region *mr, hwaddr addr,
     if (!ep) {
         if (!bypass_allowed) {
             error_report_once("%s sid=3D%d is not known!!", __func__, sid)=
;
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
+                                      VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                      sid, addr);
         } else {
             entry.perm =3D flag;
         }
@@ -519,6 +568,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemory=
Region *mr, hwaddr addr,
             error_report_once("%s %02x:%02x.%01x not attached to any domai=
n",
                               __func__, PCI_BUS_NUM(sid),
                               PCI_SLOT(sid), PCI_FUNC(sid));
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
+                                      VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                      sid, addr);
         } else {
             entry.perm =3D flag;
         }
@@ -531,15 +583,26 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
     if (!found) {
         error_report_once("%s no mapping for 0x%"PRIx64" for sid=3D%d",
                           __func__, addr, sid);
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                  sid, addr);
         goto unlock;
     }
=20
-    if (((flag & IOMMU_RO) &&
-            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
-        ((flag & IOMMU_WO) &&
-            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+    read_fault =3D (flag & IOMMU_RO) &&
+                    !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ);
+    write_fault =3D (flag & IOMMU_WO) &&
+                    !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE);
+
+    flags =3D read_fault ? VIRTIO_IOMMU_FAULT_F_READ : 0;
+    flags |=3D write_fault ? VIRTIO_IOMMU_FAULT_F_WRITE : 0;
+    if (flags) {
         error_report_once("%s permission error on 0x%"PRIx64"(%d): allowed=
=3D%d",
                           __func__, addr, flag, mapping_value->flags);
+        flags |=3D VIRTIO_IOMMU_FAULT_F_ADDRESS;
+        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                  flags | VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                  sid, addr);
         goto unlock;
     }
     entry.translated_addr =3D addr - mapping_key->low + mapping_value->phy=
s_addr;
--=20
2.20.1


