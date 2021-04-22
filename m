Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6B93684C1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:25:12 +0200 (CEST)
Received: from localhost ([::1]:41732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZc8d-0000x5-AI
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbwF-0003t4-AM
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbw8-00038f-C5
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQS3chBSN23wWDxuOOF9HMPWCdyCMI96SvfBsaiQrFU=;
 b=IJwTwRi0U/0FZQDrbBfF0ZRTey1uIG1BauR8zvlPQHwlVlOUCBKh98A2925i7V3eKwKx8w
 wQvQC7w6qsEL/LbkCxAC/f0R0use1tz9lin9Vqui/Dqh1gVIMV9Wrrz4KbvE3eq4j86UMH
 0wbeJfXL2Xo3a1pEuz9wkcZpP6s58V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-NJmyJHZNOhOFpEO06UwFJg-1; Thu, 22 Apr 2021 12:12:13 -0400
X-MC-Unique: NJmyJHZNOhOFpEO06UwFJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC558030CF
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:12:12 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7325B4A4;
 Thu, 22 Apr 2021 16:12:10 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/19] i386: kill off hv_cpuid_check_and_set()
Date: Thu, 22 Apr 2021 18:11:27 +0200
Message-Id: <20210422161130.652779-17-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
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

hv_cpuid_check_and_set() does too much:
- Checks if the feature is supported by KVM;
- Checks if all dependencies are enabled;
- Sets the feature bit in cpu->hyperv_features for 'passthrough' mode.

To reduce the complexity, move all the logic except for dependencies
check out of it. Also, in 'passthrough' mode we don't really need to
check dependencies because KVM is supposed to provide a consistent
set anyway.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 105 +++++++++++++++---------------------------
 1 file changed, 36 insertions(+), 69 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d5551c4ab5cf..2c1a77f9b00f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1144,16 +1144,12 @@ static bool hyperv_feature_supported(CPUState *cs, int feature)
     return true;
 }
 
-static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
+/* Checks that all feature dependencies are enabled */
+static void hv_feature_check_deps(X86CPU *cpu, int feature, Error **errp)
 {
-    X86CPU *cpu = X86_CPU(cs);
     uint64_t deps;
     int dep_feat;
 
-    if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
-        return 0;
-    }
-
     deps = kvm_hyperv_properties[feature].dependencies;
     while (deps) {
         dep_feat = ctz64(deps);
@@ -1161,26 +1157,10 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
             error_setg(errp, "Hyper-V %s requires Hyper-V %s",
                        kvm_hyperv_properties[feature].desc,
                        kvm_hyperv_properties[dep_feat].desc);
-            return 1;
+            return;
         }
         deps &= ~(1ull << dep_feat);
     }
-
-    if (!hyperv_feature_supported(cs, feature)) {
-        if (hyperv_feat_enabled(cpu, feature)) {
-            error_setg(errp, "Hyper-V %s is not supported by kernel",
-                       kvm_hyperv_properties[feature].desc);
-            return 1;
-        } else {
-            return 0;
-        }
-    }
-
-    if (cpu->hyperv_passthrough) {
-        cpu->hyperv_features |= BIT(feature);
-    }
-
-    return 0;
 }
 
 static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
@@ -1219,6 +1199,8 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
 void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
 {
     CPUState *cs = CPU(cpu);
+    Error *local_err = NULL;
+    int feat;
 
     if (!hyperv_enabled(cpu))
         return;
@@ -1274,53 +1256,38 @@ void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
 
         cpu->hyperv_spinlock_attempts =
             hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
-    }
 
-    /* Features */
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI, errp)) {
-        return;
-    }
-    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT, errp)) {
-        return;
+        /*
+         * Mark feature as enabled in 'cpu->hyperv_features' as
+         * hv_build_cpuid_leaf() uses this info to build guest CPUIDs.
+         */
+        for (feat = 0; feat < ARRAY_SIZE(kvm_hyperv_properties); feat++) {
+            if (hyperv_feature_supported(cs, feat)) {
+                cpu->hyperv_features |= BIT(feat);
+            }
+        }
+    } else {
+        /* Check features availability and dependencies */
+        for (feat = 0; feat < ARRAY_SIZE(kvm_hyperv_properties); feat++) {
+            /* If the feature was not requested skip it. */
+            if (!hyperv_feat_enabled(cpu, feat)) {
+                continue;
+            }
+
+            /* Check if the feature is supported by KVM */
+            if (!hyperv_feature_supported(cs, feat)) {
+                error_setg(errp, "Hyper-V %s is not supported by kernel",
+                           kvm_hyperv_properties[feat].desc);
+                return;
+            }
+
+            /* Check dependencies */
+            hv_feature_check_deps(cpu, feat, &local_err);
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
     }
 
     /* Additional dependencies not covered by kvm_hyperv_properties[] */
-- 
2.30.2


