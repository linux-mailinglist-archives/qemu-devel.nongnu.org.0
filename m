Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC593FEB5B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:38:28 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjAx-0004c5-D3
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj8l-0002IA-Ld
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj8j-0004nA-5o
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaAufKRl/10roDBZGDT3aYle6tHYXiKb9vJckfGoDRs=;
 b=Y+8n5n236hV4j6mrCVekdkQXPoSYR30daCvYmRWxC2JssRXovW6vQn1i+xrCUcwhAckups
 I6GAGTs8hsuHDb67uZc+TJY2EIzV+1V2wpePN/AXhqaregItdBwS8m4N+kCIHhreRV+KEA
 sUi/Xv1zj2h1oa8JjEDMqirt0bUy1fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-VW83RcGvMb2deELqFWONqA-1; Thu, 02 Sep 2021 05:36:06 -0400
X-MC-Unique: VW83RcGvMb2deELqFWONqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 220D510054F6
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:36:05 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64F227A8CE;
 Thu,  2 Sep 2021 09:35:45 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] i386: Implement pseudo 'hv-avic' ('hv-apicv')
 enlightenment
Date: Thu,  2 Sep 2021 11:35:28 +0200
Message-Id: <20210902093530.345756-7-vkuznets@redhat.com>
In-Reply-To: <20210902093530.345756-1-vkuznets@redhat.com>
References: <20210902093530.345756-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC
enabled. Normally, Hyper-V SynIC disables these hardware features and
suggests the guest to use paravirtualized AutoEOI feature. Linux-4.15
gains support for conditional APICv/AVIC disablement, the feature
stays on until the guest tries to use AutoEOI feature with SynIC. With
'HV_DEPRECATING_AEOI_RECOMMENDED' bit exposed, modern enough Windows/
Hyper-V versions should follow the recommendation and not use the
(unwanted) feature.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt                | 10 +++++++++-
 target/i386/cpu.c              |  4 ++++
 target/i386/cpu.h              |  1 +
 target/i386/kvm/hyperv-proto.h |  1 +
 target/i386/kvm/kvm.c          | 10 +++++++++-
 5 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 072709a68f47..cd1ea3bbe9d7 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -189,7 +189,15 @@ enabled.
 
 Requires: hv-vpindex, hv-synic, hv-time, hv-stimer
 
-3.17. hv-no-nonarch-coresharing=on/off/auto
+3.18. hv-avic (hv-apicv)
+=======================
+The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC enabled.
+Normally, Hyper-V SynIC disables these hardware feature and suggests the guest
+to use paravirtualized AutoEOI feature.
+Note: enabling this feature on old hardware (without APICv/AVIC support) may
+have negative effect on guest's performace.
+
+3.19. hv-no-nonarch-coresharing=on/off/auto
 ===========================================
 This enlightenment tells guest OS that virtual processors will never share a
 physical core unless they are reported as sibling SMT threads. This information
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 36e1b6ec9c9b..a695e200d409 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6477,6 +6477,8 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
 
+    object_property_add_alias(obj, "hv-apicv", obj, "hv-avic");
+
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
@@ -6662,6 +6664,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_IPI, 0),
     DEFINE_PROP_BIT64("hv-stimer-direct", X86CPU, hyperv_features,
                       HYPERV_FEAT_STIMER_DIRECT, 0),
+    DEFINE_PROP_BIT64("hv-avic", X86CPU, hyperv_features,
+                      HYPERV_FEAT_AVIC, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8822bea5c9a4..d22a8d259967 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1038,6 +1038,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define HYPERV_FEAT_EVMCS               12
 #define HYPERV_FEAT_IPI                 13
 #define HYPERV_FEAT_STIMER_DIRECT       14
+#define HYPERV_FEAT_AVIC                15
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 5fbb385cc136..89f81afda7c6 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -66,6 +66,7 @@
 #define HV_APIC_ACCESS_RECOMMENDED          (1u << 3)
 #define HV_SYSTEM_RESET_RECOMMENDED         (1u << 4)
 #define HV_RELAXED_TIMING_RECOMMENDED       (1u << 5)
+#define HV_DEPRECATING_AEOI_RECOMMENDED     (1u << 9)
 #define HV_CLUSTER_IPI_RECOMMENDED          (1u << 10)
 #define HV_EX_PROCESSOR_MASKS_RECOMMENDED   (1u << 11)
 #define HV_ENLIGHTENED_VMCS_RECOMMENDED     (1u << 14)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 430007c2691a..0f3cb61a9cfd 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -924,6 +924,13 @@ static struct {
         },
         .dependencies = BIT(HYPERV_FEAT_STIMER)
     },
+    [HYPERV_FEAT_AVIC] = {
+        .desc = "AVIC/APICv support (hv-avic/hv-apicv)",
+        .flags = {
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
+             .bits = HV_DEPRECATING_AEOI_RECOMMENDED}
+        }
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
@@ -1373,7 +1380,8 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->eax = hv_build_cpuid_leaf(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX);
     c->ebx = cpu->hyperv_spinlock_attempts;
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC) &&
+        !hyperv_feat_enabled(cpu, HYPERV_FEAT_AVIC)) {
         c->eax |= HV_APIC_ACCESS_RECOMMENDED;
     }
 
-- 
2.31.1


