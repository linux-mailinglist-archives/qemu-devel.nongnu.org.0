Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA83C22E4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:32:22 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ok1-0003my-2p
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oTF-0007M8-P5
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oT5-0005B7-P8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:14:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800797"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730208"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:38 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/33] i386: Propagate SGX CPUID sub-leafs to KVM
Date: Fri,  9 Jul 2021 19:09:36 +0800
Message-Id: <20210709110955.73256-15-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

The SGX sub-leafs are enumerated at CPUID 0x12.  Indices 0 and 1 are
always present when SGX is supported, and enumerate SGX features and
capabilities.  Indices >=2 are directly correlated with the platform's
EPC sections.  Because the number of EPC sections is dynamic and user
defined, the number of SGX sub-leafs is "NULL" terminated.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/kvm/kvm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e48b9b6a91..2869ece458 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1668,6 +1668,25 @@ int kvm_arch_init_vcpu(CPUState *cs)
             }
             break;
         case 0x7:
+        case 0x12:
+            for (j = 0; ; j++) {
+                c->function = i;
+                c->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+                c->index = j;
+                cpu_x86_cpuid(env, i, j, &c->eax, &c->ebx, &c->ecx, &c->edx);
+
+                if (j > 1 && (c->eax & 0xf) != 1) {
+                    break;
+                }
+
+                if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
+                    fprintf(stderr, "cpuid_data is full, no space for "
+                                "cpuid(eax:0x12,ecx:0x%x)\n", j);
+                    abort();
+                }
+                c = &cpuid_data.entries[cpuid_i++];
+            }
+            break;
         case 0x14: {
             uint32_t times;
 
-- 
2.29.2.334.gfaefdd61ec


