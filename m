Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FAA6FBF7D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 08:46:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwH6B-00072I-7g; Tue, 09 May 2023 02:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin.wang@intel.com>)
 id 1pwH63-00071Z-4G
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:45:15 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin.wang@intel.com>)
 id 1pwH60-000295-9y
 for qemu-devel@nongnu.org; Tue, 09 May 2023 02:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683614712; x=1715150712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tk8+hs2Io1E5ccVro+AeHaDVJZSGYqGFtzF4XaltYlw=;
 b=hH0SaQPmdNKCbHTSvRwPjdtlfMIx3s1MwTE6tkhXeNDr46E273Z557Zk
 y/aqQS2lct7e30dbCTDV67fsfWCFlE/OvibQ4g1mcKvhfs1KaY7MJohGs
 5CussCaps6QbC7R5KSZgSuWFfh8WGTpaUik4sCG24iquv2BWaTGdUuO84
 wPRm+qvFgaWlf7mYua+zV/9X0SwtyVkxY72f31ylsSkYAoL1REhDFRGM7
 ZJ0AzE+hTk2flxR0Q4PGYEEHLsbeihwLGjOpKfnRgIHtXvLW7wU7URZmt
 iLWTT3hwPygOUloRleHJm/Q2B5HO01+moC2Sjpi2TGlhLShtFz7hxUiN6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="351989671"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="351989671"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028698054"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="1028698054"
Received: from yin-optiplex-7090.sh.intel.com ([10.239.160.32])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 23:45:04 -0700
From: Yin Wang <yin.wang@intel.com>
To: qemu-devel@nongnu.org
Cc: Yin Wang <yin.wang@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH] Fix QEMU crash caused when NUMA nodes exceed available CPUs
Date: Tue,  9 May 2023 14:44:52 +0800
Message-Id: <20230509064452.759834-1-yin.wang@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yin.wang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

command "qemu-system-riscv64 -machine virt
-m 2G -smp 1 -numa node,mem=1G -numa node,mem=1G"
would trigger this problem.
This commit fixes the issue by adding parameter checks.

Signed-off-by: Yin Wang <yin.wang@intel.com>
---
 hw/core/numa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d8..ff249369be 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -168,6 +168,13 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
     numa_info[nodenr].present = true;
     max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
     ms->numa_state->num_nodes++;
+    if (ms->smp.max_cpus < ms->numa_state->num_nodes) {
+        error_setg(errp,
+                   "Number of NUMA nodes:(%d)"
+                   " is larger than number of CPUs:(%d)",
+                   ms->numa_state->num_nodes, ms->smp.max_cpus);
+        return;
+    }
 }
 
 static
-- 
2.34.1


