Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08B1496D9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jan 2020 18:22:49 +0100 (CET)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ivP8y-0001a1-MV
	for lists+qemu-devel@lfdr.de; Sat, 25 Jan 2020 12:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ivP7L-0007vz-5Q
 for qemu-devel@nongnu.org; Sat, 25 Jan 2020 12:21:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ivP7I-0004v0-2q
 for qemu-devel@nongnu.org; Sat, 25 Jan 2020 12:21:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36724
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ivP7H-0004uZ-W3
 for qemu-devel@nongnu.org; Sat, 25 Jan 2020 12:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579972863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNgLxLk2625oZeDAzOkowJF+BXrSL1Vo5ZqvHzz8lgE=;
 b=AHwr8cgydRHJNDg1Yo6YsaaR7aXHRkqtPHubrY3A435dc6rEFM5TvaLIiGJuC0tlfeJF+T
 yr80UmHUGsRWrC8vMSTPj69Q+OvSxy+5LYA7PSolOUtaHSiYyDf6jqcZBXCh8MMqCR6J2P
 hgG7aHrEA2amDvxQbuHYEvcsDJw7nZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-CmFQjkZrN8G9KLuyc-Sawg-1; Sat, 25 Jan 2020 12:21:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D328713E9;
 Sat, 25 Jan 2020 17:21:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 506E886E19;
 Sat, 25 Jan 2020 17:20:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v13 05/10] virtio-iommu: Implement translate
Date: Sat, 25 Jan 2020 18:19:50 +0100
Message-Id: <20200125171955.12825-6-eric.auger@redhat.com>
In-Reply-To: <20200125171955.12825-1-eric.auger@redhat.com>
References: <20200125171955.12825-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: CmFQjkZrN8G9KLuyc-Sawg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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

This patch implements the translate callback

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v11 -> v12:
- Added Jean's R-b
- s/qemu_log_mask/error_report_once

v10 -> v11:
- take into account the new value struct and use
  g_tree_lookup_extended
- switched to error_report_once

v6 -> v7:
- implemented bypass-mode

v5 -> v6:
- replace error_report by qemu_log_mask

v4 -> v5:
- check the device domain is not NULL
- s/printf/error_report
- set flags to IOMMU_NONE in case of all translation faults
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 60 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 22162d6583..095aa8b509 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -71,3 +71,4 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=
=3D%d"
 virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=3D%d"
 virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
 virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
+virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_=
t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index e1e0c69473..cc0715284f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -477,19 +477,77 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
                                             int iommu_idx)
 {
     IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMUInterval interval, *mapping_key;
+    VirtIOIOMMUMapping *mapping_value;
+    VirtIOIOMMU *s =3D sdev->viommu;
+    VirtIOIOMMUEndpoint *ep;
+    bool bypass_allowed;
     uint32_t sid;
+    bool found;
+
+    interval.low =3D addr;
+    interval.high =3D addr + 1;
=20
     IOMMUTLBEntry entry =3D {
         .target_as =3D &address_space_memory,
         .iova =3D addr,
         .translated_addr =3D addr,
-        .addr_mask =3D ~(hwaddr)0,
+        .addr_mask =3D (1 << ctz32(s->config.page_size_mask)) - 1,
         .perm =3D IOMMU_NONE,
     };
=20
+    bypass_allowed =3D virtio_vdev_has_feature(&s->parent_obj,
+                                             VIRTIO_IOMMU_F_BYPASS);
+
     sid =3D virtio_iommu_get_bdf(sdev);
=20
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+    if (!ep) {
+        if (!bypass_allowed) {
+            error_report_once("%s sid=3D%d is not known!!", __func__, sid)=
;
+        } else {
+            entry.perm =3D flag;
+        }
+        goto unlock;
+    }
+
+    if (!ep->domain) {
+        if (!bypass_allowed) {
+            error_report_once("%s %02x:%02x.%01x not attached to any domai=
n",
+                              __func__, PCI_BUS_NUM(sid),
+                              PCI_SLOT(sid), PCI_FUNC(sid));
+        } else {
+            entry.perm =3D flag;
+        }
+        goto unlock;
+    }
+
+    found =3D g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&int=
erval),
+                                   (void **)&mapping_key,
+                                   (void **)&mapping_value);
+    if (!found) {
+        error_report_once("%s no mapping for 0x%"PRIx64" for sid=3D%d",
+                          __func__, addr, sid);
+        goto unlock;
+    }
+
+    if (((flag & IOMMU_RO) &&
+            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
+        ((flag & IOMMU_WO) &&
+            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
+        error_report_once("%s permission error on 0x%"PRIx64"(%d): allowed=
=3D%d",
+                          __func__, addr, flag, mapping_value->flags);
+        goto unlock;
+    }
+    entry.translated_addr =3D addr - mapping_key->low + mapping_value->phy=
s_addr;
+    entry.perm =3D flag;
+    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
     return entry;
 }
=20
--=20
2.20.1


