Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667602E85F1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:58:04 +0100 (CET)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvUJ1-0004tw-0l
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvUHu-0003vG-1t; Fri, 01 Jan 2021 18:56:54 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvUHq-00008j-JX; Fri, 01 Jan 2021 18:56:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2320F7470F9;
 Sat,  2 Jan 2021 00:56:45 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B10EE7470E2; Sat,  2 Jan 2021 00:56:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AD43874645F;
 Sat,  2 Jan 2021 00:56:44 +0100 (CET)
Date: Sat, 2 Jan 2021 00:56:44 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 0/5] hw/mips: Fix Fuloong2E to boot Linux guest again
In-Reply-To: <20210101231215.1870611-1-f4bug@amsat.org>
Message-ID: <eb1af512-943e-f65c-d867-3ead1eccb5d5@eik.bme.hu>
References: <20210101231215.1870611-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-487390931-1609545404=:18952"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-487390931-1609545404=:18952
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 2 Jan 2021, Philippe Mathieu-Daudé wrote:
> We closed 2020 with few discussions about the Fuloong 2E board
> (see [1] and [2]).
>
> This series collect the minimum set of patch to have the machine
> booting Linux guest again, including integration tests.
>
> This is sent as RFC because Mark raised some issues in (see [3]
> and previous in this thread) and I don't understand PCI enough
> to intervene.

Thanks for collecting these. Let me summarise the discussion because the 
meaning may have been lost in the seamingly heated debate but I think 
Mark's main concern was that he does not like having a feature flag and 
property setting the emulation to partially emulate the device: either 
only emulating legacy mode or native mode that this patch does but he 
would prefer to faithfully emulate the device preferably allowing 
switching between modes. But that's not easily possible without rewritig 
either the ISA emulation or PCI emulation in QEMU because current code 
does not allow these to be switched once created. That's way more work and 
risk of breaking other things using these fundamental parts that I would 
want to take on. My goal was only to allow using this (otherwise quite 
unused and deglected) device model in pegasos2 emulation which needs 
native mode. But turns out fuloong2e Linux wants legacy mode so we need a 
way to resolve this conflict and the solution was this flag and keeping 
partial emulation depending on machine.

But Mark still considered that a horrible hack but after looking more 
closely he also found the difficulty of implementing a more faithful 
emulation so he would accept the flag at the end but still wanted 
registers to be set more consistently matching what the data sheet and 
whatever ideals would dictate. However I've spent a lot of time before 
finding these values that work with all clients and found some of these 
clients have assumptions instead of working in an ideal world following 
what data sheets say and I don't want to make any changes to this now 
before we also have pegasos2 upstreamed so any change can be more 
throughly tested and I don't have to retest everything for every small 
change just to find something broke,

This was the main reason for disagreement and I think Mark's standards for 
this device was way higher than necessary in this situation and I may have 
got upset to have this pushed back again when we've already went through 
this last March where we also had a long discussion after which Mark 
managed to get rid of the flag but that now came back in a different form. 
(Previously it was switching between fully native and non-100% native 
mode, now it selects legacy or non-100% native mode where legacy is needed 
for fuloong2e linux and non-100% native mode is needed for pegasos2 
guests.) This may not be how the real device work (Mark also has concerns 
about what exactly is non-100% native mode) and it may be a horrible hack 
but it's probably the best that can be done with current QEMU facilities 
and in the time I had and since this is only used on fuloong2e and 
pegasos2 for a few obscure guests I think it does not need any more 
complex solution at the moment.

It seems this disagreement on what's good enough for a device model to get 
in QEMU is the source of disagreement between us with Mark but we'll sort 
that out off list once I finish preparing my pegasos2 patches that will 
finally show where these changes go and oters can also test any proposed 
changes.

Regards,
BALATON Zoltan

> Peter commented a similar PCI issue with the Sam460ex [4] so might
> be able to help us here.
>
> Anyhow, sharing this PoC on the list with the test, the avoid boring
> manual testing.
>
> Regards,
>
> Phil.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769105.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769557.html
> [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769593.html
> [4] https://www.mail-archive.com/qemu-devel@nongnu.org/msg769697.html
>
> BALATON Zoltan (1):
>  ide: Make room for flags in PCIIDEState and add one for legacy mode
>
> Guenter Roeck (1):
>  via-ide: Fix fuloong2e support
>
> Jiaxun Yang (1):
>  tests/acceptance: Test boot_linux_console for fuloong2e
>
> Philippe Mathieu-Daudé (2):
>  hw/pci-host/bonito: Remap PCI "lo" regions when PCIMAP reg is modified
>  tests/integration: Test Fuloong2E IDE drive, run userspace commands
>
> include/hw/ide/pci.h                   |  7 +++-
> hw/ide/cmd646.c                        |  6 ++--
> hw/ide/via.c                           | 19 ++++++++--
> hw/mips/fuloong2e.c                    |  4 ++-
> hw/pci-host/bonito.c                   | 49 +++++++++++++++++++-------
> hw/sparc64/sun4u.c                     |  2 +-
> tests/acceptance/boot_linux_console.py | 47 ++++++++++++++++++++++++
> 7 files changed, 113 insertions(+), 21 deletions(-)
>
> --
> 2.26.2
>
>
>
--3866299591-487390931-1609545404=:18952--

