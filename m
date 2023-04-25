Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44736EDCF6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:45:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDM4-00062T-Vd; Tue, 25 Apr 2023 03:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDM3-00061u-Nt
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:44:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDM1-0006Ol-9e
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pmX5kxAQSbcLMByrNwTFGWFbaR7cA+dAexIzcdmcLAI=;
 b=KTW40WPacgxFqhhVMnla6vQoH2b4MLpa8cqWbTMG4NIgAJEdaqxdYtxuj41GEb/QKyyqUp
 TcH9GTVW2I9vb4U7ZZ2I8r8JCVFWqyOic7KGWFPrHJMNirELyU+kcOA65zkarwXOs47lGr
 M4gHRbmR+wjnPLkvH+IlvmZdBfSYoOU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Bu1ok107OyCAqYDslXRU5A-1; Tue, 25 Apr 2023 03:44:47 -0400
X-MC-Unique: Bu1ok107OyCAqYDslXRU5A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so9371195e9.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408685; x=1685000685;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pmX5kxAQSbcLMByrNwTFGWFbaR7cA+dAexIzcdmcLAI=;
 b=lChRyr1INPuBKHeAgLPAF088uB9vm9HS10LnPUc7x12S3EODYhPIM1z03lBSXJ6ALV
 Csa1ZpWKsxudalk9WgZqRbZ57E5LtB5fT7I3xqXwt7wWMwA1kKyh/5ag2g+t8X4NeEJk
 sU9CpEzQ4XyOgbbSJ3XTxaVfjqY8lGUJHoFRM/QjVQrNwPIuEcRYx/5I8dJ9DLE0ZxD/
 ii++pzp+eOWH9S2wnid/cgS3Mzf0LttRfZf3MSTAZgbry8mlsqfeovnwOOMbToZVCyqt
 /v+pBxZOmQloMlN34plGiSwx/KAq9UjE1M7DQF1mZoeAbbYkBJRw1qh/IQs9RYjPXcFR
 u0dA==
X-Gm-Message-State: AAQBX9cCPGAi/97UQMH5i1z18Gt1Xh868YiUAsr6gVJsUlKazxbUxpEV
 /KBpAO+It1x2KoshRB7eFimvKCM7A6ysW109QnCBELrZGD8/eT5KRG4Q5BYSMp0xUDcl5Oyt54X
 txdrQR+oR8XST1KYkXDWUpFt0HjwPhUUruQ7gNlsSkUpXEcZ+oByNtbD5r9OWSOadKWDH
X-Received: by 2002:adf:f7c6:0:b0:2ff:c0c0:532a with SMTP id
 a6-20020adff7c6000000b002ffc0c0532amr11211885wrq.25.1682408685274; 
 Tue, 25 Apr 2023 00:44:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350ay/8Vq5w6xqpnDG5XPRT2lxd0eMaH0UgN5fKjwT3036vqwOEtS9c/C2eWJhoDpaxKy2g5UwQ==
X-Received: by 2002:adf:f7c6:0:b0:2ff:c0c0:532a with SMTP id
 a6-20020adff7c6000000b002ffc0c0532amr11211869wrq.25.1682408684850; 
 Tue, 25 Apr 2023 00:44:44 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 r17-20020adff711000000b002f2b8cb5d9csm12450358wrp.28.2023.04.25.00.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:44:44 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:44:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/31] virtio,pc,pci: fixes, features, cleanups
Message-ID: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:

  Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to c28db9e0002df2abf88283b41dce0be17e8b0888:

  hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from TYPE_PXB_DEV (2023-04-24 22:56:55 -0400)

----------------------------------------------------------------
virtio,pc,pci: fixes, features, cleanups

Mostly just fixes, cleanups all over the place.
Some optimizations.
More control over slot_reserved_mask.
More feature bits supported for SVQ.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Akihiko Odaki (1):
      docs: Remove obsolete descriptions of SR-IOV support

Ani Sinha (3):
      Add my old and new work email mapping and use work email to support biosbits
      Add my old and new work email mapping and use work email to support acpi
      hw/acpi: limit warning on acpi table size to pc machines older than version 2.3

Carlos López (1):
      virtio: refresh vring region cache after updating a virtqueue size

Chuck Zmudzinski (1):
      pci: avoid accessing slot_reserved_mask directly outside of pci.c

Cornelia Huck (1):
      hw: Add compat machines for 8.1

Eugenio Pérez (2):
      vdpa: accept VIRTIO_NET_F_SPEED_DUPLEX in SVQ
      MAINTAINERS: Add Eugenio Pérez as vhost-shadow-virtqueue reviewer

Igor Mammedov (1):
      acpi: pcihp: allow repeating hot-unplug requests

Jason Wang (1):
      intel_iommu: refine iotlb hash calculation

Jonathan Cameron (2):
      hw/pci-bridge: pci_expander_bridge fix type in pxb_cxl_dev_reset()
      hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from TYPE_PXB_DEV

Paolo Bonzini (1):
      tests: bios-tables-test: replace memset with initializer

Peter Maydell (3):
      docs/specs/pci-ids: Convert from txt to rST
      docs/specs: Convert pci-serial.txt to rst
      docs/specs: Convert pci-testdev.txt to rst

Peter Xu (1):
      vhost: Drop unused eventfd_add|del hooks

Philippe Mathieu-Daudé (6):
      MAINTAINERS: Mark AMD-Vi emulation as orphan
      hw/i386/amd_iommu: Explicit use of AMDVI_BASE_ADDR in amdvi_init
      hw/i386/amd_iommu: Remove intermediate AMDVIState::devid field
      hw/i386/amd_iommu: Move capab_offset from AMDVIState to AMDVIPCIState
      hw/i386/amd_iommu: Set PCI static/const fields via PCIDeviceClass
      hw/i386/amd_iommu: Factor amdvi_pci_realize out of amdvi_sysbus_realize

Stefan Weil (1):
      docs/cxl: Fix sentence

Thomas Huth (1):
      meson_options.txt: Enable qom-cast-debug by default again

Viresh Kumar (3):
      docs: vhost-user: Define memory region separately
      docs: vhost-user: Add Xen specific memory mapping support
      virtio: i2c: Check notifier helpers for VIRTIO_CONFIG_IRQ_IDX

Vladimir Sementsov-Ogievskiy (1):
      vhost-user-blk-server: notify client about disk resize

Yangming (1):
      virtio-balloon: optimize the virtio-balloon on the ARM platform

 docs/pcie_sriov.txt                       |   5 +-
 docs/specs/pci-ids.txt                    |  70 -----------------
 docs/specs/pci-serial.txt                 |  34 ---------
 docs/specs/pci-testdev.txt                |  31 --------
 meson_options.txt                         |   2 +-
 hw/i386/amd_iommu.h                       |   9 +--
 hw/i386/intel_iommu_internal.h            |   6 +-
 include/hw/boards.h                       |   5 ++
 include/hw/cxl/cxl.h                      |   4 +-
 include/hw/i386/pc.h                      |   6 ++
 include/hw/pci/pci.h                      |   3 +
 include/hw/pci/pci_bridge.h               |  30 +++++---
 include/hw/virtio/virtio.h                |   1 +
 subprojects/libvhost-user/libvhost-user.h |   2 +
 block/export/vhost-user-blk-server.c      |  24 ++++++
 hw/acpi/cxl.c                             |  11 +--
 hw/acpi/pcihp.c                           |  10 +++
 hw/arm/virt.c                             |  11 ++-
 hw/char/serial-pci-multi.c                |   2 +-
 hw/char/serial-pci.c                      |   2 +-
 hw/core/machine.c                         |   3 +
 hw/cxl/cxl-host.c                         |   4 +-
 hw/i386/acpi-build.c                      |  12 ++-
 hw/i386/amd_iommu.c                       |  74 ++++++++++--------
 hw/i386/intel_iommu.c                     |   9 ++-
 hw/i386/pc.c                              |   4 +
 hw/i386/pc_piix.c                         |  17 ++++-
 hw/i386/pc_q35.c                          |  14 +++-
 hw/m68k/virt.c                            |  11 ++-
 hw/mem/pc-dimm.c                          |   7 ++
 hw/pci-bridge/pci_expander_bridge.c       |  61 +++++----------
 hw/pci/pci.c                              |  15 ++++
 hw/ppc/spapr.c                            |  17 ++++-
 hw/s390x/s390-virtio-ccw.c                |  14 +++-
 hw/s390x/virtio-ccw.c                     |   1 +
 hw/sparc64/sun4u.c                        |   7 +-
 hw/virtio/vhost-user-i2c.c                |  16 ++++
 hw/virtio/vhost.c                         |  14 ----
 hw/virtio/virtio-balloon.c                |  33 ++------
 hw/virtio/virtio-mmio.c                   |   1 +
 hw/virtio/virtio-pci.c                    |   1 +
 hw/virtio/virtio.c                        |   2 +-
 hw/xen/xen_pt.c                           |   7 +-
 net/vhost-vdpa.c                          |   3 +-
 subprojects/libvhost-user/libvhost-user.c |  10 +++
 tests/qtest/bios-tables-test.c            | 123 +++++++++++-------------------
 .mailmap                                  |   1 +
 MAINTAINERS                               |  12 ++-
 docs/devel/acpi-bits.rst                  |   2 +-
 docs/interop/vhost-user.rst               |  60 ++++++++++-----
 docs/specs/index.rst                      |   3 +
 docs/specs/pci-ids.rst                    |  98 ++++++++++++++++++++++++
 docs/specs/pci-serial.rst                 |  37 +++++++++
 docs/specs/pci-testdev.rst                |  39 ++++++++++
 docs/system/devices/cxl.rst               |   2 +-
 scripts/meson-buildoptions.sh             |   2 +-
 56 files changed, 584 insertions(+), 420 deletions(-)
 delete mode 100644 docs/specs/pci-ids.txt
 delete mode 100644 docs/specs/pci-serial.txt
 delete mode 100644 docs/specs/pci-testdev.txt
 create mode 100644 docs/specs/pci-ids.rst
 create mode 100644 docs/specs/pci-serial.rst
 create mode 100644 docs/specs/pci-testdev.rst


