Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE9403619
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:28:50 +0200 (CEST)
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNswr-0002Cu-Cn
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstd-0002u8-3I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:13020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstb-0003r6-Dy
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220102709"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220102709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 01:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538450929"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2021 01:25:22 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] monitor: Fix coredump issue in non-x86 platform
Date: Wed,  8 Sep 2021 16:19:36 +0800
Message-Id: <20210908081937.77254-7-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210908081937.77254-1-yang.zhong@intel.com>
References: <20210908081937.77254-1-yang.zhong@intel.com>
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

The monitor will coredump if we use 'info sgx' in the '-machine none' or
other non-x86 platform, add the sgx_enabled bool variable to avoid this
coredump issue.

./qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm -monitor stdio
QEMU 6.1.50 monitor - type 'help' for more information
(qemu) info sgx
/home/vmm/project/upstream/9-8/qemu/include/hw/i386/x86.h:93:X86_MACHINE: Object 0x5615d71a6fd0 is not an instance of type x86-machine
Aborted (core dumped)

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 854532fb98..118126fc70 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -27,6 +27,8 @@
 #define SGX_CPUID_EPC_SECTION           0x1
 #define SGX_CPUID_EPC_MASK              GENMASK(3, 0)
 
+bool sgx_enabled;
+
 static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
 {
     return (low & GENMASK_ULL(31, 12)) +
@@ -88,19 +90,22 @@ SGXInfo *sgx_get_capabilities(Error **errp)
 SGXInfo *sgx_get_info(void)
 {
     SGXInfo *info = NULL;
-    MachineState *ms = MACHINE(qdev_get_machine());
-    X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
-
-    if (x86ms->sgx_epc_list) {
-        PCMachineState *pcms = PC_MACHINE(ms);
-        SGXEPCState *sgx_epc = &pcms->sgx_epc;
-        info = g_new0(SGXInfo, 1);
-
-        info->sgx = true;
-        info->sgx1 = true;
-        info->sgx2 = true;
-        info->flc = true;
-        info->section_size = sgx_epc->size;
+
+    if (sgx_enabled) {
+        MachineState *ms = MACHINE(qdev_get_machine());
+        X86MachineState *x86ms = X86_MACHINE(qdev_get_machine());
+
+        if (x86ms->sgx_epc_list) {
+            PCMachineState *pcms = PC_MACHINE(ms);
+            SGXEPCState *sgx_epc = &pcms->sgx_epc;
+            info = g_new0(SGXInfo, 1);
+
+            info->sgx = true;
+            info->sgx1 = true;
+            info->sgx2 = true;
+            info->flc = true;
+            info->section_size = sgx_epc->size;
+        }
     }
     return info;
 }
@@ -168,4 +173,5 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     }
 
     memory_region_set_size(&sgx_epc->mr, sgx_epc->size);
+    sgx_enabled = true;
 }

