Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF966C1875
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:24:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHM1-0003yw-I8; Mon, 20 Mar 2023 11:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peHLx-0003yh-VX
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:23:18 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peHLv-0005gW-U2
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:23:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8AE8F1F88D;
 Mon, 20 Mar 2023 15:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679325792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdqKe1kxnV7W30WKtbImRJ4UpZpGvQQmViPUZ4akqSU=;
 b=N7oJnuNDfY0nRWWUo6N8Vc+fMuHSXIf8SvH5fvSGRTI8hdPklQiPjNTgxvwDJnFHo+4H37
 6geaZJGIXBq0TitpSVMAshCR0MzVBT/ZOQnlVnwYjxCFvTIydgxznaQ7TujC3nge8NVUWH
 7yVFFfbzTi2a4krlvayYyBIYLOxBuGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679325792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdqKe1kxnV7W30WKtbImRJ4UpZpGvQQmViPUZ4akqSU=;
 b=77H/z8Yk2qI7afK3xzOqW8EQRlQ65FOcvFPCsJ8Hqx/QDu/msu4jEeXPfWWlYC7MNzPYNb
 USECFLxwTJIhHECg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E45E13A00;
 Mon, 20 Mar 2023 15:23:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AIp0DWB6GGTOQwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 20 Mar 2023 15:23:12 +0000
Message-ID: <9abe3d28-9d35-85cc-118c-083cb267db59@suse.de>
Date: Mon, 20 Mar 2023 16:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <fabiano.rosas@suse.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-4-alex.bennee@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20230320101035.2214196-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex, all,

again, this moves TCG-only code to common code, no?

Even if this happens to work, the idea is to avoid adding unneeded accel TCG code to a KVM-only binary.

We need to keep in mind all dimensions when we do refactorings:

user-mode vs sysemu,
the architecture,
the accel, in particular tcg, non-tcg (which could be not compiled in, built-in, or loaded as separate module).

In many cases, testing with --disable-tcg --enable-kvm helps to avoid breakages,
but it is possible also to move in unneeded code in a way that does not generate compile or link-time errors, so we need to be a bit alert to that.

Ciao,

C 


On 3/20/23 11:10, Alex Bennée wrote:
> We don't want to be polluting the core run loop code with target
> specific handling, punt it to sysemu_ops where it belongs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/sysemu-cpu-ops.h |  5 +++++
>  target/i386/cpu-internal.h       |  1 +
>  accel/tcg/cpu-exec.c             | 14 +++-----------
>  target/i386/cpu-sysemu.c         | 12 ++++++++++++
>  target/i386/cpu.c                |  1 +
>  5 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
> index ee169b872c..c9d30172c4 100644
> --- a/include/hw/core/sysemu-cpu-ops.h
> +++ b/include/hw/core/sysemu-cpu-ops.h
> @@ -48,6 +48,11 @@ typedef struct SysemuCPUOps {
>       * GUEST_PANICKED events.
>       */
>      GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
> +    /**
> +     * @handle_cpu_halt: Callback for special handling during cpu_handle_halt()
> +     * @cs: The CPUState
> +     */
> +    void (*handle_cpu_halt)(CPUState *cpu);
>      /**
>       * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
>       * 32-bit VM coredump.
> diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
> index 9baac5c0b4..75b302fb33 100644
> --- a/target/i386/cpu-internal.h
> +++ b/target/i386/cpu-internal.h
> @@ -65,6 +65,7 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
>  void x86_cpu_apic_create(X86CPU *cpu, Error **errp);
>  void x86_cpu_apic_realize(X86CPU *cpu, Error **errp);
>  void x86_cpu_machine_reset_cb(void *opaque);
> +void x86_cpu_handle_halt(CPUState *cs);
>  #endif /* !CONFIG_USER_ONLY */
>  
>  #endif /* I386_CPU_INTERNAL_H */
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c815f2dbfd..5e5906e199 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -22,6 +22,7 @@
>  #include "qapi/error.h"
>  #include "qapi/type-helpers.h"
>  #include "hw/core/tcg-cpu-ops.h"
> +#include "hw/core/sysemu-cpu-ops.h"
>  #include "trace.h"
>  #include "disas/disas.h"
>  #include "exec/exec-all.h"
> @@ -30,9 +31,6 @@
>  #include "qemu/rcu.h"
>  #include "exec/log.h"
>  #include "qemu/main-loop.h"
> -#if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
> -#include "hw/i386/apic.h"
> -#endif
>  #include "sysemu/cpus.h"
>  #include "exec/cpu-all.h"
>  #include "sysemu/cpu-timers.h"
> @@ -650,15 +648,9 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>  {
>  #ifndef CONFIG_USER_ONLY
>      if (cpu->halted) {
> -#if defined(TARGET_I386)
> -        if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
> -            X86CPU *x86_cpu = X86_CPU(cpu);
> -            qemu_mutex_lock_iothread();
> -            apic_poll_irq(x86_cpu->apic_state);
> -            cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
> -            qemu_mutex_unlock_iothread();
> +        if (cpu->cc->sysemu_ops->handle_cpu_halt) {
> +            cpu->cc->sysemu_ops->handle_cpu_halt(cpu);
>          }
> -#endif /* TARGET_I386 */
>          if (!cpu_has_work(cpu)) {
>              return true;
>          }
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 28115edf44..e545bf7590 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -18,6 +18,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "sysemu/xen.h"
>  #include "sysemu/whpx.h"
> @@ -310,6 +311,17 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
>       }
>  }
>  
> +void x86_cpu_handle_halt(CPUState *cpu)
> +{
> +    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
> +        X86CPU *x86_cpu = X86_CPU(cpu);
> +        qemu_mutex_lock_iothread();
> +        apic_poll_irq(x86_cpu->apic_state);
> +        cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
>  {
>      X86CPU *cpu = X86_CPU(cs);
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6576287e5b..67027d28b0 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7241,6 +7241,7 @@ static const struct SysemuCPUOps i386_sysemu_ops = {
>      .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
>      .asidx_from_attrs = x86_asidx_from_attrs,
>      .get_crash_info = x86_cpu_get_crash_info,
> +    .handle_cpu_halt = x86_cpu_handle_halt,
>      .write_elf32_note = x86_cpu_write_elf32_note,
>      .write_elf64_note = x86_cpu_write_elf64_note,
>      .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,


