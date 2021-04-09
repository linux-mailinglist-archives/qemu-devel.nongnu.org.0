Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0735990C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:22:54 +0200 (CEST)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnLq-00029J-3P
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tglx@linutronix.de>)
 id 1lUnIy-0001BK-H8
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:19:56 -0400
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1]:44470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tglx@linutronix.de>)
 id 1lUnIu-0000It-SV
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:19:56 -0400
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1617959989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WfcZ5q0KU6r5Mjht3FAZ0XMh57ML+b4s2AEOei31CUo=;
 b=xoLcrIkIawpTNZ3LQUzhi7x9ccpgy/pSVEIY99tRm9kbitE1qpEYynpQyqLnW+mcC1xsny
 BsMWYb2yzo8TjMf3wUujvOyymz1j05yCerDfVUlPL+68yR2rU+7WW9YJczi4xrJ3O6t+50
 7hi5BED+G5xmJhEmND4iMxxYHh8AuyfV/WOuBi01nMq+26PwvKBXHfwut0P2DHoEBmT/cx
 sis/L07yykDEn1HMhR33Lx7uAJrEw/hdJLyAnOzi5C0N+qCpo5KvqnkFcUx/pGdhmLLZAi
 hd1zTxmrI5xsZQ5SjafTJSOW65Z4Yi2vevgKuL/50zBApDQx3R4QA8mLc40W/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1617959989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WfcZ5q0KU6r5Mjht3FAZ0XMh57ML+b4s2AEOei31CUo=;
 b=4zhzvsRiUgV1AIipj4zLtc/L6rPMz45SrnYUvDDr41jUbJFn/8OULNdT5zp2qUp4BhUOIj
 y7SeMxfv60zFcxBQ==
To: Wanpeng Li <kernellwp@gmail.com>
Subject: Re: Commit "x86/kvm: Move context tracking where it belongs" broke
 guest time accounting
In-Reply-To: <CANRm+CwgvAPOvCxmuEDb+L5kvjBcpWE03Ps70qpqKntHuPxpaA@mail.gmail.com>
References: <YGzW/Pa/p7svg5Rr@google.com>
 <874kgg29uo.ffs@nanos.tec.linutronix.de>
 <CANRm+CwgvAPOvCxmuEDb+L5kvjBcpWE03Ps70qpqKntHuPxpaA@mail.gmail.com>
Date: Fri, 09 Apr 2021 11:19:48 +0200
Message-ID: <871rbj6ci3.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a0a:51c0:0:12e:550::1;
 envelope-from=tglx@linutronix.de; helo=galois.linutronix.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Sean Christopherson <seanjc@google.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 kvm <kvm@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09 2021 at 16:13, Wanpeng Li wrote:
> On Thu, 8 Apr 2021 at 21:19, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> +    account_guest_enter();

This wants to move into the instrumentation_begin/end() section above.

>      guest_enter_irqoff();
>      lockdep_hardirqs_on(CALLER_ADDR0);
>
> @@ -3759,6 +3760,8 @@ static noinstr void svm_vcpu_enter_exit(struct
> kvm_vcpu *vcpu)
>       */
>      lockdep_hardirqs_off(CALLER_ADDR0);
>      guest_exit_irqoff();
> +    if (vtime_accounting_enabled_this_cpu())
> +        account_guest_exit();

This time below. Aside of that I'd suggest to have two inlines instead
of having the conditional here.

>
>  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
> -/* must be called with irqs disabled */
> -static __always_inline void guest_enter_irqoff(void)
> +static __always_inline void account_guest_enter(void)
>  {
>      instrumentation_begin();
>      if (vtime_accounting_enabled_this_cpu())
> @@ -113,7 +112,11 @@ static __always_inline void guest_enter_irqoff(void)
>      else
>          current->flags |= PF_VCPU;
>      instrumentation_end();

If you move the invocation into the instrumentable section then this
instrumentation_begin/end() can be removed.

Something like the below +/- the obligatory bikeshed painting
vs. function names.

Thanks,

        tglx
---
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3782,6 +3782,7 @@ static noinstr void svm_vcpu_enter_exit(
 	 * accordingly.
 	 */
 	instrumentation_begin();
+	vtime_account_guest_enter();
 	trace_hardirqs_on_prepare();
 	lockdep_hardirqs_on_prepare(CALLER_ADDR0);
 	instrumentation_end();
@@ -3816,6 +3817,7 @@ static noinstr void svm_vcpu_enter_exit(
 
 	instrumentation_begin();
 	trace_hardirqs_off_finish();
+	vtime_account_guest_exit();
 	instrumentation_end();
 }
 
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6655,6 +6655,7 @@ static noinstr void vmx_vcpu_enter_exit(
 	 * accordingly.
 	 */
 	instrumentation_begin();
+	vtime_account_guest_enter();
 	trace_hardirqs_on_prepare();
 	lockdep_hardirqs_on_prepare(CALLER_ADDR0);
 	instrumentation_end();
@@ -6693,6 +6694,7 @@ static noinstr void vmx_vcpu_enter_exit(
 
 	instrumentation_begin();
 	trace_hardirqs_off_finish();
+	vtime_account_guest_exit();
 	instrumentation_end();
 }
 
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9200,6 +9200,7 @@ static int vcpu_enter_guest(struct kvm_v
 	++vcpu->stat.exits;
 	local_irq_disable();
 	kvm_after_interrupt(vcpu);
+	vcpu_account_guest_exit();
 
 	if (lapic_in_kernel(vcpu)) {
 		s64 delta = vcpu->arch.apic->lapic_timer.advance_expire_delta;
--- a/include/linux/context_tracking.h
+++ b/include/linux/context_tracking.h
@@ -107,13 +107,6 @@ static inline void context_tracking_init
 /* must be called with irqs disabled */
 static __always_inline void guest_enter_irqoff(void)
 {
-	instrumentation_begin();
-	if (vtime_accounting_enabled_this_cpu())
-		vtime_guest_enter(current);
-	else
-		current->flags |= PF_VCPU;
-	instrumentation_end();
-
 	if (context_tracking_enabled())
 		__context_tracking_enter(CONTEXT_GUEST);
 
@@ -135,37 +128,18 @@ static __always_inline void guest_exit_i
 {
 	if (context_tracking_enabled())
 		__context_tracking_exit(CONTEXT_GUEST);
-
-	instrumentation_begin();
-	if (vtime_accounting_enabled_this_cpu())
-		vtime_guest_exit(current);
-	else
-		current->flags &= ~PF_VCPU;
-	instrumentation_end();
 }
 
 #else
 static __always_inline void guest_enter_irqoff(void)
 {
-	/*
-	 * This is running in ioctl context so its safe
-	 * to assume that it's the stime pending cputime
-	 * to flush.
-	 */
 	instrumentation_begin();
-	vtime_account_kernel(current);
-	current->flags |= PF_VCPU;
 	rcu_virt_note_context_switch(smp_processor_id());
 	instrumentation_end();
 }
 
 static __always_inline void guest_exit_irqoff(void)
 {
-	instrumentation_begin();
-	/* Flush the guest cputime we spent on the guest */
-	vtime_account_kernel(current);
-	current->flags &= ~PF_VCPU;
-	instrumentation_end();
 }
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_GEN */
 
@@ -178,4 +152,24 @@ static inline void guest_exit(void)
 	local_irq_restore(flags);
 }
 
+static __always_inline void vtime_account_guest_enter(void)
+{
+	if (vtime_accounting_enabled_this_cpu())
+		vtime_guest_enter(current);
+	else
+		current->flags |= PF_VCPU;
+}
+
+static __always_inline void vtime_account_guest_exit(void)
+{
+	if (vtime_accounting_enabled_this_cpu())
+		vtime_guest_exit(current);
+}
+
+static __always_inline void vcpu_account_guest_exit(void)
+{
+	if (!vtime_accounting_enabled_this_cpu())
+		current->flags &= ~PF_VCPU;
+}
+
 #endif

