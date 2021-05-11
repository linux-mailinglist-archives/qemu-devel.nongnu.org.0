Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E637A015
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:52:59 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMGH-0005Cn-OD
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLss-0006xy-Ao
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:46 -0400
Received: from mga06.intel.com ([134.134.136.31]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLsq-0004hV-NZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:28:46 -0400
IronPort-SDR: ZvEsnejieAR/VfzM4RcLOdlCzKCu7Q2HyDA0blUrkCmjh94DYwcAZUjqTUqblBTPzZctgJuNR0
 IcBQPRkMoQ1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631563"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631563"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:28:09 -0700
IronPort-SDR: iFhDBtIkbH4bKd5ras98rV/ksAf7vD0IjywnhJuPJ9hHgo9VX2CdTHbJVQ35sc6ahvzknTqLCF
 ysjFLKvQQisA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281302"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:28:07 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/32] q35: Add support for SGX EPC
Date: Tue, 11 May 2021 14:20:40 +0800
Message-Id: <20210511062051.41948-22-yang.zhong@intel.com>
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

Enable SGX EPC virtualization, which is currently only support by KVM.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/pc_q35.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46a0f196f4..217c89c204 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -176,6 +176,9 @@ static void pc_q35_init(MachineState *machine)
         x86ms->below_4g_mem_size = machine->ram_size;
     }
 
+    if (sgx_epc_enabled) {
+        pc_machine_init_sgx_epc(pcms);
+    }
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
     kvmclock_create(pcmc->kvmclock_create_always);
-- 
2.29.2.334.gfaefdd61ec


