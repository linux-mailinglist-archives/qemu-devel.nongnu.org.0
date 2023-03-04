Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2D6AAA17
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 14:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYRxT-00011g-Lg; Sat, 04 Mar 2023 08:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYRxR-00011S-9T; Sat, 04 Mar 2023 08:29:53 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pYRxO-0004n9-99; Sat, 04 Mar 2023 08:29:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 63C007462DB;
 Sat,  4 Mar 2023 14:29:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1C8647457E7; Sat,  4 Mar 2023 14:29:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 192357456E3;
 Sat,  4 Mar 2023 14:29:40 +0100 (CET)
Date: Sat, 4 Mar 2023 14:29:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
Message-ID: <9fe57041-7b4c-5cec-cb7e-f91b5403eb53@eik.bme.hu>
References: <20230304114043.121024-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 4 Mar 2023, Bernhard Beschow wrote:
> A recent series [1] attempted to remove some PIC -> CPU interrupt indirections.
> This inadvertantly caused NULL qemu_irqs to be passed to the i8259 because the
> qemu_irqs aren't initialized at that time yet. This series provides a fix by
> initializing the qemu_irq of the respective south bridges before they
> are passed to i2859_init().
>
> Furthermore -- as an optional extension -- this series also fixes some usability
> issues in the API for creating multifunction PCI devices.
>
> The series is structured as follows: The first three commits fix the
> regressions, the last two fix the public API for creating multifunction PCI
> devices.
>
> [1] https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro.org/
>
> Bernhard Beschow (5):
>  hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
>  hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
>  hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
>  hw/pci/pci: Remove multifunction parameter from
>    pci_create_simple_multifunction()
>  hw/pci/pci: Remove multifunction parameter from
>    pci_new_multifunction()

I'd postopne the last two API change patches to the next release. Ideally 
the device itself should know if it's multifunction or not and the board 
instantiating it should not do anything different than instantiating a 
single function device so we's only need pci_new or pci_create_simple 
without multifunction parameter or variant. So my question is why do we 
need these at all and could this be simplified more? But there's not 
enough time to answer that now so I'd ask to leave these alone for now and 
come back to this in next devel cycle.

The other 3 patches fix a breakaga in current master so can be considered 
but I'd need to know a decision if this will be taken or a revert as I 
need to rebase my pending patches accordingly. A maintainer please speak 
up here.

Regards,
BALATON Zoltan

> include/hw/pci/pci.h |  4 +---
> hw/alpha/dp264.c     |  8 +++++---
> hw/i386/pc_piix.c    |  2 +-
> hw/i386/pc_q35.c     | 10 +++++-----
> hw/isa/vt82c686.c    |  3 ++-
> hw/mips/boston.c     |  3 +--
> hw/mips/fuloong2e.c  |  9 +++++----
> hw/mips/malta.c      |  2 +-
> hw/pci-host/sabre.c  |  6 ++----
> hw/pci/pci.c         | 18 ++++++++++++------
> hw/ppc/pegasos2.c    |  9 +++++----
> hw/ppc/prep.c        |  4 +++-
> hw/sparc64/sun4u.c   |  5 ++---
> 13 files changed, 45 insertions(+), 38 deletions(-)
>
> --
> 2.39.2
>
>
>

