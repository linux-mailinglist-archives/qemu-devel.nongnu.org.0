Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42672ED36F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:20:59 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxX5u-0006Nc-S9
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWzh-00089c-0B
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWze-0006JQ-T6
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610032470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z70C8psHCQ2DNITUI5Uatq+NTFtsXU17MEIoDjzUfp4=;
 b=M4aGfoIMJDYJjJ7qtJ8RQAzZjVgISbY+TzxNYXovWtZTSUBw5c3FkGgUdKpi4m/sATHjtN
 HgRCfprRrfqfLX2Z3LKHoNsl36XET6Uq1UbQp/BQD5B+TnNRw2+lFfCUKdDhoP3vgekYI0
 peg7ITG4lYi9CWfK/SW/KfoQ1c4teAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-kqVAf2yzNvCEwk0ZDetqNQ-1; Thu, 07 Jan 2021 10:14:28 -0500
X-MC-Unique: kqVAf2yzNvCEwk0ZDetqNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2E2800D55
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 15:14:26 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACF9119C48;
 Thu,  7 Jan 2021 15:14:24 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/19] i386: introduce hv_cpuid_cache
Date: Thu,  7 Jan 2021 16:14:23 +0100
Message-Id: <20210107151423.540675-1-vkuznets@redhat.com>
In-Reply-To: <20210107150640.539239-1-vkuznets@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 9172a10037fc..21840d34b672 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -126,6 +126,7 @@ static int has_exception_payload;
 static bool has_msr_mcg_ext_ctl;
 
 static struct kvm_cpuid2 *cpuid_cache;
+static struct kvm_cpuid2 *hv_cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
 int kvm_has_pit_state2(void)
@@ -1069,10 +1070,25 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
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
@@ -1082,7 +1098,7 @@ static uint32_t hv_cpuid_get_host(struct kvm_cpuid2 *cpuid, uint32_t func,
     return cpuid_entry_get_reg(entry, reg);
 }
 
-static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
+static bool hyperv_feature_supported(CPUState *cs, int feature)
 {
     uint32_t func, bits;
     int i, reg;
@@ -1097,7 +1113,7 @@ static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
             continue;
         }
 
-        if ((hv_cpuid_get_host(cpuid, func, reg) & bits) != bits) {
+        if ((hv_cpuid_get_host(cs, func, reg) & bits) != bits) {
             return false;
         }
     }
@@ -1105,8 +1121,7 @@ static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
     return true;
 }
 
-static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
-                                  int feature)
+static int hv_cpuid_check_and_set(CPUState *cs, int feature)
 {
     X86CPU *cpu = X86_CPU(cs);
     uint64_t deps;
@@ -1129,7 +1144,7 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
         deps &= ~(1ull << dep_feat);
     }
 
-    if (!hyperv_feature_supported(cpuid, feature)) {
+    if (!hyperv_feature_supported(cs, feature)) {
         if (hyperv_feat_enabled(cpu, feature)) {
             fprintf(stderr,
                     "Hyper-V %s is not supported by kernel\n",
@@ -1182,7 +1197,6 @@ static int hyperv_handle_properties(CPUState *cs,
                                     struct kvm_cpuid_entry2 *cpuid_ent)
 {
     X86CPU *cpu = X86_CPU(cs);
-    struct kvm_cpuid2 *cpuid;
     struct kvm_cpuid_entry2 *c;
     uint32_t cpuid_i = 0;
     int r;
@@ -1208,71 +1222,65 @@ static int hyperv_handle_properties(CPUState *cs,
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
                sizeof(cpu->hyperv_vendor_id));
 
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
@@ -1285,8 +1293,7 @@ static int hyperv_handle_properties(CPUState *cs,
     }
 
     if (r) {
-        r = -ENOSYS;
-        goto free;
+        return -ENOSYS;
     }
 
     c = &cpuid_ent[cpuid_i++];
@@ -1328,7 +1335,7 @@ static int hyperv_handle_properties(CPUState *cs,
     if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
         c->eax |= HV_NO_NONARCH_CORESHARING;
     } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
-        c->eax |= hv_cpuid_get_host(cpuid, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
+        c->eax |= hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
             HV_NO_NONARCH_CORESHARING;
     }
 
@@ -1353,12 +1360,8 @@ static int hyperv_handle_properties(CPUState *cs,
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
2.29.2


