Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03C4031A0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 01:49:17 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNkq4-0005CS-CE
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 19:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1mNkoO-0004Vu-Ln
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:47:32 -0400
Received: from foss.arm.com ([217.140.110.172]:60656)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>) id 1mNkoL-0001EM-EZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:47:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D8926D;
 Tue,  7 Sep 2021 16:47:26 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A22F33F73D;
 Tue,  7 Sep 2021 16:47:25 -0700 (PDT)
Date: Wed, 8 Sep 2021 00:47:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Adam Lackorzynski <adam@l4re.org>
Subject: Re: arm: Launching EFI-enabled arm32 Linux
Message-ID: <20210908004710.7fd6e07a@slackpad.fritz.box>
In-Reply-To: <YTf00ErKBqiDz9ZG@os.inf.tu-dresden.de>
References: <YTPIdbUCmwagL5/D@os.inf.tu-dresden.de>
 <20210906163403.7b091544@slackpad.fritz.box>
 <YTf00ErKBqiDz9ZG@os.inf.tu-dresden.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sep 2021 01:25:04 +0200
Adam Lackorzynski <adam@l4re.org> wrote:

Hi Adam,

> On Mon Sep 06, 2021 at 16:34:03 +0100, Andre Przywara wrote:
> > On Sat, 4 Sep 2021 21:26:45 +0200
> > Adam Lackorzynski <adam@l4re.org> wrote:
> >=20
> > Hi Adam,
> >  =20
> > > while trying to launch an EFI-enabled arm32 Linux binary (zImage) I
> > > noticed I get an undefined instruction exception on the first
> > > instruction. Now this is a bit special because Linux uses a nop
> > > instruction there that also is a PE file signature ('MZ') such that t=
he
> > > CPU runs over it and the file is still recognized as a PE binary. Lin=
ux
> > > uses 0x13105a4d (tstne r0, #0x4d000) as the instruction (see also
> > > arch/arm/boot/compressed/head.S and efi-header.S in Linux).
> > > However, QEMU's instruction decoder will only recognize TST with bits
> > > 12-15 being 0, which this instruction is not fullfilling, and thus the
> > > undef exception. I guess other CPU implementations will allow this
> > > encoding. So while investigating I was doing the following to make Li=
nux
> > > proceed. I also believe this was working in a previous version of QEM=
U.
> > >=20
> > > diff --git a/target/arm/a32.decode b/target/arm/a32.decode
> > > index fcd8cd4f7d..222553750e 100644
> > > --- a/target/arm/a32.decode
> > > +++ b/target/arm/a32.decode
> > > @@ -127,7 +127,7 @@ ADD_rri          .... 001 0100 . .... .... ......=
......       @s_rri_rot
> > >  ADC_rri          .... 001 0101 . .... .... ............       @s_rri=
_rot
> > >  SBC_rri          .... 001 0110 . .... .... ............       @s_rri=
_rot
> > >  RSC_rri          .... 001 0111 . .... .... ............       @s_rri=
_rot
> > > -TST_xri          .... 001 1000 1 .... 0000 ............       @S_xri=
_rot
> > > +TST_xri          .... 001 1000 1 .... ---- ............       @S_xri=
_rot
> > >  TEQ_xri          .... 001 1001 1 .... 0000 ............       @S_xri=
_rot
> > >  CMP_xri          .... 001 1010 1 .... 0000 ............       @S_xri=
_rot
> > >  CMN_xri          .... 001 1011 1 .... 0000 ............       @S_xri=
_rot
> > >=20
> > >=20
> > > Any thoughts on this? =20
> >=20
> > thanks for the report, I was looking at this and have a kernel patch
> > to fix this properly as Peter suggested. And while I agree on the
> > problem, I was struggling to reproduce this in reality: both with
> > -kernel and when booting through U-Boot the "Z" bit is set, which lets
> > QEMU not even bother about the rest of the encoding - the condition
> > flags don't match, so it proceeds. If I change the __nop to use "tsteq",
> > I see it hanging due to the missing exception handler, but not with
> > "tstne".
> > So can you say how you spotted this issue? This would be needed as a
> > justification for patching the guts of the ARM Linux kernel port. =20
>=20
> Good point with the condition flags. I'm doing this with our own vmm
> where I'm loading the binary directly as the payload (as mandated by the
> header), and where psr is set to a defined value with all flags cleared.

Right, I was thinking something like this.

> If I set the Z bit than it also works (of course).
> Looking a bit around in QEMU as well as u-boot I it looks like this is
> rather by luck how flags are set.

Yes, the kernel boot protocol doesn't say anything about the condition
flags, so any combination would be valid and we were just lucky before.
I did also test on an Cortex-A7 and A53, both ignore bits [15:12] (so
execute the instruction as if they were 0), which explains why it works
on real hardware.

> Thanks for doing the Linux patch, I'll scrap mine, and also thanks to
> Peter for the idea!

Oh, didn't want to cut you off, if you want to have the commit: be my
guest!
Otherwise I will send something tomorrow, with a Reported-by: to you.

Gr=C3=BC=C3=9Fe an die Elbe!

Cheers,
Andre

