Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A336539F624
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:13:50 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqac8-0003o8-MY
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX9-00006O-IM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX7-0001ll-OC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rm+rxKHBCytTCeqG+HQByJ24TEg2cpFPlgxofcjWyOc=;
 b=Ve/1cMI/NXl7NG1bhXChVxQfwGGabq2xKI7a5FXUXRY5ZWw3CoLYm76q5+ZXGGF8WIj/qD
 5ql+jFy+AXi7IE43I9IZvfJ+U73Dh7vi6S8LQbcnbYCO8Y4K39fV2hY19Xi/q9hTtYh5VG
 TEPH8+PPxkvOT8/MK3NO8Pvk0PwCMIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-7OGu0lg4NJa2RBsiaoFxVw-1; Tue, 08 Jun 2021 08:08:33 -0400
X-MC-Unique: 7OGu0lg4NJa2RBsiaoFxVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE1D9180FD71;
 Tue,  8 Jun 2021 12:08:32 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20C905B4A6;
 Tue,  8 Jun 2021 12:08:30 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 4/9] i386: make hyperv_expand_features() return bool
Date: Tue,  8 Jun 2021 14:08:12 +0200
Message-Id: <20210608120817.1325125-5-vkuznets@redhat.com>
In-Reply-To: <20210608120817.1325125-1-vkuznets@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return 'false' when hyperv_expand_features() sets an error.

No functional change intended.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 13d63f576b88..1e6f3c483e28 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1217,12 +1217,12 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
  * of 'hv_passthrough' mode and fills the environment with all supported
  * Hyper-V features.
  */
-static void hyperv_expand_features(CPUState *cs, Error **errp)
+static bool hyperv_expand_features(CPUState *cs, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
 
     if (!hyperv_enabled(cpu))
-        return;
+        return true;
 
     if (cpu->hyperv_passthrough) {
         cpu->hyperv_vendor_id[0] =
@@ -1270,49 +1270,49 @@ static void hyperv_expand_features(CPUState *cs, Error **errp)
 
     /* Features */
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI, errp)) {
-        return;
+        return false;
     }
     if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT, errp)) {
-        return;
+        return false;
     }
 
     /* Additional dependencies not covered by kvm_hyperv_properties[] */
@@ -1322,7 +1322,10 @@ static void hyperv_expand_features(CPUState *cs, Error **errp)
         error_setg(errp, "Hyper-V %s requires Hyper-V %s",
                    kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
                    kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
+        return false;
     }
+
+    return true;
 }
 
 /*
@@ -1588,8 +1591,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
 
     /* Paravirtualization CPUIDs */
-    hyperv_expand_features(cs, &local_err);
-    if (local_err) {
+    if (!hyperv_expand_features(cs, &local_err)) {
         error_report_err(local_err);
         return -ENOSYS;
     }
-- 
2.31.1


