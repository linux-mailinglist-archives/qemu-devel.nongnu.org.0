Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01726D9EA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 13:14:34 +0200 (CEST)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIrs1-0004Xe-Ff
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 07:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kIrqq-00046f-IK
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 07:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kIrqn-0002ug-VK
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 07:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600341196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pplzKFZUoIjGfxypuC03DYnXPnAd5yOOVhb45BPdp2s=;
 b=LOhpAJkQFDwSxfpq+aArvwG0ly/rCWp6Q6cWdsW6SBZlsq0KgghnTzZL/TR3roHG86oBVP
 F/XvISCGYoRFamign+uQVnRTy/O+54YX92LW2kzIiKn+AIPGJHtoybLzY+RMYxg6Up/0L3
 7WW7L4IOt6nztCyDS3tMv5Pkjz3SlIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-VkaTea-mN-SYo-MqOVhf_w-1; Thu, 17 Sep 2020 07:13:12 -0400
X-MC-Unique: VkaTea-mN-SYo-MqOVhf_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34635186DD27;
 Thu, 17 Sep 2020 11:13:11 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DE275132;
 Thu, 17 Sep 2020 11:13:09 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: always create kvmclock device
Date: Thu, 17 Sep 2020 13:13:06 +0200
Message-Id: <20200917111306.819263-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
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
Cc: Antoine Damhet <antoine.damhet@blade-group.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU's kvmclock device is only created when KVM PV feature bits for
kvmclock (KVM_FEATURE_CLOCKSOURCE/KVM_FEATURE_CLOCKSOURCE2) are
exposed to the guest. With 'kvm=off' cpu flag the device is not
created and we don't call KVM_GET_CLOCK/KVM_SET_CLOCK upon migration.
It was reported that without these call at least Hyper-V TSC page
clocksouce (which can be enabled independently) gets broken after
migration.

Switch to creating kvmclock QEMU device unconditionally, it seems
to always make sense to call KVM_GET_CLOCK/KVM_SET_CLOCK on migration.
Use KVM_CAP_ADJUST_CLOCK check instead of CPUID feature bits.

Reported-by: Antoine Damhet <antoine.damhet@blade-group.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 hw/i386/kvm/clock.c    | 6 +-----
 target/i386/kvm.c      | 5 +++++
 target/i386/kvm_i386.h | 1 +
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 64283358f91d..526c9ea5172b 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -330,11 +330,7 @@ static const TypeInfo kvmclock_info = {
 /* Note: Must be called after VCPU initialization. */
 void kvmclock_create(void)
 {
-    X86CPU *cpu = X86_CPU(first_cpu);
-
-    if (kvm_enabled() &&
-        cpu->env.features[FEAT_KVM] & ((1ULL << KVM_FEATURE_CLOCKSOURCE) |
-                                       (1ULL << KVM_FEATURE_CLOCKSOURCE2))) {
+    if (kvm_enabled() && kvm_has_adjust_clock()) {
         sysbus_create_simple(TYPE_KVM_CLOCK, -1, NULL);
     }
 }
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 4a8b3a41c1bc..20b31b65307b 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -143,6 +143,11 @@ bool kvm_has_adjust_clock_stable(void)
     return (ret == KVM_CLOCK_TSC_STABLE);
 }
 
+bool kvm_has_adjust_clock(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
+}
+
 bool kvm_has_exception_payload(void)
 {
     return has_exception_payload;
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
index 064b8798a26c..0fce4e51d2d6 100644
--- a/target/i386/kvm_i386.h
+++ b/target/i386/kvm_i386.h
@@ -34,6 +34,7 @@
 
 bool kvm_allows_irq0_override(void);
 bool kvm_has_smm(void);
+bool kvm_has_adjust_clock(void);
 bool kvm_has_adjust_clock_stable(void);
 bool kvm_has_exception_payload(void);
 void kvm_synchronize_all_tsc(void);
-- 
2.25.4


