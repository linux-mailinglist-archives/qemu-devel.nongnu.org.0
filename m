Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B326A324F4C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:36:24 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEwR-0001YF-Dt
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELY-0004fk-Lo
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELV-00070N-Qn
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cQkl66E24M8VeULF1IvXrsRBj67n6Pab2FbmOABPpQ=;
 b=htO5AzirRfazmxnOMbuwxnX9vSUQ+j+WqO++i6P79A2GoG69Vzjq0tRQTGadsclYKIelbw
 gfeotb+5lsdl8E+wmUZFdhFcyGvofBhJ4BdeUt5Vc1O0k6cemK4U3Rcgo8YFiUam6k7qPs
 KCoJGPkNdHadtHGn8vztZvYvz7vUkqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-EVc56eM3M_K-m0EJld2aww-1; Thu, 25 Feb 2021 05:58:11 -0500
X-MC-Unique: EVc56eM3M_K-m0EJld2aww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90F118B6142;
 Thu, 25 Feb 2021 10:58:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D3CC5D9D7;
 Thu, 25 Feb 2021 10:58:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 27/28] pci: Add return_page_response pci ops
Date: Thu, 25 Feb 2021 11:52:32 +0100
Message-Id: <20210225105233.650545-28-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new PCI operation that allows to return page responses
to registered VFIO devices

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci/pci.c             | 16 ++++++++++++++++
 include/hw/iommu/iommu.h |  8 ++++++++
 include/hw/pci/pci.h     |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8f79c9bf45..8537d5daed 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2758,6 +2758,22 @@ int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
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
index 820c3485a1..76d0efed26 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -268,6 +268,8 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 
 struct PCIPASIDOps {
     int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+    int (*return_page_response)(PCIBus *bus, int32_t devfn,
+                                IOMMUPageResponse *resp);
 };
 typedef struct PCIPASIDOps PCIPASIDOps;
 
@@ -500,6 +502,8 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
 bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
 int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+int pci_device_return_page_response(PCIBus *bus, int32_t devfn,
+                                    IOMMUPageResponse *resp);
 
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
-- 
2.26.2


