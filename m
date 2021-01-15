Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741322F7E64
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:39:52 +0100 (CET)
Received: from localhost ([::1]:59000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QGV-0005O8-Gl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0QFG-0004Q0-Q1; Fri, 15 Jan 2021 09:38:34 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0QFE-0002OP-CF; Fri, 15 Jan 2021 09:38:34 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id k4so5216518ybp.6;
 Fri, 15 Jan 2021 06:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VvweCqDZRlAevjUrDbgsRM1GiPcEDvH69lmfCC89iY=;
 b=QfpeyqQn17DAW6rncpyCAwX5bA2P01iogNSVos6anQyiyVM6mvHE0Svi1uF7MicKC0
 ndApnzlwltigtoZbHzYXBLpeiaU8Xdme2jvsHqCHGmMd4cr0gUjFApZtVXDkReqbp2xw
 eI+vyOnF4/Qql+pKhPu9V6741ynwT6c+K6Q4oj07/fk7TkGoTJCK8LNeSnmtjmEqxh1y
 0fvk9bQG5BFgK+wTX1z898S8CjSVLskQxy4lIkURPyizTpzx+AJus3vDNBtMNcjQpFym
 un4zwyeV7ALWSkUyY9HGwawdGl8H5uGqV9a9iAOJoy27aYSFTKzUGakj4edXSRZRBbZH
 /EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VvweCqDZRlAevjUrDbgsRM1GiPcEDvH69lmfCC89iY=;
 b=FJGN9yWjsloOr4DqSEG8T00HL+K0SG3oAcAZnLif98Fcin6OnB+En+gNJn68hdBtlP
 g2Zolye6NZdVAL4L0Rmuy3yMMXCqUYIRDG057PK5Ul108gEHCTbWzyNT3Hu1f0xIki7r
 csTvuvqBWNVMyhPm8ik3AQORpxOn3gBn2vCta35JTELOVNsk+4NmlE7AIyzWjiqmJT5Y
 D1beszO/8p49AYlwJs8IvQabmAPFkl1rmL0DHO04XT/lrNSs610QOIqXk6+I4xLFFOJ6
 ykL9iaSf/8GWeDrx5CuxoBkPCaZjEN3sn/eCT4tifdnhh6pXW+khQ6GrU4gW49iTfKv3
 iQyg==
X-Gm-Message-State: AOAM532e6LmwGmxPFNLZ1q/7PiSeQzESFB1PkQuSCsFrjAKxSU3Yt5dN
 4vLAM50tWDne4tcM8o4Yne86BiWUf+SAYtCdyQA=
X-Google-Smtp-Source: ABdhPJxd/BwKs+JS+9wOwD/d/k3E0ZiiM7YPehUfOsn//E66TIahN6CC/FHlE9NWlUKSSI1CcHBsAPfIPkvcvw+6BNs=
X-Received: by 2002:a25:2a86:: with SMTP id
 q128mr13724478ybq.387.1610721510468; 
 Fri, 15 Jan 2021 06:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
 <20210115122627.GB29923@fralle-msi>
In-Reply-To: <20210115122627.GB29923@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 22:38:18 +0800
Message-ID: <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > Hi Francisco,
> >
> > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > <frasse.iglesias@gmail.com> wrote:
> > >
> > > Hi Bin,
> > >
> > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > The m25p80 model uses s->needed_bytes to indicate how many follow-up
> > > > bytes are expected to be received after it receives a command. For
> > > > example, depending on the address mode, either 3-byte address or
> > > > 4-byte address is needed.
> > > >
> > > > For fast read family commands, some dummy cycles are required after
> > > > sending the address bytes, and the dummy cycles need to be counted
> > > > in s->needed_bytes. This is where the mess began.
> > > >
> > > > As the variable name (needed_bytes) indicates, the unit is in byte.
> > > > It is not in bit, or cycle. However for some reason the model has
> > > > been using the number of dummy cycles for s->needed_bytes. The right
> > > > approach is to convert the number of dummy cycles to bytes based on
> > > > the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> > > > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
> > >
> > > While not being the original implementor I must assume that above solution was
> > > considered but not chosen by the developers due to it is inaccuracy (it
> > > wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
> > > meaning that if the controller is wrongly programmed to generate 7 the error
> > > wouldn't be caught and the controller will still be considered "correct"). Now
> > > that we have this detail in the implementation I'm in favor of keeping it, this
> > > also because the detail is already in use for catching exactly above error.
> > >
> >
> > I found no clue from the commit message that my proposed solution here
> > was ever considered, otherwise all SPI controller models supporting
> > software generation should have been found out seriously broken long
> > time ago!
>
>
> The controllers you are referring to might lack support for commands requiring
> dummy clock cycles but I really hope they work with the other commands? If so I

I am not sure why you view dummy clock cycles as something special
that needs some special support from the SPI controller. For the case
1 controller, it's nothing special from the controller perspective,
just like sending out a command, or address bytes, or data. The
controller just shifts data bit by bit from its tx fifo and that's it.
In the Xilinx GQSPI controller case, the dummy cycles can either be
sent via a regular data (the case 1 controller) in the tx fifo, or
automatically generated (case 2 controller) by the hardware.

> don't think it is fair to call them 'seriously broken' (and else we should
> probably let the maintainers know about it). Most likely the lack of support

I called it "seriously broken" because current implementation only
considered one type of SPI controllers while completely ignoring the
other type.

> for the commands is because no request has been made for them. Also there is
> one controller that has support.

Definitely it's not "no request". Nearly all SPI flashes support the
Fast Read (0Bh) command today, and 0Bh requires a dummy cycle. This is
"seriously broken" for those case 1 type controllers because they
cannot read anything from the m25p80 model at all. Unless the guest
software being tested only uses Read (03h) command which is not
affected. But I can't find a software that uses Read instead of Fast
Read.

> > The issue you pointed out that we require the total number of dummy
> > bits should be multiple of 8 is true, that's why I added the
> > unimplemented log message in this series (patch 2/3/4) to warn users
> > if this expectation is not met. However this will not cause any issue
> > when running U-Boot or Linux, because both spi-nor drivers expect the
> > same assumption as we do here.
> >
> > See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_data(),
> > there is a logic to calculate the dummy bytes needed for fast read
> > command:
> >
> >     /* convert the dummy cycles to the number of bytes */
> >     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> >
> > Note the default dummy cycles configuration for all flashes I have
> > looked into as of today, meets the multiple of 8 assumption. On some
> > flashes the dummy cycle number is configurable, and if it's been
> > configured to be an odd value, it would not work on U-Boot/Linux in
> > the first place.
> >
> > > >
> > > > Things get complicated when interacting with different SPI or QSPI
> > > > flash controllers. There are major two cases:
> > > >
> > > > - Dummy bytes prepared by drivers, and wrote to the controller fifo.
> > > >   For such case, driver will calculate the correct number of dummy
> > > >   bytes and write them into the tx fifo. Fixing the m25p80 model will
> > > >   fix flashes working with such controllers.
> > >
> > > Above can be fixed while still keeping the detailed dummy cycle implementation
> > > inside m25p80. Perhaps one of the following could be looked into: configurating
> > > the amount, letting the spi ctrl fetch the amount from m25p80 or by inheriting
> > > some functionality handling this in the SPI controller. Or a mixture of above.
> >
> > Please send patches to explain this in detail how this is going to
> > work. I am open to all possible solutions.
>
> In that case I suggest that you instead try with a device property
> 'model_dummy_bytes' used to select to convert the accurate dummy clock cycle
> count to dummy bytes inside m25p80. Below is an example on how to modify the

No this is wrong in my view. This is not like a DMA vs. PIO handling.

> decode_fast_read_cmd function (the other commands requiring dummy clock cycles
> can follow a similar pattern). This way the fifo mode will be able to work the
> way you desire while also keeping the current functionality intact. Suddenly
> removing functionality (features) will take users by surprise.

I don't think we are removing any features. This is a fix to make the
model to be used by any SPI controllers.

As I pointed out, both U-Boot and Linux have the multiple of 8
assumption for the dummy bit, which is the default configuration for
all flashes I have looked into so far. Can you please comment what use
case you want to support? I requested a U-Boot/Linux kernel testing in
the previous SST thread [1] against Xilinx GQSPI but there was no
response.

[1] http://patchwork.ozlabs.org/project/qemu-devel/patch/1606704602-59435-1-git-send-email-bmeng.cn@gmail.com/

>
> static void decode_fast_read_cmd(Flash *s)
> {
>     uint8_t dummy_clk_cycles = 0;
>     uint8_t extra_bytes;
>
>     s->needed_bytes = get_addr_length(s);
>
>     /* Obtain the number of dummy clock cycles needed */
>     switch (get_man(s)) {
>     case MAN_WINBOND:
>         dummy_clk_cycles += 8;
>         break;
>     case MAN_NUMONYX:
>         dummy_clk_cycles += numonyx_extract_cfg_num_dummies(s);
>         break;
>     case MAN_MACRONIX:
>         if (extract32(s->volatile_cfg, 6, 2) == 1) {
>             dummy_clk_cycles += 6;
>         } else {
>             dummy_clk_cycles += 8;
>         }
>         break;
>     case MAN_SPANSION:
>         dummy_clk_cycles += extract32(s->spansion_cr2v,
>                                     SPANSION_DUMMY_CLK_POS,
>                                     SPANSION_DUMMY_CLK_LEN
>                                     );
>         break;
>     default:
>         break;
>     }
>
>     if (s->model_dummy_bytes) {
>         int lines = 1;
>
>         /*
>          * Expect dummy bytes from the controller so convert the dummy
>          * clock cycles to dummy_bytes.
>          */
>         extra_bytes = convert_to_dummy_bytes(dummy_clk_count, lines);
>     } else {
>         /* Model individual dummy clock cycles as byte writes */
>         extra_bytes = dummy_clk_cycles;
>     }
>
>     s->needed_bytes += extra_bytes;
>     s->pos = 0;
>     s->len = 0;
>     s->state = STATE_COLLECTING_DATA;
> }
>
> Best regards,
> Francisco Iglesias
>
> >
> > >
> > > > - Dummy bytes not prepared by drivers. Drivers just tell the hardware
> > > >   the dummy cycle configuration via some registers, and hardware will
> > > >   automatically generate dummy cycles for us. Fixing the m25p80 model
> > > >   is not enough, and we will need to fix the SPI/QSPI models for such
> > > >   controllers.
> > > >
> > > > This series fixes the mess in the m25p80 from the flash side first,
> > >
> > > Considering the problems solved by the solution in tree I find m25p80 pretty
> > > clean, at least I don't see any clearly better way for accurately modeling the
> > > dummy clock cycles. Counting bits instead of bytes would for example still
> > > force the controllers to mark which bits to count (when transmitting one dummy
> > > byte from a txfifo on four lines (Quad command) it generates 2 dummy clock
> > > cycles since it takes two cycles to transfer 8 bits).
> > >
> >
> > SPI is a bit based protocol, not bytes. If you insist on bit modeling
> > with the dummy cycles then you should also suggest we change all
> > cycles (including command/addr/dummy/data phases) to be modeled with
> > bits. That way we can accurately emulate everything, for example one
> > potential problem like transferring 9 bit in the data phase.
> >
> > However modeling everything with bit is super inefficient. My view is
> > that we should avoid trying to support uncommon use cases (like not
> > multiple of 8 for dummy bits) in QEMU.

Regards,
Bin

