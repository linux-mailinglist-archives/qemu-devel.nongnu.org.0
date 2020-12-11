Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B02D7AB1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:19:26 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl8f-0002Ow-MO
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1knl1P-00045I-Du; Fri, 11 Dec 2020 11:11:55 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1knl1M-0006T6-Aw; Fri, 11 Dec 2020 11:11:54 -0500
Received: by mail-lj1-x244.google.com with SMTP id t22so11525655ljk.0;
 Fri, 11 Dec 2020 08:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xwrLJc1/j45G/l78aIcfCB8FASRcE/i64pyod75PTbg=;
 b=AA2afRKukzAuWMCpYbFJYfUE335Lm40f69XvvBZ9zNZWZ5GG2A2XI2EypFpfPuXnZl
 XEdQ786RZoVL4uVBQUuEgR9JWiv8V+KBmZpsjY3KsoOPvL10z1wqgqSVSNM7ZmWZro8E
 /8V8cvnJVlFpXdemPxq6xc5n8+kV106+YL3/Oia+TIV4tLaKB8yEkLD+G2YjBU/36NDe
 K7qjLl5ZlmHhqYHkguJE7+dwVxiZEDUoykmYa3OyIclO8qUOSuSCMnbrQb+kuryx6upb
 SU/lviapyN39IOlD0XckBA/8kHA0BJ0lcuccxCR+KNFKEfDVK5WqLXZ10pV0tEhi3bWM
 MpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xwrLJc1/j45G/l78aIcfCB8FASRcE/i64pyod75PTbg=;
 b=F4ZdOOVm3sWURKoMUSS3zEMakLwjyr8Jvjbn/wP/HtCxYYRoHqW3joqM/Bqd9r/cME
 TAM6PnCoV98LUNuwWn1JMYcjjo6dlxVnFtaM/4/ZWgN14RxrryvMzZiFvJgwSwQGR0Xo
 s0DRd8UbOo4ATbwz+Sq3Q0+4I2phfHJ19kZAwe4a4XuB5Gr0GQeWBCFDseUT2du0tbfK
 LojxDNMtw5buFbrU92xewxmfh4qbY1aYgJYFF6y9zKnakPpcD5AovoI9wsZ15Ojn7yDW
 ixuCqXXtrcLWX+MZ6Oi/rOHG95o5jHLD/gGi/9uSmVyLomDh5XVk1mHdsT4Rr/t4oflM
 ICHA==
X-Gm-Message-State: AOAM533IjekhoXQ+ganjibQSvRAOywLqL+WjhpblUHVBtXNNk4ccVGHG
 FQaoR8grhCFsp2AkqUqfgWM=
X-Google-Smtp-Source: ABdhPJybWvRemfmkwnrYSJtWIUujqVpRT9mFRKJcoMkL7l2TvOwOBBYtLAUy4GX9kipCLhop2BMbww==
X-Received: by 2002:a2e:a0cb:: with SMTP id f11mr5575493ljm.363.1607703109999; 
 Fri, 11 Dec 2020 08:11:49 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 z26sm718723lja.125.2020.12.11.08.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:11:49 -0800 (PST)
Date: Fri, 11 Dec 2020 17:11:47 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
Message-ID: <20201211161146.GB12361@fralle-msi>
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
 <20201204104652.GA16865@fralle-dell>
 <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
 <20201204112847.GA16964@fralle-dell>
 <CAEUhbmVo268ks+t1tLBcNLFYs4DAM6hexhYzXx=2B+YU31kR3w@mail.gmail.com>
 <20201211151641.GA12361@fralle-msi>
 <CAEUhbmXMfETY2LOkDn3x8a9ia74+hQgkEh4jbC8yKamP+qBFJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXMfETY2LOkDn3x8a9ia74+hQgkEh4jbC8yKamP+qBFJw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x244.google.com
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

On [2020 Dec 11] Fri 23:29:16, Bin Meng wrote:
> Hi Francisco,
> 
> On Fri, Dec 11, 2020 at 11:16 PM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hello Bin,
> >
> > On [2020 Dec 11] Fri 14:07:21, Bin Meng wrote:
> > > Hi Francisco,
> > >
> > > On Fri, Dec 4, 2020 at 7:28 PM Francisco Iglesias
> > > <frasse.iglesias@gmail.com> wrote:
> > > >
> > > > Hello Bin,
> > > >
> > > > On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> > > > > Hi Francisco,
> > > > >
> > > > > On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > >
> > > > > > Hello Bin,
> > > > > >
> > > > > > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > > > > > Hi Francisco,
> > > > > > >
> > > > > > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hi Bin and Alistair,
> > > > > > > >
> > > > > > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > >
> > > > > > > > > > SST flashes require a dummy byte after the address bits.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > > > >
> > > > > > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > > > > > change looks fine, so:
> > > > > > > > >
> > > > > > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > > >
> > > > > > > > > Alistair
> > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >
> > > > > > > > > >  hw/block/m25p80.c | 3 +++
> > > > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > > > > > index 483925f..9b36762 100644
> > > > > > > > > > --- a/hw/block/m25p80.c
> > > > > > > > > > +++ b/hw/block/m25p80.c
> > > > > > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > > > > > >      switch (get_man(s)) {
> > > > > > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > > > > > +    case MAN_SST:
> > > > > > > > > > +        s->needed_bytes += 1;
> > > > > > > >
> > > > > > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > > > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > > > > > >
> > > > > > > I think you were confused by the WINBOND codes. The comments are
> > > > > > > correct. It is modeled with bytes instead of bits, so we should +=1.
> > > > > >
> > > > > > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > > > > > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > > > > > are needed for 1 dummy byte). Perhaps it is easier to understand
> > > > > > looking into how the controllers issue the command towards the flash model
> > > > > > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > > > > > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > > > > > 8 bytes (8 dummy cycles -> 1 dummy byte).
> > > > > >
> > > > >
> > > > > My interpretation of the comments are opposite: one cycle is a bit,
> > > > > but we are not using bits, instead we are using bytes.
> > > >
> > > > Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
> > > > Maybe just bellow would have been better:
> > > >
> > > > /* Dummy clock cycles - modeled with bytes writes */
> > > >
> > > > >
> > > > > Testing shows that +=1 is the correct way with the imx_spi controller,
> > > > > and with my SiFive SPI model in my local tree (not upstreamed yet)
> > > >
> > > > Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
> > > > npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
> > > > those could work aswell for the imx_spi?
> > > >
> > >
> > > Thanks for pointing this out. So there is some inconsistency among
> > > different SPI controller modeling.
> >
> > I'm not sure I understand you correctly but the controllers supporting
> > commands with dummy clock cycles can only do it following the modeled
> > approach, so I would rather say it is pretty consistent across the
> > controllers (not all controllers support these commands though).
> 
> I mean there are 2 approaches to emulate the dummy cycles for

There is currently only 1 way of modeling dummy clock cycles. All commands that
require / support them in m25p80 goes with that approach. An the controllers
that support dummy clock cycles uses that approach. 

> different SPI controller models, yet we only have one m25p80 flash
> model to work with both of them. Some controllers may choose 1 byte to
> emulate 1 dummy clock cycle, but some others choose 1 bit to emulate 1
> dummy cycle. This is inconsistent.
> 
> >
> > >
> > > Or maybe fixing aspeed_smc, xilinx_spips and npcm7xx_fiu to work like
> > > imx_spi?
> >
> > For me I would say no to above (it makes more sense to let new controllers
> > implement the currently modeled approach).
> 
> Yes, we can certainly make them consistent. But the question is which
> one is the correct one? I tried to search in the doc but in vain.

I think it is better to look into the code instead of doc/comments since it
might be outdated/misinterpreted.

> 
> >
> > > Which one is the expected behavior for dummy cycles?
> >
> > Dummy clock cycles are modeled as 1 byte written to the flash per dummy clock
> > cycle (expected behavior).
> >
> 
> Like I mentioned before, 8 bytes to emulate 8 dummy clock cycles does
> not work with current imx_spi model.

I've understood this and that is why I'm trying to explain that it needs to
convert the dummy byte to 8 writes (1 for each clock cycle). At the moment the
imx_spi does not support dummy clock cycle generation as far as I can see.

This patch works for the imx_xpi with the SST flash connected because it's
hardcoding the flash to use 1 dummy clock cycle (speaking m25p80.c language)
and then issues 1 byte write (for the dummy byte) from the model (matching it).
If you switch to another flash, for example Windbond, the FAST_READ command
won't work for the imx_spi anymore. And if you use an SST flash (using this
patch) with another controller that has implemented dummy cycle generation
the FAST_READ command won't work.

Best regards,
Francisco Iglesias

> 
> Regards,
> Bin

