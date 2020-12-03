Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14062CD162
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 09:39:41 +0100 (CET)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkk9M-0004CX-PA
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 03:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kkk7q-0003EZ-S6; Thu, 03 Dec 2020 03:38:06 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kkk7p-0003hY-6t; Thu, 03 Dec 2020 03:38:06 -0500
Received: by mail-lf1-x142.google.com with SMTP id r24so1514118lfm.8;
 Thu, 03 Dec 2020 00:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GbGBKwDDT959OToYXEGOgBUEct9NSyrRenpQR/BPLDk=;
 b=H43LG5mWn9NDtKWRgSiPrNSX04AabvBbfJXNw60nuylU0e+DwcpG57LSJlDy4l/fiq
 VvZ45iYNr1P4vEJSBmNW7R28IQeJ4Ul1VhxB3vCXRn/eWqwq2o+rq1wB1jWcaBMChAGP
 RY7XUEspc5n4qJ0RPHQu2vU+lrzZgvQ+cMsFy8BwYXtTrEuFNB0pmhLXIVwWYad3WSWI
 NVIB1Fbui/41U8QvZZyinss9/mF936rpASb7y13y5c3jlyY3mAFpzm2m+Jjl/fBZwFQE
 1ffA2knzzcAaQklUKqTLGZEqt1Q1tqDIrdRUb/dr/mZncLx1JU2OhoyY+9tKu3Nmli5h
 84Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GbGBKwDDT959OToYXEGOgBUEct9NSyrRenpQR/BPLDk=;
 b=ceKhLLmG1n/oFHtxvdDajXI6fBL57OEQzKY7l13WnC5t0mQCSDp3BjoVOO43ExjXIh
 JJVQDj1KqoU0N5sEXsujNCYCHpWPP+m8K7xrE9QXQEYnCvbE1sUcvsXEvHPFmLyzg7VY
 TRgnmAaxPDPdXWt/pIZcvulQfFH+nM5+hpEpkqLP3XzDYweCR09RwUg5EOtXuLVyteIr
 MzFseTqDvTXZlNTLvc5yOJ5xKArmthf4Qz5haNjas5YQqzV/wCctwBTxRVFK7o5+HJZU
 JuQupMQbBxSusDJJdo82nVqy937w3+kjsRPJ8NtPRkfZgwvA7jcNwMsY0XdQRDdjAuwx
 tErw==
X-Gm-Message-State: AOAM533IRGpGp8CP9x9vdXu5dYT2BDWFtflXmTQj+0p5aKNMVWQ30nve
 cXr5DkvC3A/0ApKQx8easT0=
X-Google-Smtp-Source: ABdhPJw1zmKJsBHHJQP8LjYYujjD9GdvQ4TvsFLKVYL8DcqdY1yntCcrFrcnHbd8TV6gZFdEXS208w==
X-Received: by 2002:a19:f243:: with SMTP id d3mr833988lfk.534.1606984682796;
 Thu, 03 Dec 2020 00:38:02 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 x24sm257121lfc.303.2020.12.03.00.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 00:38:02 -0800 (PST)
Date: Thu, 3 Dec 2020 09:38:00 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
Message-ID: <20201203083759.GA2661@fralle-msi>
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x142.google.com
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
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin and Alistair,

On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > SST flashes require a dummy byte after the address bits.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> I couldn't find a datasheet that says this... But the actual code
> change looks fine, so:
> 
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 
> > ---
> >
> >  hw/block/m25p80.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index 483925f..9b36762 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> >      s->needed_bytes = get_addr_length(s);
> >      switch (get_man(s)) {
> >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > +    case MAN_SST:
> > +        s->needed_bytes += 1;

1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
dummy byte (8 dummy clk cycles) will need +8 above. An option could be to fall
through to the Windbond case below instead (since it seems to operate
likewise). 

Best regards,
Francisco Iglesias


> > +        break;
> >      case MAN_WINBOND:
> >          s->needed_bytes += 8;
> >          break;
> > --
> > 2.7.4
> >
> >
> 

