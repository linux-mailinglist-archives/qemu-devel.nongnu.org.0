Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E223E3C08
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:41:37 +0200 (CEST)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmno-0001B9-J0
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCmkw-00082d-N2
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:38:40 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mCmkq-0003G9-Sw
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:38:37 -0400
Received: by mail-qk1-x72f.google.com with SMTP id c130so7530191qkg.7
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2ax88fOtnMLrKqhCrRWbGW45fx5ws4C06zfSrBE/XM=;
 b=yWTal0hOilp4LWWtRbzNRWFa1kgov6m2l9mshsshgUTFzw3VdBet8nlRgIhrb6BrRd
 hVTC6atCwowYVP8lebSF/BUYvJcfHn1mS+olUK8cMDtezwIp2Vkpsb22t/iOHH2auOli
 5DRKXREQ/eiULZ2r3w0oy4GmnWIm99dtQ3E9r+2tAWmwRjXPY0WarJZyCc1Mb/HJ5+xd
 KYWCnQIwdyU16tDXRl0THku/2lBSrTw5jc25tFcQUOcuDgy96cfNY2xK3aIqEr11hvHi
 FhORkeB1NChivU7HY8g8w5/RKmzyLl7fnctnsYlQPI+ez6plFKkqNV45ZSaVSfJPYr6s
 jCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2ax88fOtnMLrKqhCrRWbGW45fx5ws4C06zfSrBE/XM=;
 b=NoOYG/jCgc29QcqI8xjGgiZndaDpI5i1HRfmBQcrSmx77fghpZ+dZgq44Ly2zs46/Q
 mMWCPZs5YVMkji04PTPg+fFveiRMJ4P82aEfJHJ9lFP+KxSpzUnuql9FA3BI2i8VG5cR
 Iv2KRZgJBwoEfQgr9AIa/TMgnZkERFtJ8B+TN+30dJSIknvC7uOCmvRawbcFYulD6ce0
 Ux/KKZ2IvxGoa8g6hdv56NUTe+y5zCbtTwNWg6y0U58y8DKD73EQAiFOgHifTEXteHSW
 dDPmnczxwsyp3PbJzAwkqQRV8m6cAsCGJo2R4rchnoAkFwkmN3PQl4DhDoGUD10UdIO+
 MYgw==
X-Gm-Message-State: AOAM532/6OvDTaUCHR3Q3Oz7yEJaTLCoS0GVTjfEup9DkEZ6GQItmN8i
 dDeC/vAiEM6bp+jFAvON7r3yyqunwcbZJwayx+PY6g==
X-Google-Smtp-Source: ABdhPJx937SJzEFZhh5TAsTGpVhgERMc4mapO67032YuaVpqlPJ5GhhfaujEw76WEwfk97jqm7j5x0aSIzBiVlfCh9o=
X-Received: by 2002:a05:620a:a11:: with SMTP id
 i17mr2148385qka.359.1628444311046; 
 Sun, 08 Aug 2021 10:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-23-imp@bsdimp.com>
 <2626ce17-c4cc-01e2-b9e7-703b2f60cde6@linaro.org>
 <CANCZdfpcLOKRr5-YDOjNJbJLUJmBCFq8Cxpi4tkEasxOnrLZcA@mail.gmail.com>
 <b228f86c-4ab2-b26c-2bd2-a04fc434c335@linaro.org>
In-Reply-To: <b228f86c-4ab2-b26c-2bd2-a04fc434c335@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 8 Aug 2021 11:38:20 -0600
Message-ID: <CANCZdfq7DXXDtp+5OcW=DmEuMBde+mLTyQdkLm0W+zJLD9Gq_Q@mail.gmail.com>
Subject: Re: [PATCH for 6.2 22/49] bsd-user: Move per-cpu code into
 target_arch_cpu.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b25e3005c90fbc63"
Received-SPF: none client-ip=2607:f8b0:4864:20::72f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b25e3005c90fbc63
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 8, 2021 at 12:16 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 8:03 PM, Warner Losh wrote:
> >
> >
> > On Sat, Aug 7, 2021 at 11:35 PM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 8/7/21 11:42 AM, Warner Losh wrote:
> >      > diff --git a/bsd-user/i386/target_arch_cpu.c
> b/bsd-user/i386/target_arch_cpu.c
> >      > index 7f2f755a11..71998e5ba5 100644
> >      > --- a/bsd-user/i386/target_arch_cpu.c
> >      > +++ b/bsd-user/i386/target_arch_cpu.c
> >      > @@ -1,6 +1,7 @@
> >      >   /*
> >      >    *  i386 cpu related code
> >      >    *
> >      > + * Copyright (c) 2013 Stacey Son <sson@FreeBSD.org>
> >      >    *
> >      >    *  This program is free software; you can redistribute it
> and/or modify
> >      >    *  it under the terms of the GNU General Public License as
> published by
> >
> >     Should be in previous.
> >
> >
> > Gotcha.
> >
> >      > +static inline void target_cpu_init(CPUX86State *env,
> >      > +        struct target_pt_regs *regs)
> >      > +{
> >      > +    uint64_t *gdt_table;
> >      > +
> >      > +    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
> >      > +    env->hflags |= HF_PE_MASK | HF_CPL_MASK;
> >      > +    if (env->features[FEAT_1_EDX] & CPUID_SSE) {
> >      > +        env->cr[4] |= CR4_OSFXSR_MASK;
> >      > +        env->hflags |= HF_OSFXSR_MASK;
> >      > +    }
> >      > +
> >      > +    /* flags setup : we activate the IRQs by default as in user
> mode */
> >      > +    env->eflags |= IF_MASK;
> >      > +
> >      > +    /* register setup */
> >      > +    env->regs[R_EAX] = regs->eax;
> >      > +    env->regs[R_EBX] = regs->ebx;
> >      > +    env->regs[R_ECX] = regs->ecx;
> >      > +    env->regs[R_EDX] = regs->edx;
> >      > +    env->regs[R_ESI] = regs->esi;
> >      > +    env->regs[R_EDI] = regs->edi;
> >      > +    env->regs[R_EBP] = regs->ebp;
> >      > +    env->regs[R_ESP] = regs->esp;
> >      > +    env->eip = regs->eip;
> >      > +
> >      > +    /* interrupt setup */
> >      > +    env->idt.limit = 255;
> >      > +
> >      > +    env->idt.base = target_mmap(0, sizeof(uint64_t) *
> (env->idt.limit + 1),
> >      > +        PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> >      > +    bsd_i386_set_idt_base(env->idt.base);
> >      > +    bsd_i386_set_idt(0, 0);
> >      > +    bsd_i386_set_idt(1, 0);
> >      > +    bsd_i386_set_idt(2, 0);
> >      > +    bsd_i386_set_idt(3, 3);
> >      > +    bsd_i386_set_idt(4, 3);
> >      > +    bsd_i386_set_idt(5, 0);
> >      > +    bsd_i386_set_idt(6, 0);
> >      > +    bsd_i386_set_idt(7, 0);
> >      > +    bsd_i386_set_idt(8, 0);
> >      > +    bsd_i386_set_idt(9, 0);
> >      > +    bsd_i386_set_idt(10, 0);
> >      > +    bsd_i386_set_idt(11, 0);
> >      > +    bsd_i386_set_idt(12, 0);
> >      > +    bsd_i386_set_idt(13, 0);
> >      > +    bsd_i386_set_idt(14, 0);
> >      > +    bsd_i386_set_idt(15, 0);
> >      > +    bsd_i386_set_idt(16, 0);
> >      > +    bsd_i386_set_idt(17, 0);
> >      > +    bsd_i386_set_idt(18, 0);
> >      > +    bsd_i386_set_idt(19, 0);
> >      > +    bsd_i386_set_idt(0x80, 3);
> >      > +
> >      > +    /* segment setup */
> >      > +    env->gdt.base = target_mmap(0, sizeof(uint64_t) *
> TARGET_GDT_ENTRIES,
> >      > +            PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1,
> 0);
> >      > +    env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
> >      > +    gdt_table = g2h_untagged(env->gdt.base);
> >      > +
> >      > +    bsd_i386_write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
> >      > +            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
> DESC_S_MASK |
> >      > +            (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
> >      > +
> >      > +    bsd_i386_write_dt(&gdt_table[__USER_DS >> 3], 0, 0xfffff,
> >      > +            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK |
> DESC_S_MASK |
> >      > +            (3 << DESC_DPL_SHIFT) | (0x2 << DESC_TYPE_SHIFT));
> >      > +
> >      > +    cpu_x86_load_seg(env, R_CS, __USER_CS);
> >      > +    cpu_x86_load_seg(env, R_SS, __USER_DS);
> >      > +    cpu_x86_load_seg(env, R_DS, __USER_DS);
> >      > +    cpu_x86_load_seg(env, R_ES, __USER_DS);
> >      > +    cpu_x86_load_seg(env, R_FS, __USER_DS);
> >      > +    cpu_x86_load_seg(env, R_GS, __USER_DS);
> >      > +    /* This hack makes Wine work... */
> >      > +    env->segs[R_FS].selector = 0;
> >      > +}
> >      > +
> >      > +static inline void target_cpu_loop(CPUX86State *env)
> >      > +{
> >      > +    CPUState *cs = env_cpu(env);
> >      > +    int trapnr;
> >      > +    abi_ulong pc;
> >      > +    /* target_siginfo_t info; */
> >      > +
> >      > +    for (;;) {
> >      > +     cpu_exec_start(cs);
> >      > +        trapnr = cpu_exec(cs);
> >      > +     cpu_exec_end(cs);
> >      > +     process_queued_cpu_work(cs);
> >      > +
> >      > +        switch (trapnr) {
> >      > +        case 0x80:
> >      > +            /* syscall from int $0x80 */
> >      > +            if (bsd_type == target_freebsd) {
> >      > +                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
> >      > +                    sizeof(int32_t);
> >      > +                int32_t syscall_nr = env->regs[R_EAX];
> >      > +                int32_t arg1, arg2, arg3, arg4, arg5, arg6,
> arg7, arg8;
> >      > +
> >      > +                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> >      > +                    get_user_s32(syscall_nr, params);
> >      > +                    params += sizeof(int32_t);
> >      > +                } else if (syscall_nr ==
> TARGET_FREEBSD_NR___syscall) {
> >      > +                    get_user_s32(syscall_nr, params);
> >      > +                    params += sizeof(int64_t);
> >      > +                }
> >      > +                get_user_s32(arg1, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg2, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg3, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg4, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg5, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg6, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg7, params);
> >      > +                params += sizeof(int32_t);
> >      > +                get_user_s32(arg8, params);
> >      > +                env->regs[R_EAX] = do_freebsd_syscall(env,
> >      > +                                                      syscall_nr,
> >      > +                                                      arg1,
> >      > +                                                      arg2,
> >      > +                                                      arg3,
> >      > +                                                      arg4,
> >      > +                                                      arg5,
> >      > +                                                      arg6,
> >      > +                                                      arg7,
> >      > +                                                      arg8);
> >      > +            } else { /* if (bsd_type == target_openbsd) */
> >      > +                env->regs[R_EAX] = do_openbsd_syscall(env,
> >      > +
> env->regs[R_EAX],
> >      > +
> env->regs[R_EBX],
> >      > +
> env->regs[R_ECX],
> >      > +
> env->regs[R_EDX],
> >      > +
> env->regs[R_ESI],
> >      > +
> env->regs[R_EDI],
> >      > +
> env->regs[R_EBP]);
> >      > +            }
> >      > +            if (((abi_ulong)env->regs[R_EAX]) >=
> (abi_ulong)(-515)) {
> >      > +                env->regs[R_EAX] = -env->regs[R_EAX];
> >      > +                env->eflags |= CC_C;
> >      > +            } else {
> >      > +                env->eflags &= ~CC_C;
> >      > +            }
> >      > +            break;
> >      > +
> >      > +#if 0
> >      > +        case EXCP0B_NOSEG:
> >      > +        case EXCP0C_STACK:
> >      > +            info.si_signo = TARGET_SIGBUS;
> >      > +            info.si_errno = 0;
> >      > +            info.si_code = TARGET_SI_KERNEL;
> >      > +            info._sifields._sigfault._addr = 0;
> >      > +            queue_signal(env, info.si_signo, &info);
> >      > +            break;
> >      > +
> >      > +        case EXCP0D_GPF:
> >      > +            /* XXX: potential problem if ABI32 */
> >      > +            if (env->eflags & VM_MASK) {
> >      > +                handle_vm86_fault(env);
> >      > +            } else {
> >      > +                info.si_signo = TARGET_SIGSEGV;
> >      > +                info.si_errno = 0;
> >      > +                info.si_code = TARGET_SI_KERNEL;
> >      > +                info._sifields._sigfault._addr = 0;
> >      > +                queue_signal(env, info.si_signo, &info);
> >      > +            }
> >      > +            break;
> >      > +
> >      > +        case EXCP0E_PAGE:
> >      > +            info.si_signo = TARGET_SIGSEGV;
> >      > +            info.si_errno = 0;
> >      > +            if (!(env->error_code & 1)) {
> >      > +                info.si_code = TARGET_SEGV_MAPERR;
> >      > +            } else {
> >      > +                info.si_code = TARGET_SEGV_ACCERR;
> >      > +            }
> >      > +            info._sifields._sigfault._addr = env->cr[2];
> >      > +            queue_signal(env, info.si_signo, &info);
> >      > +            break;
> >      > +
> >      > +        case EXCP00_DIVZ:
> >      > +            if (env->eflags & VM_MASK) {
> >      > +                handle_vm86_trap(env, trapnr);
> >      > +            } else {
> >      > +                /* division by zero */
> >      > +                info.si_signo = TARGET_SIGFPE;
> >      > +                info.si_errno = 0;
> >      > +                info.si_code = TARGET_FPE_INTDIV;
> >      > +                info._sifields._sigfault._addr = env->eip;
> >      > +                queue_signal(env, info.si_signo, &info);
> >      > +            }
> >      > +            break;
> >      > +
> >      > +        case EXCP01_DB:
> >      > +        case EXCP03_INT3:
> >      > +            if (env->eflags & VM_MASK) {
> >      > +                handle_vm86_trap(env, trapnr);
> >      > +            } else {
> >      > +                info.si_signo = TARGET_SIGTRAP;
> >      > +                info.si_errno = 0;
> >      > +                if (trapnr == EXCP01_DB) {
> >      > +                    info.si_code = TARGET_TRAP_BRKPT;
> >      > +                    info._sifields._sigfault._addr = env->eip;
> >      > +                } else {
> >      > +                    info.si_code = TARGET_SI_KERNEL;
> >      > +                    info._sifields._sigfault._addr = 0;
> >      > +                }
> >      > +                queue_signal(env, info.si_signo, &info);
> >      > +            }
> >      > +            break;
> >      > +
> >      > +        case EXCP04_INTO:
> >      > +        case EXCP05_BOUND:
> >      > +            if (env->eflags & VM_MASK) {
> >      > +                handle_vm86_trap(env, trapnr);
> >      > +            } else {
> >      > +                info.si_signo = TARGET_SIGSEGV;
> >      > +                info.si_errno = 0;
> >      > +                info.si_code = TARGET_SI_KERNEL;
> >      > +                info._sifields._sigfault._addr = 0;
> >      > +                queue_signal(env, info.si_signo, &info);
> >      > +            }
> >      > +            break;
> >      > +
> >      > +        case EXCP06_ILLOP:
> >      > +            info.si_signo = TARGET_SIGILL;
> >      > +            info.si_errno = 0;
> >      > +            info.si_code = TARGET_ILL_ILLOPN;
> >      > +            info._sifields._sigfault._addr = env->eip;
> >      > +            queue_signal(env, info.si_signo, &info);
> >      > +            break;
> >      > +#endif
> >      > +        case EXCP_INTERRUPT:
> >      > +            /* just indicate that signals should be handled asap
> */
> >      > +            break;
> >      > +#if 0
> >      > +        case EXCP_DEBUG:
> >      > +            {
> >      > +
> >      > +                info.si_signo = TARGET_SIGTRAP;
> >      > +                info.si_errno = 0;
> >      > +                info.si_code = TARGET_TRAP_BRKPT;
> >      > +                queue_signal(env, info.si_signo, &info);
> >      > +            }
> >      > +            break;
> >      > +#endif
> >      > +
> >      > +        case EXCP_ATOMIC:
> >      > +            cpu_exec_step_atomic(cs);
> >      > +            break;
> >      > +
> >      > +        default:
> >      > +            pc = env->segs[R_CS].base + env->eip;
> >      > +            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU
> exception 0x%x - "
> >      > +                    "aborting\n", (long)pc, trapnr);
> >      > +            abort();
> >      > +        }
> >      > +        process_pending_signals(env);
> >      > +    }
> >      > +}
> >
> >     Those are some really big functions to want to inline.  Any reason
> for that?  At first
> >     glance they could live just fine in target_arch_cpu.c.
> >
> >
> > Mostly because that's how Stacey wrote it and we have half a dozen
> implementations
> > already.  I'll see how hard it would be to transition to this structure.
> I worried about
> > this being so different than linux-user, but at the same time I worried
> about regressions
> > that may be introduced in the effort since our testing story isn't what
> I'd like. I'm also
> > a bit worried because we have two branches: the tip that we're trying to
> release from
> > and this effort which needs any changes also merged to that tip branch.
> >
> > Having said that, I'll see what I can do.
>
> I guess I'm happy to have them in the header for now, but just add
> something to the to-do
> list once you're not juggling multiple branches.
>
> I'll not say that linux-user is ideal either, btw.  Just stuff you see
> doing new patch review.
>

I think I'll take you up on that offer. It's a pattern that Stacey Son
used  a lot when writing
this code, and I'd need to do it to many different files. If it were just
this one, I'd definitely
do that in a heart-beat. But since there's a lot, I think I'd get bogged
down with so
many changes. There's a number of things you see when upstreaming the code
too
that suggest themselves as cleanup, and so far I've just been keeping a
list for later
on the larger of those items (eg command line parsing). In general, there
was a preference
for having lots of inline functions, some quite long, so that they could be
swapped out
more easily by including an alternative header (per arch, per bsd flavor,
etc). With LTO
here or on the horizon, I'm thinking having the interface in the .h file
and the code in a .c file
and having LTO eliminate the extra calls that would create may be
acceptable. But
I think the optimal solution needs some time for thought and study as well.

Warner

--000000000000b25e3005c90fbc63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFN1biwgQXVn
IDgsIDIwMjEgYXQgMTI6MTYgQU0gUmljaGFyZCBIZW5kZXJzb24gJmx0OzxhIGhyZWY9Im1haWx0
bzpyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIj5yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiA4LzcvMjEgODowMyBQTSwgV2Fy
bmVyIExvc2ggd3JvdGU6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDsgT24gU2F0LCBB
dWcgNywgMjAyMSBhdCAxMTozNSBQTSBSaWNoYXJkIEhlbmRlcnNvbiAmbHQ7PGEgaHJlZj0ibWFp
bHRvOnJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5yaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnPC9hPiA8YnI+DQomZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOnJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5yaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPC9hPiZndDsmZ3Q7IHdyb3RlOjxicj4NCiZndDsgPGJy
Pg0KJmd0O8KgIMKgIMKgT24gOC83LzIxIDExOjQyIEFNLCBXYXJuZXIgTG9zaCB3cm90ZTo8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBkaWZmIC0tZ2l0IGEvYnNkLXVzZXIvaTM4Ni90YXJnZXRfYXJj
aF9jcHUuYyBiL2JzZC11c2VyL2kzODYvdGFyZ2V0X2FyY2hfY3B1LmM8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyBpbmRleCA3ZjJmNzU1YTExLi43MTk5OGU1YmE1IDEwMDY0NDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7IC0tLSBhL2JzZC11c2VyL2kzODYvdGFyZ2V0X2FyY2hfY3B1LmM8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArKysgYi9ic2QtdXNlci9pMzg2L3RhcmdldF9hcmNoX2NwdS5jPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgQEAgLTEsNiArMSw3IEBAPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoC8qPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCAqwqAgaTM4NiBjcHUgcmVsYXRlZCBj
b2RlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
KyAqIENvcHlyaWdodCAoYykgMjAxMyBTdGFjZXkgU29uICZsdDtzc29uQEZyZWVCU0Qub3JnJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgKjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgKsKgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCAqwqAgaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNo
ZWQgYnk8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoFNob3VsZCBiZSBpbiBwcmV2aW91cy48
YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0OyBHb3RjaGEuPGJyPg0KJmd0OyA8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIGlubGluZSB2b2lkIHRhcmdldF9jcHVfaW5pdChDUFVY
ODZTdGF0ZSAqZW52LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBzdHJ1Y3Qg
dGFyZ2V0X3B0X3JlZ3MgKnJlZ3MpPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK3s8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgdWludDY0X3QgKmdkdF90YWJsZTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGVudi0mZ3Q7Y3JbMF0gPSBD
UjBfUEdfTUFTSyB8IENSMF9XUF9NQVNLIHwgQ1IwX1BFX01BU0s7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIGVudi0mZ3Q7aGZsYWdzIHw9IEhGX1BFX01BU0sgfCBIRl9DUExfTUFTSzs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKGVudi0mZ3Q7ZmVhdHVyZXNbRkVBVF8x
X0VEWF0gJmFtcDsgQ1BVSURfU1NFKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIGVudi0mZ3Q7Y3JbNF0gfD0gQ1I0X09TRlhTUl9NQVNLOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCBlbnYtJmd0O2hmbGFncyB8PSBIRl9PU0ZYU1JfTUFTSzs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgLyogZmxhZ3Mgc2V0dXAgOiB3ZSBhY3RpdmF0ZSB0aGUg
SVJRcyBieSBkZWZhdWx0IGFzIGluIHVzZXIgbW9kZSAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBlbnYtJmd0O2VmbGFncyB8PSBJRl9NQVNLOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgLyogcmVnaXN0ZXIgc2V0dXAgKi88YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtyZWdzW1JfRUFYXSA9IHJlZ3MtJmd0
O2VheDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtyZWdzW1JfRUJYXSA9
IHJlZ3MtJmd0O2VieDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtyZWdz
W1JfRUNYXSA9IHJlZ3MtJmd0O2VjeDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52
LSZndDtyZWdzW1JfRURYXSA9IHJlZ3MtJmd0O2VkeDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgZW52LSZndDtyZWdzW1JfRVNJXSA9IHJlZ3MtJmd0O2VzaTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgZW52LSZndDtyZWdzW1JfRURJXSA9IHJlZ3MtJmd0O2VkaTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtyZWdzW1JfRUJQXSA9IHJlZ3MtJmd0O2Vi
cDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtyZWdzW1JfRVNQXSA9IHJl
Z3MtJmd0O2VzcDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtlaXAgPSBy
ZWdzLSZndDtlaXA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCAvKiBpbnRlcnJ1cHQgc2V0dXAgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgZW52LSZndDtpZHQubGltaXQgPSAyNTU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBlbnYtJmd0O2lkdC5iYXNlID0gdGFyZ2V0X21t
YXAoMCwgc2l6ZW9mKHVpbnQ2NF90KSAqIChlbnYtJmd0O2lkdC5saW1pdCArIDEpLDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX0FO
T05ZTU9VU3xNQVBfUFJJVkFURSwgLTEsIDApOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBic2RfaTM4Nl9zZXRfaWR0X2Jhc2UoZW52LSZndDtpZHQuYmFzZSk7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMCwgMCk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMSwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMiwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMywgMyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIGJzZF9pMzg2X3NldF9pZHQoNCwgMyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IGJzZF9pMzg2X3NldF9pZHQoNSwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJz
ZF9pMzg2X3NldF9pZHQoNiwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9p
Mzg2X3NldF9pZHQoNywgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9pMzg2
X3NldF9pZHQoOCwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9pMzg2X3Nl
dF9pZHQoOSwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9p
ZHQoMTAsIDApOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0
KDExLCAwKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgYnNkX2kzODZfc2V0X2lkdCgx
MiwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTMs
IDApOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0KDE0LCAw
KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgYnNkX2kzODZfc2V0X2lkdCgxNSwgMCk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTYsIDApOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0KDE3LCAwKTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgYnNkX2kzODZfc2V0X2lkdCgxOCwgMCk7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGJzZF9pMzg2X3NldF9pZHQoMTksIDApOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBic2RfaTM4Nl9zZXRfaWR0KDB4ODAsIDMpOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgLyogc2VnbWVu
dCBzZXR1cCAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBlbnYtJmd0O2dkdC5iYXNl
ID0gdGFyZ2V0X21tYXAoMCwgc2l6ZW9mKHVpbnQ2NF90KSAqIFRBUkdFVF9HRFRfRU5UUklFUyw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgUFJPVF9SRUFEfFBST1Rf
V1JJVEUsIE1BUF9BTk9OWU1PVVN8TUFQX1BSSVZBVEUsIC0xLCAwKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgZW52LSZndDtnZHQubGltaXQgPSBzaXplb2YodWludDY0X3QpICogVEFS
R0VUX0dEVF9FTlRSSUVTIC0gMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZ2R0X3Rh
YmxlID0gZzJoX3VudGFnZ2VkKGVudi0mZ3Q7Z2R0LmJhc2UpOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgYnNkX2kzODZfd3JpdGVfZHQoJmFt
cDtnZHRfdGFibGVbX19VU0VSX0NTICZndDsmZ3Q7IDNdLCAwLCAweGZmZmZmLDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBERVNDX0dfTUFTSyB8IERFU0NfQl9NQVNL
IHwgREVTQ19QX01BU0sgfCBERVNDX1NfTUFTSyB8PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgICgzICZsdDsmbHQ7IERFU0NfRFBMX1NISUZUKSB8ICgweGEgJmx0OyZs
dDsgREVTQ19UWVBFX1NISUZUKSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCBic2RfaTM4Nl93cml0ZV9kdCgmYW1wO2dkdF90YWJsZVtfX1VT
RVJfRFMgJmd0OyZndDsgM10sIDAsIDB4ZmZmZmYsPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIERFU0NfR19NQVNLIHwgREVTQ19CX01BU0sgfCBERVNDX1BfTUFTSyB8
IERFU0NfU19NQVNLIHw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
KDMgJmx0OyZsdDsgREVTQ19EUExfU0hJRlQpIHwgKDB4MiAmbHQ7Jmx0OyBERVNDX1RZUEVfU0hJ
RlQpKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIGNwdV94ODZfbG9hZF9zZWcoZW52LCBSX0NTLCBfX1VTRVJfQ1MpOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCBjcHVfeDg2X2xvYWRfc2VnKGVudiwgUl9TUywgX19VU0VSX0RTKTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY3B1X3g4Nl9sb2FkX3NlZyhlbnYsIFJfRFMs
IF9fVVNFUl9EUyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNwdV94ODZfbG9hZF9z
ZWcoZW52LCBSX0VTLCBfX1VTRVJfRFMpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBj
cHVfeDg2X2xvYWRfc2VnKGVudiwgUl9GUywgX19VU0VSX0RTKTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgY3B1X3g4Nl9sb2FkX3NlZyhlbnYsIFJfR1MsIF9fVVNFUl9EUyk7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC8qIFRoaXMgaGFjayBtYWtlcyBXaW5lIHdvcmsuLi4g
Ki88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZW52LSZndDtzZWdzW1JfRlNdLnNlbGVj
dG9yID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIGlubGluZSB2b2lkIHRhcmdldF9jcHVf
bG9vcChDUFVYODZTdGF0ZSAqZW52KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIENQVVN0YXRlICpjcyA9IGVudl9jcHUoZW52KTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaW50IHRyYXBucjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgYWJpX3Vsb25nIHBjOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCAvKiB0
YXJnZXRfc2lnaW5mb190IGluZm87ICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBmb3IgKDs7KSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgY3B1X2V4ZWNfc3RhcnQoY3MpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCB0cmFwbnIgPSBjcHVfZXhlYyhjcyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgY3B1X2V4ZWNfZW5kKGNzKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqBw
cm9jZXNzX3F1ZXVlZF9jcHVfd29yayhjcyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBzd2l0Y2ggKHRyYXBucikgezxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBjYXNlIDB4ODA6PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIC8qIHN5c2NhbGwgZnJvbSBpbnQgJDB4ODAgKi88YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGJzZF90eXBlID09IHRh
cmdldF9mcmVlYnNkKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGFiaV91bG9uZyBwYXJhbXMgPSAoYWJpX3Vsb25nKSBlbnYtJmd0O3JlZ3NbUl9FU1Bd
ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
c2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpbnQzMl90IHN5c2NhbGxfbnIgPSBlbnYtJmd0O3JlZ3NbUl9FQVhdOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnQzMl90IGFyZzEsIGFy
ZzIsIGFyZzMsIGFyZzQsIGFyZzUsIGFyZzYsIGFyZzcsIGFyZzg7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
ZiAoc3lzY2FsbF9uciA9PSBUQVJHRVRfRlJFRUJTRF9OUl9zeXNjYWxsKSB7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihz
eXNjYWxsX25yLCBwYXJhbXMpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2UgaWYgKHN5c2NhbGxfbnIg
PT0gVEFSR0VUX0ZSRUVCU0RfTlJfX19zeXNjYWxsKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihzeXNjYWxsX25yLCBw
YXJhbXMpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDY0X3QpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmcxLCBwYXJhbXMpOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMy
X3QpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRf
dXNlcl9zMzIoYXJnMiwgcGFyYW1zKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzMsIHBhcmFt
cyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFt
cyArPSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc0LCBwYXJhbXMpOzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3Qp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNl
cl9zMzIoYXJnNSwgcGFyYW1zKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcGFyYW1zICs9IHNpemVvZihpbnQzMl90KTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2V0X3VzZXJfczMyKGFyZzYsIHBhcmFtcyk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhcmFtcyAr
PSBzaXplb2YoaW50MzJfdCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGdldF91c2VyX3MzMihhcmc3LCBwYXJhbXMpOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwYXJhbXMgKz0gc2l6ZW9mKGludDMyX3QpOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZXRfdXNlcl9z
MzIoYXJnOCwgcGFyYW1zKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRUFYXSA9IGRvX2ZyZWVic2Rfc3lzY2FsbChlbnYsPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN5c2NhbGxfbnIs
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzEsPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzIsPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzMsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzQsPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzUsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzYsPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzcsPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGFyZzgpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2UgeyAvKiBpZiAoYnNkX3R5cGUgPT0gdGFyZ2V0X29w
ZW5ic2QpICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGVudi0mZ3Q7cmVnc1tSX0VBWF0gPSBkb19vcGVuYnNkX3N5c2NhbGwoZW52LDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FQVhd
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0
O3JlZ3NbUl9FQlhdLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBlbnYtJmd0O3JlZ3NbUl9FQ1hdLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FRFhdLDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FU0ldLDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9F
REldLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYt
Jmd0O3JlZ3NbUl9FQlBdKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKChhYmlf
dWxvbmcpZW52LSZndDtyZWdzW1JfRUFYXSkgJmd0Oz0gKGFiaV91bG9uZykoLTUxNSkpIHs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdz
W1JfRUFYXSA9IC1lbnYtJmd0O3JlZ3NbUl9FQVhdOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O2VmbGFncyB8PSBDQ19DOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O2VmbGFncyAmYW1wOz0gfkND
X0M7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjaWYgMDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCBjYXNlIEVYQ1AwQl9OT1NFRzo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgwqAgwqAgY2FzZSBFWENQMENfU1RBQ0s6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfc2lnbm8gPSBUQVJHRVRfU0lHQlVTOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2Vycm5vID0gMDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9jb2RlID0gVEFS
R0VUX1NJX0tFUk5FTDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
aW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwgaW5mby5zaV9zaWdubywgJmFt
cDtpbmZvKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCBjYXNlIEVYQ1AwRF9HUEY6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIC8qIFhYWDogcG90ZW50aWFsIHByb2JsZW0gaWYgQUJJMzIgKi88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGVudi0mZ3Q7ZWZsYWdzICZhbXA7IFZN
X01BU0spIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aGFuZGxlX3ZtODZfZmF1bHQoZW52KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5zaV9zaWdubyA9IFRBUkdFVF9TSUdTRUdWOzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2Vycm5vID0gMDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9jb2RlID0g
VEFSR0VUX1NJX0tFUk5FTDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gMDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwgaW5m
by5zaV9zaWdubywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBicmVh
azs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIGNhc2UgRVhDUDBFX1BBR0U6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIGluZm8uc2lfc2lnbm8gPSBUQVJHRVRfU0lHU0VHVjs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9lcnJubyA9IDA7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGlmICghKGVudi0mZ3Q7ZXJyb3JfY29kZSAm
YW1wOyAxKSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBpbmZvLnNpX2NvZGUgPSBUQVJHRVRfU0VHVl9NQVBFUlI7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfY29kZSA9IFRBUkdFVF9TRUdWX0FDQ0VSUjs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLl9zaWZpZWxkcy5fc2lnZmF1bHQuX2Fk
ZHIgPSBlbnYtJmd0O2NyWzJdOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCBxdWV1ZV9zaWduYWwoZW52LCBpbmZvLnNpX3NpZ25vLCAmYW1wO2luZm8pOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUDAw
X0RJVlo6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGlmIChlbnYt
Jmd0O2VmbGFncyAmYW1wOyBWTV9NQVNLKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGhhbmRsZV92bTg2X3RyYXAoZW52LCB0cmFwbnIpOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBkaXZpc2lvbiBieSB6ZXJvICov
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lf
c2lnbm8gPSBUQVJHRVRfU0lHRlBFOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBpbmZvLnNpX2Vycm5vID0gMDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9jb2RlID0gVEFSR0VUX0ZQRV9JTlRESVY7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uX3Np
ZmllbGRzLl9zaWdmYXVsdC5fYWRkciA9IGVudi0mZ3Q7ZWlwOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxdWV1ZV9zaWduYWwoZW52LCBpbmZvLnNpX3Np
Z25vLCAmYW1wO2luZm8pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGJyZWFrOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
Y2FzZSBFWENQMDFfREI6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGNhc2Ug
RVhDUDAzX0lOVDM6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGlm
IChlbnYtJmd0O2VmbGFncyAmYW1wOyBWTV9NQVNLKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGhhbmRsZV92bTg2X3RyYXAoZW52LCB0cmFwbnIpOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX3NpZ25vID0g
VEFSR0VUX1NJR1RSQVA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGluZm8uc2lfZXJybm8gPSAwOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpZiAodHJhcG5yID09IEVYQ1AwMV9EQikgezxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2NvZGUgPSBU
QVJHRVRfVFJBUF9CUktQVDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gZW52LSZndDtl
aXA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxz
ZSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGluZm8uc2lfY29kZSA9IFRBUkdFVF9TSV9LRVJORUw7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uX3NpZmllbGRzLl9zaWdmYXVsdC5f
YWRkciA9IDA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVf
c2lnbmFsKGVudiwgaW5mby5zaV9zaWdubywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCBicmVhazs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUDA0X0lOVE86PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUDA1X0JPVU5EOjxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpZiAoZW52LSZndDtlZmxhZ3MgJmFtcDsgVk1fTUFTSykg
ezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoYW5kbGVf
dm04Nl90cmFwKGVudiwgdHJhcG5yKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgfSBlbHNlIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5zaV9zaWdubyA9IFRBUkdFVF9TSUdTRUdWOzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLnNpX2Vycm5vID0gMDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9jb2RlID0g
VEFSR0VUX1NJX0tFUk5FTDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaW5mby5fc2lmaWVsZHMuX3NpZ2ZhdWx0Ll9hZGRyID0gMDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwgaW5m
by5zaV9zaWdubywgJmFtcDtpbmZvKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBicmVh
azs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIGNhc2UgRVhDUDA2X0lMTE9QOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCBpbmZvLnNpX3NpZ25vID0gVEFSR0VUX1NJR0lMTDs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgaW5mby5zaV9lcnJubyA9IDA7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfY29kZSA9IFRBUkdFVF9JTExf
SUxMT1BOOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBpbmZvLl9z
aWZpZWxkcy5fc2lnZmF1bHQuX2FkZHIgPSBlbnYtJmd0O2VpcDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgcXVldWVfc2lnbmFsKGVudiwgaW5mby5zaV9zaWdubywg
JmFtcDtpbmZvKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYnJl
YWs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKyNlbmRpZjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCBjYXNlIEVYQ1BfSU5URVJSVVBUOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCAvKiBqdXN0IGluZGljYXRlIHRoYXQgc2lnbmFscyBzaG91bGQg
YmUgaGFuZGxlZCBhc2FwICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIGJyZWFrOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjaWYgMDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCBjYXNlIEVYQ1BfREVCVUc6PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfc2lnbm8gPSBU
QVJHRVRfU0lHVFJBUDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaW5mby5zaV9lcnJubyA9IDA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGluZm8uc2lfY29kZSA9IFRBUkdFVF9UUkFQX0JSS1BUOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxdWV1ZV9zaWduYWwoZW52
LCBpbmZvLnNpX3NpZ25vLCAmYW1wO2luZm8pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IGJyZWFrOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjZW5kaWY8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGNhc2UgRVhDUF9BVE9N
SUM6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGNwdV9leGVjX3N0
ZXBfYXRvbWljKGNzKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
YnJlYWs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCBkZWZhdWx0Ojxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCBwYyA9IGVudi0mZ3Q7c2Vnc1tSX0NTXS5iYXNlICsgZW52LSZndDtlaXA7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGZwcmludGYoc3RkZXJyLCAmcXVvdDtx
ZW11OiAweCUwOGx4OiB1bmhhbmRsZWQgQ1BVIGV4Y2VwdGlvbiAweCV4IC0gJnF1b3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O2Fi
b3J0aW5nXG4mcXVvdDssIChsb25nKXBjLCB0cmFwbnIpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCBhYm9ydCgpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHByb2Nlc3NfcGVu
ZGluZ19zaWduYWxzKGVudik7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgVGhvc2UgYXJl
IHNvbWUgcmVhbGx5IGJpZyBmdW5jdGlvbnMgdG8gd2FudCB0byBpbmxpbmUuwqAgQW55IHJlYXNv
biBmb3IgdGhhdD/CoCBBdCBmaXJzdDxicj4NCiZndDvCoCDCoCDCoGdsYW5jZSB0aGV5IGNvdWxk
IGxpdmUganVzdCBmaW5lIGluIHRhcmdldF9hcmNoX2NwdS5jLjxicj4NCiZndDsgPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IE1vc3RseSBiZWNhdXNlIHRoYXQmIzM5O3MgaG93IFN0YWNleSB3cm90ZSBp
dCBhbmQgd2UgaGF2ZSBoYWxmIGEgZG96ZW4gaW1wbGVtZW50YXRpb25zPGJyPg0KJmd0OyBhbHJl
YWR5LsKgIEkmIzM5O2xsIHNlZSBob3cgaGFyZCBpdCB3b3VsZCBiZSB0byB0cmFuc2l0aW9uIHRv
IHRoaXMgc3RydWN0dXJlLiBJIHdvcnJpZWQgYWJvdXQ8YnI+DQomZ3Q7IHRoaXMgYmVpbmcgc28g
ZGlmZmVyZW50IHRoYW4gbGludXgtdXNlciwgYnV0IGF0IHRoZSBzYW1lIHRpbWUgSSB3b3JyaWVk
IGFib3V0IHJlZ3Jlc3Npb25zPGJyPg0KJmd0OyB0aGF0IG1heSBiZSBpbnRyb2R1Y2VkIGluIHRo
ZSBlZmZvcnQgc2luY2Ugb3VyIHRlc3Rpbmcgc3RvcnkgaXNuJiMzOTt0IHdoYXQgSSYjMzk7ZCBs
aWtlLiBJJiMzOTttIGFsc288YnI+DQomZ3Q7IGEgYml0IHdvcnJpZWQgYmVjYXVzZSB3ZSBoYXZl
IHR3byBicmFuY2hlczogdGhlIHRpcCB0aGF0IHdlJiMzOTtyZSB0cnlpbmcgdG8gcmVsZWFzZSBm
cm9tPGJyPg0KJmd0OyBhbmQgdGhpcyBlZmZvcnQgd2hpY2ggbmVlZHMgYW55IGNoYW5nZXMgYWxz
byBtZXJnZWQgdG8gdGhhdCB0aXAgYnJhbmNoLjxicj4NCiZndDsgPGJyPg0KJmd0OyBIYXZpbmcg
c2FpZCB0aGF0LCBJJiMzOTtsbCBzZWUgd2hhdCBJIGNhbiBkby48YnI+DQo8YnI+DQpJIGd1ZXNz
IEkmIzM5O20gaGFwcHkgdG8gaGF2ZSB0aGVtIGluIHRoZSBoZWFkZXIgZm9yIG5vdywgYnV0IGp1
c3QgYWRkIHNvbWV0aGluZyB0byB0aGUgdG8tZG8gPGJyPg0KbGlzdCBvbmNlIHlvdSYjMzk7cmUg
bm90IGp1Z2dsaW5nIG11bHRpcGxlIGJyYW5jaGVzLjxicj4NCjxicj4NCkkmIzM5O2xsIG5vdCBz
YXkgdGhhdCBsaW51eC11c2VyIGlzIGlkZWFsIGVpdGhlciwgYnR3LsKgIEp1c3Qgc3R1ZmYgeW91
IHNlZSBkb2luZyBuZXcgcGF0Y2ggcmV2aWV3Ljxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj5JIHRoaW5rIEkmIzM5O2xsIHRha2UgeW91IHVwIG9uIHRoYXQgb2ZmZXIuIEl0JiMz
OTtzIGEgcGF0dGVybiB0aGF0IFN0YWNleSBTb24gdXNlZMKgIGEgbG90IHdoZW4gd3JpdGluZzwv
ZGl2PjxkaXY+dGhpcyBjb2RlLCBhbmQgSSYjMzk7ZCBuZWVkIHRvIGRvIGl0IHRvIG1hbnkgZGlm
ZmVyZW50IGZpbGVzLiBJZiBpdCB3ZXJlIGp1c3QgdGhpcyBvbmUsIEkmIzM5O2QgZGVmaW5pdGVs
eTwvZGl2PjxkaXY+ZG8gdGhhdCBpbiBhwqBoZWFydC1iZWF0LiBCdXQgc2luY2UgdGhlcmUmIzM5
O3MgYSBsb3QsIEkgdGhpbmsgSSYjMzk7ZCBnZXQgYm9nZ2VkIGRvd24gd2l0aCBzbzwvZGl2Pjxk
aXY+bWFueSBjaGFuZ2VzLiBUaGVyZSYjMzk7cyBhIG51bWJlciBvZiB0aGluZ3MgeW91IHNlZSB3
aGVuIHVwc3RyZWFtaW5nIHRoZSBjb2RlIHRvbzwvZGl2PjxkaXY+dGhhdCBzdWdnZXN0IHRoZW1z
ZWx2ZXMgYXMgY2xlYW51cCwgYW5kIHNvIGZhciBJJiMzOTt2ZSBqdXN0IGJlZW4ga2VlcGluZyBh
IGxpc3QgZm9yIGxhdGVyPC9kaXY+PGRpdj5vbiB0aGUgbGFyZ2VyIG9mIHRob3NlIGl0ZW1zIChl
ZyBjb21tYW5kIGxpbmUgcGFyc2luZykuIEluIGdlbmVyYWwsIHRoZXJlIHdhcyBhIHByZWZlcmVu
Y2U8L2Rpdj48ZGl2PmZvciBoYXZpbmcgbG90cyBvZiBpbmxpbmUgZnVuY3Rpb25zLCBzb21lIHF1
aXRlIGxvbmcsIHNvIHRoYXQgdGhleSBjb3VsZCBiZSBzd2FwcGVkIG91dDwvZGl2PjxkaXY+bW9y
ZSBlYXNpbHkgYnkgaW5jbHVkaW5nIGFuIGFsdGVybmF0aXZlIGhlYWRlciAocGVyIGFyY2gsIHBl
ciBic2QgZmxhdm9yLCBldGMpLiBXaXRoIExUTzwvZGl2PjxkaXY+aGVyZSBvciBvbiB0aGUgaG9y
aXpvbiwgSSYjMzk7bSB0aGlua2luZyBoYXZpbmcgdGhlIGludGVyZmFjZSBpbiB0aGUgLmggZmls
ZSBhbmQgdGhlIGNvZGUgaW4gYSAuYyBmaWxlPC9kaXY+PGRpdj5hbmQgaGF2aW5nIExUTyBlbGlt
aW5hdGUgdGhlIGV4dHJhIGNhbGxzIHRoYXQgd291bGQgY3JlYXRlIG1heSBiZSBhY2NlcHRhYmxl
LiBCdXQ8L2Rpdj48ZGl2PkkgdGhpbmsgdGhlIG9wdGltYWwgc29sdXRpb24gbmVlZHMgc29tZSB0
aW1lIGZvciB0aG91Z2h0IGFuZCBzdHVkeSBhcyB3ZWxsLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+V2FybmVyPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--000000000000b25e3005c90fbc63--

