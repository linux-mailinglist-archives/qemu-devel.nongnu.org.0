Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0C328033
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:03:28 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGj8w-0002oA-UO
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGixU-0006eh-N2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGixR-0008PA-7o
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQU1cTJ7XO8XceYhXedqJ0hEdKprF45Wab9FXCXL/T4=;
 b=QB7Z92l0tOZLDaw1BuXJ7gurySQOuC56ihvnDH8CqPCe9+NzpWNEWci+9wpl78KAJ36prK
 QroT2qAFw1Ur71OOnf0lbNgPD/jX/dtUCKKVAzQeHDa9v+qTftQk/nae/j7DK8pH65CX7C
 NguSkaBAv4dYyAJK9QTz6OUmH+nOm0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-RhdaBjRZPA2BLuq_8vL2kA-1; Mon, 01 Mar 2021 08:51:30 -0500
X-MC-Unique: RhdaBjRZPA2BLuq_8vL2kA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10F31CC626
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:51:30 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DA1062677;
 Mon,  1 Mar 2021 13:51:28 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/17] i386: switch hyperv_expand_features() to using
 error_setg()
Date: Mon,  1 Mar 2021 14:50:57 +0100
Message-Id: <20210301135103.306003-12-vkuznets@redhat.com>
In-Reply-To: <20210301135103.306003-1-vkuznets@redhat.com>
References: <20210301135103.306003-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Use standard error_setg() mechanism in hyperv_expand_features().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 101 +++++++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 40 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 34820c3ef29a..5cdceb6e34c4 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1135,7 +1135,7 @@ static bool hyperv_feature_supported(CPUState *cs, int feature)
     return true;
 }
 
-static int hv_cpuid_check_and_set(CPUState *cs, int feature)
+static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
     uint64_t deps;
@@ -1149,20 +1149,18 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature)
     while (deps) {
         dep_feat = ctz64(deps);
         if (!(hyperv_feat_enabled(cpu, dep_feat))) {
-                fprintf(stderr,
-                        "Hyper-V %s requires Hyper-V %s\n",
-                        kvm_hyperv_properties[feature].desc,
-                        kvm_hyperv_properties[dep_feat].desc);
-                return 1;
+            error_setg(errp, "Hyper-V %s requires Hyper-V %s",
+                       kvm_hyperv_properties[feature].desc,
+                       kvm_hyperv_properties[dep_feat].desc);
+            return 1;
         }
         deps &= ~(1ull << dep_feat);
     }
 
     if (!hyperv_feature_supported(cs, feature)) {
         if (hyperv_feat_enabled(cpu, feature)) {
-            fprintf(stderr,
-                    "Hyper-V %s is not supported by kernel\n",
-                    kvm_hyperv_properties[feature].desc);
+            error_setg(errp, "Hyper-V %s is not supported by kernel",
+                       kvm_hyperv_properties[feature].desc);
             return 1;
         } else {
             return 0;
@@ -1209,13 +1207,12 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
  * of 'hv_passthrough' mode and fills the environment with all supported
  * Hyper-V features.
  */
-static int hyperv_expand_features(CPUState *cs)
+static void hyperv_expand_features(CPUState *cs, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
-    int r;
 
     if (!hyperv_enabled(cpu))
-        return 0;
+        return;
 
     if (cpu->hyperv_passthrough) {
         cpu->hyperv_vendor_id[0] =
@@ -1262,37 +1259,60 @@ static int hyperv_expand_features(CPUState *cs)
     }
 
     /* Features */
-    r = hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI);
-    r |= hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT);
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI, errp)) {
+        return;
+    }
+    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT, errp)) {
+        return;
+    }
 
     /* Additional dependencies not covered by kvm_hyperv_properties[] */
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC) &&
         !cpu->hyperv_synic_kvm_only &&
         !hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX)) {
-        fprintf(stderr, "Hyper-V %s requires Hyper-V %s\n",
-                kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
-                kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
-        r |= 1;
-    }
-
-    if (r) {
-        return -ENOSYS;
+        error_setg(errp, "Hyper-V %s requires Hyper-V %s",
+                   kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
+                   kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
     }
-
-    return 0;
 }
 
 /*
@@ -1527,9 +1547,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
     env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
 
     /* Paravirtualization CPUIDs */
-    r = hyperv_expand_features(cs);
-    if (r < 0) {
-        return r;
+    hyperv_expand_features(cs, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return -ENOSYS;
     }
 
     if (hyperv_enabled(cpu)) {
-- 
2.29.2


