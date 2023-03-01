Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDBD6A6B43
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:01:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKCr-0007vq-Tj; Wed, 01 Mar 2023 06:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXKCW-00079n-Mj
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:00:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXKCU-0006ml-HW
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:00:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so7564483wmc.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 03:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXjwfv7Vejy/CgNv556pTGpWnl93W0NFpnwb5Hh7/s4=;
 b=mNVpQQoSpXk2b2J1fI6OgTeR/j0FQMJwU49/A4p1k5hYW/TQc8/7auQEeuCy+ToiHp
 r7L8ddH+WXBYEsciG2pT1u3Mzzn6h+Xyj80oJ7Un9hkxtDu0P2DLFojGYvt7jEqZzdha
 Nl5s5zLy7b/YFy64KEqCeDcs5+Q+yoJfurV5KniEEQd69X4pTJ9uZ4Ua/8MWTRRVfDEz
 09K19/tyz9io0+Z+/UPIc/HOUxNZutNgLfVmmVt9rx+IER7QCd7GPls/9Jr55r24ppBu
 5aGan61vQjbf+iAQqac7Su9lD8Py8rm3eIh28Gnc5S+99HqXz7ytQSkLAbv+x2QmE3Ni
 5sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mXjwfv7Vejy/CgNv556pTGpWnl93W0NFpnwb5Hh7/s4=;
 b=7cF0C2H0ncVO+lCDWECO2F6ozWOHIEnJslMJH89QK1cCvx4ylvMtaatGSOgK8xTHUz
 Wo9t4Jh50o7po+QbNEKgXn7ZlZxpOnmGSN/d1VZpVR/ZpJOSSqJUYOKsriuf5dpMH072
 vkq0t3cE7V+4IgjLYHDcXRt2+n1xjm0lLSpz+fmR+oYWwXccb7kmumnkbmD72nUSa8AK
 kyNcTXNmuprD/XNnmUr/K0+9Z5jzQQ9qIhxGTb5VDPOBOd/rDVpUcuDBMxE6vZhop322
 2GmMfHFTK3b3eDbNT3m/ttuGGbh4MThiGLGkC5BK9MYw9ZAz8U0Beqcij3gQTXB3ohjv
 SzOw==
X-Gm-Message-State: AO0yUKVCXD4bt18dAYnDhZuC/BTE/W+3HiMTA/STd1Q1PTgsaTjUn15x
 hs8sp4EEQPDi1yznLxd9qSi5Ug==
X-Google-Smtp-Source: AK7set8/QDmIB25dVVzk58Oh0HGVtH0fp1T97r7IOcZyOWqPBLsx5GaZc2dm3SA2MpVkHUq6U/vjKQ==
X-Received: by 2002:a05:600c:2e89:b0:3eb:376e:2bb7 with SMTP id
 p9-20020a05600c2e8900b003eb376e2bb7mr4461854wmn.3.1677668444042; 
 Wed, 01 Mar 2023 03:00:44 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c358400b003dc5b59ed7asm16883847wmq.11.2023.03.01.03.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 03:00:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 479051FFB7;
 Wed,  1 Mar 2023 11:00:43 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
 <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
 <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
 <87wn40dc48.fsf@linaro.org>
 <d2513416-4378-f107-9fbc-d55f3640df5a@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Aurelien Jarno
 <aurelien@aurel32.net>, Markus Armbruster <armbru@redhat.com>, Darren
 Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>, Ed Maste
 <emaste@freebsd.org>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Laurent Vivier <lvivier@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Date: Wed, 01 Mar 2023 11:00:17 +0000
In-reply-to: <d2513416-4378-f107-9fbc-d55f3640df5a@linaro.org>
Message-ID: <87fsaod9d0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 1/3/23 11:00, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 1/3/23 07:51, Thomas Huth wrote:
>>>> On 28/02/2023 22.41, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>>>>>> To avoid lots of copy and paste lets deal with artefacts in a
>>>>>> template. This way we can filter out most of the pre-binary object a=
nd
>>>>>> library files we no longer need as we have the final binaries.
>>>>>>
>>>>>> build-system-alpine also saved .git-submodule-status so for simplici=
ty
>>>>>> we bring that into the template as well.
>>>>>>
>>>>>> As an example the build-system-ubuntu artefacts before this patch
>>>>>> where around 1.3 GB, after dropping the object files it comes to 970
>>>>>> MB.
>>>>>>
>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>> ---
>>>>>>  =C2=A0 .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>>>>  =C2=A0 .gitlab-ci.d/buildtest.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 81 +++++++++++------------------
>>>>>>  =C2=A0 2 files changed, 46 insertions(+), 51 deletions(-)
>>>>>
>>>>> This is still kludging the fact that 'make check-qtest' rebuild
>>>>> the world even if QEMU binaries are present.
>>>> Did you try? ... if so, that would kill even more CI minutes, i.e.
>>>> it would IMHO be a show-stopper for this patch.
>>>
>>> I remember we had to pass all build/ otherwise calling 'make
>>> check-qtest check-tcg' would rebuild the same binaries, it it
>>> was pointless to split the jobs in 2 stages. I might have missed
>>> when that was fixed.
>>>
>>> I haven't tried, however I see in Alex job:
>>>
>>> $ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=3D/ s/.*=3D=
//
>>> p' build/config-host.mak)
>>> sed: can't read build/config-host.mak: No such file or directory
>>> $ cd build
>>> /bin/bash: line 144: cd: build: No such file or directory
>>> ERROR: Job failed: exit code 1
>>>
>>> https://gitlab.com/stsquad/qemu/-/jobs/3847747769
>> That was an older run of the job where I thought the skip path would
>> merge from the template. In the end I've just include git-submodules in
>> all the build aretfacts instead of just for alpine.
>> It ran fine:
>>    https://gitlab.com/stsquad/qemu/-/jobs/3849512854
>
> Indeed:
> https://gitlab.com/stsquad/qemu/-/jobs/3849512800/artifacts/browse/build/
>
> So a good improvement, but I'd prefer having a stricter "only include
> what we need" policy rather than "exclude what we don't". The former
> will catch missing additions, while the later won't notice until someone
> spend time excluding pointless files manually again.

I'd argue the opposite because its hard to come up with patterns for all
the binaries we build but easy for all the object files.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

