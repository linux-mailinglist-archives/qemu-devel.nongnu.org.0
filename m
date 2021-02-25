Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4517324EA2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:57:31 +0100 (CET)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEKn-0001uN-EH
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEGY-0005Ou-2w
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEGU-0004oQ-Hh
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xEmRL2ORCls19l7hOAWKufFjqO6JvE1sMAIupx8A9Sk=;
 b=CpJyc9IM2L2+xfieuoY0KFkOtjpgOWnBo85AcoWs1JT+mXZ8DpOwAfCCjvBBuHD9IVb5GR
 psn6RwU+cv/dUhrcRApQyfKfhXjOiMdRn4P6GgBTeqY6iQsrstZtlfFAn8D902uJmnOWLt
 aTfUNsZheBvEzK/X2Fhk84Q680o1Fls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-n3AC3OdqNty150KvANFTZg-1; Thu, 25 Feb 2021 05:52:59 -0500
X-MC-Unique: n3AC3OdqNty150KvANFTZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54943107ACC7;
 Thu, 25 Feb 2021 10:52:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1885D9D7;
 Thu, 25 Feb 2021 10:52:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 00/28] vSMMUv3/pSMMUv3 2 stage VFIO integration
Date: Thu, 25 Feb 2021 11:52:05 +0100
Message-Id: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Up to now vSMMUv3 has not been integrated with VFIO. VFIO
integration requires to program the physical IOMMU consistently
with the guest mappings. However, as opposed to VTD, SMMUv3 has
no "Caching Mode" which allows easy trapping of guest mappings.
This means the vSMMUV3 cannot use the same VFIO integration as VTD.

However SMMUv3 has 2 translation stages. This was devised with
virtualization use case in mind where stage 1 is "owned" by the
guest whereas the host uses stage 2 for VM isolation.

This series sets up this nested translation stage. It only works
if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
other words, it does not work if there is a physical SMMUv2).

- We force the host to use stage 2 instead of stage 1, when we
  detect a vSMMUV3 is behind a VFIO device. For a VFIO device
  without any virtual IOMMU, we still use stage 1 as many existing
  SMMUs expect this behavior.
- We use PCIPASIDOps to propage guest stage1 config changes on
  STE (Stream Table Entry) changes.
- We implement a specific UNMAP notifier that conveys guest
  IOTLB invalidations to the host
- We register MSI IOVA/GPA bindings to the host so that this latter
  can build a nested stage translation
- As the legacy MAP notifier is not called anymore, we must make
  sure stage 2 mappings are set. This is achieved through another
  prereg memory listener.
- Physical SMMU stage 1 related faults are reported to the guest
  via en eventfd mechanism and exposed trhough a dedicated VFIO-PCI
  region. Then they are reinjected into the guest.

Best Regards

Eric

This series applies on top of
[PATCH v2 0/7] Some vIOMMU fixes and
PATCH 0/2] Additional vIOMMU fixes related to UNMAP notifiers

All the patches can be found at:
v8: https://github.com/eauger/qemu/tree/v5.2.0-2stage-rfcv8

Previous version:
v7: https://github.com/eauger/qemu/tree/v5.2.0-rc1-2stage-rfcv7

Kernel Dependencies:
[1] [PATCH v14 00/14] SMMUv3 Nested Stage Setup (IOMMU part)
[2] [PATCH v12 00/13] SMMUv3 Nested Stage Setup (VFIO part)
branch containing both:
https://github.com/eauger/linux/tree/v5.11-stallv12-2stage-v14

History:
v7 -> v8:
- adapt to changes to the kernel uapi
- Fix unregistration of MSI bindings
- applies on top of range invalidation fixes
- changes in IOTLBEntry (flags)
- addressed all the comments from reviewers/testers I hope.
  Many thanks to all of you! see individual logs

v6 -> v7:
- rebase on v5.2.0-rc1
- added:
  "pci: Add return_page_response pci ops" and
  "vfio/pci: Implement return_page_response page response callback"
  for vSVA integration (not used in this series).

v5 -> v6:
- just rebase work

v4 -> v5:
- Use PCIPASIDOps for config update notifications
- removal of notification for MSI binding which is not needed
  anymore
- Use a single fault region
- use the specific interrupt index

v3 -> v4:
- adapt to changes in uapi (asid cache invalidation)
- check VFIO_PCI_DMA_FAULT_IRQ_INDEX is supported at kernel level
  before attempting to set signaling for it.
- sync on 5.2-rc1 kernel headers + Drew's patch that imports sve_context.h
- fix MSI binding for MSI (not MSIX)
- fix mingw compilation

v2 -> v3:
- rework fault handling
- MSI binding registration done in vfio-pci. MSI binding tear down called
  on container cleanup path
- leaf parameter propagated

v1 -> v2:
- Fixed dual assignment (asid now correctly propagated on TLB invalidations)
- Integrated fault reporting


Eric Auger (27):
  hw/vfio/common: trace vfio_connect_container operations
  update-linux-headers: Import iommu.h
  header update against 5.11-rc2 and IOMMU/VFIO nested stage APIs
  memory: Add new fields in IOTLBEntry
  hw/arm/smmuv3: Properly propagate S1 asid invalidation
  memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  memory: Add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory region attribute
  memory: Introduce IOMMU Memory Region inject_faults API
  iommu: Introduce generic header
  vfio: Force nested if iommu requires it
  vfio: Introduce hostwin_from_range helper
  vfio: Introduce helpers to DMA map/unmap a RAM section
  vfio: Set up nested stage mappings
  vfio: Pass stage 1 MSI bindings to the host
  vfio: Helper to get IRQ info including capabilities
  vfio/pci: Register handler for iommu fault
  vfio/pci: Set up the DMA FAULT region
  vfio/pci: Implement the DMA fault handler
  hw/arm/smmuv3: Advertise MSI_TRANSLATE attribute
  hw/arm/smmuv3: Store the PASID table GPA in the translation config
  hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA invalidation
  hw/arm/smmuv3: Fill the IOTLBEntry leaf field on NH_VA invalidation
  hw/arm/smmuv3: Pass stage 1 configurations to the host
  hw/arm/smmuv3: Implement fault injection
  hw/arm/smmuv3: Allow MAP notifiers
  pci: Add return_page_response pci ops
  vfio/pci: Implement return_page_response page response callback

Liu Yi L (1):
  pci: introduce PCIPASIDOps to PCIDevice

 hw/arm/smmu-common.c                          |   2 +-
 hw/arm/smmu-internal.h                        |   1 +
 hw/arm/smmuv3.c                               | 222 ++++++-
 hw/arm/trace-events                           |   2 +
 hw/i386/intel_iommu.c                         |   6 +-
 hw/pci/pci.c                                  |  50 ++
 hw/ppc/spapr_iommu.c                          |   2 +-
 hw/vfio/common.c                              | 565 ++++++++++++++----
 hw/vfio/pci.c                                 | 415 ++++++++++++-
 hw/vfio/pci.h                                 |  11 +
 hw/vfio/trace-events                          |  11 +-
 hw/virtio/virtio-iommu.c                      |   4 +-
 include/exec/memory.h                         |  64 +-
 include/hw/arm/smmu-common.h                  |   1 +
 include/hw/iommu/iommu.h                      |  36 ++
 include/hw/pci/pci.h                          |  15 +
 include/hw/vfio/vfio-common.h                 |  19 +
 .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
 linux-headers/linux/iommu.h                   | 395 ++++++++++++
 linux-headers/linux/vfio.h                    | 141 ++++-
 scripts/update-linux-headers.sh               |   2 +-
 softmmu/memory.c                              |  10 +
 22 files changed, 1828 insertions(+), 160 deletions(-)
 create mode 100644 include/hw/iommu/iommu.h
 create mode 100644 linux-headers/linux/iommu.h

-- 
2.26.2


