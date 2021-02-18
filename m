Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906031E5FB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 06:55:16 +0100 (CET)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcHT-0002Rj-I7
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 00:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFP-0000oi-4Q
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:07 -0500
Received: from mga14.intel.com ([192.55.52.115]:3984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFM-0003hQ-Ps
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:06 -0500
IronPort-SDR: hskZOTyHx/Z4pVuk3hMutljrJrFWKWayDqB8Hh6ULpCZ/YofWj1RQU2f9D19Y5xFBFbNJIkNUq
 hYsvbuk7e1+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="182617577"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="182617577"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:52:59 -0800
IronPort-SDR: gzoTvls8AV9zvAlP/p9GaPxXHNsaNiaf/aalCO0yLzetr6neBjAgAx6dLf1QUJ39KWBV2znPeY
 3WzH8JYIuUVg==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="593519207"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:52:59 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v5 00/10] ACPI related fixes to comform the spec better
Date: Wed, 17 Feb 2021 21:51:08 -0800
Message-Id: <cover.1613615732.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=isaku.yamahata@intel.com; helo=mga14.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Miscellaneous bug fixes related to ACPI to play nice with guest BIOSes/OSes
by conforming to ACPI spec better.

Changes from v4:
- rebased to 1af5629673
- move compat property from 3/10 to 4/10
- use the end of the address for rage maximum of memory region
- code simplification to generate _CRS

Changes from v3:
- rename compat property name to smm-compat and add it to ICH9-LPC and PIIX4_PM
- MMCFG memory region to use dword memory region when possible
- fix max base address of MMCFG memory region
- add more test cases with smm-compat=on and/or piix4

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
  ich9, piix4: add properoty, smm-compat, to keep compatibility of SMM
  acpi/core: always set SCI_EN when SMM isn't supported
  acpi: set fadt.smi_cmd to zero when SMM is not supported
  acpi: add test case for smm unsupported -machine smm=off
  hw/i386: declare ACPI mother board resource for MMCONFIG region
  acpi: add test case for -no-hpet
  qtest/acpi/bios-tables-test: update acpi tables

Sean Christopherson (1):
  i386: acpi: Don't build HPET ACPI entry if HPET is disabled

 hw/acpi/core.c                    |  11 +++-
 hw/acpi/ich9.c                    |   2 +-
 hw/acpi/piix4.c                   |   5 +-
 hw/core/machine.c                 |   5 +-
 hw/i386/acpi-build.c              |  72 +++++++++++++++++++--
 hw/isa/lpc_ich9.c                 |   1 +
 hw/isa/vt82c686.c                 |   2 +-
 include/hw/acpi/acpi.h            |   4 +-
 include/hw/acpi/ich9.h            |   1 +
 scripts/checkpatch.pl             |   4 +-
 tests/data/acpi/pc/DSDT.nohpet    | Bin 0 -> 4923 bytes
 tests/data/acpi/pc/FACP.nosmm     | Bin 0 -> 116 bytes
 tests/data/acpi/q35/DSDT          | Bin 7801 -> 7859 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9126 -> 9184 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7819 -> 7877 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8265 -> 8323 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9455 -> 9513 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7876 -> 7934 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9160 -> 9218 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8932 -> 8990 bytes
 tests/data/acpi/q35/DSDT.nohpet   | Bin 0 -> 7717 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7807 -> 7865 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8407 -> 8465 bytes
 tests/data/acpi/q35/FACP.nosmm    | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test.c    | 100 ++++++++++++++++++++++++++++++
 25 files changed, 194 insertions(+), 13 deletions(-)
 create mode 100644 tests/data/acpi/pc/DSDT.nohpet
 create mode 100644 tests/data/acpi/pc/FACP.nosmm
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/FACP.nosmm

-- 
2.17.1


