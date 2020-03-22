Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108518E8E7
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Mar 2020 13:34:37 +0100 (CET)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFzoK-0005qr-EK
	for lists+qemu-devel@lfdr.de; Sun, 22 Mar 2020 08:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1jFzkk-0000wS-IJ
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 08:30:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1jFzkf-0003ro-5f
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 08:30:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:51464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1jFzkd-0003ok-6w
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 08:30:47 -0400
IronPort-SDR: YyPVi5VP2ob6kN/907DPpUv1rjtrXzKhFD2O8R1HNWm/lUIJPGbbXW18vgQydyJhy75IgeyPug
 EZCvTdAAc53A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2020 05:30:38 -0700
IronPort-SDR: uSfxUwmnjJc1rtK+WmXQLMJcsd8CSy8SPd1SvU5zGoXlsFBUNjtT+ToMX5uo2k7Tmehe46lfs/
 vY8cMjO59o5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,292,1580803200"; d="scan'208";a="239664350"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2020 05:30:37 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: qemu-devel@nongnu.org,
	alex.williamson@redhat.com,
	peterx@redhat.com
Subject: [PATCH v1 00/22] intel_iommu: expose Shared Virtual Addressing to VMs
Date: Sun, 22 Mar 2020 05:35:57 -0700
Message-Id: <1584880579-12178-1-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.93
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, yi.l.liu@intel.com,
 kvm@vger.kernel.org, mst@redhat.com, jun.j.tian@intel.com,
 eric.auger@redhat.com, yi.y.sun@intel.com, pbonzini@redhat.com,
 hao.wu@intel.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shared Virtual Addressing (SVA), a.k.a, Shared Virtual Memory (SVM) on
Intel platforms allows address space sharing between device DMA and
applications. SVA can reduce programming complexity and enhance security.

This QEMU series is intended to expose SVA usage to VMs. i.e. Sharing
guest application address space with passthru devices. This is called
vSVA in this series. The whole vSVA enabling requires QEMU/VFIO/IOMMU
changes.

The high-level architecture for SVA virtualization is as below, the key
design of vSVA support is to utilize the dual-stage IOMMU translation (
also known as IOMMU nesting translation) capability in host IOMMU.

    .-------------.  .---------------------------.
    |   vIOMMU    |  | Guest process CR3, FL only|
    |             |  '---------------------------'
    .----------------/
    | PASID Entry |--- PASID cache flush -
    '-------------'                       |
    |             |                       V
    |             |                CR3 in GPA
    '-------------'
Guest
------| Shadow |--------------------------|--------
      v        v                          v
Host
    .-------------.  .----------------------.
    |   pIOMMU    |  | Bind FL for GVA-GPA  |
    |             |  '----------------------'
    .----------------/  |
    | PASID Entry |     V (Nested xlate)
    '----------------\.------------------------------.
    |             |   |SL for GPA-HPA, default domain|
    |             |   '------------------------------'
    '-------------'
Where:
 - FL = First level/stage one page tables
 - SL = Second level/stage two page tables

The complete vSVA kernel upstream patches are divided into three phases:
    1. Common APIs and PCI device direct assignment
    2. IOMMU-backed Mediated Device assignment
    3. Page Request Services (PRS) support

This QEMU patchset is aiming for the phase 1 and phase 2. It is based
on the two kernel series below.
[1] [PATCH V10 00/11] Nested Shared Virtual Address (SVA) VT-d support:
https://lkml.org/lkml/2020/3/20/1172
[2] [PATCH v1 0/8] vfio: expose virtual Shared Virtual Addressing to VMs
https://lkml.org/lkml/2020/3/22/116

There are roughly two parts:
 1. Introduce HostIOMMUContext as abstract of host IOMMU. It provides explicit
    method for vIOMMU emulators to communicate with host IOMMU. e.g. propagate
    guest page table binding to host IOMMU to setup dual-stage DMA translation
    in host IOMMU and flush iommu iotlb.
 2. Setup dual-stage IOMMU translation for Intel vIOMMU. Includes 
    - Check IOMMU uAPI version compatibility and VFIO Nesting capabilities which
      includes hardware compatibility (stage 1 format) and VFIO_PASID_REQ
      availability. This is preparation for setting up dual-stage DMA translation
      in host IOMMU.
    - Propagate guest PASID allocation and free request to host.
    - Propagate guest page table binding to host to setup dual-stage IOMMU DMA
      translation in host IOMMU.
    - Propagate guest IOMMU cache invalidation to host to ensure iotlb
      correctness.

The complete QEMU set can be found in below link:
https://github.com/luxis1999/qemu.git: sva_vtd_v10_v1

Complete kernel can be found in:
https://github.com/luxis1999/linux-vsva.git: vsva-linux-5.6-rc6

Tests: basci vSVA functionality test, VM reboot/shutdown/crash, kernel build in
guest, boot VM with vSVA disabled, full comapilation.

Regards,
Yi Liu

Changelog:
	- RFC v3.1 -> Patch v1:
	  a) Implement HostIOMMUContext in QOM manner.
	  b) Add pci_set/unset_iommu_context() to register HostIOMMUContext to
	     vIOMMU, thus the lifecircle of HostIOMMUContext is awared in vIOMMU
	     side. In such way, vIOMMU could use the methods provided by the
	     HostIOMMUContext safely.
	  c) Add back patch "[RFC v3 01/25] hw/pci: modify pci_setup_iommu() to set PCIIOMMUOps"
	  RFCv3.1: https://patchwork.kernel.org/cover/11397879/

	- RFC v3 -> v3.1:
	  a) Drop IOMMUContext, and rename DualStageIOMMUObject to HostIOMMUContext.
	     HostIOMMUContext is per-vfio-container, it is exposed to  vIOMMU via PCI
	     layer. VFIO registers a PCIHostIOMMUFunc callback to PCI layer, vIOMMU
	     could get HostIOMMUContext instance via it.
	  b) Check IOMMU uAPI version by VFIO_CHECK_EXTENSION
	  c) Add a check on VFIO_PASID_REQ availability via VFIO_GET_IOMMU_IHNFO
	  d) Reorder the series, put vSVA linux header file update in the beginning
	     put the x-scalable-mode option mofification in the end of the series.
	  e) Dropped patch "[RFC v3 01/25] hw/pci: modify pci_setup_iommu() to set PCIIOMMUOps"
	  RFCv3: https://patchwork.kernel.org/cover/11356033/

	- RFC v2 -> v3:
	  a) Introduce DualStageIOMMUObject to abstract the host IOMMU programming
	  capability. e.g. request PASID from host, setup IOMMU nesting translation
	  on host IOMMU. The pasid_alloc/bind_guest_page_table/iommu_cache_flush
	  operations are moved to be DualStageIOMMUOps. Thus, DualStageIOMMUObject
	  is an abstract layer which provides QEMU vIOMMU emulators with an explicit
	  method to program host IOMMU.
	  b) Compared with RFC v2, the IOMMUContext has also been updated. It is
	  modified to provide an abstract for vIOMMU emulators. It provides the
	  method for pass-through modules (like VFIO) to communicate with host IOMMU.
	  e.g. tell vIOMMU emulators about the IOMMU nesting capability on host side
	  and report the host IOMMU DMA translation faults to vIOMMU emulators.
	  RFC v2: https://www.spinics.net/lists/kvm/msg198556.html

	- RFC v1 -> v2:
	  Introduce IOMMUContext to abstract the connection between VFIO
	  and vIOMMU emulators, which is a replacement of the PCIPASIDOps
	  in RFC v1. Modify x-scalable-mode to be string option instead of
	  adding a new option as RFC v1 did. Refined the pasid cache management
	  and addressed the TODOs mentioned in RFC v1. 
	  RFC v1: https://patchwork.kernel.org/cover/11033657/


Eric Auger (1):
  scripts/update-linux-headers: Import iommu.h

Liu Yi L (21):
  header file update VFIO/IOMMU vSVA APIs
  vfio: check VFIO_TYPE1_NESTING_IOMMU support
  hw/iommu: introduce HostIOMMUContext
  hw/pci: modify pci_setup_iommu() to set PCIIOMMUOps
  hw/pci: introduce pci_device_set/unset_iommu_context()
  intel_iommu: add set/unset_iommu_context callback
  vfio: init HostIOMMUContext per-container
  vfio/common: check PASID alloc/free availability
  intel_iommu: add virtual command capability support
  intel_iommu: process PASID cache invalidation
  intel_iommu: add PASID cache management infrastructure
  vfio: add bind stage-1 page table support
  intel_iommu: bind/unbind guest page table to host
  intel_iommu: replay guest pasid bindings to host
  intel_iommu: replay pasid binds after context cache invalidation
  intel_iommu: do not pass down pasid bind for PASID #0
  vfio: add support for flush iommu stage-1 cache
  intel_iommu: process PASID-based iotlb invalidation
  intel_iommu: propagate PASID-based iotlb invalidation to host
  intel_iommu: process PASID-based Device-TLB invalidation
  intel_iommu: modify x-scalable-mode to be string option

 hw/Makefile.objs                      |    1 +
 hw/alpha/typhoon.c                    |    6 +-
 hw/arm/smmu-common.c                  |    6 +-
 hw/hppa/dino.c                        |    6 +-
 hw/i386/amd_iommu.c                   |    6 +-
 hw/i386/intel_iommu.c                 | 1221 ++++++++++++++++++++++++++++++++-
 hw/i386/intel_iommu_internal.h        |  118 ++++
 hw/i386/trace-events                  |    6 +
 hw/iommu/Makefile.objs                |    1 +
 hw/iommu/host_iommu_context.c         |  178 +++++
 hw/pci-host/designware.c              |    6 +-
 hw/pci-host/pnv_phb3.c                |    6 +-
 hw/pci-host/pnv_phb4.c                |    6 +-
 hw/pci-host/ppce500.c                 |    6 +-
 hw/pci-host/prep.c                    |    6 +-
 hw/pci-host/sabre.c                   |    6 +-
 hw/pci/pci.c                          |   53 +-
 hw/ppc/ppc440_pcix.c                  |    6 +-
 hw/ppc/spapr_pci.c                    |    6 +-
 hw/s390x/s390-pci-bus.c               |    8 +-
 hw/vfio/common.c                      |  257 ++++++-
 hw/vfio/pci.c                         |   13 +
 hw/virtio/virtio-iommu.c              |    6 +-
 include/hw/i386/intel_iommu.h         |   62 +-
 include/hw/iommu/host_iommu_context.h |  116 ++++
 include/hw/pci/pci.h                  |   18 +-
 include/hw/pci/pci_bus.h              |    2 +-
 include/hw/vfio/vfio-common.h         |    4 +
 linux-headers/linux/iommu.h           |  378 ++++++++++
 linux-headers/linux/vfio.h            |  127 ++++
 scripts/update-linux-headers.sh       |    2 +-
 31 files changed, 2599 insertions(+), 44 deletions(-)
 create mode 100644 hw/iommu/Makefile.objs
 create mode 100644 hw/iommu/host_iommu_context.c
 create mode 100644 include/hw/iommu/host_iommu_context.h
 create mode 100644 linux-headers/linux/iommu.h

-- 
2.7.4


