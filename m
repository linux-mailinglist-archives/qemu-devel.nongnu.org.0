Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFB2B8014
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:05:35 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfP1a-0008Vd-HJ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@kernel.org>) id 1kfJKT-0000je-L0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:00:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:51412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@kernel.org>) id 1kfJKR-0000Vu-LS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:00:41 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89E1524656
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605690036;
 bh=i9tBV0oZBsTReps0EogPqekfIEGahPYtFjMV0dB8U+U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TjCzdqFScODCSwu2HqQV/hZsXCizf8cSQGNq0E4s6V9KEfsorLbCddbZe5wx8Pvfq
 QUGYUe3B/02nyoOG++Le+tTxAzAu8vcdiXUBicX/furVaJA/8OMu9uobWvcycgmi68
 YbRE+d1hXTXxUMEjluROqGJr09HxR0jj4VUdy1Xg=
Received: by mail-oi1-f180.google.com with SMTP id c80so1435513oib.2
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 01:00:36 -0800 (PST)
X-Gm-Message-State: AOAM531gVvMFDRFcqoavIciKq23bvuaMJdqM9J4OV5iUW9NN0BYbW1il
 a9rDQ1YlazAktOeEzEe6/A4PHuDaCWAoacgDzYg=
X-Google-Smtp-Source: ABdhPJydSZXfIA6Ryj/nqlJBnSxKnJFPoskTXFwxpwxSaoVGbr/P/APPPfzylLk92sw1xEZ6AWYdYCMkzWbPDL2wVtI=
X-Received: by 2002:aca:180a:: with SMTP id h10mr2022489oih.4.1605690035742;
 Wed, 18 Nov 2020 01:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20201012220620.124408-1-linus.walleij@linaro.org>
 <20201013092240.GI32292@arm.com>
 <CACRpkdZoMoUQX+CPd31qwjXSKJvaZ6=jcFvUrK_3hkxaUWJNJg@mail.gmail.com>
In-Reply-To: <CACRpkdZoMoUQX+CPd31qwjXSKJvaZ6=jcFvUrK_3hkxaUWJNJg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 18 Nov 2020 10:00:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2SN2zeK=dj01Br-m86rJmK8mOyH=gHAidwSPgKAEthVw@mail.gmail.com>
Message-ID: <CAK8P3a2SN2zeK=dj01Br-m86rJmK8mOyH=gHAidwSPgKAEthVw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] fcntl: Add 32bit filesystem mode
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=arnd@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 04:00:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Nov 2020 10:01:08 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Linux API <linux-api@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Florian Weimer <fw@deneb.enyo.de>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 12:38 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Oct 13, 2020 at 11:22 AM Dave Martin <Dave.Martin@arm.com> wrote:
>
> > >       case F_SETFD:
> > >               err = 0;
> > >               set_close_on_exec(fd, arg & FD_CLOEXEC);
> > > +             if (arg & FD_32BIT_MODE)
> > > +                     filp->f_mode |= FMODE_32BITHASH;
> > > +             else
> > > +                     filp->f_mode &= ~FMODE_32BITHASH;
> >
> > This seems inconsistent?  F_SETFD is for setting flags on a file
> > descriptor.  Won't setting a flag on filp here instead cause the
> > behaviour to change for all file descriptors across the system that are
> > open on this struct file?  Compare set_close_on_exec().
> >
> > I don't see any discussion on whether this should be an F_SETFL or an
> > F_SETFD, though I see F_SETFD was Ted's suggestion originally.
>
> I cannot honestly say I know the semantic difference.
>
> I would ask the QEMU people how a user program would expect
> the flag to behave.

I agree it should either use F_SETFD to set a bit in the fdtable structure
like set_close_on_exec() or it should use F_SETFL to set a bit in
filp->f_mode.

It appears the reason FMODE_32BITHASH is part of  filp->f_mode
is that the only user today is nfsd, which does not have a file
descriptor but only has a struct file. Similarly, the only code that
understands the difference (ext4_readdir()) has no reference to
the file descriptor.

If this becomes an O_DIR32BITHASH flag for F_SETFL,
I suppose it should also be supported by openat2().

       Arnd

