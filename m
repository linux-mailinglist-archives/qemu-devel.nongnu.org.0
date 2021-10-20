Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81134348DA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:22:26 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8jp-0005G4-UX
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gs-0002kq-UV
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gr-0002aX-55
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n9f5g9sNTtkHzUTAAFRfoa3gsKryG7j55F+xZDrdxAQ=;
 b=MyCvjwgq2ORsq7/iUwQnDHeW3LDAsR3x5fxYLQ0wU5PkeCcSSLgK1PiRvNlM5VWWFEJ0QA
 alE6nmcFiIVS1tH8VgJLkuHIAxFqTZIoZAQjycFAZTGuQbZr1yNQKtok2mW7FFmwBiI1jH
 KjpPsoI4X7SKg21dwLISpVElk4Crroo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-4IYU8_ufMXqVrpD0cOfE3w-1; Wed, 20 Oct 2021 06:19:16 -0400
X-MC-Unique: 4IYU8_ufMXqVrpD0cOfE3w-1
Received: by mail-ed1-f71.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso20514328edf.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=n9f5g9sNTtkHzUTAAFRfoa3gsKryG7j55F+xZDrdxAQ=;
 b=pfuKRmMFHFH53o4thisixbTSorT2I42cxY3BgSCAivOhB/StrERiHbHy5MWQC4azjL
 dm1mgJq6qx3RlduVM1C+x7c3ebHfPyw45L+M8wNPzmaSU2PviB3T/21cle5bvIbwUXz2
 vrCEGZ83kOcEIWQZGAizsGQcZVo+aKNL4t3fkZWSkkM5+V5XSA9ntAJePDyKvUXTXSQq
 OX9g0rzHieiXSdxWIUuE63qRf45s96pwEaBXDzyWV0xIvtrUb6KW0mfTlDAI2LHaqC6b
 dJ5UkGl62FAgz4itygHQWjd84T17/ax5Y/Go54r6jDHqQeKbcAz7ofmP6WuwmaVfdQdO
 NrLA==
X-Gm-Message-State: AOAM5318jVnB9lhdnuBe8+NzGPO46ZWkqRbozCwRGuTAPuJ7HWBZtlvM
 tm9ZUr5x8RgLpVo222PT62z9AUkakzz+2+8u6XoogGlUaoFNSP44tgwNpEjINKXkYTWknxDyUMU
 flIV7p6N4oCMQNmZwFSx9/Lb37imbP66YUSNzRWzNRaOOfqQBv5w51F06Jklo
X-Received: by 2002:a05:6402:268c:: with SMTP id
 w12mr62276441edd.376.1634725154427; 
 Wed, 20 Oct 2021 03:19:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvK+SIJiSmrE2P0ZzBwISVHbDckBcjaH1V0sXS6Dz4sgQbMxPtPLt3XGUT0jYSBvrVG/MG+w==
X-Received: by 2002:a05:6402:268c:: with SMTP id
 w12mr62276408edd.376.1634725154090; 
 Wed, 20 Oct 2021 03:19:14 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id v13sm964502edl.69.2021.10.20.03.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:13 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/44] pc,pci,virtio: features, fixes, tests
Message-ID: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 50352cce138ef3b30c1cda28a4df68fff5da3202:

  Merge remote-tracking branch 'remotes/juanquintela/tags/migration.next-pull-request' into staging (2021-10-19 07:41:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to a8339e07f94a47f99560baef59d65a9e039aaf45:

  tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test (2021-10-20 06:18:17 -0400)

----------------------------------------------------------------
pc,pci,virtio: features, fixes, tests

vhost user rng
vdpa multiqueue
Fixes, cleanups, new tests all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Ani Sinha (3):
      tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT table blob
      tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35
      tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge test

David Hildenbrand (1):
      libvhost-user: fix VHOST_USER_REM_MEM_REG skipping mmap_addr

Eric Auger (2):
      virtio-iommu: Remove the non transitional name
      virtio-iommu: Drop base_name and change generic_name

Eugenio Pérez (3):
      vdpa: Skip protected ram IOMMU mappings
      vdpa: Add vhost_vdpa_section_end
      vdpa: Check for iova range at mappings changes

Igor Mammedov (15):
      tests: acpi: dump table with failed checksum
      tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator
      tests: acpi: whitelist expected tables for acpi/q35/xapic testcase
      tests: acpi: q35: test for x2APIC entries in SRAT
      tests: acpi: update expected tables blobs
      tests: acpi: whitelist new expected table tests/data/acpi/q35/DMAR.dmar
      tests: acpi: add testcase for intel_iommu (DMAR table)
      tests: acpi: add expected blob for DMAR table
      tests: acpi: whitelist expected blobs for new acpi/q35/ivrs testcase
      tests: acpi: add testcase for amd-iommu (IVRS table)
      tests: acpi: update expected blobs
      tests: acpi: arm/virt: drop redundant test_acpi_one() in test_acpi_virt_tcg()
      tests: arm-cpu-features: use qtest_has_kvm() API
      tests: migration-test: use qtest_has_accel() API
      tests: bios-tables-test: use qtest_has_accel() API to register TCG only tests

Jason Wang (10):
      vhost-vdpa: open device fd in net_init_vhost_vdpa()
      vhost-vdpa: classify one time request
      vhost-vdpa: prepare for the multiqueue support
      vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
      net: introduce control client
      vhost-net: control virtqueue support
      virtio-net: use "queue_pairs" instead of "queues" when possible
      vhost: record the last virtqueue index for the virtio device
      virtio-net: vhost control virtqueue support
      vhost-vdpa: multiqueue support

Laurent Vivier (2):
      failover: fix a regression introduced by JSON'ification of -device
      qdev/qbus: remove failover specific code

Mathieu Poirier (3):
      vhost-user-rng: Add vhost-user-rng implementation
      vhost-user-rng-pci: Add vhost-user-rng-pci implementation
      docs: Add documentation for vhost based RNG implementation

Michael S. Tsirkin (3):
      rebuild-expected-aml.sh: allow partial target list
      bios-tables-test: don't disassemble empty files
      pci: fix PCI resource reserve capability on BE

Stefan Hajnoczi (1):
      vhost-user-blk-test: pass vhost-user socket fds to QSD

Xueming Li (1):
      vhost-user: fix duplicated notifier MR init

 include/hw/virtio/vhost-user-rng.h        |  33 ++++
 include/hw/virtio/vhost-vdpa.h            |   3 +
 include/hw/virtio/vhost.h                 |   2 +
 include/hw/virtio/virtio-iommu.h          |   2 +-
 include/hw/virtio/virtio-net.h            |   5 +-
 include/net/net.h                         |   5 +
 include/net/vhost_net.h                   |   6 +-
 tests/qtest/libqos/libqtest.h             |   8 +
 hw/net/vhost_net-stub.c                   |   4 +-
 hw/net/vhost_net.c                        |  55 ++++--
 hw/net/virtio-net.c                       | 201 ++++++++++++---------
 hw/pci/pci_bridge.c                       |  10 +-
 hw/virtio/vhost-user-rng-pci.c            |  79 ++++++++
 hw/virtio/vhost-user-rng.c                | 289 ++++++++++++++++++++++++++++++
 hw/virtio/vhost-user.c                    |   5 +-
 hw/virtio/vhost-vdpa.c                    | 140 ++++++++++++---
 hw/virtio/virtio-iommu-pci.c              |   4 +-
 net/net.c                                 |  24 ++-
 net/vhost-vdpa.c                          | 127 +++++++++++--
 softmmu/qdev-monitor.c                    |  18 +-
 subprojects/libvhost-user/libvhost-user.c |   1 +
 tests/qtest/acpi-utils.c                  |  14 ++
 tests/qtest/arm-cpu-features.c            |  29 +--
 tests/qtest/bios-tables-test.c            | 122 ++++++++++---
 tests/qtest/libqtest.c                    |  27 +++
 tests/qtest/migration-test.c              |  15 +-
 tests/qtest/vhost-user-blk-test.c         |   4 +-
 docs/system/device-emulation.rst          |   1 +
 docs/system/devices/vhost-user-rng.rst    |  39 ++++
 hw/virtio/Kconfig                         |   5 +
 hw/virtio/meson.build                     |   2 +
 hw/virtio/trace-events                    |   1 +
 meson.build                               |   6 +
 tests/data/acpi/q35/APIC.xapic            | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DMAR.dmar             | Bin 0 -> 120 bytes
 tests/data/acpi/q35/DSDT.ivrs             | Bin 0 -> 8306 bytes
 tests/data/acpi/q35/DSDT.multi-bridge     | Bin 0 -> 8583 bytes
 tests/data/acpi/q35/DSDT.xapic            | Bin 0 -> 35652 bytes
 tests/data/acpi/q35/FACP.xapic            | Bin 0 -> 244 bytes
 tests/data/acpi/q35/IVRS.ivrs             | Bin 0 -> 104 bytes
 tests/data/acpi/q35/SRAT.xapic            | Bin 0 -> 5080 bytes
 tests/data/acpi/rebuild-expected-aml.sh   |  22 ++-
 42 files changed, 1075 insertions(+), 233 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 docs/system/devices/vhost-user-rng.rst
 create mode 100644 tests/data/acpi/q35/APIC.xapic
 create mode 100644 tests/data/acpi/q35/DMAR.dmar
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs
 create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
 create mode 100644 tests/data/acpi/q35/DSDT.xapic
 create mode 100644 tests/data/acpi/q35/FACP.xapic
 create mode 100644 tests/data/acpi/q35/IVRS.ivrs
 create mode 100644 tests/data/acpi/q35/SRAT.xapic


