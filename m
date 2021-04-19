Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAFD363FC2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:44:50 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYROb-0003ER-Uz
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3z-00056y-4M
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3x-00025K-AP
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:30 -0400
IronPort-SDR: lqlZPesf6KZcKnOzMMIJG5Wy+oabixVJIaNIz4FCUAzRX/QGL8mHB79tZGVGXwaAlhGPCRn3qh
 rbmEOopFoxUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409305"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409305"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:00 -0700
IronPort-SDR: gtBxgpJey6bft0aCNRy9wgW+wq0xPlJvphm2F7iW/+FHi83vrADdnGoQd0j03/Ljo6Txls3FIH
 44HszqwbozMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947427"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:22:59 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/32] hw/i386/pc: Account for SGX EPC sections when
 calculating device memory
Date: Mon, 19 Apr 2021 18:01:42 +0800
Message-Id: <20210419100156.53504-19-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add helpers to detect if SGX EPC exists above 4g, and if so, where SGX
EPC above 4g ends.  Use the helpers to adjust the device memory range
if SGX EPC exists above 4g.

For multiple virtual EPC sections, we just put them together physically
contiguous for the simplicity because we don't support EPC NUMA affinity
now. Once the SGX EPC NUMA support in the kernel SGX driver, we will
support this in the future.

Note that SGX EPC is currently hardcoded to reside above 4g.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/pc.c              | 11 ++++++++++-
 include/hw/i386/sgx-epc.h | 12 ++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a03..ca8ec072bc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -925,8 +925,15 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
+        if (sgx_epc_above_4g(pcms->sgx_epc)) {
+            machine->device_memory->base = sgx_epc_above_4g_end(pcms->sgx_epc);
+        } else {
+            machine->device_memory->base =
+                0x100000000ULL + x86ms->above_4g_mem_size;
+        }
+
         machine->device_memory->base =
-            ROUND_UP(0x100000000ULL + x86ms->above_4g_mem_size, 1 * GiB);
+            ROUND_UP(machine->device_memory->base, 1 * GiB);
 
         if (pcmc->enforce_aligned_dimm) {
             /* size device region assuming 1G page max alignment per slot */
@@ -1011,6 +1018,8 @@ uint64_t pc_pci_hole64_start(void)
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
+    } else if (sgx_epc_above_4g(pcms->sgx_epc)) {
+            hole64_start = sgx_epc_above_4g_end(pcms->sgx_epc);
     } else {
         hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
     }
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 8d80b34fb7..3d3eab5074 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -59,4 +59,16 @@ extern int sgx_epc_enabled;
 
 int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
 
+static inline bool sgx_epc_above_4g(SGXEPCState *sgx_epc)
+{
+    return sgx_epc != NULL;
+}
+
+static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
+{
+    assert(sgx_epc != NULL && sgx_epc->base >= 0x100000000ULL);
+
+    return sgx_epc->base + sgx_epc->size;
+}
+
 #endif
-- 
2.29.2.334.gfaefdd61ec


