Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19B5A8BEE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 05:31:08 +0200 (CEST)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTav5-0004Ac-FR
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 23:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTaro-0008RP-HC
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:17689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTarl-0007uc-Ux
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662002861; x=1693538861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XbvVMoekPwTCxZxCr293gg/bX+0S/GaA5ECQoGNUy3c=;
 b=SbHN5OSRR2pCp/vhYM/hzSLxplokmh8YvSnzY1FnlA9Kj7pHYfkqxmo0
 Aa56dMKqaHx2r96yIL/HOLY7fcMS8o7Lx1HJSlXyFN6Abzopk04DPJHzS
 F5EDEQF0UdLoVqZavAOQy1NWWaGzZdmsSpzz9pOrJ2Jtn03V+Eo4Bl8K2
 SlJW33Jqx/tK6hCPzxhYclmO4zywA4OHAwE6Cs5CHciEOw8MqoyitJZbr
 cEwLVlnjdH3vnNaKEF+qqiIX0XVijkdvaZXwBfjHwFFYUCmMOiZeZ1my9
 nFhL7RaILftkNYa1B2vv9P4v4bAXN81qGEvWUuRyuMOrysUROU04+XiHk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275353996"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275353996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 20:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642142670"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 20:27:26 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v3 0/5] Support ACPI NVDIMM Label Methods
Date: Thu,  1 Sep 2022 11:27:16 +0800
Message-Id: <20220901032721.1392482-1-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

Originally NVDIMM Label methods was defined in Intel PMEM _DSM Interface
Spec [1], of function index 4, 5 and 6.
Recent ACPI spec [2] has deprecated those _DSM methods with ACPI NVDIMM
Label Methods _LS{I,R,W}. The essence of these functions has no changes.

This patch set is to update QEMU emulation on this, as well as update
bios-table-test golden binaries.

[1] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
[2] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf

---
Change Log:
v2 --> v3:
Patch of nvdimm_debug() --> qemu trace, has been separated and already
upstream'ed.
Patch of accepting _DSM rev.2 is dropped, as unnecessary.
Roll back implementation to the idea of simply wrapper _DSM.

v1 --> v2:
Almost rewritten
Separate Patch 2
Dance with tests/qtest/bios-table-tests
Add trace event

Robert Hoo (5):
  tests/acpi: allow SSDT changes
  acpi/ssdt: Fix aml_or() and aml_and() in if clause
  acpi/nvdimm: define macro for NVDIMM Device _DSM
  acpi/nvdimm: Implement ACPI NVDIMM Label Methods
  test/acpi/bios-tables-test: SSDT: update golden master binaries

 hw/acpi/nvdimm.c                 | 102 +++++++++++++++++++++++++++++--
 tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 1893 bytes
 tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 1893 bytes
 3 files changed, 96 insertions(+), 6 deletions(-)

-- 
2.31.1


