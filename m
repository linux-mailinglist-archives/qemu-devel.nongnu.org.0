Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2251E5701
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 07:49:44 +0200 (CEST)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeBQF-0001R5-JW
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 01:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jeBP9-0008HK-PH
 for qemu-devel@nongnu.org; Thu, 28 May 2020 01:48:35 -0400
Received: from mga02.intel.com ([134.134.136.20]:8378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jeBP7-0001Lm-JZ
 for qemu-devel@nongnu.org; Thu, 28 May 2020 01:48:35 -0400
IronPort-SDR: 3aKeMROrJxEVn/raDtz+migfbSD702yuWPbQdkuzpEy46Ij1E5z/GtaFKB6+hfcbI9MWOzdebP
 X+gDYMM6zc9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 22:48:29 -0700
IronPort-SDR: ydg+85n3sQn2niKs8BOwjhkeCBLIW3ANXvwkxQO4LdnbUjgR0lHKr1UbvhtLkmN4r/o+Mpn4SQ
 FCaWDtJXsNIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="255696212"
Received: from vverma7-mobl4.lm.intel.com ([10.251.137.143])
 by fmsmga007.fm.intel.com with ESMTP; 27 May 2020 22:48:28 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/3] account for NVDIMM nodes during SRAT generation
Date: Wed, 27 May 2020 23:48:04 -0600
Message-Id: <20200528054807.21278-1-vishal.l.verma@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vishal.l.verma@intel.com; helo=mga02.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:48:29
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jingqi.liu@intel.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v1:
- Use error_abort for getters (Igor)
- Free the device list (Igor)
- Refactor the NVDIMM related portion into hw/acpi/nvdimm.c (Igor)
- Rebase onto latest master
- Add Jingqi's Reviewed-by

On the command line, one can specify a NUMA node for NVDIMM devices. If
we set up the topology to give NVDIMMs their own nodes, i.e. not
containing any CPUs or regular memory, qemu doesn't populate SRAT memory
affinity structures for these nodes. However the NFIT does reference
those proximity domains.

As a result, Linux, while parsing the SRAT, fails to initialize node
related structures for these nodes, and they never end up in the
nodes_possible map. When these are onlined at a later point (via
hotplug), this causes problems.

I've followed the instructions in bios-tables-test.c to update the
expected SRAT binary, and the tests (make check) pass. Patches 1 and 3
are the relevant ones for the binary update.

Patch 2 is the main patch which changes SRAT generation.

Vishal Verma (3):
  diffs-allowed: add the SRAT AML to diffs-allowed
  hw/acpi-build: account for NVDIMM numa nodes in SRAT
  tests/acpi: update expected SRAT files

 hw/acpi/nvdimm.c                 |  26 ++++++++++++++++++++++++++
 hw/i386/acpi-build.c             |  10 ++++++++++
 include/hw/mem/nvdimm.h          |   1 +
 tests/data/acpi/pc/SRAT.dimmpxm  | Bin 392 -> 392 bytes
 tests/data/acpi/q35/SRAT.dimmpxm | Bin 392 -> 392 bytes
 5 files changed, 37 insertions(+)

-- 
2.26.2


