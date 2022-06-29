Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D955FD14
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:24:45 +0200 (CEST)
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UsF-0000El-Fi
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6UnY-0004L9-JO
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:19:53 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6UnW-0003Yu-QQ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:19:52 -0400
Received: by mail-ej1-x62e.google.com with SMTP id pk21so31645992ejb.2
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1fA9tqVUsYfS9I6T3ZrGKYJ9ANPAYYk+nSE5LzpFuWA=;
 b=nQjjst8A9Oo6io2fxIh3h2nzrhoMafPdU+OXljpA/+cf0GRKSqxTQ0qKTczQbCo4lt
 /gcwQVu4OosSqBMplwBpfrOoM3aGysZWjUSoyIT3Z9RcWY7b+pxa0QtkB7UPthkoPdYy
 T+KBTiYx+8THrzvwYLs0uZS6k00qozhzqGDM3I4ZviBwyOGRxW0gMj7wHWSZOSwi7bcl
 G0v6f5bQD0lDRYeTOTV4nafUyHotQwWihojZf+D+18zCotOQURbhjQJ1Wb1DSCjLwD3y
 WrG7Q5qrEZLEDD3j5IZ9YllTiX8070/h7qgQGdQbgCdby/TJnZ8jrvmcm80b4Zt71xKB
 F75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1fA9tqVUsYfS9I6T3ZrGKYJ9ANPAYYk+nSE5LzpFuWA=;
 b=vU7c8JYWKkMaeM/m50QugwDFDMc5P+9Y3OFGkXWAVCwukUqEGoEvS7K3tXe9uqypFS
 o4uX+OcEuuNiGhkVVTtyYzBGlW620qRk9aTzH5z8BiuR48Jw9i/Zr+0eMKTatroBo4Af
 eS8OJ7fXHcgbhULK5CLuIWm2IkoZZ4X6C5xy3x2/nFL2ysv7peEAru1XVE3E4QqxQXq6
 YVxcn9a692ubKV/hehMyeOTBR/xmZmnNGErWGIUIHkThGGTVbFICb5jKSI3gj1zmP9Tm
 d4cSMr3NW51kRKs58CJuHdx5qzPxdUteNfjCcNFDGRYhLxidSvGVI7EAp7F0eQRzZWFJ
 gTCA==
X-Gm-Message-State: AJIora/yFn2WLxqCrWGqXJjRAHhfQyPkw8ASB0X6ZeI70dfnJLm7AA6W
 Uc79Dbn13ShcQr+dfvpXdJb1Ng==
X-Google-Smtp-Source: AGRyM1sxwPNv7HgkWJ87da56uGDQerYaLybNHT/B2bGJki+PedyQZAW2Yl0Iccb2HTljiXBTOmFEew==
X-Received: by 2002:a17:906:9753:b0:722:f1e3:ec27 with SMTP id
 o19-20020a170906975300b00722f1e3ec27mr2478974ejy.355.1656497988455; 
 Wed, 29 Jun 2022 03:19:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170906839600b00711d5bc20d5sm7433799ejx.221.2022.06.29.03.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 03:19:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25F1F1FFB7;
 Wed, 29 Jun 2022 11:19:46 +0100 (BST)
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
Date: Wed, 29 Jun 2022 11:18:23 +0100
In-reply-to: <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
Message-ID: <878rpfixfh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 28 Jun 2022 at 19:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> On 6/27/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> > On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wr=
ote:
>> >>>
>> >>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
>> >>> kaslr-seed property was added, but the equally as important rng-seed
>> >>> property was forgotten about, which has identical semantics for a
>> >>> similar purpose. This commit implements it in exactly the same way as
>> >>> kaslr-seed.
>> >>
>> >> Not an objection, since if this is what the dtb spec says we need
>> >> to provide then I guess we need to provide it, but:
>> >> Why do we need to give the kernel two separate random seeds?
>> >> Isn't one sufficient for the kernel to seed its RNG and generate
>> >> whatever randomness it needs for whatever purposes it wants it?
>> >>
>> >
>> > Seems a bit silly to me too. `rng-seed` alone ought to be sufficient.
>> > After the kernel calls add_bootloader_randomness() on it,
>> > get_random_long() can be used for kaslr'ing and everything else too.
>> > So I'm not sure what's up, but here we are. Maybe down the line I'll
>> > look into the details and formulate a plan to remove `kaslr-seed` if
>> > my supposition is correct.

Sorry now I've had my coffee and read properly I see you are already
aware of kaslr-seed. However my point about suppression would still
stand because for the secure boot flow you need checksum-able DTBs.

--=20
Alex Benn=C3=A9e

