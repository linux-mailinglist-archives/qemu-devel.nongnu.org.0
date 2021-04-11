Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B135B459
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:53:56 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZb8-0004MY-SK
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzM-0003ov-8S
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzK-0004N1-HN
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTINoGDPWuX2+Nz0S9JVj0aZyPSJcbNIUf+x1Iqhpw8=;
 b=PTeqpPR9GAlA2ZiZx8NyF9MmyHFRoaGSY6ocfmJKedg/Hl8PK9PLwC9oMyTzixc+TJ/iFB
 KoF61acR9NFDglYMyzXM+D/Ipgp/v4tAUpDG5vWt6cdgFIuzWqj0qLZFRaQM1HSy+zZaIo
 S1hTDZJxUBfANMZBwneyM6ZxYlMeAPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Oc75DSfZMGepu9mcYJvVyQ-1; Sun, 11 Apr 2021 08:14:48 -0400
X-MC-Unique: Oc75DSfZMGepu9mcYJvVyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5CA8030A1;
 Sun, 11 Apr 2021 12:14:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5371110023B2;
 Sun, 11 Apr 2021 12:14:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 28/29] pci: Add return_page_response pci ops
Date: Sun, 11 Apr 2021 14:09:11 +0200
Message-Id: <20210411120912.15770-29-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new PCI operation that allows to return page responses
to registered VFIO devices

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/iommu/iommu.h |  8 ++++++++
 include/hw/pci/pci.h     |  4 ++++
 hw/pci/pci.c             | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
index 12092bda7b..5890f095b1 100644
--- a/include/hw/iommu/iommu.h
+++ b/include/hw/iommu/iommu.h
@@ -24,5 +24,13 @@ typedef struct IOMMUConfig {
           };
 } IOMMUConfig;
 
+typedef struct IOMMUPageResponse {
+    union {
+#ifdef __linux__
+        struct iommu_page_response resp;
+#endif
+          };
+} IOMMUPageResponse;
+
 
 #endif /* QEMU_HW_IOMMU_IOMMU_H */
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1f73c04975..9bc0919352 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,8 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 
 struct PCIPASIDOps {
     int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+    int (*return_page_response)(PCIBus *bus, int32_t devfn,
+                                IOMMUPageResponse *resp);
 };
 typedef struct PCIPASIDOps PCIPASIDOps;
 
@@ -501,6 +503,8 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
 bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
 int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+int pci_device_return_page_response(PCIBus *bus, int32_t devfn,
+                                    IOMMUPageResponse *resp);
 
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 114855a0ac..18d84ff42e 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2765,6 +2765,22 @@ int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
     return -ENOENT;
 }
 
+int pci_device_return_page_response(PCIBus *bus, int32_t devfn,
+                                    IOMMUPageResponse *resp)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return -EINVAL;
+    }
+
+    dev = bus->devices[devfn];
+    if (dev && dev->pasid_ops && dev->pasid_ops->return_page_response) {
+        return dev->pasid_ops->return_page_response(bus, devfn, resp);
+    }
+    return -ENOENT;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
-- 
2.26.3


