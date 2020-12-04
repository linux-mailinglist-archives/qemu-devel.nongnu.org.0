Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5782CED0C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:29:44 +0100 (CET)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9HS-0005KQ-Ov
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kl9Gg-0004pA-Pd; Fri, 04 Dec 2020 06:28:54 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kl9Gf-0001H9-3O; Fri, 04 Dec 2020 06:28:54 -0500
Received: by mail-lf1-x141.google.com with SMTP id j205so7174387lfj.6;
 Fri, 04 Dec 2020 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gTNHY+3S27vRVJ1g7/Po/1FiEuEaoFJkpemhAadKaU8=;
 b=Tybx4oQEvx1H296SYqclSJltVcBuiRlxUYuxKw95VhSgpAI9fMz2IAl7Qilmuuia7X
 Su0SVXggcV/AWxZzmSwdlCvfH4a1QBDGfR4n7YtC//uKDXR9WarAG/VGQl7PSz9wQMJv
 +Xcv54OihC7vXFeJcxy0txHpKt4txzTlBEZn1lALmy2Upd+7Lohy2oz/F3JrdntW8ejp
 mRtxHs8Fa13x7BVehNjradZErHFlzufZn8aMKGOlfutcuIi/8dZwVbYv5/4fV8tHiF1x
 24bl3gRsUnhVfgZIFcEo8C6hEqqe1KhCyjyIF7VSi4p4hKERDBL7bnpBfIJ8xcn77M/g
 +vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gTNHY+3S27vRVJ1g7/Po/1FiEuEaoFJkpemhAadKaU8=;
 b=TqBUZwbq69CYRbEd4kcwWXms+/q589EXmervKcCW2TDxLb27+R3ywqscroj3WrUO47
 d+HftOg5dQBQ5Pw8ewqdrqTq6GA/ky41AE67TyXZv7lDJtt/kTWHLiZkvTS04mJ1N4Q9
 VJYxDAGPT5pife4Z7BiBLH6Pj+PW/xeBVz+YxD+Q1Ldt1nsSs4ufglaP+js18xqloTje
 J2uEYBlxEAyooK1v0JUyHcHGUU13nKbvu7NQv0PL+7z1tw9fKclqTmhpThtlhhE5aGpd
 Uv3Z0oP6up2Wf4ToUXcX7DxD4DsIySwXmM/k6cDdEP78vC3zkTKTeuzSB6UnqF+vj53V
 vvAg==
X-Gm-Message-State: AOAM532H8CpO3//E/Av47WjLkk3JrWJ1EwZ2BrL4HZvUmGX8AyodXpOJ
 opNrgEM8WdYx6fFlh15OXHM=
X-Google-Smtp-Source: ABdhPJwETjdkqnJy7q14X6hn+9dWmZZQupOiVs/nfkw33Qa88biOR4MRdOSoR8aXXxGyFdDT5sb4Sg==
X-Received: by 2002:a05:6512:3329:: with SMTP id
 l9mr3013381lfe.127.1607081330951; 
 Fri, 04 Dec 2020 03:28:50 -0800 (PST)
Received: from fralle-dell (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 x5sm1601856ljj.121.2020.12.04.03.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:28:50 -0800 (PST)
Date: Fri, 4 Dec 2020 11:28:48 +0000
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
Message-ID: <20201204112847.GA16964@fralle-dell>
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
 <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
 <20201204104652.GA16865@fralle-dell>
 <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmWAFf2sJLfb4i5JxhQgT88cVf54AzREuGrn+0C17ShxoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x141.google.com
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

On [2020 Dec 04] Fri 18:52:50, Bin Meng wrote:
> Hi Francisco,
> 
> On Fri, Dec 4, 2020 at 6:46 PM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > Hello Bin,
> >
> > On [2020 Dec 04] Fri 15:52:12, Bin Meng wrote:
> > > Hi Francisco,
> > >
> > > On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
> > > <frasse.iglesias@gmail.com> wrote:
> > > >
> > > > Hi Bin and Alistair,
> > > >
> > > > On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > > > > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > >
> > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > >
> > > > > > SST flashes require a dummy byte after the address bits.
> > > > > >
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > I couldn't find a datasheet that says this... But the actual code
> > > > > change looks fine, so:
> > > > >
> > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > >
> > > > > Alistair
> > > > >
> > > > > > ---
> > > > > >
> > > > > >  hw/block/m25p80.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > > > > index 483925f..9b36762 100644
> > > > > > --- a/hw/block/m25p80.c
> > > > > > +++ b/hw/block/m25p80.c
> > > > > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > > > > >      s->needed_bytes = get_addr_length(s);
> > > > > >      switch (get_man(s)) {
> > > > > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > > > > +    case MAN_SST:
> > > > > > +        s->needed_bytes += 1;
> > > >
> > > > 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> > > > dummy byte (8 dummy clk cycles) will need +8 above.
> > >
> > > I think you were confused by the WINBOND codes. The comments are
> > > correct. It is modeled with bytes instead of bits, so we should +=1.
> >
> > What the comment says is (perhaps not superclear) that 1 dummy clock cycle
> > is modeled as one 1 byte write into the flash (meaining that 8 byte writes
> > are needed for 1 dummy byte). Perhaps it is easier to understand
> > looking into how the controllers issue the command towards the flash model
> > (for example the xilinx_spips), the start of the FAST_READ cmd is issued
> > as writing the following into the flash: 1 byte (cmd), 3 bytes (address),
> > 8 bytes (8 dummy cycles -> 1 dummy byte).
> >
> 
> My interpretation of the comments are opposite: one cycle is a bit,
> but we are not using bits, instead we are using bytes.

Yes, the mentioning of 'bits' in the comment makes it not very clear at first read.
Maybe just bellow would have been better:

/* Dummy clock cycles - modeled with bytes writes */

> 
> Testing shows that +=1 is the correct way with the imx_spi controller,
> and with my SiFive SPI model in my local tree (not upstreamed yet)

Perhaps an option could be to look into how the aspeed_smc, xilinx_spips or the
npcm7xx_fiu generate dummy clock cycles and see if a similar solution to one of
those could work aswell for the imx_spi?

Regarding this patch, with += 8 it looks correct to me (and will work with
above controllers as far as I can see).

Best regards,
Francisco Iglesias

> 
> Regards,
> Bin

