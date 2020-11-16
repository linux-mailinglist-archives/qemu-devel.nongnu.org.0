Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4132B501A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:46:58 +0100 (CET)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejWj-0007bF-DS
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej57-0003KY-Ha
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej54-0001zq-Ty
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QpOIYttPxbGIA5beO0UdB75SsqpjHSTCiO3Pg45xKgg=;
 b=JrPVXBn71/qbnxvRkSlyOoBu8qwUDQt3fC3sGZIGnQrRk0gpNlpEbE09qWKL9JKdx3qSTQ
 UU+jehqqgeYV6pKf4O8MrrZ9ijcpHfO2B7jbA7SNltKjSfWiyvPzT7mMrP0YnwQiMst243
 jqvhuFSuvb2iDygPXFjtb7CLqXuFRyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-_7vOU8qPOvSxHqmY10Q4Xg-1; Mon, 16 Nov 2020 13:18:20 -0500
X-MC-Unique: _7vOU8qPOvSxHqmY10Q4Xg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3D7B64144;
 Mon, 16 Nov 2020 18:18:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B6BD5C1CF;
 Mon, 16 Nov 2020 18:18:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 25/26] pci: Add return_page_response pci ops
Date: Mon, 16 Nov 2020 19:13:48 +0100
Message-Id: <20201116181349.11908-26-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
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
index 833b330ee1..c4baadf77e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -267,6 +267,8 @@ typedef struct PCIReqIDCache PCIReqIDCache;
 
 struct PCIPASIDOps {
     int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+    int (*return_page_response)(PCIBus *bus, int32_t devfn,
+                                IOMMUPageResponse *resp);
 };
 typedef struct PCIPASIDOps PCIPASIDOps;
 
@@ -498,6 +500,8 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
 bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
 int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+int pci_device_return_page_response(PCIBus *bus, int32_t devfn,
+                                    IOMMUPageResponse *resp);
 
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4e21feb758..5dd207bc22 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2759,6 +2759,22 @@ int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
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
2.21.3


