Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256453FAF1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:12:23 +0200 (CEST)
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWCE-0004fz-8a
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nyVo3-0006i0-AE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:47:23 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nyVo1-0001wX-K7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:47:23 -0400
Received: by mail-pl1-x629.google.com with SMTP id w3so14356364plp.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vJeVlnCDcDz6DV7yPj6XjrXJb6IuJLm4zpoWwv7zQ98=;
 b=Su6FwvMfw0jEP76hjVyitakSMSM56Gr2iGL/OEE6NVjEfHVDkhNkmt4g9wqprju1Dq
 JqHGVJT9O00DUDi77BrmjaKUOyoD8PmBe1rdn38FN5qVwTfpIp92aftp+yJoxWU3vpx3
 3IweOEmsztXbEEDzporQRyatF1r2bWHFBjNmXbV043sF9v40M0xcWUQS5X7h159MJ3pP
 LcbievtprPhKXOEQ/9gisyY42TDUJ6KW4DQ58NfyfIkwBtKeojOmgrcSWdCTJEGMuLqK
 PHc0l6YEarjP/Gy2iHdlgAHCc8pXWU8roWUTbuorVt+jzSoVwPXrbnHbAAVJbBqnOuJ3
 yPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vJeVlnCDcDz6DV7yPj6XjrXJb6IuJLm4zpoWwv7zQ98=;
 b=X3jXeeLCIX4+AcNzlRcvwt1uTmP6sl1+yeDLD9jR9MSaKMAF1L5JwHfl8QgC4Jr6AZ
 tOH5K6IZK7DPcKTG4ybrou6CEtv3H5JdtO61lRLFYkowccIynbgIYht8voGMfJjFX9iO
 MIkf3qfWIHYqF0CLRPVhQ8L8UN4j7Njtn3VjI44Jhzrm2ycxfP6uRizDuo3SkLFJ/ubh
 wtIINIjP3reHugHjXUZpXYFOH+01i8XMFt6L6dHW25xK7IxaMPYBGO3JkdezGpS+dkLP
 Pq3VgUf9jfgAw0xo9PJpq6X2y1lc9YML70GH7PqhmtUe7hn8HMkIXFuyJl0L3/khDd/5
 y5vA==
X-Gm-Message-State: AOAM531X9VWirz7AvXLSkevKQAV4B/2suwO2nwo5Rkk6BYZxDbi+ZGS/
 jsVbU2aiCT4CwFx5Jfh7Y/s=
X-Google-Smtp-Source: ABdhPJx0rjBMo9UkTnVPNMyh8ONOrBjwJ5wHVHlGfkHzzm2AuOZlTLaZPj9HY1iwLp8XbyxiFVeLwg==
X-Received: by 2002:a17:90a:5301:b0:1e8:41d8:d0f5 with SMTP id
 x1-20020a17090a530100b001e841d8d0f5mr21638858pjh.175.1654595239511; 
 Tue, 07 Jun 2022 02:47:19 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170903214500b0015ea95948ebsm11918049ple.134.2022.06.07.02.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:47:18 -0700 (PDT)
Date: Tue, 7 Jun 2022 18:47:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>,
 QEMU Development <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
Message-ID: <Yp8epZsizfKMEVZV@antec>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec>
 <CAMuHMdVwAzbAOBDcv4y1WmYgCaFOMdywxUZvwMtDccOgDMN+mw@mail.gmail.com>
 <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x629.google.com
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

On Tue, Jun 07, 2022 at 10:42:08AM +0200, Arnd Bergmann wrote:
> On Tue, Jun 7, 2022 at 10:11 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Jun 5, 2022 at 9:32 AM Stafford Horne <shorne@gmail.com> wrote:
> > > On Sun, Jun 05, 2022 at 10:58:14AM +0900, Stafford Horne wrote:
> > >     It might be a good idea to revisit the qemu implementation and make
> > >     sure that the extra byteswap is only inserted on m68k and not on
> > >     other targets, but hopefully there are no new targets based on goldfish
> > >     anymore and we don't need to care.
> > >
> > > So, it seems that in addition to my patch we would need something in m68k to
> > > switch it back to 'native' (big) endian?
> > >
> > > Looking at the m68k kernel/qemu interface I see:
> > >
> > > Pre 5.19:
> > >    (data) <-- kernel(readl / little) <-- m68k qemu (native / big) - RTC/PIC
> > >    (data) <-- kernel(__raw_readl / big) <-- m68k qemu (native / big) - TTY
> > >
> > > 5.19:
> > >    (data) <-- kernel(gf_ioread32 / big) <-- m68k qemu (native / big) - all
> > >
> > > The new fixes to add gf_ioread32/gf_iowrite32 fix this for goldfish and m68k.
> > > This wouldn't have been an issue for little-endian platforms where readl/writel
> > > were originally used.
> > >
> > > Why can't m68k switch to little-endian in qemu and the kernel?  The m68k virt
> > > platform is not that old, 1 year? Are there a lot of users that this would be a big
> > > problem?
> > >
> > > [1] https://lore.kernel.org/lkml/CAK8P3a1oN8NrUjkh2X8jHQbyz42Xo6GSa=5n0gD6vQcXRjmq1Q@mail.gmail.com/
> 
> Goldfish is a very old platform, as far as I know only the kernel port is new.
> I don't know when qemu started shipping goldfish, but changing it now would
> surely break compatibility with whatever OS the port was originally made for.

Hi Arnd,

As far as I can tell goldfish in qemu is not very old. There are 3 devices, 2 were
added for the m68k virt machine, and 1 for riscv virt.

    $ git lo -- hw/rtc/goldfish_rtc.c
    2022-01-28 2f93d8b04a Peter Maydell    rtc: Move RTC function prototypes to their own header 
    2021-03-04 6b9409ba5f Laurent Vivier   goldfish_rtc: re-arm the alarm after migration 
    2020-10-13 16b66c5626 Laurent Vivier   goldfish_rtc: change MemoryRegionOps endianness to DEVICE_NATIVE_ENDIAN 
    2020-07-22 8380b3a453 Jessica Clarke   goldfish_rtc: Fix non-atomic read behaviour of TIME_LOW/TIME_HIGH 
    2020-02-10 9a5b40b842 Anup Patel       hw: rtc: Add Goldfish RTC device 

    $ git lo -- hw/char/goldfish_tty.c
    2021-11-09 65b4c8c759 Philippe Mathieu-Daud� hw/m68k: Fix typo in SPDX tag 
    2021-03-15 8c6df16ff6 Laurent Vivier   hw/char: add goldfish-tty 

    $  git lo -- hw/intc/goldfish_pic.c
    2021-11-09 65b4c8c759 Philippe Mathieu-Daud� hw/m68k: Fix typo in SPDX tag 
    2021-03-15 8785559390 Laurent Vivier   hw/intc: add goldfish-pic 

The mips/loongson3_virt machine now also uses the goldfish_rtc.

The problem with the goldfish device models is that they were defined as
DEVICE_NATIVE_ENDIAN.

    $ grep endianness hw/*/goldfish*
    hw/char/goldfish_tty.c:    .endianness = DEVICE_NATIVE_ENDIAN,
    hw/intc/goldfish_pic.c:    .endianness = DEVICE_NATIVE_ENDIAN,
    hw/rtc/goldfish_rtc.c:    .endianness = DEVICE_NATIVE_ENDIAN,

RISC-V is little-endian so when it was added there was no problem with running
linux goldfish drivers.

MIPS Longson3, added last year, seems to be running as little-endian well, I
understand MIPS can support both big and little endian. However according to
this all Loongson cores are little-endian.

    https://en.wikipedia.org/wiki/Loongson

As I understand when endianness of the devices in qemu are defined as
DEVICE_NATIVE_ENDIAN the device endian takes the endian of the target CPU.
This means that MIPS Loongson3 and RISC-V are affectively running as
little-endian which is what would be expected.

So it appears to me that in qemu that m68k is the only architecture that is
providing goldfish devices on a big-endian architecture.  Also, as far as I
know Linux is the only OS that was updated to cater for that.  If there are
other firmware/bootloaders that expect that maybe they could be updated too?

-Stafford

