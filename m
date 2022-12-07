Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631B2645B15
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uc0-0002JA-K2; Wed, 07 Dec 2022 08:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubv-0002HS-LL
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:37:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubn-0006Ss-GQ
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670420226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5/UyHJl48vBSnvkt5+gx7qkBlKO/QFIhbVzFp57PQ5s=;
 b=X1mQ+kH6/UpYLFnfaz6Be3AH7vNhCtPTgovygjso6lVFb20uo0J5NUPBjF533Cgfqwko/q
 JIhRbyB9i/SAyk7b7ANIlQ+oQPPqOdaprNVgbFAds02O/ByQ4GJ4kYOGqVuAYyxxyOg+4W
 /E7ukq1INVkn4fD/l2kWcog6nxeTmUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-2JP6O_pdMFGyOYd3wVnk7Q-1; Wed, 07 Dec 2022 08:37:03 -0500
X-MC-Unique: 2JP6O_pdMFGyOYd3wVnk7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A40B3185A7AD;
 Wed,  7 Dec 2022 13:37:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBCD79E70;
 Wed,  7 Dec 2022 13:37:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 peterx@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: [PATCH for 8.0 2/2] virtio-iommu: Fix replay on device attach
Date: Wed,  7 Dec 2022 14:36:46 +0100
Message-Id: <20221207133646.635760-3-eric.auger@redhat.com>
In-Reply-To: <20221207133646.635760-1-eric.auger@redhat.com>
References: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

When attaching a device to a domain, we replay the existing
domain mappings for that device. If there are several VFIO
devices in the same group on the guest we may end up with
duplicate mapping attempts because the mapping already exist
on VFIO side. So let's do a proper remap, ie. first unmap
and then map.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes 2f6eeb5f0bb ("virtio-iommu: Call memory notifiers in attach/detach")
---
 hw/virtio/virtio-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 30334c85aa..099dec1f31 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -277,19 +277,21 @@ static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
     return false;
 }
 
-static gboolean virtio_iommu_notify_map_cb(gpointer key, gpointer value,
-                                           gpointer data)
+static gboolean virtio_iommu_notify_remap_cb(gpointer key, gpointer value,
+                                             gpointer data)
 {
     VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
     VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
     IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
 
+    virtio_iommu_notify_unmap(mr, interval->low, interval->high);
     virtio_iommu_notify_map(mr, interval->low, interval->high,
                             mapping->phys_addr, mapping->flags);
 
     return false;
 }
 
+
 static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
 {
     VirtIOIOMMUDomain *domain = ep->domain;
@@ -489,7 +491,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     virtio_iommu_switch_address_space(sdev);
 
     /* Replay domain mappings on the associated memory region */
-    g_tree_foreach(domain->mappings, virtio_iommu_notify_map_cb,
+    g_tree_foreach(domain->mappings, virtio_iommu_notify_remap_cb,
                    ep->iommu_mr);
 
     return VIRTIO_IOMMU_S_OK;
-- 
2.37.3


