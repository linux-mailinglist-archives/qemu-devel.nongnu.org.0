Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816F67522F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoRM-0002kw-JB; Fri, 20 Jan 2023 05:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIoRK-0002km-PQ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:16:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIoRI-0008GJ-W9
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:16:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id m15so3608396wms.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHfczaGYoiDaGhpkcyBcMhebOVI7pv0AqVw7DQaP72E=;
 b=s46ewEPro7PtRBcKy1l1Ws8DSaAe6/uHMhAOlAe/rcdDmGYL9PtawnRLCsFr5ud7FU
 7N6R8uHLnPU5s2FcI/Fs9GXPfpB5vwtB9vf0pdTCVUJWaX2fyQs1fCBpI//UaPx6yT6/
 JWNGoVhzxHM+aijgFK192McqqQm+9UmxNtDgwn375RQyEdRDvDSvNtQSUkCvTA/M01CZ
 9wx6/GXb+lviL8y8w2ypG5ctpIZNPAIut/5uoPCyrLYEvT8eyYKnyJ8b/I/4qViJ41xu
 LZxkfXSNShkde3rj7P1HQvdxfUVD1daiu85iDf1HqenA3kanpPAKoZ6fxtC1EPWeF2FY
 ELcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YHfczaGYoiDaGhpkcyBcMhebOVI7pv0AqVw7DQaP72E=;
 b=yRnpEG2EN6bRmsl/jN7WcNdatSlm3myiQ6qb5J4gblimAI/lxUwHD7u810FkW5TrFc
 vkYDkkfQHchWLrkF1OBWAIVe11arLE+rYT4rmhlQwU9I1ejRPyNgkvAW90x8PIZAoxWy
 5gjdwcOxHmaPFnZF2CG0ql7LicrOqy1X4HKOAzKk6ttfr8x5rdJEdY3zYzne5kYPkl2t
 uD5Ro/qgBTnIORKPTCjbCGAOAjniUFiu46GzwhkZT/oBCRANjfGm1DpvZPCCr2epquYn
 VNnlzearpvqT6/Mf4IembPDxdd/OvZnsQg6oPkm7tzbpw6y7qHFoz1BPo2BF7ibntrf8
 zkMA==
X-Gm-Message-State: AFqh2kq9GIFu7vyZVBAM6s21gl1MJlQpAWU0raEZEbi1pWXziB1LzSmR
 8n8bvU2av5T3rm23SbOCw2Co3Q==
X-Google-Smtp-Source: AMrXdXsZx7/c1s1+u2AGt1Am5PDoJM8l3g71QsJGVkD0e1Fk8WAFAAPFhShoMaRhj4UJzQpyIfa/zQ==
X-Received: by 2002:a05:600c:4f83:b0:3db:eab:a600 with SMTP id
 n3-20020a05600c4f8300b003db0eaba600mr10508891wmq.7.1674209763257; 
 Fri, 20 Jan 2023 02:16:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003db0647645fsm1889334wmq.48.2023.01.20.02.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 02:16:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C5691FFB7;
 Fri, 20 Jan 2023 10:16:02 +0000 (GMT)
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-18-alex.bennee@linaro.org>
 <bf981e90-6f0a-b4bb-422a-e455fbf2ea84@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, John Snow <jsnow@redhat.com>, Ed Maste
 <emaste@freebsd.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, =?utf-8?Q?Marc-And?=
 =?utf-8?Q?r=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 17/18] gitlab: wrap up test results for custom runners
Date: Fri, 20 Jan 2023 10:14:52 +0000
In-reply-to: <bf981e90-6f0a-b4bb-422a-e455fbf2ea84@redhat.com>
Message-ID: <877cxhy0il.fsf@linaro.org>
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


Thomas Huth <thuth@redhat.com> writes:

> On 19/01/2023 19.04, Alex Benn=C3=A9e wrote:
>> Instead of spewing the whole log to stdout lets just define them as
>> build artefacts so we can examine them later. Where we are running
>> check-tcg run it first as those tests are yet to be integrated into
>> meson.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/custom-runners.yml                     | 11 +++++++++++
>>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml  | 13 ++++++-------
>>   .../custom-runners/ubuntu-22.04-aarch32.yml         |  2 +-
>>   .../custom-runners/ubuntu-22.04-aarch64.yml         | 13 ++++++-------
>>   4 files changed, 24 insertions(+), 15 deletions(-)
>> diff --git a/.gitlab-ci.d/custom-runners.yml
>> b/.gitlab-ci.d/custom-runners.yml
>> index 97f99e29c2..9fdc476c48 100644
>> --- a/.gitlab-ci.d/custom-runners.yml
>> +++ b/.gitlab-ci.d/custom-runners.yml
>> @@ -13,6 +13,17 @@
>>   variables:
>>     GIT_STRATEGY: clone
>>   +# All custom runners can extend this template to upload the
>> testlog
>> +# data as an artifact and also feed the junit report
>> +.custom_artifacts_template:
>> +  artifacts:
>> +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
>> +    expire_in: 7 days
>> +    paths:
>> +      - build/meson-logs/testlog.txt
>> +    reports:
>> +      junit: build/meson-logs/testlog.junit.xml
>> +
>>   include:
>>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
>>     - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml'
>> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitla=
b-ci.d/custom-runners/ubuntu-20.04-s390x.yml
>> index fcaef9e5ef..f512eaeaa3 100644
>> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
>> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
>> @@ -3,6 +3,7 @@
>>   # "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
>>     ubuntu-20.04-s390x-all-linux-static:
>> + extends: .custom_artifacts_template
>>    needs: []
>>    stage: build
>>    tags:
>> @@ -19,12 +20,11 @@ ubuntu-20.04-s390x-all-linux-static:
>>    - ../configure --enable-debug --static --disable-system --disable-glu=
sterfs --disable-libssh
>>      || { cat config.log meson-logs/meson-log.txt; exit 1; }
>>    - make --output-sync -j`nproc`
>> + - make --output-sync check-tcg
>>    - make --output-sync -j`nproc` check
>> -   || { cat meson-logs/testlog.txt; exit 1; } ;
>> - - make --output-sync -j`nproc` check-tcg
>> -   || { cat meson-logs/testlog.txt; exit 1; } ;
>
> No more -j`nproc` for check-tcg? Maybe mention the reason in the
> commit message?

check-tcg is run sequentially to prevent confusion in the output as
unlike the rest of the tests the results are not aggregated in the
testlog.

I'll update the commit message when I roll.

>
> Anyway,
> Reviewed-by: Thomas Huth <thuth@redhat.com>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

