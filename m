Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1701324F13
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:24:41 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEl6-00080c-Mw
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIS-0007tC-OO
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIO-0005UM-Bh
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GhVkhZKLaTLbAq+0TaQvBVHGyMULsiCQCuN2TmjgO0=;
 b=TfxzXj+WhCecB17EnyInOIpC3VYfFU9bgsHXQ63d96fPXMJCL6C5iJiJVPp5ubCh/d3P0O
 lv76gy/tlq0WhQ74p9GOL96mCR7qMMVWNgYDBhIFul77Yq7KTEy6/quyT3QJdlprIFH5v8
 FpdAIDZK6rL70E2mcSB5HZ63uV+Ifac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-C5csXKOpMtyiAqzHiFxobQ-1; Thu, 25 Feb 2021 05:54:57 -0500
X-MC-Unique: C5csXKOpMtyiAqzHiFxobQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B09A107ACC7;
 Thu, 25 Feb 2021 10:54:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EA15D9D7;
 Thu, 25 Feb 2021 10:54:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 10/28] pci: introduce PCIPASIDOps to PCIDevice
Date: Thu, 25 Feb 2021 11:52:15 +0100
Message-Id: <20210225105233.650545-11-eric.auger@redhat.com>
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Yi L <yi.l.liu@intel.com>

This patch introduces PCIPASIDOps for IOMMU related operations.

https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00078.html
https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00940.html

So far, to setup virt-SVA for assigned SVA capable device, needs to
configure host translation structures for specific pasid. (e.g. bind
guest page table to host and enable nested translation in host).
Besides, vIOMMU emulator needs to forward guest's cache invalidation
to host since host nested translation is enabled. e.g. on VT-d, guest
owns 1st level translation table, thus cache invalidation for 1st
level should be propagated to host.

This patch adds two functions: alloc_pasid and free_pasid to support
guest pasid allocation and free. The implementations of the callbacks
would be device passthru modules. Like vfio.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 hw/pci/pci.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h | 11 +++++++++++
 2 files changed, 45 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9ebef8a35..8f79c9bf45 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2724,6 +2724,40 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque)
     bus->iommu_opaque = opaque;
 }
 
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops)
+{
+    assert(ops && !dev->pasid_ops);
+    dev->pasid_ops = ops;
+}
+
+bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return false;
+    }
+
+    dev = bus->devices[devfn];
+    return !!(dev && dev->pasid_ops);
+}
+
+int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
+                               IOMMUConfig *config)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return -EINVAL;
+    }
+
+    dev = bus->devices[devfn];
+    if (dev && dev->pasid_ops && dev->pasid_ops->set_pasid_table) {
+        return dev->pasid_ops->set_pasid_table(bus, devfn, config);
+    }
+    return -ENOENT;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1bc231480f..820c3485a1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -9,6 +9,7 @@
 
 #include "hw/pci/pcie.h"
 #include "qom/object.h"
+#include "hw/iommu/iommu.h"
 
 extern bool pci_available;
 
@@ -265,6 +266,11 @@ struct PCIReqIDCache {
 };
 typedef struct PCIReqIDCache PCIReqIDCache;
 
+struct PCIPASIDOps {
+    int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+};
+typedef struct PCIPASIDOps PCIPASIDOps;
+
 struct PCIDevice {
     DeviceState qdev;
     bool partially_hotplugged;
@@ -359,6 +365,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    PCIPASIDOps *pasid_ops;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -490,6 +497,10 @@ typedef AddressSpace *(*PCIIOMMUFunc)(PCIBus *, void *, int);
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
 void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
 
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
+bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
+int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *config);
+
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
 {
-- 
2.26.2


