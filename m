Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D139A01B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:50:34 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolrt-0007aJ-9v
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqG-0004yy-0e
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqE-00024H-AN
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqblTZYk+hZsky9NIxgGLm7Qg1ty1pGjUIIGwAwCcRM=;
 b=Sl3GkISREysq0avnexONOa1JT4tuoC46U6oSsBAlOyKAfLTXgNGRC6xurxidAUT/eR5q2r
 JLInUEODR1svbLvjtRZx/+F1EHglI8LdnD+RGvOK+/FTWGHDpK/EZh+1zozzXU2i/e1UdG
 my+tIUZvPlAj7eewFH1qGLHto5T7Dfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-aFfUcJt2MAWO6grRvxJj_A-1; Thu, 03 Jun 2021 07:48:47 -0400
X-MC-Unique: aFfUcJt2MAWO6grRvxJj_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D321800D55
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:47 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D73A19704;
 Thu,  3 Jun 2021 11:48:45 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 4/9] i386: make hyperv_expand_features() return bool
Date: Thu,  3 Jun 2021 13:48:30 +0200
Message-Id: <20210603114835.847451-5-vkuznets@redhat.com>
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return 'false' when hyperv_expand_features() sets an error.

No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index d57eede5dc81..a5f8553af921 100644
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
@@ -1563,8 +1566,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
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


