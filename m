Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA304979F5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:06:05 +0100 (CET)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuMW-0001tB-3W
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCJ-0004Xf-B1
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:31 -0500
Received: from mga07.intel.com ([134.134.136.100]:15222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCH-0001Wn-Hv
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010929; x=1674546929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4mxV/YlshNQdk4MjRHzFwV7Beww//SikNavDKC7IKM=;
 b=Etg42v04QmHT9ijsEaLl6TYAsyAqSckYQLht+fAaVp57OtJiJzEnfh6j
 CLc39nkL4lZzbbD8o3mnxM9pDNZCYYcbUgqqQJE4luSXYTKoxQULXd9NX
 TC/gVElfn179WZWpGFheZGR3CSihgZsx77kjvTLmL4tnnf7RrwoD+DxWy
 Oq6GRuoq1A1rd84rmBruEBXKLeeqw+uUhKOq8WVZll4LJXMVwJSDMpzmd
 008I767DwcxN6z7LZ5vIKKh3RHbbbe2fxgTKZxhlRroz6lMwvfxXg2Sv5
 lylEVYVWwpz7H9ViCBXdBkv7O4NG1XzeyxPkJzyWcGypXF+QWk8aAy8Wv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310863"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310863"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530972"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] x86: Fix the 64-byte boundary enumeration for extended
 state
Date: Sun, 23 Jan 2022 23:55:17 -0800
Message-Id: <20220124075523.108875-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124075523.108875-1-yang.zhong@intel.com>
References: <20220124075523.108875-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 target/i386/cpu.h         | 6 ++++++
 target/i386/cpu.c         | 1 +
 target/i386/kvm/kvm-cpu.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9911d7c871..de1dc124ab 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -548,6 +548,11 @@ typedef enum X86Seg {
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
@@ -1354,6 +1359,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
     uint32_t offset, size;
+    uint32_t ecx;
 } ExtSaveArea;
 
 #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..37f06b0b1a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5487,6 +5487,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
+                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
             }
         }
         break;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index d95028018e..033ca011ea 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -105,6 +105,8 @@ static void kvm_cpu_xsave_init(void)
                 assert(esa->size == sz);
                 esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
             }
+
+            esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
         }
     }
 }

