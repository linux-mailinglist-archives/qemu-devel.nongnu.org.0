Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F2441D956
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 14:07:14 +0200 (CEST)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVuqH-0003nZ-EC
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 08:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1mVuoP-0002sD-Hk
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 08:05:17 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1mVuoK-0005xi-RU
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 08:05:17 -0400
Received: by mail-pf1-x429.google.com with SMTP id s55so3722563pfw.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GvZJRa2AOYs2WenkqYjS9GuxoJCyDE5kItx4sT1WQ8k=;
 b=HGHWPjVSdbfBTLEygBHn+6c3SHK5oD9ElGqu2JZ1qqNfDXpYdHf3fkP033gFXnaOFe
 8WKR6ClSHnOa8FT7YfDRHPPiHM/AHfuuQG7W+nIGlyHeOyRdnlPrfzGqxevTivUIJB6W
 qmRr0KRboof01Iv9/MIQ8iPzuddimNksWYsKYUtLXl3ZWe/296388PdEA81WtydLLyWt
 Dw1SpvKgeOQFs+7N5DEO5IdQLMh+nq1L3eav63Kja1A0pyNLcTjbN5OIzSOWwfQEJCsf
 s1LIHWI8FfgkfP9/7w1uEk8mEI7BBifQGLWNyckV7oR5CYjWR6X5UrsZZ5KMEzqGDxws
 BfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GvZJRa2AOYs2WenkqYjS9GuxoJCyDE5kItx4sT1WQ8k=;
 b=pYfRNVC4GEni+SkeglseT5rCB0wMRl9GhwVQiR56F8XB2HAqbakutTkGRK2RtlvM7o
 KMfDF6+d26xnwd83xopKC3WxstDbzwAm81ww+id2WUW22+VRSG/QdkZlTY2vRXJ6euP1
 muE1UrAotPZrDXedfX8IuDRyUFR3ZmdvlGsUwZn+2qGCFIRDf2D+PgSZo3DVxDIrEqAI
 ZLX+Kk+9aPQGJCnTod8s8O5xJVkFIl8rQtPkkCeHHiSKtz9m4VPBnb1322fALT0tgfuo
 2l40CVqrNZ6cJJn1I1FQBG/TcCkoOzHzAa56FUUkhx/oKZPRCPVtKL/EuyMy0rx/es4k
 mHXg==
X-Gm-Message-State: AOAM533c/G33KhfDy3PeJYMD/9TZpcDDk68l1w8rWu2E4Mk6K7DrzYkQ
 zJfh1HSGfQ0lzHLTXDs0ago=
X-Google-Smtp-Source: ABdhPJxGEkTBa9qS9UDzTk5X0zeXB+rT8zefL7qP68eR6T8GB5122CqD9ylfTO6zgS6jlIdXq4gwiw==
X-Received: by 2002:a63:200a:: with SMTP id g10mr4534376pgg.242.1633003509775; 
 Thu, 30 Sep 2021 05:05:09 -0700 (PDT)
Received: from [10.0.30.13] (203-123-126-183.ip4.superloop.com.
 [203.123.126.183])
 by smtp.googlemail.com with ESMTPSA id h13sm2881949pgf.14.2021.09.30.05.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 05:05:09 -0700 (PDT)
Message-ID: <3ff823c0ca926013ba057280bba533c8fd571570.camel@gmail.com>
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix pin I/O type declarations
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Peter Delevoryas <pdel@fb.com>
Date: Thu, 30 Sep 2021 22:05:04 +1000
In-Reply-To: <7B801EC5-8A3B-4C06-8FDA-194AD84C437C@fb.com>
References: <20210928032456.3192603-1-pdel@fb.com>
 <20210928032456.3192603-2-pdel@fb.com>
 <00f8b06a-337a-2a93-8f22-642760424905@greensocs.com>
 <7B801EC5-8A3B-4C06-8FDA-194AD84C437C@fb.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=rashmica.g@gmail.com; helo=mail-pf1-x429.google.com
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
Cc: "damien.hedde@greensocs.com" <damien.hedde@greensocs.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Zhang <zhdaniel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-09-30 at 00:45 +0000, Peter Delevoryas wrote:
> 
> > On Sep 28, 2021, at 3:53 AM, Damien Hedde
> > <damien.hedde@greensocs.com> wrote:
> > 
> > 
> > 
> > On 9/28/21 05:24, pdel@fb.com wrote:
> > > From: Peter Delevoryas <pdel@fb.com>
> > > Some of the pin declarations in the Aspeed GPIO module were
> > > incorrect,
> > > probably because of confusion over which bits in the input and
> > > output
> > > uint32_t's correspond to which groups in the label array. Since
> > > the
> > > uint32_t literals are in big endian, it's sort of the opposite of
> > > what
> > > would be intuitive. The least significant bit in
> > > ast2500_set_props[6]
> > > corresponds to GPIOY0, not GPIOAB7.

Looks like I didn't think about endianness! I remember there was
conflicting information about which groups of GPIOs were input only -
the input/output table says groups W and X for ast2600 while the info
in direction registers says T and U. I don't recall why I went with the
former over the latter but the latter seems to be correct as this is
what is in the kernel driver.

> > > GPIOxx indicates input and output capabilities, GPIxx indicates
> > > only
> > > input, GPOxx indicates only output.
> > > AST2500:
> > > - Previously had GPIW0..GPIW7 and GPIX0..GPIX7, that's correct.
> > > - Previously had GPIOY0..GPIOY3, should have been GPIOY0..GPIOY7.
> > > - Previously had GPIOAB0..GPIOAB3 and GPIAB4..GPIAB7, should only
> > > have
> > >   been GPIOAB0..GPIOAB3.
> > > AST2600:
> > > - GPIOT0..GPIOT7 should have been GPIT0..GPIT7.
> > > - GPIOU0..GPIOU7 should have been GPIU0..GPIU7.
> > > - GPIW0..GPIW7 should have been GPIOW0..GPIOW7.
> > > - GPIOY0..GPIOY7 and GPIOZ0...GPIOZ7 were disabled.
> > > Fixes: 4b7f956862dc2db4c5c ("hw/gpio: Add basic Aspeed GPIO model
> > > for AST2400 and AST2500")
> > > Fixes: 36d737ee82b2972167e ("hw/gpio: Add in AST2600 specific
> > > implementation")
> > > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> > 
> > Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> 

Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>

> cc’ing Dan
> 
> > 
> > > ---
> > >  hw/gpio/aspeed_gpio.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> > > index dfa6d6cb40..33a40a624a 100644
> > > --- a/hw/gpio/aspeed_gpio.c
> > > +++ b/hw/gpio/aspeed_gpio.c
> > > @@ -796,7 +796,7 @@ static const GPIOSetProperties
> > > ast2500_set_props[] = {
> > >      [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
> > >      [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
> > >      [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> > > -    [6] = {0xffffff0f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
> > > +    [6] = {0x0fffffff,  0x0fffffff,  {"Y", "Z", "AA", "AB"} },
> > >      [7] = {0x000000ff,  0x000000ff,  {"AC"} },
> > >  };
> > >  @@ -805,9 +805,9 @@ static GPIOSetProperties
> > > ast2600_3_3v_set_props[] = {
> > >      [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
> > >      [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
> > >      [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
> > > -    [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
> > > -    [5] = {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> > > -    [6] = {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
> > > +    [4] = {0xffffffff,  0x00ffffff,  {"Q", "R", "S", "T"} },
> > > +    [5] = {0xffffffff,  0xffffff00,  {"U", "V", "W", "X"} },
> > > +    [6] = {0x0000ffff,  0x0000ffff,  {"Y", "Z"} },
> > >  };
> > >    static GPIOSetProperties ast2600_1_8v_set_props[] = {
> 



