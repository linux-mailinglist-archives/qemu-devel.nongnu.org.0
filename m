Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF543CEC8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:34:04 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflsI-0006Bj-6l
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfl2x-0006Lx-93; Wed, 27 Oct 2021 11:41:00 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:48148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfl2u-0008K7-Sc; Wed, 27 Oct 2021 11:40:58 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id B418D79C0F;
 Wed, 27 Oct 2021 15:40:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HfXvz4PNsz3LtZ;
 Wed, 27 Oct 2021 15:40:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 71A762CEDF;
 Wed, 27 Oct 2021 15:40:47 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f51.google.com with SMTP id h11so1986674qvk.4;
 Wed, 27 Oct 2021 08:40:47 -0700 (PDT)
X-Gm-Message-State: AOAM530fPxlpeyx8t4MLLjjcfiV4s4FgU9uDx71TO6FcQElAuH1Ljhb5
 zPNPyf9B3nij4OZ+02D0553INPQkjhjCTZxanr4=
X-Google-Smtp-Source: ABdhPJyeAfPWFoSF2yMBe6fIFN1C/w56b4L9rRQpWBFPVocdHHItSl92HKRzXuzZcL1XIX1nLCCPfos45SeMJgoYSyg=
X-Received: by 2002:ad4:58ed:: with SMTP id di13mr6047294qvb.51.1635349246781; 
 Wed, 27 Oct 2021 08:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
 <CACNAnaHUq==anp0uQhxk3o=MuLeyaii+MsMPZc3_pBnuS-wCag@mail.gmail.com>
 <CACNAnaH-=mFx-tPd4nVVv+Y=oRe6Vj4Um51rr0u1GBFGk0P=tQ@mail.gmail.com>
 <CANCZdfo8ZXYozgzWSqzkhxrH=BYD6RjG3_MbcZNHidVwmTMZWw@mail.gmail.com>
In-Reply-To: <CANCZdfo8ZXYozgzWSqzkhxrH=BYD6RjG3_MbcZNHidVwmTMZWw@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Wed, 27 Oct 2021 10:40:35 -0500
X-Gmail-Original-Message-ID: <CACNAnaHuMt8o+myXPypyNYVYBuhwhQXfgenwnx+36uEyTZisoA@mail.gmail.com>
Message-ID: <CACNAnaHuMt8o+myXPypyNYVYBuhwhQXfgenwnx+36uEyTZisoA@mail.gmail.com>
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stacey Son <sson@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 10:35 AM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Tue, Oct 26, 2021 at 12:11 AM Kyle Evans <kevans@freebsd.org> wrote:
>>
>> On Tue, Oct 26, 2021 at 1:01 AM Kyle Evans <kevans@freebsd.org> wrote:
>> >
>> > On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>> > >
>> > > Implement target_thread_init (to create a thread) and target_set_upcall
>> > > (to switch to a thread) for arm.
>> > >
>> > > Signed-off-by: Stacey Son <sson@FreeBSD.org>
>> > > Signed-off-by: Klye Evans <kevans@FreeBSD.org>
>> > > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> > > ---
>> > >  bsd-user/arm/target_arch_thread.h | 71 +++++++++++++++++++++++++++++++
>> > >  1 file changed, 71 insertions(+)
>> > >  create mode 100644 bsd-user/arm/target_arch_thread.h
>> > >
>> > > diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
>> > > new file mode 100644
>> > > index 0000000000..317364bb84
>> > > --- /dev/null
>> > > +++ b/bsd-user/arm/target_arch_thread.h
>> > > @@ -0,0 +1,71 @@
>> > > +/*
>> > > + *  arm thread support
>> > > + *
>> > > + *  Copyright (c) 2013 Stacey D. Son
>> > > + *
>> > > + *  This program is free software; you can redistribute it and/or modify
>> > > + *  it under the terms of the GNU General Public License as published by
>> > > + *  the Free Software Foundation; either version 2 of the License, or
>> > > + *  (at your option) any later version.
>> > > + *
>> > > + *  This program is distributed in the hope that it will be useful,
>> > > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > > + *  GNU General Public License for more details.
>> > > + *
>> > > + *  You should have received a copy of the GNU General Public License
>> > > + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>> > > + */
>> > > +#ifndef _TARGET_ARCH_THREAD_H_
>> > > +#define _TARGET_ARCH_THREAD_H_
>> > > +
>> > > +/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
>> > > +static inline void target_thread_set_upcall(CPUARMState *regs, abi_ulong entry,
>> > > +    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
>> > > +{
>> > > +    abi_ulong sp;
>> > > +
>> > > +    /*
>> > > +     * Make sure the stack is properly aligned.
>> > > +     * arm/include/param.h (STACKLIGN() macro)
>> > > +     */
>> > > +    sp = (u_int)((stack_base + stack_size) -
>> > > +        sizeof(struct target_trapframe)) & ~0x7;
>> > > +
>> > > +    /* sp = stack base */
>> > > +    regs->regs[13] = sp;
>> > > +    /* pc = start function entry */
>> > > +    regs->regs[15] = entry & 0xfffffffe;
>> > > +    /* r0 = arg */
>> > > +    regs->regs[0] = arg;
>> > > +    regs->spsr = ARM_CPU_MODE_USR;
>> > > +    if (entry & 0x1) {
>> > > +        regs->spsr |= CPSR_T;
>> > > +    }
>> > > +}
>> > > +
>> > > +static inline void target_thread_init(struct target_pt_regs *regs,
>> > > +        struct image_info *infop)
>> > > +{
>> > > +    abi_long stack = infop->start_stack;
>> > > +    memset(regs, 0, sizeof(*regs));
>> > > +    regs->ARM_cpsr = 0x10;
>> > > +    if (infop->entry & 1) {
>> > > +        regs->ARM_cpsr |= CPSR_T;
>> > > +    }
>> > > +    regs->ARM_pc = infop->entry & 0xfffffffe;
>> > > +    regs->ARM_sp = infop->start_stack;
>> > > +    if (bsd_type == target_freebsd) {
>> > > +        regs->ARM_lr = infop->entry & 0xfffffffe;
>> > > +    }
>> > > +    /* FIXME - what to for failure of get_user()? */
>> > > +    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
>> > > +    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
>> > > +    /* XXX: it seems that r0 is zeroed after ! */
>> > > +    regs->ARM_r0 = 0;
>> > > +    /* For uClinux PIC binaries.  */
>> > > +    /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
>> > > +    regs->ARM_r10 = infop->start_data;
>> > > +}
>> > > +
>> > > +#endif /* !_TARGET_ARCH_THREAD_H_ */
>> > > --
>> > > 2.32.0
>> > >
>> >
>> > I think it's obvious enough to folks already familiar with ARM, but I
>> > wonder if we shouldn't add in some basic commentary about the thumb
>> > bits above. Something like:
>> >
>> > /*
>> >  * The low bit in an entry point indicates a thumb instruction; the entry point
>> >  * can't actually exist at this address because it must be 16- or 32-
>> > bit aligned.
>> >  * The low bit gets masked off and the T bit in CSPR is twiddled to
>> > indicate thumb.
>> >  */
>>
>> s/CSPR/CPSR/
>
>
> Does
>
>     /*
>      * Thumb mode is encoded by the low bit in the entry point (since ARM can't
>      * execute at odd addresses). When it's set, set the Thumb bit (T) in the
>      * CPSR.
>      */
>
>  Look good to you?
>

Yeah, that works for me!

Thanks,

Kyle Evans

