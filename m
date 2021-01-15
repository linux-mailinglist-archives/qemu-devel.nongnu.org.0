Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C002F705F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 03:10:08 +0100 (CET)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0EYx-0000BT-HH
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 21:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0EX4-0007Sv-L8; Thu, 14 Jan 2021 21:08:10 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0EX0-0006ur-9w; Thu, 14 Jan 2021 21:08:10 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id g4so3653173ybo.11;
 Thu, 14 Jan 2021 18:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ytTcU+ACdDlta92LVwOejJs4RVgArWGyGwqbmbKEt8=;
 b=MN4KN0+vId7zqjcI+qAjtxlnAeI10lmNJ2uYba2MvXE0lrin6tPo44ETrRAeiVUlzH
 +3BiPFeWYH8/NEhwr7gQAnCIuzRtbSFtLU8Q0/nIZ2ryjGEbIQVpiEHwMDYkzZ+1mhB8
 pHQjF2OW9M5SJ8Cm3F6H0/nCrkNZI6bZlIw01a+uYN1gunGPuiuWHtSnH1q/6lbpuvVq
 rrK/tsCoxhNyzBwFVngHaTAaLRy24rIeeuozDVgimab7HJpS1uw3BGbDd3M21UouhYAf
 VyTg0Y9ZjF9bNc2Ac2WU7EA5Pi0ak4YtKZYLZA/nfL1wanGKkjB8CjJjETzqxQttJQjH
 5gCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ytTcU+ACdDlta92LVwOejJs4RVgArWGyGwqbmbKEt8=;
 b=BH+mtRiMp/LkpDCwnFrjxbBusuMJ27onmiq0v8zmu8LLCLX8FCMcGBpATcbs6U6Jkh
 lgz/FjIDjYl4fqq3TWF3YDkeUDdHXI2ZuzB8ZIiT8JKsjzc9S9u0W9kx0GVgnSPJqduz
 6n6XoytBNzk9Fjk664Wk7FhvKKowC8tiYVGfHdC4lcp09kNKb1qVt5E1Cfot91AFwMn+
 m9Tc/zrGzxR3Hd7Y9/cKhVIAvVly6bQPOcHc0YqPcefTOwoaEi3c4XY7VIMsY/1/8/Xj
 pJvDhgt5QqA8KdnAy7UdAwqaoRZDd4eTgYxmmDJ/9kQv5dvMcdsA8VTIHDDQD81ZK53p
 d85A==
X-Gm-Message-State: AOAM530njL7KYom24wcpGSHdqKe/aQGzmXWLn6EPnuIKIMVwTRhC6ow0
 u6wFhrzIzevSCc6cMvkCvIxgHjUdKMCmR63BZgU=
X-Google-Smtp-Source: ABdhPJzKwerT6pjKGERBWAb7oQljL6eYTxoudycR0zltGOOQbqvc5exQQ3LmosFuAsDK55MAuPr/nF3K/qI1bWBIfwQ=
X-Received: by 2002:a25:2041:: with SMTP id g62mr15432022ybg.152.1610676484692; 
 Thu, 14 Jan 2021 18:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
In-Reply-To: <20210114181300.GA29923@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 10:07:52 +0800
Message-ID: <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The m25p80 model uses s->needed_bytes to indicate how many follow-up
> > bytes are expected to be received after it receives a command. For
> > example, depending on the address mode, either 3-byte address or
> > 4-byte address is needed.
> >
> > For fast read family commands, some dummy cycles are required after
> > sending the address bytes, and the dummy cycles need to be counted
> > in s->needed_bytes. This is where the mess began.
> >
> > As the variable name (needed_bytes) indicates, the unit is in byte.
> > It is not in bit, or cycle. However for some reason the model has
> > been using the number of dummy cycles for s->needed_bytes. The right
> > approach is to convert the number of dummy cycles to bytes based on
> > the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
>
> While not being the original implementor I must assume that above solution was
> considered but not chosen by the developers due to it is inaccuracy (it
> wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
> meaning that if the controller is wrongly programmed to generate 7 the error
> wouldn't be caught and the controller will still be considered "correct"). Now
> that we have this detail in the implementation I'm in favor of keeping it, this
> also because the detail is already in use for catching exactly above error.
>

I found no clue from the commit message that my proposed solution here
was ever considered, otherwise all SPI controller models supporting
software generation should have been found out seriously broken long
time ago!

The issue you pointed out that we require the total number of dummy
bits should be multiple of 8 is true, that's why I added the
unimplemented log message in this series (patch 2/3/4) to warn users
if this expectation is not met. However this will not cause any issue
when running U-Boot or Linux, because both spi-nor drivers expect the
same assumption as we do here.

See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_data(),
there is a logic to calculate the dummy bytes needed for fast read
command:

    /* convert the dummy cycles to the number of bytes */
    op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;

Note the default dummy cycles configuration for all flashes I have
looked into as of today, meets the multiple of 8 assumption. On some
flashes the dummy cycle number is configurable, and if it's been
configured to be an odd value, it would not work on U-Boot/Linux in
the first place.

> >
> > Things get complicated when interacting with different SPI or QSPI
> > flash controllers. There are major two cases:
> >
> > - Dummy bytes prepared by drivers, and wrote to the controller fifo.
> >   For such case, driver will calculate the correct number of dummy
> >   bytes and write them into the tx fifo. Fixing the m25p80 model will
> >   fix flashes working with such controllers.
>
> Above can be fixed while still keeping the detailed dummy cycle implementation
> inside m25p80. Perhaps one of the following could be looked into: configurating
> the amount, letting the spi ctrl fetch the amount from m25p80 or by inheriting
> some functionality handling this in the SPI controller. Or a mixture of above.

Please send patches to explain this in detail how this is going to
work. I am open to all possible solutions.

>
> > - Dummy bytes not prepared by drivers. Drivers just tell the hardware
> >   the dummy cycle configuration via some registers, and hardware will
> >   automatically generate dummy cycles for us. Fixing the m25p80 model
> >   is not enough, and we will need to fix the SPI/QSPI models for such
> >   controllers.
> >
> > This series fixes the mess in the m25p80 from the flash side first,
>
> Considering the problems solved by the solution in tree I find m25p80 pretty
> clean, at least I don't see any clearly better way for accurately modeling the
> dummy clock cycles. Counting bits instead of bytes would for example still
> force the controllers to mark which bits to count (when transmitting one dummy
> byte from a txfifo on four lines (Quad command) it generates 2 dummy clock
> cycles since it takes two cycles to transfer 8 bits).
>

SPI is a bit based protocol, not bytes. If you insist on bit modeling
with the dummy cycles then you should also suggest we change all
cycles (including command/addr/dummy/data phases) to be modeled with
bits. That way we can accurately emulate everything, for example one
potential problem like transferring 9 bit in the data phase.

However modeling everything with bit is super inefficient. My view is
that we should avoid trying to support uncommon use cases (like not
multiple of 8 for dummy bits) in QEMU.

Regards,
Bin

