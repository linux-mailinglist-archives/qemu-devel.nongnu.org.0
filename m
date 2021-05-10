Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D03791A0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 16:55:36 +0200 (CEST)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7Jn-0007DY-Al
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 10:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7IF-0006NF-A2
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:53:59 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7ID-0001b4-Fi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:53:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id w3so24984622ejc.4
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F34SCvJZUHHFBh/puHAqfxoydrVnsiZs7V5CBZki8V8=;
 b=P7rUb7sXIpzpjvyjvgBUPnp8DPvrRXGmSsUz1lVyEARQ9B76v6FM8Ey465uvUP5vIE
 X3rM/zaG8fC5yw3XKEAc5STzUWLl6KoddlT1Y6FGnZ8FPDqS6Jheu3OKBPWb1zfxAcL0
 LFG2ZE0ibeD/mAt+s4zQtqL2quTGMesCTc8V6fr69RZsnDIgtXiJB8qlmX6/Dltd5gPg
 Llxj0LV0rwWYnMLwChAvJSxwXaVieJg6dYreTVEiu4f7nT/pjg0ckD2ZmtPl8JgcCL77
 t/poa1X8aQP+0dEtWwHBL8qEFjNfTiVA08IiSaoB0+URF+/eghvsq/8PFAPIzuEoJ4js
 gOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F34SCvJZUHHFBh/puHAqfxoydrVnsiZs7V5CBZki8V8=;
 b=HgOX16yDl9zY4vWgrvQwRMFfUVKlX2sC44RVBA+adTlRUJWPJDPW6M6gTvSg1EaLgg
 oVrWrmeJwTwe9AqseAUYtH/Q2530I1beLsj16qiY1xOIV9Vc3ZINuv9kXB1CnqzXzTIX
 U/gnPIy6Wa4lEFEqyvJ3cp1txEFShqoPruQQRvNU2m2P138wOaRd/7o8EzsnTKc97Lb6
 L7fGCIfwUXmQEtwPxP0SZCa+94HAup7X8Cy5b3CbEqHpp+Shvj0sIvcyaaJ/Kwky+9pP
 HCibN2g7d+WNg1KaZUiMBX7mkeKj57rNF2b3OFtOxxRTjqzXwom0D06I/5yyVW6OI6bf
 rT+Q==
X-Gm-Message-State: AOAM533KpTe9W1fjutYGE7XQYMxsxdEm8tCgXdq5qBf5pmS8fVdg6VFY
 i437+B9Yh10O8jpqZWk51Ig=
X-Google-Smtp-Source: ABdhPJx3U7zYA73aWlgpyDmpY2Rp+jZMEUnfkGV7o0cPWpG6DmkMCVkuR+jaNb7JMt9GfmkTSYaVcA==
X-Received: by 2002:a17:906:dc4c:: with SMTP id
 yz12mr26557400ejb.284.1620658435417; 
 Mon, 10 May 2021 07:53:55 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g11sm9250451eje.7.2021.05.10.07.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 07:53:54 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Restrict jobs using Docker to runners having
 'docker' tag
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210319004300.3800583-1-f4bug@amsat.org>
 <9cdb9c79-2466-93fa-a01a-f38532f2bd6f@redhat.com>
 <a4147360-9cb4-1e8a-570d-e41dbe6ddf5c@amsat.org>
Message-ID: <6ece59c7-6e1c-245d-6b65-93dd374b6810@amsat.org>
Date: Mon, 10 May 2021 16:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a4147360-9cb4-1e8a-570d-e41dbe6ddf5c@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 12:10 PM, Philippe Mathieu-Daudé wrote:
> On 3/19/21 6:40 AM, Thomas Huth wrote:
>> On 19/03/2021 01.43, Philippe Mathieu-Daudé wrote:
>>> When a job is based on a Docker image [1], or is using a Docker
>>> service, it requires a runner with Docker installed.
>>>
>>> Gitlab shared runners provide the 'docker' tag when they have it
>>> installed.
>>>
>>> Are Gitlab shared runners are limited resources, we'd like to
>>
>> s/Are/As/
>>
>>> add more runners to QEMU repositories hosted on Gitlab. If a
>>> runner doesn't provide Docker, our jobs requiring it will fail.
>>>
>>> Use the standard 'docker' tag to mark the jobs requiring Docker
>>> on the runner.
>>>
>>> [1] https://docs.gitlab.com/ee/ci/yaml/#image
>>> [2] https://docs.gitlab.com/ee/ci/yaml/#services
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> [...]
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index f65cb11c4d3..d4511cf7dea 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -14,6 +14,8 @@ include:
>>>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>     .native_build_job_template: &native_build_job_definition
>>> +  tags:
>>> +  - docker
>>>     stage: build
>>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>>     before_script:
>>> @@ -38,6 +40,8 @@ include:
>>>         fi
>>>     .native_test_job_template: &native_test_job_definition
>>> +  tags:
>>> +  - docker
>>>     stage: test
>>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>>     script:
>>
>> If you add it to the templates ... won't this disable most of the jobs
>> on the dedicated runners that don't have docker? Wouldn't it be better
>> to add the tag only to the jobs that run "make check-tcg" ?
> 
> But this is the point, if a runner doesn't have Docker, it can not
> run the job...

Apparently gitlab isn't clever enough to figure the 'image:' tag implies
we are expecting Docker... I suppose they wanted to keep it simple and
filter with runner tags.

Now the public runners are named 'gitlab-org-docker', see:

https://gitlab.com/gitlab-org/gitlab-ui/-/merge_requests/1267/diffs
https://gitlab.com/gitlab-org/gitlab-docs/-/merge_requests/800/diffs
https://gitlab.com/gitlab-org/gitlab-docs/blob/master/.gitlab-ci.yml#L483
https://gitlab.com/gitlab-com/gl-infra/infrastructure/-/issues/9685

Long term it would be simpler if we use gitlab recommended templates,
so we don't have to update ours when they change.

Meanwhile I'll simpy respin using 'gitlab-org-docker'.

Regards,

Phil.

