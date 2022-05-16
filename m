Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2F52824E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:40:25 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqY9I-0000FB-3W
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4r-0005fK-9k
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4k-000521-5y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cCW5YpjCtTWH00BSGYbemLyZ40FEJWoqbADD++lqY2s=;
 b=HoZpwf/oorOghlm4rwY29TYyPLS8EK6Eb6XyDS1Wr7ghhUYp+5fdn1BVB1RUZ9QZRq6UQY
 DIibRE7y9HTX6PJEhQvaXTaV2JtbmCykSOWlSVjTIegGHRFloWeefGOgBgCac8A8//7bvM
 WPe1fiyIS+g+WMB091LT1pEteAeWvZE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-orhKr9WzPcSl5DLsXmIUuQ-1; Mon, 16 May 2022 06:35:39 -0400
X-MC-Unique: orhKr9WzPcSl5DLsXmIUuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so6560067wmb.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=cCW5YpjCtTWH00BSGYbemLyZ40FEJWoqbADD++lqY2s=;
 b=syTou91GraEYMqwjVzFKPWSH7DNCX73GWIb3xaQZ71slmHVye2w3/0sfSQw1F5PeZT
 tvKyVDnECC4sLkhZgOTuOFYDySQUmN0yRnguR/AeCCZyq5wJfLYZzCKCnjxWihtpEske
 SWPogYmYX4CDgSoVCD6hdnRG0JiDUCZdxV1wSqvSFeByQKB3xLkX4NKYQkbUfkzjODnq
 /XN5xqOEo7QOaNWth9hV1lwrZqUCbWtCZEJaExEWgnGJH5TD9hU5mzy94SiEuaPO3yTW
 cbDQyuIUiWRfOOjqaGanEK6KscKL8rCt9+UP6SrrLw7C3bAsX+/80SVce39o7PnfZ0b2
 FjZQ==
X-Gm-Message-State: AOAM532+syN3n/u/FyiW65RxYzL+Y9FaHx0ZLgbzQbcpXIh6kL4NRHaY
 6z048KSmv7CGfGaj6hX8G04s/Mbttl4OeQlgowrnNH/zt07R37tfbiNkeVFjhGFy/2w7R6eOdyc
 vNVk+hSOLSkOg37v/3NN/150r7a3WUbEXnuG0XbVGm/9L8/r5i646q9E6CPtv
X-Received: by 2002:a5d:620f:0:b0:20c:c1ba:cf8e with SMTP id
 y15-20020a5d620f000000b0020cc1bacf8emr13465815wru.426.1652697337888; 
 Mon, 16 May 2022 03:35:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiQOwOhgbhPUGwLqb32tYIbkHUrX4bGtDLBBcezNJu5GWVsOaelJN3TJZLOKOwnR/p7NgLKQ==
X-Received: by 2002:a5d:620f:0:b0:20c:c1ba:cf8e with SMTP id
 y15-20020a5d620f000000b0020cc1bacf8emr13465784wru.426.1652697337452; 
 Mon, 16 May 2022 03:35:37 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfa506000000b0020d0931b48asm2570678wrb.37.2022.05.16.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:35:37 -0700 (PDT)
Date: Mon, 16 May 2022 06:35:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/91] virtio,pc,pci: fixes,cleanups,features
Message-ID: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9de5f2b40860c5f8295e73fea9922df6f0b8d89a:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-12 10:52:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to baebc5a4ab3ceef940887e3cc2f1d0e48cee53dc:

  virtio-net: don't handle mq request in userspace handler for vhost-vdpa (2022-05-16 04:38:40 -0400)

----------------------------------------------------------------
virtio,pc,pci: fixes,cleanups,features

most of CXL support
virtio introspection commands
fixes, cleanups all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (9):
      hw/virtio: move virtio-pci.h into shared include space
      virtio-pci: add notification trace points
      hw/virtio: add vhost_user_[read|write] trace points
      vhost-user.rst: add clarifying language about protocol negotiation
      libvhost-user: expose vu_request_to_string
      docs/devel: start documenting writing VirtIO devices
      include/hw: start documenting the vhost API
      hw/virtio/vhost-user: don't suppress F_CONFIG when supported
      virtio/vhost-user: dynamically assign VhostUserHostNotifiers

Ben Widawsky (24):
      hw/pci/cxl: Add a CXL component type (interface)
      hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
      hw/cxl/device: Introduce a CXL device (8.2.8)
      hw/cxl/device: Implement the CAP array (8.2.8.1-2)
      hw/cxl/device: Implement basic mailbox (8.2.8.4)
      hw/cxl/device: Add memory device utilities
      hw/cxl/device: Add cheap EVENTS implementation (8.2.9.1)
      hw/cxl/device: Timestamp implementation (8.2.9.3)
      hw/cxl/device: Add log commands (8.2.9.4) + CEL
      hw/pxb: Use a type for realizing expanders
      hw/pci/cxl: Create a CXL bus type
      hw/pxb: Allow creation of a CXL PXB (host bridge)
      hw/cxl/rp: Add a root port
      hw/cxl/device: Add a memory device (8.2.8.5)
      hw/cxl/device: Implement MMIO HDM decoding (8.2.5.12)
      hw/cxl/device: Add some trivial commands
      hw/cxl/device: Plumb real Label Storage Area (LSA) sizing
      hw/cxl/device: Implement get/set Label Storage Area (LSA)
      hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)
      acpi/cxl: Add _OSC implementation (9.14.2)
      acpi/cxl: Create the CEDT (9.14.1)
      acpi/cxl: Introduce CFMWS structures in CEDT
      hw/cxl/component Add a dumb HDM decoder handler
      qtest/cxl: Add more complex test cases with CFMWs

David Woodhouse (4):
      target/i386: Fix sanity check on max APIC ID / X2APIC enablement
      intel_iommu: Support IR-only mode without DMA translation
      intel_iommu: Only allow interrupt remapping to be enabled if it's supported
      intel_iommu: Fix irqchip / X2APIC configuration checks

Eugenio Pérez (5):
      vhost: Track descriptor chain in private at SVQ
      vhost: Fix device's used descriptor dequeue
      vdpa: Fix bad index calculus at vhost_vdpa_get_vring_base
      vdpa: Fix index calculus at vhost_vdpa_svqs_start
      vhost: Fix element in vhost_svq_add failure

Francisco Iglesias (2):
      include/hw/pci/pcie_host: Correct PCIE_MMCFG_BUS_MASK
      include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX

Halil Pasic (1):
      virtio: fix feature negotiation for ACCESS_PLATFORM

Ilya Maximets (1):
      vhost_net: Print feature masks in hex

Jason Wang (5):
      intel-iommu: correct the value used for error_setg_errno()
      intel-iommu: remove VTD_FR_RESERVED_ERR
      intel-iommu: block output address in interrupt address range
      intel-iommu: update root_scalable before switching as during post_load
      intel-iommu: update iq_dw during post load

Jonah Palmer (2):
      virtio: drop name parameter for virtio_init()
      virtio: add vhost support for virtio devices

Jonathan Cameron (16):
      MAINTAINERS: Add entry for Compute Express Link Emulation
      cxl: Machine level control on whether CXL support is enabled
      qtest/cxl: Introduce initial test for pxb-cxl only.
      qtests/cxl: Add initial root port and CXL type3 tests
      hw/cxl/component: Add utils for interleave parameter encoding/decoding
      hw/cxl/host: Add support for CXL Fixed Memory Windows.
      hw/pci-host/gpex-acpi: Add support for dsdt construction for pxb-cxl
      pci/pcie_port: Add pci_find_port_by_pn()
      CXL/cxl_component: Add cxl_get_hb_cstate()
      mem/cxl_type3: Add read and write functions for associated hostmem.
      cxl/cxl-host: Add memops for CFMWS region.
      i386/pc: Enable CXL fixed memory windows
      tests/acpi: q35: Allow addition of a CXL test.
      qtests/bios-tables-test: Add a test for CXL emulation.
      tests/acpi: Add tables for CXL emulation.
      docs/cxl: Add initial Compute eXpress Link (CXL) documentation.

Kevin Wolf (1):
      docs/vhost-user: Clarifications for VHOST_USER_ADD/REM_MEM_REG

Laurent Vivier (6):
      qmp: add QMP command x-query-virtio
      qmp: add QMP command x-query-virtio-status
      qmp: decode feature & status bits in virtio-status
      qmp: add QMP commands for virtio/vhost queue-status
      qmp: add QMP command x-query-virtio-queue-element
      hmp: add virtio commands

Michael S. Tsirkin (1):
      vhost-user: more master/slave things

Paolo Bonzini (3):
      docs: vhost-user: clean up request/reply description
      docs: vhost-user: rewrite section on ring state machine
      docs: vhost-user: replace master/slave with front-end/back-end

Philippe Mathieu-Daudé (1):
      hw/virtio: Replace g_memdup() by g_memdup2()

Si-Wei Liu (7):
      virtio-net: setup vhost_dev and notifiers for cvq only when feature is negotiated
      virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
      vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
      vhost-net: fix improper cleanup in vhost_net_start
      vhost-vdpa: backend feature should set only once
      vhost-vdpa: change name and polarity for vhost_vdpa_one_time_request()
      virtio-net: don't handle mq request in userspace handler for vhost-vdpa

Wei Huang (1):
      hw/i386/amd_iommu: Fix IOMMU event log encoding errors

Xiaoyao Li (2):
      hw/i386: Make pit a property of common x86 base machine type
      hw/i386: Make pic a property of common x86 base machine type

 qapi/machine.json                         |  21 +
 qapi/qapi-schema.json                     |   1 +
 qapi/virtio.json                          | 841 ++++++++++++++++++++++++++++++
 hw/i386/intel_iommu_internal.h            |   9 +-
 hw/virtio/vhost-shadow-virtqueue.h        |   6 +
 include/hw/acpi/cxl.h                     |  28 +
 include/hw/boards.h                       |   2 +
 include/hw/cxl/cxl.h                      |  61 +++
 include/hw/cxl/cxl_component.h            | 223 ++++++++
 include/hw/cxl/cxl_device.h               | 268 ++++++++++
 include/hw/cxl/cxl_pci.h                  | 167 ++++++
 include/hw/i386/intel_iommu.h             |   1 +
 include/hw/i386/microvm.h                 |   4 -
 include/hw/i386/pc.h                      |   2 -
 include/hw/i386/x86.h                     |   4 +
 include/hw/pci/pci.h                      |  14 +
 include/hw/pci/pci_bridge.h               |  20 +
 include/hw/pci/pci_bus.h                  |   7 +
 include/hw/pci/pci_ids.h                  |   1 +
 include/hw/pci/pcie_host.h                |   6 +-
 include/hw/pci/pcie_port.h                |   2 +
 include/hw/virtio/vhost-user.h            |  43 +-
 include/hw/virtio/vhost-vsock-common.h    |   2 +-
 include/hw/virtio/vhost.h                 | 135 ++++-
 include/hw/virtio/virtio-gpu.h            |   3 +-
 {hw => include/hw}/virtio/virtio-pci.h    |   0
 include/hw/virtio/virtio.h                |  27 +-
 include/monitor/hmp.h                     |   5 +
 subprojects/libvhost-user/libvhost-user.h |   9 +
 hw/9pfs/virtio-9p-device.c                |   2 +-
 hw/acpi/cxl-stub.c                        |  12 +
 hw/acpi/cxl.c                             | 257 +++++++++
 hw/block/vhost-user-blk.c                 |   9 +-
 hw/block/virtio-blk.c                     |  31 +-
 hw/char/virtio-serial-bus.c               |  14 +-
 hw/core/machine.c                         |  28 +
 hw/cxl/cxl-component-utils.c              | 396 ++++++++++++++
 hw/cxl/cxl-device-utils.c                 | 265 ++++++++++
 hw/cxl/cxl-host-stubs.c                   |  16 +
 hw/cxl/cxl-host.c                         | 222 ++++++++
 hw/cxl/cxl-mailbox-utils.c                | 478 +++++++++++++++++
 hw/display/vhost-user-gpu.c               |   7 +
 hw/display/virtio-gpu-base.c              |   2 +-
 hw/display/virtio-gpu.c                   |  18 +
 hw/i386/acpi-build.c                      |  57 +-
 hw/i386/amd_iommu.c                       |  24 +-
 hw/i386/intel_iommu.c                     |  95 ++--
 hw/i386/microvm.c                         |  54 +-
 hw/i386/pc.c                              |  89 ++--
 hw/i386/pc_piix.c                         |   4 +-
 hw/i386/pc_q35.c                          |   4 +-
 hw/i386/x86.c                             |  66 +++
 hw/input/vhost-user-input.c               |   7 +
 hw/input/virtio-input.c                   |  13 +-
 hw/mem/cxl_type3.c                        | 371 +++++++++++++
 hw/net/vhost_net.c                        |   8 +-
 hw/net/virtio-net.c                       | 110 +++-
 hw/pci-bridge/cxl_root_port.c             | 236 +++++++++
 hw/pci-bridge/pci_expander_bridge.c       | 168 +++++-
 hw/pci-bridge/pcie_root_port.c            |   6 +-
 hw/pci-host/gpex-acpi.c                   |  20 +-
 hw/pci/pci.c                              |  21 +-
 hw/pci/pcie_port.c                        |  25 +
 hw/scsi/vhost-scsi.c                      |   8 +
 hw/scsi/vhost-user-scsi.c                 |   1 +
 hw/scsi/virtio-scsi.c                     |  20 +-
 hw/virtio/vhost-scsi-pci.c                |   2 +-
 hw/virtio/vhost-shadow-virtqueue.c        |  35 +-
 hw/virtio/vhost-user-blk-pci.c            |   2 +-
 hw/virtio/vhost-user-fs-pci.c             |   2 +-
 hw/virtio/vhost-user-fs.c                 |  20 +-
 hw/virtio/vhost-user-i2c-pci.c            |   2 +-
 hw/virtio/vhost-user-i2c.c                |  19 +-
 hw/virtio/vhost-user-input-pci.c          |   2 +-
 hw/virtio/vhost-user-rng-pci.c            |   2 +-
 hw/virtio/vhost-user-rng.c                |   9 +-
 hw/virtio/vhost-user-scsi-pci.c           |   2 +-
 hw/virtio/vhost-user-vsock-pci.c          |   2 +-
 hw/virtio/vhost-user-vsock.c              |   2 +-
 hw/virtio/vhost-user.c                    | 131 +++--
 hw/virtio/vhost-vdpa.c                    |  29 +-
 hw/virtio/vhost-vsock-common.c            |  22 +-
 hw/virtio/vhost-vsock-pci.c               |   2 +-
 hw/virtio/vhost-vsock.c                   |   2 +-
 hw/virtio/vhost.c                         |   4 +-
 hw/virtio/virtio-9p-pci.c                 |   2 +-
 hw/virtio/virtio-balloon-pci.c            |   2 +-
 hw/virtio/virtio-balloon.c                |  17 +-
 hw/virtio/virtio-blk-pci.c                |   2 +-
 hw/virtio/virtio-bus.c                    |  22 +-
 hw/virtio/virtio-crypto.c                 |  28 +-
 hw/virtio/virtio-input-host-pci.c         |   2 +-
 hw/virtio/virtio-input-pci.c              |   2 +-
 hw/virtio/virtio-iommu-pci.c              |   2 +-
 hw/virtio/virtio-iommu.c                  |  17 +-
 hw/virtio/virtio-mem.c                    |  14 +-
 hw/virtio/virtio-net-pci.c                |   2 +-
 hw/virtio/virtio-pci.c                    |   5 +-
 hw/virtio/virtio-pmem.c                   |   3 +-
 hw/virtio/virtio-rng-pci.c                |   2 +-
 hw/virtio/virtio-rng.c                    |   2 +-
 hw/virtio/virtio-scsi-pci.c               |   2 +-
 hw/virtio/virtio-serial-pci.c             |   2 +-
 hw/virtio/virtio-stub.c                   |  42 ++
 hw/virtio/virtio.c                        | 747 +++++++++++++++++++++++++-
 monitor/hmp-cmds.c                        | 311 +++++++++++
 net/vhost-vdpa.c                          |   4 +-
 softmmu/vl.c                              |  47 ++
 subprojects/libvhost-user/libvhost-user.c |   2 +-
 target/i386/kvm/kvm-cpu.c                 |   2 +-
 tests/qtest/bios-tables-test.c            |  44 ++
 tests/qtest/cxl-test.c                    | 151 ++++++
 tests/qtest/qmp-cmd-test.c                |   1 +
 MAINTAINERS                               |   7 +
 docs/devel/index-internals.rst            |   1 +
 docs/devel/virtio-backends.rst            | 214 ++++++++
 docs/interop/vhost-user-gpu.rst           |  10 +-
 docs/interop/vhost-user.rst               | 579 ++++++++++----------
 docs/system/device-emulation.rst          |   1 +
 docs/system/devices/cxl.rst               | 302 +++++++++++
 hmp-commands-info.hx                      |  70 +++
 hw/Kconfig                                |   1 +
 hw/acpi/Kconfig                           |   5 +
 hw/acpi/meson.build                       |   4 +-
 hw/arm/Kconfig                            |   1 +
 hw/cxl/Kconfig                            |   3 +
 hw/cxl/meson.build                        |  12 +
 hw/mem/Kconfig                            |   5 +
 hw/mem/meson.build                        |   1 +
 hw/meson.build                            |   1 +
 hw/pci-bridge/Kconfig                     |   5 +
 hw/pci-bridge/meson.build                 |   1 +
 hw/virtio/meson.build                     |   2 +
 hw/virtio/trace-events                    |  10 +-
 qapi/meson.build                          |   1 +
 qemu-options.hx                           |  38 ++
 scripts/device-crash-test                 |   1 +
 tests/data/acpi/q35/CEDT.cxl              | Bin 0 -> 184 bytes
 tests/data/acpi/q35/DSDT.cxl              | Bin 0 -> 9615 bytes
 tests/qtest/meson.build                   |   4 +
 140 files changed, 7550 insertions(+), 575 deletions(-)
 create mode 100644 qapi/virtio.json
 create mode 100644 include/hw/acpi/cxl.h
 create mode 100644 include/hw/cxl/cxl.h
 create mode 100644 include/hw/cxl/cxl_component.h
 create mode 100644 include/hw/cxl/cxl_device.h
 create mode 100644 include/hw/cxl/cxl_pci.h
 rename {hw => include/hw}/virtio/virtio-pci.h (100%)
 create mode 100644 hw/acpi/cxl-stub.c
 create mode 100644 hw/acpi/cxl.c
 create mode 100644 hw/cxl/cxl-component-utils.c
 create mode 100644 hw/cxl/cxl-device-utils.c
 create mode 100644 hw/cxl/cxl-host-stubs.c
 create mode 100644 hw/cxl/cxl-host.c
 create mode 100644 hw/cxl/cxl-mailbox-utils.c
 create mode 100644 hw/mem/cxl_type3.c
 create mode 100644 hw/pci-bridge/cxl_root_port.c
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 tests/qtest/cxl-test.c
 create mode 100644 docs/devel/virtio-backends.rst
 create mode 100644 docs/system/devices/cxl.rst
 create mode 100644 hw/cxl/Kconfig
 create mode 100644 hw/cxl/meson.build
 create mode 100644 tests/data/acpi/q35/CEDT.cxl
 create mode 100644 tests/data/acpi/q35/DSDT.cxl


