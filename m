Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A069420D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQE-0002tK-Rs; Mon, 13 Feb 2023 04:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPU-0001U7-Vw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:09 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPP-0002kj-7g
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281563; x=1707817563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mDVdyYem//hjkBSE+XAPySWoyseWNH8mXJMpF1YKf8=;
 b=g+kUUcG2DJ8+TxN4dWiJTfwwJQqUc6yhdCUT/Ai+BFatMCR0J2AV8xFL
 32DdJlUexuKsgkufPSD1Ka2x93PXQzhdMCTbu/0Gl5nYS8viJ1TUs8zMy
 VseBYiMIheqf+eBjDtSecXEH2wnCqDbhcFClaUVU0DVEaXl9uJa0znfyp
 mVNxhp/z4Qnz+9UMf91Qx2Ytz6h18IRnCoNHgBO7Ms98QfbebAOVE/aIW
 BbEUXJ+4RKmub3+9VwZGaIyPZTqWK+6KEegGxsYjy5A5oTkl9qHWiVzDU
 +P/XBHpuEY4QcNZOk8mk/8E1p+8RorB2qiDf5GbyWq4HEYmTRi9aaSbtT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487015"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487015"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760621"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760621"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:23 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 36/52] i386: Use init_apicid_topo_info() to initialize APIC ID
 topology for system emulator
Date: Mon, 13 Feb 2023 17:50:19 +0800
Message-Id: <20230213095035.158240-37-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

Since APIC ID for hybrid CPU topology needs to consider maximum possible
structures for each topology levels, the APIC IDs for hybrid CPU topology
and smp CPU topology may be different.

User emulator doesn't support hybrid CPU topology so use
init_apicid_topo_info() for system emulator.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 844b6df63a4a..7d6722ab3292 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -39,6 +39,7 @@
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
+#include "hw/i386/x86.h"
 #endif
 
 #include "disas/capstone.h"
@@ -5260,10 +5261,15 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     uint32_t signature[3];
     X86ApicidTopoInfo apicid_topo;
 
+#ifndef CONFIG_USER_ONLY
+    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
+    init_apicid_topo_info(&apicid_topo, x86ms);
+#else
     apicid_topo.max_dies = cs->topo.dies_per_socket;
     apicid_topo.max_modules = cs->topo.clusters_per_die;
     apicid_topo.max_cores = cs->topo.cores_per_cluster;
     apicid_topo.max_threads = cs->topo.threads_per_core;
+#endif
 
     /* Calculate & apply limits for different index ranges */
     if (index >= 0xC0000000) {
-- 
2.34.1


