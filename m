Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3F3CCC23
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 04:13:58 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5In6-0005Io-Tr
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 22:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1m5Ilb-00043R-6m
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 22:12:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:9487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1m5IlY-000469-U7
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 22:12:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="198181445"
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; d="scan'208";a="198181445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 19:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; d="scan'208";a="499560587"
Received: from icx-hcc-jingqi.sh.intel.com ([10.239.48.6])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2021 19:12:11 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: imammedo@redhat.com, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
Subject: [PATCH v2 0/1] nvdimm: add 'target-node' option
Date: Mon, 19 Jul 2021 10:01:52 +0800
Message-Id: <20210719020153.30574-1-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=jingqi.liu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jingqi Liu <jingqi.liu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel version 5.1 brings in support for the volatile-use of
persistent memory as a hotplugged memory region (KMEM DAX).
When this feature is enabled, persistent memory can be seen as a
separate memory-only NUMA node(s). This newly-added memory can be
selected by its unique NUMA node.

Add 'target-node' option for 'nvdimm' device to indicate this NUMA
node. It can be extended to a new node after all existing NUMA nodes.

Changelog:
    v2:
        - Per Igor's comments, adjust target node error handling,
          and make both 'node' and 'target-node' properties mutually exclusive.
          Create a callback of nvdimm_pre_plug() for checking
          whether the 'target-node' is correct.
    v1:
        - It's the initial version.

Jingqi Liu (1):
  nvdimm: add 'target-node' option

 docs/nvdimm.txt         | 93 +++++++++++++++++++++++++++++++++++++++++
 hw/acpi/nvdimm.c        | 18 ++++----
 hw/i386/acpi-build.c    | 12 +++++-
 hw/i386/pc.c            |  4 ++
 hw/mem/nvdimm.c         | 43 ++++++++++++++++++-
 include/hw/mem/nvdimm.h | 17 +++++++-
 util/nvdimm-utils.c     | 22 ++++++++++
 7 files changed, 198 insertions(+), 11 deletions(-)

-- 
2.21.3


