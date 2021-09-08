Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F140361B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:29:00 +0200 (CEST)
Received: from localhost ([::1]:60960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNsx1-0002Vb-AO
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstZ-0002qP-9y
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:13016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstS-0003pF-D9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220102688"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220102688"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 01:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538450847"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2021 01:25:11 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] The HMP/QMP interfaces in Qemu SGX
Date: Wed,  8 Sep 2021 16:19:30 +0800
Message-Id: <20210908081937.77254-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset supply HMP/QMP interfaces to monitor and Libvirt, with
those interfaces, we can check the SGX info from VM side or check
host SGX capabilities from Libvirt side.

This patchset is splitted from below link(from patch26 to patch30):
https://patchew.org/QEMU/20210719112136.57018-1-yang.zhong@intel.com/

The reset are being pulled by Paolo's gitlab:
https://gitlab.com/bonzini/qemu.git tags/for-upstream

This new patchset based on <20210907071349.116329-1-pbonzini@redhat.com>, and
you can check the patches from below link:
https://github.com/intel/qemu-sgx.git monitor

As for the qtest/test-hmp test issue in last PULL, this release has fixed this issue.

Changelog:
=========
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


Yang Zhong (7):
  qmp: Add query-sgx command
  hmp: Add 'info sgx' command
  i386: Add sgx_get_info() interface
  bitops: Support 32 and 64 bit mask macro
  qmp: Add the qmp_query_sgx_capabilities()
  monitor: Fix coredump issue in non-x86 platform
  pc: Cleanup the SGX definitions

 hmp-commands-info.hx         | 15 ++++++
 hw/i386/sgx.c                | 93 ++++++++++++++++++++++++++++++++++++
 include/hw/i386/pc.h         | 11 +++--
 include/hw/i386/sgx.h        | 12 +++++
 include/monitor/hmp-target.h |  1 +
 include/qemu/bitops.h        |  7 +++
 qapi/misc-target.json        | 61 +++++++++++++++++++++++
 target/i386/monitor.c        | 41 ++++++++++++++++
 tests/qtest/qmp-cmd-test.c   |  2 +
 9 files changed, 238 insertions(+), 5 deletions(-)
 create mode 100644 include/hw/i386/sgx.h


