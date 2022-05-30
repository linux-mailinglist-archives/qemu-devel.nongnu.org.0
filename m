Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98D5373C2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 05:43:40 +0200 (CEST)
Received: from localhost ([::1]:53144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvWJf-0007k5-Sw
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 23:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWH3-00051N-Dn
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:40:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:36555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWH0-0006wI-Gu
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653882054; x=1685418054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CIp123shuJ9jSGkbkSQfslRjoQh+ZV6BjSebqc+I8T8=;
 b=DZAb/cYOK44vaqjqmf/9htf0QphJHl7IOF6rjZi69MFyGLHlUk8xvWXW
 tkiPFCDLca8o/qGPfTC+tpBajwwCDIfBjojCKiZ9n3cQmBkI46hM6+F9C
 PD3rmoY09rOPsMw4UaocTdQVFNM78hQG9TT8+4dvHe48dmBIdtwAJ+n2t
 7J/hVm/sTiuBUZP7ahchzyO7HaAUKsLqU5S1SgCWvUf8YnQb69UQTl2Wi
 egfLVLVw/+szp/gV02sBEd17G+TZIiRgbErPIWW/SgYaixvGZWGLyIPpU
 /IcM5Alw04sAyAf1QI/+Zm9ag74gbmbPnEG9rUQ7gslVVEvIm3Cz3BkhG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274974832"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="274974832"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 20:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="528993764"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2022 20:40:48 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org,
	robert.hu@intel.com
Subject: [QEMU PATCH v2 0/6] Support ACPI NVDIMM Label Methods
Date: Mon, 30 May 2022 11:40:41 +0800
Message-Id: <20220530034047.730356-1-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=robert.hu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

(v1 Subject was "acpi/nvdimm: support NVDIMM _LS{I,R,W} methods")

Originally NVDIMM Label methods was defined in Intel PMEM _DSM Interface
Spec [1], of function index 4, 5 and 6.
Recent ACPI spec [2] has deprecated those _DSM methods with ACPI NVDIMM
Label Methods _LS{I,R,W}. The essence of these functions has no changes.

This patch set is to update QEMU emulation on this, as well as update
bios-table-test binaries, and substitute trace events for nvdimm_debug().

Patch 1 and 5, the opening and closing parenthesis patches for changes
affecting ACPI tables. Details see tests/qtest/bios-tables-test.c.
Patch 2, a trivial fix on aml_or()/aml_and() usage.
Patch 3, allow NVDIMM _DSM revision 2 to get in.
Patch 4, main body, which implements the virtual _LS{I,R,W} methods and
also generalize QEMU <--> ACPI NVDIMM method interface, which paves the way
for future necessary methods implementation, not only _DSM. The result
SSDT table changes in ASL can be found in Patch 5's commit message.
Patch 6, define trace events for acpi/nvdimm, replace nvdimm_debug()

Test
Tested Linux guest of recent Kernel 5.18.0-rc4, create/destroy
namespace, init labels, etc. works as before.
Tested Windows 10 (1607) guest, and Windows server 2019, but seems vNVDIMM
in Windows guest hasn't ever been supported. Before and after this patch
set, no difference on guest boot up and other functions.

[1] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf
[2] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf

---
Change Log:
v2:
Almost rewritten
Separate Patch 2
Dance with tests/qtest/bios-table-tests
Add trace events

Robert Hoo (6):
  tests/acpi: allow SSDT changes
  acpi/ssdt: Fix aml_or() and aml_and() in if clause
  acpi/nvdimm: NVDIMM _DSM Spec supports revision 2
  nvdimm: Implement ACPI NVDIMM Label Methods
  test/acpi/bios-tables-test: SSDT: update standard AML binaries
  acpi/nvdimm: Define trace events for NVDIMM and substitute
    nvdimm_debug()

 hw/acpi/nvdimm.c                 | 434 +++++++++++++++++++++++--------
 hw/acpi/trace-events             |  14 +
 include/hw/mem/nvdimm.h          |  12 +-
 tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 1829 bytes
 tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 1829 bytes
 5 files changed, 344 insertions(+), 116 deletions(-)


base-commit: 58b53669e87fed0d70903e05cd42079fbbdbc195
-- 
2.31.1


