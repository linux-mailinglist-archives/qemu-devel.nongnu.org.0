Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34E306808
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:39:21 +0100 (CET)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uP9-00059Q-W2
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4uNP-0004AA-9Z; Wed, 27 Jan 2021 18:37:32 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4uNN-0007yE-Ko; Wed, 27 Jan 2021 18:37:31 -0500
Received: by mail-oi1-x22a.google.com with SMTP id h192so4142094oib.1;
 Wed, 27 Jan 2021 15:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HJpqkRsZbLXh2vaN6FT25gyzuQv+LljfKlHw4FHoLyU=;
 b=ZR0evATzK/gAdPuhlnpAsYK51dEbWK3/Z1SomEmj9vYXG0d0s9peuzYEqjkYEHocx2
 iN8gJQ+dW7Om7aRM35M6Twu5KQqW4sgna9rYLLhLvO0UmeV7NMyMc1GOZFCDQXk45d04
 kdSpGgJN5rfgCs+2Rv+ssYX6eDemqFDsDR+iKkuchY69Ib3zajqqDsZPgV+ZZWFTV/IY
 bh6ueeEG+/HNSupjTNYHX8o+UbjX+3OrEyoWsuP5vn7ByeDsvtuRPL9tZuVqERcyIGLB
 Sq2AVJQb1aF9IzN4juHr/PSM5PmAw1aylVQDzBWsUy7vM3GYAb99GpK8CIWXrl5BYZeL
 hYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=HJpqkRsZbLXh2vaN6FT25gyzuQv+LljfKlHw4FHoLyU=;
 b=X0Rp+G34Cy9M+Pwlack439BLcTGNcJdqf/B9ulBx1zkgBFQVvJmxwY8gNcL4W2bs+u
 royG8mwKhWh7SedIC678bbZ9Q2T9cQ3GG2rutUNF3SnWHnZtZz4fRzQiSD0zghnks5XQ
 +3WVgGh55SZst7zbcvswFxCLgZi5WBFfVU50nMQAEdeUeQe4Xj1onKZJGtejVRgEnACl
 bbU5qSYNOSl8fsMrCnyFkYE1RefIHxlejiTUbcRZnu18rD4JNNZ1GGFKdXq5h5elQZSg
 riIqF5FCAbbUnn3JHvsfcQqR1K/TNyfDdFrmpgWwbf1sw8yK3T54cRqi8hzBX4JddFgW
 wYDw==
X-Gm-Message-State: AOAM533BBlkw+VnYvmBGkn2RWH94/6BmJGBQK9fobmazYRFY4CiOq6kG
 N5e+0knCisvl+3gdHdLp/g==
X-Google-Smtp-Source: ABdhPJwMVGPETu5diRPOT/wgjckyHAAkuBr1jtVNR0NiFcUK7umjhLTCBbUgf2pLPA7wi6ihDYDe1g==
X-Received: by 2002:aca:5d09:: with SMTP id r9mr4827682oib.25.1611790647663;
 Wed, 27 Jan 2021 15:37:27 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id 189sm734626oie.23.2021.01.27.15.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:37:26 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:84df:dff0:9fb7:e686])
 by serve.minyard.net (Postfix) with ESMTPSA id 6254B18055B;
 Wed, 27 Jan 2021 23:37:25 +0000 (UTC)
Date: Wed, 27 Jan 2021 17:37:24 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
Message-ID: <20210127233724.GF2057975@minyard.net>
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
 <20210126234724.GC2057975@minyard.net>
 <CAGcCb12nJAMnZ+eaWC6n08hAFAVueCknSWzbEYFPp+GUApoRdg@mail.gmail.com>
 <20210127214251.GE2057975@minyard.net>
 <CAGcCb13N+0wtmkH4Q4rZowrpPBn_KkOae3GgZokC4B1bGi-emg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGcCb13N+0wtmkH4Q4rZowrpPBn_KkOae3GgZokC4B1bGi-emg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 01:59:07PM -0800, Hao Wu wrote:
> On Wed, Jan 27, 2021 at 1:42 PM Corey Minyard <minyard@acm.org> wrote:
> 
> > On Wed, Jan 27, 2021 at 12:37:46PM -0800, wuhaotsh--- via wrote:
> > > On Tue, Jan 26, 2021 at 3:47 PM Corey Minyard <minyard@acm.org> wrote:
> > >
> > > > On Tue, Jan 26, 2021 at 11:32:37AM -0800, wuhaotsh--- via wrote:
> > > > > +
> > > > > +static void npcm7xx_smbus_read_byte_fifo(NPCM7xxSMBusState *s)
> > > > > +{
> > > > > +    uint8_t received_bytes =
> > NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> > > > > +
> > > > > +    if (received_bytes == 0) {
> > > > > +        npcm7xx_smbus_recv_fifo(s);
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    s->sda = s->rx_fifo[s->rx_cur];
> > > > > +    s->rx_cur = (s->rx_cur + 1u) % NPCM7XX_SMBUS_FIFO_SIZE;
> > > > > +    --s->rxf_sts;
> > > >
> > > > This open-coded decrement seems a little risky.  Are you sure in every
> > > > case that s->rxf_sts > 0?  There's no way what's running in the VM can
> > > > game this and cause a buffer overrun?  One caller to this function
> > seems
> > > > to protect against this, and another does not.
> > > >
> > > s->rxf_sts is uint8_t so it's guaranteed to be >=0.
> > > In the case s->rxf_sts == 0,  NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts) is
> > > also 0, so it'll take the if-branch and return without running
> > --s->rxf_sts.
> >
> > That is true if called from the
> > NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE case.  There is no such check
> > in the NPCM7XX_SMBUS_STATUS_RECEIVING case.
> >
> I don't understand the reasoning here. The caller doesn't matter.
> Previous code has:
>  #define NPCM7XX_SMBRXF_STS_RX_BYTES(rv)     extract8((rv), 0, 5)
> So
>  uint8_t received_bytes = NPCM7XX_SMBRXF_STS_RX_BYTES(s->rxf_sts);
> is guaranteed to be 0 if s->rxf_sts == 0.
> As a result the code will take the following branch and returns:
>  if (received_bytes == 0) {
>     npcm7xx_smbus_recv_fifo(s);
>     return;
>  }
> And will not execute the --s->rxf_sts sentence.
> Please let me know if I missed anything here.

Ah, sorry, I missed that.  Yes, this is ok.  So...

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> >
> > > I'll probably add "g_assert(s->rxf_sts > 0)" to clarify.
> >
> > You never want to do an assert if the hosted system can do something to
> > cause it.  If you add the check to the NPCM7XX_SMBUS_STATUS_RECEIVING
> > case, it would be ok, but really unnecessary.
> >
> > If it's fine if s->rxf_sts wraps to 0xff, then this all doesn't matter,
> > but you want to add a comment to that effect if so.  These sorts of
> > things look dangerous.
> >
> > There is also the question about who takes these patches in.  I'm the
> > I2C maintainer, but there's other code in this series.  Once everything
> > is ready, I can ack them if we take it through the ARM tree.  Or I can
> > take it through my tree with the proper acks.
> >
> I think either  way is fine. Previous NPCM7XX patch series were taken in
> the ARM tree. But as i2c code taking into your tree is also fine.
> 
> >
> > -corey
> >
> > >
> > > >
> > > > Other than this, I didn't see any issues with this patch.
> > > >
> > > > -corey
> > > >
> >

