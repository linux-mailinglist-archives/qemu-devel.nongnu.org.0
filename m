Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E66AFBD9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKZ-0007oN-OJ; Tue, 07 Mar 2023 20:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKY-0007gr-0J
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:10:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKV-0001T7-P1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1+FyhwZC3NubGUPdRNhrX56hX1Uqb7224tN6zPdm+hQ=;
 b=JSeazQWWs21FT1XqcHZ0goLQ3PLGbLNZCf3Jpz8rysK7J4yfJ1v25/tiSG8iQIZnb8CBM2
 KCxalNPci/Tk0VnWd69n/RP+f7ywcwKpK6lI76ZYmkz6yXQI2Ip7ifdam9g2MTcv+b5El7
 /DcMEkBs2NxUFwxyhnjdbZ6IInU+x/4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-VvDcqF2yMdaDNcq6gzT-LA-1; Tue, 07 Mar 2023 20:10:53 -0500
X-MC-Unique: VvDcqF2yMdaDNcq6gzT-LA-1
Received: by mail-wr1-f69.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so2599715wrb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237851;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+FyhwZC3NubGUPdRNhrX56hX1Uqb7224tN6zPdm+hQ=;
 b=zyfkLWJC9ldQojYJmVzFRipOCkHwyrwsXEgW4SlEV/jnC2QX2ede+MoZpMRhduNMfH
 1kPOLslxKfrvY+D0P9bBLBmol9mw5RdjgyJpmi+r1Nc6lAbd15flnFU3NWXUtQ7TcUUU
 jp5bdNCpsOd2mzmZ5c8MBbaSF7IJAyZ1zkovzihOyEJX2Pd2xMibvKunPG7UccL7BKHy
 80zMJwztmo9y0j4zGG29KqHjoZflMwe44Y5iVPAkbJRoeMIHwQ8ElSqlDqQvg9pG7hzO
 h+HELGPP75tAJa1gzPf/i3ClZqGm7oEuP/bJ9nR8W1SDSYPhhdMvUQ9kPeFz9380Z+oX
 fXbg==
X-Gm-Message-State: AO0yUKWud24tXv1mENoP5kqZ7gaQLd1ru6so8DWE1NgU1FbrnZ50gfEt
 QO020uXxm8WYfdpMmq38AQqrTL8OG5TJ4Y339fRiNkza2eokyAR2mId2c9IZ9IN0g0LW65FG/7p
 OqAgSzPcifUlZ2rleDxn/p7z6r7q0/0Yy56AKfu62EroiHonevu0Rh9eHqTYaoZCIWt9i
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id
 t9-20020a05600c450900b003eb32ff0da8mr15515608wmo.16.1678237851254; 
 Tue, 07 Mar 2023 17:10:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/vKjMygiGqKRl5bWb2q+QXu5McvPn8Y97vao79VWHKv3J+JW7nuvddYZsOVJMK//vetoH/bg==
X-Received: by 2002:a05:600c:4509:b0:3eb:32ff:da8 with SMTP id
 t9-20020a05600c450900b003eb32ff0da8mr15515578wmo.16.1678237850748; 
 Tue, 07 Mar 2023 17:10:50 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm19787595wmq.5.2023.03.07.17.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:10:50 -0800 (PST)
Date: Tue, 7 Mar 2023 20:10:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/73] virtio,pc,pci: features, fixes
Message-ID: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 52062b213c13bd7fff966d36b554c04609c925d6:

  virtio: refresh vring region cache after updating a virtqueue size (2023-03-07 19:51:07 -0500)

----------------------------------------------------------------
virtio,pc,pci: features, fixes

Several features that landed at the last possible moment:

Passthrough HDM decoder emulation
Refactor cryptodev
RAS error emulation and injection
acpi-index support on non-hotpluggable slots
Dynamically switch to vhost shadow virtqueues at vdpa net migration

Plus a couple of bugfixes that look important to have in the release.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Albert Esteve (1):
      hw/virtio/vhost-user: avoid using unitialized errp

Carlos López (2):
      virtio: fix reachable assertion due to stale value of cached region size
      virtio: refresh vring region cache after updating a virtqueue size

Eugenio Pérez (14):
      vdpa net: move iova tree creation from init to start
      vdpa: Remember last call fd set
      vdpa: Negotiate _F_SUSPEND feature
      vdpa: rewind at get_base, not set_base
      vdpa: add vhost_vdpa->suspended parameter
      vdpa: add vhost_vdpa_suspend
      vdpa: move vhost reset after get vring base
      vdpa: add vdpa net migration state notifier
      vdpa: disable RAM block discard only for the first device
      vdpa net: block migration if the device has CVQ
      vdpa: block migration if device has unsupported features
      vdpa: block migration if SVQ does not admit a feature
      vdpa net: allow VHOST_F_LOG_ALL
      vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices

Igor Mammedov (34):
      Revert "tests/qtest: Check for devices in bios-tables-test"
      tests: acpi: whitelist new q35.noacpihp test and pc.hpbrroot
      tests: acpi: add test_acpi_q35_tcg_no_acpi_hotplug test and extend test_acpi_piix4_no_acpi_pci_hotplug
      tests: acpi: update expected blobs
      tests: acpi: whitelist q35/DSDT.multi-bridge before extending testcase
      tests: acpi: extend multi-bridge case with case 'root-port,id=HOHP,hotplug=off root-port,bus=NOHP'
      x86: pcihp: fix missing PCNT callchain when intermediate root-port has 'hotplug=off' set
      tests: acpi: whitelist pc/DSDT.hpbrroot and pc/DSDT.hpbridge tests
      x86: pcihp: fix missing bridge AML when intermediate root-port has 'hotplug=off' set
      tests: acpi: update expected blobs
      pcihp: piix4: do not redirect hotplug controller to piix4 when ACPI hotplug is disabled
      pci: fix 'hotplugglable' property behavior
      tests: acpi: whitelist DSDT blobs before isolating PCI _DSM func 0 prolog
      pcihp: move PCI _DSM function 0 prolog into separate function
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT before adding EDSM method
      acpi: pci: add EDSM method to DSDT
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT before adding device with acpi-index to testcases
      tests: acpi: add device with acpi-index on non-hotpluggble bus
      acpi: pci: support acpi-index for non-hotpluggable devices
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT before exposing non zero functions
      acpi: pci: describe all functions on populated slots
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT before adding non-0 function device with acpi-index to testcases
      tests: acpi: add non zero function device with acpi-index on non-hotpluggble bus
      tests: acpi: update expected blobs
      pci: move acpi-index uniqueness check to generic PCI device code
      acpi: pci: drop BSEL usage when deciding that device isn't hotpluggable
      acpi: pci: move BSEL into build_append_pcihp_slots()
      acpi: pci: move out ACPI PCI hotplug generator from generic slot generator build_append_pci_bus_devices()
      pcihp: move fields enabling hotplug into AcpiPciHpState
      pcihp: add ACPI PCI hotplug specific is_hotpluggable_bus() callback

Jonathan Cameron (10):
      hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
      hw/pci/aer: Add missing routing for AER errors
      hw/pci-bridge/cxl_root_port: Wire up AER
      hw/pci-bridge/cxl_root_port: Wire up MSI
      hw/mem/cxl-type3: Add AER extended capability
      hw/cxl: Fix endian issues in CXL RAS capability defaults / masks
      hw/pci/aer: Make PCIE AER error injection facility available for other emulation to use.
      hw/mem/cxl_type3: Add CXL RAS Error Injection Support.
      hw/pci: Add pcie_count_ds_port() and pcie_find_port_first() helpers
      hw/pxb-cxl: Support passthrough HDM Decoders unless overridden

Zhenwei Pi (12):
      cryptodev: Introduce cryptodev.json
      cryptodev: Remove 'name' & 'model' fields
      cryptodev: Introduce cryptodev alg type in QAPI
      cryptodev: Introduce server type in QAPI
      cryptodev: Introduce 'query-cryptodev' QMP command
      cryptodev-builtin: Detect akcipher capability
      hmp: add cryptodev info command
      cryptodev: Use CryptoDevBackendOpInfo for operation
      cryptodev: Account statistics
      cryptodev: support QoS
      cryptodev: Support query-stats QMP command
      MAINTAINERS: add myself as the maintainer for cryptodev

 qapi/cryptodev.json                           |  89 ++++++
 qapi/cxl.json                                 | 128 ++++++++
 qapi/qapi-schema.json                         |   2 +
 qapi/qom.json                                 |   8 +-
 qapi/stats.json                               |  10 +-
 hw/pci/pci-internal.h                         |   1 -
 include/hw/acpi/ich9.h                        |   1 +
 include/hw/acpi/pcihp.h                       |  11 +-
 include/hw/acpi/piix4.h                       |   2 -
 include/hw/cxl/cxl.h                          |   1 +
 include/hw/cxl/cxl_component.h                |  27 ++
 include/hw/cxl/cxl_device.h                   |  11 +
 include/hw/hotplug.h                          |   2 +
 include/hw/pci/pci_bridge.h                   |   1 +
 include/hw/pci/pcie_aer.h                     |   1 +
 include/hw/pci/pcie_port.h                    |   2 +
 include/hw/pci/pcie_regs.h                    |   3 +
 include/hw/qdev-core.h                        |  13 +-
 include/hw/virtio/vhost-backend.h             |   4 +
 include/hw/virtio/vhost-vdpa.h                |   3 +
 include/monitor/hmp.h                         |   1 +
 include/sysemu/cryptodev.h                    | 113 ++++---
 backends/cryptodev-builtin.c                  |  42 ++-
 backends/cryptodev-hmp-cmds.c                 |  54 ++++
 backends/cryptodev-lkcf.c                     |  19 +-
 backends/cryptodev-vhost-user.c               |  13 +-
 backends/cryptodev-vhost.c                    |   4 +-
 backends/cryptodev.c                          | 433 ++++++++++++++++++++++++--
 hw/acpi/acpi-pci-hotplug-stub.c               |   9 +-
 hw/acpi/ich9.c                                |  21 +-
 hw/acpi/pci-bridge.c                          |  14 +-
 hw/acpi/pcihp.c                               | 112 ++-----
 hw/acpi/piix4.c                               |  33 +-
 hw/cxl/cxl-component-utils.c                  |  20 +-
 hw/cxl/cxl-host.c                             |  31 +-
 hw/i386/acpi-build.c                          | 179 ++++++++---
 hw/isa/lpc_ich9.c                             |   1 +
 hw/mem/cxl_type3.c                            | 294 +++++++++++++++++
 hw/mem/cxl_type3_stubs.c                      |  17 +
 hw/pci-bridge/cxl_root_port.c                 |  64 ++++
 hw/pci-bridge/pci_expander_bridge.c           |  44 ++-
 hw/pci/pci.c                                  |  57 ++++
 hw/pci/pcie_aer.c                             |  14 +-
 hw/pci/pcie_port.c                            |  46 +++
 hw/s390x/virtio-ccw.c                         |   1 +
 hw/virtio/vhost-shadow-virtqueue.c            |   8 +-
 hw/virtio/vhost-user.c                        |   4 +-
 hw/virtio/vhost-vdpa.c                        | 130 +++++---
 hw/virtio/vhost.c                             |   3 +
 hw/virtio/virtio-crypto.c                     |  48 ++-
 hw/virtio/virtio-mmio.c                       |   5 +-
 hw/virtio/virtio-pci.c                        |   1 +
 hw/virtio/virtio.c                            |  11 +-
 net/vhost-vdpa.c                              | 198 ++++++++++--
 stats/stats-hmp-cmds.c                        |   5 +
 stats/stats-qmp-cmds.c                        |   2 +
 tests/qtest/bios-tables-test.c                | 125 +++-----
 MAINTAINERS                                   |   2 +
 backends/meson.build                          |   1 +
 hmp-commands-info.hx                          |  14 +
 hw/mem/meson.build                            |   2 +
 hw/virtio/trace-events                        |   1 +
 qapi/meson.build                              |   2 +
 tests/data/acpi/pc/DSDT                       | Bin 6360 -> 6488 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6283 -> 6411 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7685 -> 7813 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 12487 -> 12615 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6824 -> 6952 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8014 -> 8142 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6289 -> 6451 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3081 -> 3343 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6432 -> 6560 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7719 -> 7847 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6218 -> 6346 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6366 -> 6494 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 9745 -> 9873 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8252 -> 8361 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8269 -> 8378 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9577 -> 9686 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8531 -> 8640 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8298 -> 8407 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11481 -> 11590 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32392 -> 32501 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8716 -> 8825 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9564 -> 9673 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9906 -> 10015 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8327 -> 8436 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8340 -> 8449 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8269 -> 8378 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9611 -> 9720 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9382 -> 9491 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12337 -> 12770 bytes
 tests/data/acpi/q35/DSDT.noacpihp             | Bin 0 -> 8248 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8110 -> 8219 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8258 -> 8367 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8353 -> 8462 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8858 -> 8967 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8884 -> 8993 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9361 -> 9470 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35615 -> 35724 bytes
 100 files changed, 2043 insertions(+), 475 deletions(-)
 create mode 100644 qapi/cryptodev.json
 create mode 100644 qapi/cxl.json
 create mode 100644 backends/cryptodev-hmp-cmds.c
 create mode 100644 hw/mem/cxl_type3_stubs.c
 create mode 100644 tests/data/acpi/q35/DSDT.noacpihp


