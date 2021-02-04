Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A430F8C0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:59:09 +0100 (CET)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hyG-0005Rw-K9
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7hfk-0008Ud-Qs
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:53456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7hfc-0004UE-Qj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E89DAF5B;
 Thu,  4 Feb 2021 16:39:49 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v16 08/23] target/arm: do not use cc->do_interrupt for KVM
 directly
Date: Thu,  4 Feb 2021 17:39:16 +0100
Message-Id: <20210204163931.7358-9-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204163931.7358-1-cfontana@suse.de>
References: <20210204163931.7358-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc->do_interrupt is in theory a TCG callback used in accel/tcg only,
to prepare the emulated architecture to take an interrupt as defined
in the hardware specifications,

but in reality the _do_interrupt style of functions in targets are
also occasionally reused by KVM to prepare the architecture state in a
similar way where userspace code has identified that it needs to
deliver an exception to the guest.

In the case of ARM, that includes:

1) the vcpu thread got a SIGBUS indicating a memory error,
   and we need to deliver a Synchronous External Abort to the guest to
   let it know about the error.
2) the kernel told us about a debug exception (breakpoint, watchpoint)
   but it is not for one of QEMU's own gdbstub breakpoints/watchpoints
   so it must be a breakpoint the guest itself has set up, therefore
   we need to deliver it to the guest.

So in order to reuse code, the same arm_do_interrupt function is used.
This is all fine, but we need to avoid calling it using the callback
registered in CPUClass, since that one is now TCG-only.

Fortunately this is easily solved by replacing calls to
CPUClass::do_interrupt() with explicit calls to arm_do_interrupt().

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++++
 target/arm/kvm64.c  | 6 ++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47e266d7e6..1a64bd748c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9969,6 +9969,10 @@ static void handle_semihosting(CPUState *cs)
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
+ *
+ * Note: this is used for both TCG (as the do_interrupt tcg op),
+ *       and KVM to re-inject guest debug exceptions, and to
+ *       inject a Synchronous-External-Abort.
  */
 void arm_cpu_do_interrupt(CPUState *cs)
 {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3c37fc4fb6..dff85f6db9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -946,7 +946,6 @@ static void kvm_inject_arm_sea(CPUState *c)
 {
     ARMCPU *cpu = ARM_CPU(c);
     CPUARMState *env = &cpu->env;
-    CPUClass *cc = CPU_GET_CLASS(c);
     uint32_t esr;
     bool same_el;
 
@@ -962,7 +961,7 @@ static void kvm_inject_arm_sea(CPUState *c)
 
     env->exception.syndrome = esr;
 
-    cc->do_interrupt(c);
+    arm_cpu_do_interrupt(c);
 }
 
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
@@ -1493,7 +1492,6 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 {
     int hsr_ec = syn_get_ec(debug_exit->hsr);
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = &cpu->env;
 
     /* Ensure PC is synchronised */
@@ -1547,7 +1545,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     env->exception.vaddress = debug_exit->far;
     env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
-    cc->do_interrupt(cs);
+    arm_cpu_do_interrupt(cs);
     qemu_mutex_unlock_iothread();
 
     return false;
-- 
2.26.2


