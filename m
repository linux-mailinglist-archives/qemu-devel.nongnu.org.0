Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BC6A81DF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:04:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhfX-0007aC-EN; Thu, 02 Mar 2023 07:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXhfB-0007RA-QY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:03:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXhf8-0005Tw-KM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:03:56 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h11so4540001wrm.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEuybA+pxyd7HpHKqICTKOHQzgM/zB1pDH4GsqrNiow=;
 b=dmOMoVygZQi2dfr4lRZezvxgfoSQ4I4uu86E44CQwL1IhzeqeWCN5HhxsxRo1vKKP5
 A37sWdtc3lBjxHM3nz17c46yOLy2JRRqKaRz1NFWFqPqtjjNOqgM49+Cms7eMR7EpjKD
 hOwAFGfQSKHfoj3o094nClIelZP9uMjghqZayKJYUlE1Md6Ze/ZGGSFxRiUkMIonCrip
 YXSkzlW5b24/4jdRlsRzmUefpMcmCQNVg0L4zHezgfJwHQc1zSIrM9CrWBXqvt51AgQ6
 SsOMjmG659Z51Fb7NSv/y71n4FGtI618mtfNYpnHcRFXSYYayGLLrOz1tWifiR4RxVXl
 bfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fEuybA+pxyd7HpHKqICTKOHQzgM/zB1pDH4GsqrNiow=;
 b=FLDbZAA0pqXGIz2a3iSLe3GSMxiLM/oTWQldEAPnQHMbbWlLlqnFvwz3MIKf427uQj
 RzGQYAUUGHPSbNCtSeU10fIM7UZX3A4Di2B3/V6q9IW2pz2ivZD6HaVhywrz//8D3zGy
 nVn+eZTvcGo6Z77tnV51c0FQLXTn2sV4Se39Ei4/L3Z25ydXiPmsIbYzjk1/v9dD2o+f
 PhQDPJx68Mhc9/mtoR8a2sPUIO22WejEIvYox5h4/cqbOGcPcdIRFcIK87rSQw+96BG7
 ZXao5JC+0THd89l5prc0RJB0PykoLu4F/Mm73HjbHkGZ7VzreuS6IknSa8Iq6YMEQ6q/
 1Vpg==
X-Gm-Message-State: AO0yUKWW8+HBk+sJk52zQBl9Q9jCknQkNI/4P4ddtyp/5uRbBo65f9hM
 2E3xn1/6/b+0xUycov19LtZS7A==
X-Google-Smtp-Source: AK7set9AsRe+Bi5H8pEVvH5j3HkwVfJtShbj9bZGPuQ6PwpvqjLuzpJL7hLK2tGmtUwwBrN26HBESw==
X-Received: by 2002:adf:f70f:0:b0:2c7:a0e:347b with SMTP id
 r15-20020adff70f000000b002c70a0e347bmr6932805wrp.8.1677758632738; 
 Thu, 02 Mar 2023 04:03:52 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003e11f280b8bsm2825104wmq.44.2023.03.02.04.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:03:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1A661FFB7;
 Thu,  2 Mar 2023 12:03:51 +0000 (GMT)
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
 <87h6v3bdbb.fsf@linaro.org>
 <CAFEAcA9AWVJnNvxqyWPZuFzFQfSZYJ=tQdkgocT3fTMyhmxf4w@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker,
 avocado, windows)
Date: Thu, 02 Mar 2023 12:03:01 +0000
In-reply-to: <CAFEAcA9AWVJnNvxqyWPZuFzFQfSZYJ=tQdkgocT3fTMyhmxf4w@mail.gmail.com>
Message-ID: <878rgfbbrs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> On Thu, 2 Mar 2023 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >>
>> >> From the other thread:
>> >>
>> >> I think the underlying config needs updating:
>> >>
>> >>   .git/modules/tests/fp/berkeley-testfloat-3/config
>> >>
>> >> I'm surprised the git config for submodules doesn't carry the metadat=
a.
>> >
>> > Yeah, in my local repo that I merge stuff with that file
>> > does still have a github URL:
>> > url =3D git://github.com/cota/berkeley-testfloat-3
>> >
>> > So I guess my questions are:
>> >  (1) why hasn't this been a problem up til now ?
>> >  (2) does this mean that if I merge this then everybody will
>> >      need to manually go in and update this file somehow
>> >      to be able to pull the updated qemu master ?
>>
>>   git submodule set-url tests/fp/berkeley-testfloat-3
>> https://gitlab.com/qemu-project/berkeley-testfloat-3.git
>>
>> seems to be the magic to reset origin without manually hacking things.
>
> The documentation suggests
>  'git submodule sync'
> ought to work too ?

Ahh yes it does. Have confirmed doing:

 git submodule sync
 git submodule foreach --recursive git config --get remote.origin.url

and now everything is correct. Does this mean we need to tweak the
build/configure somehow?

>
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

