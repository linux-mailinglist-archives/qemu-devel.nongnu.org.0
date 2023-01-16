Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA766BE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOtd-0002UM-Fy; Mon, 16 Jan 2023 07:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pHOtV-0002Tb-1h
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pHOtS-0006vf-SG
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673873237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0j6m0lw9uRCZXt79MNqgBJMcM1ZOajzzN10h/jSUUtQ=;
 b=Jij7+gwX71c2tpyiS5PqmzHNCWmQUbzjKk7mKaWSQvfPvexrwaYNxCXub2sL6vx8vVHtBq
 6V5J0KMJTs0ruOvaOL6l0tmP4lLGdaWJyx0lKXAmPU9AWdvUDKuiSZP2pgzsRs+29elier
 hN4PdTwgE01MgN+iopfLb8ck9mfsSgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-04lEMhBgOKWKdgQpOIJJKQ-1; Mon, 16 Jan 2023 07:47:14 -0500
X-MC-Unique: 04lEMhBgOKWKdgQpOIJJKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8E112804127;
 Mon, 16 Jan 2023 12:47:13 +0000 (UTC)
Received: from qualcomm-amberwing-rep-06.khw4.lab.eng.bos.redhat.com
 (qualcomm-amberwing-rep-06.khw4.lab.eng.bos.redhat.com [10.19.240.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B30E40C6EC4;
 Mon, 16 Jan 2023 12:47:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 jean-philippe@linaro.org
Cc: peterx@redhat.com, alex.williamson@redhat.com, jasowang@redhat.com,
 mst@redhat.com
Subject: [RFC] virtio-iommu: Take into account possible aliasing in
 virtio_iommu_mr()
Date: Mon, 16 Jan 2023 07:47:09 -0500
Message-Id: <20230116124709.793084-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

When devices are plugged downstream to a pcie to pci bridge,
the virtio-iommu driver stills sends virtio-iommu commands using
the rid without aliasing (ie. devfn != 0). However only an IOMMU
MR matching <bus>:00.0 was registered so virtio_iommu_mr fails
to identify the memory region matching the ep_id. This results
into the probe command failing and the devices beeing not
attached. As a result they are not associated to any iommu group.

Recognize the case where the device is plugged onto a pcie-to-pci
bridge and apply the mask to retrieve the right IOMMU MR.

This trick allows to have the correct iommu group topology on guest
with virtio-pci devices. However this is not sufficient to fix
the iommu group topology issue with basic emulated NIC or VFIO
devices. Even with that patch, once we attempt to plug such
devices downstream to the pcie-to-pci bridge, those devices are
put in a singleton group. The pcie-to-pci bridge disappears from
the radar (not attached to any group), and the pcie root port the
pcie-to-pci bridge is plugged onto is put in a separate singleton
group. So the topology is wrong and definitively different from the
one observed with the intel iommu.

I suspect some other issue in the viot/pci probing on guest kernel
side. I would appreciate on that kernel part.

qemu command excerpt:
for x86_64:

-device ioh3420,bus=pcie.0,chassis=1,id=pcie.1,addr=0x2.0x0
-device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
-netdev tap,id=mynet0,ifname=tap0,script=qemu-ifup,downscript=qemu-ifdown
-device e1000,netdev=mynet0,bus=pcie_pci_bridge1

guest pci topology:

-[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
           +-01.0  Device 1234:1111
           +-02.0-[01-02]----00.0-[02]----00.0  Intel Corporation 82540EM Gigabit Ethernet Controller

wrong guest topology:
/sys/kernel/iommu_groups/2/devices/0000:00:02.0 (pcie root port)
/sys/kernel/iommu_groups/1/devices/0000:02:00.0 (E1000)
no group for 0000:01:00:0 (the pcie-to-pci bridge)

with intel iommu we get the following topology:
/sys/kernel/iommu_groups/2/devices/0000:02:00.0
/sys/kernel/iommu_groups/2/devices/0000:01:00.0
/sys/kernel/iommu_groups/2/devices/0000:00:02.0

on aarch64 we get the same using those devices:
-device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1,addr=0x2.0x0
-device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
-netdev tap,id=mynet0,ifname=tap0,script=qemu-ifup,downscript=qemu-ifdown
-device e1000,netdev=mynet0,bus=pcie_pci_bridge1

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 23c470977e..58c367b744 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -178,6 +178,21 @@ static IOMMUMemoryRegion *virtio_iommu_mr(VirtIOIOMMU *s, uint32_t sid)
         dev = iommu_pci_bus->pbdev[devfn];
         if (dev) {
             return &dev->iommu_mr;
+        } else { /* check possible aliasing */
+            PCIBus *pbus = iommu_pci_bus->bus;
+
+            if (!pci_bus_is_express(pbus)) {
+                PCIDevice *parent = pbus->parent_dev;
+
+                if (pci_is_express(parent) &&
+                    pcie_cap_get_type(parent) == PCI_EXP_TYPE_PCI_BRIDGE) {
+                    devfn = PCI_DEVFN(0, 0);
+                    dev = iommu_pci_bus->pbdev[devfn];
+                    if (dev) {
+                        return &dev->iommu_mr;
+                    }
+                }
+            }
         }
     }
     return NULL;
-- 
2.31.1


