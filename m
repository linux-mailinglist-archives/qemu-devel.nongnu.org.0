Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998956AD31A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:00:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKkk-0003kx-3v; Mon, 06 Mar 2023 19:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZKkg-0003hi-AW; Mon, 06 Mar 2023 19:00:24 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZKke-00023L-8m; Mon, 06 Mar 2023 19:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ycp0007RUoLKixvEsQS0wYwIg3XL8ZZEofrv4F+th0=; b=q3gYcFreWk1+Bph3pJS+6AJfko
 j0oEFl+84TNs0kDPEBLtWdGijdCMFvArruwcrD7hhBBD7TriZb3UuGgCofEkq8BYSf+Y040gzytlE
 oxht7JxUxfm6PdyoZqfXqrxhmjVl6dLZD/ggnfVh7+0BuDw+HhB/j4z1sE8rj09kvGgIgjjSwxpgj
 3jjHEr1aUFkiZroNxaIYlGQrCTD3g1jPVEjFMTm3hrdc7PjaxyCRfCZ7Jb2EypJGsL1oWTV/2eSws
 FPWLY0/8NvkxDOGjPFzuelXA6ruuGUl4KsdYXmtGy5w18Xslcx8N1CcVNbT4/q3PYkqLnv22KHHuA
 oOrk1M0g8tNWFGB+ddLciVrdw1cWiXtaDQ18gD8KEUBJ18qrY+tmHtk7m8TB3qjGQXRyIAodV7Lpg
 9XMunVfSw4qi6uLkbWxe2yHCR7kbf5n3GyjvkdjXWHPpAB+Bhdmn3kX98s56Ha0juZut1I9W608B1
 ryLExHsjxtyVjl+r8TvdJWDf1IP7YQBPQeKoQYdSwoTaqAU6JTNGE/rNH9naeLihcVXqiGFKqGQwG
 AO1pLiuqTRRE4VNcTvRbiFpL6STFUnUIfJ0wQm5rhs55z0zwJ0F5HmVD5xzowjhFIy6Iu4Jg8KP2v
 SiVT2KHA/8rw9MQRM6rk9yRpr8OOPoT8k6by/damI=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZKjh-0000xc-SU; Mon, 06 Mar 2023 23:59:22 +0000
Message-ID: <3497a0d0-49d5-f884-51ee-6e2ab22c77b1@ilande.co.uk>
Date: Mon, 6 Mar 2023 23:59:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230304114043.121024-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 04/03/2023 11:40, Bernhard Beschow wrote:

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
>    hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
>    hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
>    hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
>    hw/pci/pci: Remove multifunction parameter from
>      pci_create_simple_multifunction()
>    hw/pci/pci: Remove multifunction parameter from
>      pci_new_multifunction()
> 
>   include/hw/pci/pci.h |  4 +---
>   hw/alpha/dp264.c     |  8 +++++---
>   hw/i386/pc_piix.c    |  2 +-
>   hw/i386/pc_q35.c     | 10 +++++-----
>   hw/isa/vt82c686.c    |  3 ++-
>   hw/mips/boston.c     |  3 +--
>   hw/mips/fuloong2e.c  |  9 +++++----
>   hw/mips/malta.c      |  2 +-
>   hw/pci-host/sabre.c  |  6 ++----
>   hw/pci/pci.c         | 18 ++++++++++++------
>   hw/ppc/pegasos2.c    |  9 +++++----
>   hw/ppc/prep.c        |  4 +++-
>   hw/sparc64/sun4u.c   |  5 ++---
>   13 files changed, 45 insertions(+), 38 deletions(-)

Thanks for doing this! The patches basically look good, the only minor niggle is that 
normally wiring of gpios is done *after* realize() for consistency because some 
qdev_init_gpio_*() functions may use a property to define the gpio array size.

Having said that it is a nice tidy-up, so I'd be okay with patches 1-3 if you added a 
small comment above the qdev_connect_gpio_out() lines pointing out that this is a 
temporary solution (hack?) until the 8259 device is converted to use gpios.

However given that Phil wrote the patches I'd wait for him to decide whether he'd 
prefer a plain revert over the changes in this series before going ahead with a v2.

Finally I think patches 4-5 are good, however given how close we are to freeze I'd 
drop them for now and present them as a separate series at the start of the 8.1 dev 
cycle when everyone has a bit more breathing space.


ATB,

Mark.

