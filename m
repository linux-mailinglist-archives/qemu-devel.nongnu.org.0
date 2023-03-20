Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB976C1D7A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 18:14:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peJ4P-00042z-En; Mon, 20 Mar 2023 13:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJ4N-00041m-O3
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:13:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peJ4M-0008Qz-3D
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 13:13:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 az3-20020a05600c600300b003ed2920d585so9639181wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679332391;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVMSvOZErWDYLvG5MjUjlHsl/zkObDpcP9HeciVuxJc=;
 b=jj40dT3FwwgdsBdYwXDhJ8ZE+bW8CJLmQ2k2zc+iyFVcqGYT98xrjvBRv4mfHT77dB
 nmazEX3fPUUYHjDBdVEYeQA7VEXWeZuodYokw27k2e4u0s4KDNmUwD1/gFmjbGE2gwz1
 x1n35jg+MZWCeCO+weS7wzF5uJWT3BxlR3uKCp43zQMR3gHPqJQpL95JYZyYcJPfm/bp
 WdzfSqfiePHCec7AZh5p9krMzDmlf3cCPOD4fEW8+LhBPbeEd5y7Rmqxk22uOwRCLXBD
 u5PIIxxsVGx88OI9+/rivOq6oOKlaqtOVuuRJ5KJn99LWRGJJyV4Flp2z7zHj8Ht82gV
 BtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332391;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tVMSvOZErWDYLvG5MjUjlHsl/zkObDpcP9HeciVuxJc=;
 b=jbS9wuBUFW8LKewB33dBwRDFiFs8DHukwrF9CZyTjiKMsPxrb7uCphdpuJK+rN7ZU4
 Y9iuePZbf0AfNDSVvP9Y5QRX5BBnON/MbGKAqNm1jj26d1JYXn6T+bYxZcz2UwF+MZdD
 m/4nCezEwUw2QDjK2uWIeW9zSMgLMk4hBVR4LvFgekY5Sgi1yWJu7IOiNIb9ZfwHcxF2
 AyXiFbW145le6BXOCWXcX28AgZS3Ha0o0Vyu+pSMO/rwrLPU4WW1YdQJyYLVLErnPTpI
 MacfQ+lH0HxnQjfPspz/oLnML+KH/58O1ulVPFOR8Yz06Duj1hK7Hyvuzlq4AtLHk63R
 DU2Q==
X-Gm-Message-State: AO0yUKV8MlYxh36DhYxaz2IStKU/S/4hJLerTj1FjjYKDIUprV5immbM
 Gwmb4ycNFPnc1nl77P3TbxelSg==
X-Google-Smtp-Source: AK7set8XgZYC+BQoxklCbSocbHsaYctSZ316oUNUfAFxsAnF4qfVSKQqrYduCQ1RiPdRsO6DTA/v/w==
X-Received: by 2002:a05:600c:2114:b0:3ed:290b:dc68 with SMTP id
 u20-20020a05600c211400b003ed290bdc68mr249225wml.12.1679332391418; 
 Mon, 20 Mar 2023 10:13:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a7bc44f000000b003edef091b17sm3994580wmi.37.2023.03.20.10.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:13:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BFE941FFB7;
 Mon, 20 Mar 2023 17:13:10 +0000 (GMT)
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
 <20230318114644.1340899-6-alex.bennee@linaro.org>
 <43cbcd1f-22f3-47f6-6c86-8f8a642b064c@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PULL 05/31] gitlab: update centos-8-stream job
Date: Mon, 20 Mar 2023 17:11:19 +0000
In-reply-to: <43cbcd1f-22f3-47f6-6c86-8f8a642b064c@linaro.org>
Message-ID: <87r0tj73dl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> On 18/3/23 12:46, Alex Benn=C3=A9e wrote:
>> A couple of clean-ups here:
>>    - inherit from the custom runners job for artefacts
>
> "artifacts"
>
>>    - call check-avocado directly
>>    - add some comments to the top about setup
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20230315174331.2959-6-alex.bennee@linaro.org>
>> diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>> b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>> index 068b0c4335..367424db78 100644
>> --- a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>> +++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>> @@ -1,4 +1,9 @@
>> +# All centos-stream-8 jobs should run successfully in an environment
>> +# setup by the scripts/ci/setup/stream/8/build-environment.yml task
>> +# "Installation of extra packages to build QEMU"
>> +
>>   centos-stream-8-x86_64:
>> + extends: .custom_runner_template
>>    allow_failure: true
>>    needs: []
>>    stage: build
>> @@ -8,15 +13,6 @@ centos-stream-8-x86_64:
>>    rules:
>>    - if: '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRAN=
CH =3D~ /^staging/'
>>    - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
>> - artifacts:
>> -   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
>> -   when: on_failure
>> -   expire_in: 7 days
>> -   paths:
>> -     - build/tests/results/latest/results.xml
>> -     - build/tests/results/latest/test-results
>> -   reports:
>> -     junit: build/tests/results/latest/results.xml
>>    before_script:
>>    - JOBS=3D$(expr $(nproc) + 1)
>>    script:
>> @@ -25,6 +21,4 @@ centos-stream-8-x86_64:
>>    - ../scripts/ci/org.centos/stream/8/x86_64/configure
>>      || { cat config.log meson-logs/meson-log.txt; exit 1; }
>>    - make -j"$JOBS"
>> - - make NINJA=3D":" check
>> -   || { cat meson-logs/testlog.txt; exit 1; } ;
>> - - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
>> + - make NINJA=3D":" check check-avocado
>
> Missing removing scripts/ci/org.centos/stream/8/x86_64/test-avocado
> along with this patch.

Given the failure running check-avocado maybe I should drop this part of
the change. I was aiming for increasing coverage but perhaps we should
stick with the limited cross section of tests?

Anyway I'm re-building my Centos8 Stream box now with more disk space to
see if I can see whats going wrong.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

