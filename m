Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF7316B9A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:47:32 +0100 (CET)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9seH-00043V-RN
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYB-0007Ay-VZ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sY5-0008Qf-Jh
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAm1Ev9ofq0v6+7mtrvoQC1c6x56+yBXAKh3p/0hHQA=;
 b=E/hwXT5iCyhumOb6uMoq43NPKerU7I3FigAzKFicdkJe7TqRGE67RPu5qQ1t/ABOlkjO7k
 /Et8vI2i+usVKSE5M7VxFw7qx02jcvPyuT/wvTAMcAtul++Eov+w9V4z8Hq/mVg/0qbvAh
 pX64Wnn/1SRFMx7AWjyeu/28QtbIv/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-BfMDRO4yMAaxYhMiwyau0g-1; Wed, 10 Feb 2021 11:41:02 -0500
X-MC-Unique: BfMDRO4yMAaxYhMiwyau0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E41E9126F
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:41:01 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFE535D9D0;
 Wed, 10 Feb 2021 16:40:59 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 10/21] i386: move eVMCS enablement to hyperv_init_vcpu()
Date: Wed, 10 Feb 2021 17:40:22 +0100
Message-Id: <20210210164033.607612-11-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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

hyperv_expand_features() will be called before we create vCPU so
evmcs enablement should go away. hyperv_init_vcpu() looks like the
right place.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 60 ++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 893c9c515fbb..4cab175fa95c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -961,6 +961,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
 {
     struct kvm_cpuid2 *cpuid;
     int max = 7; /* 0x40000000..0x40000005, 0x4000000A */
+    int i;
 
     /*
      * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
@@ -970,6 +971,22 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
     while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
         max++;
     }
+
+    /*
+     * KVM_GET_SUPPORTED_HV_CPUID does not set EVMCS CPUID bit before
+     * KVM_CAP_HYPERV_ENLIGHTENED_VMCS is enabled but we want to get the
+     * information early, just check for the capability and set the bit
+     * manually.
+     */
+    if (kvm_check_extension(cs->kvm_state,
+                            KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
+        for (i = 0; i < cpuid->nent; i++) {
+            if (cpuid->entries[i].function == HV_CPUID_ENLIGHTMENT_INFO) {
+                cpuid->entries[i].eax |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
+            }
+        }
+    }
+
     return cpuid;
 }
 
@@ -1199,24 +1216,6 @@ static int hyperv_expand_features(CPUState *cs)
     if (!hyperv_enabled(cpu))
         return 0;
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ||
-        cpu->hyperv_passthrough) {
-        uint16_t evmcs_version;
-
-        r = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
-                                (uintptr_t)&evmcs_version);
-
-        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) && r) {
-            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
-                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
-            return -ENOSYS;
-        }
-
-        if (!r) {
-            cpu->hyperv_nested[0] = evmcs_version;
-        }
-    }
-
     if (cpu->hyperv_passthrough) {
         cpu->hyperv_vendor_id[0] =
             hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
@@ -1453,6 +1452,21 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         }
     }
 
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+        uint16_t evmcs_version;
+
+        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
+                                  (uintptr_t)&evmcs_version);
+
+        if (ret < 0) {
+            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
+                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
+            return ret;
+        }
+
+        cpu->hyperv_nested[0] = evmcs_version;
+    }
+
     return 0;
 }
 
@@ -1517,6 +1531,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     if (hyperv_enabled(cpu)) {
+        r = hyperv_init_vcpu(cpu);
+        if (r) {
+            return r;
+        }
+
         cpuid_i = hyperv_fill_cpuids(cs, cpuid_data.entries);
         kvm_base = KVM_CPUID_SIGNATURE_NEXT;
         has_msr_hv_hypercall = true;
@@ -1866,11 +1885,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     kvm_init_msrs(cpu);
 
-    r = hyperv_init_vcpu(cpu);
-    if (r) {
-        goto fail;
-    }
-
     return 0;
 
  fail:
-- 
2.29.2


