Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DCC5E626D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 14:31:46 +0200 (CEST)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLMa-0007l6-Ns
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 08:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1obLDW-0001my-O6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:22:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:16852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1obLDT-0000uP-I5
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663849327; x=1695385327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+6JozoI5zYvQ1c+pDUu/FHW//91sC1MCfk6HYCm9R10=;
 b=cbBeImdm6yysNYucwkgMunvBqI3hB/JXCUNgFDpo7YJGwqM7MjGwRV6B
 GQdePynsVu5IEgMeQJxMQ3M0mICgBsZgDaQcpGrwP0xGXYS3q67XXXWZC
 +IvJ86wcR8v6mzO7boplM4vlFRhoy2vJ9kqzxy8ZO5vwyuzbDLMYe9gcE
 LEpoUJpqf126oVLVj+0ZeKkjwsBRq8FX91tThccC0vKb7mLhre0mppI2J
 2/bgcwpa037IZSJWnSfVf3AQ4nQy/kJIwZCeofT18HYe2rQInEaan2bN5
 OgDQLZHz0SWsZw+ITonCKy8CUZf+X/EBeDx1JROZ6pUfOx9rCXbXZNVq3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301128360"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301128360"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 05:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="795063185"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 05:22:02 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v4 0/5] Support ACPI NVDIMM Label Methods
Date: Thu, 22 Sep 2022 20:21:50 +0800
Message-Id: <20220922122155.1326543-1-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
v3 --> v4:
Use more LocalX in ASL functions, instead of global scope variables.

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

 hw/acpi/nvdimm.c                 | 106 +++++++++++++++++++++++++++++--
 tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 1815 bytes
 tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 1815 bytes
 3 files changed, 100 insertions(+), 6 deletions(-)


base-commit: 6338c30111d596d955e6bc933a82184a0b910c43
-- 
2.31.1


