Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F992316BCE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:54:49 +0100 (CET)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9slM-0003Ba-EU
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYB-00078i-1q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sY2-0008Pu-LR
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roL0mRNB/R5YIewqpjZmy8mF5yT80a4hlFQadesvpIA=;
 b=UNipAC/Q6/AFs+77YPj+urYRun/p7tOd6bbmMWDVuSfnEO0zpKClH9RwSL7j70sMlbcnGt
 J0dKBGHeE78wXZNOmwxVZ/jkve9NmDWDo2ROZ2uPf7QGf7QwdTN7Xn9JvM71Mo975X5QrU
 mkxOrCL7ULK9EL1yA+1ykr9DwekdXHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-BrO7pBqLNomXjLIsxQ1HYQ-1; Wed, 10 Feb 2021 11:41:00 -0500
X-MC-Unique: BrO7pBqLNomXjLIsxQ1HYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 761B3107ACE8
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:40:59 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7C835D9D0;
 Wed, 10 Feb 2021 16:40:57 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 09/21] i386: split hyperv_handle_properties() into
 hyperv_expand_features()/hyperv_fill_cpuids()
Date: Wed, 10 Feb 2021 17:40:21 +0100
Message-Id: <20210210164033.607612-10-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The intention is to call hyperv_expand_features() early, before vCPUs
are created and use the acquired data later when we set guest visible
CPUID data.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index bcc5709ec467..893c9c515fbb 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1185,16 +1185,15 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
 }
 
 /*
- * Fill in Hyper-V CPUIDs. Returns the number of entries filled in cpuid_ent in
- * case of success, errno < 0 in case of failure and 0 when no Hyper-V
- * extentions are enabled.
+ * Expand Hyper-V CPU features. In partucular, check that all the requested
+ * features are supported by the host and the sanity of the configuration
+ * (that all the required dependencies are included). Also, this takes care
+ * of 'hv_passthrough' mode and fills the environment with all supported
+ * Hyper-V features.
  */
-static int hyperv_handle_properties(CPUState *cs,
-                                    struct kvm_cpuid_entry2 *cpuid_ent)
+static int hyperv_expand_features(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
-    struct kvm_cpuid_entry2 *c;
-    uint32_t cpuid_i = 0;
     int r;
 
     if (!hyperv_enabled(cpu))
@@ -1292,6 +1291,19 @@ static int hyperv_handle_properties(CPUState *cs,
         return -ENOSYS;
     }
 
+    return 0;
+}
+
+/*
+ * Fill in Hyper-V CPUIDs. Returns the number of entries filled in cpuid_ent.
+ */
+static int hyperv_fill_cpuids(CPUState *cs,
+                              struct kvm_cpuid_entry2 *cpuid_ent)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    struct kvm_cpuid_entry2 *c;
+    uint32_t cpuid_i = 0;
+
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
     c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
@@ -1499,11 +1511,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
     env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
 
     /* Paravirtualization CPUIDs */
-    r = hyperv_handle_properties(cs, cpuid_data.entries);
+    r = hyperv_expand_features(cs);
     if (r < 0) {
         return r;
-    } else if (r > 0) {
-        cpuid_i = r;
+    }
+
+    if (hyperv_enabled(cpu)) {
+        cpuid_i = hyperv_fill_cpuids(cs, cpuid_data.entries);
         kvm_base = KVM_CPUID_SIGNATURE_NEXT;
         has_msr_hv_hypercall = true;
     }
-- 
2.29.2


