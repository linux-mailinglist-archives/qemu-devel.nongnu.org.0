Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F213D725D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:51:45 +0200 (CEST)
Received: from localhost ([::1]:41044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JkU-0001Fq-QQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m8JjT-0000Vp-Pf
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:50:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m8JjR-0007qH-E0
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:50:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFC496139F
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627379435;
 bh=3HzcB7mzDvHyX9JXPKHtBjd/XhOXxW9BodPOlxSsR+I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B4GlOy/ubBVpGxIb5/8UkNkG7NepT2+39qJ7DXmq83w0kBXypeXC4W22/9HS8ZHru
 A1hbOpZmuhYcfVOHdOrFVJ5+CaHNdUbUBgGf4X3ht1Kwh96G64Rtm3e9bMUvdJOzvf
 dxPyOa3sOMjTXEYjKL0AsRv/i8nRWiXph5qUpjIHywzbGr0PZzWGxrLlxg058HZwfn
 51s7TAlFOav1dVuBRw//0f0/cguq3On6fn/5w2fc28pkm6PksCpDuRPnjgEO/N5ELV
 e+nwtXKECp/BKfaQDSWXaEumFZk8ZPunt8qCZjY3qT7YRDCXaG4LXJ3+IV8tz1g8iU
 Z+hLxtKPGdWyw==
Received: by mail-ot1-f51.google.com with SMTP id
 c7-20020a9d27870000b02904d360fbc71bso12811470otb.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:50:35 -0700 (PDT)
X-Gm-Message-State: AOAM53360/5BwXYPPS4lJXA7UqcH6nmtWUmg/Ab1K9x9KWA1Qt0tE5Z1
 PxPk33K5dW+ml8g7y2RufabT+o1mx7fYyhRwhp0=
X-Google-Smtp-Source: ABdhPJwCPwRpYUhocQpjJLAMZfmXvRnu/YhQfbhRw5J+F3j9tfVlLc0XRZZIKH0eA1SqjRBREGTNBjgDphUR2papVGI=
X-Received: by 2002:a9d:2625:: with SMTP id a34mr14537549otb.77.1627379435222; 
 Tue, 27 Jul 2021 02:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
 <20210727052516-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210727052516-mutt-send-email-mst@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jul 2021 11:50:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHtjZh_n-iBObPTDqdN8oV0DKtpXgRfUApNOYgVeYpCBA@mail.gmail.com>
Message-ID: <CAMj1kXHtjZh_n-iBObPTDqdN8oV0DKtpXgRfUApNOYgVeYpCBA@mail.gmail.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: "Michael S. Tsirkin" <mst@redhat.com>
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
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 11:30, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jul 27, 2021 at 09:04:20AM +0200, Ard Biesheuvel wrote:
> > On Tue, 27 Jul 2021 at 07:12, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> > > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> > > >> (cc Bjorn)
> > > >>
> > > >> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daud=C3=A9 <philmd@=
redhat.com> wrote:
> > > >>>
> > > >>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > > >>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > > >>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> > > >>>>>> Hi all,
> > > >>>>>>
> > > >>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no =
longer
> > > >>>>>> work. Analysis shows that PCI devices with IO ports do not ins=
tantiate
> > > >>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The probl=
em affects
> > > >>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem o=
nly
> > > >>>>>> affects
> > > >>>>>> aarch64, not x86/x86_64.
> > > >>>>>>
> > > >>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Infor=
m os to
> > > >>>>>> keep firmware resource map"). Since this commit, PCI device BA=
R
> > > >>>>>> allocation has changed. Taking tulip as example, the kernel re=
ports
> > > >>>>>> the following PCI bar assignments when running qemu v5.2.
> > > >>>>>>
> > > >>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x0=
20000
> > > >>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > >>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1=
000007f]
> > > >>
> > > >> IIUC, these lines are read back from the BARs
> > > >>
> > > >>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0=
x107f]
> > > >>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > > >>>>>> 0x10000000-0x1000007f]
> > > >>>>>>
> > > >>
> > > >> ... and this is the assignment created by the kernel.
> > > >>
> > > >>>>>> With qemu v6.0, the assignment is reported as follows.
> > > >>>>>>
> > > >>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x0=
20000
> > > >>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > > >>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1=
000007f]
> > > >>>>>>
> > > >>
> > > >> The problem here is that Linux, for legacy reasons, does not suppo=
rt
> > > >> I/O ports <=3D 0x1000 on PCI, so the I/O assignment created by EFI=
 is
> > > >> rejected.
> > > >>
> > > >> This might make sense on x86, where legacy I/O ports may exist, bu=
t on
> > > >> other architectures, this makes no sense.
> > > >
> > > >
> > > > Fixing Linux makes sense but OTOH EFI probably shouldn't create map=
pings
> > > > that trip up existing guests, right?
> > > >
> > >
> > > I think it is difficult to draw a line. Sure, maybe EFI should not cr=
eate
> > > such mappings, but then maybe qemu should not suddenly start to enfor=
ce
> > > those mappings for existing guests either.
> > >
> >
> > EFI creates the mappings primarily for itself, and up until DSM #5
> > started to be enforced, all PCI resource allocations that existed at
> > boot were ignored by Linux and recreated from scratch.
> >
> > Also, the commit in question looks dubious to me. I don't think it is
> > likely that Linux would fail to create a resource tree. What does
> > happen is that BARs get moved around, which may cause trouble in some
> > cases: for instance, we had to add special code to the EFI framebuffer
> > driver to copy with framebuffer BARs being relocated.
> >
> > > For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> > > qemu. That solves my immediate problem, giving us time to find a solu=
tion
> > > that is acceptable for everyone. After all, it doesn't look like anyo=
ne
> > > else has noticed the problem, so there is no real urgency.
> > >
> >
> > I would argue that it is better to revert that commit. DSM #5 has a
> > long history of debate and misinterpretation, and while I think we
> > ended up with something sane, I don't think we should be using it in
> > this particular case.
>
> I think revert might make sense, however:
>
> 0: No (The operating system shall not ignore the PCI configuration that f=
irmware has done
> at boot time. However, the operating system is free to configure the devi=
ces in this hierarchy
> that have not been configured by the firmware. There may be a reduced lev=
el of hot plug
> capability support in this hierarchy due to resource constraints. This si=
tuation is the same as
> the legacy situation where this _DSM is not provided.)
>
> ^^^^ does not this imply that reporting a 0 as we currently do
>      should be mostly a NOP?
>

Not really. The resource allocation strategies are different between
EDK2 and Linux, and as Guenter's testing proves, EDK2 may lay out PCI
resources in a way that interferes with Linux's expectations. The I/O
port 0x0 problem is just one potential issue here: another issue is
resource padding for hotplug, which is important for VMs, not only the
IO/MEM resource allocations, but the bus ranges as well.

>
> 1: Yes (The operating system may ignore the PCI configuration that the fi=
rmware has done
> at boot time, and reconfigure/rebalance the resources in the hierarchy.)
>
>
> So I am debating with myself whether this should be a plain revert or
> return 1 here:
>      /*
>       * 0 - The operating system must not ignore the PCI configuration th=
at
>       *     firmware has done at boot time.
>       */
>      aml_append(ifctx1, aml_return(aml_int(0)));
> -    aml_append(ifctx, ifctx1);
> +    aml_append(ifctx1, aml_return(aml_int(1)));
>      aml_append(method, ifctx);
>

I agree that returning '1' here is a better choice, as it explicitly
gives the OS license to reassign all resources, which is what we have
been relying on to begin with.

OTOH, I do think we should fix arbitrary zero checks in Linux that
make no sense on !x86

>
>
> Guenter what happens if we return 1? Do things work well?
>
> --
> MST
>

