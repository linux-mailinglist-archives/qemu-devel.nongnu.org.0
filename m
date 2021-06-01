Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F93979D1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:14:00 +0200 (CEST)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8tr-00078u-6j
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qV-0002Ce-QR
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qT-0005gP-HJ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWxxuc+yNU6M5AgsLtoKdH+zz1WdNZ2CPoRpA5Kh3LA=;
 b=fSXorZEKzbpvCAYqCM5bIYp8KJ7RoOdYu+P0MndRVGMryBGyeTjiSDf9qSFyC6cLI5QJ1R
 KdrvHTPayY/wpC4KUvP5q9q0+MxrO2d+gH8107zvtNc28r/ylpKi1YWmmDq7p+hE9kTJEc
 FGznZfH3BXOxorJkgfgdOA5jJCtZUpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-op77rHRrOfOISzVY-o0DYg-1; Tue, 01 Jun 2021 14:10:25 -0400
X-MC-Unique: op77rHRrOfOISzVY-o0DYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA28107ACED;
 Tue,  1 Jun 2021 18:10:24 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF8D661008;
 Tue,  1 Jun 2021 18:10:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/24] i386: stop using env->features[] for filling Hyper-V
 CPUIDs
Date: Tue,  1 Jun 2021 14:10:01 -0400
Message-Id: <20210601181014.2568861-12-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

As a preparatory patch to dropping Hyper-V CPUID leaves from
feature_word_info[] stop using env->features[] as a temporary
storage of Hyper-V CPUIDs, just build Hyper-V CPUID leaves directly
from kvm_hyperv_properties[] data.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210422161130.652779-5-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c | 80 +++++++++++++++++++++++--------------------
 2 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index da72aa52286..681f11607ff 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1699,6 +1699,7 @@ struct X86CPU {
     uint32_t hyperv_interface_id[4];
     uint32_t hyperv_version_id[4];
     uint32_t hyperv_limits[3];
+    uint32_t hyperv_nested[4];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4cd4df223fc..346528c6496 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1112,7 +1112,6 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
                                   int feature)
 {
     X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
     uint32_t r, fw, bits;
     uint64_t deps;
     int i, dep_feat;
@@ -1152,8 +1151,6 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
                 return 0;
             }
         }
-
-        env->features[fw] |= bits;
     }
 
     if (cpu->hyperv_passthrough) {
@@ -1163,6 +1160,29 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
     return 0;
 }
 
+static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t fw)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    uint32_t r = 0;
+    int i, j;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties); i++) {
+        if (!hyperv_feat_enabled(cpu, i)) {
+            continue;
+        }
+
+        for (j = 0; j < ARRAY_SIZE(kvm_hyperv_properties[i].flags); j++) {
+            if (kvm_hyperv_properties[i].flags[j].fw != fw) {
+                continue;
+            }
+
+            r |= kvm_hyperv_properties[i].flags[j].bits;
+        }
+    }
+
+    return r;
+}
+
 /*
  * Fill in Hyper-V CPUIDs. Returns the number of entries filled in cpuid_ent in
  * case of success, errno < 0 in case of failure and 0 when no Hyper-V
@@ -1172,9 +1192,8 @@ static int hyperv_handle_properties(CPUState *cs,
                                     struct kvm_cpuid_entry2 *cpuid_ent)
 {
     X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
     struct kvm_cpuid2 *cpuid;
-    struct kvm_cpuid_entry2 *c;
+    struct kvm_cpuid_entry2 *c, *c2;
     uint32_t cpuid_i = 0;
     int r;
 
@@ -1195,9 +1214,7 @@ static int hyperv_handle_properties(CPUState *cs,
         }
 
         if (!r) {
-            env->features[FEAT_HV_RECOMM_EAX] |=
-                HV_ENLIGHTENED_VMCS_RECOMMENDED;
-            env->features[FEAT_HV_NESTED_EAX] = evmcs_version;
+            cpu->hyperv_nested[0] = evmcs_version;
         }
     }
 
@@ -1236,13 +1253,6 @@ static int hyperv_handle_properties(CPUState *cs,
             cpu->hyperv_version_id[3] = c->edx;
         }
 
-        c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
-        if (c) {
-            env->features[FEAT_HYPERV_EAX] = c->eax;
-            env->features[FEAT_HYPERV_EBX] = c->ebx;
-            env->features[FEAT_HYPERV_EDX] = c->edx;
-        }
-
         c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
         if (c) {
             cpu->hv_max_vps = c->eax;
@@ -1253,23 +1263,8 @@ static int hyperv_handle_properties(CPUState *cs,
 
         c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
         if (c) {
-            env->features[FEAT_HV_RECOMM_EAX] = c->eax;
             cpu->hyperv_spinlock_attempts = c->ebx;
         }
-        c = cpuid_find_entry(cpuid, HV_CPUID_NESTED_FEATURES, 0);
-        if (c) {
-            env->features[FEAT_HV_NESTED_EAX] = c->eax;
-        }
-    }
-
-    if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
-        env->features[FEAT_HV_RECOMM_EAX] |= HV_NO_NONARCH_CORESHARING;
-    } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
-        c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
-        if (c) {
-            env->features[FEAT_HV_RECOMM_EAX] |=
-                c->eax & HV_NO_NONARCH_CORESHARING;
-        }
     }
 
     /* Features */
@@ -1299,9 +1294,6 @@ static int hyperv_handle_properties(CPUState *cs,
         r |= 1;
     }
 
-    /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
-    env->features[FEAT_HYPERV_EDX] |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
-
     if (r) {
         r = -ENOSYS;
         goto free;
@@ -1331,15 +1323,27 @@ static int hyperv_handle_properties(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_FEATURES;
-    c->eax = env->features[FEAT_HYPERV_EAX];
-    c->ebx = env->features[FEAT_HYPERV_EBX];
-    c->edx = env->features[FEAT_HYPERV_EDX];
+    c->eax = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EAX);
+    c->ebx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EBX);
+    c->edx = hv_build_cpuid_leaf(cs, FEAT_HYPERV_EDX);
+
+    /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
+    c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_ENLIGHTMENT_INFO;
-    c->eax = env->features[FEAT_HV_RECOMM_EAX];
+    c->eax = hv_build_cpuid_leaf(cs, FEAT_HV_RECOMM_EAX);
     c->ebx = cpu->hyperv_spinlock_attempts;
 
+    if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
+        c->eax |= HV_NO_NONARCH_CORESHARING;
+    } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
+        c2 = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
+        if (c2) {
+            c->eax |= c2->eax & HV_NO_NONARCH_CORESHARING;
+        }
+    }
+
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_IMPLEMENT_LIMITS;
     c->eax = cpu->hv_max_vps;
@@ -1359,7 +1363,7 @@ static int hyperv_handle_properties(CPUState *cs,
 
         c = &cpuid_ent[cpuid_i++];
         c->function = HV_CPUID_NESTED_FEATURES;
-        c->eax = env->features[FEAT_HV_NESTED_EAX];
+        c->eax = cpu->hyperv_nested[0];
     }
     r = cpuid_i;
 
-- 
2.30.2


