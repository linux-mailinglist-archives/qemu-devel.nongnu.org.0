Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F410264C6D9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:11:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi9-0007i4-4K; Wed, 14 Dec 2022 05:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0007cF-G2
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohe-00016Y-Fr
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fC2uX57Vo/LJduT5Qa2yFHUm2yh9kzdU0t1CV28GY4A=;
 b=NC/Xa8KUs3wk2Dsz/mWl5Dyy1evalg+LisfE9pI5QA0DkkIYLBJdFavZmECFyPz9O8rGzk
 zEB/vxcn6b+KAqMc03HkDVZbuqT/yRuT2FhrBSdbBxgJ1FjX8oKms13yb1CdQuaYYp/bCG
 AAJklgpuUY9Q3DXQWA+/f0q61+hRj0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-RQ2vz3M1N-2i5H2glQfmlQ-1; Wed, 14 Dec 2022 05:09:20 -0500
X-MC-Unique: RQ2vz3M1N-2i5H2glQfmlQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55F9288B7A2;
 Wed, 14 Dec 2022 10:09:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34C9C492C3C;
 Wed, 14 Dec 2022 10:09:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Subject: [PULL 02/23] s390x/pci: shrink DMA aperture to be bound by vfio DMA
 limit
Date: Wed, 14 Dec 2022 11:08:50 +0100
Message-Id: <20221214100911.165291-3-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Matthew Rosato <mjrosato@linux.ibm.com>

Currently, s390x-pci performs accounting against the vfio DMA
limit and triggers the guest to clean up mappings when the limit
is reached. Let's go a step further and also limit the size of
the supported DMA aperture reported to the guest based upon the
initial vfio DMA limit reported for the container (if less than
than the size reported by the firmware/host zPCI layer).  This
avoids processing sections of the guest DMA table during global
refresh that, for common use cases, will never be used anway, and
makes exhausting the vfio DMA limit due to mismatch between guest
aperture size and host limit far less likely and more indicitive
of an error.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Message-Id: <20221028194758.204007-4-mjrosato@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/s390-pci-bus.h |  1 +
 hw/s390x/s390-pci-vfio.c        | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 0605fcea24..1c46e3a269 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -278,6 +278,7 @@ struct S390PCIIOMMU {
     uint64_t g_iota;
     uint64_t pba;
     uint64_t pal;
+    uint64_t max_dma_limit;
     GHashTable *iotlb;
     S390PCIDMACount *dma_limit;
 };
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 5f0adb0b4a..f7bf36cec8 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -84,6 +84,7 @@ S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
     cnt->users = 1;
     cnt->avail = avail;
     QTAILQ_INSERT_TAIL(&s->zpci_dma_limit, cnt, link);
+    pbdev->iommu->max_dma_limit = avail;
     return cnt;
 }
 
@@ -103,6 +104,7 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     struct vfio_info_cap_header *hdr;
     struct vfio_device_info_cap_zpci_base *cap;
     VFIOPCIDevice *vpci =  container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+    uint64_t vfio_size;
 
     hdr = vfio_get_device_info_cap(info, VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
 
@@ -122,6 +124,15 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     /* The following values remain 0 until we support other FMB formats */
     pbdev->zpci_fn.fmbl = 0;
     pbdev->zpci_fn.pft = 0;
+
+    /*
+     * If appropriate, reduce the size of the supported DMA aperture reported
+     * to the guest based upon the vfio DMA limit.
+     */
+    vfio_size = pbdev->iommu->max_dma_limit << TARGET_PAGE_BITS;
+    if (vfio_size < (cap->end_dma - cap->start_dma + 1)) {
+        pbdev->zpci_fn.edma = cap->start_dma + vfio_size - 1;
+    }
 }
 
 static bool get_host_fh(S390PCIBusDevice *pbdev, struct vfio_device_info *info,
-- 
2.31.1


