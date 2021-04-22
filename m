Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4593684B7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:22:13 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZc5j-0005Vz-JO
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbw6-0003mu-Js
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvp-00034n-PR
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhgyvW/rIrk1fZOGyLYp2Y5zzHH6cetGbykS4Ufe3Ls=;
 b=OykCpWObYWMjPUk8ahU+auPpy4eTsZAPhyy2W/r92T2POVjHT03B16FvWcYu0zX4mDumjK
 w2UH5rzut0Znsf2bumN3Ta38HhmnqEb0oWkTwZXO9cghN6m9nZaCrPQDTWVMUg8VGEDK4C
 aVsObJ66AfA53dFBa2jc2QhliFKyxVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-PRdQyCBVPf2Mpa_wH7iOvg-1; Thu, 22 Apr 2021 12:11:55 -0400
X-MC-Unique: PRdQyCBVPf2Mpa_wH7iOvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 561A118397A4
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:11:54 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6302BFE7;
 Thu, 22 Apr 2021 16:11:52 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/19] i386: introduce hv_cpuid_cache
Date: Thu, 22 Apr 2021 18:11:19 +0200
Message-Id: <20210422161130.652779-9-vkuznets@redhat.com>
In-Reply-To: <20210422161130.652779-1-vkuznets@redhat.com>
References: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like with cpuid_cache, it makes no sense to call
KVM_GET_SUPPORTED_HV_CPUID more than once and instead of (ab)using
env->features[] and/or trying to keep all the code in one place, it is
better to introduce persistent hv_cpuid_cache and hv_cpuid_get_host()
accessor to it.

Note, hv_cpuid_get_fw() is converted to using hv_cpuid_get_host()
just to be removed later with Hyper-V specific feature words.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 109 ++++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 9dc085ffc9b2..3694c3f596e5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -128,6 +128,7 @@ static int has_exception_payload;
 static bool has_msr_mcg_ext_ctl;
 
 static struct kvm_cpuid2 *cpuid_cache;
+static struct kvm_cpuid2 *hv_cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
 int kvm_has_pit_state2(void)
@@ -1066,10 +1067,25 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
     return cpuid;
 }
 
-static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
-                                  int reg)
+static uint32_t hv_cpuid_get_host(CPUState *cs, uint32_t func, int reg)
 {
     struct kvm_cpuid_entry2 *entry;
+    struct kvm_cpuid2 *cpuid;
+
+    if (hv_cpuid_cache) {
+        cpuid = hv_cpuid_cache;
+    } else {
+        if (kvm_check_extension(kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
+            cpuid = get_supported_hv_cpuid(cs);
+        } else {
+            cpuid = get_supported_hv_cpuid_legacy(cs);
+        }
+        hv_cpuid_cache = cpuid;
+    }
+
+    if (!cpuid) {
+        return 0;
+    }
 
     entry = cpuid_find_entry(cpuid, func, 0);
     if (!entry) {
@@ -1079,7 +1095,7 @@ static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
     return cpuid_entry_get_reg(entry, reg);
 }
 
-static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
+static bool hyperv_feature_supported(CPUState *cs, int feature)
 {
     uint32_t func, bits;
     int i, reg;
@@ -1094,7 +1110,7 @@ static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
             continue;
         }
 
-        if ((hv_cpuid_get_host(cpuid, func, reg) & bits) != bits) {
+        if ((hv_cpuid_get_host(cs, func, reg) & bits) != bits) {
             return false;
         }
     }
@@ -1102,8 +1118,7 @@ static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
     return true;
 }
 
-static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
-                                  int feature)
+static int hv_cpuid_check_and_set(CPUState *cs, int feature)
 {
     X86CPU *cpu = X86_CPU(cs);
     uint64_t deps;
@@ -1126,7 +1141,7 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
         deps &= ~(1ull << dep_feat);
     }
 
-    if (!hyperv_feature_supported(cpuid, feature)) {
+    if (!hyperv_feature_supported(cs, feature)) {
         if (hyperv_feat_enabled(cpu, feature)) {
             fprintf(stderr,
                     "Hyper-V %s is not supported by kernel\n",
@@ -1179,7 +1194,6 @@ static int hyperv_handle_properties(CPUState *cs,
                                     struct kvm_cpuid_entry2 *cpuid_ent)
 {
     X86CPU *cpu = X86_CPU(cs);
-    struct kvm_cpuid2 *cpuid;
     struct kvm_cpuid_entry2 *c;
     uint32_t cpuid_i = 0;
     int r;
@@ -1205,19 +1219,13 @@ static int hyperv_handle_properties(CPUState *cs,
         }
     }
 
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
-        cpuid = get_supported_hv_cpuid(cs);
-    } else {
-        cpuid = get_supported_hv_cpuid_legacy(cs);
-    }
-
     if (cpu->hyperv_passthrough) {
         cpu->hyperv_vendor_id[0] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
+            hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
         cpu->hyperv_vendor_id[1] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_ECX);
+            hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_ECX);
         cpu->hyperv_vendor_id[2] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EDX);
+            hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EDX);
         cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
                                        sizeof(cpu->hyperv_vendor_id) + 1);
         memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
@@ -1225,52 +1233,52 @@ static int hyperv_handle_properties(CPUState *cs,
         cpu->hyperv_vendor[sizeof(cpu->hyperv_vendor_id)] = 0;
 
         cpu->hyperv_interface_id[0] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EAX);
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EAX);
         cpu->hyperv_interface_id[1] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EBX);
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EBX);
         cpu->hyperv_interface_id[2] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_ECX);
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_ECX);
         cpu->hyperv_interface_id[3] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_INTERFACE, R_EDX);
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EDX);
 
         cpu->hyperv_version_id[0] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EAX);
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EAX);
         cpu->hyperv_version_id[1] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EBX);
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX);
         cpu->hyperv_version_id[2] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_ECX);
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_ECX);
         cpu->hyperv_version_id[3] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_VERSION, R_EDX);
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX);
 
-        cpu->hv_max_vps = hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS,
+        cpu->hv_max_vps = hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS,
                                             R_EAX);
         cpu->hyperv_limits[0] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_EBX);
+            hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS, R_EBX);
         cpu->hyperv_limits[1] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_ECX);
+            hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS, R_ECX);
         cpu->hyperv_limits[2] =
-            hv_cpuid_get_host(cpuid, HV_CPUID_IMPLEMENT_LIMITS, R_EDX);
+            hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS, R_EDX);
 
         cpu->hyperv_spinlock_attempts =
-            hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
+            hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
     }
 
     /* Features */
-    r = hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RELAXED);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_VAPIC);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_TIME);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_CRASH);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RESET);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_VPINDEX);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_RUNTIME);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_SYNIC);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_STIMER);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_FREQUENCIES);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_REENLIGHTENMENT);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_TLBFLUSH);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_EVMCS);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_IPI);
-    r |= hv_cpuid_check_and_set(cs, cpuid, HYPERV_FEAT_STIMER_DIRECT);
+    r = hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI);
+    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT);
 
     /* Additional dependencies not covered by kvm_hyperv_properties[] */
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
@@ -1283,8 +1291,7 @@ static int hyperv_handle_properties(CPUState *cs,
     }
 
     if (r) {
-        r = -ENOSYS;
-        goto free;
+        return -ENOSYS;
     }
 
     c = &cpuid_ent[cpuid_i++];
@@ -1326,7 +1333,7 @@ static int hyperv_handle_properties(CPUState *cs,
     if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
         c->eax |= HV_NO_NONARCH_CORESHARING;
     } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
-        c->eax |= hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
+        c->eax |= hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
             HV_NO_NONARCH_CORESHARING;
     }
 
@@ -1351,12 +1358,8 @@ static int hyperv_handle_properties(CPUState *cs,
         c->function = HV_CPUID_NESTED_FEATURES;
         c->eax = cpu->hyperv_nested[0];
     }
-    r = cpuid_i;
 
-free:
-    g_free(cpuid);
-
-    return r;
+    return cpuid_i;
 }
 
 static Error *hv_passthrough_mig_blocker;
-- 
2.30.2


