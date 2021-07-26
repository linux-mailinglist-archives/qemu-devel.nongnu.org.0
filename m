Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D963D6042
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:04:51 +0200 (CEST)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8362-0001pe-2c
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m832Z-00044v-6z
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:01:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m832W-0008Qn-4w
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:01:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A55660551
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627315269;
 bh=RsNK0q3TOMNzmgr13IPx01t1ywLSD9vPqTSxfXidUFo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PPYqChSqI1sv/co6ZT52ONLUNwUy51tiPLSuMCYlq6zBAUt8rusi5gMpxGAL9xVSc
 6kO8ylJmphaDwYmNTKLxUW3t4Sn/5ej5S+t/h1Y23mAQdcbNleNO+MaN7LMQMxlVBL
 sQesUuY8p1nzOhN7Pch98jzDNBzQ52PA8x/v8Jh91m+KP5uE/MWFrGOMQEAcgZdfUu
 8DNyAbyPCSAgHnpxkK16S/9kTnkdp4fLEyOM3WWOWMaQNEoXp3x2HMsmC/Eih8MF7S
 KMVnfBabQ46yHT+t2IN9XXzgRixn1QrAlhkSVdmP51lNOxyYclLgtrzmVx5RUz4lIa
 hRkG7CDEyj9LA==
Received: by mail-oi1-f181.google.com with SMTP id y18so11446053oiv.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:01:09 -0700 (PDT)
X-Gm-Message-State: AOAM533Szrw1Sqn7THv1zf5SJl63/q1rKmWeVQsC4qIfWkwUnvEwQ7ud
 Pj4mNT5uEw7WuMNA3Tq66GFplixChAlWprBQrc4=
X-Google-Smtp-Source: ABdhPJwqoVD3LfE+HMB9B46OfY98ZvbmQtnMcRbX071NuQOh+RDmSSgftcWnuJB+Z6MdE4pSuhE83NgAz9mzPW83zNY=
X-Received: by 2002:aca:4c49:: with SMTP id z70mr11453286oia.174.1627315269019; 
 Mon, 26 Jul 2021 09:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
In-Reply-To: <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 26 Jul 2021 18:00:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
Message-ID: <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jiahui Cen <cenjiahui@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(cc Bjorn)

On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> >> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> >>> Hi all,
> >>>
> >>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> >>> work. Analysis shows that PCI devices with IO ports do not instantiat=
e
> >>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affe=
cts
> >>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> >>> affects
> >>> aarch64, not x86/x86_64.
> >>>
> >>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> >>> keep firmware resource map"). Since this commit, PCI device BAR
> >>> allocation has changed. Taking tulip as example, the kernel reports
> >>> the following PCI bar assignments when running qemu v5.2.
> >>>
> >>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> >>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> >>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f=
]

IIUC, these lines are read back from the BARs

> >>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> >>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> >>> 0x10000000-0x1000007f]
> >>>

... and this is the assignment created by the kernel.

> >>> With qemu v6.0, the assignment is reported as follows.
> >>>
> >>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> >>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> >>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f=
]
> >>>

The problem here is that Linux, for legacy reasons, does not support
I/O ports <=3D 0x1000 on PCI, so the I/O assignment created by EFI is
rejected.

This might make sense on x86, where legacy I/O ports may exist, but on
other architectures, this makes no sense.


> >>> and the controller does not instantiate. The problem disapears after
> >>> reverting commit 0cf8882fd0.
> >>>
> >>> Attached is a summary of test runs with various devices and qemu v5.2
> >>> as well as qemu v6.0, and the command line I use for efi boots.
> >>>
> >>> Did commit 0cf8882fd0 introduce a bug, do I now need need some differ=
ent
> >>> command line to instantiate PCI devices with io ports, or are such
> >>> devices
> >>> simply no longer supported if the system is booted with efi support ?
> >>>
> >>> Thanks,
> >>> Guenter
> >>
> >>
> >> So that commit basically just says don't ignore what efi did.
> >>
> >> The issue's thus likely efi.
> >>
> >
> > I don't see the problem with efi boots on x86 and x86_64.
> > Any idea why that might be the case ?
> >
> > Thanks,
> > Guenter
> >
> >> Cc the maintainer. Philippe can you comment pls?
>
> I'll have a look. Cc'ing Ard for EDK2/Aarch64.
>

So a potential workaround would be to use a different I/O resource
window for ArmVirtPkg, that starts at 0x1000. But I would prefer to
fix Linux instead.


> >>
> >>> ---
> >>> Command line (tulip network interface):
> >>>
> >>> CMDLINE=3D"root=3D/dev/vda console=3DttyAMA0"
> >>> ROOTFS=3D"rootfs.ext2"
> >>>
> >>> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot =
\
> >>>          -m 512 -cpu cortex-a57 -no-reboot \
> >>>          -device tulip,netdev=3Dnet0 -netdev user,id=3Dnet0 \
> >>>          -bios QEMU_EFI-aarch64.fd \
> >>>          -snapshot \
> >>>          -device virtio-blk-device,drive=3Dd0 \
> >>>          -drive file=3D${ROOTFS},if=3Dnone,id=3Dd0,format=3Draw \
> >>>          -nographic -serial stdio -monitor none \
> >>>          --append "${CMDLINE}"
> >>>
> >>> ---
> >>> Boot tests with various devices known to work in qemu v5.2.
> >>>
> >>>         v5.2    v6.0    v6.0
> >>>         efi    non-efi    efi
> >>> e1000        pass    pass    pass
> >>> e1000-82544gc    pass    pass    pass
> >>> e1000-82545em    pass    pass    pass
> >>> e1000e        pass    pass    pass
> >>> i82550        pass    pass    pass
> >>> i82557a        pass    pass    pass
> >>> i82557b        pass    pass    pass
> >>> i82557c        pass    pass    pass
> >>> i82558a        pass    pass    pass
> >>> i82559b        pass    pass    pass
> >>> i82559c        pass    pass    pass
> >>> i82559er    pass    pass    pass
> >>> i82562        pass    pass    pass
> >>> i82801        pass    pass    pass
> >>> ne2k_pci    pass    pass    fail    <--
> >>> pcnet        pass    pass    pass
> >>> rtl8139        pass    pass    pass
> >>> tulip        pass    pass    fail    <--
> >>> usb-net        pass    pass    pass
> >>> virtio-net-device
> >>>         pass    pass    pass
> >>> virtio-net-pci    pass    pass    pass
> >>> virtio-net-pci-non-transitional
> >>>         pass    pass    pass
> >>>
> >>> usb-xhci    pass    pass    pass
> >>> usb-ehci    pass    pass    pass
> >>> usb-ohci    pass    pass    pass
> >>> usb-uas-xhci    pass    pass    pass
> >>> virtio        pass    pass    pass
> >>> virtio-blk-pci    pass    pass    pass
> >>> virtio-blk-device
> >>>         pass    pass    pass
> >>> nvme        pass    pass    pass
> >>> sdhci        pass    pass    pass
> >>> dc390        pass    pass    fail    <--
> >>> am53c974    pass    pass    fail    <--
> >>> lsi53c895ai    pass    pass    pass
> >>> mptsas1068    pass    pass    pass
> >>> lsi53c810    pass    pass    pass
> >>> megasas        pass    pass    pass
> >>> megasas-gen2    pass    pass    pass
> >>> virtio-scsi-device
> >>>         pass    pass    pass
> >>> virtio-scsi-pci    pass    pass    pass
> >>
> >
>

