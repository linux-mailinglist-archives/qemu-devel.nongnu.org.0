Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C43D8F03
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:27:31 +0200 (CEST)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8jas-0008R5-V1
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m8jZ0-000669-6H
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:25:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:54368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m8jYt-000796-3O
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:25:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEA9561038
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627478724;
 bh=oinS7Hs3YKN7EU6+38YDd9wP4boZkQDiZHj1el9aZrk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pSt0Jlh7nQ/mTsvFQl3ZXauBh98rViSG4UOEf2ANPR0qdhh8nG9N9dFljnsXU2xlw
 /P2nmAr6J7sXRRKMAG7G3sPMPTKQGg0YjFYz8Y8FyvkDPCyNfW/vbULpZH8cwoyjBv
 KjrV5Z+MBL1ie/AOKeEhcXsJHPGKpazpANBASWnoxt4Ml8VA3E1xZ+2GGz8Wak1XDa
 yUULr4pMkvujTFgkJab22FjDG26kRk7Rg98NMjaGPiUgTOnlPJdPTY55nC/NZfjluK
 /Tppy4g/XlDHgZu1TX87xn6RY/V5sTIg0xaFaegYdz0uJRJbG8ubGb3vjiMfBx6FxP
 Th2+aN1t/IOGQ==
Received: by mail-oi1-f169.google.com with SMTP id x15so3684282oic.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:25:24 -0700 (PDT)
X-Gm-Message-State: AOAM5330I310TloNf3YDLb6saRWANHzNGxwzSQNoUulXci+OjB4Fki8t
 L7ALum4YZ45wWxX8p7BrrANh0dva41ZNI+GYnNk=
X-Google-Smtp-Source: ABdhPJyh6f3DF8zVH5iP6Bj5IQXHkAFAQuV+tK8lTTJzfK8sWnmtJhR5cYevOLZ2m02lzX7cD3DIrq1vSVaicbfcLZw=
X-Received: by 2002:aca:d64d:: with SMTP id n74mr6593830oig.47.1627478724222; 
 Wed, 28 Jul 2021 06:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
 <20210728090555-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210728090555-mutt-send-email-mst@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 28 Jul 2021 15:25:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
Message-ID: <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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

On Wed, 28 Jul 2021 at 15:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jul 27, 2021 at 12:36:03PM +0200, Igor Mammedov wrote:
> > On Tue, 27 Jul 2021 05:01:23 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >
> > > On Mon, Jul 26, 2021 at 10:12:38PM -0700, Guenter Roeck wrote:
> > > > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> > > > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> > > > > > (cc Bjorn)
> > > > > >
> > > > > > On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daud=C3=A9 <phil=
md@redhat.com> wrote:
> > > > > > >
> > > > > > > On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > > > > > > > On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > > > > > > > > On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck w=
rote:
> > > > > > > > > > Hi all,
> > > > > > > > > >
> > > > > > > > > > starting with qemu v6.0, some of my aarch64 efi boot te=
sts no longer
> > > > > > > > > > work. Analysis shows that PCI devices with IO ports do =
not instantiate
> > > > > > > > > > in qemu v6.0 (or v6.1-rc0) when booting through efi. Th=
e problem affects
> > > > > > > > > > (at least) ne2k_pci, tulip, dc390, and am53c974. The pr=
oblem only
> > > > > > > > > > affects
> > > > > > > > > > aarch64, not x86/x86_64.
> > > > > > > > > >
> > > > > > > > > > I bisected the problem to commit 0cf8882fd0 ("acpi/gpex=
: Inform os to
> > > > > > > > > > keep firmware resource map"). Since this commit, PCI de=
vice BAR
> > > > > > > > > > allocation has changed. Taking tulip as example, the ke=
rnel reports
> > > > > > > > > > the following PCI bar assignments when running qemu v5.=
2.
> > > > > > > > > >
> > > > > > > > > > [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 cl=
ass 0x020000
> > > > > > > > > > [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-=
0x007f]
> > > > > > > > > > [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000=
000-0x1000007f]
> > > > > >
> > > > > > IIUC, these lines are read back from the BARs
> > > > > >
> > > > > > > > > > [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0=
x1000-0x107f]
> > > > > > > > > > [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > > > > > > > > > 0x10000000-0x1000007f]
> > > > > > > > > >
> > > > > >
> > > > > > ... and this is the assignment created by the kernel.
> > > > > >
> > > > > > > > > > With qemu v6.0, the assignment is reported as follows.
> > > > > > > > > >
> > > > > > > > > > [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 cl=
ass 0x020000
> > > > > > > > > > [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-=
0x007f]
> > > > > > > > > > [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000=
000-0x1000007f]
> > > > > > > > > >
> > > > > >
> > > > > > The problem here is that Linux, for legacy reasons, does not su=
pport
> > > > > > I/O ports <=3D 0x1000 on PCI, so the I/O assignment created by =
EFI is
> > > > > > rejected.
> > > > > >
> > > > > > This might make sense on x86, where legacy I/O ports may exist,=
 but on
> > > > > > other architectures, this makes no sense.
> > > > >
> > > > >
> > > > > Fixing Linux makes sense but OTOH EFI probably shouldn't create m=
appings
> > > > > that trip up existing guests, right?
> > > > >
> > > >
> > > > I think it is difficult to draw a line. Sure, maybe EFI should not =
create
> > > > such mappings, but then maybe qemu should not suddenly start to enf=
orce
> > > > those mappings for existing guests either.
> > >
> > > I would say both. But about QEMU actually I think you have a point he=
re.
> > > Re-reading the spec:
> > >
> > > 0: No (The operating system shall not ignore the PCI configuration th=
at firmware has done
> > > at boot time. However, the operating system is free to configure the =
devices in this hierarchy
> > > that have not been configured by the firmware. There may be a reduced=
 level of hot plug
> > > capability support in this hierarchy due to resource constraints. Thi=
s situation is the same as
> > > the legacy situation where this _DSM is not provided.)
> > > 1: Yes (The operating system may ignore the PCI configuration that th=
e firmware has done
> > > at boot time, and reconfigure/rebalance the resources in the hierarch=
y.)
> > >
> > >
> > > I think I misread the spec previously, and understood it to mean that
> > > 1 means must ignore. In fact 1 gives the most flexibility.
> > > So why are we suddenly telling the guest it must not override
> > > firmware?
> > >
> > > The commit log says
> > >     The diffences could result in resource assignment failure.
> > >
> > > which is kind of vague ...
> > >
> > > Jiahui Cen, Igor, what do you think about it?
> > > I'm inclined to revert 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14
> > > at least for now.
> > Looking at patch history, it seems consensus was that it's better to
> > enforce firmware allocations.
> >
> > Also letting OS do as it pleases might break PCI devices that
> > don't tolerate reallocation. ex: firmware initializes PCI device
> > IO/BARs and then fetches ACPI tables, which get patched with
> > assigned resources.
> >
> > to me returning 0 seems to be correct choice.
> > In addition resource hinting also works via firmware allocations,
> > if we revert the commit it might change those configs.
>
>
> Well if firmware people now tell us their allocations were never
> intended for guest OS use then maybe we should not intervene.
>

DSM #5 was introduced to permit firmware running on x86_64 systems to
boot 32-bit OSes (read Windows) unmodified, while still leaving
enlightened, 64-bit OSes the opportunity to reorganize the BARs if
there is sufficient space in the resource windows, and if the OS runs
in long mode so it can address all of it.

This is why the default-if-absent according to the spec is '0', and I
already explained up-thread why arm64 deviates from this.

But Igor has a point: there are cases where especially bus numbers
should not be touched, as firmware tables consumed by the OS may carry
b/d/f identifiers for things like SMMU pass through, where changing
the bus numbers obviously invalidates this information.

These are exceptional cases, though, and I would argue that these
should be considered individually, rather than setting DSM #5 to 0x0
simply because there might be cases where not doing so could
theoretically break things, given that doing so has proven to break
things.


> As others noted the original commit was kind of vague:
>
> 1. it said "Using _DSM #5 method to inform guest os not to ignore the PCI=
 configuration
> that firmware has done at boot time could handle the differences."
> which is not what the spec says and not what the patch did -
> guest os does not ignore configuration even without this,
> it is just allowed to change it.
>
>
> 2. is says could result but does not report whether that happened in the
> field.
>
>
> Given this causes a regression I'm inclined to just revert for now.
> We can figure it out for the next release.
>

For a revert of commit 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14, feel
free to include

Acked-by: Ard Biesheuvel <ardb@kernel.org>

and please also involve me if any future debates on this subject flare up a=
gain.

--=20
Ard.

>
> >
> > me wonders if there is a way make enforcement per device.
>
> devices shouldn't normally care by the spec.
>
>
> > > > For my own testing, I simply reverted commit 0cf8882fd0 in my copy =
of
> > > > qemu. That solves my immediate problem, giving us time to find a so=
lution
> > > > that is acceptable for everyone. After all, it doesn't look like an=
yone
> > > > else has noticed the problem, so there is no real urgency.
> > > >
> > > > Thanks,
> > > > Guenter
> > >
> > > Well it's not like we have an army of testers, I think we should
> > > treat each problem report seriously ...
> > >
>

