Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01372BAF8F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:05:52 +0100 (CET)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8v1-00009R-TH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kg8o9-0003YJ-VT
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:58:47 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:45143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kg8o7-0007YT-94
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:58:45 -0500
Received: by mail-io1-f65.google.com with SMTP id u21so10377161iol.12
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3gPC2rCgl5wgfOfMdLGaHYVkVPAIJSsGZQJMMnEn4Y=;
 b=pnK3gKS55wKomRCzuSI7CsVBCrDy9Tq21GJ8A7vGiEmJ4rGfSxK61bRSAk3w2Ff0GC
 Tw2QuKj25Ul+Qz6s9Q1j9C7S9xY+WTrXS6LzvGSaRBpnDCekykF+H5af5lRkP6iwKrib
 ksbV+gKckER8ME3ZdQvch5hvGGD4ofJwEh05mqBJxgWEVVOgO0VNabz4DIl0N+8hjrsm
 NjPxyouo4YnlrI5ICS4LK6scZ2Oq45RARX8XjOVcDtpT+yrVSNPzvOb1M1P49ClN56Ur
 1y+mo0A+TmusNKpLonpUJbzOT7DGdWqJphF+ijlH4joKv3rWIBqfsv5LAu24C9Vifabr
 sUrA==
X-Gm-Message-State: AOAM532UuLAH1ELzVvYQLvzz/GjBja7elnyWuzPgPVoHbwRiZ7urTd6B
 IPl9eKYyyA4Lq1hyDMg3Lu2AuFhT6FQ=
X-Google-Smtp-Source: ABdhPJw/LiwCDMirPOai67ecOKY56NB1YiK2EhMmOYxRJ5vZVdH9CqKZsRgSphRfkmfg/NjLOGuw0w==
X-Received: by 2002:a02:9708:: with SMTP id x8mr9595448jai.43.1605887921750;
 Fri, 20 Nov 2020 07:58:41 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id b191sm1759025iof.29.2020.11.20.07.58.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:58:41 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id a19so3172432ilm.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:58:41 -0800 (PST)
X-Received: by 2002:a92:d03:: with SMTP id 3mr10970531iln.197.1605887921108;
 Fri, 20 Nov 2020 07:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-7-j@getutm.app>
 <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
In-Reply-To: <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 20 Nov 2020 09:58:30 -0600
X-Gmail-Original-Message-ID: <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
Message-ID: <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] tcg: implement JIT for iOS and Apple Silicon
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.65; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f65.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 3:08 AM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 09.11.20 00:24, Joelle van Dyne wrote:
> > When entitlements are available (macOS or jailbroken iOS), a hardware
> > feature called APRR exists on newer Apple Silicon that can cheaply mark JIT
> > pages as either RX or RW. Reverse engineered functions from
> > libsystem_pthread.dylib are implemented to handle this.
> >
> > The following rules apply for JIT write protect:
> >    * JIT write-protect is enabled before tcg_qemu_tb_exec()
> >    * JIT write-protect is disabled after tcg_qemu_tb_exec() returns
> >    * JIT write-protect is disabled inside do_tb_phys_invalidate() but if it
> >      is called inside of tcg_qemu_tb_exec() then write-protect will be
> >      enabled again before returning.
> >    * JIT write-protect is disabled by cpu_loop_exit() for interrupt handling.
> >    * JIT write-protect is disabled everywhere else.
> >
> > See https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >   include/exec/exec-all.h     |  2 +
> >   include/tcg/tcg-apple-jit.h | 86 +++++++++++++++++++++++++++++++++++++
> >   include/tcg/tcg.h           |  3 ++
> >   accel/tcg/cpu-exec-common.c |  2 +
> >   accel/tcg/cpu-exec.c        |  2 +
> >   accel/tcg/translate-all.c   | 46 ++++++++++++++++++++
> >   tcg/tcg.c                   |  4 ++
> >   7 files changed, 145 insertions(+)
> >   create mode 100644 include/tcg/tcg-apple-jit.h
> >
> > diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> > index aa65103702..3829f3d470 100644
> > --- a/include/exec/exec-all.h
> > +++ b/include/exec/exec-all.h
> > @@ -549,6 +549,8 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
> >                                      target_ulong cs_base, uint32_t flags,
> >                                      uint32_t cf_mask);
> >   void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
> > +void tb_exec_lock(void);
> > +void tb_exec_unlock(void);
> >
> >   /* GETPC is the true target of the return instruction that we'll execute.  */
> >   #if defined(CONFIG_TCG_INTERPRETER)
> > diff --git a/include/tcg/tcg-apple-jit.h b/include/tcg/tcg-apple-jit.h
> > new file mode 100644
> > index 0000000000..9efdb2000d
> > --- /dev/null
> > +++ b/include/tcg/tcg-apple-jit.h
> > @@ -0,0 +1,86 @@
> > +/*
> > + * Apple Silicon functions for JIT handling
> > + *
> > + * Copyright (c) 2020 osy
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef TCG_APPLE_JIT_H
> > +#define TCG_APPLE_JIT_H
> > +
> > +/*
> > + * APRR handling
> > + * Credits to: https://siguza.github.io/APRR/
> > + * Reversed from /usr/lib/system/libsystem_pthread.dylib
> > + */
> > +
> > +#if defined(__aarch64__) && defined(CONFIG_DARWIN)
> > +
> > +#define _COMM_PAGE_START_ADDRESS        (0x0000000FFFFFC000ULL) /* In TTBR0 */
> > +#define _COMM_PAGE_APRR_SUPPORT         (_COMM_PAGE_START_ADDRESS + 0x10C)
> > +#define _COMM_PAGE_APPR_WRITE_ENABLE    (_COMM_PAGE_START_ADDRESS + 0x110)
> > +#define _COMM_PAGE_APRR_WRITE_DISABLE   (_COMM_PAGE_START_ADDRESS + 0x118)
> > +
> > +static __attribute__((__always_inline__)) bool jit_write_protect_supported(void)
> > +{
> > +    /* Access shared kernel page at fixed memory location. */
> > +    uint8_t aprr_support = *(volatile uint8_t *)_COMM_PAGE_APRR_SUPPORT;
> > +    return aprr_support > 0;
> > +}
> > +
> > +/* write protect enable = write disable */
> > +static __attribute__((__always_inline__)) void jit_write_protect(int enabled)
> > +{
> > +    /* Access shared kernel page at fixed memory location. */
> > +    uint8_t aprr_support = *(volatile uint8_t *)_COMM_PAGE_APRR_SUPPORT;
> > +    if (aprr_support == 0 || aprr_support > 3) {
> > +        return;
> > +    } else if (aprr_support == 1) {
> > +        __asm__ __volatile__ (
> > +            "mov x0, %0\n"
> > +            "ldr x0, [x0]\n"
> > +            "msr S3_4_c15_c2_7, x0\n"
> > +            "isb sy\n"
> > +            :: "r" (enabled ? _COMM_PAGE_APRR_WRITE_DISABLE
> > +                            : _COMM_PAGE_APPR_WRITE_ENABLE)
> > +            : "memory", "x0"
> > +        );
> > +    } else {
> > +        __asm__ __volatile__ (
> > +            "mov x0, %0\n"
> > +            "ldr x0, [x0]\n"
> > +            "msr S3_6_c15_c1_5, x0\n"
> > +            "isb sy\n"
> > +            :: "r" (enabled ? _COMM_PAGE_APRR_WRITE_DISABLE
> > +                            : _COMM_PAGE_APPR_WRITE_ENABLE)
> > +            : "memory", "x0"
> > +        );
> > +    }
> > +}
>
>
> Is there a particular reason you're not just calling
> pthread_jit_write_protect_np()? That would remove the dependency on
> anything reverse engineered.
Those APIs are not available on iOS 13 or below, which has the same
APRR requirements. If for legal reasons we cannot include this code,
then it is fine to remove this file and replace the calls with the
APIs, but we would lose support on lower iOS versions.

>
>
> > +
> > +#else /* defined(__aarch64__) && defined(CONFIG_DARWIN) */
> > +
> > +static __attribute__((__always_inline__)) bool jit_write_protect_supported(void)
> > +{
> > +    return false;
> > +}
> > +
> > +static __attribute__((__always_inline__)) void jit_write_protect(int enabled)
> > +{
> > +}
> > +
> > +#endif
> > +
> > +#endif /* define TCG_APPLE_JIT_H */
> > diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> > index 477919aeb6..b16b687d0b 100644
> > --- a/include/tcg/tcg.h
> > +++ b/include/tcg/tcg.h
> > @@ -625,6 +625,9 @@ struct TCGContext {
> >       size_t code_gen_buffer_size;
> >       void *code_gen_ptr;
> >       void *data_gen_ptr;
> > +#if defined(CONFIG_DARWIN) && !defined(CONFIG_TCG_INTERPRETER)
> > +    bool code_gen_locked; /* on Darwin each thread tracks W^X flags */
>
>
> I don't quite understand why you need to keep track of whether you're in
> locked state or not. If you just always keep in locked state and unlock
> around the few parts that modify the code gen region, you should be
> fine, no?
I thought so at first, but do_tb_phys_invalidate() can be called in
either state and even when looking at all the callers it's not
possible to easily derive the lock state without storing this
somewhere. If someone knows of a way, then this flag can be removed.

>
>
> > +#endif
> >
> >       /* Threshold to flush the translated code buffer.  */
> >       void *code_gen_highwater;
> > diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> > index 12c1e3e974..f1eb767b02 100644
> > --- a/accel/tcg/cpu-exec-common.c
> > +++ b/accel/tcg/cpu-exec-common.c
> > @@ -64,6 +64,8 @@ void cpu_reloading_memory_map(void)
> >
> >   void cpu_loop_exit(CPUState *cpu)
> >   {
> > +    /* Unlock JIT write protect if applicable. */
> > +    tb_exec_unlock();
>
>
> Why do you need to unlock here? I think in general this patch is trying
> to keep the state RW always and only flip to RX when actually executing
> code, right?
Yes, this point is when the code exits due to an interrupt or some
other async means. Otherwise, the unlock would be matched after
tcg_qemu_tb_exec.

-j

>
> I think it would be much easier and cleaner to do it reverse: Keep it in
> RX always and flip to RW when you need to modify.
>
> Also, shouldn't the code gen buffer be allocated with MAP_JIT according
> to the porting guide?
>
> Alex
>

