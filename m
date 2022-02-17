Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9BA4B9903
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:13:43 +0100 (CET)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKa2w-0000mb-Oj
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuJ-0006iJ-T3
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:47 -0500
Received: from mga18.intel.com ([134.134.136.126]:2007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuH-0005os-JK
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645077885; x=1676613885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ePhvZDMBvCq/mSPGGYsExlYl2AUNZeBEpvDyIby3FiI=;
 b=h7XjD9h31iYvCUZpH79nOXhpE6EwtCC/dkxUvQuQMAbMkGmsjDgy9yg+
 7Br3C/LRY95UcIZPto+SXuJ1J1v0oEjhTgDHOq9qSyENTYXZsMFcyT9qL
 tEJ91CzdR0gVOp5jvlwrFuPNA3bqlZaAgfDgkV2ofGvEp9Ez6Bmq9a5Lm
 p2vxfgT8twY22zp+gYQ76blpQ7joTPZMso8ogHaANstznr6fJ75sKU1HU
 nCOYxN0SaB4JDaHyPuveWIa76Po19V0RGbTaLrQridg1wtuusEOz28qWj
 zC7C8o9lAtWUS8XV7P+/ShB5OpSdye2MCMXayakJkXmAqefvyEBuCYr/z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234332901"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234332901"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="634318718"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 22:04:35 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] x86: add support for KVM_CAP_XSAVE2 and AMX state
 migration
Date: Wed, 16 Feb 2022 22:04:32 -0800
Message-Id: <20220217060434.52460-7-yang.zhong@intel.com>
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

When dynamic xfeatures (e.g. AMX) are used by the guest, the xsave
area would be larger than 4KB. KVM_GET_XSAVE2 and KVM_SET_XSAVE
under KVM_CAP_XSAVE2 works with a xsave buffer larger than 4KB.
Always use the new ioctls under KVM_CAP_XSAVE2 when KVM supports it.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h          |  4 ++++
 target/i386/kvm/kvm.c      | 42 ++++++++++++++++++++++++--------------
 target/i386/xsave_helper.c | 33 ++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f7fc2e97a6..de9da38e42 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1528,6 +1528,10 @@ typedef struct CPUX86State {
     uint64_t opmask_regs[NB_OPMASK_REGS];
     YMMReg zmmh_regs[CPU_NB_REGS];
     ZMMReg hi16_zmm_regs[CPU_NB_REGS];
+#ifdef TARGET_X86_64
+    uint8_t xtilecfg[64];
+    uint8_t xtiledata[8192];
+#endif
 
     /* sysenter registers */
     uint32_t sysenter_cs;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 8562d3d138..ff064e3d8f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -122,6 +122,7 @@ static uint32_t num_architectural_pmu_gp_counters;
 static uint32_t num_architectural_pmu_fixed_counters;
 
 static int has_xsave;
+static int has_xsave2;
 static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
@@ -1585,6 +1586,26 @@ static Error *invtsc_mig_blocker;
 
 #define KVM_MAX_CPUID_ENTRIES  100
 
+static void kvm_init_xsave(CPUX86State *env)
+{
+    if (has_xsave2) {
+        env->xsave_buf_len = QEMU_ALIGN_UP(has_xsave2, 4096);
+    } else if (has_xsave) {
+        env->xsave_buf_len = sizeof(struct kvm_xsave);
+    } else {
+        return;
+    }
+
+    env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
+    memset(env->xsave_buf, 0, env->xsave_buf_len);
+     /*
+      * The allocated storage must be large enough for all of the
+      * possible XSAVE state components.
+      */
+    assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX) <=
+           env->xsave_buf_len);
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     struct {
@@ -1614,6 +1635,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     cpuid_i = 0;
 
+    has_xsave2 = kvm_check_extension(cs->kvm_state, KVM_CAP_XSAVE2);
+
     r = kvm_arch_set_tsc_khz(cs);
     if (r < 0) {
         return r;
@@ -2003,19 +2026,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (r) {
         goto fail;
     }
-
-    if (has_xsave) {
-        env->xsave_buf_len = sizeof(struct kvm_xsave);
-        env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
-        memset(env->xsave_buf, 0, env->xsave_buf_len);
-
-        /*
-         * The allocated storage must be large enough for all of the
-         * possible XSAVE state components.
-         */
-        assert(kvm_arch_get_supported_cpuid(kvm_state, 0xd, 0, R_ECX)
-               <= env->xsave_buf_len);
-    }
+    kvm_init_xsave(env);
 
     max_nested_state_len = kvm_max_nested_state_length();
     if (max_nested_state_len > 0) {
@@ -3319,13 +3330,14 @@ static int kvm_get_xsave(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
     void *xsave = env->xsave_buf;
-    int ret;
+    int type, ret;
 
     if (!has_xsave) {
         return kvm_get_fpu(cpu);
     }
 
-    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_XSAVE, xsave);
+    type = has_xsave2 ? KVM_GET_XSAVE2 : KVM_GET_XSAVE;
+    ret = kvm_vcpu_ioctl(CPU(cpu), type, xsave);
     if (ret < 0) {
         return ret;
     }
diff --git a/target/i386/xsave_helper.c b/target/i386/xsave_helper.c
index ac61a96344..b6a004505f 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -5,6 +5,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include <asm/kvm.h>
 
 void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 {
@@ -126,6 +127,22 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 
         memcpy(pkru, &env->pkru, sizeof(env->pkru));
     }
+
+    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
+    if (e->size && e->offset) {
+        XSaveXTILECFG *tilecfg = buf + e->offset;
+
+        memcpy(tilecfg, &env->xtilecfg, sizeof(env->xtilecfg));
+    }
+
+    if (buflen > sizeof(struct kvm_xsave)) {
+        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
+        if (e->size && e->offset && buflen >= e->size + e->offset) {
+            XSaveXTILEDATA *tiledata = buf + e->offset;
+
+            memcpy(tiledata, &env->xtiledata, sizeof(env->xtiledata));
+        }
+    }
 #endif
 }
 
@@ -247,5 +264,21 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
         pkru = buf + e->offset;
         memcpy(&env->pkru, pkru, sizeof(env->pkru));
     }
+
+    e = &x86_ext_save_areas[XSTATE_XTILE_CFG_BIT];
+    if (e->size && e->offset) {
+        const XSaveXTILECFG *tilecfg = buf + e->offset;
+
+        memcpy(&env->xtilecfg, tilecfg, sizeof(env->xtilecfg));
+    }
+
+    if (buflen > sizeof(struct kvm_xsave)) {
+        e = &x86_ext_save_areas[XSTATE_XTILE_DATA_BIT];
+        if (e->size && e->offset && buflen >= e->size + e->offset) {
+            const XSaveXTILEDATA *tiledata = buf + e->offset;
+
+            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
+        }
+    }
 #endif
 }

