Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FE4874C3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:35:18 +0100 (CET)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5leX-00084D-KF
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbM-0005x2-Sy
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:22251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbK-00077l-SZ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641547918; x=1673083918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PnButU9Q6Pc0MQ22Fe1AaP0ULZ2IvO0f1IXWwo02ztk=;
 b=OOC4/zTcAxwX64wmkjWoAq98cm+lVXYqDgL6LrqAQGaQu51kT8vLc4Y9
 GDe5QQBzXBgcdIYCJD82tdB4QZ7z8iuEa59EHKf+J3AkPH6GJzjk1aGEi
 15lUHaaQCBCBWO4a+tT2bbZskmKBwbO7bEd8PFTELjyjXufWDsXPrnE/H
 DDeRTXbWWTqAregiOI8BAGMatWQSGxxvYgvgvRwzuQi4D/zPydY3QNiyk
 UDL2A/48a6XEyWbmOF7fHdAe6J1MG1DHMPXsZcBwUbm91TWZ5WYP/AMXh
 cMsFZ5KDGErE6uO164/strk1pZtn++j6kXJRLtlE//zAkdE/J+Jimvi6X Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329184201"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="329184201"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527239099"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2022 01:31:42 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/7] x86: Fix the 64-byte boundary enumeration for
 extended state
Date: Fri,  7 Jan 2022 01:31:28 -0800
Message-Id: <20220107093134.136441-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107093134.136441-1-yang.zhong@intel.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
are all zero, while spec actually introduces that bit 01
should indicate if the extended state component locates
on the next 64-byte boundary following the preceding state
component when the compacted format of an XSAVE area is
used.

Fix the subleaves value according to the host supported
cpuid. The upcoming AMX feature would be the first one
using it.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h         | 1 +
 target/i386/cpu.c         | 1 +
 target/i386/kvm/kvm-cpu.c | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 04f2b790c9..7f9700544f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1354,6 +1354,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
     uint32_t offset, size;
+    uint32_t need_align;
 } ExtSaveArea;
 
 #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..47bc4d5c1a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5487,6 +5487,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
+                *ecx = esa->need_align << 1;
             }
         }
         break;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index d95028018e..6c4c1c6f9d 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -105,6 +105,9 @@ static void kvm_cpu_xsave_init(void)
                 assert(esa->size == sz);
                 esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
             }
+
+            uint32_t ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
+            esa->need_align = ecx & (1u << 1) ? 1 : 0;
         }
     }
 }

