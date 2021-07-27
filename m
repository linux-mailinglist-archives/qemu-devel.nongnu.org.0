Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E93D6FEB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 09:05:57 +0200 (CEST)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8HA4-0007yN-GG
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 03:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m8H8n-0007DJ-P4
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:04:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:52748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1m8H8l-000245-5K
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:04:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3DBF6112D
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627369472;
 bh=lUqVfQgBY2zWG8CvX/dY83EP7TtxDwDynTqaNApa7YM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f/9Vt339iCkSjGY5H9z2afA+MRLT+O8Otk5SPyVwp0RkXdPGGDa0VBP+OeKwKhxaG
 xiJD0G6stCWpoKj7S6BhKC56leClQ7P/2XZUOQbH7EnKZVfMa0Ult1QZIbl8oCwFUc
 FFjCsnLVKsBP6NZ9L+L60sjVudh8aCoikdpI32wwiVUpu1VRusZQ+LmCOnPck1JRRY
 M8+KsIyYB3BTjuu/IoxZB6oTXoW3pQ4fwwB4vsXmKNaGHWrfLanVyP0dRjvRiG/f5B
 o1mmyDbnNfLeD2pLu+BADisNXO3IbUfgxLWkmYEChf+VMkb3/ZNfIr9qy9lp6F3Msr
 V2SjM8PfZXn0A==
Received: by mail-ot1-f54.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so11566673ott.9
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 00:04:32 -0700 (PDT)
X-Gm-Message-State: AOAM532hD3Tsp3WVKic5AkjZwfMxle57dH5cL6d0jiizKRWrO+6Teotl
 9TjVsvMuDU0EHeTsnxyw0VIQCSRJnjh4uwj+Rz4=
X-Google-Smtp-Source: ABdhPJxcVAdmMcddF7bjASVwweQadI0N/uf32j8O7RjmDaI5mxOu57YPpSO6k82hrQydK5Aruv+LxvsUjm4Z7/PbD8c=
X-Received: by 2002:a05:6830:2316:: with SMTP id
 u22mr14486892ote.90.1627369472218; 
 Tue, 27 Jul 2021 00:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
In-Reply-To: <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jul 2021 09:04:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
Message-ID: <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: Guenter Roeck <linux@roeck-us.net>
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
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 07:12, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> >> (cc Bjorn)
> >>
> >> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com> wrote:
> >>>
> >>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
> >>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> >>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> >>>>>> Hi all,
> >>>>>>
> >>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no long=
er
> >>>>>> work. Analysis shows that PCI devices with IO ports do not instant=
iate
> >>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem a=
ffects
> >>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> >>>>>> affects
> >>>>>> aarch64, not x86/x86_64.
> >>>>>>
> >>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os=
 to
> >>>>>> keep firmware resource map"). Since this commit, PCI device BAR
> >>>>>> allocation has changed. Taking tulip as example, the kernel report=
s
> >>>>>> the following PCI bar assignments when running qemu v5.2.
> >>>>>>
> >>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x02000=
0
> >>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> >>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x10000=
07f]
> >>
> >> IIUC, these lines are read back from the BARs
> >>
> >>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107=
f]
> >>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> >>>>>> 0x10000000-0x1000007f]
> >>>>>>
> >>
> >> ... and this is the assignment created by the kernel.
> >>
> >>>>>> With qemu v6.0, the assignment is reported as follows.
> >>>>>>
> >>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x02000=
0
> >>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> >>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x10000=
07f]
> >>>>>>
> >>
> >> The problem here is that Linux, for legacy reasons, does not support
> >> I/O ports <=3D 0x1000 on PCI, so the I/O assignment created by EFI is
> >> rejected.
> >>
> >> This might make sense on x86, where legacy I/O ports may exist, but on
> >> other architectures, this makes no sense.
> >
> >
> > Fixing Linux makes sense but OTOH EFI probably shouldn't create mapping=
s
> > that trip up existing guests, right?
> >
>
> I think it is difficult to draw a line. Sure, maybe EFI should not create
> such mappings, but then maybe qemu should not suddenly start to enforce
> those mappings for existing guests either.
>

EFI creates the mappings primarily for itself, and up until DSM #5
started to be enforced, all PCI resource allocations that existed at
boot were ignored by Linux and recreated from scratch.

Also, the commit in question looks dubious to me. I don't think it is
likely that Linux would fail to create a resource tree. What does
happen is that BARs get moved around, which may cause trouble in some
cases: for instance, we had to add special code to the EFI framebuffer
driver to copy with framebuffer BARs being relocated.

> For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> qemu. That solves my immediate problem, giving us time to find a solution
> that is acceptable for everyone. After all, it doesn't look like anyone
> else has noticed the problem, so there is no real urgency.
>

I would argue that it is better to revert that commit. DSM #5 has a
long history of debate and misinterpretation, and while I think we
ended up with something sane, I don't think we should be using it in
this particular case.

