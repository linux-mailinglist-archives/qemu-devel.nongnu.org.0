Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FC56A861A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbO-0006Ew-1a; Thu, 02 Mar 2023 11:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbB-0006B3-0H
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlau-0000Ip-7M
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nMRL38P3ZdEHPgA12Yifxl37BLRORoyYRgs3RxaPTgE=;
 b=DXssUYpp4P5wP86za9vXsWASIuh1w6GFIMXiMHB4eklkek+D7+kUk1HQdJyrfQ2MLz6GP1
 AYWoJLORh7RkSeRejyN7pvbW6v6sc1E4iFwFaVhej4AoPN1r/e3ViceOsiP2NJyZJcvSoF
 iGDlOPb+cvdeOf7dCej593gLxkxvYxc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-MKdhpQiuPH6UYcs16vZJVw-1; Thu, 02 Mar 2023 11:15:46 -0500
X-MC-Unique: MKdhpQiuPH6UYcs16vZJVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15FE5187505F
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:15:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8287F140EBF6;
 Thu,  2 Mar 2023 16:15:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 00/34] pci(pc/q35): acpi-index support on non-hotpluggable
 slots
Date: Thu,  2 Mar 2023 17:15:09 +0100
Message-Id: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


Changelog:
  v2:
    * rebase on top mst's pull request
    * revert
        3aa50aa253 ("tests/qtest: Check for devices in bios-tables-test")
      which broke acpi tables test and rebuild due to skipping some tests
      even thought none of devices tests depend on weren't disabled
      that resulted in stale expected tables and merge conflicts.

Series extends acpi-index support to host-bridge(s) and bridges
with disabled hotplug (either explicitly or implicitly).
Whats new (it is still limited to 'pc' and 'q35' machines),
acpi-index now works for non-hotpluggable slots/nics:
 * q35: host-bridge
 * pc: host-bridge with disabled hotplug
       'PIIX4_PM.acpi-root-pci-hotplug=off'
 * non-hotpluggable multifunction nics
 * on non-hotpluggable slots with native hotplug (i.e. without ACPI PCI hotplug)
       PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off
       ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
     + pcie-root-port,hotplug=off | pci-bridge,shpc=off

where it doesn't work (and never will):
 * on hotplugged ports/bridges
 * on hotpluggable ports/bridges with native hotplug

1-12/34:  fixes for bugs or odd behavior
14-24/34: non-hotplug/multifunction acpi-index enabling
29-34/34: cleanups 
all of that is peppered by extra acpi tests or extensions to existing ones

Somewhat tested with RHEL9.0 and WS2022.

What's in queue:
 * PXB support 
 * microvm and arm/virt support
all of above only for non-hotpluggable slots as I don't really want to
pull there complicated APCI PCI hotplug.

gitlab tree: https://gitlab.com/imammedo/qemu/-/tree/acpi_index_non_hotplug_v2

Igor Mammedov (34):
  Revert "tests/qtest: Check for devices in bios-tables-test"
  tests: acpi: whitelist new q35.noacpihp test and pc.hpbrroot
  tests: acpi: add test_acpi_q35_tcg_no_acpi_hotplug test and extend
    test_acpi_piix4_no_acpi_pci_hotplug
  tests: acpi: update expected blobs
  tests: acpi: whitelist q35/DSDT.multi-bridge before extending testcase
  tests: acpi: extend multi-bridge case with case
    'root-port,id=HOHP,hotplug=off root-port,bus=NOHP'
  x86: pcihp: fix missing PCNT callchain when intermediate root-port has
    'hotplug=off' set
  tests: acpi: whitelist pc/DSDT.hpbrroot and pc/DSDT.hpbridge tests
  x86: pcihp: fix missing bridge AML when intermediate root-port has
    'hotplug=off' set
  tests: acpi: update expected blobs
  pcihp: piix4: do not redirect hotplug controller to piix4 when ACPI
    hotplug is disabled
  pci: fix 'hotplugglable' property behavior
  tests: acpi: whitelist DSDT blobs before isolating PCI _DSM func 0
    prolog
  pcihp: move PCI _DSM function 0 prolog into separate function
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT before adding EDSM method
  acpi: pci: add EDSM method to DSDT
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT before adding device with acpi-index to
    testcases
  tests: acpi: add device with acpi-index on non-hotpluggble bus
  acpi: pci: support acpi-index for non-hotpluggable devices
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT before exposing non zero functions
  acpi: pci: describe all functions on populated slots
  tests: acpi: update expected blobs
  tests: acpi: whitelist DSDT before adding non-0 function device with
    acpi-index to testcases
  tests: acpi: add non zero function device with acpi-index on
    non-hotpluggble bus
  tests: acpi: update expected blobs
  pci: move acpi-index uniqueness check to generic PCI device code
  acpi: pci: drop BSEL usage when deciding that device isn't
    hotpluggable
  acpi: pci: move BSEL into build_append_pcihp_slots()
  acpi: pci: move out ACPI PCI hotplug generator from generic slot
    generator build_append_pci_bus_devices()
  pcihp: move fields enabling hotplug into AcpiPciHpState
  pcihp: add ACPI PCI hotplug specific is_hotpluggable_bus() callback

 include/hw/acpi/ich9.h                        |   1 +
 include/hw/acpi/pcihp.h                       |  11 +-
 include/hw/acpi/piix4.h                       |   2 -
 include/hw/hotplug.h                          |   2 +
 include/hw/qdev-core.h                        |  13 +-
 hw/acpi/acpi-pci-hotplug-stub.c               |   9 +-
 hw/acpi/ich9.c                                |  21 +-
 hw/acpi/pci-bridge.c                          |  14 +-
 hw/acpi/pcihp.c                               | 112 +++--------
 hw/acpi/piix4.c                               |  33 ++--
 hw/i386/acpi-build.c                          | 179 +++++++++++++-----
 hw/isa/lpc_ich9.c                             |   1 +
 hw/pci/pci.c                                  |  57 ++++++
 hw/pci/pcie_port.c                            |   8 +
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
 tests/qtest/bios-tables-test.c                | 125 +++++-------
 52 files changed, 345 insertions(+), 243 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.noacpihp

-- 
2.39.1


