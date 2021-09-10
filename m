Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E890D406A27
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 12:31:24 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdoa-00087M-0O
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 06:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOdmK-0005t1-TE
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:29:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOdmI-0002IY-7Z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 06:29:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201241621"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="201241621"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 03:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="540545513"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Sep 2021 03:28:49 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] The HMP/QMP interfaces in Qemu SGX
Date: Fri, 10 Sep 2021 18:22:55 +0800
Message-Id: <20210910102258.46648-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset supply HMP/QMP interfaces to monitor and Libvirt, with
those interfaces, we can check the SGX info from VM side or check
host SGX capabilities from Libvirt side.

This patchset is splitted from below link(from patch26 to patch30):
https://patchew.org/QEMU/20210719112136.57018-1-yang.zhong@intel.com/

The rest patches are being pulled by Paolo's below link and this new
patchset is based on it.
https://gitlab.com/bonzini/qemu.git tags/for-upstream

Changelog:
=========
v1-->v2:
  - Squashed patch1~patch3 to new patch1(Philippe).
  - Removed the bitops definitions patch, and used the MAKE_64BIT_MASK()
    to handle(Philippe).
  - Removed the 'Fix coredump issue in non-x86 platform' patch and new
    fix in the sgx_get_info()(Paolo).

Qemu SGX-->v1:
patch1~patch5:
  - Moved HMP/QMP from ./monitor to target/i386/monitor.c(Paolo)
  - Added one include/hw/i386/sgx.h to include APIs to avoid "TARGET_XXXX"
    poisoned issue in the ./qapi/qapi-types-misc-target.h.
  - Removed the stubs/sgx-stubs file for non-X86 build issues.
  - Moved the jason definitions from qapi/misc.jason to qapi/misc-target.json, and
    Changed version 6.1 to 6.2.
patch 6:
  - This new patch to fix coredump issue in non-x86 platform.
patch 7:
  - Pure cleanup patch, the issue was caused by cherry-pick tool.


Yang Zhong (3):
  monitor: Add HMP and QMP interfaces
  qmp: Add the qmp_query_sgx_capabilities()
  pc: Cleanup the SGX definitions

 hmp-commands-info.hx         | 15 ++++++
 hw/i386/sgx.c                | 95 ++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h         | 11 +++--
 include/hw/i386/sgx.h        | 12 +++++
 include/monitor/hmp-target.h |  1 +
 qapi/misc-target.json        | 61 +++++++++++++++++++++++
 target/i386/monitor.c        | 41 ++++++++++++++++
 tests/qtest/qmp-cmd-test.c   |  2 +
 8 files changed, 233 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/i386/sgx.h


