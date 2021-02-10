Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F79316BBB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:51:39 +0100 (CET)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9siI-0007rv-Qf
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYR-0007Ih-Qb
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYN-0008Uq-Nz
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1u9mcxYZQJ7ypVFtmUk66plC0dIbUY+DLO2gdZxDyf4=;
 b=HDqOYDGck2pzIPRnrG+c+mrnTv2I/7QAIGgzGBHWgZhMaM7kRoaWVOvLgSmPA4bnhBy8gc
 Q7SACmolSXOBtpGji/fVefj7IkUBDI3sR41DwwWg7C7+tCzFqhcu69hLRohseHi4pS+Coc
 hds+nBGJdq4fpCoTHHibb1lc2JVchL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-kAVlKYSZMe6NEp13Odw5aQ-1; Wed, 10 Feb 2021 11:41:17 -0500
X-MC-Unique: kAVlKYSZMe6NEp13Odw5aQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A70C1009617
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:41:16 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E728F5D9E3;
 Wed, 10 Feb 2021 16:41:14 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Date: Wed, 10 Feb 2021 17:40:28 +0100
Message-Id: <20210210164033.607612-17-vkuznets@redhat.com>
In-Reply-To: <20210210164033.607612-1-vkuznets@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes we'd like to know which features were explicitly enabled and which
were explicitly disabled on the command line. E.g. it seems logical to handle
'hv_passthrough,hv_feature=off' as "enable everything supported by the host
except for hv_feature" but this doesn't seem to be possible with the current
'hyperv_features' bit array. Introduce 'hv_features_on'/'hv_features_off'
add-ons and track explicit enablement/disablement there.

Note, it doesn't seem to be possible to fill 'hyperv_features' array during
CPU creation time when 'hv-passthrough' is specified and we're running on
an older kernel without KVM_CAP_SYS_HYPERV_CPUID support. To get the list
of the supported Hyper-V features we need to actually create KVM VCPU and
this happens much later.

No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 237 ++++++++++++++++++++++++++++++++++++++++------
 target/i386/cpu.h |   2 +
 2 files changed, 209 insertions(+), 30 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c4e8863c7ca0..e8a004c39d04 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4553,6 +4553,178 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
     cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
 }
 
+static bool x86_hv_feature_get(Object *obj, int feature)
+{
+    X86CPU *cpu = X86_CPU(obj);
+
+    return cpu->hyperv_features & BIT(feature);
+}
+
+static void x86_hv_feature_set(Object *obj, bool value, int feature)
+{
+    X86CPU *cpu = X86_CPU(obj);
+
+    if (value) {
+        cpu->hyperv_features |= BIT(feature);
+        cpu->hyperv_features_on |= BIT(feature);
+        cpu->hyperv_features_off &= ~BIT(feature);
+    } else {
+        cpu->hyperv_features &= ~BIT(feature);
+        cpu->hyperv_features_on &= ~BIT(feature);
+        cpu->hyperv_features_off |= BIT(feature);
+    }
+}
+
+static bool x86_hv_relaxed_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_RELAXED);
+}
+
+static void x86_hv_relaxed_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_RELAXED);
+}
+
+static bool x86_hv_vapic_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_VAPIC);
+}
+
+static void x86_hv_vapic_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_VAPIC);
+}
+
+static bool x86_hv_time_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_TIME);
+}
+
+static void x86_hv_time_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_TIME);
+}
+
+static bool x86_hv_crash_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_CRASH);
+}
+
+static void x86_hv_crash_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_CRASH);
+}
+
+static bool x86_hv_reset_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_RESET);
+}
+
+static void x86_hv_reset_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_RESET);
+}
+
+static bool x86_hv_vpindex_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_VPINDEX);
+}
+
+static void x86_hv_vpindex_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_VPINDEX);
+}
+
+static bool x86_hv_runtime_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_RUNTIME);
+}
+
+static void x86_hv_runtime_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_RUNTIME);
+}
+
+static bool x86_hv_synic_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_SYNIC);
+}
+
+static void x86_hv_synic_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_SYNIC);
+}
+
+static bool x86_hv_stimer_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_STIMER);
+}
+
+static void x86_hv_stimer_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_STIMER);
+}
+
+static bool x86_hv_frequencies_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_FREQUENCIES);
+}
+
+static void x86_hv_frequencies_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_FREQUENCIES);
+}
+
+static bool x86_hv_reenlightenment_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_REENLIGHTENMENT);
+}
+
+static void x86_hv_reenlightenment_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_REENLIGHTENMENT);
+}
+
+static bool x86_hv_tlbflush_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_TLBFLUSH);
+}
+
+static void x86_hv_tlbflush_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_TLBFLUSH);
+}
+
+static bool x86_hv_evmcs_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_EVMCS);
+}
+
+static void x86_hv_evmcs_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_EVMCS);
+}
+
+static bool x86_hv_ipi_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_IPI);
+}
+
+static void x86_hv_ipi_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_IPI);
+}
+
+static bool x86_hv_stimer_direct_get(Object *obj, Error **errp)
+{
+    return x86_hv_feature_get(obj, HYPERV_FEAT_STIMER_DIRECT);
+}
+
+static void x86_hv_stimer_direct_set(Object *obj, bool value, Error **errp)
+{
+    x86_hv_feature_set(obj, value, HYPERV_FEAT_STIMER_DIRECT);
+}
+
 /* Generic getter for "feature-words" and "filtered-features" properties */
 static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
@@ -7107,36 +7279,6 @@ static Property x86_cpu_properties[] = {
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
-    DEFINE_PROP_BIT64("hv-relaxed", X86CPU, hyperv_features,
-                      HYPERV_FEAT_RELAXED, 0),
-    DEFINE_PROP_BIT64("hv-vapic", X86CPU, hyperv_features,
-                      HYPERV_FEAT_VAPIC, 0),
-    DEFINE_PROP_BIT64("hv-time", X86CPU, hyperv_features,
-                      HYPERV_FEAT_TIME, 0),
-    DEFINE_PROP_BIT64("hv-crash", X86CPU, hyperv_features,
-                      HYPERV_FEAT_CRASH, 0),
-    DEFINE_PROP_BIT64("hv-reset", X86CPU, hyperv_features,
-                      HYPERV_FEAT_RESET, 0),
-    DEFINE_PROP_BIT64("hv-vpindex", X86CPU, hyperv_features,
-                      HYPERV_FEAT_VPINDEX, 0),
-    DEFINE_PROP_BIT64("hv-runtime", X86CPU, hyperv_features,
-                      HYPERV_FEAT_RUNTIME, 0),
-    DEFINE_PROP_BIT64("hv-synic", X86CPU, hyperv_features,
-                      HYPERV_FEAT_SYNIC, 0),
-    DEFINE_PROP_BIT64("hv-stimer", X86CPU, hyperv_features,
-                      HYPERV_FEAT_STIMER, 0),
-    DEFINE_PROP_BIT64("hv-frequencies", X86CPU, hyperv_features,
-                      HYPERV_FEAT_FREQUENCIES, 0),
-    DEFINE_PROP_BIT64("hv-reenlightenment", X86CPU, hyperv_features,
-                      HYPERV_FEAT_REENLIGHTENMENT, 0),
-    DEFINE_PROP_BIT64("hv-tlbflush", X86CPU, hyperv_features,
-                      HYPERV_FEAT_TLBFLUSH, 0),
-    DEFINE_PROP_BIT64("hv-evmcs", X86CPU, hyperv_features,
-                      HYPERV_FEAT_EVMCS, 0),
-    DEFINE_PROP_BIT64("hv-ipi", X86CPU, hyperv_features,
-                      HYPERV_FEAT_IPI, 0),
-    DEFINE_PROP_BIT64("hv-stimer-direct", X86CPU, hyperv_features,
-                      HYPERV_FEAT_STIMER_DIRECT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
@@ -7283,6 +7425,41 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                               x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
 #endif
 
+    object_class_property_add_bool(oc, "hv-relaxed",
+                                   x86_hv_relaxed_get, x86_hv_relaxed_set);
+    object_class_property_add_bool(oc, "hv-vapic",
+                                   x86_hv_vapic_get, x86_hv_vapic_set);
+    object_class_property_add_bool(oc, "hv-time",
+                                   x86_hv_time_get, x86_hv_time_set);
+    object_class_property_add_bool(oc, "hv-crash",
+                                   x86_hv_crash_get, x86_hv_crash_set);
+    object_class_property_add_bool(oc, "hv-reset",
+                                   x86_hv_reset_get, x86_hv_reset_set);
+    object_class_property_add_bool(oc, "hv-vpindex",
+                                   x86_hv_vpindex_get, x86_hv_vpindex_set);
+    object_class_property_add_bool(oc, "hv-runtime",
+                                   x86_hv_runtime_get, x86_hv_runtime_set);
+    object_class_property_add_bool(oc, "hv-synic",
+                                   x86_hv_synic_get, x86_hv_synic_set);
+    object_class_property_add_bool(oc, "hv-stimer",
+                                   x86_hv_stimer_get, x86_hv_stimer_set);
+    object_class_property_add_bool(oc, "hv-frequencies",
+                                   x86_hv_frequencies_get,
+                                   x86_hv_frequencies_set);
+    object_class_property_add_bool(oc, "hv-reenlightenment",
+                                   x86_hv_reenlightenment_get,
+                                   x86_hv_reenlightenment_set);
+    object_class_property_add_bool(oc, "hv-tlbflush",
+                                   x86_hv_tlbflush_get, x86_hv_tlbflush_set);
+    object_class_property_add_bool(oc, "hv-evmcs",
+                              x86_hv_evmcs_get,
+                              x86_hv_evmcs_set);
+    object_class_property_add_bool(oc, "hv-ipi",
+                                   x86_hv_ipi_get, x86_hv_ipi_set);
+    object_class_property_add_bool(oc, "hv-stimer-direct",
+                                   x86_hv_stimer_direct_get,
+                                   x86_hv_stimer_direct_set);
+
     for (w = 0; w < FEATURE_WORDS; w++) {
         int bitnr;
         for (bitnr = 0; bitnr < 64; bitnr++) {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7ea14822aab5..b4fbd46f0fc9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1667,6 +1667,8 @@ struct X86CPU {
     char *hyperv_vendor;
     bool hyperv_synic_kvm_only;
     uint64_t hyperv_features;
+    uint64_t hyperv_features_on;
+    uint64_t hyperv_features_off;
     bool hyperv_passthrough;
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
-- 
2.29.2


