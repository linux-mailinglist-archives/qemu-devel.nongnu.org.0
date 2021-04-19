Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC1363FB1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:38:01 +0200 (CEST)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRI0-0003Zs-VG
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR40-0005BQ-Rh
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:32 -0400
Received: from mga17.intel.com ([192.55.52.151]:24095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3z-00023F-5G
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:32 -0400
IronPort-SDR: S4S6mf8CZC4aKz0dqO43bUM2AeC0iAFSy+HPfLn1VsVXzJejlWZc+GQoU5VcmXsi2WVqdF0hZ1
 SA9D1nD1z92A==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409306"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:23:02 -0700
IronPort-SDR: FarG/DSQwPJAdxBroFEaUBhO8F6rJTOdYPTpUpXKwtEGRRAiIXkRbmxIHIIR7Re5VTvXFcUE2K
 CXIuPVf4zlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947442"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:23:00 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/32] i386/pc: Add e820 entry for SGX EPC section(s)
Date: Mon, 19 Apr 2021 18:01:43 +0800
Message-Id: <20210419100156.53504-20-yang.zhong@intel.com>
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

Note that SGX EPC is currently guaranteed to reside in a single
contiguous chunk of memory regardless of the number of EPC sections.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ca8ec072bc..d556eaca25 100644
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


