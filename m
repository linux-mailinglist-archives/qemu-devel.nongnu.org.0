Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA44B98BE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:08:15 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKZxe-000132-I9
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuD-0006af-Oc
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:2006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuA-0005nq-Ul
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645077878; x=1676613878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+BXCxmOSs5NcgfU8u9eDLvKR4KO8CyUBdVj9wcxcXHo=;
 b=knHdYitC57mCfd5l8/5i8l7LMqMplhSLtRy6e+e/yelzW6WIok0M9N23
 rqgKzsuyMAptXnrY66UUDLNMQN6V6xeNeneCP8QTti4a2yw9Yjv86Fx1L
 LIPA+gvFD+ZbU+5iaJTXYCJcSV7Hw/HG70v93y92Fd5ZlaPWQXUuxWwe4
 +H4kW9y3miKHfhefFCt9HdZy+7IEQP6X5DEQBzfZXslAu6c+g0GMil9qm
 51antvJbOj29dDG1nOtVrvtJkCcyQEgu3Ukd2Pif8U+M23tH4sXWgxZgz
 tXaHimV8B6UTYqfK5HKxg4Enclrwwaqgp4l1BWad679z0yIw8Dm5cwIs8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234332893"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234332893"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:04:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="634318690"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 22:04:34 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] x86: Fix the 64-byte boundary enumeration for extended
 state
Date: Wed, 16 Feb 2022 22:04:27 -0800
Message-Id: <20220217060434.52460-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217060434.52460-1-yang.zhong@intel.com>
References: <20220217060434.52460-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
---
 target/i386/cpu.h         | 6 ++++++
 target/i386/cpu.c         | 1 +
 target/i386/kvm/kvm-cpu.c | 1 +
 3 files changed, 8 insertions(+)

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

