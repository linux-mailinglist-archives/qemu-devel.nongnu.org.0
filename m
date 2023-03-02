Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2738C6A8103
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXh5A-00016D-G4; Thu, 02 Mar 2023 06:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXh53-00015w-1G
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:26:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXh51-0006W6-Eo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:26:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso1225566wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rANQBvPrQySrrZedqAWrXCRRr4eHVMPikbL4x1XET0U=;
 b=PD6+bf0ea9cT5T8M6aZj/qlEIMyELKEusSLbka7Ub+MJ5C2/vJs1wp72JfLdADBsYS
 Ji7PlZMKDF8fO0LPbpgi3uRgUbYB0aJCLT6Cb+qUJG7VxKalE3j71QjSCBAJgVBnOrD4
 Rzg2xRIVUlujmOUccmB5s5tEevACVbe4ioGn+qvTW+0ChH1EokR8nxA4Ttg2x6ewTMoz
 GBtfFaz2sUg5o5jNbpyO/MkVgQ98szZZoyR2++0U2xMXJjBjHpMr/LtV6VqlnNfz4nal
 BvPWBzZokf+dJfDJuaMT2QJyZPpU2ybtuEeBLLI5NGKPpXpH/QIM3gYb5B15VwKOWZdV
 c3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rANQBvPrQySrrZedqAWrXCRRr4eHVMPikbL4x1XET0U=;
 b=zjNymcCnZnbJrT2UgZC/eX+DT85EdHrqN4Cp70rk8eLHZsZxOYOGiOx7TVIyGfL0g9
 x2JcD0dUR+QIAdskZT9QdktLiSWbpZDZWmqY+MSSGD4VxNdk6AfObvL40RlVb+MwT9zp
 w7GcLs2zlEiAFZ51PXfVukZDSA2G1pDPEpvZ8eCX9K3cMBWd8R7GlEdUegcBGsIbV07z
 qTsYJgrDiKQhWGPF97Zn469CsG5vjyYXBNhSWnYBUzE/PN/P8NiU3YQwmWvP8oHNJz2g
 2jEE0WxxO+FngGUDGrPNAndfEu0uTdeswZtgV9gHc3rF+ncSyWZJIZMY7hzoTqTK2SJ+
 gC5Q==
X-Gm-Message-State: AO0yUKUZehCI3IAjJzdK0oavicVCYVwaUGMeUrghGk/RTOufpFJCOJLo
 BWlZ3/0rNbK1vMznE4FSOnO5jA==
X-Google-Smtp-Source: AK7set9JYao9pJEZMbu1t4e+PjdoOCvFO5CUGw+1Ag3jYkEVSlT6khQWBK+oxTxwHSh1cF08kQa6rA==
X-Received: by 2002:a05:600c:4929:b0:3ea:ea8a:a94a with SMTP id
 f41-20020a05600c492900b003eaea8aa94amr7919560wmp.27.1677756392664; 
 Thu, 02 Mar 2023 03:26:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003dc434b39c7sm7401555wmp.0.2023.03.02.03.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 03:26:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E15331FFB7;
 Thu,  2 Mar 2023 11:26:31 +0000 (GMT)
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker,
 avocado, windows)
Date: Thu, 02 Mar 2023 11:24:36 +0000
In-reply-to: <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
Message-ID: <87lekfbdi0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> From the other thread:
>>
>> I think the underlying config needs updating:
>>
>>   .git/modules/tests/fp/berkeley-testfloat-3/config
>>
>> I'm surprised the git config for submodules doesn't carry the metadata.
>
> Yeah, in my local repo that I merge stuff with that file
> does still have a github URL:
> url =3D git://github.com/cota/berkeley-testfloat-3
>
> So I guess my questions are:
>  (1) why hasn't this been a problem up til now ?

Well this is the first time we've had to tweak testfloat since Emilio
introduced it when we first added the fp tests.

>  (2) does this mean that if I merge this then everybody will
>      need to manually go in and update this file somehow
>      to be able to pull the updated qemu master ?

It will depend on how old their checkout is. I don't know why git does
just honour the metadata in .git-submodules - maybe there is a command
line stanza to reset the origin repo of submodules?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

