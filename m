Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197617AFC6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 19:25:17 +0200 (CEST)
Received: from localhost ([::1]:34859 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsVsC-0005IG-AF
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 13:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVq3-00015P-Hl
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVq2-00013c-GE
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:23:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVpz-00011T-Uq; Tue, 30 Jul 2019 13:23:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A63930860A7;
 Tue, 30 Jul 2019 17:22:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B19E460BE5;
 Tue, 30 Jul 2019 17:22:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:29 +0200
Message-Id: <20190730172137.23114-8-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 30 Jul 2019 17:22:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.2 v10 07/15] virtio-iommu: Implement
 attach/detach command
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
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the endpoint attach/detach to/from
a domain.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/virtio/virtio-iommu.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 77dccecc0a..5ea0930cc2 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -80,8 +80,8 @@ static void virtio_iommu_detach_endpoint_from_domain(vi=
ommu_endpoint *ep)
     ep->domain =3D NULL;
 }
=20
-viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_i=
d);
-viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_i=
d)
+static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
+                                                  uint32_t ep_id)
 {
     viommu_endpoint *ep;
=20
@@ -110,8 +110,8 @@ static void virtio_iommu_put_endpoint(gpointer data)
     g_free(ep);
 }
=20
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_i=
d);
-viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_i=
d)
+static viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s,
+                                              uint32_t domain_id)
 {
     viommu_domain *domain;
=20
@@ -187,10 +187,27 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 {
     uint32_t domain_id =3D le32_to_cpu(req->domain);
     uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+    viommu_domain *domain;
+    viommu_endpoint *ep;
=20
     trace_virtio_iommu_attach(domain_id, ep_id);
=20
-    return VIRTIO_IOMMU_S_UNSUPP;
+    ep =3D virtio_iommu_get_endpoint(s, ep_id);
+    if (ep->domain) {
+        /*
+         * the device is already attached to a domain,
+         * detach it first
+         */
+        virtio_iommu_detach_endpoint_from_domain(ep);
+    }
+
+    domain =3D virtio_iommu_get_domain(s, domain_id);
+    QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
+
+    ep->domain =3D domain;
+    g_tree_ref(domain->mappings);
+
+    return VIRTIO_IOMMU_S_OK;
 }
=20
 static int virtio_iommu_detach(VirtIOIOMMU *s,
@@ -198,10 +215,21 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
 {
     uint32_t domain_id =3D le32_to_cpu(req->domain);
     uint32_t ep_id =3D le32_to_cpu(req->endpoint);
+    viommu_endpoint *ep;
=20
     trace_virtio_iommu_detach(domain_id, ep_id);
=20
-    return VIRTIO_IOMMU_S_UNSUPP;
+    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
+    if (!ep) {
+        return VIRTIO_IOMMU_S_NOENT;
+    }
+
+    if (!ep->domain) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    virtio_iommu_detach_endpoint_from_domain(ep);
+    return VIRTIO_IOMMU_S_OK;
 }
=20
 static int virtio_iommu_map(VirtIOIOMMU *s,
--=20
2.20.1


