Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948162B900C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:25:07 +0100 (CET)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfh7i-0002Y3-Kw
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfh6K-0001G8-4T
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfh6F-0004FF-Rk
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BSsGnWegFpApX/8l4Cqt6AHgagAfQOael42BdBz81A=;
 b=hbCCNHQQBmnWJa/0ZEkXqaKmmMru6PSjt/EI/rfmUfPP+2RDy4P5/Re0HUjPRdNmMMSzPO
 m0A93WWOoHhWD56nOyJZEXH/YbnbDU2ddvx4AJl5TZGCJNyZeiGA5gO1zTr/nh6u0MgRXr
 7bLb5mnMJOWq3zpy3AgXQv4ptMy/sWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-fP-iHs_tOp25CuGDD8ANEg-1; Thu, 19 Nov 2020 05:23:32 -0500
X-MC-Unique: fP-iHs_tOp25CuGDD8ANEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F941084429;
 Thu, 19 Nov 2020 10:23:31 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-214.ams2.redhat.com
 [10.36.113.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96FE05D9C0;
 Thu, 19 Nov 2020 10:23:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-5.2 1/3] s390/kvm: fix diag318 propagation and reset
 functionality
Date: Thu, 19 Nov 2020 11:23:23 +0100
Message-Id: <20201119102325.1314765-2-cohuck@redhat.com>
In-Reply-To: <20201119102325.1314765-1-cohuck@redhat.com>
References: <20201119102325.1314765-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Collin Walling <walling@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Collin Walling <walling@linux.ibm.com>

The Control Program Name Code (CPNC) portion of the diag318
info must be set within the SIE block of each VCPU in the
configuration. The handler will iterate through each VCPU
and dirty the diag318_info reg to be synced with KVM on a
subsequent sync_regs call.

Additionally, the diag318 info resets must be handled via
userspace. As such, QEMU will reset this value for each
VCPU during a modified clear, load normal, and load clear
reset event.

Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
Signed-off-by: Collin Walling <walling@linux.ibm.com>
Message-Id: <20201113221022.257054-1-walling@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Janosch Frank <frankja@de.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c |  4 ++++
 target/s390x/cpu.c         |  7 +++++++
 target/s390x/cpu.h         |  1 +
 target/s390x/kvm-stub.c    |  4 ++++
 target/s390x/kvm.c         | 22 +++++++++++++++++-----
 target/s390x/kvm_s390x.h   |  1 +
 6 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 22222c4fd5ad..4e140bbead93 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -486,6 +486,10 @@ static void s390_machine_reset(MachineState *machine)
     default:
         g_assert_not_reached();
     }
+
+    CPU_FOREACH(t) {
+        run_on_cpu(t, s390_do_cpu_set_diag318, RUN_ON_CPU_HOST_ULONG(0));
+    }
     s390_ipl_clear_reset_request();
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 66f5942b5301..7b66718c4423 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -447,6 +447,13 @@ void s390_enable_css_support(S390CPU *cpu)
         kvm_s390_enable_css_support(cpu);
     }
 }
+
+void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_diag318(cs, arg.host_ulong);
+    }
+}
 #endif
 
 static gchar *s390_gdb_arch_name(CPUState *cs)
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index f875ebf0f491..60d434d5edd5 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -769,6 +769,7 @@ int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit);
 void s390_set_max_pagesize(uint64_t pagesize, Error **errp);
 void s390_cmma_reset(void);
 void s390_enable_css_support(S390CPU *cpu);
+void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
 int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
 #ifndef CONFIG_USER_ONLY
diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
index aa185017a2a8..9970b5a8c705 100644
--- a/target/s390x/kvm-stub.c
+++ b/target/s390x/kvm-stub.c
@@ -120,3 +120,7 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
 void kvm_s390_restart_interrupt(S390CPU *cpu)
 {
 }
+
+void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
+{
+}
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index baa070fdf7f9..b8385e6b95d3 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1611,10 +1611,23 @@ static int handle_sw_breakpoint(S390CPU *cpu, struct kvm_run *run)
     return -ENOENT;
 }
 
+void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
+{
+    CPUS390XState *env = &S390_CPU(cs)->env;
+
+    /* Feat bit is set only if KVM supports sync for diag318 */
+    if (s390_has_feat(S390_FEAT_DIAG_318)) {
+        env->diag318_info = diag318_info;
+        cs->kvm_run->s.regs.diag318 = diag318_info;
+        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+    }
+}
+
 static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
 {
     uint64_t reg = (run->s390_sieic.ipa & 0x00f0) >> 4;
     uint64_t diag318_info = run->s.regs.gprs[reg];
+    CPUState *t;
 
     /*
      * DIAG 318 can only be enabled with KVM support. As such, let's
@@ -1622,13 +1635,12 @@ static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
      */
     if (!s390_has_feat(S390_FEAT_DIAG_318)) {
         kvm_s390_program_interrupt(cpu, PGM_SPECIFICATION);
+        return;
     }
 
-    cpu->env.diag318_info = diag318_info;
-
-    if (can_sync_regs(CPU(cpu), KVM_SYNC_DIAG318)) {
-        run->s.regs.diag318 = diag318_info;
-        run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+    CPU_FOREACH(t) {
+        run_on_cpu(t, s390_do_cpu_set_diag318,
+                   RUN_ON_CPU_HOST_ULONG(diag318_info));
     }
 }
 
diff --git a/target/s390x/kvm_s390x.h b/target/s390x/kvm_s390x.h
index 6ab17c81b73a..25bbe98b2514 100644
--- a/target/s390x/kvm_s390x.h
+++ b/target/s390x/kvm_s390x.h
@@ -45,5 +45,6 @@ void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp);
 void kvm_s390_crypto_reset(void);
 void kvm_s390_restart_interrupt(S390CPU *cpu);
 void kvm_s390_stop_interrupt(S390CPU *cpu);
+void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
 
 #endif /* KVM_S390X_H */
-- 
2.26.2


