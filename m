Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0386A6A5D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:03:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJHG-0006rB-E2; Wed, 01 Mar 2023 05:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJGy-0006RN-7W
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:01:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJGr-0004ev-Us
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:01:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so7468785wmi.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJgxl4UHKMwDylKHuiLb1/wQbQkzwt3J/WJmY+YOZLM=;
 b=f5cAbG2jV/d8yUR3ChO87w1sh1OO1zxP0rTR9lwiBgfIRW11f0ww5di1Azwp2Tgt6E
 N+MoMOVVwVpb8ufW6o/ZzxV4EaoL1vN10Fi9F8AZlVcjRoLmDkOPVclBI3JdZZF3qwBS
 WKFAXvyBK9j8rM3uzs7DaXJTAUxiT79Aq4ipbHOcYtBhVpNlopePrumrGp2YrAIUZxWd
 kynko0ST58x1HtbJTikPLMWzGq5Cj3VOWMK28lXeVy/Vo6nl2JY6hmMjcxIlyUETROlG
 7NfGsF5GCXPOnfaf24cdqEnJSVdwI5MceQ3qjifFXaH0V8ZP/A51vVaJaywz1hKNeHPS
 pObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hJgxl4UHKMwDylKHuiLb1/wQbQkzwt3J/WJmY+YOZLM=;
 b=2WRCxnY4LJxqGKvKNhbVW0yhvH7ZGIX8cxNU6EAGV+YazMi43+eftljFVJtYebV7Xq
 02HSotmyMPXVJ4St+A/UNGO6lUuQoUoFyU5yp6EuS3cI73K2g0sgIvowqGEWFvFuUfGS
 gGn4FDPJL7knotRlvw1lcu4T2PlsHqJ8dKnwsR6wGjz1oh90WrNKa+i+cYiBIrTSgHZ3
 gPNcHtfU1r36SgC/zvkAMzul/N4NldUkJWa7A5WjoGyAB5i/0wzZzNTULTAWwpeV8vz8
 6AT3cJBvi6VnrUJo3ZK61aUd+Ox8r0xywER4Ok6/hEOCBMz+zlrp4oGgwnNs9HhbfE/q
 hFDA==
X-Gm-Message-State: AO0yUKWnKSpURYgx2lGvRiX32dXpqsxPoBu2ZTf8yhwo+8y8IGM6yjHP
 0uh29zgdD5vKkqlSkdcEoXzowg==
X-Google-Smtp-Source: AK7set8JC9mXDiK1Ikx/O7JSK11EeT8457UJRoMWcbVGcVRW9Us24PepO8BSmFEB+cwFSH/3A5ZIMw==
X-Received: by 2002:a05:600c:4d26:b0:3eb:2de8:b743 with SMTP id
 u38-20020a05600c4d2600b003eb2de8b743mr4993190wmp.12.1677664872037; 
 Wed, 01 Mar 2023 02:01:12 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a05600c348200b003e8f0334db8sm19191177wmq.5.2023.03.01.02.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:01:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DBC31FFB7;
 Wed,  1 Mar 2023 10:01:11 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
 <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
 <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
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
Date: Wed, 01 Mar 2023 10:00:12 +0000
In-reply-to: <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
Message-ID: <87wn40dc48.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

> On 1/3/23 07:51, Thomas Huth wrote:
>> On 28/02/2023 22.41, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>>>> To avoid lots of copy and paste lets deal with artefacts in a
>>>> template. This way we can filter out most of the pre-binary object and
>>>> library files we no longer need as we have the final binaries.
>>>>
>>>> build-system-alpine also saved .git-submodule-status so for simplicity
>>>> we bring that into the template as well.
>>>>
>>>> As an example the build-system-ubuntu artefacts before this patch
>>>> where around 1.3 GB, after dropping the object files it comes to 970
>>>> MB.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>> =C2=A0 .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>> =C2=A0 .gitlab-ci.d/buildtest.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 81 +++++++++++------------------
>>>> =C2=A0 2 files changed, 46 insertions(+), 51 deletions(-)
>>>
>>> This is still kludging the fact that 'make check-qtest' rebuild
>>> the world even if QEMU binaries are present.
>> Did you try? ... if so, that would kill even more CI minutes, i.e.
>> it would IMHO be a show-stopper for this patch.
>
> I remember we had to pass all build/ otherwise calling 'make
> check-qtest check-tcg' would rebuild the same binaries, it it
> was pointless to split the jobs in 2 stages. I might have missed
> when that was fixed.
>
> I haven't tried, however I see in Alex job:
>
> $ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=3D/ s/.*=3D//
> p' build/config-host.mak)
> sed: can't read build/config-host.mak: No such file or directory
> $ cd build
> /bin/bash: line 144: cd: build: No such file or directory
> ERROR: Job failed: exit code 1
>
> https://gitlab.com/stsquad/qemu/-/jobs/3847747769

That was an older run of the job where I thought the skip path would
merge from the template. In the end I've just include git-submodules in
all the build aretfacts instead of just for alpine.

It ran fine:

  https://gitlab.com/stsquad/qemu/-/jobs/3849512854

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

