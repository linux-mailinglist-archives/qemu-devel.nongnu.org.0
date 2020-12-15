Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9C42DB1A8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:42:35 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDPG-0007EG-Ad
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kpDNk-0006ib-0L; Tue, 15 Dec 2020 11:41:00 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kpDNh-000686-Bo; Tue, 15 Dec 2020 11:40:59 -0500
Received: by mail-lf1-x144.google.com with SMTP id l11so41050681lfg.0;
 Tue, 15 Dec 2020 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aCyeNBKpJ5Hvg3xN2q47ghUaAtOnqiWTljAYZ1mBPeI=;
 b=cBvJWpQw9qXLzsXmUjsg7SNQYO5wBk1NtoZPV8Y98N+VDG6vbqTfhrthm6mMtxfTHR
 bl6kKynS+TrvOFWSafp0yAxdpMMO2o4OodwaQdFzNwc0qAfddG/A3zPtyQTgBvkwrRYh
 YbrTCCmIQZzxBnRVDSPQwfrxbpdDGoQLveddOGPCd+a2F34Tq3BgUk1e3A1VNzhUsjH3
 purEKmgYArL6m5d2FeNf0wM1hm85HZjz+bE+ZEjnbsyS08PqcNn+YqD+mBg+FbrLg6fq
 odHYmo9Bdi6jCBxZZq70Ni4FO68j/E3pnN+Sx9ZCu9KX2Ek6cNYKOI1HdLoebLztKHT6
 jZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aCyeNBKpJ5Hvg3xN2q47ghUaAtOnqiWTljAYZ1mBPeI=;
 b=mvpU7Go09NcmCwJaMZeRtIXkr+OCWxRI1Mys01J1Wc2Px8x9gYEGpebOISzdP1tuhd
 Eh/elaVLXdT8mzX7FM/YVw+iVJhCOwuK5FQhUc7TeQkYpfvLfWDgByHUpDYGHCY4Bc0w
 ngaBJ+VINd4YlEPI46oSW50ATVNhQCxFOsEWlNxvA3pTcWlT18VtX/9qDrLfEC0mXRs9
 1Mi6Mjx0B6voeEMLidQdZXCstP/jHYsxhiQMzO0TxFEVsd6f8YBebXxvjw52Bux0Yhkg
 PGkLPvEnrZHQm8aiMdhfMydSzUjKlrJjEm18uL3LnjYSWr3llR88WSJpyhpdt1kn+4q6
 SDxQ==
X-Gm-Message-State: AOAM53285fuKBzEx9E/PZf51K98IOOY/dd4w4zr3wim0jm6fsFD2FUhw
 FYkVq18AIuSfHuqCYH5EvLg=
X-Google-Smtp-Source: ABdhPJy66IHPlqwUsOKD6CVJyADffPzVWDjXfimiLdEOgUZyMCg34286i7Sw7Lufe0PfnKzIxFcIdw==
X-Received: by 2002:a05:6512:2e9:: with SMTP id
 m9mr11185224lfq.118.1608050455183; 
 Tue, 15 Dec 2020 08:40:55 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 y10sm1620952ljk.10.2020.12.15.08.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:40:54 -0800 (PST)
Date: Tue, 15 Dec 2020 17:40:52 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
Message-ID: <20201215164051.GA9899@fralle-msi>
References: <20201204104652.GA16865@fralle-dell>
 <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
 <20201204112847.GA16964@fralle-dell>
 <CAEUhbmVo268ks+t1tLBcNLFYs4DAM6hexhYzXx=2B+YU31kR3w@mail.gmail.com>
 <20201211151641.GA12361@fralle-msi>
 <CAEUhbmXMfETY2LOkDn3x8a9ia74+hQgkEh4jbC8yKamP+qBFJw@mail.gmail.com>
 <20201211161146.GB12361@fralle-msi>
 <CAEUhbmXsZtGnMrw5gNJM=Gvqg3GQFejsfsggbTOpY+6eYLiBAg@mail.gmail.com>
 <20201212092406.GA32260@fralle-msi>
 <CAEUhbmUNZ5gctB+MEVfbrfmiZBOzm8unCEn+DZJjsMjcY_YGxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmUNZ5gctB+MEVfbrfmiZBOzm8unCEn+DZJjsMjcY_YGxg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Bin,

On [2020 Dec 12] Sat 17:44:27, Bin Meng wrote:
> Hi Francisco,
> 
> On Sat, Dec 12, 2020 at 5:24 PM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hi bin,
> >
> > On [2020 Dec 12] Sat 16:16:59, Bin Meng wrote:
> > > Hi Francisco,
> > >
> > > On Sat, Dec 12, 2020 at 12:11 AM Francisco Iglesias
> > > <frasse.iglesias@gmail.com> wrote:
> > > >
> > > > Hello Bin,
> > > >
> > > > On [2020 Dec 11] Fri 23:29:16, Bin Meng wrote:
> > > > > Hi Francisco,
> > > > >
> > > > > On Fri, Dec 11, 2020 at 11:16 PM Francisco Iglesias
> > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > >
> > > > > > Hello Bin,
> > > > > >
> > > > > > On [2020 Dec 11] Fri 14:07:21, Bin Meng wrote:
> > > > > > > Hi Francisco,
> > > > > > >
> > > > > > > On Fri, Dec 4, 2020 at 7:28 PM Francisco Iglesias
> > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hello Bin,
> > > > > > > >
> > > > > > > > On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> > > > > > > > > Hi Francisco,
> > > > > > > > >
> > > > > > > > > On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hello Bin,
> > > > > > > > > >
> > > > > > > > > > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > > > > > > > > > Hi Francisco,
> > > > > > > > > > >
> > > > > > > > > > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Bin and Alistair,
> > > > > > > > > > > >
> > > > > > > > > > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > > > > > > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > SST flashes require a dummy byte after the address bits.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > > > > > > > > > change looks fine, so:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > Alistair
> > > > > > > > > > > > >
> > > > > > > > > > > > > > ---
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >  hw/block/m25p80.c | 3 +++
> > > > > > > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > > > > > > > > > index 483925f..9b36762 100644
> > > > > > > > > > > > > > --- a/hw/block/m25p80.c
> > > > > > > > > > > > > > +++ b/hw/block/m25p80.c
> > > > > > > > > > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > > > > > > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > > > > > > > > > >      switch (get_man(s)) {
> > > > > > > > > > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > > > > > > > > > +    case MAN_SST:
> > > > > > > > > > > > > > +        s->needed_bytes += 1;
> > > > > > > > > > > >
> > > > > > > > > > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > > > > > > > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > > > > > > > > > >
> > > > > > > > > > > I think you were confused by the WINBOND codes. The comments are
> > > > > > > > > > > correct. It is modeled with bytes instead of bits, so we should +=1.
> > > > > > > > > >
> > > > > > > > > > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > > > > > > > > > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > > > > > > > > > are needed for 1 dummy byte). Perhaps it is easier to understand
> > > > > > > > > > looking into how the controllers issue the command towards the flash model
> > > > > > > > > > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > > > > > > > > > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > > > > > > > > > 8 bytes (8 dummy cycles -> 1 dummy byte).
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > My interpretation of the comments are opposite: one cycle is a bit,
> > > > > > > > > but we are not using bits, instead we are using bytes.
> > > > > > > >
> > > > > > > > Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
> > > > > > > > Maybe just bellow would have been better:
> > > > > > > >
> > > > > > > > /* Dummy clock cycles - modeled with bytes writes */
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Testing shows that +=1 is the correct way with the imx_spi controller,
> > > > > > > > > and with my SiFive SPI model in my local tree (not upstreamed yet)
> > > > > > > >
> > > > > > > > Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
> > > > > > > > npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
> > > > > > > > those could work aswell for the imx_spi?
> > > > > > > >
> > > > > > >
> > > > > > > Thanks for pointing this out. So there is some inconsistency among
> > > > > > > different SPI controller modeling.
> > > > > >
> > > > > > I'm not sure I understand you correctly but the controllers supporting
> > > > > > commands with dummy clock cycles can only do it following the modeled
> > > > > > approach, so I would rather say it is pretty consistent across the
> > > > > > controllers (not all controllers support these commands though).
> > > > >
> > > > > I mean there are 2 approaches to emulate the dummy cycles for
> > > >
> > > > There is currently only 1 way of modeling dummy clock cycles. All commands that
> > > > require / support them in m25p80 goes with that approach. An the controllers
> > > > that support dummy clock cycles uses that approach.
> > >
> > > No, there are 2 ways. One way is how aspeed_smc, xilinx_spips and
> > > npcm7xx do for dummy cycles. For these controllers, there are hardware
> > > registers for dummy cycles, and software does not need to write
> > > anything into the tx fifo. These models emulate one dummy cycle by
> > > transferring one byte one the SPI line so we see there are actually a
> > > number of (bit * 8) bytes needed in decode_fast_read_cmd(). The other
> > > way is how imx_spi, mss-spi, pl022, stm32f2xx_spi and xilinx_spi. For
> > > these controllers, they just transfer whatever is written by guest
> > > software to tx fifo without any special awareness of dummy cycles.
> >
> >
> > The xilinx_spips supports above way of transferring a command so you can look
> > into that one for an example of how to handle a command pushed into a txfifo
> > with regards to the dummy clock cycles. Not all controllers support generating
> > dummy clock cycles, meaning that not all do the dummy byte -> dummy clock cycle
> > conversion. The controllers that do not do this currently does not support
> > issuing commands requiring them towards m25p80 (as FAST_READ, DOR, QOR etc..).
> 
> No, I don't think inspecting tx fifo to decode the SPI command, and to
> insert dummy cycles when seeing FAST_READ is the correct way for these
> SPI controllers like imx_spi. The real hardware does not do this and
> we should not make them behave like xilinx_spips.

Above is not correct, the xilinx_spips does not insert dummy clock cycles, it
converts the dummy bytes in the txfifo into the correct amount of dummy clock
cycles needed to be generated for the dummy byte based on the command and state
of the controller. For example if the command (as DOR) uses 2 lines when
transmitting the dummy byte it will issue 4 dummy clock cycles, if the command
uses 4 lines (example QIOR) it converts the dummy bytes into 2 dummy clock
cycles each.

How the hardware really works and how QEMU models it is not necessarly the
same, for the FAST_READ command the hardware will generate 8 dummy cycles of
the dummy byte (probably by shifting out the byte), currently the only way to
model this in QEMU is by making the controller convert the dummy
byte into 8 byte writes into m25p80 (there's no command in m25p80 modeling
this differently). If you would like to change this I think it is better if you
post a patch series demonstrating a solution that is better and also solves all
problems currently solved by the current one. Example problems (but not all)
are the ones mentioned above.

Thanks,
Francisco Iglesias


> 
> Regards,
> Bin

