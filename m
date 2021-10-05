Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318CF42305A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:49:07 +0200 (CEST)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpUv-0006iN-Nr
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXpAw-0007A9-O4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:28:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXpAr-0004eI-S6
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 14:28:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 g198-20020a1c20cf000000b0030d60cd7fd6so356480wmg.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=balllrdYxCknSFzBJRCz5b43G8sYD6gnObCb987LYKk=;
 b=Y9HUydSfwPN1DaeeypW2uHSD9STf2l98adUNp8658YLUp0mx6o9tyfHdd/cr1rx3wC
 +FCM/6iKHTkAcrZGbFlrIsR+UY3cv+jqbpVsrC26WgdnTblRwWBQgNarQJ999fhL2rfv
 kV7nVM2vNXOo828srFhqgpt0EsuBeabh2Q+UfrM/NM7ZdEj1W8Ri6LyqgauEsG75PsW1
 foHh8qcKaA8jfuILJz+eplRASzNgPxA2evCM0VXa75SdaO8dyPNyPDqDO8TW5LBJRj3O
 zULGHXslJVrvgsRLQLb+4s32O0aDuzqxecy1Do2T1iAzUGZZaWI2d4uJ+eF+DVUFGd+E
 0XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=balllrdYxCknSFzBJRCz5b43G8sYD6gnObCb987LYKk=;
 b=4xpuKpgHmULuuc3TImju6GvtED/MBHPe816tzK2BMsX+rYVOixYwX2onwK9wzNOBfA
 r/tlhUerDiObxYMPn6xmgvCahwP/6zbKnq0RTqm75J0k74+kiAyKZYSYF7eHTxRiRHbj
 kl7mK+G7koCp6IPcZt+pg7fey0xl33G61Y0B+9dNNEme3PulCnkdk9Af912ZcIvu9BNa
 dqQ0pxo/4+Wa21JvNwexq2sBkTlHrJpv4Y5isuwB9T4wx3rl8RPRJevEn+FaH0Qatyxq
 w1ltz2OY3subKXNS0jWZj++NtqApU20HOCLFF2zTLLJ6jFWl6kitND2SDC2ee/myNt11
 +mFg==
X-Gm-Message-State: AOAM530VCXmFjJu/zQPUGfNo09sa2tdmJStDUV6eXEFlWwvjvfOg5/Mr
 jbl4teoaN7QgoNOKF/ck4GcT/2CSfavbpA==
X-Google-Smtp-Source: ABdhPJyvFrYqpfxc7eOYVNhh73PAQokO2KHzRVkdY/0DxVQey1444GqukclexDdqPWur2iH4ZpgX1Q==
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr5019999wms.176.1633458500175; 
 Tue, 05 Oct 2021 11:28:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r19sm2482597wmp.43.2021.10.05.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:28:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A56CD1FF96;
 Tue,  5 Oct 2021 19:28:18 +0100 (BST)
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
 <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Date: Tue, 05 Oct 2021 19:28:08 +0100
In-reply-to: <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
Message-ID: <87a6jnfhrx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On Mon, Sep 27, 2021 at 11:15 AM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>> On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
>> > Reported-by: Warner Losh <imp@bsdimp.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> > ---
>> >  bsd-user/meson.build | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
>> > index 03695493408..a7607e1c884 100644
>> > --- a/bsd-user/meson.build
>> > +++ b/bsd-user/meson.build
>> > @@ -1,3 +1,7 @@
>> > +if not config_host.has_key('CONFIG_BSD')
>> > +  subdir_done()
>> > +endif
>> > +
>> >  bsd_user_ss.add(files(
>> >    'bsdload.c',
>> >    'elfload.c',
>>
>>
>> So, what's the reason for this change?
>
> https://lore.kernel.org/qemu-devel/CANCZdfprC16ezJQCWJmYEApX6eym9nxSOqAtB=
AGr+cziS4r2qw@mail.gmail.com/
>
> linux-user/meson.build is evaluated on bsd, and bsd-user/meson.build on L=
inux.
>
>> The commit messages and
>> the cover letter don't really explain it. Is this fixing a bug
>> (if so what?), a precaution to avoid possible future bugs,
>> fixing a performance issue with how long meson takes to run (if
>> so, how much effect does this have), or something else?
>
> I'll wait for feedback from Paolo, then work on the explanation.

Ping Paolo?

--=20
Alex Benn=C3=A9e

