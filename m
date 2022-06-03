Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D550A53C653
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:36:18 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1qz-0007r8-Ok
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1nx1N6-0001Hd-V9
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 03:05:25 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1nx1N5-00056Q-0O
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 03:05:24 -0400
Received: by mail-qt1-f177.google.com with SMTP id f35so4976614qtb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 00:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sQNOc3aOgp6Rqa9AhVwP0GaUA1O2AOCXJw4YAMIOsV0=;
 b=wEzlmVI7I42XL4qKzjS9hK5Hk+GN1d1WZZyyetMAo3YAxfiYpOroKZooklYSbeQK4I
 bCSFspdshCCEoZn7iuB8oeYozs+9oFDyN8lDf8K8iL2uTNd2y9ze9nkB0arcXMvgO6PE
 b5g6wmfKwAeWQfWcUjPgDVuZPg0/yXYXIHybp+NAUv9EWPzsA32eqICz7MjThHTMIWwP
 n5Ctht+sgRINOgiGMkbkrgJ935PEvdzdOxGUYFXqoF3x8i/XRRvc5cfDcb9HvQPiyP2Z
 pYJfZNSQHRLU8/yg4GsK97G/0pz2JaFPSY2BW5X6xWiLQysZG4Q4EUKFi6aLRFXCkAVI
 /SGg==
X-Gm-Message-State: AOAM5315C6zJNVJcgYBa+yT5naDIsloN6B8pJmfGDoA5ufmk8+YmzezT
 wIrQBcLlfXGzqPJW98vxCBk1d/JwpSedHA==
X-Google-Smtp-Source: ABdhPJzRdno2UGr/n/9LfqQdikEk7mGJBm0OG4/VQK5nJnlcbTFcnGpF4HuePsfGpofA/W3e3c7sNA==
X-Received: by 2002:a05:622a:454:b0:2f3:d8fe:c650 with SMTP id
 o20-20020a05622a045400b002f3d8fec650mr6380903qtx.440.1654239921826; 
 Fri, 03 Jun 2022 00:05:21 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05620a121000b0069fc13ce226sm4574318qkj.87.2022.06.03.00.05.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 00:05:21 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id i11so12214647ybq.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 00:05:21 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr9710397ybu.604.1654239921003; Fri, 03
 Jun 2022 00:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
In-Reply-To: <YpkWllpTFzb2HHY5@antec>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jun 2022 09:05:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
Message-ID: <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
To: Stafford Horne <shorne@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.160.177;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-qt1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Stafford,

On Thu, Jun 2, 2022 at 9:59 PM Stafford Horne <shorne@gmail.com> wrote:
> On Thu, Jun 02, 2022 at 09:08:52PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jun 2, 2022 at 1:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > > On Fri, 27 May 2022 at 17:27, Stafford Horne <shorne@gmail.com> wrote:
> > > > This patch add the OpenRISC virtual machine 'virt' for OpenRISC.  This
> > > > platform allows for a convenient CI platform for toolchain, software
> > > > ports and the OpenRISC linux kernel port.
> > > >
> > > > Much of this has been sourced from the m68k and riscv virt platforms.
> >
> > > I enabled the options:
> > >
> > > CONFIG_RTC_CLASS=y
> > > # CONFIG_RTC_SYSTOHC is not set
> > > # CONFIG_RTC_NVMEM is not set
> > > CONFIG_RTC_DRV_GOLDFISH=y
> > >
> > > But it didn't work. It seems the goldfish rtc model doesn't handle a
> > > big endian guest running on my little endian host.
> > >
> > > Doing this fixes it:
> > >
> > > -    .endianness = DEVICE_NATIVE_ENDIAN,
> > > +    .endianness = DEVICE_HOST_ENDIAN,
> > >
> > > [    0.190000] goldfish_rtc 96005000.rtc: registered as rtc0
> > > [    0.190000] goldfish_rtc 96005000.rtc: setting system clock to
> > > 2022-06-02T11:16:04 UTC (1654168564)
> > >
> > > But literally no other model in the tree does this, so I suspect it's
> > > not the right fix.
> >
> > Goldfish devices are supposed to be little endian.
> > Unfortunately m68k got this wrong, cfr.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2e2ac4a3327479f7e2744cdd88a5c823f2057bad
> > Please don't duplicate this bad behavior for new architectures
>
> Thanks for the pointer, I just wired in the goldfish RTC because I wanted to
> play with it.  I was not attached to it. I can either remove it our find another
> RTC.

Sorry for being too unclear: the mistake was not to use the Goldfish
RTC, but to make its register accesses big-endian.
Using Goldfish devices as little-endian devices should be fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

