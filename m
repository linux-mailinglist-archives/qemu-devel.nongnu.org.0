Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFE18F133
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 09:51:04 +0100 (CET)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGInX-0004aY-N4
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 04:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIja-0008T2-4M
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjY-00039U-U9
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:46:57 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:35584)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjY-00039L-PN; Mon, 23 Mar 2020 04:46:56 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8eL99013746; Mon, 23 Mar 2020 01:46:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=RiNtP0lrtaA2ZggFVaFqGet0PIqt/tlcLob6DvD3BIo=;
 b=xPsIXPFZH1oBDFsmhrf4vd1qjKM+gRvSsYTpuGTLutwgM7aCvKuU1+Lgutt5N4zcrJgQ
 yUSMhQ4PRW97XYPXqfG73NELAFSyBEYLViw0AkZfNfPtCUy4N6+m9YainsvFkgoXz2Dr
 Z2jFZQBkzfhznDLi/LPGD+sDv7w5ogXuAYimPhC0Ks7sXiOQoRGxOoUlQMUhQg2dzf5Q
 5C7yXBz+6rvKilU8ualk7AGCRU0NDwY9sX7kqNFCEbA59cFYHNEO0YOxXgRS8ZHiSZcP
 faM5/b9Z7OU2PnCBpkzbINye+E/KKOd9YhAFXHW6p5/A8BDaiRvJICJ2H+qVBO41t6g7 RA== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2ywvkqkxcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:51 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:46:49 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:45 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 4/9] virtio-iommu: set supported page size mask
Date: Mon, 23 Mar 2020 14:16:12 +0530
Message-ID: <20200323084617.1782-5-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
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
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add optional interface to set page size mask.
Currently this is set global configuration and not
per endpoint.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 include/hw/virtio/virtio-iommu.h | 1 +
 hw/virtio/virtio-iommu.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 6f67f1020a..4efa09610a 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -35,6 +35,7 @@ typedef struct IOMMUDevice {
     void         *viommu;
     PCIBus       *bus;
     int           devfn;
+    uint64_t      page_size_mask;
     IOMMUMemoryRegion  iommu_mr;
     AddressSpace  as;
 } IOMMUDevice;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..a28818202c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -650,6 +650,14 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
+                                            uint64_t page_size_mask)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+
+    sdev->page_size_mask = page_size_mask;
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -865,6 +873,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
 
     imrc->translate = virtio_iommu_translate;
+    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.17.1


