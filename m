Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C985666C715
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:27:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSKJ-0002vm-6N; Mon, 16 Jan 2023 11:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHSKG-0002vV-T6
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:27:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHSKF-0001k5-0c
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:27:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so2889439wmb.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhtz7DaEGF3XPAqbo3Ci4KNB0x9iykPTQI/n0n6zHNA=;
 b=VXXx6HqT7exuNuP3jV1zYpJHt8LLcDCi0lNJCpWTuw6qjEiFGi2HX4EAoPAQFZw+gd
 /1m45aCzOZ9NxPPAq7jQpQhlJ1mZKdrccwEx1hbrVr0ZcJnzlHmA2EtQJRT7k0JUWeYi
 luFvBaXIXg2g1PSh/AfyTEwLDZjHEU+f4+Nky6Oi3XZt4r821ks+dIP30SDVxFNddcnT
 lfA2uoZZBbKL/vI0V1MmSJod2oleVsQu938PRLBmqZJ+9um7Hu3hzl3Cq6nXIJm5P9Mw
 paTsH4bRov4P+0Nk/hN6sYD3Qe7qhpYvHqlx6NiHAF8DOTusWqZ9GghwUgdt/yjpaafN
 aKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fhtz7DaEGF3XPAqbo3Ci4KNB0x9iykPTQI/n0n6zHNA=;
 b=tPlKupbAcGV2wdiDGgMYq/SSVaM3jwF1ZvrR+twEwjbbSwNYlp35EHGz/X2fjbQVyM
 Y7BrnZAQkq5FKPGgLM7Vf/ifJkYRklAR8TcXCtSHZbQpwDPD53hDF79LIjbCFWE/zV1g
 gbjVOFMdaCTH52dso4N2gwik2f8t9vDk/1ATypO9X2Zi7T9vXoikObjyXzK+VZNoBwTS
 2vp007bXWxgbdarzPqyWut6bRDTBlJjGdUb9lVmRE0rA0kBXQUtmyiHAf7ENlaUbeVyK
 eFMEJJE+DXUAgxGHbAvch7APLxHsMSkwlPE7YkNutVxXlTgxNTGf5XcBibKWbu5+dmEQ
 5CAw==
X-Gm-Message-State: AFqh2kpoB9eOgLEMF3kqLaHW5ycOT92fJPiA4J48524JzuOGBW+ZEhDo
 NzkXV6+DQWzS32Tur8maHCxVTQ==
X-Google-Smtp-Source: AMrXdXulJlx1D4FNHX0tjsQD1ld3/a0S9p+0LA14eYtmwtdBFvkDKxJri6DG0AdMWT0zgvj8FLZ/lQ==
X-Received: by 2002:a05:600c:22d2:b0:3d1:f0f1:ceb4 with SMTP id
 18-20020a05600c22d200b003d1f0f1ceb4mr94987wmg.19.1673886429327; 
 Mon, 16 Jan 2023 08:27:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm31379414wms.1.2023.01.16.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 08:27:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D26C1FFB7;
 Mon, 16 Jan 2023 16:27:07 +0000 (GMT)
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
 <871qo7pszr.fsf@linaro.org>
 <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
 <f2182772-661a-c021-061e-642ef3aea942@linux.microsoft.com>
 <CAFEAcA_TWOxz52q0EY0Bfvpwmg9bkVD1pSndiyQhfOtXOrtDMA@mail.gmail.com>
 <1e5c8643-e756-9110-70f1-a83e301cca03@linux.microsoft.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: eiakovlev@linux.microsoft.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 bmeng.cn@gmail.com, philmd@linaro.org
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Mon, 16 Jan 2023 16:25:41 +0000
In-reply-to: <1e5c8643-e756-9110-70f1-a83e301cca03@linux.microsoft.com>
Message-ID: <87fscae97o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


eiakovlev@linux.microsoft.com writes:

> On 1/6/23 7:58 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Fri, 6 Jan 2023 at 18:22, Evgeny Iakovlev
>> <eiakovlev@linux.microsoft.com> wrote:
>> >
>> >
>> > On 1/6/2023 17:28, Peter Maydell wrote:
>> >> On Fri, 6 Jan 2023 at 15:44, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>> Peter Maydell <peter.maydell@linaro.org> writes:
>> >> I think the theory when the semihosting API was originally designed
>> >> decades ago was basically "when the guest does fopen(...) this
>> >> should act like it does on the host". So as a bit of portable
>> >> guest code you would say whether you wanted a binary or a text
>> >> file, and the effect would be that if you were running on Windows
>> >> and you output a text file then you'd get \r\n like the user
>> >> probably expected, and if on Linux you get \n.
>>  > If SYS_OPEN is supposed to call fopen (i didn't actually know
>> that..)
>> > then it does make more sense for binary/text mode to be propagated from
>> > guest.
>> It's not required to literally call fopen(). It just has to
>> give the specified semantics for when the guest passes it a
>> mode integer, which is defined in terms of the ISO C
>> fopen() string semantics for "r", "rb", "r+", "r+b", etc.
>>  > Qemu's implementation calls open(2) though, which is not correct
>> > at all then. Well, as long as qemu does that, there is no
>> > posix-compliant way to tell open(2) if it should use binary or text
>> > mode, there is no notion of that as far as posix (and most
>> > implementations) is concerned.
>> QEMU doesn't have to be pure POSIX compliant: we know what our
>> supported host platforms are and we can freely use extensions
>> they provide. If we want to achieve the semantics that semihosting
>> asks for then we can do that with open(), by passing O_BINARY when
>> the mode integer from the guest corresponds to a string with "b" in it.
>> I'm about 50:50 on whether we should do that vs documenting and
>> commenting that we deliberately produce the same behaviour on all
>> platforms by ignoring the 'b' flag, though.
>> thanks
>> -- PMM
>>=20
>
> Thanks Peter, i think i see your point. However, if you ask me, i feel
> like advertising a feature to guest code and only implementing it on 1
> platform that supports it just because it has a non-standard POSIX
> implementation will only confuse the issue further.
> Guest code doesn't want to care whether or not an emulator is running
> on Linux or Windows, there is no notion of that leaking to guest code.
> What it cares about is being able to consistently use a certain
> feature in their code.
> So i think it would be rather useless to implement it on Windows-only
> given there is a clear alternative to switch to fopen. Just my 2
> cents.

It's not switching to fopen() that is the issue - it's the interaction
with gdb (via gdbstub) which has no idea about the distinction. Anyway I
already have the patch queued with an additional note in the
documentation that all file accesses are in binary mode.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

