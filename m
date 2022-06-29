Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9E5604B9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 17:36:56 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ZkM-0004NO-JA
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 11:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6ZiY-0002sX-WB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:35:03 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6ZiW-000521-Qy
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:35:02 -0400
Received: by mail-ej1-x630.google.com with SMTP id o25so909915ejm.3
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=81Uho7wSFyl4JiwtdzzWm+qT3Fu3UTXlGXCWdybfKfg=;
 b=Fvx6EqxzbJl+VERcGjoY3YQiWiP0eeSSkhm4qQYlJexajejPJW91PFcer+hmdVw1Dr
 Bf8U7Oj4kUYYKC67cjPunhtLCu3QaL8A/mW5OFHEk9mjyPLa02/H5zWdFUwS9qGe42JH
 PxhgEst1I2QrPT4q4cq6obnQoj2ksFhGUAKBGlYF4HGNHUzby3JzR0g7s7s99Ui5Kw34
 YX1wMbPJ5e20sUEOHVvSH8wHL+t34O7A0gy4bLxiKFdgqeTZteoROV6WHrkH2U62BIh2
 S0spDaWtlhqe3O59UWRbWGEKgYWz0H2KInyVb/wEOrqICUeaP14T6uKjzeh1xndYxHRZ
 KPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=81Uho7wSFyl4JiwtdzzWm+qT3Fu3UTXlGXCWdybfKfg=;
 b=UJ61OpztW2Y6p7Ss34msdCYViGk+/l2LQf0K1t0uqEqZ+3S8wRsyDnp8tmhX1RpXPm
 Akq3sJW0EZVV/RJhxmPaZHgh48HauhzT86I6y/cCA5V5KjbLJYHIdXiF3QutfspPK8QP
 o2Nb38ZmJElgR5u1hc283l8kcN2qWRShvoV4JaKm9kpEresqgk+WHBqWwPOHZZptPFI8
 8VwLWQD0Waz5xkDWP7RBwL0UoXVrgQZMw9dUFjUWN7cssTTnRZnBvXiWbwpID0yV4lc/
 QAew9l9MXD5GoZ9/N281/iR/gLpahMCCVfqJ4IQ8unbuxywyXavhVwB5mVZN7ulSzyEp
 wKrg==
X-Gm-Message-State: AJIora+x1MTZLmYFn0hz9QdWgV1HKQh+qahoMlRvPp8BS/C0uNbfplXv
 JrrUcAs92nMsGKADf56Hsh6KDQ==
X-Google-Smtp-Source: AGRyM1taO6DgIFt/BlcYusVFQpglt5ZEDY+2/MXApEwEhfIX32fjz5zy9sWBQVKy9EhV8ZkIKCepcg==
X-Received: by 2002:a17:907:86aa:b0:722:d5b2:fca2 with SMTP id
 qa42-20020a17090786aa00b00722d5b2fca2mr4067399ejc.264.1656516897502; 
 Wed, 29 Jun 2022 08:34:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a1709067c8300b00722fc0779e3sm7944642ejo.85.2022.06.29.08.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 08:34:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4FB71FFB7;
 Wed, 29 Jun 2022 16:34:55 +0100 (BST)
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
 <878rpfixfh.fsf@linaro.org> <Yrw2+X6Pi8qlTo2d@zx2c4.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
Date: Wed, 29 Jun 2022 16:24:20 +0100
In-reply-to: <Yrw2+X6Pi8qlTo2d@zx2c4.com>
Message-ID: <87r137h49s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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


"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Wed, Jun 29, 2022 at 11:18:23AM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>> > On Tue, 28 Jun 2022 at 19:45, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>> >>
>> >> On 6/27/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> >> > On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >> >> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:
>> >> >>>
>> >> >>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
>> >> >>> kaslr-seed property was added, but the equally as important rng-s=
eed
>> >> >>> property was forgotten about, which has identical semantics for a
>> >> >>> similar purpose. This commit implements it in exactly the same wa=
y as
>> >> >>> kaslr-seed.
>> >> >>
>> >> >> Not an objection, since if this is what the dtb spec says we need
>> >> >> to provide then I guess we need to provide it, but:
>> >> >> Why do we need to give the kernel two separate random seeds?
>> >> >> Isn't one sufficient for the kernel to seed its RNG and generate
>> >> >> whatever randomness it needs for whatever purposes it wants it?
>> >> >>
>> >> >
>> >> > Seems a bit silly to me too. `rng-seed` alone ought to be sufficien=
t.
>> >> > After the kernel calls add_bootloader_randomness() on it,
>> >> > get_random_long() can be used for kaslr'ing and everything else too.
>> >> > So I'm not sure what's up, but here we are. Maybe down the line I'll
>> >> > look into the details and formulate a plan to remove `kaslr-seed` if
>> >> > my supposition is correct.
>>=20
>> Sorry now I've had my coffee and read properly I see you are already
>> aware of kaslr-seed. However my point about suppression would still
>> stand because for the secure boot flow you need checksum-able DTBs.
>
> Please read the patch. Maybe take a sip of coffee first. There's a knob
> for this too.

I was obviously not paying enough attention this morning. Sorry about that.

> The code is exactly the same for kaslr-seed and rng-seed. Everytime
> there's some kaslr-seed thing, there is now the same rng-seed thing.

The duplication is annoying but specs are specs - where is this written
by the way?

Given the use case for the dtb-kaslr-seed knob I wonder if we should
have a common property and deprecate the kaslr one? As of this patch
existing workflows will break until command lines are updated to suppress
the second source of randomness.

Maybe it would be better to have a single a new property
(dtb-rng-seeds?) which suppresses both dtb entries and make
dtb-kaslr-seed an alias and mark it as deprecated.

--=20
Alex Benn=C3=A9e

