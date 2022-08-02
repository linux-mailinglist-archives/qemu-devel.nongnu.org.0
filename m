Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11252587890
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:00:27 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oImpF-0007NH-TS
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdc-0004FQ-CX
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:8273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImda-0005iP-BL
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426502; x=1690962502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5IlEGtBsyV6ApkMhA1Vy+WN/vEG+rgouqX5BynGNN4=;
 b=LfSCrqGf8X/BKDnHVEWtXJ8gQhidSQc9dqwzCTbPJHuKKLB+pb4UCPQq
 CiFsKOeIq0ZRHQNaUiQOyKe+NbQII8+TFfJ8evHYMHMW/3mlRkZHjMDrP
 n1lonm5u+9oRh6q6hG7xanVLzHtQLlkuTGMDPmJDccr8ZfvUXfaqIo2Vm
 sNLFerdGFzQffERwBRIh2j4izNHXUkFAhZYvDK59ajxqySCngzSN5TsgY
 6GM+2W+h8p9anlEny4zliHGP3G2Wn/0laz/ykH2XPd9PBGJHws6ldQKNc
 L0Bhr6fAfiqCq0vNP4LBONr5BaklyO1VvBc5l1O1sqxeYMhj20LqbDAGl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286908467"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286908467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630603847"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:48:17 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
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
Subject: [PATCH v1 06/40] i386/tdx: Get tdx_capabilities via
 KVM_TDX_CAPABILITIES
Date: Tue,  2 Aug 2022 15:47:16 +0800
Message-Id: <20220802074750.2581308-7-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
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

KVM provides TDX capabilities via sub command KVM_TDX_CAPABILITIES of
IOCTL(KVM_MEMORY_ENCRYPT_OP). Get the capabilities when initializing
TDX context. It will be used to validate user's setting later.

Since there is no interface reporting how many cpuid configs contains in
KVM_TDX_CAPABILITIES, QEMU chooses to try starting with a known number
and abort when it exceeds KVM_MAX_CPUID_ENTRIES.

Besides, introduce the interfaces to invoke TDX "ioctls" at different
scope (KVM, VM and VCPU) in preparation.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
changes from RFC v4:
  - start from nr_cpuid_configs = 6 for the loop;
  - stop the loop when nr_cpuid_configs exceeds KVM_MAX_CPUID_ENTRIES;
---
 target/i386/kvm/kvm.c      |  2 -
 target/i386/kvm/kvm_i386.h |  2 +
 target/i386/kvm/tdx.c      | 92 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 335f87e6cc59..9e30fa9f4eb5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1704,8 +1704,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
 
 static Error *invtsc_mig_blocker;
 
-#define KVM_MAX_CPUID_ENTRIES  100
-
 static void kvm_init_xsave(CPUX86State *env)
 {
     if (has_xsave2) {
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index b434feaa6b1d..6b24ab2a7813 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -13,6 +13,8 @@
 
 #include "sysemu/kvm.h"
 
+#define KVM_MAX_CPUID_ENTRIES  100
+
 #define kvm_apic_in_kernel() (kvm_irqchip_in_kernel())
 
 #ifdef CONFIG_KVM
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 77e33ae01147..89f81f7d7082 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -14,12 +14,104 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qom/object_interfaces.h"
+#include "sysemu/kvm.h"
 
 #include "hw/i386/x86.h"
+#include "kvm_i386.h"
 #include "tdx.h"
 
+static struct kvm_tdx_capabilities *tdx_caps;
+
+enum tdx_ioctl_level{
+    TDX_PLATFORM_IOCTL,
+    TDX_VM_IOCTL,
+    TDX_VCPU_IOCTL,
+};
+
+static int __tdx_ioctl(void *state, enum tdx_ioctl_level level, int cmd_id,
+                        __u32 flags, void *data)
+{
+    struct kvm_tdx_cmd tdx_cmd;
+    int r;
+
+    memset(&tdx_cmd, 0x0, sizeof(tdx_cmd));
+
+    tdx_cmd.id = cmd_id;
+    tdx_cmd.flags = flags;
+    tdx_cmd.data = (__u64)(unsigned long)data;
+
+    switch (level) {
+    case TDX_PLATFORM_IOCTL:
+        r = kvm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+        break;
+    case TDX_VM_IOCTL:
+        r = kvm_vm_ioctl(kvm_state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+        break;
+    case TDX_VCPU_IOCTL:
+        r = kvm_vcpu_ioctl(state, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd);
+        break;
+    default:
+        error_report("Invalid tdx_ioctl_level %d", level);
+        exit(1);
+    }
+
+    return r;
+}
+
+static inline int tdx_platform_ioctl(int cmd_id, __u32 flags, void *data)
+{
+    return __tdx_ioctl(NULL, TDX_PLATFORM_IOCTL, cmd_id, flags, data);
+}
+
+static inline int tdx_vm_ioctl(int cmd_id, __u32 flags, void *data)
+{
+    return __tdx_ioctl(NULL, TDX_VM_IOCTL, cmd_id, flags, data);
+}
+
+static inline int tdx_vcpu_ioctl(void *vcpu_fd, int cmd_id, __u32 flags,
+                                 void *data)
+{
+    return  __tdx_ioctl(vcpu_fd, TDX_VCPU_IOCTL, cmd_id, flags, data);
+}
+
+static void get_tdx_capabilities(void)
+{
+    struct kvm_tdx_capabilities *caps;
+    /* 1st generation of TDX reports 6 cpuid configs */
+    int nr_cpuid_configs = 6;
+    int r, size;
+
+    do {
+        size = sizeof(struct kvm_tdx_capabilities) +
+               nr_cpuid_configs * sizeof(struct kvm_tdx_cpuid_config);
+        caps = g_malloc0(size);
+        caps->nr_cpuid_configs = nr_cpuid_configs;
+
+        r = tdx_platform_ioctl(KVM_TDX_CAPABILITIES, 0, caps);
+        if (r == -E2BIG) {
+            g_free(caps);
+            nr_cpuid_configs *= 2;
+            if (nr_cpuid_configs > KVM_MAX_CPUID_ENTRIES) {
+                error_report("KVM TDX seems broken");
+                exit(1);
+            }
+        } else if (r < 0) {
+            g_free(caps);
+            error_report("KVM_TDX_CAPABILITIES failed: %s\n", strerror(-r));
+            exit(1);
+        }
+    }
+    while (r == -E2BIG);
+
+    tdx_caps = caps;
+}
+
 int tdx_kvm_init(MachineState *ms, Error **errp)
 {
+    if (!tdx_caps) {
+        get_tdx_capabilities();
+    }
+
     return 0;
 }
 
-- 
2.27.0


