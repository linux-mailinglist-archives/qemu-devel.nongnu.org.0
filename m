Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F198163EAD8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ebq-0001V6-VA; Thu, 01 Dec 2022 03:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0ebf-0001RD-Gl
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:07:52 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0ebX-0007sa-Dy
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:07:43 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B30CC61EC3
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 08:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD58C433D6
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669882043;
 bh=jThj9nmVgc9lGsBvKT5/MOcumvfhWDDGgaEMbj6GnBw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nz5gVYl0EfXdKm+fwvPWatq/ckrjxx5MXP7lz5oB1xHpX0YAGN+8bsn5UThYYjrok
 zETSkOEtta0TrlKg6g1lsuw7a1gx2dzlhkJN4eTL4EhKR5V9hSQM3RihPSDX4ItD/p
 62OgV4opNDfy7gzUWIGz0CBu0kvX41RAg0uwTE17F6qZvMbRIktVO+5qwrIDiJvH/t
 L8NTODptmCddDF9OIge+5tG2yPT2r8a7sqyYyx71j0urShcihzoZsLeuZ8N1L6uXNU
 BH7UrMyNU+glyAEC8pGB2WzKM6gaGgpsWI9/himjzphbD7ZJtGU5S1j9TE9gMmEPmP
 AuGUkbHAPrwHw==
Received: by mail-lf1-f50.google.com with SMTP id r12so1321270lfp.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:07:22 -0800 (PST)
X-Gm-Message-State: ANoB5pknT0hmkdaRMKS63Nvk6rzwR1hQC0urq1CMkxC8oOU8YautF5zb
 nePQwKhVPmr2g7BzWTdst7SBr7kltR10PYKHbxk=
X-Google-Smtp-Source: AA0mqf5GoNBdUBsDxlQ73Y1KjpBKlmnlrbCOIwh9ZhTJtSPmTjzXW2eJ9apsMHkyFLsQup0n2o/Io+lRaYwaARgEkxk=
X-Received: by 2002:a05:6512:3c89:b0:4a2:bfd2:b218 with SMTP id
 h9-20020a0565123c8900b004a2bfd2b218mr21880240lfv.228.1669882041101; Thu, 01
 Dec 2022 00:07:21 -0800 (PST)
MIME-Version: 1.0
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
 <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
 <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
In-Reply-To: <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Dec 2022 09:07:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
Message-ID: <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
Subject: Re: regression: insmod module failed in VM with nvdimm on
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
Cc: Marc Zyngier <maz@kernel.org>, will@kernel.org, mark.rutland@arm.com, 
 linux-arm-kernel@lists.infradead.org, chenxiang via <qemu-devel@nongnu.org>, 
 "linuxarm@huawei.com" <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
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

On Thu, 1 Dec 2022 at 08:15, chenxiang (M) <chenxiang66@hisilicon.com> wrot=
e:
>
> Hi Ard,
>
>
> =E5=9C=A8 2022/11/30 16:18, Ard Biesheuvel =E5=86=99=E9=81=93:
> > On Wed, 30 Nov 2022 at 08:53, Marc Zyngier <maz@kernel.org> wrote:
> >> On Wed, 30 Nov 2022 02:52:35 +0000,
> >> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
> >>> Hi,
> >>>
> >>> We boot the VM using following commands (with nvdimm on)  (qemu
> >>> version 6.1.50, kernel 6.0-r4):
> >> How relevant is the presence of the nvdimm? Do you observe the failure
> >> without this?
> >>
> >>> qemu-system-aarch64 -machine
> >>> virt,kernel_irqchip=3Don,gic-version=3D3,nvdimm=3Don  -kernel
> >>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
> >>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
> >>> 2G,maxmem=3D64G,slots=3D3 -smp 4 -append 'rdinit=3Dinit console=3Dtty=
AMA0
> >>> ealycon=3Dpl0ll,0x90000000 pcie_ports=3Dnative pciehp.pciehp_debug=3D=
1'
> >>> -object memory-backend-ram,id=3Dram1,size=3D10G -device
> >>> nvdimm,id=3Ddimm1,memdev=3Dram1  -device ioh3420,id=3Droot_port1,chas=
sis=3D1
> >>> -device vfio-pci,host=3D7d:01.0,id=3Dnet0,bus=3Droot_port1
> >>>
> >>> Then in VM we insmod a module, vmalloc error occurs as follows (kerne=
l
> >>> 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
> >>>
> >>> estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
> >>> [    8.186563] vmap allocation for size 20480 failed: use
> >>> vmalloc=3D<size> to increase size
> >> Have you tried increasing the vmalloc size to check that this is
> >> indeed the problem?
> >>
> >> [...]
> >>
> >>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr=
:
> >>> defer initialization to initcall where permitted").
> >> I guess you mean commit fc5a89f75d2a instead, right?
> >>
> >>> Do you have any idea about the issue?
> >> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
> >> portion of the vmalloc space, but you give very little information
> >> that could help here...
> >>
> > Ouch. I suspect what's going on here: that patch defers the
> > randomization of the module region, so that we can decouple it from
> > the very early init code.
> >
> > Obviously, it is happening too late now, and the randomized module
> > region is overlapping with a vmalloc region that is in use by the time
> > the randomization occurs.
> >
> > Does the below fix the issue?
>
> The issue still occurs, but it seems decrease the probability, before it
> occured almost every time, after the change, i tried 2-3 times, and it
> occurs.
> But i change back "subsys_initcall" to "core_initcall", and i test more
> than 20 times, and it is still ok.
>

Thank you for confirming. I will send out a patch today.

> >
> > diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> > index 37a9deed2aec..71fb18b2f304 100644
> > --- a/arch/arm64/kernel/kaslr.c
> > +++ b/arch/arm64/kernel/kaslr.c
> > @@ -90,4 +90,4 @@ static int __init kaslr_init(void)
> >
> >          return 0;
> >   }
> > -subsys_initcall(kaslr_init)
> > +arch_initcall(kaslr_init)
> > .
> >
>

