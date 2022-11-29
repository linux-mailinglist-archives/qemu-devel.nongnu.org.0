Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5F63BB46
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:12:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvhw-00076M-4T; Tue, 29 Nov 2022 03:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhl-000718-S4
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhk-0006ky-Cm
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669709459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3U6w+v6rKer2d29EugZW6ynHo4gkaEzfyUZzLYJULg=;
 b=cCEg2Pep5+zQiyvdmaDshX3royWyCzUMOzs+IexTK/nJ3y0Q0EwtMSRx2ilPDnfv5+vNfJ
 tW/t2vBfbuZb1LZ2LScXpJDNIJVnrFUG854l4pDqdYOHegx7NnCGwOeWAHxnzr3ctxjhcT
 3XWpZNDxf/jNt1gZxV2xOS5NDKb/8zM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-dpac-uLmON-Lnaxr9LzqtA-1; Tue, 29 Nov 2022 03:10:57 -0500
X-MC-Unique: dpac-uLmON-Lnaxr9LzqtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72AAE185A7AE;
 Tue, 29 Nov 2022 08:10:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-181.pek2.redhat.com
 [10.72.13.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0316C15BA4;
 Tue, 29 Nov 2022 08:10:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Date: Tue, 29 Nov 2022 16:10:36 +0800
Message-Id: <20221129081037.12099-3-jasowang@redhat.com>
In-Reply-To: <20221129081037.12099-1-jasowang@redhat.com>
References: <20221129081037.12099-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Without dt mode, device IOTLB notifier won't work since guest won't
send device IOTLB invalidation descriptor in this case. Let's fail
early instead of misbehaving silently.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 9143376677..d025ef2873 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
 {
     VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
     IntelIOMMUState *s = vtd_as->iommu_state;
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
 
     /* TODO: add support for VFIO and vhost users */
     if (s->snoop_control) {
@@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
                          PCI_FUNC(vtd_as->devfn));
         return -ENOTSUP;
     }
+    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
+        error_setg_errno(errp, ENOTSUP,
+                         "device %02x.%02x.%x requires device IOTLB mode",
+                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
+                         PCI_FUNC(vtd_as->devfn));
+        return -ENOTSUP;
+    }
 
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
-- 
2.25.1


