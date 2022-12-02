Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C496407E5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p16M7-0003Nh-H5; Fri, 02 Dec 2022 08:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p16Lm-00038z-Ok
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:45:11 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p16Lj-0008T4-UW
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:45:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 744BB622CB
 for <qemu-devel@nongnu.org>; Fri,  2 Dec 2022 13:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA436C433D7
 for <qemu-devel@nongnu.org>; Fri,  2 Dec 2022 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669988699;
 bh=zaqhIfnF3DLSzbHCqd4kakP9gQooAojSeb0ji+wB9QY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PbB+ieE3KTcl7yGjmnOaQ6O2ZIdAtKOIvZtVNvRvkIfzphMiJpYTOMSjl1QUxbXIe
 QQJIFL5z8QyGO3eKmYKK316Sb/c6JKmIK4d5ehFnbGsTgb6MCoc13S4y9j5RXKKyRF
 DVhmkd3Pn3UUoO1SieEkqPoST0XWSuwergUMs6K8oB0awtyTXP90RbDZiAQtdl8nKv
 POtBa8d50Urdivdt3FoiZqwM1Mtw/mTnGRTlhH/ge6pyGmGehgl0TN7zXguMijnFx5
 NqqOWplayfBJ4s7Gv8YCz4g8sJzmZG4myN80bHQyD4YNpC30o2+kvpSne0eLORUF+5
 1TLA5r0ZBxkbw==
Received: by mail-lf1-f50.google.com with SMTP id p8so7434833lfu.11
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 05:44:59 -0800 (PST)
X-Gm-Message-State: ANoB5plAb34mDuvmDnFz1dPKVux4xtM4ybYznP+RJijBSvUSU8Kutf/5
 oLcBGxqq5ztVKYNSFIfAjEOCEhi2DLX7niFXiP8=
X-Google-Smtp-Source: AA0mqf5rAmRls729EhIMnjqUwBojxIyevZqEP3+PYAHi4A8LJj6nD2iJx8hnqJOimZhWkqU+n8g08uODMSfeheoAjMY=
X-Received: by 2002:a19:6b19:0:b0:4a2:740b:5b02 with SMTP id
 d25-20020a196b19000000b004a2740b5b02mr22572788lfa.122.1669988697862; Fri, 02
 Dec 2022 05:44:57 -0800 (PST)
MIME-Version: 1.0
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
 <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
 <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
 <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
 <CAMj1kXGF=DuQSgf8FbW98WTX94U7rB0hq_cFAc0+AfVn=HHsFg@mail.gmail.com>
 <21cf7de2-27e8-8d1f-9efc-aa68cefbad50@hisilicon.com>
In-Reply-To: <21cf7de2-27e8-8d1f-9efc-aa68cefbad50@hisilicon.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Dec 2022 14:44:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFUso6CdDa3jMCrdHOBmOim0Z8YxB00a=kF5BbVxw9Xxw@mail.gmail.com>
Message-ID: <CAMj1kXFUso6CdDa3jMCrdHOBmOim0Z8YxB00a=kF5BbVxw9Xxw@mail.gmail.com>
Subject: Re: regression: insmod module failed in VM with nvdimm on
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
Cc: Marc Zyngier <maz@kernel.org>, will@kernel.org, mark.rutland@arm.com, 
 linux-arm-kernel@lists.infradead.org, chenxiang via <qemu-devel@nongnu.org>, 
 "linuxarm@huawei.com" <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Fri, 2 Dec 2022 at 03:48, chenxiang (M) <chenxiang66@hisilicon.com> wrot=
e:
>
> Hi Ard,
>
>
> =E5=9C=A8 2022/12/1 19:07, Ard Biesheuvel =E5=86=99=E9=81=93:
> > On Thu, 1 Dec 2022 at 09:07, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> On Thu, 1 Dec 2022 at 08:15, chenxiang (M) <chenxiang66@hisilicon.com>=
 wrote:
> >>> Hi Ard,
> >>>
> >>>
> >>> =E5=9C=A8 2022/11/30 16:18, Ard Biesheuvel =E5=86=99=E9=81=93:
> >>>> On Wed, 30 Nov 2022 at 08:53, Marc Zyngier <maz@kernel.org> wrote:
> >>>>> On Wed, 30 Nov 2022 02:52:35 +0000,
> >>>>> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> We boot the VM using following commands (with nvdimm on)  (qemu
> >>>>>> version 6.1.50, kernel 6.0-r4):
> >>>>> How relevant is the presence of the nvdimm? Do you observe the fail=
ure
> >>>>> without this?
> >>>>>
> >>>>>> qemu-system-aarch64 -machine
> >>>>>> virt,kernel_irqchip=3Don,gic-version=3D3,nvdimm=3Don  -kernel
> >>>>>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
> >>>>>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
> >>>>>> 2G,maxmem=3D64G,slots=3D3 -smp 4 -append 'rdinit=3Dinit console=3D=
ttyAMA0
> >>>>>> ealycon=3Dpl0ll,0x90000000 pcie_ports=3Dnative pciehp.pciehp_debug=
=3D1'
> >>>>>> -object memory-backend-ram,id=3Dram1,size=3D10G -device
> >>>>>> nvdimm,id=3Ddimm1,memdev=3Dram1  -device ioh3420,id=3Droot_port1,c=
hassis=3D1
> >>>>>> -device vfio-pci,host=3D7d:01.0,id=3Dnet0,bus=3Droot_port1
> >>>>>>
> >>>>>> Then in VM we insmod a module, vmalloc error occurs as follows (ke=
rnel
> >>>>>> 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
> >>>>>>
> >>>>>> estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
> >>>>>> [    8.186563] vmap allocation for size 20480 failed: use
> >>>>>> vmalloc=3D<size> to increase size
> >>>>> Have you tried increasing the vmalloc size to check that this is
> >>>>> indeed the problem?
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: ka=
slr:
> >>>>>> defer initialization to initcall where permitted").
> >>>>> I guess you mean commit fc5a89f75d2a instead, right?
> >>>>>
> >>>>>> Do you have any idea about the issue?
> >>>>> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
> >>>>> portion of the vmalloc space, but you give very little information
> >>>>> that could help here...
> >>>>>
> >>>> Ouch. I suspect what's going on here: that patch defers the
> >>>> randomization of the module region, so that we can decouple it from
> >>>> the very early init code.
> >>>>
> >>>> Obviously, it is happening too late now, and the randomized module
> >>>> region is overlapping with a vmalloc region that is in use by the ti=
me
> >>>> the randomization occurs.
> >>>>
> >>>> Does the below fix the issue?
> >>> The issue still occurs, but it seems decrease the probability, before=
 it
> >>> occured almost every time, after the change, i tried 2-3 times, and i=
t
> >>> occurs.
> >>> But i change back "subsys_initcall" to "core_initcall", and i test mo=
re
> >>> than 20 times, and it is still ok.
> >>>
> >> Thank you for confirming. I will send out a patch today.
> >>
> > ...but before I do that, could you please check whether the change
> > below fixes your issue as well?
> >
> > diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> > index 6ccc7ef600e7c1e1..c8c205b630da1951 100644
> > --- a/arch/arm64/kernel/kaslr.c
> > +++ b/arch/arm64/kernel/kaslr.c
> > @@ -20,7 +20,11 @@
> >   #include <asm/sections.h>
> >   #include <asm/setup.h>
> >
> > -u64 __ro_after_init module_alloc_base;
> > +/*
> > + * Set a reasonable default for module_alloc_base in case
> > + * we end up running with module randomization disabled.
> > + */
> > +u64 __ro_after_init module_alloc_base =3D (u64)_etext - MODULES_VSIZE;
> >   u16 __initdata memstart_offset_seed;
> >
> >   struct arm64_ftr_override kaslr_feature_override __initdata;
> > @@ -30,12 +34,6 @@ static int __init kaslr_init(void)
> >          u64 module_range;
> >          u32 seed;
> >
> > -       /*
> > -        * Set a reasonable default for module_alloc_base in case
> > -        * we end up running with module randomization disabled.
> > -        */
> > -       module_alloc_base =3D (u64)_etext - MODULES_VSIZE;
> > -
> >          if (kaslr_feature_override.val & kaslr_feature_override.mask &=
 0xf) {
> >                  pr_info("KASLR disabled on command line\n");
> >                  return 0;
> > .
>
> We have tested this change, the issue is still and it doesn't fix the iss=
ue.
>

Thanks for the report.

