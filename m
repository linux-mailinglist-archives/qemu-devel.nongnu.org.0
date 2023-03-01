Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAB36A6A81
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJIU-0008NP-LJ; Wed, 01 Mar 2023 05:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJHn-0007bd-QM
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:02:12 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJHl-0004rg-Om
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:02:11 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx12so9440570wrb.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2U16SEHt/m8NShOYDR9l8SRf5zKp5KNMqXVhsNiqXfQ=;
 b=clNVNTeyC1eALD/VjCZv7IRpUR4srz14aze25VOZe5X4vqxJWXHUpIUjbVjhopDdE6
 IzJfKx/dEfV7QUuoaPE0zQsDZsYtOHd+JKfEoYVqPkm7l5CW/UNqVdPQvG0pwplKqPxB
 7PcyrJ04f447WmcnnwmIUsLSM3xHKqXmpkxQy4osRYCfx9Q8rmjfj3q57mmiGMH2nrvr
 Arpv5ri/UivfGZWhagqpcBlh92zU0Bv4rvmfi9dj2fn4VOPNQCpSXGNv4HghJLaaWt7l
 V/CXdbtcxE+AWp//13TQZVkV1J4I+5irHERHDrfpDR20f2OfHsNk/5VG+MYdH/FCweSS
 wPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2U16SEHt/m8NShOYDR9l8SRf5zKp5KNMqXVhsNiqXfQ=;
 b=bbKAXCcIj5FSyf1gKWeucsFrGLCuPUcdLc7xhmD9d2ypTcH8QZ5RbwTtkDwqugS0Ug
 e/z5T3ADvsgLF9TYc2w4a+o0WQ1Q5cTwI/J0ztVPi0GE61xVKCUundETUggl0+WYcIeg
 dTQRujXynGHabhDfqjBosVOMWuvb5U1iI9sqbWI9FXMPd2V3BIu6wK+l0Pf/GJFsOzSL
 wYXM8Xu4bvC3kr4Uvvo4Z902OA9Sjj2H+nh+IHYbkn6ozhj9aDMfNyYnflOh6pXALJ0I
 SYCCYwictQXeS+CD2d+k1YLQPvyX0RM1xy0GsHE+aBYcIwkIXVIEtllZ2q0y2YhIRrPR
 NFHQ==
X-Gm-Message-State: AO0yUKXLc5WBXcF+1mpYQXDSBUYamnsQN+90/NF5Dy3v/l8SsJlHSUwE
 Ol+YmzJlXp2oWW1qxfhCxtrJgg==
X-Google-Smtp-Source: AK7set+eLJA6p/plmslrf9gHfgZO/Jjt7WpGeUpYqAvFGQpS/XQyi3iX3FmLrsry5lrg7poyjoPYnQ==
X-Received: by 2002:a5d:5186:0:b0:2c9:730c:1439 with SMTP id
 k6-20020a5d5186000000b002c9730c1439mr3927854wrv.30.1677664928013; 
 Wed, 01 Mar 2023 02:02:08 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d458a000000b002c559def236sm12011646wrq.57.2023.03.01.02.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:02:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D3331FFB7;
 Wed,  1 Mar 2023 10:02:07 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <db096848-11a3-b6da-93f1-b53a26a477f9@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Kevin
 Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Aurelien Jarno <aurelien@aurel32.net>, Markus
 Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Yonggang Luo
 <luoyonggang@gmail.com>, qemu-block@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Laurent Vivier <lvivier@redhat.com>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Date: Wed, 01 Mar 2023 10:01:55 +0000
In-reply-to: <db096848-11a3-b6da-93f1-b53a26a477f9@linaro.org>
Message-ID: <87sfeodc2o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> On 28/2/23 20:06, Alex Benn=C3=A9e wrote:
>> To avoid lots of copy and paste lets deal with artefacts in a
>> template. This way we can filter out most of the pre-binary object and
>> library files we no longer need as we have the final binaries.
>> build-system-alpine also saved .git-submodule-status so for
>> simplicity
>> we bring that into the template as well.
>> As an example the build-system-ubuntu artefacts before this patch
>> where around 1.3 GB, after dropping the object files it comes to 970
>> MB.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>   2 files changed, 46 insertions(+), 51 deletions(-)
>> diff --git a/.gitlab-ci.d/buildtest-template.yml
>> b/.gitlab-ci.d/buildtest-template.yml
>> index cb96b55c3f..a6cfe9be97 100644
>> --- a/.gitlab-ci.d/buildtest-template.yml
>> +++ b/.gitlab-ci.d/buildtest-template.yml
>> @@ -25,6 +25,22 @@
>>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>>         fi
>>   +# We jump some hoops in common_test_job_template to avoid
>> +# rebuilding all the object files we skip in the artifacts
>> +.native_build_artifact_template:
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
>> +      - .git-submodule-status
>> +    exclude:
>> +      - build/**/*.p
>> +      - build/**/*.a.p
>> +      - build/**/*.fa.p
>> +      - build/**/*.c.o
>> +      - build/**/*.c.o.d
>> +      - build/**/*.fa
>> +
>>   .common_test_job_template:
>>     extends: .base_job_template
>>     stage: test
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 43f9e4a81d..44b8275299 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -2,7 +2,9 @@ include:
>>     - local: '/.gitlab-ci.d/buildtest-template.yml'
>>     build-system-alpine:
>> -  extends: .native_build_job_template
>> +  extends:
>> +    - .native_build_job_template
>> +    - .native_build_artifact_template
>
> I'm confused... Apparently this doesn't work:
> https://gitlab.com/stsquad/qemu/-/jobs/3847747681/artifacts/browse

Nope you are one run behind ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

