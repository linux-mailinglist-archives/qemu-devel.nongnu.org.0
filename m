Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB32B910F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:32:20 +0100 (CET)
Received: from localhost ([::1]:41588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiAl-0005UR-F5
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfi9W-0004ur-Oy
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:31:04 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:46170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfi9U-0002FK-Vc
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:31:02 -0500
Received: by mail-ej1-x644.google.com with SMTP id bo9so1669521ejb.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7HGC4DUpvTfkOOBmLvB80Rvp82QobPgkqhW3vgKExlo=;
 b=JpjmkKaQkAgVim3PkfeDClB68LqjUGUqq247rtpEKYBuu9sXxTEvwQVr+MGI9NM1Vl
 sSzKZVyvrTaB5+wh5fZ43jUGrlDocvWNSRwclt6zbADfWGhbmprDL6bR6DbTafX89imO
 PUAgRUa1xNBAp/JjzZuveaz6yCjm9XPm9DGnYndtr5TS4Y+UcOHTiJ0ovxBs76zehfAf
 /yTvVjtllTWEiUuXK2aWZDWxQqYZV5SvKaP0jdZ9H2AD4M6dDpT6AAX9Hi9+VtpUbBXI
 turvjFu90n4NS6R6V4ajllL7stdmYBHqwn+yYYT5Nw/Q1dBXidczbWsd5cyfaIrVHrSR
 euXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7HGC4DUpvTfkOOBmLvB80Rvp82QobPgkqhW3vgKExlo=;
 b=nZbGnbg86oynCXbe7va6sYi75F9i1uch+Bt1YT7hhGzKVCE6Gr67q9lY8o5y68rZvo
 jlb3HYkeIL9tABYehzCk1c8JVx3acx9OsBgAmJPhQ/Cn6UvkiZdOG2sTbp3eZz61UVrw
 pZBouLRnM417yCNecwVpQva9hoFQ03iCqe/k9aTFSgxMnBXbWyLrCEQ42pqCzdZbzZdG
 zasiZ5h3FE4LWeCFwXDnBGMZLzq0kUM7miCRlq8G9r+93k2vC0FA4+dOgj53/4jEP/De
 QQeSKB+XtNseIP6yiZ+6zwlt5koOs7Bnba3c/snO5rzGvd3qBYcyzbEheVNb/UoBlF1b
 Hz/w==
X-Gm-Message-State: AOAM531sBKSq6DBgYEufVu8MXlTmWvfZc82FAa9fJ0MnqrEf+I5tvtzZ
 B5JFCZJExcHRHPttrfUjUW1bDvgPj+Czyuy2Q75uUQ==
X-Google-Smtp-Source: ABdhPJyHVHNagYUasOvuL46YF6KTgXLnpIptCloydon3gkvRCbCi2AaTE8JEZKWBsEzrJumgsj3Szo2V9QRe75Sx7jo=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr17673526ejd.382.1605785459382; 
 Thu, 19 Nov 2020 03:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20201119092346.32356-1-peter.maydell@linaro.org>
 <87lfexvb8e.fsf@linaro.org>
In-Reply-To: <87lfexvb8e.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 11:30:48 +0000
Message-ID: <CAFEAcA_1y4iUgBYkW=4i3AXEKowh44-pRqFZ2AimbsS+BPR8Lg@mail.gmail.com>
Subject: Re: [PATCH for-5.2] target/arm: Make SYS_HEAPINFO work with RAM that
 doesn't start at 0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > QEMU's implementation when in system emulation mode is very
> > simplistic: we say that the heap starts halfway into RAM and
> > continues to the end of RAM, and the stack starts at the top of RAM
> > and works down to the bottom.
>
> So there is nothing to stop this value being in the middle of say a
> loaded kernel or something that happens to overrun into the second half
> of memory? AFAICT if an initrd is ever used it will likely smash that.

Correct, but the only code that uses SYS_HEAPINFO will be
the libc runtime startup code in simple 'bare metal' test
applications, which are likely to be pretty small.

> > Unfortunately the code assumes that
> > the base address of RAM is at address 0, so on boards like 'virt'
> > where this is not true the addresses returned will all be wrong and
> > the guest application will usually crash.
> >
> > Conveniently since all Arm boards call arm_load_kernel() we have the
> > base address of the main RAM block in the arm_boot_info struct which
> > is accessible via the CPU object.  Use this to return sensible values
> > from SYS_HEAPINFO.
>
> It's certainly an improvement but it feels like it could be a bit
> smarter. Maybe it's not an issue for sort of things that use
> semihosting?

This is what the comment about "TODO: Make this use the limit
of the loaded application" is about -- in theory if we know
what the ELF file we've just loaded is we could put the
heap start there rather than just assuming "the loaded
application is probably not using half of RAM for its image".
But the benefit in trying to do that is not great and the
complexity is quite large, given how many ways we have of
loading guest code. (I guess the theoretical ideal would
involve asking the rom-blob code for the largest available
empty space?)

thanks
-- PMM

