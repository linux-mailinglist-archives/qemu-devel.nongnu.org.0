Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AE05071DB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 17:32:24 +0200 (CEST)
Received: from localhost ([::1]:44798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngpq3-0004no-Ej
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 11:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngpfk-0002EH-H4
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 11:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngp9F-0008BL-V7
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650379688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9gcesQuRAnYJLvpa9UYbtJvIgLxSU+QixBcnMmffeY=;
 b=Pje+rWcjgrZdGbtaDTA81hM+DB/RXD5aJvXfcAvJjF+zuUKmP+5ISr0OkKvaf983dX5iwZ
 WAt5FUcvvw70VuDfmmslupl4MKz9Nfkj3RlBgdslus96fRqrYIS0XhuOdGxqbw+aFPb7EF
 6SSWatm9Vi5xhHxg/Bwr5sWNRvPjSK4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-JuvemWmVPYabAtYpbbprNg-1; Tue, 19 Apr 2022 10:48:06 -0400
X-MC-Unique: JuvemWmVPYabAtYpbbprNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ECF11C068F0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 14:48:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 556FC40D296B;
 Tue, 19 Apr 2022 14:48:05 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/5] i386: Use hv_build_cpuid_leaf() for
 HV_CPUID_NESTED_FEATURES
Date: Tue, 19 Apr 2022 16:47:59 +0200
Message-Id: <20220419144803.1698337-2-vkuznets@redhat.com>
In-Reply-To: <20220419144803.1698337-1-vkuznets@redhat.com>
References: <20220419144803.1698337-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>
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
 target/i386/kvm/kvm.c | 23 +++++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 982c5323537c..73dc387c52f5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1770,7 +1770,6 @@ struct ArchCPU {
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
     uint32_t hyperv_limits[3];
-    uint32_t hyperv_nested[4];
     bool hyperv_enforce_cpuid;
     uint32_t hyperv_ver_id_build;
     uint16_t hyperv_ver_id_major;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 9cf8e036698d..ff79994faa87 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -834,6 +834,8 @@ static bool tsc_is_stable_and_known(CPUX86State *env)
         || env->user_tsc_khz;
 }
 
+#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
+
 static struct {
     const char *desc;
     struct {
@@ -1241,6 +1243,13 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
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
 
@@ -1370,11 +1379,13 @@ static int hyperv_fill_cpuids(CPUState *cs,
     X86CPU *cpu = X86_CPU(cs);
     struct kvm_cpuid_entry2 *c;
     uint32_t cpuid_i = 0;
+    uint32_t nested_eax =
+        hv_build_cpuid_leaf(cs, HV_CPUID_NESTED_FEATURES, R_EAX);
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
-    c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
-        HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
+    c->eax = nested_eax ? HV_CPUID_NESTED_FEATURES :
+        HV_CPUID_IMPLEMENT_LIMITS;
     c->ebx = cpu->hyperv_vendor_id[0];
     c->ecx = cpu->hyperv_vendor_id[1];
     c->edx = cpu->hyperv_vendor_id[2];
@@ -1438,7 +1449,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->ecx = cpu->hyperv_limits[1];
     c->edx = cpu->hyperv_limits[2];
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
+    if (nested_eax) {
         uint32_t function;
 
         /* Create zeroed 0x40000006..0x40000009 leaves */
@@ -1450,7 +1461,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
 
         c = &cpuid_ent[cpuid_i++];
         c->function = HV_CPUID_NESTED_FEATURES;
-        c->eax = cpu->hyperv_nested[0];
+        c->eax = nested_eax;
     }
 
     return cpuid_i;
@@ -1472,8 +1483,6 @@ static bool evmcs_version_supported(uint16_t evmcs_version,
         (max_version <= max_supported_version);
 }
 
-#define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
-
 static int hyperv_init_vcpu(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -1577,8 +1586,6 @@ static int hyperv_init_vcpu(X86CPU *cpu)
                          supported_evmcs_version >> 8);
             return -ENOTSUP;
         }
-
-        cpu->hyperv_nested[0] = evmcs_version;
     }
 
     if (cpu->hyperv_enforce_cpuid) {
-- 
2.35.1


