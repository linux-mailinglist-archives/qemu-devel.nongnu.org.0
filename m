Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518F31444F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:53:03 +0100 (CET)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GKz-0003o9-QD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYp-0006db-AL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:11 -0500
Received: from mga01.intel.com ([192.55.52.88]:31136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYm-0005DE-Pt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:10 -0500
IronPort-SDR: kRFNWwBPExUM5o8gRqwf9B/OR2eEJHOROFvOLRW6MvEPBy9mZ2XKFmhrILFZrBmkgGSbF8cb7B
 54iOSvi6hv1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="200852825"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="200852825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:04 -0800
IronPort-SDR: QOE4QLUkqZ4BTE3v2dh0ZG/Jz1oNjLnj2u8LRV6dnqy6swRnVGktGAu6Dqc/MZGPFUt448zbL2
 k7M8+cGwP11A==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="374688713"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:04 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 0/9] ACPI related fixes
Date: Mon,  8 Feb 2021 13:57:19 -0800
Message-Id: <cover.1612821108.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=isaku.yamahata@intel.com; helo=mga01.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Miscellaneous bug fixes related to ACPI to play nice with guest BIOSes/OSes
by conforming to ACPI spec better.

Changes from v1:
- fixed style issue with fixes to checkpatch.pl
- fixed make check breakage
- added ACPI table tests
- update comment message to include acpi table diff

Isaku Yamahata (8):
  checkpatch: don't emit warning on newly created acpi data files
  qtest: update tests/qtest/bios-tables-test-allowed-diff.h
  acpi/core: always set SCI_EN when SMM isn't supported
  acpi: set fadt.smi_cmd to zero when SMM is not supported
  acpi: add test case for smm unsupported -machine smm=off
  hw/i386: declare ACPI mother board resource for MMCONFIG region
  acpi: add test case for -no-hpet
  qtest/acpi/bios-tables-test: update acpi tables

Sean Christopherson (1):
  i386: acpi: Don't build HPET ACPI entry if HPET is disabled

 hw/acpi/core.c                    |  11 +-
 hw/acpi/ich9.c                    |   2 +-
 hw/acpi/piix4.c                   |   3 +-
 hw/i386/acpi-build.c              | 192 +++++++++++++++++++++++++++++-
 hw/isa/vt82c686.c                 |   2 +-
 include/hw/acpi/acpi.h            |   4 +-
 scripts/checkpatch.pl             |   4 +-
 tests/data/acpi/q35/DSDT          | Bin 7801 -> 8083 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9126 -> 9408 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7819 -> 8101 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8265 -> 8547 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9455 -> 9737 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7876 -> 8158 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9160 -> 9442 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8932 -> 9214 bytes
 tests/data/acpi/q35/DSDT.nohpet   | Bin 0 -> 7941 bytes
 tests/data/acpi/q35/DSDT.nosmm    | Bin 0 -> 8083 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7807 -> 8089 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8407 -> 8689 bytes
 tests/data/acpi/q35/FACP.nosmm    | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test.c    |  24 ++++
 21 files changed, 231 insertions(+), 11 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/DSDT.nosmm
 create mode 100644 tests/data/acpi/q35/FACP.nosmm

-- 
2.17.1


