Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E703D6DA8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 06:46:32 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Ez9-0002RB-B1
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 00:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8Ey2-0001gs-Ib
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 00:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8Exw-00041U-Ac
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 00:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627361113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XPvWYxQfax2vLnTzm8ERCyZNfDLhSuDe2eTxjFZLL4=;
 b=F/v6U1r85Y9KTK5X/fhOK27+P0QdwPw0R9jkD0SvfxK2NQkNqVNsHu5bhUjIlH7JLM1Bz4
 IzGW5EGFyQaLthYuy6VRN2/SqfIKhxQCd98Xga6/t1q7eLZWXMA+eZfE9jXCnS8GbdVraV
 9ydi9Qd22bFXIgCmuAqwAwRskHyXOvU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Skz_m0biMvuZImFgJ4WtYA-1; Tue, 27 Jul 2021 00:45:11 -0400
X-MC-Unique: Skz_m0biMvuZImFgJ4WtYA-1
Received: by mail-ed1-f70.google.com with SMTP id
 l10-20020aa7caca0000b02903b874f26036so5868035edt.20
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 21:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9XPvWYxQfax2vLnTzm8ERCyZNfDLhSuDe2eTxjFZLL4=;
 b=brh0xsXYl4LKzNsWOejUN9paBcn+iifHnzJG4hfkSqXEZ3alc3098y1z7NekiGcvZJ
 dSodT2yis/maR67kUKmL+S4KXhIeFnWyCqxr5orgrx0ZP77oif7Tk8p5N3Qr31PYmSxP
 0N0r0/p1LNOakkyEeSkaEZ0JdmmNWZbb8UnOBEYSlZerr2IgG5GD8vu4BdDN2ZEo7NJI
 ikEas6ankyUo4FQGhshCR/IW2hZRGZEHc6vhtH9KLXMZBwOVnzpENkRmbnrZvbWPSYip
 y4pyP/LpYVIfflkMCj3OdmFvtb21U5TF238eJaFR8dMvRQck7zlRXB2X6y34UCzr7KY0
 kDeA==
X-Gm-Message-State: AOAM533i9ggJkOxUwZbLW88tEjqfZZJkDzXorMdIcUgSAZzF8pF2Wo8Z
 RTycnXX5fa+yATTOA87MbroHXEgoKaQQUDhpcEXzIFtB2n4oJY40rO7Gq5GnMxvVMwij15QWD7C
 Dyx99ixwQr+v+sBw=
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr19778550ejc.473.1627361110546; 
 Mon, 26 Jul 2021 21:45:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcZI0m1oXOvbUH1kv/0Hc8ZVAh0EsPqTUOBzYyEpq7XBhQfFUrzaZJagRzYkxVCCyBTuCdCw==
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr19778532ejc.473.1627361110316; 
 Mon, 26 Jul 2021 21:45:10 -0700 (PDT)
Received: from redhat.com ([2.55.128.141])
 by smtp.gmail.com with ESMTPSA id gx11sm486079ejc.33.2021.07.26.21.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 21:45:09 -0700 (PDT)
Date: Tue, 27 Jul 2021 00:45:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210727004401-mutt-send-email-mst@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> (cc Bjorn)
> 
> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > > On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > >> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> > >>> Hi all,
> > >>>
> > >>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> > >>> work. Analysis shows that PCI devices with IO ports do not instantiate
> > >>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> > >>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> > >>> affects
> > >>> aarch64, not x86/x86_64.
> > >>>
> > >>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> > >>> keep firmware resource map"). Since this commit, PCI device BAR
> > >>> allocation has changed. Taking tulip as example, the kernel reports
> > >>> the following PCI bar assignments when running qemu v5.2.
> > >>>
> > >>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > >>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > >>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> 
> IIUC, these lines are read back from the BARs
> 
> > >>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> > >>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > >>> 0x10000000-0x1000007f]
> > >>>
> 
> ... and this is the assignment created by the kernel.
> 
> > >>> With qemu v6.0, the assignment is reported as follows.
> > >>>
> > >>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > >>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > >>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > >>>
> 
> The problem here is that Linux, for legacy reasons, does not support
> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
> rejected.
> 
> This might make sense on x86, where legacy I/O ports may exist, but on
> other architectures, this makes no sense.


Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
that trip up existing guests, right?

> 
> > >>> and the controller does not instantiate. The problem disapears after
> > >>> reverting commit 0cf8882fd0.
> > >>>
> > >>> Attached is a summary of test runs with various devices and qemu v5.2
> > >>> as well as qemu v6.0, and the command line I use for efi boots.
> > >>>
> > >>> Did commit 0cf8882fd0 introduce a bug, do I now need need some different
> > >>> command line to instantiate PCI devices with io ports, or are such
> > >>> devices
> > >>> simply no longer supported if the system is booted with efi support ?
> > >>>
> > >>> Thanks,
> > >>> Guenter
> > >>
> > >>
> > >> So that commit basically just says don't ignore what efi did.
> > >>
> > >> The issue's thus likely efi.
> > >>
> > >
> > > I don't see the problem with efi boots on x86 and x86_64.
> > > Any idea why that might be the case ?
> > >
> > > Thanks,
> > > Guenter
> > >
> > >> Cc the maintainer. Philippe can you comment pls?
> >
> > I'll have a look. Cc'ing Ard for EDK2/Aarch64.
> >
> 
> So a potential workaround would be to use a different I/O resource
> window for ArmVirtPkg, that starts at 0x1000. But I would prefer to
> fix Linux instead.
> 
> 
> > >>
> > >>> ---
> > >>> Command line (tulip network interface):
> > >>>
> > >>> CMDLINE="root=/dev/vda console=ttyAMA0"
> > >>> ROOTFS="rootfs.ext2"
> > >>>
> > >>> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
> > >>>          -m 512 -cpu cortex-a57 -no-reboot \
> > >>>          -device tulip,netdev=net0 -netdev user,id=net0 \
> > >>>          -bios QEMU_EFI-aarch64.fd \
> > >>>          -snapshot \
> > >>>          -device virtio-blk-device,drive=d0 \
> > >>>          -drive file=${ROOTFS},if=none,id=d0,format=raw \
> > >>>          -nographic -serial stdio -monitor none \
> > >>>          --append "${CMDLINE}"
> > >>>
> > >>> ---
> > >>> Boot tests with various devices known to work in qemu v5.2.
> > >>>
> > >>>         v5.2    v6.0    v6.0
> > >>>         efi    non-efi    efi
> > >>> e1000        pass    pass    pass
> > >>> e1000-82544gc    pass    pass    pass
> > >>> e1000-82545em    pass    pass    pass
> > >>> e1000e        pass    pass    pass
> > >>> i82550        pass    pass    pass
> > >>> i82557a        pass    pass    pass
> > >>> i82557b        pass    pass    pass
> > >>> i82557c        pass    pass    pass
> > >>> i82558a        pass    pass    pass
> > >>> i82559b        pass    pass    pass
> > >>> i82559c        pass    pass    pass
> > >>> i82559er    pass    pass    pass
> > >>> i82562        pass    pass    pass
> > >>> i82801        pass    pass    pass
> > >>> ne2k_pci    pass    pass    fail    <--
> > >>> pcnet        pass    pass    pass
> > >>> rtl8139        pass    pass    pass
> > >>> tulip        pass    pass    fail    <--
> > >>> usb-net        pass    pass    pass
> > >>> virtio-net-device
> > >>>         pass    pass    pass
> > >>> virtio-net-pci    pass    pass    pass
> > >>> virtio-net-pci-non-transitional
> > >>>         pass    pass    pass
> > >>>
> > >>> usb-xhci    pass    pass    pass
> > >>> usb-ehci    pass    pass    pass
> > >>> usb-ohci    pass    pass    pass
> > >>> usb-uas-xhci    pass    pass    pass
> > >>> virtio        pass    pass    pass
> > >>> virtio-blk-pci    pass    pass    pass
> > >>> virtio-blk-device
> > >>>         pass    pass    pass
> > >>> nvme        pass    pass    pass
> > >>> sdhci        pass    pass    pass
> > >>> dc390        pass    pass    fail    <--
> > >>> am53c974    pass    pass    fail    <--
> > >>> lsi53c895ai    pass    pass    pass
> > >>> mptsas1068    pass    pass    pass
> > >>> lsi53c810    pass    pass    pass
> > >>> megasas        pass    pass    pass
> > >>> megasas-gen2    pass    pass    pass
> > >>> virtio-scsi-device
> > >>>         pass    pass    pass
> > >>> virtio-scsi-pci    pass    pass    pass
> > >>
> > >
> >


