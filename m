Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A7151B6F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 06:20:25 +0200 (CEST)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmSyV-0002md-1D
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 00:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nmSux-0001pq-H2; Thu, 05 May 2022 00:16:43 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nmSuu-0005Hz-N8; Thu, 05 May 2022 00:16:43 -0400
Received: by mail-qk1-x730.google.com with SMTP id a76so2404794qkg.12;
 Wed, 04 May 2022 21:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWJqPl4ocrihuPMnyA4JhpfCv9I53IhNXNsFNkA/2w8=;
 b=fLlGJSQWzlHtB0EmtY2wL9Druh0q2Jf6x2iayyYkWqWozcPJvGjC8ScUveyAnAnDcn
 U+K5wki+Am32z2ddVUQxZn1btn1/9vSZg1UHNhgTa5pI5R8TgrwVfqGTpD1IsSCDEIKy
 SHAbbMvJ13viyADsRiy6P9Hbu91K38USyORBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWJqPl4ocrihuPMnyA4JhpfCv9I53IhNXNsFNkA/2w8=;
 b=VVdo5WCQ6Kx2ZNdPdS3PJC6SmwqVstO52PQ/4qi/F0CLFyQDG+CLtFgy5HsmQkEoT4
 o8WDXb+2T3m+EbHKypR1+QLW/1wTLGYg/IAEbEGfqznWxvemSP37lN2w5Mh/q7XOdLiy
 gvjQZTuKBMn4bpHQ+Z9pNVFstt1sGDh5GgkWjHusQIIKXG6Q5eI9lL2ZGxq7l3bvtmls
 nhxpcNgzK+X5GtJsOygS8ctjJH8IvMYK/vzBcirxNN5iomukI4Tfv0vnkYcu2L0R8Cwp
 3aiXL5uRNq6K2St5TCU7AG8hz3qdAzRrP7+MR7zak2uRK+CbPQ83gwFhDK9UtDZ+viuL
 4dRw==
X-Gm-Message-State: AOAM531IfU87fDhRd8VUrC1tiDk41TtcZ0a4bxqUuKrXzWvjixvDpUjR
 znu2w0q7ptbrnRKYGxfV5/4eaalLTMj6MrrS2Z5Z0rlQ1QY=
X-Google-Smtp-Source: ABdhPJyy2/M6NHN12N2CGjD3En6xP9Rl4Akq0FjKZzy80hLPpLvP6XZ9w/1qj7aI6OLqW7Oo5lhHwchLwmHks6dKvAM=
X-Received: by 2002:a05:620a:4144:b0:6a0:11c5:a12e with SMTP id
 k4-20020a05620a414400b006a011c5a12emr5282142qko.53.1651724193801; Wed, 04 May
 2022 21:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <87fslp9khd.fsf@linux.ibm.com>
 <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
In-Reply-To: <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2022 04:16:22 +0000
Message-ID: <CACPK8Xd15mz0OOnVzqz4RxcjKXcTvp_1GkzeXt5i4Adg-SfcYg@mail.gmail.com>
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 May 2022 at 03:31, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 5/5/22 05:16, Fabiano Rosas wrote:
> > Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> >
> >> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
> >>
> >> QEMU loads the kernel at 0x400000 by default which works most of
> >> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
> >> (position independent code). This works for a little endian zImage too.
> >>
> >> However a big endian zImage is compiled without -pie, is 32bit, linked to
> >> 0x4000000 so current QEMU ends up loading it at
> >> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
> >>
> >> This uses the kernel address returned from load_elf().
> >> If the default kernel_addr is used, there is no change in behavior (as
> >> translate_kernel_address() takes care of this), which is:
> >> LE/BE vmlinux and LE zImage boot, BE zImage does not.
> >> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
> >> prints a warning and BE zImage boots.
> >
> > I think we can fix this without needing a different command line for BE
> > zImage (apart from x-vof, which is a separate matter).
> >
> > If you look at translate_kernel_address, it cannot really work when the
> > ELF PhysAddr is != 0. We would always hit this sort of 0x4400000 issue,
> > so if we fix that function like this...
> >
> > static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
> > {
> >      SpaprMachineState *spapr = opaque;
> >
> >      return addr ? addr : spapr->kernel_addr;
> > }
>
>
> The qemu elf loader is supposed to handle relocations which should be
> calling this hook more than once, now I wonder why it is not doing so.
>
>
> > ...then we could always use the ELF PhysAddr if it is different from 0
> > and only use the default load addr if the ELF PhysAddr is 0. If the user
> > gives kernel_addr on the cmdline, we honor that, even if puts the kernel
> > over the firmware (we have code to detect that).
>
>
> ELF address is 0 for LE zImage only, vmlinux BE/LE uses
> 0xc000000000000000. And we are already chopping all these tops bits off
> in translate_kernel_address() and I do not really know why _exactly_ it
> is 0x0fffffff and not let's say 0x7fffffff.
>
>
> >
> >> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
> >>               exit(1);
> >>           }
> >>
> >> +        if (spapr->kernel_addr != loaded_addr) {
> >
> > This could be:
> >
> >          if (spapr->kernel_addr == KERNEL_LOAD_ADDR &&
> >           spapr->kernel_addr != loaded_addr) {
> >
> > So the precedence would be:
> >
> > 1- ELF PhysAddr, if != 0. After all, that is what it's for. BE zImage
> >     falls here;
> >
> > 2- KERNEL_LOAD_ADDR. Via translate_kernel_address, LE/BE vmlinux fall
> >     here;
> >
> > 3- kernel_addr. The user is probably hacking something, just use what
> >     they gave us. QEMU will yell if they load the kernel over the fw.
>
>
> imho too complicated.
>
> What if the user runs QEMU with kernel-addr=0x400000? (0x400000 is
> KERNEL_LOAD_ADDR noooow but not necessarily forever). Is it 2) or 3)?
>
> I am basically fixing a bug when we ignore where load_elf() loaded the
> ELF and just assume it is KERNEL_LOAD_ADDR. Now the code checks if the
> ELF was loaded where we want it to be. Everything else can be done but
> on top of this.

It would be good to fix this so we don't need to specify kernel-addr=0.

I only recently learnt the pseries machine doesn't support loading the zImage:

 https://github.com/linuxppc/issues/issues/402

So whatever the fix is, writing down what is expected to work and what
isn't would be useful.

I tested your patch and it worked with this command line:

 qemu-system-ppc64 -M pseries,kernel-addr=0,x-vof=on -nographic
-kernel arch/powerpc/boot/zImage.pseries -serial mon:stdio -nodefaults

Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

>
>
> >> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
> >> +                        spapr->kernel_addr, loaded_addr);
> >> +            spapr->kernel_addr = loaded_addr;
> >> +        }
> >> +
> >>           /* load initrd */
> >>           if (initrd_filename) {
> >>               /* Try to locate the initrd in the gap between the kernel
>

