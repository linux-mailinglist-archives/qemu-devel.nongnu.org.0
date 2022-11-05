Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D8E61DC50
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMlH-0005nt-IT; Sat, 05 Nov 2022 13:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlF-0005nc-Ez
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlC-0007Eg-Lo
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nTiwnif2HGZmHX6ZYE25JWo3YyKGwVZgE08lXU7TwHs=;
 b=cKv2NqwY1ntA9mzeFTEYl//ZtBQkJn8Z5J1sIikpmD1v6qs3LijNQrz32/451EuWzCbu2U
 0lV05yJEPRFMCoPhnKjG/t3VqBu8cEZh9YhF/ojHrgQeJkyNTUOIoTnQujjsmUiGemWoWg
 mA5LzbEZrXh4FUDVDoRuknTL+8kNZng=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-3KzZgCGKP1KeVCEBAhh7Yg-1; Sat, 05 Nov 2022 13:15:07 -0400
X-MC-Unique: 3KzZgCGKP1KeVCEBAhh7Yg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so2454012wmh.6
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nTiwnif2HGZmHX6ZYE25JWo3YyKGwVZgE08lXU7TwHs=;
 b=w1vxqRYhlVIZKGh8RTCelLLMHghlTNzxOvEcFJFnnIjbtNvk7tlzrsis6vx+UVUty9
 jgX1/TBKqMxWbx1KCkXzvPTqejOF1dRvOkSIJYOqFZh7xD/OCYLz9aynZEc5EYOiF6zG
 tjGARvKenTNAbVlWE/wi/hgSJ4m6IjBxVpHbgMIN29hg2KqFI9QR7vMYeSHBYs/ttvoV
 KbevXIl1quydCzm1c21Tc7FuKl37VFwbmYsKTepgoO5Xev35oGARccMDiqBTfSX3xti/
 Or6+d7orUsMiT9vh+XuN0JQIxcAnwHp+Q9/NfIWQPf6KG7naNLbZrUzRjYhtp4y8H30A
 6y/Q==
X-Gm-Message-State: ACrzQf36ro1PLMMiPWTN9YT/3SGk/PRrT4ZQpUbRdR+YRwJGY/+hU2Aw
 HeNFNP1QMh0WT8uVhDHgz9YndVlWqityefhzwcD37t2idAvuaVpezUbrVv0FyRS4oFhQzFK0gbn
 Dwbd6qGbJeAZwJk8tXNyvHK1Ei+RNZQAhi/KoVnN2iuNbDi90yJ5WBKIEeg+e
X-Received: by 2002:adf:f58e:0:b0:236:a8b2:373 with SMTP id
 f14-20020adff58e000000b00236a8b20373mr26635529wro.575.1667668505964; 
 Sat, 05 Nov 2022 10:15:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55qkPde0bd4/M+I230yE4oRUJ/Qz4gOV64Z8ByxK21WWxmmhK5GteEspJE6USImvgrMcMFCQ==
X-Received: by 2002:adf:f58e:0:b0:236:a8b2:373 with SMTP id
 f14-20020adff58e000000b00236a8b20373mr26635513wro.575.1667668505609; 
 Sat, 05 Nov 2022 10:15:05 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003b47b80cec3sm6886620wmq.42.2022.11.05.10.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:15:04 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 00/81] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Changes from v2:
    Fixed a bug in error handling in vhost: Change the sequence of device start.
        Contributor placed on watchlist ;)
    Dropped virtio: re-order vm_running and use_started checks
        Due to failures detected by gitlab.
        We'll have to fix it differently.
    Updated expected files for core-count test to fix bisect.

Changes from v1
    Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
    bugs that tripped up the pipeline.
    Updated expected files for core-count test.


The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25aaf1:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-11-01 13:49:33 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 228935616cad6225550f4a6b614f7c4f083db509:

  vhost-user: Support vhost_dev_start (2022-11-05 09:33:43 -0400)

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

Markus Armbruster (1):
      MAINTAINERS: Add qapi/virtio.json to section "virtio"

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

Xiang Chen (1):
      hw/arm/virt: Enable HMAT on arm virt machine

Xuan Zhuo (5):
      virtio: introduce __virtio_queue_reset()
      virtio: introduce virtio_queue_reset()
      virtio-pci: support queue reset
      virtio-net: support queue reset
      virtio-net: enable vq reset feature

Yajun Wu (3):
      vhost-user: Fix out of order vring host notification handling
      vhost: Change the sequence of device start
      vhost-user: Support vhost_dev_start

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
 include/hw/pci/msix.h                            |    4 +-
 include/hw/pci/pci_bus.h                         |    2 +
 include/hw/pci/pci_ids.h                         |    3 +
 include/hw/pci/pcie.h                            |    1 +
 include/hw/pci/pcie_doe.h                        |  123 ++
 include/hw/pci/pcie_regs.h                       |    4 +
 include/hw/virtio/vhost.h                        |    5 +
 include/hw/virtio/virtio-pci.h                   |    5 +
 include/hw/virtio/virtio.h                       |    8 +-
 include/net/vhost_net.h                          |    4 +
 include/sysemu/cryptodev.h                       |   61 +-
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
 hw/core/machine.c                                |    8 +-
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
 hw/isa/lpc_ich9.c                                |   23 +
 hw/isa/piix3.c                                   |   17 +-
 hw/mem/cxl_type3.c                               |  264 +++
 hw/net/e1000e.c                                  |   15 +-
 hw/net/rocker/rocker.c                           |   23 +-
 hw/net/vhost_net-stub.c                          |   12 +
 hw/net/vhost_net.c                               |   90 +-
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
 hw/virtio/virtio-crypto.c                        |  339 +--
 hw/virtio/virtio-iommu-pci.c                     |   12 +-
 hw/virtio/virtio-pci.c                           |   83 +-
 hw/virtio/virtio-rng-pci.c                       |   14 +
 hw/virtio/virtio.c                               |   62 +-
 softmmu/memory.c                                 |   72 +
 tests/qtest/bios-tables-test.c                   |  267 ++-
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
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator    |  Bin 0 -> 8691 bytes
 tests/data/acpi/q35/DSDT.applesmc                |  Bin 8366 -> 8458 bytes
 tests/data/acpi/q35/DSDT.bridge                  |  Bin 11449 -> 11541 bytes
 tests/data/acpi/q35/DSDT.core-count2             |  Bin 0 -> 32460 bytes
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
 tests/data/acpi/virt/APIC.acpihmatvirt           |  Bin 0 -> 412 bytes
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
 147 files changed, 7955 insertions(+), 1007 deletions(-)
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


