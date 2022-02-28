Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F14C64B2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:17:39 +0100 (CET)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObDs-0003Cb-U3
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb27-0008IP-8U
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:32 -0500
Received: from mga14.intel.com ([192.55.52.115]:50056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb23-0005ZR-TR
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035523; x=1677571523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=woOXInjx7C9bpUjllseY5xkUSYyCoviromYNYlMJyOU=;
 b=YGOtfpewC3UB4xURdnYp4AL+pnQw+sdpIOV+1W3Vi+8Bd5i6yJ9vuIh0
 SjQqKpkWhP5EkT1pxqFsMUr4qHS6ast0u2Np2ZCoEuPqW+Ejxk5Fk9G2b
 ScRPeY25BC28BpRw8nNaH52uMWNyl87UGJrliYkctn+a5RxA5eiTLximt
 QAahtZA0X4nZnv75VY2lFD1x9JoK9oi6v1/NU7gC7aIN+6TaUeoRbaCj1
 RZPkGMT29LsyHQvY33NA0JZDI7zQimYWfwzQIO1CC9cgPxJXH3k2M72mz
 hvrx2dvuMFeJbvdVQiVo1b8svkInVtIvljpVCmDGwpTF2X0igyjDIfj3f Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021629"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021629"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014574"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:16 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] x86: Fix the 64-byte boundary enumeration for extended
 state
Date: Mon, 28 Feb 2022 00:05:08 -0800
Message-Id: <20220228080515.42357-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228080515.42357-1-yang.zhong@intel.com>
References: <20220228080515.42357-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
indicate whether the extended state component locates
on the next 64-byte boundary following the preceding state
component when the compacted format of an XSAVE area is
used.

Right now, they are all zero because no supported component
needed the bit to be set, but the upcoming AMX feature will
use it.  Fix the subleaves value according to KVM's supported
cpuid.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h         | 6 ++++++
 target/i386/cpu.c         | 1 +
 target/i386/kvm/kvm-cpu.c | 1 +
 3 files changed, 8 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e69ab5dd78..7bd9d58505 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -550,6 +550,11 @@ typedef enum X86Seg {
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
 
+#define ESA_FEATURE_ALIGN64_BIT         1
+
+#define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
+
+
 /* CPUID feature words */
 typedef enum FeatureWord {
     FEAT_1_EDX,         /* CPUID[1].EDX */
@@ -1356,6 +1361,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
     uint32_t offset, size;
+    uint32_t ecx;
 } ExtSaveArea;
 
 #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6c7ef1099b..0f3c477dfc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5488,6 +5488,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
+                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
             }
         }
         break;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index d95028018e..ce27d3b1df 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -104,6 +104,7 @@ static void kvm_cpu_xsave_init(void)
             if (sz != 0) {
                 assert(esa->size == sz);
                 esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
+                esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
             }
         }
     }

