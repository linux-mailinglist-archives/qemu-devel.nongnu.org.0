Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA53C7462
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:21:25 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3L9w-0006Qe-3g
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7s-0003dt-Ak
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m3L7p-0006rT-TE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wS7SO4/3KCWiUzr2yC16eiPT9KA3yQWcb7HDMTmC2dY=;
 b=NXXpvkXxD18CHd/fxfrrmNy1Bjys25xxF/K97vh1YkI7ukf+SxRmr8HustYAbZviDpYX81
 oCLkfVmi5nyFyaGfpZu2JM62t6/igve5xwJZIV3yzYFOkogJIBPopjdDmdorFMwAxT/X8I
 UkE9N7YLo8ZnJNHg8uhhziE4S9x7gco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-B1-NFwiwPQqcIPuqkxsBUA-1; Tue, 13 Jul 2021 12:19:11 -0400
X-MC-Unique: B1-NFwiwPQqcIPuqkxsBUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC05DF8A0;
 Tue, 13 Jul 2021 16:19:10 +0000 (UTC)
Received: from localhost (ovpn-113-28.rdu2.redhat.com [10.10.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 474DF5C1C5;
 Tue, 13 Jul 2021 16:19:10 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/11] i386: make hyperv_expand_features() return bool
Date: Tue, 13 Jul 2021 12:09:49 -0400
Message-Id: <20210713160957.3269017-4-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-1-ehabkost@redhat.com>
References: <20210713160957.3269017-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Return 'false' when hyperv_expand_features() sets an error.

No functional change intended.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210608120817.1325125-5-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm/kvm.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 02216b70311..ef127762bca 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1220,12 +1220,12 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
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
@@ -1273,49 +1273,49 @@ static void hyperv_expand_features(CPUState *cs, Error **errp)
 
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
@@ -1325,7 +1325,10 @@ static void hyperv_expand_features(CPUState *cs, Error **errp)
         error_setg(errp, "Hyper-V %s requires Hyper-V %s",
                    kvm_hyperv_properties[HYPERV_FEAT_SYNIC].desc,
                    kvm_hyperv_properties[HYPERV_FEAT_VPINDEX].desc);
+        return false;
     }
+
+    return true;
 }
 
 /*
@@ -1591,8 +1594,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
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


