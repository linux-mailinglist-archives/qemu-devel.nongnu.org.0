Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC92F37F6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:10:39 +0100 (CET)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzO7q-0002kK-Lx
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzO0w-0005JC-1D
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:03:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:33604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzO0s-0004vt-6w
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:03:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2659EADE0;
 Tue, 12 Jan 2021 18:03:24 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v12 08/22] target/arm: do not use cc->do_interrupt for KVM
 directly
Date: Tue, 12 Jan 2021 19:02:58 +0100
Message-Id: <20210112180312.26043-9-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112180312.26043-1-cfontana@suse.de>
References: <20210112180312.26043-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
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
index d077dd9ef5..8e3f9c5472 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9891,6 +9891,10 @@ static void handle_semihosting(CPUState *cs)
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
index f74bac2457..3728b3a336 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -944,7 +944,6 @@ static void kvm_inject_arm_sea(CPUState *c)
 {
     ARMCPU *cpu = ARM_CPU(c);
     CPUARMState *env = &cpu->env;
-    CPUClass *cc = CPU_GET_CLASS(c);
     uint32_t esr;
     bool same_el;
 
@@ -960,7 +959,7 @@ static void kvm_inject_arm_sea(CPUState *c)
 
     env->exception.syndrome = esr;
 
-    cc->do_interrupt(c);
+    arm_cpu_do_interrupt(c);
 }
 
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
@@ -1491,7 +1490,6 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 {
     int hsr_ec = syn_get_ec(debug_exit->hsr);
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = &cpu->env;
 
     /* Ensure PC is synchronised */
@@ -1545,7 +1543,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     env->exception.vaddress = debug_exit->far;
     env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
-    cc->do_interrupt(cs);
+    arm_cpu_do_interrupt(cs);
     qemu_mutex_unlock_iothread();
 
     return false;
-- 
2.26.2


