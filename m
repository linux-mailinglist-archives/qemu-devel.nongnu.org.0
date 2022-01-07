Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565124874DA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:38:10 +0100 (CET)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5lhJ-00043p-Ey
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:38:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbQ-0005y5-BN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:22256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbI-00077r-10
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641547916; x=1673083916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wTP5jitipMnwR/jG46GZc3J4/f6WqsHtgR4yW0gHRmM=;
 b=Z17Z8iGZ/aHxOOgK62Gd11o1N2z7jdeInS7vAuumYkVoRjsi2N9VAmlv
 PGj5esge/he2CXG7XD3miuZCkjnQR8/bM7iD1064OymvvkVi/GXlBQbPV
 iaHthzwtH1SbkqBXLDS8q6jM+/+jur2mtJ4J7m6KXcdJYCQSWCFZPnNYH
 Zwm2gH1Y1Dow84keFBjQXuvDzEsuKos6qvcFnU3GP+0ctPQn0W+aiMRQU
 a/X8Z7cfL96C1GHD3ethWdyL8XYu73FWT0bf7JRQR5NqdhUMBTBLxdTNE
 xzu2EkRpUmvR/48jrn/eivNXxlS83353JKLFt8ACQPbY7MAGk0KlHhnkh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329184200"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="329184200"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527239103"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2022 01:31:43 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/7] x86: Grant AMX permission for guest
Date: Fri,  7 Jan 2022 01:31:30 -0800
Message-Id: <20220107093134.136441-4-yang.zhong@intel.com>
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

Kernel mechanism for dynamically enabled XSAVE features
asks userspace VMM requesting guest permission if it wants
to expose the features. Only with the permission, kernel
can try to enable the features when detecting the intention
from guest in runtime.

Qemu should request the permission for guest only once
before the first vCPU is created. KVM checks the guest
permission when Qemu advertises the features, and the
advertising operation fails w/o permission.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Signed-off-by: Jing Liu <jing2.liu@intel.com>
---
 target/i386/cpu.h |  7 +++++++
 hw/i386/x86.c     | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 768a8218be..79023fe723 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -549,6 +549,13 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
+#define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
+#define XFEATURE_XTILE_MASK             (XSTATE_XTILE_CFG_MASK \
+                                         | XSTATE_XTILE_DATA_MASK)
+
+#define ARCH_GET_XCOMP_GUEST_PERM       0x1024
+#define ARCH_REQ_XCOMP_GUEST_PERM       0x1025
 
 /* CPUID feature words */
 typedef enum FeatureWord {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b84840a1bb..0a204c375e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -41,6 +41,8 @@
 #include "sysemu/cpu-timers.h"
 #include "trace.h"
 
+#include <sys/syscall.h>
+
 #include "hw/i386/x86.h"
 #include "target/i386/cpu.h"
 #include "hw/i386/topology.h"
@@ -117,6 +119,30 @@ out:
     object_unref(cpu);
 }
 
+static void x86_xsave_req_perm(void)
+{
+    unsigned long bitmask;
+
+    long rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
+                      XSTATE_XTILE_DATA_BIT);
+    if (rc) {
+        /*
+         * The older kernel version(<5.15) can't support
+         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
+         */
+        return;
+    }
+
+    rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
+    if (rc) {
+        error_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
+    } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
+        error_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
+                     "and bitmask=0x%lx", bitmask);
+        exit(EXIT_FAILURE);
+    }
+}
+
 void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 {
     int i;
@@ -124,6 +150,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     MachineState *ms = MACHINE(x86ms);
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
 
+    /* Request AMX pemission for guest */
+    x86_xsave_req_perm();
     x86_cpu_set_default_version(default_cpu_version);
 
     /*

