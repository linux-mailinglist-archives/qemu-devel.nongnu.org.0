Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C936F5BE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:35:13 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMk4-0001NS-C4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMeg-0005GD-Ds
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:29:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:63439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMee-00016y-KL
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:29:38 -0400
IronPort-SDR: Bf2hSCjUIcSzi3zTt/CEOlEy8Fm25/HZVAEUPFeb56f7Q6p727DesHnFNFNtB57errLMW7mAra
 3fAxAL0hnJsQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023093"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023093"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:47 -0700
IronPort-SDR: CWOr9au6THU29vl1qH6bLm8YBnn6oy5Hm660973BgRJ+UOmeUh1GwC4xZcl8Hghxgf/xzOZSD6
 7bdexFWynfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258583"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:45 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 19/32] i386/pc: Add e820 entry for SGX EPC section(s)
Date: Fri, 30 Apr 2021 14:24:42 +0800
Message-Id: <20210430062455.8117-20-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Note that SGX EPC is currently guaranteed to reside in a single
contiguous chunk of memory regardless of the number of EPC sections.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 90585a2471..3f5aedd756 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -895,6 +895,10 @@ void pc_memory_init(PCMachineState *pcms,
         e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
     }
 
+    if (pcms->sgx_epc != NULL) {
+        e820_add_entry(pcms->sgx_epc->base, pcms->sgx_epc->size, E820_RESERVED);
+    }
+
     if (!pcmc->has_reserved_memory &&
         (machine->ram_slots ||
          (machine->maxram_size > machine->ram_size))) {
-- 
2.29.2.334.gfaefdd61ec


