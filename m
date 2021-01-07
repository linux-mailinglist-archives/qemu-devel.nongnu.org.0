Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240272ED360
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:17:13 +0100 (CET)
Received: from localhost ([::1]:43258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxX2G-0001om-5f
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWzp-0008O7-NE
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWzn-0006N5-Oz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610032479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dylFpdxKvzeQWq22EFU6K9lDDZCgTWp1HUbfUkS1ooQ=;
 b=blPLFUwY3ATT3PHy3gK5aMSTcAJ4eJ1iLfInecakdAtUyulWpkiqL65fZHDT+oVcRzO1pi
 m8n2LAPbmSSu22Vhpi5beKA57vbTYEluEhTpIAVkeKDslkMvdng0pCKG9sb9J08z1Gfi3f
 0Hg9P4igAvPWBYrNfzp9erWfjwPT4zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-8WRvpj7UPDSRZoVYeCNYzA-1; Thu, 07 Jan 2021 10:14:37 -0500
X-MC-Unique: 8WRvpj7UPDSRZoVYeCNYzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DA011005504
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 15:14:36 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF87660BF1;
 Thu,  7 Jan 2021 15:14:34 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/19] i386: switch hyperv_expand_features() to using
 error_setg()
Date: Thu,  7 Jan 2021 16:14:33 +0100
Message-Id: <20210107151433.540819-1-vkuznets@redhat.com>
In-Reply-To: <20210107150640.539239-1-vkuznets@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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

Use standard error_setg() mechanism in hyperv_expand_features().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 101 +++++++++++++++++++++++++-----------------
 1 file changed, 61 insertions(+), 40 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a6320aeb2699..d259916ccf85 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1138,7 +1138,7 @@ static bool hyperv_feature_supported(CPUState *cs, int feature)
     return true;
 }
 
-static int hv_cpuid_check_and_set(CPUState *cs, int feature)
+static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
     uint64_t deps;
@@ -1152,20 +1152,18 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature)
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
@@ -1212,13 +1210,12 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
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
@@ -1264,37 +1261,60 @@ static int hyperv_expand_features(CPUState *cs)
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
@@ -1529,9 +1549,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
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


