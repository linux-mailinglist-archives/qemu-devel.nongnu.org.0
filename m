Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00382261270
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 16:13:19 +0200 (CEST)
Received: from localhost ([::1]:50012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFeN5-000880-0P
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 10:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kFeM3-00070L-C7
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:12:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kFeM1-0004t5-9z
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599574332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p+b8SKLhwqA0+AdEOSLhMwJLWRiMvR4myifiRSWFBFI=;
 b=QJIMmvgPhwek4GwBHhfeRcUrtAB7Fp21f8iNLh215hU+PAVeuSi0U0Vs+DOgFqRcIYLc7u
 8nPlQQQbPUCGVd8ITWzjw+G+8HGlxvYUn8Ck1EK24uGaKDajgP3l2QV6JbefbmqIr3ruZq
 ELmJuVBNz5zfCsq2z59LmSMZHHPGNzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-bP2cYlUsMFSFK32jRRkagg-1; Tue, 08 Sep 2020 10:12:09 -0400
X-MC-Unique: bP2cYlUsMFSFK32jRRkagg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E71EE805EE2
 for <qemu-devel@nongnu.org>; Tue,  8 Sep 2020 14:12:08 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD27419728;
 Tue,  8 Sep 2020 14:12:07 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: support KVM_FEATURE_ASYNC_PF_INT
Date: Tue,  8 Sep 2020 16:12:06 +0200
Message-Id: <20200908141206.357450-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux-5.8 introduced interrupt based mechanism for 'page ready' events
delivery and disabled the old, #PF based one (see commit 2635b5c4a0e4
"KVM: x86: interrupt based APF 'page ready' event delivery"). Linux
guest switches to using in in 5.9 (see commit b1d405751cd5 "KVM: x86:
Switch KVM guest to using interrupts for page ready APF delivery").
The feature has a new KVM_FEATURE_ASYNC_PF_INT bit assigned and
the interrupt vector is set in MSR_KVM_ASYNC_PF_INT MSR. Support this
in QEMU.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
- Note, Linux-5.9-rc4 is currently broken (see
https://lore.kernel.org/kvm/20200908135350.355053-3-vkuznets@redhat.com/T/#u)
but I hope it will get fixed before 5.9 is released.
---
 target/i386/cpu.c     |  4 +++-
 target/i386/cpu.h     |  1 +
 target/i386/kvm.c     | 10 ++++++++++
 target/i386/machine.c | 19 +++++++++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 49d89585288d..76037843511f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -903,7 +903,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "kvmclock", "kvm-nopiodelay", "kvm-mmu", "kvmclock",
             "kvm-asyncpf", "kvm-steal-time", "kvm-pv-eoi", "kvm-pv-unhalt",
             NULL, "kvm-pv-tlb-flush", NULL, "kvm-pv-ipi",
-            "kvm-poll-control", "kvm-pv-sched-yield", NULL, NULL,
+            "kvm-poll-control", "kvm-pv-sched-yield", "kvm-asyncpf-int", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "kvmclock-stable-bit", NULL, NULL, NULL,
@@ -4209,6 +4209,7 @@ static PropValue kvm_default_props[] = {
     { "kvmclock", "on" },
     { "kvm-nopiodelay", "on" },
     { "kvm-asyncpf", "on" },
+    { "kvm-asyncpf-int", "on" },
     { "kvm-steal-time", "on" },
     { "kvm-pv-eoi", "on" },
     { "kvmclock-stable-bit", "on" },
@@ -7092,6 +7093,7 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "kvm_nopiodelay", obj, "kvm-nopiodelay");
     object_property_add_alias(obj, "kvm_mmu", obj, "kvm-mmu");
     object_property_add_alias(obj, "kvm_asyncpf", obj, "kvm-asyncpf");
+    object_property_add_alias(obj, "kvm_asyncpf_int", obj, "kvm-asyncpf-int");
     object_property_add_alias(obj, "kvm_steal_time", obj, "kvm-steal-time");
     object_property_add_alias(obj, "kvm_pv_eoi", obj, "kvm-pv-eoi");
     object_property_add_alias(obj, "kvm_pv_unhalt", obj, "kvm-pv-unhalt");
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d3097be6a50a..18e99e9b392a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1492,6 +1492,7 @@ typedef struct CPUX86State {
     uint64_t wall_clock_msr;
     uint64_t steal_time_msr;
     uint64_t async_pf_en_msr;
+    uint64_t async_pf_int_msr;
     uint64_t pv_eoi_en_msr;
     uint64_t poll_control_msr;
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 205b68bc0ce8..b26370662075 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -287,6 +287,7 @@ static const struct kvm_para_features {
     { KVM_CAP_NOP_IO_DELAY, KVM_FEATURE_NOP_IO_DELAY },
     { KVM_CAP_PV_MMU, KVM_FEATURE_MMU_OP },
     { KVM_CAP_ASYNC_PF, KVM_FEATURE_ASYNC_PF },
+    { KVM_CAP_ASYNC_PF_INT, KVM_FEATURE_ASYNC_PF_INT },
 };
 
 static int get_para_features(KVMState *s)
@@ -2820,6 +2821,9 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
         if (env->features[FEAT_KVM] & (1 << KVM_FEATURE_ASYNC_PF)) {
             kvm_msr_entry_add(cpu, MSR_KVM_ASYNC_PF_EN, env->async_pf_en_msr);
         }
+        if (env->features[FEAT_KVM] & (1 << KVM_FEATURE_ASYNC_PF_INT)) {
+            kvm_msr_entry_add(cpu, MSR_KVM_ASYNC_PF_EN, env->async_pf_int_msr);
+        }
         if (env->features[FEAT_KVM] & (1 << KVM_FEATURE_PV_EOI)) {
             kvm_msr_entry_add(cpu, MSR_KVM_PV_EOI_EN, env->pv_eoi_en_msr);
         }
@@ -3205,6 +3209,9 @@ static int kvm_get_msrs(X86CPU *cpu)
     if (env->features[FEAT_KVM] & (1 << KVM_FEATURE_ASYNC_PF)) {
         kvm_msr_entry_add(cpu, MSR_KVM_ASYNC_PF_EN, 0);
     }
+    if (env->features[FEAT_KVM] & (1 << KVM_FEATURE_ASYNC_PF_INT)) {
+        kvm_msr_entry_add(cpu, MSR_KVM_ASYNC_PF_INT, 0);
+    }
     if (env->features[FEAT_KVM] & (1 << KVM_FEATURE_PV_EOI)) {
         kvm_msr_entry_add(cpu, MSR_KVM_PV_EOI_EN, 0);
     }
@@ -3445,6 +3452,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_KVM_ASYNC_PF_EN:
             env->async_pf_en_msr = msrs[i].data;
             break;
+        case MSR_KVM_ASYNC_PF_INT:
+            env->async_pf_int_msr = msrs[i].data;
+            break;
         case MSR_KVM_PV_EOI_EN:
             env->pv_eoi_en_msr = msrs[i].data;
             break;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index b1acf7d0ef46..233e46bb70b5 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -394,6 +394,13 @@ static bool async_pf_msr_needed(void *opaque)
     return cpu->env.async_pf_en_msr != 0;
 }
 
+static bool async_pf_int_msr_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+
+    return cpu->env.async_pf_int_msr != 0;
+}
+
 static bool pv_eoi_msr_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -467,6 +474,17 @@ static const VMStateDescription vmstate_async_pf_msr = {
     }
 };
 
+static const VMStateDescription vmstate_async_pf_int_msr = {
+    .name = "cpu/async_pf_int_msr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = async_pf_int_msr_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.async_pf_int_msr, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pv_eoi_msr = {
     .name = "cpu/async_pv_eoi_msr",
     .version_id = 1,
@@ -1438,6 +1456,7 @@ VMStateDescription vmstate_x86_cpu = {
     .subsections = (const VMStateDescription*[]) {
         &vmstate_exception_info,
         &vmstate_async_pf_msr,
+        &vmstate_async_pf_int_msr,
         &vmstate_pv_eoi_msr,
         &vmstate_steal_time_msr,
         &vmstate_poll_control_msr,
-- 
2.25.4


