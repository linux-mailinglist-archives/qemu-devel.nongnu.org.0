Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22067497A08
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:11:55 +0100 (CET)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBuSA-0007Lc-7N
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCO-0004hS-9Q
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:15222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nBuCL-0001Wn-SV
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 02:55:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643010933; x=1674546933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PNH95ImaeXwf6pkc5e6ggl4Jm+kwBwbsraiw53lP3dc=;
 b=ejm4mQXHAwmtU9FKuEVZe95U6L7a93ctaQSQvwKm+E1GqWgeMB7EcY4F
 mbYyM8lhMgIZpkW0601J5RAqq1YUoXW9WdYMnFRrgDgXFuWWOgdMmXn51
 EvzoJE40gawuNpkzQOb/6l2h897IjeF1Mgy+++AZi+Z62XzKF0AHXjRPt
 9RL4+27C5Wc2/gy2VUkuEdVz7Rof6kDjZbYk3W/o4D5M/ufXAQnC5i2uV
 o+9MHkHbCnUMG5Z39KLt2z8fOzYVkqgdPLCJ46IVh/8f4KzQyr5iMArYj
 VAYcAsvVhBikbRlI1r6dMF2pgjOW4zeRTsZE1Wh92rWxSkMp4ABYKhVNd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309310869"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="309310869"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 23:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="494530993"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2022 23:55:23 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] x86: add support for KVM_CAP_XSAVE2 and AMX state
 migration
Date: Sun, 23 Jan 2022 23:55:22 -0800
Message-Id: <20220124075523.108875-7-yang.zhong@intel.com>
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

When dynamic xfeatures (e.g. AMX) are used by the guest, the xsave
area would be larger than 4KB. KVM_GET_XSAVE2 and KVM_SET_XSAVE
under KVM_CAP_XSAVE2 works with a xsave buffer larger than 4KB.
Always use the new ioctls under KVM_CAP_XSAVE2 when KVM supports it.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 linux-headers/asm-x86/kvm.h | 14 +++++++++++++
 linux-headers/linux/kvm.h   |  2 ++
 target/i386/cpu.h           |  4 ++++
 target/i386/kvm/kvm.c       | 42 ++++++++++++++++++++++++-------------
 target/i386/xsave_helper.c  | 35 +++++++++++++++++++++++++++++++
 5 files changed, 82 insertions(+), 15 deletions(-)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 5a776a08f7..2e37b825cd 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -375,7 +375,21 @@ struct kvm_debugregs {
 
 /* for KVM_CAP_XSAVE */
 struct kvm_xsave {
+	/*
+	 * KVM_GET_XSAVE2 and KVM_SET_XSAVE write and read as many bytes
+	 * as are returned by KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
+	 * respectively, when invoked on the vm file descriptor.
+	 *
+	 * The size value returned by KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2)
+	 * will always be at least 4096. Currently, it is only greater
+	 * than 4096 if a dynamic feature has been enabled with
+	 * ``arch_prctl()``, but this may change in the future.
+	 *
+	 * The offsets of the state save areas in struct kvm_xsave follow
+	 * the contents of CPUID leaf 0xD on the host.
+	 */
 	__u32 region[1024];
+	__u32 extra[0];
 };
 
 #define KVM_MAX_XCRS	16
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 02c5e7b7bb..af67be1b9e 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_XSAVE2  208
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1550,6 +1551,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_XSAVE */
 #define KVM_GET_XSAVE		  _IOR(KVMIO,  0xa4, struct kvm_xsave)
 #define KVM_SET_XSAVE		  _IOW(KVMIO,  0xa5, struct kvm_xsave)
+#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
 /* Available with KVM_CAP_XCRS */
 #define KVM_GET_XCRS		  _IOR(KVMIO,  0xa6, struct kvm_xcrs)
 #define KVM_SET_XCRS		  _IOW(KVMIO,  0xa7, struct kvm_xcrs)
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
index 25d26a15f8..5f931fbbc6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -122,6 +122,7 @@ static uint32_t num_architectural_pmu_gp_counters;
 static uint32_t num_architectural_pmu_fixed_counters;
 
 static int has_xsave;
+static int has_xsave2;
 static int has_xcrs;
 static int has_pit_state2;
 static int has_sregs2;
@@ -1571,6 +1572,26 @@ static Error *invtsc_mig_blocker;
 
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
@@ -1600,6 +1621,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     cpuid_i = 0;
 
+    has_xsave2 = kvm_check_extension(cs->kvm_state, KVM_CAP_XSAVE2);
+
     r = kvm_arch_set_tsc_khz(cs);
     if (r < 0) {
         return r;
@@ -1988,19 +2011,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
@@ -3304,13 +3315,14 @@ static int kvm_get_xsave(X86CPU *cpu)
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
index ac61a96344..c3d2c9e43c 100644
--- a/target/i386/xsave_helper.c
+++ b/target/i386/xsave_helper.c
@@ -5,6 +5,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include <asm/kvm.h>
 
 void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 {
@@ -126,6 +127,23 @@ void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen)
 
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
+
+        if (e->size && e->offset) {
+            XSaveXTILEDATA *tiledata = buf + e->offset;
+
+            memcpy(tiledata, &env->xtiledata, sizeof(env->xtiledata));
+        }
+    }
 #endif
 }
 
@@ -247,5 +265,22 @@ void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen)
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
+
+        if (e->size && e->offset) {
+            const XSaveXTILEDATA *tiledata = buf + e->offset;
+
+            memcpy(&env->xtiledata, tiledata, sizeof(env->xtiledata));
+        }
+    }
 #endif
 }

