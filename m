Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C727F961
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 08:19:07 +0200 (CEST)
Received: from localhost ([::1]:49518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNrvm-0005sa-9L
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 02:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruI-00049J-48
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 02:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruG-0003rc-A0
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 02:17:33 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601533051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYA+zFKDmKH8V8HXIMs/oeL/JdVQqc9A9vJ3k5IO9KY=;
 b=QhyUjCvtNw0NSTpz7WLWfX29C9g0ixbZpMVFYfeyloQPkJprPFDip2e4TgzCoezs61PfJe
 yBiR+DiCmF920t74Gt8NmAvUGuv9jQjWAnK+7Uer+U3h/gA1HF7frU42Kj06lZniqeUdjp
 t7AsVJakW3U/+mTDw9q2IeZAuxoxnO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-APwsy-Q3OPib-FGkSGNRTA-1; Thu, 01 Oct 2020 02:17:29 -0400
X-MC-Unique: APwsy-Q3OPib-FGkSGNRTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B743851B2;
 Thu,  1 Oct 2020 06:17:28 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4830355797;
 Thu,  1 Oct 2020 06:17:27 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 2/6] target/arm/kvm: Make uncalled stubs explicitly
 unreachable
Date: Thu,  1 Oct 2020 08:17:14 +0200
Message-Id: <20201001061718.101915-3-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-1-drjones@redhat.com>
References: <20201001061718.101915-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 00:27:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we compile without KVM support !defined(CONFIG_KVM) we generate
stubs for functions that the linker will still encounter. Sometimes
these stubs can be executed safely and are placed in paths where they
get executed with or without KVM. Other functions should never be
called without KVM. Those functions should be guarded by kvm_enabled(),
but should also be robust to refactoring mistakes. Putting a
g_assert_not_reached() in the function should help. Additionally,
the g_assert_not_reached() calls may actually help the linker remove
some code.

We remove the stubs for kvm_arm_get/put_virtual_time(), as they aren't
necessary at all - the only caller is in kvm.c

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm_arm.h | 51 +++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index bc178eeb84c0..f513702176a7 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -344,18 +344,10 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 #else
 
-static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
-{
-    /*
-     * This should never actually be called in the "not KVM" case,
-     * but set up the fields to indicate an error anyway.
-     */
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
-    cpu->host_cpu_probe_failed = true;
-}
-
-static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
-
+/*
+ * It's safe to call these functions without KVM support.
+ * They should either do nothing or return "not supported".
+ */
 static inline bool kvm_arm_aarch32_supported(void)
 {
     return false;
@@ -371,23 +363,44 @@ static inline bool kvm_arm_sve_supported(void)
     return false;
 }
 
+/*
+ * These functions should never actually be called without KVM support.
+ */
+static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+static inline void kvm_arm_add_vcpu_properties(Object *obj)
+{
+    g_assert_not_reached();
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
-    return -ENOENT;
+    g_assert_not_reached();
 }
 
 static inline int kvm_arm_vgic_probe(void)
 {
-    return 0;
+    g_assert_not_reached();
 }
 
-static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
-static inline void kvm_arm_pmu_init(CPUState *cs) {}
+static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+{
+    g_assert_not_reached();
+}
 
-static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map) {}
+static inline void kvm_arm_pmu_init(CPUState *cs)
+{
+    g_assert_not_reached();
+}
+
+static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+{
+    g_assert_not_reached();
+}
 
-static inline void kvm_arm_get_virtual_time(CPUState *cs) {}
-static inline void kvm_arm_put_virtual_time(CPUState *cs) {}
 #endif
 
 static inline const char *gic_class_name(void)
-- 
2.26.2


