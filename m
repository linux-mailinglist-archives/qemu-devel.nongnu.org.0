Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B067C1BB36F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 03:29:55 +0200 (CEST)
Received: from localhost ([::1]:38338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTF4M-0000dk-AV
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 21:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vishal.l.verma@intel.com>) id 1jTF3A-0007Rc-CL
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 21:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <vishal.l.verma@intel.com>) id 1jTF39-0005V9-6Q
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 21:28:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:49886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vishal.l.verma@intel.com>)
 id 1jTF38-0005Tt-J2
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 21:28:38 -0400
IronPort-SDR: 4JZ5K4SPPeZLgmhbnQFXriuRoReV2fbXSTuRjEu+vvMRALZ72/SFiAS4CaKpi6kHjnGLiC4jV/
 C7Sw9zCqDHEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 18:28:27 -0700
IronPort-SDR: Thr4S/4uKIuWuMY90jDxh4rJaxPOq5zlaeyg7TcSBjMYh+esz5lVLGGV5Emv9ersoQWH1MiwOf
 /H7+lcp0O8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="249040056"
Received: from vverma7-mobl4.lm.intel.com ([10.254.191.96])
 by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2020 18:28:27 -0700
From: Vishal Verma <vishal.l.verma@intel.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/3] account for NVDIMM nodes during SRAT generation
Date: Mon, 27 Apr 2020 19:28:07 -0600
Message-Id: <20200428012810.10877-1-vishal.l.verma@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=vishal.l.verma@intel.com; helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 21:28:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 192.55.52.136
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
Cc: jingqi.liu@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

 hw/i386/acpi-build.c             |  20 ++++++++++++++++++++
 tests/data/acpi/pc/SRAT.dimmpxm  | Bin 392 -> 392 bytes
 tests/data/acpi/q35/SRAT.dimmpxm | Bin 392 -> 392 bytes
 3 files changed, 20 insertions(+)

-- 
2.25.4


