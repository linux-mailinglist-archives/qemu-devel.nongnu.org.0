Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E571E30F0D7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:34:18 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bxp-0007GX-WC
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7beP-0004Eg-0k
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:14:13 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7beI-0006ti-7t
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:14:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l12so2614341wmq.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fbsGGbgVMr0Op91xHIj9Sq9SvBrEznmnYB/CyQNamRk=;
 b=hONEhR/UDd+uk3sX2NV2H+JEfbSwMHYKPRZGESgkPtKc0N0rraBBKdjwa/Wgy4RfMb
 jykFFOd5e+4p6LF8/IA6EEfERWPn3Jo0tKKCSP7kdzr9i615zRNJEHOZEnyMOBqEXMOo
 xPAK4Y5HoisNfHdC5fm3wc1T2Znl+GKehXIEqeYLYwtnXpqo3hwGtcTJiDxWjhdCQxQB
 O7xusLcw9p5Y63wMXDLJTcJASgoBAl/SXzsTlTJwjCOyOtlb74RlisBIwKCICyiv18xF
 sBa/Y/DPsNWWkWYfQlrqXKKnSxbrRZdvCnof7o1huSH9OTqTspukI5w5eAD6/6lWugj5
 MT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fbsGGbgVMr0Op91xHIj9Sq9SvBrEznmnYB/CyQNamRk=;
 b=I9Z4IpN8l2citkTRDdMZKWRAv+kucNj7vxJRjFXlqWcl30uABGX3TDrw/pKp/cTkw7
 OilsyN3Yg1IOGHZvpWh6cdGw0c6ZnKMR4NPUOPZn/enzF6+SqZw5kcWEGoliFbY1Zwz4
 d15oEkFlsDLl1zcj20lTeGGnOf/1sj4wv3KddfcD/0XvV8SR+kEsOF84dgBzIOCttoi1
 kNE7J6xKgyk8Rkw821u+xhuAZvDCfxwzHzKlzUkWwkjEzzyVnqRVMzS+9NVABHDYS7TG
 MoYUE1iDCwlY8sfxZuKz43B+DFvbfNRGBuD89bnI2Lw836iA6DROF2PerYsd+bGWRtsC
 40Zw==
X-Gm-Message-State: AOAM530sU73eNikbd7WFv1T7vH/aysVwaEE78G+uicZZwt9y2ZlScTK9
 6TvlUyCm2g0+hvPm7dLegWPnhOtzj/RW0bwN
X-Google-Smtp-Source: ABdhPJxRXsAHFNllHEIWzAavzpODb4LOGCxQvXjzif9V7rikfMCvc6HaUMBzHVgp93nQDnvTcqIHaQ==
X-Received: by 2002:a1c:5686:: with SMTP id k128mr6785021wmb.189.1612433641719; 
 Thu, 04 Feb 2021 02:14:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w14sm7666777wro.86.2021.02.04.02.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:14:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4E931FF7E;
 Thu,  4 Feb 2021 10:13:59 +0000 (GMT)
References: <20210203113243.280883-1-thuth@redhat.com>
 <20210203113243.280883-2-thuth@redhat.com>
 <d8621cd3-7b95-10a2-8696-b4daada8b10f@redhat.com>
 <94efc386-3c6c-81e3-46d9-650351f92248@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] travis.yml: Move gprof/gcov test across to gitlab
Date: Thu, 04 Feb 2021 10:12:20 +0000
In-reply-to: <94efc386-3c6c-81e3-46d9-650351f92248@redhat.com>
Message-ID: <87pn1gqgwo.fsf@linaro.org>
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 03/02/2021 20.32, Wainer dos Santos Moschetta wrote:
>> Hi,
>>=20
>> On 2/3/21 8:32 AM, Thomas Huth wrote:
>>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>
>>> Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.
>>>
>>> The coverage-summary.sh script is not Travis-CI specific, make it
>>> generic.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
>>> [thuth: Add gcovr and bsdmainutils which are required for the
>>>          overage-summary.sh script to the ubuntu docker file]
>> s/overage/coverage/
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   .gitlab-ci.yml                             | 12 ++++++++++++
>>>   .travis.yml                                | 14 --------------
>>>   MAINTAINERS                                |  2 +-
>>>   scripts/{travis =3D> ci}/coverage-summary.sh |  2 +-
>>>   tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
>>>   5 files changed, 16 insertions(+), 16 deletions(-)
>>>   rename scripts/{travis =3D> ci}/coverage-summary.sh (92%)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 7c0db64710..8b97b512bb 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -468,6 +468,18 @@ check-deprecated:
>>>       MAKE_CHECK_ARGS: check-tcg
>>>     allow_failure: true
>>> +# gprof/gcov are GCC features
>>> +build-gprof-gcov:
>>> +  <<: *native_build_job_definition
>>> +  variables:
>>> +    IMAGE: ubuntu2004
>>> +    CONFIGURE_ARGS: --enable-gprof --enable-gcov
>>> +    MAKE_CHECK_ARGS: build-tcg
>>=20
>> With build-tcg it generates an empty report, e.g.,=20
>> https://gitlab.com/wainersm/qemu/-/jobs/1005923421
>>=20
>> Shouldn't it run `make check`?
>
> D'oh, you're right. I think we need to run at least a "make check-unit"=20
> here. I'll rework my patch accordingly...
>
> By the way, it's broken on Travis since a long time, e.g. with version 5.=
0=20
> there is already only a stack trace:
>
> https://travis-ci.org/github/qemu/qemu/jobs/680661167#L8411
>
> Seems like nobody noticed this for almost a year now...

doh - the check_coverage was an after_success step so never influenced
the result. It was only a band aid really though - it would be better if
we published the html coverage report on gitlab's pages (like we now do
for annotated gtags source: https://qemu-project.gitlab.io/qemu/src/

>
>   Thomas


--=20
Alex Benn=C3=A9e

