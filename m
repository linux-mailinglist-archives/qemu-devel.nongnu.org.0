Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64032533C3E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:07:46 +0200 (CEST)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpnR-00084b-7U
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgF-0004x5-G2
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgA-0000jP-TN
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653479994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0c0wH8nVBZDZtXQVlhIFGXfDP6ZgqXZXbc7Chx12Ig=;
 b=Q4SJih3mrYzhMuCAPLkwyFzoDek/bE8zQAPdX+OFexNK6V+8RbYHPcWwtZxnzCOtOLlYt0
 A5b6EMwQS18yDO83zBcK+Vqs+2iqUq7AjMjgNmRY1jTN5JNaac1BTporBXitswIVMPVknk
 TWi58dpzo7CeCbJ69im9xIgHhPBuXU8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-72i1lOKbNWioCjX-tJ_4UQ-1; Wed, 25 May 2022 07:59:53 -0400
X-MC-Unique: 72i1lOKbNWioCjX-tJ_4UQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E22F01D3236B
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:59:52 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C89B940CFD0B;
 Wed, 25 May 2022 11:59:51 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 1/6] i386: Use hv_build_cpuid_leaf() for
 HV_CPUID_NESTED_FEATURES
Date: Wed, 25 May 2022 13:59:44 +0200
Message-Id: <20220525115949.1294004-2-vkuznets@redhat.com>
In-Reply-To: <20220525115949.1294004-1-vkuznets@redhat.com>
References: <20220525115949.1294004-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, HV_CPUID_NESTED_FEATURES.EAX CPUID leaf was handled differently
as it was only used to encode the supported eVMCS version range. In fact,
there are also feature (e.g. Enlightened MSR-Bitmap) bits there. In
preparation to adding these features, move HV_CPUID_NESTED_FEATURES leaf
handling to hv_build_cpuid_leaf() and drop now-unneeded 'hyperv_nested'.

No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.h     |  1 -
 target/i386/kvm/kvm.c | 25 +++++++++++++++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0d528ac58f32..2e918daf6bef 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1804,7 +1804,6 @@ struct ArchCPU {
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
     uint32_t hyperv_limits[3];
-    uint32_t hyperv_nested[4];
     bool hyperv_enforce_cpuid;
     uint32_t hyperv_ver_id_build;
     uint16_t hyperv_ver_id_major;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a9ee8eebd76f..93bfefa4a79e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -831,6 +831,8 @@ static bool tsc_is_stable_and_known(CPUX86State *env)
         || env->user_tsc_khz;
 }
 
+#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
+
 static struct {
     const char *desc;
     struct {
@@ -1254,6 +1256,13 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
         }
     }
 
+    /* HV_CPUID_NESTED_FEATURES.EAX also encodes the supported eVMCS range */
+    if (func == HV_CPUID_NESTED_FEATURES && reg == R_EAX) {
+        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+            r |= DEFAULT_EVMCS_VERSION;
+        }
+    }
+
     return r;
 }
 
@@ -1384,11 +1393,11 @@ static int hyperv_fill_cpuids(CPUState *cs,
     struct kvm_cpuid_entry2 *c;
     uint32_t signature[3];
     uint32_t cpuid_i = 0, max_cpuid_leaf = 0;
+    uint32_t nested_eax =
+        hv_build_cpuid_leaf(cs, HV_CPUID_NESTED_FEATURES, R_EAX);
 
-    max_cpuid_leaf = HV_CPUID_IMPLEMENT_LIMITS;
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
-        max_cpuid_leaf = MAX(max_cpuid_leaf, HV_CPUID_NESTED_FEATURES);
-    }
+    max_cpuid_leaf = nested_eax ? HV_CPUID_NESTED_FEATURES :
+        HV_CPUID_IMPLEMENT_LIMITS;
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
         max_cpuid_leaf =
@@ -1461,7 +1470,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->ecx = cpu->hyperv_limits[1];
     c->edx = cpu->hyperv_limits[2];
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+    if (nested_eax) {
         uint32_t function;
 
         /* Create zeroed 0x40000006..0x40000009 leaves */
@@ -1473,7 +1482,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
 
         c = &cpuid_ent[cpuid_i++];
         c->function = HV_CPUID_NESTED_FEATURES;
-        c->eax = cpu->hyperv_nested[0];
+        c->eax = nested_eax;
     }
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNDBG)) {
@@ -1522,8 +1531,6 @@ static bool evmcs_version_supported(uint16_t evmcs_version,
         (max_version <= max_supported_version);
 }
 
-#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
-
 static int hyperv_init_vcpu(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -1620,8 +1627,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
                          supported_evmcs_version >> 8);
             return -ENOTSUP;
         }
-
-        cpu->hyperv_nested[0] = evmcs_version;
     }
 
     if (cpu->hyperv_enforce_cpuid) {
-- 
2.35.3


