Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613431C582
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:27:45 +0100 (CET)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq5Y-00050v-1E
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpuA-0006lI-T0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:59 -0500
Received: from mga17.intel.com ([192.55.52.151]:25646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpu5-0001e2-Mx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:58 -0500
IronPort-SDR: oTZJ6/vcHVrqmEdQu+dGEJEcv9HgYYHvZFuJNwufj70KUDCjNmXiEDlDneFHk1sj137wUX3Tk4
 xbMLfGf7ZXFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558778"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558778"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:54 -0800
IronPort-SDR: gHmUyr11fBp2QtsyUExysJOR1o7DMdVzpPdWOdtiU41UT+vJ/ns3dagW289B7ehtoSVVSnZgza
 E0eJEnP6mlPg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705454"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:53 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 22/23] i386/tdx: Force x2apic mode and routing for TDs
Date: Mon, 15 Feb 2021 18:13:18 -0800
Message-Id: <99972768126128546e54fca3445c9673a527b67f.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 hw/intc/apic_common.c           | 12 ++++++++++++
 include/hw/i386/apic.h          |  1 +
 include/hw/i386/apic_internal.h |  1 +
 target/i386/kvm/tdx.c           |  7 +++++++
 4 files changed, 21 insertions(+)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 97dd96dffa..6a69027377 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -263,6 +263,15 @@ void apic_designate_bsp(DeviceState *dev, bool bsp)
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
@@ -271,6 +280,9 @@ static void apic_reset_common(DeviceState *dev)
 
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
index 007d33989b..b4bd157fe1 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -137,6 +137,11 @@ int tdx_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     tdx_caps->nr_cpuid_configs = TDX1_MAX_NR_CPUID_CONFIGS;
     tdx_ioctl(KVM_TDX_CAPABILITIES, 0, tdx_caps);
 
+    if (!kvm_enable_x2apic()) {
+        error_report("Failed to enable x2apic in KVM");
+        exit(1);
+    }
+
     qemu_add_machine_init_done_late_notifier(&tdx_machine_done_late_notify);
     return 0;
 }
@@ -279,6 +284,8 @@ void tdx_post_init_vcpu(CPUState *cpu)
 
     hob = tdx_get_hob_entry(tdx);
     _tdx_ioctl(cpu, KVM_TDX_INIT_VCPU, 0, (void *)hob->address);
+
+    apic_force_x2apic(X86_CPU(cpu)->apic_state);
 }
 
 static bool tdx_guest_get_debug(Object *obj, Error **errp)
-- 
2.17.1


