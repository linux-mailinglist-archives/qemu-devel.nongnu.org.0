Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C727EA45
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 15:49:41 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNcUG-0005S2-1K
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 09:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kNcMS-0006GY-Ld
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 09:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kNcMN-0005cu-UG
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 09:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601473290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJCOJwuy0qnMblB9QXbD7hfjLj8mv2qXcOGW5yP7M3U=;
 b=BzzZDCRWdsHatht1ITywMdr5VOGD1LR6dMQdLLpEUksgEO4FZ3vZXBpGpGrxSOtVJdtyLu
 nncX/I8yYkCbszcvnZUheIuOThq3FGYM4mzaqhfS0tv1oAleMKiLPlDtqeC3E2zmBe0t4+
 /gv0svHC2+XImdVyYU78gljy1Bxa65M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-7VP_PUlXO7eNtiFIaSSYnA-1; Wed, 30 Sep 2020 09:41:28 -0400
X-MC-Unique: 7VP_PUlXO7eNtiFIaSSYnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8844AADF05
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 13:41:27 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1981D60C05;
 Wed, 30 Sep 2020 13:41:25 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 11/19] i386: introduce hv_cpuid_cache
Date: Wed, 30 Sep 2020 15:40:19 +0200
Message-Id: <20200930134027.1348021-12-vkuznets@redhat.com>
In-Reply-To: <20200930134027.1348021-1-vkuznets@redhat.com>
References: <20200930134027.1348021-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Just like with cpuid_cache, it makes no sense to call
KVM_GET_SUPPORTED_HV_CPUID more than once and instead of (ab)using
env->features[] and/or trying to keep all the code in one place, it is
better to introduce persistent hv_cpuid_cache and hv_cpuid_get_host()
accessor to it.

Note, hv_cpuid_get_fw() is converted to using hv_cpuid_get_host()
just to be removed later with Hyper-V specific feature words.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm.c | 213 +++++++++++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 107 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index a9823d4af7cb..0e6eef6a52c2 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -124,6 +124,7 @@ static int has_exception_payload;
 static bool has_msr_mcg_ext_ctl;
 
 static struct kvm_cpuid2 *cpuid_cache;
+static struct kvm_cpuid2 *hv_cpuid_cache;
 static struct kvm_msr_list *kvm_feature_msrs;
 
 int kvm_has_pit_state2(void)
@@ -1079,9 +1080,36 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
     return cpuid;
 }
 
-static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
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
+
+    entry = cpuid_find_entry(cpuid, func, 0);
+    if (!entry) {
+        return 0;
+    }
+
+    return cpuid_entry_get_reg(entry, reg);
+}
+
+static uint32_t hv_cpuid_get_fw(CPUState *cs, int fw)
+{
     uint32_t func;
     int reg;
 
@@ -1099,30 +1127,13 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
         func = HV_CPUID_ENLIGHTMENT_INFO;
         break;
     default:
-        return -EINVAL;
-    }
-
-    entry = cpuid_find_entry(cpuid, func, 0);
-    if (!entry) {
-        return -ENOENT;
-    }
-
-    switch (reg) {
-    case R_EAX:
-        *r = entry->eax;
-        break;
-    case R_EDX:
-        *r = entry->edx;
-        break;
-    default:
-        return -EINVAL;
+        return 0;
     }
 
-    return 0;
+    return hv_cpuid_get_host(cs, func, reg);
 }
 
-static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
-                                  int feature)
+static int hv_cpuid_check_and_set(CPUState *cs, int feature)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -1155,7 +1166,8 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
             continue;
         }
 
-        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
+        r = hv_cpuid_get_fw(cs, fw);
+        if ((r & bits) != bits) {
             if (hyperv_feat_enabled(cpu, feature)) {
                 fprintf(stderr,
                         "Hyper-V %s is not supported by kernel\n",
@@ -1186,7 +1198,6 @@ static int hyperv_handle_properties(CPUState *cs,
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    struct kvm_cpuid2 *cpuid;
     struct kvm_cpuid_entry2 *c;
     uint32_t cpuid_i = 0;
     int r;
@@ -1214,92 +1225,85 @@ static int hyperv_handle_properties(CPUState *cs,
         }
     }
 
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
-        cpuid = get_supported_hv_cpuid(cs);
-    } else {
-        cpuid = get_supported_hv_cpuid_legacy(cs);
-    }
-
     if (cpu->hyperv_passthrough) {
-        c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
-        if (c) {
-            cpu->hyperv_vendor_id[0] = c->ebx;
-            cpu->hyperv_vendor_id[1] = c->ecx;
-            cpu->hyperv_vendor_id[2] = c->edx;
-            cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
-                                           sizeof(cpu->hyperv_vendor_id) + 1);
-            memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
-                   sizeof(cpu->hyperv_vendor_id));
-        }
-
-        c = cpuid_find_entry(cpuid, HV_CPUID_INTERFACE, 0);
-        if (c) {
-            cpu->hyperv_interface_id[0] = c->eax;
-            cpu->hyperv_interface_id[1] = c->ebx;
-            cpu->hyperv_interface_id[2] = c->ecx;
-            cpu->hyperv_interface_id[3] = c->edx;
-        }
-
-        c = cpuid_find_entry(cpuid, HV_CPUID_VERSION, 0);
-        if (c) {
-            cpu->hyperv_version_id[0] = c->eax;
-            cpu->hyperv_version_id[1] = c->ebx;
-            cpu->hyperv_version_id[2] = c->ecx;
-            cpu->hyperv_version_id[3] = c->edx;
-        }
-
-        c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
-        if (c) {
-            env->features[FEAT_HYPERV_EAX] = c->eax;
-            env->features[FEAT_HYPERV_EBX] = c->ebx;
-            env->features[FEAT_HYPERV_EDX] = c->edx;
-        }
-
-        c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
-        if (c) {
-            cpu->hv_max_vps = c->eax;
-            cpu->hyperv_limits[0] = c->ebx;
-            cpu->hyperv_limits[1] = c->ecx;
-            cpu->hyperv_limits[2] = c->edx;
-        }
-
-        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
-        if (c) {
-            env->features[FEAT_HV_RECOMM_EAX] = c->eax;
-            cpu->hyperv_spinlock_attempts = c->ebx;
-        }
-        c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
-        if (c) {
-            env->features[FEAT_HV_NESTED_EAX] = c->eax;
-        }
+        cpu->hyperv_vendor_id[0] =
+            hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
+        cpu->hyperv_vendor_id[1] =
+            hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_ECX);
+        cpu->hyperv_vendor_id[2] =
+            hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EDX);
+        cpu->hyperv_vendor = g_realloc(cpu->hyperv_vendor,
+                                       sizeof(cpu->hyperv_vendor_id) + 1);
+        memcpy(cpu->hyperv_vendor, cpu->hyperv_vendor_id,
+               sizeof(cpu->hyperv_vendor_id));
+
+        cpu->hyperv_interface_id[0] =
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EAX);
+        cpu->hyperv_interface_id[1] =
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EBX);
+        cpu->hyperv_interface_id[2] =
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_ECX);
+        cpu->hyperv_interface_id[3] =
+            hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EDX);
+
+        cpu->hyperv_version_id[0] =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EAX);
+        cpu->hyperv_version_id[1] =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX);
+        cpu->hyperv_version_id[2] =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_ECX);
+        cpu->hyperv_version_id[3] =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX);
+
+        env->features[FEAT_HYPERV_EAX] =
+            hv_cpuid_get_host(cs, HV_CPUID_FEATURES, R_EAX);
+        env->features[FEAT_HYPERV_EBX] =
+            hv_cpuid_get_host(cs, HV_CPUID_FEATURES, R_EBX);
+        env->features[FEAT_HYPERV_EDX] =
+            hv_cpuid_get_host(cs, HV_CPUID_FEATURES, R_EDX);
+
+        cpu->hv_max_vps = hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS,
+                                            R_EAX);
+        cpu->hyperv_limits[0] =
+            hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS, R_EBX);
+        cpu->hyperv_limits[1] =
+            hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS, R_ECX);
+        cpu->hyperv_limits[2] =
+            hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS, R_EDX);
+
+        env->features[FEAT_HV_RECOMM_EAX] =
+            hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX);
+        cpu->hyperv_spinlock_attempts =
+            hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
+
+        env->features[FEAT_HV_NESTED_EAX] =
+            hv_cpuid_get_host(cs, HV_CPUID_NESTED_FEATURES, R_EAX);
     }
 
     if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
         env->features[FEAT_HV_RECOMM_EAX] |= HV_NO_NONARCH_CORESHARING;
     } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
-        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
-        if (c) {
-            env->features[FEAT_HV_RECOMM_EAX] |=
-                c->eax & HV_NO_NONARCH_CORESHARING;
-        }
+        env->features[FEAT_HV_RECOMM_EAX] |=
+            hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX) &
+            HV_NO_NONARCH_CORESHARING;
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
@@ -1315,8 +1319,7 @@ static int hyperv_handle_properties(CPUState *cs,
     env->features[FEAT_HYPERV_EDX] |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
     if (r) {
-        r = -ENOSYS;
-        goto free;
+        return -ENOSYS;
     }
 
     c = &cpuid_ent[cpuid_i++];
@@ -1373,12 +1376,8 @@ static int hyperv_handle_properties(CPUState *cs,
         c->function = HV_CPUID_NESTED_FEATURES;
         c->eax = env->features[FEAT_HV_NESTED_EAX];
     }
-    r = cpuid_i;
-
-free:
-    g_free(cpuid);
 
-    return r;
+    return cpuid_i;
 }
 
 static Error *hv_passthrough_mig_blocker;
-- 
2.25.4


