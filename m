Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EDC397A11
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:26:23 +0200 (CEST)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo95q-0008Q3-Hp
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qi-0002am-KI
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qb-0005na-FU
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVppsRVr9TNNGmsrGCjZHrnCVid3ZaBVsRLFFY6R+Jo=;
 b=Z5Z17Lca97zDkqWyRGhzfmwh9zXYgjeUg+BJZG85T2DUPlzVngbODZ3qXp9lapC5ZjofQA
 IbfXi58UVx2UL3QCxaxdyl6g6UbyVP8PGmQhdGtyOkhetSMlQMb2tHVwNJJbsOqLpjX+mt
 XrUpApe+vrrv1zrLQv2FFwJYgXFEKVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-kJevgCvONOa3KLwy81rKKg-1; Tue, 01 Jun 2021 14:10:32 -0400
X-MC-Unique: kJevgCvONOa3KLwy81rKKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D34A3801817;
 Tue,  1 Jun 2021 18:10:31 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DEE65C1BB;
 Tue,  1 Jun 2021 18:10:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/24] i386: split hyperv_handle_properties() into
 hyperv_expand_features()/hyperv_fill_cpuids()
Date: Tue,  1 Jun 2021 14:10:06 -0400
Message-Id: <20210601181014.2568861-17-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

The intention is to call hyperv_expand_features() early, before vCPUs
are created and use the acquired data later when we set guest visible
CPUID data.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210422161130.652779-10-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm/kvm.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2dd60fcaacf..10c836a2bf1 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1187,16 +1187,15 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
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
@@ -1295,6 +1294,19 @@ static int hyperv_handle_properties(CPUState *cs,
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
@@ -1502,11 +1514,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
2.30.2


