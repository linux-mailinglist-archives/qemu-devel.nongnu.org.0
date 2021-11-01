Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C613F44141F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 08:25:44 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhRhP-0004bW-GD
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 03:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mhRg5-0002j5-9h
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 03:24:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:18003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mhRg2-000280-Vh
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 03:24:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="211729004"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="211729004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 00:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="448855909"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2021 00:24:13 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] SGX NUMA support plus vepc reset
Date: Mon,  1 Nov 2021 12:20:04 -0400
Message-Id: <20211101162009.62161-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
patches were merged into tip tree master branch, please ref below link:
https://lore.kernel.org/all/20211021201155.1523989-1-pbonzini@redhat.com/
or the tip tree master branch.

Thanks!

Yang


Changes from V2:
- Updated the reset patch(patch 5), reduced to 2 pass.(Paolo)

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

 docs/system/i386/sgx.rst  |  31 +++++++--
 qapi/machine.json         |  10 ++-
 qapi/misc-target.json     |  19 +++++-
 include/hw/i386/sgx-epc.h |   3 +
 include/hw/i386/x86.h     |   1 +
 linux-headers/linux/kvm.h |   6 ++
 hw/core/numa.c            |   6 ++
 hw/i386/acpi-build.c      |   4 ++
 hw/i386/sgx-epc.c         |   3 +
 hw/i386/sgx.c             | 137 +++++++++++++++++++++++++++++++++++---
 hw/i386/x86.c             |   4 ++
 monitor/hmp-cmds.c        |   1 +
 qemu-options.hx           |   4 +-
 13 files changed, 211 insertions(+), 18 deletions(-)


