Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9804B5431FE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:56:16 +0200 (CEST)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywAR-0003pC-Dj
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw84-0000tt-PO
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw81-0004Iu-Ko
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iDNcMP1lbTW01PoxC8krXW47dVMrJboufP98P8K/Vqw=;
 b=SSall1TRcPRizgmlKsSeh75ZQkpFardNTpMgXDksG6zxm+vyEfmTWJAYmjjR79LTU8xbxt
 sfiIXYpwSU5fsXoXZ47FvYKzZEe+0DHTAoP+dpK0V0TdsRFdDc4lTlXKukgB+OX3UB8RC6
 PyVL8ubbwUlw56QHuvGEKyAUPpbAXa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-KryrcVdlMKOaQnfVZRvDiA-1; Wed, 08 Jun 2022 09:53:42 -0400
X-MC-Unique: KryrcVdlMKOaQnfVZRvDiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56D60811E83
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2690C28117;
 Wed,  8 Jun 2022 13:53:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com
Subject: [PATCH v2 00/35] pc/q35: refactor ISA and SMBUS AML generation
Date: Wed,  8 Jun 2022 09:53:05 -0400
Message-Id: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Changelog:
  since v1:
    * add tis 2.0  clarification to commit message (Ani Sinha)
    * rebase on top of pci tree
    * pick up acks

Series is excerpt form larger refactoring that does
the same for PCI devices, but it's too large at this
point, so I've split off a relatively self-contained
ISA/SMBUS patches into a smaller separate series, and
PCI refactoring will follow up on top of this series
using the same AcpiDevAmlIf interface.

Series consolidates and unifies how pc/q35 machine
generates AML for ISA and SMBUS devices. It adds
a new more generic interface 'AcpiDevAmlIf' that
replaces ISA specific ISADeviceClass::build_aml
hook and should allow to use the same approach
(i.e. ask a device to provide its own AML) but
not limited to ISA bus.
Series applies AcpiDevAmlIf interface to a few
ISA devices that were already using
ISADeviceClass::build_aml and to devices /tpm,
applesmc,pvpanic,ipmi/ that were generated in
custom way. The AML generation for the later
class is normalized to behave like any other
ISA device that were using ISADeviceClass::build_aml
and converted to interface 'AcpiDevAmlIf'.
It simplifies process of building DSDT and
eliminates custom probing/wiring for those devices
as AML for them is generated at the time ISA/SMBUS
is enumerated.

Changes to DSDT tables QEMU generates are mostly
contextual where devices scattered across DSDT
are consolidated under respective device that
hosts bus they are attached to.

PS:
 + series adds several ACPI tests for devices
   that were missing them.

Igor Mammedov (35):
  acpi: add interface to build device specific AML
  acpi: make isa_build_aml() support AcpiDevAmlIf interface
  acpi: fdc-isa: replace ISADeviceClass::build_aml with
    AcpiDevAmlIfClass:build_dev_aml
  acpi: parallel port: replace ISADeviceClass::build_aml with
    AcpiDevAmlIfClass:build_dev_aml
  acpi: serial-is: replace ISADeviceClass::build_aml with
    AcpiDevAmlIfClass:build_dev_aml
  acpi: mc146818rtc: replace ISADeviceClass::build_aml with
    AcpiDevAmlIfClass:build_dev_aml
  acpi: pckbd: replace ISADeviceClass::build_aml with
    AcpiDevAmlIfClass:build_dev_aml
  isa-bus: drop no longer used ISADeviceClass::build_aml
  tests: acpi: add and whitelist DSDT.ipmismbus expected blob
  tests: acpi: q35: add test for smbus-ipmi device
  tests: acpi: update expected blob DSDT.ipmismbus
  tests: acpi: whitelist DSDT.ipmismbus expected blob
  ipmi: acpi: use relative path to resource source
  tests: acpi: update expected DSDT.ipmismbus blob
  acpi: ich9-smb: add support for AcpiDevAmlIf interface
  acpi: ipmi: use AcpiDevAmlIf interface to build IPMI device
    descriptors
  q35: acpi: drop not needed PCMachineClass::do_not_add_smb_acpi
  tests: acpi: white-list to be re-factored pc/q35 DSDT
  acpi: pc: isa bridge: use AcpiDevAmlIf interface to build ISA device
    descriptors
  acpi: q35: isa bridge: use AcpiDevAmlIf interface to build ISA device
    descriptors
  tests: acpi: update expected blobs
  tests: acpi: add and white-list DSDT.applesmc expected blob
  tests: acpi: add applesmc testcase
  acpi: applesmc: use AcpiDevAmlIfClass:build_dev_aml to provide
    device's AML
  tests: acpi: update expected blobs
  tests: acpi: white-lists expected DSDT.pvpanic-isa blob
  tests: acpi: add pvpanic-isa: testcase
  acpi: pvpanic-isa: use AcpiDevAmlIfClass:build_dev_aml to provide
    device's AML
  tests: acpi: update expected DSDT.pvpanic-isa blob
  tests: acpi: white-list DSDT.tis.tpm2/DSDT.tis.tpm12 expected blobs
  acpi: pc/q35: tpm-tis: fix TPM device scope
  acpi: pc/q35: remove not needed 'if' condition on pci bus
  acpi: tpm-tis: use AcpiDevAmlIfClass:build_dev_aml to provide device's
    AML
  tests: acpi: update expected DSDT.tis.tpm2/DSDT.tis.tpm12 blobs
  x86: acpi-build: do not include hw/isa/isa.h directly

 include/hw/acpi/acpi_aml_interface.h  |  40 ++++++
 include/hw/acpi/ipmi.h                |   9 +-
 include/hw/i386/pc.h                  |   1 -
 include/hw/isa/isa.h                  |  15 ---
 include/hw/misc/pvpanic.h             |   9 --
 hw/acpi/acpi_interface.c              |   8 ++
 hw/acpi/ipmi-stub.c                   |   2 +-
 hw/acpi/ipmi.c                        |  53 +++-----
 hw/acpi/meson.build                   |   2 +-
 hw/block/fdc-isa.c                    |  16 ++-
 hw/char/parallel.c                    |  14 ++-
 hw/char/serial-isa.c                  |  14 ++-
 hw/i2c/smbus_ich9.c                   |  15 +++
 hw/i386/acpi-build.c                  | 171 ++++++--------------------
 hw/i386/pc_piix.c                     |   1 -
 hw/i386/pc_q35.c                      |   1 -
 hw/input/pckbd.c                      |  14 ++-
 hw/ipmi/isa_ipmi_bt.c                 |   4 +
 hw/ipmi/isa_ipmi_kcs.c                |   4 +
 hw/ipmi/smbus_ipmi.c                  |   4 +
 hw/isa/isa-bus.c                      |   9 +-
 hw/isa/lpc_ich9.c                     |  19 +++
 hw/isa/piix3.c                        |  17 +++
 hw/misc/applesmc.c                    |  29 +++++
 hw/misc/pvpanic-isa.c                 |  42 +++++++
 hw/rtc/mc146818rtc.c                  |  14 ++-
 hw/tpm/tpm_tis_isa.c                  |  32 +++++
 tests/data/acpi/pc/DSDT               | Bin 6002 -> 5987 bytes
 tests/data/acpi/pc/DSDT.acpierst      | Bin 5969 -> 5954 bytes
 tests/data/acpi/pc/DSDT.acpihmat      | Bin 7327 -> 7312 bytes
 tests/data/acpi/pc/DSDT.bridge        | Bin 8668 -> 8653 bytes
 tests/data/acpi/pc/DSDT.cphp          | Bin 6466 -> 6451 bytes
 tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7656 -> 7641 bytes
 tests/data/acpi/pc/DSDT.hpbridge      | Bin 5969 -> 5954 bytes
 tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3084 -> 3069 bytes
 tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6074 -> 6059 bytes
 tests/data/acpi/pc/DSDT.memhp         | Bin 7361 -> 7346 bytes
 tests/data/acpi/pc/DSDT.nohpet        | Bin 5860 -> 5845 bytes
 tests/data/acpi/pc/DSDT.numamem       | Bin 6008 -> 5993 bytes
 tests/data/acpi/pc/DSDT.roothp        | Bin 6210 -> 6195 bytes
 tests/data/acpi/q35/DSDT              | Bin 8289 -> 8274 bytes
 tests/data/acpi/q35/DSDT.acpierst     | Bin 8306 -> 8291 bytes
 tests/data/acpi/q35/DSDT.acpihmat     | Bin 9614 -> 9599 bytes
 tests/data/acpi/q35/DSDT.applesmc     | Bin 0 -> 8320 bytes
 tests/data/acpi/q35/DSDT.bridge       | Bin 11003 -> 10988 bytes
 tests/data/acpi/q35/DSDT.cphp         | Bin 8753 -> 8738 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9943 -> 9928 bytes
 tests/data/acpi/q35/DSDT.ipmibt       | Bin 8364 -> 8349 bytes
 tests/data/acpi/q35/DSDT.ipmismbus    | Bin 0 -> 8363 bytes
 tests/data/acpi/q35/DSDT.ivrs         | Bin 8306 -> 8291 bytes
 tests/data/acpi/q35/DSDT.memhp        | Bin 9648 -> 9633 bytes
 tests/data/acpi/q35/DSDT.mmio64       | Bin 9419 -> 9404 bytes
 tests/data/acpi/q35/DSDT.multi-bridge | Bin 8583 -> 8568 bytes
 tests/data/acpi/q35/DSDT.nohpet       | Bin 8147 -> 8132 bytes
 tests/data/acpi/q35/DSDT.numamem      | Bin 8295 -> 8280 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 0 -> 8375 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8900 -> 8880 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8921 -> 8906 bytes
 tests/data/acpi/q35/DSDT.viot         | Bin 9398 -> 9383 bytes
 tests/data/acpi/q35/DSDT.xapic        | Bin 35652 -> 35637 bytes
 tests/qtest/bios-tables-test.c        |  40 ++++++
 61 files changed, 360 insertions(+), 239 deletions(-)
 create mode 100644 include/hw/acpi/acpi_aml_interface.h
 create mode 100644 tests/data/acpi/q35/DSDT.applesmc
 create mode 100644 tests/data/acpi/q35/DSDT.ipmismbus
 create mode 100644 tests/data/acpi/q35/DSDT.pvpanic-isa

-- 
2.31.1


