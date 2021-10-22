Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9549437594
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:34:25 +0200 (CEST)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrsW-0003mI-SE
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqJ-00015O-63
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:5671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mdrqF-00008H-Cu
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:32:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="290113933"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="290113933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="595506362"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga004.jf.intel.com with ESMTP; 22 Oct 2021 03:31:55 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] SGX NUMA support plus vepc reset
Date: Fri, 22 Oct 2021 15:27:49 -0400
Message-Id: <20211022192754.58196-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, jarkko@kernel.org,
 eblake@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The basic SGX patches were merged into Qemu release, the left NUMA
function for SGX should be enabled. The patch1 implemented the SGX NUMA
ACPI to enable NUMA in the SGX guest. Since Libvirt need detailed host
SGX EPC sections info to decide how to allocate EPC sections for SGX NUMA
guest, the SGXEPCSection list is introduced to show detailed sections info
in the monitor or HMP interface.

This version also plus the vEPC reset support because the related kernel
patches are almost merged into kernel release, please ref below link:
https://lore.kernel.org/all/20211021201155.1523989-1-pbonzini@redhat.com/

Thanks!

Yang


Changes from V1:
- added documents for new members.(Eric)
- changed the "index" to "node" in struct SGXEPCSection.(Eric, Paolo)
- squashed the previous patch 4 and patch 5 into patch 3.(Paolo)
- added reset patch(patch 5) into this version.


Yang Zhong (5):
  numa: Enable numa for SGX EPC sections
  monitor: Support 'info numa' command
  numa: Support SGX numa in the monitor and Libvirt interfaces
  doc: Add the SGX numa description
  sgx: Reset the vEPC regions during VM reboot

 docs/system/i386/sgx.rst  |  31 ++++++--
 qapi/machine.json         |  10 ++-
 qapi/misc-target.json     |  19 ++++-
 include/hw/i386/sgx-epc.h |   3 +
 include/hw/i386/x86.h     |   1 +
 linux-headers/linux/kvm.h |   6 ++
 hw/core/numa.c            |   6 ++
 hw/i386/acpi-build.c      |   4 ++
 hw/i386/sgx-epc.c         |   3 +
 hw/i386/sgx.c             | 148 +++++++++++++++++++++++++++++++++++---
 hw/i386/x86.c             |   4 ++
 monitor/hmp-cmds.c        |   1 +
 qemu-options.hx           |   4 +-
 13 files changed, 222 insertions(+), 18 deletions(-)


