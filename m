Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CB53DAB9
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 09:34:44 +0200 (CEST)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxkmY-0001Gl-UW
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 03:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nxkkF-0000Rj-Jr
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 03:32:19 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nxkkD-0001sJ-DL
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 03:32:19 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso9824951pjb.0
 for <qemu-devel@nongnu.org>; Sun, 05 Jun 2022 00:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dtcwJt3hwNtes5OTnKGrNdQuyoqAMe1EVZ+I3mFSpVU=;
 b=FuuHhbcZhPEqWHyZtXk6Tp8BQmbyg92qIgm8mTsjR9Z8aBzPk3odhCmrYKoAal8C5a
 cD/LslQVD25Qg5scfckyzpI/Vmc9kYfVWWiSStmOHx77F85zs0n45b2MwItbqh/5NDoo
 GREViDNC9yahJdd+3P8kShYXbjD+kNUjI+x/LnszLIlRgdqPRCfiOjyv6KvBXv5srRe0
 KE+t9g/E5IZcSYsKAInDHTLdX5f5X/bkf3hX8fyNr+k8XmWx4JyPv9tqX1ylLOaaCREb
 uVApmYZ41sCUAahikrtUEPsgi2URJxcJKPlWqnNAdIAXnAG7ifT5p7X1llz0FqO/TRmE
 gZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dtcwJt3hwNtes5OTnKGrNdQuyoqAMe1EVZ+I3mFSpVU=;
 b=KpHG1b3H7lhh0BNiLcMzKuhYslqqa89lIZmZura5u4vSSeIVafcJ8kTq8sC/1FWqb9
 x2ksbtXR8DFfFG6OHJLdC7DTPPkboiYu/z7+Qwft+nBLQQukzDTk2QZl882B9G292kgg
 X7bV4evPwA8z8Xb9ElDZLs9kB1pJTDxBKqZO+DbViXWqeeQkFyVSU0FZPYcsy4VMOxd/
 lXiG6S6pitsYRr1VlOYBCEtVgyxQbHxF1yuO4HuOhMz9UsPPYS6KZtaLmOdYuUFpS12C
 a4ejsh2VulWJ1tu3fkEseFrFX4/5PZWCFEULPlO7gTmpDAugi+vY7l6MfrR+hC+e/b3u
 giSg==
X-Gm-Message-State: AOAM5337voJphEUK4W5QXFFFNpnw9HEEZZrQ67ylEnmEtb68YXBCj50n
 28hB7inrCDAJ5StO6dw54p0=
X-Google-Smtp-Source: ABdhPJyKyEYp7OHLScxNfZtt1ref9DRAwEh+W1F0nsfflhgy7i6W0Fgaw/tYqFbS/BiZZM8OUpXz3w==
X-Received: by 2002:a17:903:1c2:b0:163:ef7b:e10f with SMTP id
 e2-20020a17090301c200b00163ef7be10fmr18158661plh.158.1654414335537; 
 Sun, 05 Jun 2022 00:32:15 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 68-20020a621947000000b00519303c55acsm8395997pfz.1.2022.06.05.00.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 00:32:14 -0700 (PDT)
Date: Sun, 5 Jun 2022 16:32:13 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joel Stanley <joel@jms.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <Ypxb/VDfYLFg3n2s@antec>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpwNtowUTxRbh2Uq@antec>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 05, 2022 at 10:58:14AM +0900, Stafford Horne wrote:
> On Fri, Jun 03, 2022 at 09:05:09AM +0200, Geert Uytterhoeven wrote:
> > Hi Stafford,
> > 
> > On Thu, Jun 2, 2022 at 9:59 PM Stafford Horne <shorne@gmail.com> wrote:
> > > On Thu, Jun 02, 2022 at 09:08:52PM +0200, Geert Uytterhoeven wrote:
> > > > On Thu, Jun 2, 2022 at 1:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > > > > On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
> > > > > > This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
> > > > > > platform allows for a convenient CI platform for toolchain, software
> > > > > > ports and the OpenRISC linux kernel port.
> > > > > >
> > > > > > Much of this has been sourced from the m68k and riscv virt platforms.
> > > >
> > > > > I enabled the options:
> > > > >
> > > > > CONFIG_RTC_CLASS=y
> > > > > # CONFIG_RTC_SYSTOHC is not set
> > > > > # CONFIG_RTC_NVMEM is not set
> > > > > CONFIG_RTC_DRV_GOLDFISH=y
> > > > >
> > > > > But it didn't work. It seems the goldfish rtc model doesn't handle a
> > > > > big endian guest running on my little endian host.
> > > > >
> > > > > Doing this fixes it:
> > > > >
> > > > > -    .endianness = DEVICE_NATIVE_ENDIAN,
> > > > > +    .endianness = DEVICE_HOST_ENDIAN,
> > > > >
> > > > > [    0.190000] goldfish_rtc 96005000.rtc: registered as rtc0
> > > > > [    0.190000] goldfish_rtc 96005000.rtc: setting system clock to
> > > > > 2022-06-02T11:16:04 UTC (1654168564)
> > > > >
> > > > > But literally no other model in the tree does this, so I suspect it's
> > > > > not the right fix.
> > > >
> > > > Goldfish devices are supposed to be little endian.
> > > > Unfortunately m68k got this wrong, cfr.
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e2ac4a3327479f7e2744cdd88a5c823f2057bad
> > > > Please don't duplicate this bad behavior for new architectures
> > >
> > > Thanks for the pointer, I just wired in the goldfish RTC because I wanted to
> > > play with it.  I was not attached to it. I can either remove it our find another
> > > RTC.
> > 
> > Sorry for being too unclear: the mistake was not to use the Goldfish
> > RTC, but to make its register accesses big-endian.
> > Using Goldfish devices as little-endian devices should be fine.
> 
> OK, then I would think this patch would be needed on Goldfish.  I tested this
> out and it seems to work:

Sorry, it seems maybe I mis-understood this again.  In Arnd's mail [1] he, at
the end, mentions.

    It might be a good idea to revisit the qemu implementation and make
    sure that the extra byteswap is only inserted on m68k and not on
    other targets, but hopefully there are no new targets based on goldfish
    anymore and we don't need to care.

So, it seems that in addition to my patch we would need something in m68k to
switch it back to 'native' (big) endian?

Looking at the m68k kernel/qemu interface I see:

Pre 5.19:
   (data) <-- kernel(readl / little) <-- m68k qemu (native / big) - RTC/PIC
   (data) <-- kernel(__raw_readl / big) <-- m68k qemu (native / big) - TTY

5.19:
   (data) <-- kernel(gf_ioread32 / big) <-- m68k qemu (native / big) - all

The new fixes to add gf_ioread32/gf_iowrite32 fix this for goldfish and m68k.
This wouldn't have been an issue for little-endian platforms where readl/writel
were originally used.

Why can't m68k switch to little-endian in qemu and the kernel?  The m68k virt
platform is not that old, 1 year? Are there a lot of users that this would be a big
problem?

[1] https://lore.kernel.org/lkml/CAK8P3a1oN8NrUjkh2X8jHQbyz42Xo6GSa=5n0gD6vQcXRjmq1Q@mail.gmail.com/

-Stafford

> Patch:
> 
> diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
> index 35e493be31..f1dc5af297 100644
> --- a/hw/rtc/goldfish_rtc.c
> +++ b/hw/rtc/goldfish_rtc.c
> @@ -219,7 +219,7 @@ static int goldfish_rtc_post_load(void *opaque, int
> version_id)
>  static const MemoryRegionOps goldfish_rtc_ops = {
>      .read = goldfish_rtc_read,
>      .write = goldfish_rtc_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
>          .min_access_size = 4,
>          .max_access_size = 4
> 
> Boot Log:
> 
>     io scheduler mq-deadline registered
>     io scheduler kyber registered
>     Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>     90000000.serial: ttyS0 at MMIO 0x90000000 (irq = 2, base_baud = 1250000) is a 16550A
>     printk: console [ttyS0] enabled
>     loop: module loaded
>     virtio_blk virtio1: [vda] 32768 512-byte logical blocks (16.8 MB/16.0 MiB)
>     Freeing initrd memory: 1696K
>    *goldfish_rtc 96005000.rtc: registered as rtc0
>    *goldfish_rtc 96005000.rtc: setting system clock to 2022-06-05T01:49:57 UTC (1654393797)
>     NET: Registered PF_PACKET protocol family
>     random: fast init done
> 
> -Stafford

