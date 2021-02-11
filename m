Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1332318565
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 07:53:37 +0100 (CET)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA5r6-0003rq-SV
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 01:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mG-00021B-4l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:36 -0500
Received: from mga05.intel.com ([192.55.52.43]:61290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mC-00086Q-7B
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:35 -0500
IronPort-SDR: X9pEAg5YJxrQyxVR60g7CdiKvQ+qAmRNw/tECWkb0ir/4j3eLrgnrrHvxRqkRhMb6Y7aTf1hm0
 p7ZGZppVhvNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="267042556"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="267042556"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:23 -0800
IronPort-SDR: Wfdjd9/rlDS7pAxLfy3E+2bubO13Ou+XyqgFcqSlz+LKJhxkEqtUW2coeeHYAcUTgExj9VYzRx
 7a6HIKobOu8g==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="397140029"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:23 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v3 00/10] ACPI related fixes to comform the spec better
Date: Wed, 10 Feb 2021 22:46:36 -0800
Message-Id: <cover.1613025709.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Miscellaneous bug fixes related to ACPI to play nice with guest BIOSes/OSes
by conforming to ACPI spec better.

Changes from v2:
- improved commit message
- introduced compat property x-smm-compat-5
- _CRS for MMCONFIG resource, read MMCONFIG info from qemu, generate resource
  instead of dynamically reading chipset configuration.

Changes from v1:
- fixed style issue with fixes to checkpatch.pl
- fixed make check breakage
- added ACPI table tests
- update comment message to include acpi table diff

Isaku Yamahata (9):
  checkpatch: don't emit warning on newly created acpi data files
  qtest: update tests/qtest/bios-tables-test-allowed-diff.h
  i386: add properoty, x-smm-compat-5, to keep compatibility of SMM
  acpi/core: always set SCI_EN when SMM isn't supported
  acpi: set fadt.smi_cmd to zero when SMM is not supported
  acpi: add test case for smm unsupported -machine smm=off
  hw/i386: declare ACPI mother board resource for MMCONFIG region
  acpi: add test case for -no-hpet
  qtest/acpi/bios-tables-test: update acpi tables

Sean Christopherson (1):
  i386: acpi: Don't build HPET ACPI entry if HPET is disabled

 hw/acpi/core.c                    |  20 ++++++++-
 hw/acpi/ich9.c                    |   2 +-
 hw/acpi/piix4.c                   |   3 +-
 hw/i386/acpi-build.c              |  72 +++++++++++++++++++++++++++---
 hw/i386/pc_piix.c                 |  10 +++--
 hw/i386/pc_q35.c                  |   1 +
 hw/i386/x86.c                     |  18 ++++++++
 hw/isa/vt82c686.c                 |   2 +-
 include/hw/acpi/acpi.h            |   4 +-
 include/hw/i386/x86.h             |   2 +
 scripts/checkpatch.pl             |   4 +-
 tests/data/acpi/q35/DSDT          | Bin 7801 -> 7892 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9126 -> 9217 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7819 -> 7910 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8265 -> 8356 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9455 -> 9546 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7876 -> 7967 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9160 -> 9251 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8932 -> 9023 bytes
 tests/data/acpi/q35/DSDT.nohpet   | Bin 0 -> 7750 bytes
 tests/data/acpi/q35/DSDT.nosmm    | Bin 0 -> 7892 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7807 -> 7898 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8407 -> 8498 bytes
 tests/data/acpi/q35/FACP.nosmm    | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test.c    |  24 ++++++++++
 25 files changed, 146 insertions(+), 16 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/DSDT.nosmm
 create mode 100644 tests/data/acpi/q35/FACP.nosmm

-- 
2.17.1


