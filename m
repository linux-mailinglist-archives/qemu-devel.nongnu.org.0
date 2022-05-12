Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B7524371
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:31:48 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozYJ-0006Y2-Uh
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozLq-0002AD-9V
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:18:54 -0400
Received: from mga06b.intel.com ([134.134.136.31]:1444 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozLo-0002pk-FE
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325532; x=1683861532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vMFsLQVnoupHQ2jYhvlJfEfSaCwlUmEtAofylDNcL9Q=;
 b=QySKh6fPH4tnRxa2qwIIbZfkx2iOgf98vSdNawRnhBOD+5AGN3Jg7AWp
 VpJzsW8f/At+9VEquU02WU68l++z+Y3FItDPj5fHg06v2iYaUtlNBUMe6
 1T0uJEUtObqb9FBMycEURroJZOGSMXXXbLM/lg/vda44dy8QLxI3d4lnh
 ResDSpZ+z3bLj3yfjImRCyKLXyexI5s79BMCrY7dxf0Opkm1KjN9FPWU/
 RU582Ufg9sWyjLOmO3Pu22jgdnNkOth5PR13uy4XnVdFCpZCy0b0IvQBk
 gNRkyaxiEzansyYt/aoeyoyQePZ7itpNgKsYGhYgj5NHHqc4+vfe159WD g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="330478977"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="330478977"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594455557"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:18:43 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [RFC PATCH v4 08/36] i386/tdx: Adjust get_supported_cpuid() for TDX VM
Date: Thu, 12 May 2022 11:17:35 +0800
Message-Id: <20220512031803.3315890-9-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512031803.3315890-1-xiaoyao.li@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For TDX, the allowable CPUID configuration differs from what KVM
reports for KVM scope via KVM_GET_SUPPORTED_CPUID.

- Some CPUID bits are not supported for TDX VM while KVM reports the
  support. Mask them off for TDX VM. e.g., CPUID_EXT_VMX, some PV
  features.

- The supported XCR0 and XSS bits needs to be cap'ed by tdx_caps, because
  KVM uses them to setup XFAM of TD.

Introduce tdx_get_supported_cpuid() to adjust the
kvm_arch_get_supported_cpuid() for TDX VM.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.h     |  5 +++++
 target/i386/kvm/kvm.c |  4 ++++
 target/i386/kvm/tdx.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 target/i386/kvm/tdx.h |  2 ++
 4 files changed, 55 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9661f9fbd1c6..0c922e5a305a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -567,6 +567,11 @@ typedef enum X86Seg {
 #define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
 
+#define XCR0_MASK       (XSTATE_FP_MASK | XSTATE_SSE_MASK | XSTATE_YMM_MASK | \
+                         XSTATE_BNDREGS_MASK | XSTATE_BNDCSR_MASK | \
+                         XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK | \
+                         XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK)
+
 /* CPUID feature words */
 typedef enum FeatureWord {
     FEAT_1_EDX,         /* CPUID[1].EDX */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f257ffda259d..0751e6e102cc 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -498,6 +498,10 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         ret |= 1U << KVM_HINTS_REALTIME;
     }
 
+    if (is_tdx_vm()) {
+        tdx_get_supported_cpuid(function, index, reg, &ret);
+    }
+
     return ret;
 }
 
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 803154efdb91..6e3b15ba8a4a 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -14,11 +14,22 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qom/object_interfaces.h"
+#include "standard-headers/asm-x86/kvm_para.h"
 #include "sysemu/kvm.h"
 
 #include "hw/i386/x86.h"
 #include "tdx.h"
 
+#define TDX_SUPPORTED_KVM_FEATURES  ((1ULL << KVM_FEATURE_NOP_IO_DELAY) | \
+                                     (1ULL << KVM_FEATURE_STEAL_TIME) | \
+                                     (1ULL << KVM_FEATURE_PV_EOI) | \
+                                     (1ULL << KVM_FEATURE_PV_UNHALT) | \
+                                     (1ULL << KVM_FEATURE_PV_TLB_FLUSH) | \
+                                     (1ULL << KVM_FEATURE_PV_SEND_IPI) | \
+                                     (1ULL << KVM_FEATURE_POLL_CONTROL) | \
+                                     (1ULL << KVM_FEATURE_PV_SCHED_YIELD) | \
+                                     (1ULL << KVM_FEATURE_MSI_EXT_DEST_ID))
+
 static TdxGuest *tdx_guest;
 
 /* It's valid after kvm_confidential_guest_init()->kvm_tdx_init() */
@@ -121,6 +132,39 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
     return 0;
 }
 
+void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
+                             uint32_t *ret)
+{
+    switch (function) {
+    case 1:
+        if (reg == R_ECX) {
+            *ret &= ~CPUID_EXT_VMX;
+        }
+        break;
+    case 0xd:
+        if (index == 0) {
+            if (reg == R_EAX) {
+                *ret &= (uint32_t)tdx_caps->xfam_fixed0 & XCR0_MASK;
+                *ret |= (uint32_t)tdx_caps->xfam_fixed1 & XCR0_MASK;
+            } else if (reg == R_EDX) {
+                *ret &= (tdx_caps->xfam_fixed0 & XCR0_MASK) >> 32;
+                *ret |= (tdx_caps->xfam_fixed1 & XCR0_MASK) >> 32;
+            }
+        } else if (index == 1) {
+            /* TODO: Adjust XSS when it's supported. */
+        }
+        break;
+    case KVM_CPUID_FEATURES:
+        if (reg == R_EAX) {
+            *ret &= TDX_SUPPORTED_KVM_FEATURES;
+        }
+        break;
+    default:
+        /* TODO: Use tdx_caps to adjust CPUID leafs. */
+        break;
+    }
+}
+
 /* tdx guest */
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(TdxGuest,
                                    tdx_guest,
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 4036ca2f3f99..06599b65b827 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -27,5 +27,7 @@ bool is_tdx_vm(void);
 #endif /* CONFIG_TDX */
 
 int tdx_kvm_init(MachineState *ms, Error **errp);
+void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
+                             uint32_t *ret);
 
 #endif /* QEMU_I386_TDX_H */
-- 
2.27.0


