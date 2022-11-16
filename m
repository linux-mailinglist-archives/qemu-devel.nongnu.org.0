Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7F62BF31
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:17:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIG4-00008l-2Z; Wed, 16 Nov 2022 08:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovIG2-00008T-8C
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:15:14 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovIG0-0006iQ-67
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:15:14 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d20so16367307plr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 05:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FlwqcxVGEX1FCQ+JbGFYqIHtt5TjFucWhfYOApa1LaM=;
 b=H/BiymSScL0Wnd2WAYROsNcmgG71Gndmvi5mX513N4eCay30BZS0cy/oDAp7Np/6AI
 BnAPLGx7EA5tyc1n+h5+T6gp7LfmC7HqN8Ds40VFDrD77JDSDQgaqSO6XOrdpvtdYd+j
 pqEtuzYrTb4aEj2uXhGU3jTlxH54vIijGVxPMwGb8vxKaO3cc/f58pz0eGEBkKjyo98p
 64ZXRVPgLDw3q9j1BIoNK5SIVmmxbkZ2n0P6QhHh2Wn7i4srYQZG1SMvHXsEXtdWmYNr
 lpBB2xjN+rDLSLZVltgXDdEKLmZZiQ1lWt66/qIEo/KTXrepXSBu9RSCS/4uOBlwudgc
 IDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FlwqcxVGEX1FCQ+JbGFYqIHtt5TjFucWhfYOApa1LaM=;
 b=x67Z4Ld5Jvct1TSFGibQ/pD93sPjBuNS5hwUMHdFxpC+xdcBsvfzTrTlrkDKYzQQtW
 2ETUgZ+SZ4NCo34zCdD5dsA0H5B4XzUh2djAPzLFpiurJLR2AF4IiWdsV07S9l5HowdC
 ic92QZYQLAzd+JPeUGAx3oZK3Iw2slC2umYJItk+QNJzwiQzH2GbdUmaVxpjLIpFY5CQ
 FQXoYQqxBW3twVQHBnr75iHP/vv256m0bdCa2ZR5Oh0VBK5ooBD2rWvP+ZnLaxTJhz/X
 AQQZ/seIpLPRG5IIf1hoB9PaCgRReP+DVt3dMCY3YswpKG519poQu1S26DJKG4yWUjy7
 3j2g==
X-Gm-Message-State: ANoB5plmgguY2gfPWMG2JPhckzcKVZGWLkBnwIunH2GeSdQrcC26m1Ab
 IQFWxR+tNofJPYW0LAlaWkDWCWzpAVoett+IxWP+ow==
X-Google-Smtp-Source: AA0mqf7lbvqARA9CKWPNGL2RH4UiW2uwF1FAAYVyLgpfbVbbXbPpW/FRcED5gvX0iD9bUwWJOzT7Ntb9kjSRbmDdnr4=
X-Received: by 2002:a17:90a:cb8b:b0:205:edfd:13f7 with SMTP id
 a11-20020a17090acb8b00b00205edfd13f7mr3747790pju.19.1668604510144; Wed, 16
 Nov 2022 05:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
 <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
 <m2edu3ig2s.fsf@gmail.com>
In-Reply-To: <m2edu3ig2s.fsf@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Nov 2022 13:14:58 +0000
Message-ID: <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 16 Nov 2022 at 06:11, Schspa Shi <schspa@gmail.com> wrote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> >>
> >> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> >> >> > I think this lowmem does not mean below 4GB. and it is to make sure
> >> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
> >> >>
> >> >> The wording of this comment pre-dates 64-bit CPU support: it
> >> >> is talking about the requirement in the 32-bit booting doc
> >> >> https://www.kernel.org/doc/Documentation/arm/Booting
> >> >> that says
> >> >> "If an initramfs is in use then, as with the dtb, it must be placed in
> >> >> a region of memory where the kernel decompressor will not overwrite it
> >> >> while also with the region which will be covered by the kernel's
> >> >> low-memory mapping."
> >> >>
> >> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
> >> >> if you don't put the kernel, initrd, etc below 4GB.
> >> >
> >> > A kernel person corrects me on the meaning of "lowmem" here -- the
> >> > kernel means by it "within the first 768MB of RAM". There is also
> >> > an implicit requirement that everything be within the bottom 32-bits
> >> > of the physical address space.
> >> >
> >>
> >> Thanks for your comment.
> >>
> >> In this view, initrd shouldn't be placed higher than 4GB ? But it
> >> seems the Linux kernel can boot when there is no memory below 4GB.
> >
> > A *32 bit* kernel cannot -- it is completely unable to access
> > anything above the 4GB mark when the MMU is off, as it is on
> > initial boot. This QEMU code handles both 32 bit and 64 bit
> > kernel boot. These days of course there is 64-bit only hardware,
> > and that might choose to put its RAM above the 4GB mark,
> > because it isn't ever going to boot a 32-bit kernel anyway.
> >
>
> Yes, I think we should accept this patch, because it will not affect
> 32-bit devices, and provides support for 64-bit devices to put initrd
> above 4GB.

Yes, I agree. However since it doesn't cause a problem for any
of the machine models in upstream QEMU, I think we should leave
it until after the in-progress 7.2 release, so that we have
plenty of time to investigate just in case it does cause an
unexpected issue on 32-bit boards.

This patch is on my list to review and deal with when 7.2
goes out and development reopens for 8.0 (should be in about
four weeks).

thanks
-- PMM

