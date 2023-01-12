Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F9667870
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBR-0002N7-7R; Thu, 12 Jan 2023 09:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-00026M-3p
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB0-0005qs-KJ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0XrnNl/CbP9K13wWNBo6B/IL2n2tVQBWG6TmGdQZ9t0=;
 b=Q1D8EXF3Eusgsxsi/o+a4pw3bWY4IQgmOCohwe2HUZa7g/zld0zBmVpj7RgJEJOj0dWn03
 QPryywDdKT2dK+ymPEo41Ti1k3dV9vuOsUz8jscoBilK9gs71eepKOYDjo84Vzrb8szTQH
 15hcd2gdyjj5yKIC+CuVLIxqbUr0l+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-bpnZgniEMxayHywPeQb8Tw-1; Thu, 12 Jan 2023 09:03:15 -0500
X-MC-Unique: bpnZgniEMxayHywPeQb8Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A896118F026F;
 Thu, 12 Jan 2023 14:03:14 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19CAF4085721;
 Thu, 12 Jan 2023 14:03:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 00/40] x86: fixing and cleaning up ACPI PCI code part 3
Date: Thu, 12 Jan 2023 15:02:32 +0100
Message-Id: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

Series continues refactoring on top of [1].

It focuses on isolating creation of non hotplug and
hotplug slot descriptions. In state it's posted, it's
not complete, but pretty close to it. The series contains
stable patches from refactoring and is already too large
to keep it to myself, hence I'm publishing it fro review.

It will be followed by separate series on top of this one,
that will finish concrete feature[s] in following order:
   1 introduce acpi-index support for non-hotpluggable PCI
     devices (i.e. NICs directly attached to Q35 host-bridge)
     making acpi-index support complete within pc/q35 machines.
   2 let guest OS to re-arrange bridge resources when ACPI PCI
     hotplug is enabled. (should fix insuficient resources issue
     during PCI hotplug)
   3 finish isolating hotplug code from non-hotplug one,
     which should allow to re-use non-hotplug parts in other
     machines (arm/virt and microvm) and bring acpi-index
     support there.

PS:
Refactoring also adds testing for various corner cases
and fixes (present/latent/imagined) bugs where they were
spotted.

1) "[PATCH 00/11] x86: clean up ACPI PCI code part 2"
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg915493.html

CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Ani Sinha <ani@anisinha.ca>

Igor Mammedov (40):
  tests: qtest: print device_add error before failing test
  tests: acpi: cleanup arguments to make them more readable
  tests: acpi: whitelist DSDT blobs for tests that use pci-bridges
  tests: acpi: extend pcihp with nested bridges
  tests: acpi: update expected blobs
  tests: acpi: cleanup use_uefi argument usage
  pci_bridge: remove whitespace
  x86: acpi: pcihp: clean up duplicate bridge_in_acpi assignment
  pci: acpi hotplug: rename x-native-hotplug to
    x-do-not-expose-native-hotplug-cap
  pcihp: piix4: do not call acpi_pcihp_reset() when ACPI PCI hotplug is
    disabled
  pci: acpihp: assign BSEL only to coldplugged bridges
  x86: pcihp: fix invalid AML PCNT calls to hotplugged bridges
  tests: boot_sector_test: avoid crashing if status is not available yet
  tests: acpi: extend bridge tests with hotplugged bridges
  tests: boot_sector_test(): make it multi-shot
  tests: acpi: add reboot cycle to bridge test
  tests: acpi: whitelist DSDT before refactoring acpi based PCI hotplug
    machinery
  pcihp: drop pcihp_bridge_en dependency when composing PCNT method
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT before refactoring acpi based PCI hotplug
    machinery
  pcihp: compose PCNT callchain right before its user _GPE._E01
  pcihp: do not put empty PCNT in DSDT
  tests: acpi: update expected blobs
  whitelist DSDT before adding endpoint devices to bridge testcases
  tests: acpi: add endpoint devices to bridges
  tests: acpi: update expected blobs
  x86: pcihp: acpi: prepare slot ignore rule to work with self
    describing bridges
  pci: acpi: wire up AcpiDevAmlIf interface to generic bridge
  pcihp: make bridge describe itself using
    AcpiDevAmlIfClass:build_dev_aml
  pci: make sure pci_bus_is_express() won't error out with  "discards
    ‘const’ qualifier"
  pcihp: isolate rule whether slot should be described in DSDT
  tests: acpi: whitelist DSDT before decoupling PCI hotplug code from
    basic slots description
  pcihp: acpi: decouple hotplug and generic slots description
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT blobs before removing dynamic _DSM on
    coldplugged bridges
  pcihp: acpi: ignore coldplugged bridges when composing hotpluggable
    slots
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT before moving non-hotpluggble slots
    description from hotplug path
  pcihp: generate populated non-hotpluggble slot descriptions on
    non-hotplug path
  tests: acpi: update expected blobs

 include/hw/acpi/pci.h                         |   4 +
 include/hw/pci/pci.h                          |   2 +-
 include/hw/pci/pcie_port.h                    |   3 +-
 hw/acpi/Kconfig                               |   4 +
 hw/acpi/meson.build                           |   4 +-
 hw/acpi/pci-bridge-stub.c                     |  20 ++
 hw/acpi/pci-bridge.c                          |  27 ++
 hw/acpi/pcihp.c                               |  35 ++-
 hw/acpi/piix4.c                               |   4 +-
 hw/i386/Kconfig                               |   1 +
 hw/i386/acpi-build.c                          | 279 ++++++++++--------
 hw/i386/pc_q35.c                              |   5 +-
 hw/pci-bridge/gen_pcie_root_port.c            |   7 +-
 hw/pci-bridge/pci_bridge_dev.c                |   1 -
 hw/pci/pci.c                                  |   2 +-
 hw/pci/pci_bridge.c                           |  14 +
 hw/pci/pcie.c                                 |   6 +-
 hw/pci/pcie_port.c                            |   3 +-
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
 tests/qtest/bios-tables-test.c                | 144 ++++++---
 tests/qtest/boot-sector.c                     |   6 +-
 tests/qtest/libqtest.c                        |   4 +
 57 files changed, 394 insertions(+), 181 deletions(-)
 create mode 100644 hw/acpi/pci-bridge-stub.c
 create mode 100644 hw/acpi/pci-bridge.c

-- 
2.31.1


