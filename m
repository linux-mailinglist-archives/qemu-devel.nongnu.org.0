Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705066C1DAA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJBa-00018A-7G; Mon, 20 Mar 2023 13:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJBX-00017t-RM
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:20:40 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJBV-0002A0-VG
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:20:39 -0400
Received: by mail-wm1-x336.google.com with SMTP id iw17so2709503wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679332836;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FaLkmYJhAuSILs36izqSNeQFPSNcUP8Zy16+CG+OTLw=;
 b=dOQqn+LUioJH2X9sOtXGCk/2/SNHPXHTBNwFvKgb2E5zB4n8ySruwCtskqxxxWcZVV
 NGh0om5BfIJp6WlbMnc2Iyq1mJCDqPSbjJNX/4voe5Tqgz+m9NFs32u+gS5pTfd5zlP6
 pofURSBKhXJonQUUIQffvtfiT8lv+P0WksiHb4MjAEhTeYZPbZ5odkvmO7ikebyNyns/
 ss3J9wdCEEAPW9uGI1gRnGLxtRFfa/CyCHmucf0jOB4xbUuPj5ff2J0vn7hOV1AzIYAU
 dL6sJDx8xcMeHhOBlXwMGa9h/i7XsVpR5H6JuBrCFzOjxQRS6+BXoQFZjBoIyQvznTDK
 LO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332836;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FaLkmYJhAuSILs36izqSNeQFPSNcUP8Zy16+CG+OTLw=;
 b=Rb63gEk805UDgI49eKortj8t5wOVuGBaUM7EwANE9PuIxnxVWBFxcQC+JZmQZ2dTjw
 Iz5aQ8KpzHFoKRumSje0tU0Q3nvZLGncioSACScg22AGHBl7aqXj15Icq1ApPEpsoLgw
 Otq2M9j7T+51XVtAl99MpIxBywAcdIMIpHsusBMuwEg8hAqZl3Puigi7umrIXUiS4LLI
 9d/jujadRQFhS1eCGpP0biZbpL+CllAwVQetf2Ii2oB5RCYDQIkExHWPDxuRL0FLjx49
 bmvI2Y4w+x3TJBmZ4yRbGdXMm0xgdLBKNudnZ1W++poDlB/PphMTcZqrGm6bIax4Pvgz
 fF8A==
X-Gm-Message-State: AO0yUKXawd/rD2TrJ2A6kPo99x3kLfpGwyx4SIEngaES5NrWJt3+SWEy
 r0hOvSxETNbKuzTZsSPSjcKodw==
X-Google-Smtp-Source: AK7set+YM06oOmWG96/dWRyx6KhD4WayN7/2Z3afTIM14nvGNjiWUzVW9PeQajew2CgLMaXHbNb4kw==
X-Received: by 2002:a1c:4c0d:0:b0:3ee:ed5:6115 with SMTP id
 z13-20020a1c4c0d000000b003ee0ed56115mr251830wmf.19.1679332836288; 
 Mon, 20 Mar 2023 10:20:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b003ee0eb4b45csm1972528wmo.24.2023.03.20.10.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:20:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF24B1FFB7;
 Mon, 20 Mar 2023 17:20:35 +0000 (GMT)
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-4-alex.bennee@linaro.org>
 <9abe3d28-9d35-85cc-118c-083cb267db59@suse.de>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Cc: Alessandro Di Federico <ale@rev.ng>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fabiano Rosas
 <fabiano.rosas@suse.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Date: Mon, 20 Mar 2023 17:20:05 +0000
In-reply-to: <9abe3d28-9d35-85cc-118c-083cb267db59@suse.de>
Message-ID: <87edpj7318.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Claudio Fontana <cfontana@suse.de> writes:

> Hi Alex, all,
>
> again, this moves TCG-only code to common code, no?
>
> Even if this happens to work, the idea is to avoid adding unneeded accel =
TCG code to a KVM-only binary.
>
> We need to keep in mind all dimensions when we do refactorings:
>
> user-mode vs sysemu,
> the architecture,
> the accel, in particular tcg, non-tcg (which could be not compiled in,
> built-in, or loaded as separate module).
>
> In many cases, testing with --disable-tcg --enable-kvm helps to avoid bre=
akages,
> but it is possible also to move in unneeded code in a way that does
> not generate compile or link-time errors, so we need to be a bit alert
> to that.

You are right of course, it should be kept tcg only. I guess using
tcgops instead of sysemu_ops.

>
> Ciao,
>
> C=20
>
>
> On 3/20/23 11:10, Alex Benn=C3=A9e wrote:
>> We don't want to be polluting the core run loop code with target
>> specific handling, punt it to sysemu_ops where it belongs.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  include/hw/core/sysemu-cpu-ops.h |  5 +++++
>>  target/i386/cpu-internal.h       |  1 +
>>  accel/tcg/cpu-exec.c             | 14 +++-----------
>>  target/i386/cpu-sysemu.c         | 12 ++++++++++++
>>  target/i386/cpu.c                |  1 +
>>  5 files changed, 22 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-c=
pu-ops.h
>> index ee169b872c..c9d30172c4 100644
>> --- a/include/hw/core/sysemu-cpu-ops.h
>> +++ b/include/hw/core/sysemu-cpu-ops.h
>> @@ -48,6 +48,11 @@ typedef struct SysemuCPUOps {
>>       * GUEST_PANICKED events.
>>       */
>>      GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
>> +    /**
>> +     * @handle_cpu_halt: Callback for special handling during cpu_handl=
e_halt()
>> +     * @cs: The CPUState
>> +     */
>> +    void (*handle_cpu_halt)(CPUState *cpu);
>>      /**
>>       * @write_elf32_note: Callback for writing a CPU-specific ELF note =
to a
>>       * 32-bit VM coredump.
>> diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
>> index 9baac5c0b4..75b302fb33 100644
>> --- a/target/i386/cpu-internal.h
>> +++ b/target/i386/cpu-internal.h
>> @@ -65,6 +65,7 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *=
v,
>>  void x86_cpu_apic_create(X86CPU *cpu, Error **errp);
>>  void x86_cpu_apic_realize(X86CPU *cpu, Error **errp);
>>  void x86_cpu_machine_reset_cb(void *opaque);
>> +void x86_cpu_handle_halt(CPUState *cs);
>>  #endif /* !CONFIG_USER_ONLY */
>>=20=20
>>  #endif /* I386_CPU_INTERNAL_H */
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index c815f2dbfd..5e5906e199 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -22,6 +22,7 @@
>>  #include "qapi/error.h"
>>  #include "qapi/type-helpers.h"
>>  #include "hw/core/tcg-cpu-ops.h"
>> +#include "hw/core/sysemu-cpu-ops.h"
>>  #include "trace.h"
>>  #include "disas/disas.h"
>>  #include "exec/exec-all.h"
>> @@ -30,9 +31,6 @@
>>  #include "qemu/rcu.h"
>>  #include "exec/log.h"
>>  #include "qemu/main-loop.h"
>> -#if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
>> -#include "hw/i386/apic.h"
>> -#endif
>>  #include "sysemu/cpus.h"
>>  #include "exec/cpu-all.h"
>>  #include "sysemu/cpu-timers.h"
>> @@ -650,15 +648,9 @@ static inline bool cpu_handle_halt(CPUState *cpu)
>>  {
>>  #ifndef CONFIG_USER_ONLY
>>      if (cpu->halted) {
>> -#if defined(TARGET_I386)
>> -        if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
>> -            X86CPU *x86_cpu =3D X86_CPU(cpu);
>> -            qemu_mutex_lock_iothread();
>> -            apic_poll_irq(x86_cpu->apic_state);
>> -            cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
>> -            qemu_mutex_unlock_iothread();
>> +        if (cpu->cc->sysemu_ops->handle_cpu_halt) {
>> +            cpu->cc->sysemu_ops->handle_cpu_halt(cpu);
>>          }
>> -#endif /* TARGET_I386 */
>>          if (!cpu_has_work(cpu)) {
>>              return true;
>>          }
>> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
>> index 28115edf44..e545bf7590 100644
>> --- a/target/i386/cpu-sysemu.c
>> +++ b/target/i386/cpu-sysemu.c
>> @@ -18,6 +18,7 @@
>>   */
>>=20=20
>>  #include "qemu/osdep.h"
>> +#include "qemu/main-loop.h"
>>  #include "cpu.h"
>>  #include "sysemu/xen.h"
>>  #include "sysemu/whpx.h"
>> @@ -310,6 +311,17 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
>>       }
>>  }
>>=20=20
>> +void x86_cpu_handle_halt(CPUState *cpu)
>> +{
>> +    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
>> +        X86CPU *x86_cpu =3D X86_CPU(cpu);
>> +        qemu_mutex_lock_iothread();
>> +        apic_poll_irq(x86_cpu->apic_state);
>> +        cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
>> +        qemu_mutex_unlock_iothread();
>> +    }
>> +}
>> +
>>  GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
>>  {
>>      X86CPU *cpu =3D X86_CPU(cs);
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 6576287e5b..67027d28b0 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -7241,6 +7241,7 @@ static const struct SysemuCPUOps i386_sysemu_ops =
=3D {
>>      .get_phys_page_attrs_debug =3D x86_cpu_get_phys_page_attrs_debug,
>>      .asidx_from_attrs =3D x86_asidx_from_attrs,
>>      .get_crash_info =3D x86_cpu_get_crash_info,
>> +    .handle_cpu_halt =3D x86_cpu_handle_halt,
>>      .write_elf32_note =3D x86_cpu_write_elf32_note,
>>      .write_elf64_note =3D x86_cpu_write_elf64_note,
>>      .write_elf32_qemunote =3D x86_cpu_write_elf32_qemunote,


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

