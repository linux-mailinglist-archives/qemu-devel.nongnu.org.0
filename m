Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B236379FEB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:46:21 +0200 (CEST)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM9s-0008Py-9O
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLsg-0006Wy-Ak
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLsc-0004hV-Bg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:34 -0400
IronPort-SDR: h8BONVQzKGOozf32Z7xvyfRavuFpUhyq83thgKl4TAAswcndMuKqdG/I6oCEioZVUvX5i+S3HA
 XB3DAMhz3KQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631556"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:28:03 -0700
IronPort-SDR: qIhtq5VnbvCC0sfmAE1d8JpWqJeGQHoim8jNn54gFw/venUp33YTo4RWfcZspmMtug/vumI3oN
 jUL/EsmxgCLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281265"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:28:02 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/32] hw/i386/pc: Account for SGX EPC sections when
 calculating device memory
Date: Tue, 11 May 2021 14:20:37 +0800
Message-Id: <20210511062051.41948-19-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
 include/hw/i386/sgx-epc.h |  7 +++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8cfaf216e7..d727993dfe 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -926,8 +926,15 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
+        if (pcms->sgx_epc != NULL) {
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
@@ -1012,6 +1019,8 @@ uint64_t pc_pci_hole64_start(void)
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
+    } else if (pcms->sgx_epc != NULL) {
+            hole64_start = sgx_epc_above_4g_end(pcms->sgx_epc);
     } else {
         hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
     }
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index 8d80b34fb7..743d0a943c 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -59,4 +59,11 @@ extern int sgx_epc_enabled;
 
 int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
 
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


