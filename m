Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B643BF389
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:23:58 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ilh-0005PH-KC
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILb-0003OM-QU
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:57:03 -0400
Received: from mga06.intel.com ([134.134.136.31]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILZ-0007ML-CE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534912"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770079"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:57 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 28/44] i386/tdx: Force x2apic mode and routing for TDs
Date: Wed,  7 Jul 2021 17:54:58 -0700
Message-Id: <5524acbf0b403fea046978456129d4c59a06f8a0.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

TDX requires x2apic and "resets" vCPUs to have x2apic enabled.  Model
this in QEMU and unconditionally enable x2apic interrupt routing.

This fixes issues where interrupts from IRQFD would not get forwarded to
the guest due to KVM silently dropping the invalid routing entry.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/intc/apic_common.c           | 12 ++++++++++++
 include/hw/i386/apic.h          |  1 +
 include/hw/i386/apic_internal.h |  1 +
 target/i386/kvm/tdx.c           |  7 +++++++
 4 files changed, 21 insertions(+)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 2a20982066..b95fed95da 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -262,6 +262,15 @@ void apic_designate_bsp(DeviceState *dev, bool bsp)
     }
 }
 
+void apic_force_x2apic(DeviceState *dev)
+{
+    if (dev == NULL) {
+        return;
+    }
+
+    APIC_COMMON(dev)->force_x2apic = true;
+}
+
 static void apic_reset_common(DeviceState *dev)
 {
     APICCommonState *s = APIC_COMMON(dev);
@@ -270,6 +279,9 @@ static void apic_reset_common(DeviceState *dev)
 
     bsp = s->apicbase & MSR_IA32_APICBASE_BSP;
     s->apicbase = APIC_DEFAULT_ADDRESS | bsp | MSR_IA32_APICBASE_ENABLE;
+    if (s->force_x2apic) {
+        s->apicbase |= MSR_IA32_APICBASE_EXTD;
+    }
     s->id = s->initial_apic_id;
 
     apic_reset_irq_delivered();
diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index da1d2fe155..7d05abd7e0 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -19,6 +19,7 @@ void apic_init_reset(DeviceState *s);
 void apic_sipi(DeviceState *s);
 void apic_poll_irq(DeviceState *d);
 void apic_designate_bsp(DeviceState *d, bool bsp);
+void apic_force_x2apic(DeviceState *d);
 int apic_get_highest_priority_irr(DeviceState *dev);
 
 /* pc.c */
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index c175e7e718..eda0b5a587 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -187,6 +187,7 @@ struct APICCommonState {
     DeviceState *vapic;
     hwaddr vapic_paddr; /* note: persistence via kvmvapic */
     bool legacy_instance_id;
+    bool force_x2apic;
 };
 
 typedef struct VAPICState {
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index c348626dbf..47a502051c 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -139,6 +139,11 @@ int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     tdx_caps->nr_cpuid_configs = TDX1_MAX_NR_CPUID_CONFIGS;
     tdx_ioctl(KVM_TDX_CAPABILITIES, 0, tdx_caps);
 
+    if (!kvm_enable_x2apic()) {
+        error_report("Failed to enable x2apic in KVM");
+        exit(1);
+    }
+
     qemu_add_machine_init_done_late_notifier(&tdx_machine_done_late_notify);
 
     return 0;
@@ -296,6 +301,8 @@ void tdx_post_init_vcpu(CPUState *cpu)
 
     hob = tdx_get_hob_entry(tdx);
     _tdx_ioctl(cpu, KVM_TDX_INIT_VCPU, 0, (void *)hob->address);
+
+    apic_force_x2apic(X86_CPU(cpu)->apic_state);
 }
 
 static bool tdx_guest_get_debug(Object *obj, Error **errp)
-- 
2.25.1


