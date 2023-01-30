Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F51681B3E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:19:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacB-0002C4-Ac; Mon, 30 Jan 2023 15:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMac8-0002AF-OI
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:18:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMac5-0006nz-Sk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9C0wspH7JwtV5isIbSGmt7CJcNDtpFw6jzspm0OHuHg=;
 b=BM3Sp22nsPfykrhRYvdnfgVKtJno5Sx9vwZDkcBbSBeQagEg8qi5ZKIztF9ACOyNanUYCX
 1XRe523nJKspaGOpacupHQRfYPLAu25onngVP/XLm0+likFApADM7Ma2TeaaEoz+dtPOom
 C1nxWOcZXiIm4kRLo/dyXTSuCJR+ewc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-32lQP717P1WOxJUPxfd9lg-1; Mon, 30 Jan 2023 15:18:45 -0500
X-MC-Unique: 32lQP717P1WOxJUPxfd9lg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gz8-20020a170907a04800b0087bd94a505fso5688268ejc.16
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9C0wspH7JwtV5isIbSGmt7CJcNDtpFw6jzspm0OHuHg=;
 b=cLmlov59cUeS6aUlk+kb+mEf1Hw1J0KQsL6xnvckeIqDNLCPPTvNF/j393zuWIWbXJ
 A7mI5GoqWOTnXY8P7UO5UB0jYWlxcZivySHgOU74Tje5sV7GHqpakoGD4oCV3+yq0iuR
 8RlvfgtzfpM7iXaGoUWIogCQc0fxj+eFec76RVO8MiPUIuriMlD7yEfeb/c+sJKyz6iu
 5Ao1lrKPfgnr9CmsB/PjGFA89E+rcuJbfuKl64+TkdRiPr67ARVWY+Nx3fVNcyK0EOZV
 xvyEdpRXq8H9EmosC+fmG8yhQqLwXWLYv0oxUBDXAEK/vNflBhQY8O/56y47JEC8KOw4
 4PDA==
X-Gm-Message-State: AO0yUKUE54PUJl/ggSWzJa4R2WjnlpVgq53+Z9bRoRfQGjSfuSeQMVUo
 i07Kx0QiVunOl+i0JIABaLAtb7wCN4OHRgfKW+pYasOcgJWB4BAj3sPMqQTAk7t+UAEW39q0wIN
 YZ+W7rpuf4l6vZcw+uOFlE51Moto8EiDvPzEl5FrAZ7eBD7PiWrmx58DM+VUN
X-Received: by 2002:a05:6402:520a:b0:4a2:6573:5c35 with SMTP id
 s10-20020a056402520a00b004a265735c35mr787725edd.21.1675109923268; 
 Mon, 30 Jan 2023 12:18:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+YXDj6KakXDehZxu2NPWJlHIf6ggkGEWQe3jzqOqfXvCdU9j9/EpCDKD+T8YsBno2eSSKSdQ==
X-Received: by 2002:a05:6402:520a:b0:4a2:6573:5c35 with SMTP id
 s10-20020a056402520a00b004a265735c35mr787694edd.21.1675109922888; 
 Mon, 30 Jan 2023 12:18:42 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm7219214edr.28.2023.01.30.12.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:18:42 -0800 (PST)
Date: Mon, 30 Jan 2023 15:18:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/56] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230130201810.11518-1-mst@redhat.com>
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to f5cb612867d3b10b86d6361ba041767e02c1b127:

  docs/pcie.txt: Replace ioh3420 with pcie-root-port (2023-01-28 06:21:30 -0500)

----------------------------------------------------------------
virtio,pc,pci: features, cleanups, fixes

lots of fixes, cleanups

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Akihiko Odaki (1):
      vhost-user: Correct a reference of TARGET_AARCH64

Bernhard Beschow (4):
      hw/i386/acpi-build: Remove unused attributes
      hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()
      hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"
      hw/acpi/acpi_dev_interface: Remove unused parameter from AcpiDeviceIfClass::madt_cpu

Dr. David Alan Gilbert (1):
      virtio-rng-pci: fix migration compat for vectors

Greg Kurz (2):
      Revert "vhost-user: Monitor slave channel in vhost_user_read()"
      Revert "vhost-user: Introduce nested event loop in vhost_user_read()"

Igor Mammedov (40):
      tests: qtest: print device_add error before failing test
      tests: acpi: cleanup arguments to make them more readable
      tests: acpi: whitelist DSDT blobs for tests that use pci-bridges
      tests: acpi: extend pcihp with nested bridges
      tests: acpi: update expected blobs
      tests: acpi: cleanup use_uefi argument usage
      pci_bridge: remove whitespace
      x86: acpi: pcihp: clean up duplicate bridge_in_acpi assignment
      pci: acpi hotplug: rename x-native-hotplug to x-do-not-expose-native-hotplug-cap
      pcihp: piix4: do not call acpi_pcihp_reset() when ACPI PCI hotplug is disabled
      pci: acpihp: assign BSEL only to coldplugged bridges
      x86: pcihp: fix invalid AML PCNT calls to hotplugged bridges
      tests: boot_sector_test: avoid crashing if status is not available yet
      tests: acpi: extend bridge tests with hotplugged bridges
      tests: boot_sector_test(): make it multi-shot
      tests: acpi: add reboot cycle to bridge test
      tests: acpi: whitelist DSDT before refactoring acpi based PCI hotplug machinery
      pcihp: drop pcihp_bridge_en dependency when composing PCNT method
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT before refactoring acpi based PCI hotplug machinery
      pcihp: compose PCNT callchain right before its user _GPE._E01
      pcihp: do not put empty PCNT in DSDT
      tests: acpi: update expected blobs
      whitelist DSDT before adding endpoint devices to bridge testcases
      tests: acpi: add endpoint devices to bridges
      tests: acpi: update expected blobs
      x86: pcihp: acpi: prepare slot ignore rule to work with self describing bridges
      pci: acpi: wire up AcpiDevAmlIf interface to generic bridge
      pcihp: make bridge describe itself using AcpiDevAmlIfClass:build_dev_aml
      pci: make sure pci_bus_is_express() won't error out with "discards ‘const’ qualifier"
      pcihp: isolate rule whether slot should be described in DSDT
      tests: acpi: whitelist DSDT before decoupling PCI hotplug code from basic slots description
      pcihp: acpi: decouple hotplug and generic slots description
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT blobs before removing dynamic _DSM on coldplugged bridges
      pcihp: acpi: ignore coldplugged bridges when composing hotpluggable slots
      tests: acpi: update expected blobs
      tests: acpi: whitelist DSDT before moving non-hotpluggble slots description from hotplug path
      pcihp: generate populated non-hotpluggble slot descriptions on non-hotplug path
      tests: acpi: update expected blobs

Jason A. Donenfeld (1):
      x86: don't let decompressed kernel image clobber setup_data

Marcel Apfelbaum (1):
      docs/pcie.txt: Replace ioh3420 with pcie-root-port

Minghao Yuan (1):
      vhost-user: Skip unnecessary duplicated VHOST_USER_ADD/REM_MEM_REG requests

Peter Xu (1):
      intel-iommu: Document iova_tree

Philippe Mathieu-Daudé (2):
      hw/pci-host: Use register definitions from PCI standard
      hw: Use TYPE_PCI_BUS definition where appropriate

Thomas Huth (1):
      tests/qtest/bios-tables-test: Make the test less verbose by default

Vladimir Sementsov-Ogievskiy (1):
      shpc: disallow unplug when power indicator is blinking

 docs/pcie.txt                                 |  16 +-
 include/exec/memory.h                         |  26 +++
 include/hw/acpi/acpi_aml_interface.h          |   3 +
 include/hw/acpi/acpi_dev_interface.h          |   3 +-
 include/hw/acpi/pci.h                         |   4 +
 include/hw/i386/intel_iommu.h                 |  38 +++-
 include/hw/i386/microvm.h                     |   5 +-
 include/hw/i386/pc.h                          |   6 +-
 include/hw/isa/isa.h                          |   1 -
 include/hw/nvram/fw_cfg.h                     |   9 +
 include/hw/pci/pci.h                          |   2 +-
 include/hw/pci/pcie_port.h                    |   3 +-
 hw/acpi/acpi-x86-stub.c                       |   5 +-
 hw/acpi/acpi_interface.c                      |  10 +
 hw/acpi/cpu.c                                 |   3 +-
 hw/acpi/pci-bridge-stub.c                     |  20 ++
 hw/acpi/pci-bridge.c                          |  27 +++
 hw/acpi/pcihp.c                               |  35 +--
 hw/acpi/piix4.c                               |   5 +-
 hw/arm/smmu-common.c                          |   3 +-
 hw/core/machine.c                             |   1 +
 hw/i2c/smbus_ich9.c                           |   5 +-
 hw/i386/acpi-build.c                          | 301 +++++++++++++++-----------
 hw/i386/acpi-common.c                         |   7 +-
 hw/i386/acpi-microvm.c                        |   3 +-
 hw/i386/microvm.c                             |  15 +-
 hw/i386/pc_q35.c                              |   5 +-
 hw/i386/x86.c                                 |  52 +++--
 hw/isa/isa-bus.c                              |  10 -
 hw/isa/lpc_ich9.c                             |   5 +-
 hw/isa/piix3.c                                |   5 +-
 hw/nvram/fw_cfg.c                             |   9 +
 hw/pci-bridge/gen_pcie_root_port.c            |   7 +-
 hw/pci-bridge/pci_bridge_dev.c                |   1 -
 hw/pci-host/grackle.c                         |   2 +-
 hw/pci-host/raven.c                           |   6 +-
 hw/pci-host/uninorth.c                        |  33 +--
 hw/pci/pci.c                                  |   2 +-
 hw/pci/pci_bridge.c                           |  14 ++
 hw/pci/pcie.c                                 |   6 +-
 hw/pci/pcie_port.c                            |   3 +-
 hw/pci/shpc.c                                 |   7 +
 hw/virtio/vhost-user.c                        | 104 +--------
 hw/virtio/virtio-iommu.c                      |   3 +-
 tests/qtest/bios-tables-test.c                | 161 ++++++++++----
 tests/qtest/boot-sector.c                     |   6 +-
 tests/qtest/libqtest.c                        |   4 +
 hw/acpi/Kconfig                               |   4 +
 hw/acpi/meson.build                           |   4 +-
 hw/i386/Kconfig                               |   1 +
 tests/data/acpi/pc/DSDT                       | Bin 6458 -> 6360 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6418 -> 6283 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7783 -> 7685 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 9532 -> 12487 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6922 -> 6824 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8112 -> 8014 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6418 -> 6289 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3064 -> 3081 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6530 -> 6432 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7817 -> 7719 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6316 -> 6218 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6464 -> 6366 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 6656 -> 9745 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8310 -> 8252 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8327 -> 8269 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9635 -> 9577 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8589 -> 8531 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8356 -> 8298 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11439 -> 11481 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32450 -> 32392 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8774 -> 8716 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9636 -> 9578 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9964 -> 9906 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8385 -> 8327 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8398 -> 8340 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8327 -> 8269 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9669 -> 9611 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9440 -> 9382 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 8630 -> 12337 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8168 -> 8110 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8316 -> 8258 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8411 -> 8353 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8916 -> 8858 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8942 -> 8884 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9419 -> 9361 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35673 -> 35615 bytes
 86 files changed, 611 insertions(+), 399 deletions(-)
 create mode 100644 hw/acpi/pci-bridge-stub.c
 create mode 100644 hw/acpi/pci-bridge.c


