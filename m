Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A163F0EE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0j4F-00079b-Lh; Thu, 01 Dec 2022 07:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0j4D-00077m-EP
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:53:29 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0j48-0004If-0p
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:53:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD5D061FD6
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 12:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5CEC433C1
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669899202;
 bh=uy94m3osw99AczHjRyQ60IU1790EdqtPyWUmQvPfT2Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Iou8BaXwGFreJiX5FMA701yymN1R4qsr7DTsF4a4t5Z+rsPfg7lOxCG0mS7tPVr4K
 QGkNCEji/aSsw6lzS+HQMy52Bfj0B+0cn6ZfE8NxGd/3/OXGniopQD02+vN4ZgfdvW
 pbJgIUVjXRfsr/9Rpm/4QgWllVsyGDLIglWiRRluRMo2/85iqsBleqmv4oKpX0ZOzd
 I7G8N0AgNp3Q1pwzQBoYt2mDIfI1rua1/EJPmv/Y2J88F9WqeH3GpkArFgn/aRXRhv
 8YqK7HBbIw2ajrf4UlvmD8QGKX8N+aCJ35iF6NqUILEXPwwdzsk8lg+kL6XYaU2dKE
 QBtlkBBp3P9lA==
Received: by mail-lf1-f44.google.com with SMTP id b3so2366179lfv.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 04:53:22 -0800 (PST)
X-Gm-Message-State: ANoB5pmgKlcCzNe/lriih7XM69TFlX2pzCpSw+4V/ptOBZT4YlivfyOR
 UGec6kes2RJQAc19fi9BcY2gYIjh3XAe/HhhsUQ=
X-Google-Smtp-Source: AA0mqf5qVPI4Su8PHMCNU4DIx9DM1O/XF1MazCJke9+Vo/OG9nXd+9crRWzzYRtwBP5bv3fYp0x85HEftXK7vLL30Ro=
X-Received: by 2002:a19:6b19:0:b0:4a2:740b:5b02 with SMTP id
 d25-20020a196b19000000b004a2740b5b02mr20999762lfa.122.1669899200127; Thu, 01
 Dec 2022 04:53:20 -0800 (PST)
MIME-Version: 1.0
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
 <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
 <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
 <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
 <CAMj1kXGF=DuQSgf8FbW98WTX94U7rB0hq_cFAc0+AfVn=HHsFg@mail.gmail.com>
 <3d2acb1b-b1f1-023c-6e93-b0eeaee334f2@hisilicon.com>
In-Reply-To: <3d2acb1b-b1f1-023c-6e93-b0eeaee334f2@hisilicon.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Dec 2022 13:53:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGoGKVgiQR9kkjZyy1UhSMosf8ov-2=1nzo9HasdSzMXA@mail.gmail.com>
Message-ID: <CAMj1kXGoGKVgiQR9kkjZyy1UhSMosf8ov-2=1nzo9HasdSzMXA@mail.gmail.com>
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

On Thu, 1 Dec 2022 at 13:07, chenxiang (M) <chenxiang66@hisilicon.com> wrot=
e:
>
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
>
> Yes, but i can only reply to you tomorrow as other guy is testing on the
> only environment today.
>

That is fine, thanks.

