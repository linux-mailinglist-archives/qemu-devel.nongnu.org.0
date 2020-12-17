Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918D2DD1B7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:53:01 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsmC-0002qy-Js
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kpsja-0008Of-Hu
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kpsjY-0005gJ-Jv
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608209416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaoFFn4EZX5K6u1mTrw18nR7Kxg/hrIggBqDFeL2iY0=;
 b=ifT9FyGcA1rY9+wiC21DJ73EUDxiGJsbKxScmIaF4BcrnQ+aLjp7Nu3226cDEGctYSuAj+
 eGDcbznksvCloeFj4Z0tKbqTnJe7eTXDCNAElQh48tZ2x5fl4ysNmp2J58PeWkHqd4YUCa
 cwkhUllghTJluz3Rvd1ozb45WewADoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-HgpdCGGvP1KhBLGeJ31NQA-1; Thu, 17 Dec 2020 07:50:14 -0500
X-MC-Unique: HgpdCGGvP1KhBLGeJ31NQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 655A7107ACE3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:50:13 +0000 (UTC)
Received: from vitty.brq.redhat.com (ovpn-116-238.ams2.redhat.com
 [10.36.116.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 097745D9C0;
 Thu, 17 Dec 2020 12:50:08 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] i386: provide simple 'hyperv=on' option to x86 machine
 types
Date: Thu, 17 Dec 2020 13:49:59 +0100
Message-Id: <20201217124959.262639-3-vkuznets@redhat.com>
In-Reply-To: <20201217124959.262639-1-vkuznets@redhat.com>
References: <20201217124959.262639-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
requires listing all currently supported enlightenments ("hv_*" CPU
features) explicitly. We do have a 'hv_passthrough' mode enabling
everything but it can't be used in production as it prevents migration.

Introduce a simple 'hyperv=on' option for all x86 machine types enabling
all currently supported Hyper-V enlightenments. Later, when new
enlightenments get implemented, we will be adding them to newer machine
types only (by disabling them for legacy machine types) thus preserving
migration.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt       |  8 ++++++++
 hw/i386/x86.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/i386/x86.h |  7 +++++++
 3 files changed, 57 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5df00da54fc4..1a76a07f8417 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -29,6 +29,14 @@ When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
 identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
 and features are kept in leaves 0x40000100..0x40000101.
 
+Hyper-V enlightenments can be enabled in bulk by specifying 'hyperv=on' to an
+x86 machine type:
+
+  qemu-system-x86_64 -machine q35,accel=kvm,kernel-irqchip=split,hyperv=on ...
+
+Note, new enlightenments are only added to the latest (in-develompent) machine
+type, older machine types keep the list of the supported features intact to
+safeguard migration.
 
 3. Existing enlightenments
 ===========================
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 49e1d419b2ce..7a8e0313aedb 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -418,6 +418,18 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     cs->cpu_index = idx;
 
     numa_cpu_pre_plug(cpu_slot, dev, errp);
+
+    if (x86ms->hyperv_enabled) {
+        X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
+        uint64_t hyperv_features = x86mc->default_hyperv_features;
+
+        /* Enlightened VMCS is only available on Intel/VMX */
+        if (!kvm_hv_evmcs_available()) {
+            hyperv_features &= ~BIT(HYPERV_FEAT_EVMCS);
+        }
+
+        cpu->hyperv_features |= hyperv_features;
+    }
 }
 
 CpuInstanceProperties
@@ -1199,6 +1211,20 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
 }
 
+static bool x86_machine_get_hyperv(Object *obj, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    return x86ms->hyperv_enabled;
+}
+
+static void x86_machine_set_hyperv(Object *obj, bool value, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    x86ms->hyperv_enabled = value;
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1222,6 +1248,16 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     x86mc->save_tsc_khz = true;
     nc->nmi_monitor_handler = x86_nmi;
 
+    /* Hyper-V features enabled with 'hyperv=on' */
+    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
+        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
+        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
+        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
+        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
+        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
+        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
+        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);
+
     object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
         x86_machine_get_smm, x86_machine_set_smm,
         NULL, NULL);
@@ -1233,6 +1269,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, X86_MACHINE_ACPI,
         "Enable ACPI");
+
+    object_class_property_add_bool(oc, X86_MACHINE_HYPERV,
+        x86_machine_get_hyperv, x86_machine_set_hyperv);
+
+    object_class_property_set_description(oc, X86_MACHINE_HYPERV,
+        "Enable Hyper-V enlightenments");
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 56080bd1fb14..c6e9c8500357 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -38,6 +38,9 @@ struct X86MachineClass {
     bool save_tsc_khz;
     /* Enables contiguous-apic-ID mode */
     bool compat_apic_id_mode;
+
+    /* Hyper-V features enabled with 'hyperv=on' */
+    uint64_t default_hyperv_features;
 };
 
 struct X86MachineState {
@@ -72,10 +75,14 @@ struct X86MachineState {
      * will be translated to MSI messages in the address space.
      */
     AddressSpace *ioapic_as;
+
+    /* Hyper-V emulation */
+    bool hyperv_enabled;
 };
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
+#define X86_MACHINE_HYPERV           "hyperv"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
-- 
2.29.2


