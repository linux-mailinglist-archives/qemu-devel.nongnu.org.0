Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA72CE8D7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 08:53:50 +0100 (CET)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl5uW-0000Ps-T6
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 02:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kl5tC-0008KJ-HA; Fri, 04 Dec 2020 02:52:26 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:40623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kl5tB-0008Sx-0j; Fri, 04 Dec 2020 02:52:26 -0500
Received: by mail-yb1-xb42.google.com with SMTP id o144so4582030ybg.7;
 Thu, 03 Dec 2020 23:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OT2CoLBMVdso7MCswFCXmBDmViD0XcyeD2eWQ006uU0=;
 b=mis+ux8QArHQXob2JRjg1lc88shq9ECHu7NDZ1L+snZwKleUYAYbiyZjaao1RTvusz
 Uo9nAx7qMlDhvNHLRVaoGx+Ja+NoAp42JZ54oVnbBRhHHl3SYPxLngCwD6KHVjpZKIfS
 c+Rg77LkzUN4QpnU27uuOEAMZDrEwnQCHZb2fUtmqxBeZeC940ZNPevccOhh9weNgp1c
 qeHJXdyRveaPRNmq7XaBk04/Mb8SCbmkWPuvDJxX/zhnlkhXc2fusAItg0A/S0ZvBVqm
 oeWpeIFrhLFZREGVYntBSrivbI6hXtGyvi6UllKZe8zXnwZtnz2tlLjrpWtpUNINVEXX
 GX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OT2CoLBMVdso7MCswFCXmBDmViD0XcyeD2eWQ006uU0=;
 b=G18eM+84Yl6g57WKuD052gqlHXC+tctNoS8OKTMVZ8Zpr6WFAuJSEW2H6B4eQaMXy2
 0tYl3StR4Jb1IIiRrda5wDbzxHeISvfI9Bo4M4QNs0FCsXEmrQZRNGc2FAFoLgLa7F/n
 I9KnILka5nsSEvEeNDkB53nXnw1QEq11VsndlAbsnWxerJATOZULWUClU2dR68KKsiud
 Gs+mrCfXjyAZNFi2uFNOMk4zRN4G6Ekhg5ABN1RvVssjnhOZ9gd15oby69VS/feo7gtF
 EBtl6kLqx5wPBmvB/m5uiyCUHRDEYfffXcQ3ARo98j7wZD5IpbtBED1Au5D8xnAhbWCl
 A+tQ==
X-Gm-Message-State: AOAM532ZE28BT2FiSMXqAE9Kb2G//rDZdCuSuZkkW1QD8wV0zwPjv3zT
 mZrkWkhTW6D7Abebd7DnpRXEWHsVaEjXAVlqZFM=
X-Google-Smtp-Source: ABdhPJxc8kEUYl7EfOk2VsMIEiTzU0nbPItDpBidKMb1/9RmI6jynzaIid1xFLCyXjjFnC+NebeIiMlWTSRcAXWthK8=
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr4123249ybp.306.1607068343364;
 Thu, 03 Dec 2020 23:52:23 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
 <20201203083759.GA2661@fralle-msi>
In-Reply-To: <20201203083759.GA2661@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 4 Dec 2020 15:52:12 +0800
Message-ID: <CAEUhbmVkF9W12o04JnYofLLWwTfnNBJDnC+_8iZvdgnyonMYag@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Thu, Dec 3, 2020 at 4:38 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin and Alistair,
>
> On [2020 Dec 02] Wed 11:40:11, Alistair Francis wrote:
> > On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > SST flashes require a dummy byte after the address bits.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > I couldn't find a datasheet that says this... But the actual code
> > change looks fine, so:
> >
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > Alistair
> >
> > > ---
> > >
> > >  hw/block/m25p80.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > index 483925f..9b36762 100644
> > > --- a/hw/block/m25p80.c
> > > +++ b/hw/block/m25p80.c
> > > @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
> > >      s->needed_bytes = get_addr_length(s);
> > >      switch (get_man(s)) {
> > >      /* Dummy cycles - modeled with bytes writes instead of bits */
> > > +    case MAN_SST:
> > > +        s->needed_bytes += 1;
>
> 1 dummy clk cycle is modelled as 1 byte write (see the comment above), so 1
> dummy byte (8 dummy clk cycles) will need +8 above.

I think you were confused by the WINBOND codes. The comments are
correct. It is modeled with bytes instead of bits, so we should +=1.

> An option could be to fall
> through to the Windbond case below instead (since it seems to operate
> likewise).
>
> Best regards,
> Francisco Iglesias
>
>
> > > +        break;
> > >      case MAN_WINBOND:
> > >          s->needed_bytes += 8;

Actually this is wrong. This should be corrected to +=1. I will
prepare a patch for it.

> > >          break;
> > > --

Regards,
Bin

