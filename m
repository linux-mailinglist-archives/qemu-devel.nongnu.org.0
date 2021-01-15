Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B552F78E2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:27:58 +0100 (CET)
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OCr-0006ip-Bv
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l0OBY-00063h-Cw; Fri, 15 Jan 2021 07:26:37 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:40437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l0OBV-0004D7-SQ; Fri, 15 Jan 2021 07:26:36 -0500
Received: by mail-lj1-x234.google.com with SMTP id x23so10148581lji.7;
 Fri, 15 Jan 2021 04:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8zz4ZDmI+ILhSeApMpp9S9TSfvDExpA10KFZoxCTabg=;
 b=EERCydsqIcFriC73PoNcQQkfiZh92WXp+VhsMzWKLJtdPE9v0l6a8EgxsiKuuRzSHM
 InurshL1rVA6O+bBHvsES6ttge90Cn0IisGAVHmACzOXz2UeGNF3guVRTMttOs9Ge/0h
 bXTjuxzrTOPpMizj9/J2f/ErVuAOUbg7u/gD83fxwaLBVwNfN2X2pgd1Wp0UWx3UJs7L
 U24vR8Iqn1RRJl0G4NqDZwflPw/q5oDfxA0XTyK0VWXhR34JcM2pGektKqpPOSpOPmH2
 TKjKCQMLn1lW9sJguNM5SoD7mlZiZz6JVZPob+x6uT0LQ2G2bpOG1FKGAimAsmo89tCp
 opbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8zz4ZDmI+ILhSeApMpp9S9TSfvDExpA10KFZoxCTabg=;
 b=iOnufv+Afo2eZtIIgWMi23At8WQJTohwWG6DD3o6ra5Uq+otcjYmzBEoVOksDrYb/3
 OD4a1Bre++y63Pj+FNU90QjRdKIAwqKuAjTWlazoDG7nvAvqs1yNUDWBrogO0RUbXSk0
 aibfVthOcTXKAC0/URZUD2Pb5gLoAk9HzjiUBzIgXLfLQCg+92GQzJuASLXmCAxlzlnV
 XhcXznj4D72e6wN0OvfrCipnLExkM4OXH9bcLKs24B0xZkLplO/+M7Y+3/2cBy4Sk86N
 iV5nf5pbctHe5PYp82JTYp8euuf7JxM7dbc/fYJ2OjGOPZj1O5KAtQPAVETg+0mIuWd0
 RAyQ==
X-Gm-Message-State: AOAM530Z3uSdl6/Ll8M1RHEkylwt2G9qGFizL7doy/jgs10J5EuIx7Vw
 mR+l5mimYxhgbiMp2ycpc8k=
X-Google-Smtp-Source: ABdhPJyXvRgm69nBrgJqbcM9UI4Cx4ABn60vWs+qP6u9yNnhilh8YQacgTnNrf9+3Imls9GEkrboiQ==
X-Received: by 2002:a05:651c:3db:: with SMTP id
 f27mr5255332ljp.494.1610713591171; 
 Fri, 15 Jan 2021 04:26:31 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 a15sm769719lji.105.2021.01.15.04.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:26:30 -0800 (PST)
Date: Fri, 15 Jan 2021 13:26:28 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
Message-ID: <20210115122627.GB29923@fralle-msi>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114181300.GA29923@fralle-msi>
 <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXiYNFVY0EkrKqNGKV3C0QV0+WvkvEkfPUa-pSg2zGvuA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x234.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> Hi Francisco,
> 
> On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hi Bin,
> >
> > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > The m25p80 model uses s->needed_bytes to indicate how many follow-up
> > > bytes are expected to be received after it receives a command. For
> > > example, depending on the address mode, either 3-byte address or
> > > 4-byte address is needed.
> > >
> > > For fast read family commands, some dummy cycles are required after
> > > sending the address bytes, and the dummy cycles need to be counted
> > > in s->needed_bytes. This is where the mess began.
> > >
> > > As the variable name (needed_bytes) indicates, the unit is in byte.
> > > It is not in bit, or cycle. However for some reason the model has
> > > been using the number of dummy cycles for s->needed_bytes. The right
> > > approach is to convert the number of dummy cycles to bytes based on
> > > the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> > > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
> >
> > While not being the original implementor I must assume that above solution was
> > considered but not chosen by the developers due to it is inaccuracy (it
> > wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
> > meaning that if the controller is wrongly programmed to generate 7 the error
> > wouldn't be caught and the controller will still be considered "correct"). Now
> > that we have this detail in the implementation I'm in favor of keeping it, this
> > also because the detail is already in use for catching exactly above error.
> >
> 
> I found no clue from the commit message that my proposed solution here
> was ever considered, otherwise all SPI controller models supporting
> software generation should have been found out seriously broken long
> time ago!


The controllers you are referring to might lack support for commands requiring
dummy clock cycles but I really hope they work with the other commands? If so I
don't think it is fair to call them 'seriously broken' (and else we should
probably let the maintainers know about it). Most likely the lack of support
for the commands is because no request has been made for them. Also there is
one controller that has support.


> 
> The issue you pointed out that we require the total number of dummy
> bits should be multiple of 8 is true, that's why I added the
> unimplemented log message in this series (patch 2/3/4) to warn users
> if this expectation is not met. However this will not cause any issue
> when running U-Boot or Linux, because both spi-nor drivers expect the
> same assumption as we do here.
> 
> See U-Boot spi_nor_read_data() and Linux spi_nor_spimem_read_data(),
> there is a logic to calculate the dummy bytes needed for fast read
> command:
> 
>     /* convert the dummy cycles to the number of bytes */
>     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> 
> Note the default dummy cycles configuration for all flashes I have
> looked into as of today, meets the multiple of 8 assumption. On some
> flashes the dummy cycle number is configurable, and if it's been
> configured to be an odd value, it would not work on U-Boot/Linux in
> the first place.
> 
> > >
> > > Things get complicated when interacting with different SPI or QSPI
> > > flash controllers. There are major two cases:
> > >
> > > - Dummy bytes prepared by drivers, and wrote to the controller fifo.
> > >   For such case, driver will calculate the correct number of dummy
> > >   bytes and write them into the tx fifo. Fixing the m25p80 model will
> > >   fix flashes working with such controllers.
> >
> > Above can be fixed while still keeping the detailed dummy cycle implementation
> > inside m25p80. Perhaps one of the following could be looked into: configurating
> > the amount, letting the spi ctrl fetch the amount from m25p80 or by inheriting
> > some functionality handling this in the SPI controller. Or a mixture of above.
> 
> Please send patches to explain this in detail how this is going to
> work. I am open to all possible solutions.

In that case I suggest that you instead try with a device property
'model_dummy_bytes' used to select to convert the accurate dummy clock cycle
count to dummy bytes inside m25p80. Below is an example on how to modify the
decode_fast_read_cmd function (the other commands requiring dummy clock cycles
can follow a similar pattern). This way the fifo mode will be able to work the
way you desire while also keeping the current functionality intact. Suddenly
removing functionality (features) will take users by surprise. 


static void decode_fast_read_cmd(Flash *s)
{
    uint8_t dummy_clk_cycles = 0;
    uint8_t extra_bytes;

    s->needed_bytes = get_addr_length(s);

    /* Obtain the number of dummy clock cycles needed */
    switch (get_man(s)) {
    case MAN_WINBOND:
        dummy_clk_cycles += 8;
        break;
    case MAN_NUMONYX:
        dummy_clk_cycles += numonyx_extract_cfg_num_dummies(s);
        break;
    case MAN_MACRONIX:
        if (extract32(s->volatile_cfg, 6, 2) == 1) {
            dummy_clk_cycles += 6;
        } else {
            dummy_clk_cycles += 8;
        }
        break;
    case MAN_SPANSION:
        dummy_clk_cycles += extract32(s->spansion_cr2v,
                                    SPANSION_DUMMY_CLK_POS,
                                    SPANSION_DUMMY_CLK_LEN
                                    );
        break;
    default:
        break;
    }

    if (s->model_dummy_bytes) {
        int lines = 1;

        /*
         * Expect dummy bytes from the controller so convert the dummy
         * clock cycles to dummy_bytes.
         */
        extra_bytes = convert_to_dummy_bytes(dummy_clk_count, lines);
    } else {
        /* Model individual dummy clock cycles as byte writes */
        extra_bytes = dummy_clk_cycles;
    }

    s->needed_bytes += extra_bytes;
    s->pos = 0;
    s->len = 0;
    s->state = STATE_COLLECTING_DATA;
}

Best regards,
Francisco Iglesias

> 
> >
> > > - Dummy bytes not prepared by drivers. Drivers just tell the hardware
> > >   the dummy cycle configuration via some registers, and hardware will
> > >   automatically generate dummy cycles for us. Fixing the m25p80 model
> > >   is not enough, and we will need to fix the SPI/QSPI models for such
> > >   controllers.
> > >
> > > This series fixes the mess in the m25p80 from the flash side first,
> >
> > Considering the problems solved by the solution in tree I find m25p80 pretty
> > clean, at least I don't see any clearly better way for accurately modeling the
> > dummy clock cycles. Counting bits instead of bytes would for example still
> > force the controllers to mark which bits to count (when transmitting one dummy
> > byte from a txfifo on four lines (Quad command) it generates 2 dummy clock
> > cycles since it takes two cycles to transfer 8 bits).
> >
> 
> SPI is a bit based protocol, not bytes. If you insist on bit modeling
> with the dummy cycles then you should also suggest we change all
> cycles (including command/addr/dummy/data phases) to be modeled with
> bits. That way we can accurately emulate everything, for example one
> potential problem like transferring 9 bit in the data phase.
> 
> However modeling everything with bit is super inefficient. My view is
> that we should avoid trying to support uncommon use cases (like not
> multiple of 8 for dummy bits) in QEMU.
> 
> Regards,
> Bin

