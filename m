Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB7428BE9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:25:01 +0200 (CEST)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtQS-0004E1-F7
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNF-0001TT-W5
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:28236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNB-0007q1-1c
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225624838"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225624838"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 04:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490432096"
Received: from icx-2s.bj.intel.com ([10.240.193.41])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 04:21:27 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] SGX NUMA support
Date: Mon, 11 Oct 2021 19:15:48 +0800
Message-Id: <20211011111554.12403-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The basic SGX patches were merged into Qemu release, the left NUMA
function for SGX should be enabled. The patch1 implemented the SGX NUMA
ACPI to enable NUMA in the SGX guest. Since Libvirt need detailed host
SGX EPC sections info to decide how to allocate EPC sections for SGX NUMA
guest, the SGXEPCSection list is introduced to show detailed sections info
in the monitor or HMP interface.

Please help review this patchset, the link also can be found:
https://github.com/intel/qemu-sgx upstream


Yang Zhong (6):
  numa: Enable numa for SGX EPC sections
  monitor: Support 'info numa' command
  numa: Add SGXEPCSection list for multiple sections
  monitor: numa support for 'info sgx' command
  numa: Enable numa for libvirt interface
  doc: Add the SGX numa description

 docs/system/i386/sgx.rst  | 31 +++++++++++++--
 qapi/machine.json         |  6 ++-
 qapi/misc-target.json     | 19 ++++++++-
 include/hw/i386/sgx-epc.h |  3 ++
 hw/core/numa.c            |  6 +++
 hw/i386/acpi-build.c      |  4 ++
 hw/i386/sgx-epc.c         |  3 ++
 hw/i386/sgx.c             | 84 +++++++++++++++++++++++++++++++++++----
 monitor/hmp-cmds.c        |  1 +
 target/i386/monitor.c     | 11 ++++-
 qemu-options.hx           |  4 +-
 11 files changed, 154 insertions(+), 18 deletions(-)


