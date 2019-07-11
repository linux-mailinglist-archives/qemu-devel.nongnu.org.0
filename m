Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE3C65E93
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:29:44 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlct4-0004Rh-V1
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcsb-00036n-3V
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcsZ-0001aR-E5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:29:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59508)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcsV-0001VB-IK; Thu, 11 Jul 2019 13:29:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E6E93083392;
 Thu, 11 Jul 2019 17:29:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D62CB5C1B4;
 Thu, 11 Jul 2019 17:28:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:16 +0200
Message-Id: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 11 Jul 2019 17:29:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 00/29] vSMMUv3/pSMMUv3 2 stage VFIO integration
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
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

The series uses a new kernel user API [1] not yet upstream.

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

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0-rc0-2stage-rfcv5

Kernel Dependencies:
[1] [PATCH v9 00/11] SMMUv3 Nested Stage Setup (VFIO part)
[2] [PATCH v9 00/14] SMMUv3 Nested Stage Setup (IOMMU part)
branch at: https://github.com/eauger/linux/tree/v5.3.0-rc0-2stage-v9

Includes fixes sent separately:
[3] [PATCH-for-4.2 v3 0/5] ARM SMMUv3: Fix spurious notification
    errors and assert with vfio: in case of any comment on those
    patches, please comment the other series.

History:

v4 -> v5:
- Use PCIPASIDOps for config update notifications
- removal of notification for MSI binding which is not needed
  anymore
- Uses fixes in [3]
- Use a single fault region
- use the specific interrupt index

v3 -> v4:
- adapt to changes in uapi (asid cache invalidation)
- check VFIO_PCI_DMA_FAULT_IRQ_INDEX is supported at kernel level
  before attempting to set signaling for it.
- sync on 5.2-rc1 kernel headers + Drew's patch that imports sve_context.=
h
- fix MSI binding for MSI (not MSIX)
- fix mingw compilation

v2 -> v3:
- rework fault handling
- MSI binding registration done in vfio-pci. MSI binding tear down called
  on container cleanup path
- leaf parameter propagated

v1 -> v2:
- Fixed dual assignment (asid now correctly propagated on TLB invalidatio=
ns)
- Integrated fault reporting

Andrew Jones (1):
  update-linux-headers: Add sve_context.h to asm-arm64

Eric Auger (27):
  memory: Remove unused memory_region_iommu_replay_all()
  memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  hw/vfio/common: Assert in case of nested mode
  hw/arm/smmuv3: Log a guest error when decoding an invalid STE
  hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations
  update-linux-headers: Import iommu.h
  header update against 5.3.0-rc0 and IOMMU/VFIO nested stage APIs
  memory: Add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory region attribute
  memory: Introduce IOMMU Memory Region inject_faults API
  memory: Add arch_id and leaf fields in IOTLBEntry
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
  vfio: Remove VFIO/SMMUv3 assert

Liu Yi L (1):
  pci: introduce PCIPASIDOps to PCIDevice

 hw/arm/smmuv3-internal.h                     |   1 +
 hw/arm/smmuv3.c                              | 195 +++++--
 hw/arm/trace-events                          |   3 +-
 hw/pci/pci.c                                 |  34 ++
 hw/vfio/common.c                             | 517 +++++++++++++++----
 hw/vfio/pci.c                                | 267 +++++++++-
 hw/vfio/pci.h                                |   9 +
 hw/vfio/trace-events                         |   9 +-
 include/exec/memory.h                        |  59 ++-
 include/hw/arm/smmu-common.h                 |   1 +
 include/hw/iommu/iommu.h                     |  28 +
 include/hw/pci/pci.h                         |  11 +
 include/hw/vfio/vfio-common.h                |  16 +
 include/standard-headers/asm-x86/bootparam.h |   2 +
 include/standard-headers/linux/virtio_ids.h  |   1 -
 include/standard-headers/linux/virtio_pmem.h |  34 --
 linux-headers/asm-arm/unistd-common.h        |   1 +
 linux-headers/asm-arm64/kvm.h                |   7 +
 linux-headers/asm-generic/unistd.h           |   4 +-
 linux-headers/asm-mips/unistd_n32.h          |   1 +
 linux-headers/asm-mips/unistd_n64.h          |   1 +
 linux-headers/asm-mips/unistd_o32.h          |   1 +
 linux-headers/asm-powerpc/unistd_32.h        |   1 +
 linux-headers/asm-powerpc/unistd_64.h        |   1 +
 linux-headers/asm-s390/unistd_32.h           |   1 +
 linux-headers/asm-s390/unistd_64.h           |   1 +
 linux-headers/asm-x86/kvm.h                  |   6 +-
 linux-headers/asm-x86/unistd_32.h            |   1 +
 linux-headers/asm-x86/unistd_64.h            |   1 +
 linux-headers/asm-x86/unistd_x32.h           |   1 +
 linux-headers/linux/iommu.h                  | 316 ++++++++++++
 linux-headers/linux/psp-sev.h                |   5 +-
 linux-headers/linux/vfio.h                   | 109 +++-
 memory.c                                     |  19 +-
 scripts/update-linux-headers.sh              |   5 +-
 35 files changed, 1462 insertions(+), 207 deletions(-)
 create mode 100644 include/hw/iommu/iommu.h
 delete mode 100644 include/standard-headers/linux/virtio_pmem.h
 create mode 100644 linux-headers/linux/iommu.h

--=20
2.20.1


