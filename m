Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F36136EC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:52:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFq-0000PN-2U; Mon, 31 Oct 2022 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFh-0000Cq-3u
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFd-0002BF-Ix
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0fByDEiAARLH10xt4Q3RTzfRvZmewSkcQYkkid+bq8c=;
 b=MFemA0nGyGVNBYeUKQTwUERFO3ojErqk/FmWuyl7PH7R32L0NGSsaKtCNPNFKP8kDP83r2
 xU3nugWkQgg1sAh8IGbsfnfTkMsiv9cP0mzKk9elXmQpGFAhGh2jcyZ1ZKRC5uHJiEELpw
 VsrLxnd7zGoJcbcSqCMoJBxslXX9YgE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-9sWx4MS_NM6pIoEtuVzVoA-1; Mon, 31 Oct 2022 08:50:46 -0400
X-MC-Unique: 9sWx4MS_NM6pIoEtuVzVoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 83-20020a1c0256000000b003cf758f1617so197030wmc.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fByDEiAARLH10xt4Q3RTzfRvZmewSkcQYkkid+bq8c=;
 b=BRaAPAVXFlXrtwemEjsj8idwifcpbniYYgZ4kb8nwffqDMNEERz6FuPjY63eZxId40
 VEFX4Lq8OK4FVmjJ/D+b8RQHAvuSRool6RmDiPBFwLNzvKPPuivzxLGRS3kAxENPUMlm
 rGKyLy12QupWKHFGCqMNIyf/gIuZsuJ19UIs+X+BglIw7WMot77WMTuKdnaAzxtemz0i
 koLCQt7cUjKkedTvUwvNs3WIN7BOBbMKxG5Zctf0+jk/czzHBWxuEJbdxOXya5YFF/4y
 0zLbmwdr1eVKfNbdl2QHoGmrSXIQhDnw1U4RrW/CweL72+4wMOwAgKSTPWyiEQhm8I61
 VFEA==
X-Gm-Message-State: ACrzQf2kGjK2t2OpzM8yIMgmHZBLirkMNfwWlMkLxIMnSxI/4/0XQwK0
 x/3L7ONhQFDYb9YX4+2ICJvrhd9nOLWSG+wbfdBevTo7+WhzG1AYXmLsJTSJsYxQxfZwSQl9GXP
 z2ui1Cb/IL1P+Y1RFfmXJW/FlsiUkOwyttm29ECnH0csv2P3U1RbH4FjWq2iz
X-Received: by 2002:a5d:6ac7:0:b0:236:b281:150 with SMTP id
 u7-20020a5d6ac7000000b00236b2810150mr7060181wrw.29.1667220644275; 
 Mon, 31 Oct 2022 05:50:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7sJUI4QormG/Ov2E0BAqh2xbcffKixTo0WAH+YGGsJPFWJ6BqpUPlblp65Tb4IJ0P9fFhxQg==
X-Received: by 2002:a5d:6ac7:0:b0:236:b281:150 with SMTP id
 u7-20020a5d6ac7000000b00236b2810150mr7060157wrw.29.1667220643744; 
 Mon, 31 Oct 2022 05:50:43 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 d2-20020a5d4f82000000b0022b315b4649sm7043269wru.26.2022.10.31.05.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:50:43 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:50:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/86] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


Holiday here tomorrow, so most likely this is it for features for this release.

The following changes since commit 75d30fde55485b965a1168a21d016dd07b50ed32:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-10-30 15:07:25 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 3e624c953b9c37f5aafdf92c16c721818ec8c648:

  intel-iommu: PASID support (2022-10-31 08:46:50 -0400)

----------------------------------------------------------------
pci,pc,virtio: features, tests, fixes, cleanups

lots of acpi rework
first version of biosbits infrastructure
ASID support in vhost-vdpa
core_count2 support in smbios
PCIe DOE emulation
virtio vq reset
HMAT support
part of infrastructure for viommu support in vhost-vdpa
VTD PASID support
fixes, tests all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Akihiko Odaki (1):
      msix: Assert that specified vector is in range

Alex Bennée (1):
      virtio: re-order vm_running and use_started checks

Ani Sinha (7):
      hw/i386/e820: remove legacy reserved entries for e820
      acpi/tests/avocado/bits: initial commit of test scripts that are run by biosbits
      acpi/tests/avocado/bits: disable acpi PSS tests that are failing in biosbits
      acpi/tests/avocado/bits: add biosbits config file for running bios tests
      acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses biosbits
      acpi/tests/avocado/bits/doc: add a doc file to describe the acpi bits test
      MAINTAINERS: add myself as the maintainer for acpi biosbits avocado tests

Bernhard Beschow (3):
      hw/i386/acpi-build: Remove unused struct
      hw/i386/acpi-build: Resolve redundant attribute
      hw/i386/acpi-build: Resolve north rather than south bridges

Brice Goglin (4):
      hmat acpi: Don't require initiator value in -numa
      tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
      tests: acpi: q35: add test for hmat nodes without initiators
      tests: acpi: q35: update expected blobs *.hmat-noinitiators expected HMAT:

Christian A. Ehrhardt (1):
      hw/acpi/erst.c: Fix memory handling issues

Cindy Lu (1):
      vfio: move implement of vfio_get_xlat_addr() to memory.c

David Daney (1):
      virtio-rng-pci: Allow setting nvectors, so we can use MSI-X

Eric Auger (1):
      hw/virtio/virtio-iommu-pci: Enforce the device is plugged on the root bus

Gregory Price (1):
      hw/i386/pc.c: CXL Fixed Memory Window should not reserve e820 in bios

Hesham Almatary (3):
      tests: Add HMAT AArch64/virt empty table files
      tests: acpi: aarch64/virt: add a test for hmat nodes with no initiators
      tests: virt: Update expected *.acpihmatvirt tables

Huai-Cheng Kuo (3):
      hw/pci: PCIe Data Object Exchange emulation
      hw/cxl/cdat: CXL CDAT Data Object Exchange implementation
      hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange

Igor Mammedov (11):
      acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device descriptors
      tests: acpi: whitelist DSDT before generating PCI-ISA bridge AML automatically
      acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines and let bus ennumeration generate AML
      tests: acpi: update expected DSDT after ISA bridge is moved directly under PCI host bridge
      tests: acpi: whitelist DSDT before generating ICH9_SMB AML automatically
      acpi: add get_dev_aml_func() helper
      acpi: enumerate SMB bridge automatically along with other PCI devices
      tests: acpi: update expected blobs
      tests: acpi: pc/q35 whitelist DSDT before \_GPE cleanup
      acpi: pc/35: sanitize _GPE declaration order
      tests: acpi: update expected blobs

Jason Wang (4):
      intel-iommu: don't warn guest errors when getting rid2pasid entry
      intel-iommu: drop VTDBus
      intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a function
      intel-iommu: PASID support

Jonathan Cameron (2):
      hw/mem/cxl-type3: Add MSIX support
      hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE

Julia Suvorova (5):
      hw/smbios: add core_count2 to smbios table type 4
      bios-tables-test: teach test to use smbios 3.0 tables
      tests/acpi: allow changes for core_count2 test
      bios-tables-test: add test for number of cores > 255
      tests/acpi: update tables for new core count test

Kangjie Xu (10):
      virtio: introduce virtio_queue_enable()
      virtio: core: vq reset feature negotation support
      virtio-pci: support queue enable
      vhost: expose vhost_virtqueue_start()
      vhost: expose vhost_virtqueue_stop()
      vhost-net: vhost-kernel: introduce vhost_net_virtqueue_reset()
      vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
      virtio-net: introduce flush_or_purge_queued_packets()
      virtio-net: support queue_enable
      vhost: vhost-kernel: enable vq reset feature

Lei He (4):
      virtio-crypto: Support asynchronous mode
      crypto: Support DER encodings
      crypto: Support export akcipher to pkcs8
      cryptodev: Add a lkcf-backend for cryptodev

Lev Kujawski (2):
      qpci_device_enable: Allow for command bits hardwired to 0
      hw/ide/piix: Ignore writes of hardwired PCI command register bits

Markus Armbruster (1):
      MAINTAINERS: Add qapi/virtio.json to section "virtio"

Michael S. Tsirkin (1):
      bios-tables-test: do not ignore allowed diff list

Miguel Luis (4):
      tests/acpi: virt: allow acpi MADT and FADT changes
      acpi: fadt: support revision 6.0 of the ACPI specification
      acpi: arm/virt: madt: bump to revision 4 accordingly to ACPI 6.0 Errata A
      tests/acpi: virt: update ACPI MADT and FADT binaries

Robert Hoo (5):
      tests/acpi: allow SSDT changes
      acpi/ssdt: Fix aml_or() and aml_and() in if clause
      acpi/nvdimm: define macro for NVDIMM Device _DSM
      acpi/nvdimm: Implement ACPI NVDIMM Label Methods
      test/acpi/bios-tables-test: SSDT: update golden master binaries

Thomas Huth (1):
      tests/qtest/cxl-test: Remove temporary directories after testing

Xiang Chen (1):
      hw/arm/virt: Enable HMAT on arm virt machine

Xuan Zhuo (5):
      virtio: introduce __virtio_queue_reset()
      virtio: introduce virtio_queue_reset()
      virtio-pci: support queue reset
      virtio-net: support queue reset
      virtio-net: enable vq reset feature

Yajun Wu (3):
      vhost: Change the sequence of device start
      vhost-user: Support vhost_dev_start
      vhost-user: Fix out of order vring host notification handling

 tests/avocado/acpi-bits/bits-config/bits-cfg.txt |   18 +
 qapi/qom.json                                    |    2 +
 crypto/der.h                                     |  211 +-
 crypto/rsakey.h                                  |   11 +-
 hw/display/vga_int.h                             |    2 +
 hw/i386/e820_memory_layout.h                     |    8 -
 hw/i386/fw_cfg.h                                 |    1 -
 hw/i386/intel_iommu_internal.h                   |   16 +-
 hw/smbios/smbios_build.h                         |    9 +-
 include/crypto/akcipher.h                        |   21 +
 include/exec/memory.h                            |    4 +
 include/hw/acpi/acpi_aml_interface.h             |   13 +-
 include/hw/cxl/cxl_cdat.h                        |  166 ++
 include/hw/cxl/cxl_component.h                   |    7 +
 include/hw/cxl/cxl_device.h                      |    3 +
 include/hw/cxl/cxl_pci.h                         |    1 +
 include/hw/firmware/smbios.h                     |   12 +
 include/hw/i386/intel_iommu.h                    |   18 +-
 include/hw/ide/pci.h                             |    1 +
 include/hw/pci/msix.h                            |    4 +-
 include/hw/pci/pci_bus.h                         |    2 +
 include/hw/pci/pci_ids.h                         |    3 +
 include/hw/pci/pcie.h                            |    1 +
 include/hw/pci/pcie_doe.h                        |  123 ++
 include/hw/pci/pcie_regs.h                       |    4 +
 include/hw/virtio/vhost.h                        |    5 +
 include/hw/virtio/virtio-pci.h                   |    5 +
 include/hw/virtio/virtio.h                       |   16 +-
 include/net/vhost_net.h                          |    4 +
 include/sysemu/cryptodev.h                       |   61 +-
 tests/qtest/libqos/pci.h                         |    1 +
 backends/cryptodev-builtin.c                     |   69 +-
 backends/cryptodev-lkcf.c                        |  645 ++++++
 backends/cryptodev-vhost-user.c                  |   53 +-
 backends/cryptodev.c                             |   44 +-
 crypto/akcipher.c                                |   18 +
 crypto/der.c                                     |  313 ++-
 crypto/rsakey.c                                  |   42 +
 hw/acpi/aml-build.c                              |   13 +-
 hw/acpi/erst.c                                   |    6 +-
 hw/acpi/nvdimm.c                                 |  106 +-
 hw/arm/virt-acpi-build.c                         |   33 +-
 hw/block/vhost-user-blk.c                        |   18 +-
 hw/core/machine.c                                |   10 +-
 hw/cxl/cxl-cdat.c                                |  224 ++
 hw/display/acpi-vga-stub.c                       |    7 +
 hw/display/acpi-vga.c                            |   26 +
 hw/display/vga-pci.c                             |    4 +
 hw/i386/acpi-build.c                             |  203 +-
 hw/i386/e820_memory_layout.c                     |   20 +-
 hw/i386/fw_cfg.c                                 |    3 -
 hw/i386/intel_iommu.c                            |  692 +++---
 hw/i386/microvm.c                                |    2 -
 hw/i386/pc.c                                     |    2 -
 hw/ide/piix.c                                    |   24 +
 hw/isa/lpc_ich9.c                                |   23 +
 hw/isa/piix3.c                                   |   17 +-
 hw/mem/cxl_type3.c                               |  264 +++
 hw/net/e1000e.c                                  |   15 +-
 hw/net/rocker/rocker.c                           |   23 +-
 hw/net/vhost_net-stub.c                          |   12 +
 hw/net/vhost_net.c                               |   91 +-
 hw/net/virtio-net.c                              |   57 +-
 hw/net/vmxnet3.c                                 |   27 +-
 hw/nvme/ctrl.c                                   |    5 +-
 hw/pci-bridge/cxl_upstream.c                     |  195 +-
 hw/pci/msix.c                                    |   24 +-
 hw/pci/pcie_doe.c                                |  367 ++++
 hw/rdma/vmw/pvrdma_main.c                        |    7 +-
 hw/remote/vfio-user-obj.c                        |    9 +-
 hw/smbios/smbios.c                               |   19 +-
 hw/vfio/common.c                                 |   66 +-
 hw/virtio/vhost-user.c                           |   79 +-
 hw/virtio/vhost.c                                |   16 +-
 hw/virtio/virtio-crypto.c                        |  326 +--
 hw/virtio/virtio-iommu-pci.c                     |   12 +-
 hw/virtio/virtio-pci.c                           |   83 +-
 hw/virtio/virtio-rng-pci.c                       |   14 +
 hw/virtio/virtio.c                               |   62 +-
 softmmu/memory.c                                 |   72 +
 tests/qtest/bios-tables-test.c                   |  269 ++-
 tests/qtest/cxl-test.c                           |    3 +
 tests/qtest/ide-test.c                           |    1 +
 tests/qtest/libqos/pci.c                         |   13 +-
 tests/unit/test-crypto-der.c                     |  126 +-
 MAINTAINERS                                      |   15 +
 backends/meson.build                             |    3 +
 docs/devel/acpi-bits.rst                         |  145 ++
 docs/devel/index-build.rst                       |    1 +
 hw/arm/Kconfig                                   |    1 +
 hw/cxl/meson.build                               |    1 +
 hw/display/meson.build                           |   17 +
 hw/i386/trace-events                             |    2 +
 hw/pci/meson.build                               |    1 +
 tests/avocado/acpi-bits.py                       |  396 ++++
 tests/avocado/acpi-bits/bits-tests/smbios.py2    | 2430 ++++++++++++++++++++++
 tests/avocado/acpi-bits/bits-tests/testacpi.py2  |  283 +++
 tests/avocado/acpi-bits/bits-tests/testcpuid.py2 |   83 +
 tests/data/acpi/pc/DSDT                          |  Bin 6422 -> 6501 bytes
 tests/data/acpi/pc/DSDT.acpierst                 |  Bin 6382 -> 6461 bytes
 tests/data/acpi/pc/DSDT.acpihmat                 |  Bin 7747 -> 7826 bytes
 tests/data/acpi/pc/DSDT.bridge                   |  Bin 9496 -> 9575 bytes
 tests/data/acpi/pc/DSDT.cphp                     |  Bin 6886 -> 6965 bytes
 tests/data/acpi/pc/DSDT.dimmpxm                  |  Bin 8076 -> 8155 bytes
 tests/data/acpi/pc/DSDT.hpbridge                 |  Bin 6382 -> 6461 bytes
 tests/data/acpi/pc/DSDT.hpbrroot                 |  Bin 3069 -> 3107 bytes
 tests/data/acpi/pc/DSDT.ipmikcs                  |  Bin 6494 -> 6573 bytes
 tests/data/acpi/pc/DSDT.memhp                    |  Bin 7781 -> 7860 bytes
 tests/data/acpi/pc/DSDT.nohpet                   |  Bin 6280 -> 6359 bytes
 tests/data/acpi/pc/DSDT.numamem                  |  Bin 6428 -> 6507 bytes
 tests/data/acpi/pc/DSDT.roothp                   |  Bin 6656 -> 6699 bytes
 tests/data/acpi/pc/SSDT.dimmpxm                  |  Bin 734 -> 1815 bytes
 tests/data/acpi/q35/APIC.acpihmat-noinitiator    |  Bin 0 -> 144 bytes
 tests/data/acpi/q35/APIC.core-count2             |  Bin 0 -> 2478 bytes
 tests/data/acpi/q35/DSDT                         |  Bin 8320 -> 8412 bytes
 tests/data/acpi/q35/DSDT.acpierst                |  Bin 8337 -> 8429 bytes
 tests/data/acpi/q35/DSDT.acpihmat                |  Bin 9645 -> 9737 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator    |  Bin 0 -> 8553 bytes
 tests/data/acpi/q35/DSDT.applesmc                |  Bin 8366 -> 8458 bytes
 tests/data/acpi/q35/DSDT.bridge                  |  Bin 11449 -> 11541 bytes
 tests/data/acpi/q35/DSDT.core-count2             |  Bin 0 -> 32414 bytes
 tests/data/acpi/q35/DSDT.cphp                    |  Bin 8784 -> 8876 bytes
 tests/data/acpi/q35/DSDT.cxl                     |  Bin 9646 -> 9738 bytes
 tests/data/acpi/q35/DSDT.dimmpxm                 |  Bin 9974 -> 10066 bytes
 tests/data/acpi/q35/DSDT.ipmibt                  |  Bin 8395 -> 8487 bytes
 tests/data/acpi/q35/DSDT.ipmismbus               |  Bin 8409 -> 8500 bytes
 tests/data/acpi/q35/DSDT.ivrs                    |  Bin 8337 -> 8429 bytes
 tests/data/acpi/q35/DSDT.memhp                   |  Bin 9679 -> 9771 bytes
 tests/data/acpi/q35/DSDT.mmio64                  |  Bin 9450 -> 9542 bytes
 tests/data/acpi/q35/DSDT.multi-bridge            |  Bin 8640 -> 8732 bytes
 tests/data/acpi/q35/DSDT.nohpet                  |  Bin 8178 -> 8270 bytes
 tests/data/acpi/q35/DSDT.numamem                 |  Bin 8326 -> 8418 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa             |  Bin 8421 -> 8513 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12               |  Bin 8926 -> 9018 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2                |  Bin 8952 -> 9044 bytes
 tests/data/acpi/q35/DSDT.viot                    |  Bin 9429 -> 9521 bytes
 tests/data/acpi/q35/DSDT.xapic                   |  Bin 35683 -> 35775 bytes
 tests/data/acpi/q35/FACP.core-count2             |  Bin 0 -> 244 bytes
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator    |  Bin 0 -> 288 bytes
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator    |  Bin 0 -> 312 bytes
 tests/data/acpi/q35/SSDT.dimmpxm                 |  Bin 734 -> 1815 bytes
 tests/data/acpi/virt/APIC                        |  Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.acpihmatvirt           |  Bin 0 -> 396 bytes
 tests/data/acpi/virt/APIC.memhp                  |  Bin 168 -> 172 bytes
 tests/data/acpi/virt/APIC.numamem                |  Bin 168 -> 172 bytes
 tests/data/acpi/virt/DSDT.acpihmatvirt           |  Bin 0 -> 5282 bytes
 tests/data/acpi/virt/FACP                        |  Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.memhp                  |  Bin 268 -> 276 bytes
 tests/data/acpi/virt/FACP.numamem                |  Bin 268 -> 276 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt           |  Bin 0 -> 288 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt           |  Bin 0 -> 196 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt           |  Bin 0 -> 240 bytes
 tests/data/acpi/virt/SSDT.memhp                  |  Bin 736 -> 1817 bytes
 153 files changed, 7991 insertions(+), 1014 deletions(-)
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/pci/pcie_doe.h
 create mode 100644 backends/cryptodev-lkcf.c
 create mode 100644 hw/cxl/cxl-cdat.c
 create mode 100644 hw/display/acpi-vga-stub.c
 create mode 100644 hw/display/acpi-vga.c
 create mode 100644 hw/pci/pcie_doe.c
 create mode 100644 docs/devel/acpi-bits.rst
 create mode 100644 tests/avocado/acpi-bits.py
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/APIC.core-count2
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.core-count2
 create mode 100644 tests/data/acpi/q35/FACP.core-count2
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt


