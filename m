Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058155FC61
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:48:01 +0200 (CEST)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UIh-0006iG-VF
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6U8u-0002c6-CQ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:37:53 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6U8o-0001XR-NQ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:37:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id p7so25487027ybm.7
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 02:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9q+/aEvb1w9BvNmVUo/iyVyyOWPuG2QNZhWuM0LCvYE=;
 b=EXg4tmkwFZKdz/DYtPsllgqg1VshHQsbVGO+8ZfMfKR/YFUGfcewg226cs3/dEK37w
 yXHkMKdfyVMOuEkRivYTjfnX6cUHG6saNTpfSxhX5lg85LIk882YyhNA+NWBcTzoDFYd
 2juNVS8YO0yJy/j7U6jGjBzT+ZxGRjI8F1PtT8RC59WUHFfZdfkl5MENCyujUl4z47vt
 nUzxaRNhyiLpVVt8skb3p26lQVoInXRCwRRr1BPBB9I5fd2EB7OnGNXItrxAhE3E3I+S
 PwN13YNjK99jEe6Qju0ucczJtWcLQl5tQP6Zd4phctXQzbuWzwkZwRfKoSvhiOYrpMbh
 uTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9q+/aEvb1w9BvNmVUo/iyVyyOWPuG2QNZhWuM0LCvYE=;
 b=ZkDw7VPezVHVdqjwYdDxYwjspDUiqFFZ9uEzxY+8LwOwpV0ojY1GiJU5QEftAliEqs
 siwdQNNFyhASnqEpJ5IhhltgRNshWP4WebLtyhf6jnBw/pUa06sad5ALDT0po4EXR3/8
 Mh3AUOVu7jC81em6up0tBlHGEuLWXqzjULX5KN8H8Q0z8YqZpzrlT8Sdrhn1upG8xVLU
 mB9gfGZ0rstWELQCqXz+169z65o7Ia1OjdyTrvv+nFN8dhLFe6re8Xe28lf2WHCLYMJA
 3hYw+loEKDzNgBA/hNQ61ODGzBRFJGKr88qiNjanSiiOIZABL2e5hOrDBngJ/xMqZpkb
 kFmg==
X-Gm-Message-State: AJIora+gkf1Y3JeGPzpHPECjOTc8aDA7RUTOQsDBzoDvtf0z6RQaPUn7
 yDyiV53Sp506qnp2SqiLdHNhyk6BMRjj1RaZTsLqkYaK7Ys=
X-Google-Smtp-Source: AGRyM1v5bL3FU+WKj+3JB2sQCG+DhYAtQ+vCbXrMx0LXe0JQlUNXfZUWNSX0QYJxKjut9sZZBMXJ6V4ActxlSqjX9yo=
X-Received: by 2002:a25:2497:0:b0:66c:f49b:94cb with SMTP id
 k145-20020a252497000000b0066cf49b94cbmr2342506ybk.140.1656495465223; Wed, 29
 Jun 2022 02:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
In-Reply-To: <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Jun 2022 10:37:07 +0100
Message-ID: <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 28 Jun 2022 at 19:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On 6/27/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >>>
> >>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
> >>> kaslr-seed property was added, but the equally as important rng-seed
> >>> property was forgotten about, which has identical semantics for a
> >>> similar purpose. This commit implements it in exactly the same way as
> >>> kaslr-seed.
> >>
> >> Not an objection, since if this is what the dtb spec says we need
> >> to provide then I guess we need to provide it, but:
> >> Why do we need to give the kernel two separate random seeds?
> >> Isn't one sufficient for the kernel to seed its RNG and generate
> >> whatever randomness it needs for whatever purposes it wants it?
> >>
> >
> > Seems a bit silly to me too. `rng-seed` alone ought to be sufficient.
> > After the kernel calls add_bootloader_randomness() on it,
> > get_random_long() can be used for kaslr'ing and everything else too.
> > So I'm not sure what's up, but here we are. Maybe down the line I'll
> > look into the details and formulate a plan to remove `kaslr-seed` if
> > my supposition is correct.
> >
> > Jason
> >
>
> Was wondering if you planned to queue this up?

It's on my todo list to review...

-- PMM

