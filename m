Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA044DC860
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:08:12 +0100 (CET)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqnT-0007KP-9x
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:08:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfE-00082J-Ia
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:35297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfB-0003xY-Vl
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525578; x=1679061578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dYwgyA4CmlVvqTrRWnPrKwx4UNncxHfR5e/EXpYyUxw=;
 b=ftLGhU4h2VtafCaXiOMS2DZrDMtxB3xg4PDMFdlb7fQXUjr/JhG/qAsq
 4RbbaDmVIiopNw9QqZXvI8lSE6f58taU+rdyMXu5TsmapIaBo/NE9L/Z0
 IIY6NOr3oX87ms2oz11IO6v3DqP4TkpIGoFaNDiFjru3acOQ0Hee7lsL+
 ud5fkBoKu/vZWaLI2889WZ2qo8sd01x4n3YhW1HKLgRkr2415TlPV9f+C
 AJAv8JD8+966j/5SdzWduGhMXrVmlskGmsR5ZgQ0GW31428GzOoSJZe6x
 8E8UsAeZs6xAahHhOQOyLcPtVuX94/2ss9e3eHND9r7ksBZrymWI981qD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237482016"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237482016"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 06:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541377842"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 06:59:27 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 03/36] target/i386: Implement mc->kvm_type() to get VM
 type
Date: Thu, 17 Mar 2022 21:58:40 +0800
Message-Id: <20220317135913.2166202-4-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TDX VM requires VM type KVM_X86_TDX_VM to be passed to
kvm_ioctl(KVM_CREATE_VM). Hence implement mc->kvm_type() for i386
architecture.

If tdx-guest object is specified to confidential-guest-support, like,

  qemu -machine ...,confidential-guest-support=tdx0 \
       -object tdx-guest,id=tdx0,...

it parses VM type as KVM_X86_TDX_VM. Otherwise, it's KVM_X86_DEFAULT_VM.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/x86.c              |  6 ++++++
 target/i386/kvm/kvm.c      | 30 ++++++++++++++++++++++++++++++
 target/i386/kvm/kvm_i386.h |  1 +
 3 files changed, 37 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 8e30daccdb7c..10a88faf4c0e 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1330,6 +1330,11 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
     qapi_free_SgxEPCList(list);
 }
 
+static int x86_kvm_type(MachineState *ms, const char *vm_type)
+{
+    return kvm_get_vm_type(ms, vm_type);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1353,6 +1358,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
+    mc->kvm_type = x86_kvm_type;
     x86mc->save_tsc_khz = true;
     x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ef2c68a6f475..89d5eb58cb3e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -30,6 +30,7 @@
 #include "sysemu/runstate.h"
 #include "kvm_i386.h"
 #include "sev.h"
+#include "tdx.h"
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
@@ -139,6 +140,35 @@ static struct kvm_msr_list *kvm_feature_msrs;
 #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
 static RateLimit bus_lock_ratelimit_ctrl;
 
+static const char* vm_type_name[] = {
+    [KVM_X86_DEFAULT_VM] = "X86_DEFAULT_VM",
+    [KVM_X86_TDX_VM] = "X86_TDX_VM",
+};
+
+int kvm_get_vm_type(MachineState *ms, const char *vm_type)
+{
+    int kvm_type = KVM_X86_DEFAULT_VM;
+
+    if (ms->cgs && object_dynamic_cast(OBJECT(ms->cgs), TYPE_TDX_GUEST)) {
+        kvm_type = KVM_X86_TDX_VM;
+    }
+
+    /*
+     * old KVM doesn't support KVM_CAP_VM_TYPES and KVM_X86_DEFAULT_VM
+     * is always supported
+     */
+    if (kvm_type == KVM_X86_DEFAULT_VM) {
+        return kvm_type;
+    }
+
+    if (!(kvm_check_extension(KVM_STATE(ms->accelerator), KVM_CAP_VM_TYPES) & BIT(kvm_type))) {
+        error_report("vm-type %s not supported by KVM", vm_type_name[kvm_type]);
+        exit(1);
+    }
+
+    return kvm_type;
+}
+
 int kvm_has_pit_state2(void)
 {
     return has_pit_state2;
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 4124912c202e..b434feaa6b1d 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -37,6 +37,7 @@ bool kvm_has_adjust_clock(void);
 bool kvm_has_adjust_clock_stable(void);
 bool kvm_has_exception_payload(void);
 void kvm_synchronize_all_tsc(void);
+int kvm_get_vm_type(MachineState *ms, const char *vm_type);
 void kvm_arch_reset_vcpu(X86CPU *cs);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 
-- 
2.27.0


