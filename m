Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338663EF03
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:09:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0hQQ-0005YK-S7; Thu, 01 Dec 2022 06:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0hQO-0005YB-NX
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:08:16 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1p0hQJ-0002GE-F0
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:08:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4BDA61F96
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 11:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B1CC4347C
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669892889;
 bh=3uBhTHdruUUJ92otAu+G7ke4c/ZOBzn4dElrB5hMFjc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WCnTpLdRVg6ETR4EzwSRT+YlXka0KeUkcPPkzo+SX3huyE08qIKEQQT8KE3pTTOfC
 nljF/HP+/nM6jYc7VF5PSczgYgPP6OyHGNDltbqggSiwN2uyZpXEs0BCW7TVuAeeqc
 DRn03DMSrG3pEXtb0SOH2y17CoVz6jw/a1bhbOzHGKGV4xszBYcikk0zVNVXz07k1C
 xxaQLic42w8hcHqZsFmKWc9cNF6Z7f6TSvVdGIaHgO3bstcei9V7fKlLzIV4h6eAIB
 bdIsya3HusK9AKtlfU1EzNxYuFeunwotbzduGMc5tDONBdUs0xYSMwsohYR8faFtzV
 iRUIOI4GkICug==
Received: by mail-lj1-f173.google.com with SMTP id z4so1473178ljq.6
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 03:08:09 -0800 (PST)
X-Gm-Message-State: ANoB5pneVzeShTjT4ZP2SIigfheDfDTr0Dsr3ONMYKo2rQp96ZEXXeQs
 GoNxUrYWur6rgdffbJBDRuy1OyL51WVciqI2D0M=
X-Google-Smtp-Source: AA0mqf5C7SqVtxh7CBDVkTnDGzg0/iwQ57hwqA0UDY0ULV/whroB66HTmQy2MwkolyDvP4nYUKR4fQCWKZzk76wV2ys=
X-Received: by 2002:a05:651c:1603:b0:26d:d603:8df2 with SMTP id
 f3-20020a05651c160300b0026dd6038df2mr19406194ljq.189.1669892887292; Thu, 01
 Dec 2022 03:08:07 -0800 (PST)
MIME-Version: 1.0
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
 <CAMj1kXE4Z-rc0-NqbOCt+m5d6mK5wF365-vWTuaRk7sf2TyG1A@mail.gmail.com>
 <706965d2-60cb-847d-b30e-6074c8ca5fe4@hisilicon.com>
 <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
In-Reply-To: <CAMj1kXHF1EMT0Y=S=tM9_THfKCt4QGnrFs6b4ieDqADzg5jeRw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Dec 2022 12:07:56 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGF=DuQSgf8FbW98WTX94U7rB0hq_cFAc0+AfVn=HHsFg@mail.gmail.com>
Message-ID: <CAMj1kXGF=DuQSgf8FbW98WTX94U7rB0hq_cFAc0+AfVn=HHsFg@mail.gmail.com>
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
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 1 Dec 2022 at 09:07, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 1 Dec 2022 at 08:15, chenxiang (M) <chenxiang66@hisilicon.com> wr=
ote:
> >
> > Hi Ard,
> >
> >
> > =E5=9C=A8 2022/11/30 16:18, Ard Biesheuvel =E5=86=99=E9=81=93:
> > > On Wed, 30 Nov 2022 at 08:53, Marc Zyngier <maz@kernel.org> wrote:
> > >> On Wed, 30 Nov 2022 02:52:35 +0000,
> > >> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
> > >>> Hi,
> > >>>
> > >>> We boot the VM using following commands (with nvdimm on)  (qemu
> > >>> version 6.1.50, kernel 6.0-r4):
> > >> How relevant is the presence of the nvdimm? Do you observe the failu=
re
> > >> without this?
> > >>
> > >>> qemu-system-aarch64 -machine
> > >>> virt,kernel_irqchip=3Don,gic-version=3D3,nvdimm=3Don  -kernel
> > >>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
> > >>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
> > >>> 2G,maxmem=3D64G,slots=3D3 -smp 4 -append 'rdinit=3Dinit console=3Dt=
tyAMA0
> > >>> ealycon=3Dpl0ll,0x90000000 pcie_ports=3Dnative pciehp.pciehp_debug=
=3D1'
> > >>> -object memory-backend-ram,id=3Dram1,size=3D10G -device
> > >>> nvdimm,id=3Ddimm1,memdev=3Dram1  -device ioh3420,id=3Droot_port1,ch=
assis=3D1
> > >>> -device vfio-pci,host=3D7d:01.0,id=3Dnet0,bus=3Droot_port1
> > >>>
> > >>> Then in VM we insmod a module, vmalloc error occurs as follows (ker=
nel
> > >>> 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
> > >>>
> > >>> estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
> > >>> [    8.186563] vmap allocation for size 20480 failed: use
> > >>> vmalloc=3D<size> to increase size
> > >> Have you tried increasing the vmalloc size to check that this is
> > >> indeed the problem?
> > >>
> > >> [...]
> > >>
> > >>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kas=
lr:
> > >>> defer initialization to initcall where permitted").
> > >> I guess you mean commit fc5a89f75d2a instead, right?
> > >>
> > >>> Do you have any idea about the issue?
> > >> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
> > >> portion of the vmalloc space, but you give very little information
> > >> that could help here...
> > >>
> > > Ouch. I suspect what's going on here: that patch defers the
> > > randomization of the module region, so that we can decouple it from
> > > the very early init code.
> > >
> > > Obviously, it is happening too late now, and the randomized module
> > > region is overlapping with a vmalloc region that is in use by the tim=
e
> > > the randomization occurs.
> > >
> > > Does the below fix the issue?
> >
> > The issue still occurs, but it seems decrease the probability, before i=
t
> > occured almost every time, after the change, i tried 2-3 times, and it
> > occurs.
> > But i change back "subsys_initcall" to "core_initcall", and i test more
> > than 20 times, and it is still ok.
> >
>
> Thank you for confirming. I will send out a patch today.
>

...but before I do that, could you please check whether the change
below fixes your issue as well?

diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 6ccc7ef600e7c1e1..c8c205b630da1951 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -20,7 +20,11 @@
 #include <asm/sections.h>
 #include <asm/setup.h>

-u64 __ro_after_init module_alloc_base;
+/*
+ * Set a reasonable default for module_alloc_base in case
+ * we end up running with module randomization disabled.
+ */
+u64 __ro_after_init module_alloc_base =3D (u64)_etext - MODULES_VSIZE;
 u16 __initdata memstart_offset_seed;

 struct arm64_ftr_override kaslr_feature_override __initdata;
@@ -30,12 +34,6 @@ static int __init kaslr_init(void)
        u64 module_range;
        u32 seed;

-       /*
-        * Set a reasonable default for module_alloc_base in case
-        * we end up running with module randomization disabled.
-        */
-       module_alloc_base =3D (u64)_etext - MODULES_VSIZE;
-
        if (kaslr_feature_override.val & kaslr_feature_override.mask & 0xf)=
 {
                pr_info("KASLR disabled on command line\n");
                return 0;

