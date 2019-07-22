Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346097004A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 14:57:02 +0200 (CEST)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpXsD-0002Js-4t
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 08:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.rutland@arm.com>) id 1hpXrz-0001oR-Kr
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.rutland@arm.com>) id 1hpXry-0002Zb-9e
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:56:47 -0400
Received: from foss.arm.com ([217.140.110.172]:35738)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <mark.rutland@arm.com>)
 id 1hpXrv-0002WL-9c; Mon, 22 Jul 2019 08:56:43 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7B1344;
 Mon, 22 Jul 2019 05:56:41 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA3133F71A;
 Mon, 22 Jul 2019 05:56:40 -0700 (PDT)
Date: Mon, 22 Jul 2019 13:56:33 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190722125633.GA35035@lakrids.cambridge.arm.com>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
 <20190516144733.32399-4-peter.maydell@linaro.org>
 <20190719164729.GA22520@lakrids.cambridge.arm.com>
 <CAFEAcA_i_0=xAp86RJVSpurAdWfT5KDfgoh6Y51-mwBJa=_QTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_i_0=xAp86RJVSpurAdWfT5KDfgoh6Y51-mwBJa=_QTQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.110.172
Subject: Re: [Qemu-devel] [PATCH v2 3/4] hw/arm/boot: Avoid placing the
 initrd on top of the kernel
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 22, 2019 at 12:59:01PM +0100, Peter Maydell wrote:
> On Fri, 19 Jul 2019 at 17:47, Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > Hi Peter,
> >
> > I've just been testing on QEMU v4.1.0-rc1, and found a case where the
> > DTB overlapped the end of the kernel, and I think there's a bug in this
> > patch -- explanation below.
> >
> > On Thu, May 16, 2019 at 03:47:32PM +0100, Peter Maydell wrote:
> > > We currently put the initrd at the smaller of:
> > >  * 128MB into RAM
> > >  * halfway into the RAM
> > > (with the dtb following it).
> > >
> > > However for large kernels this might mean that the kernel
> > > overlaps the initrd. For some kinds of kernel (self-decompressing
> > > 32-bit kernels, and ELF images with a BSS section at the end)
> > > we don't know the exact size, but even there we have a
> > > minimum size. Put the initrd at least further into RAM than
> > > that. For image formats that can give us an exact kernel size, this
> > > will mean that we definitely avoid overlaying kernel and initrd.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/arm/boot.c | 34 ++++++++++++++++++++--------------
> > >  1 file changed, 20 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > index 935be3b92a5..e441393fdf5 100644
> > > --- a/hw/arm/boot.c
> > > +++ b/hw/arm/boot.c
> > > @@ -999,20 +999,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> > >      if (info->nb_cpus == 0)
> > >          info->nb_cpus = 1;
> > >
> > > -    /*
> > > -     * We want to put the initrd far enough into RAM that when the
> > > -     * kernel is uncompressed it will not clobber the initrd. However
> > > -     * on boards without much RAM we must ensure that we still leave
> > > -     * enough room for a decent sized initrd, and on boards with large
> > > -     * amounts of RAM we must avoid the initrd being so far up in RAM
> > > -     * that it is outside lowmem and inaccessible to the kernel.
> > > -     * So for boards with less  than 256MB of RAM we put the initrd
> > > -     * halfway into RAM, and for boards with 256MB of RAM or more we put
> > > -     * the initrd at 128MB.
> > > -     */
> > > -    info->initrd_start = info->loader_start +
> > > -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> > > -
> > >      /* Assume that raw images are linux kernels, and ELF images are not.  */
> > >      kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
> > >                                 &elf_high_addr, elf_machine, as);
> > > @@ -1064,6 +1050,26 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> > >      }
> > >
> > >      info->entry = entry;
> >
> > Note: this is the start of the kernel image...
> 
> It's the entry point, which isn't quite the same thing as
> the start of the image (if we just loaded an ELF file then
> 'entry' is whatever the ELF file said the entrypoint is, which
> could be a long way into the image).

Ah, I see; thanks for correcting me!

> > > +    /*
> > > +     * We want to put the initrd far enough into RAM that when the
> > > +     * kernel is uncompressed it will not clobber the initrd. However
> > > +     * on boards without much RAM we must ensure that we still leave
> > > +     * enough room for a decent sized initrd, and on boards with large
> > > +     * amounts of RAM we must avoid the initrd being so far up in RAM
> > > +     * that it is outside lowmem and inaccessible to the kernel.
> > > +     * So for boards with less  than 256MB of RAM we put the initrd
> > > +     * halfway into RAM, and for boards with 256MB of RAM or more we put
> > > +     * the initrd at 128MB.
> > > +     * We also refuse to put the initrd somewhere that will definitely
> > > +     * overlay the kernel we just loaded, though for kernel formats which
> > > +     * don't tell us their exact size (eg self-decompressing 32-bit kernels)
> > > +     * we might still make a bad choice here.
> > > +     */
> > > +    info->initrd_start = info->loader_start +
> > > +        MAX(MIN(info->ram_size / 2, 128 * 1024 * 1024), kernel_size);
> >
> > ... but here we add kernel_size to the start of the loader, which is
> > below the kernel. Should that be info->entry?
> 
> loader_start here really means "base of RAM". I think what
> we want here is something like
> 
>   info->initrd_start = info->loader_start + MIN(info->ram_size / 2,
> 128 * 1024 * 1024);
>   info->initrd_start = MAX(info->initrd_start, kernel_end);

From what I understand, I can't see a way of breaking that, so it looks
good to me.

> where kernel_end is just past whatever the highest addr of the kernel
> is, which is not something that's totally trivial to calculate
> with the variables we have to hand at this point.

Sure; I assume you might need to drop that into arm_boot_info.

As previously, I'm happy to test patches for this. At the moment I have
a local hack relying on info->entry, and I understand this isn't
correct.

Thanks,
Mark.

